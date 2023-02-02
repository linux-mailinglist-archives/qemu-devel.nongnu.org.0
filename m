Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F6B687EB5
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 14:32:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNZgU-0002FZ-MC; Thu, 02 Feb 2023 08:31:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNZgP-0002FC-44
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:31:21 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNZgJ-0003ln-A8
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:31:18 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 n20-20020a17090aab9400b00229ca6a4636so5594608pjq.0
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 05:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GJGOlYlsGSeGTDQS+YOC3d1X6xC7K4zpezVyA5IcFIY=;
 b=c/HM1bSUhdwdUszNsZQUq/WoFvEfPuv3oPODb4jTQHvjvLddNWefYls0IVuhDvZtir
 S5UokQsYWQXRSIrkKAG98/Z+NWXAtKNGK+8joJJb0ggjBSMrIZqWKGdEh0ljMSRrNT+I
 bjhTjYMP66/SSCgoHIu5vXSJL2Hi/VfsFq2dlgu/hrZd+dtQIEu+6wYMCguasosifrea
 +wdhSvGltPw2+binueD7q7lhiACn1ShnC7bMFI5gjmkje6PypjKG4s+xDzMGgsfsepcd
 sDE26k3mRrH9THtsslqRfXmx1DBilAcrWt+fHVA52ylI6LJvF0eeTxyHJCQFHIHTvlL0
 Dttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GJGOlYlsGSeGTDQS+YOC3d1X6xC7K4zpezVyA5IcFIY=;
 b=CnC1jkoQ5xrvFEur3s7bD8/h0+M4gEdV9pd5ZC7WNM4iFVkVTfyooC6SuvEa3GFPsM
 rwNuDxXa+AqbueAR4jkX0JFGw+qDl/xnvR8hF1vfsjMjsGlZoDBfR2TvKEiuOYotglG4
 0yTrmHm6qTkN6VyMWDlG6En9SFDBdzGHia7yQDTr9J8bsZJgotbvMT3oMtExr5cmFNOb
 gaiTlrL4kK7LeYPI6F5QSHejDyrXULlukilpbG89+VzqmKusxzl/rSR9c8kx+w4+A/7B
 mXfIUmPF0kokOPZ3buomUkTVpFvAREat54P044OjoAyZOeUML9tRsWFCf1jPw/fE6oQL
 MUjw==
X-Gm-Message-State: AO0yUKWtOjSAHfSDNOqs48juanh0VNoN2FOnW3godEB28thtGPpuRbDV
 FdEw4oYadlBpZ0cymdLBxwibhYjMlK6nhjK0inpqKQ==
X-Google-Smtp-Source: AK7set/Wf2Ofol1e3oA4pjtg5+e4fL71o9Tgu2DYXtn4BHoh+FlOhfFnyNcwfHb3I3SCultzVLpdk09E+V198DaxQb8=
X-Received: by 2002:a17:90a:5a42:b0:22c:19cb:9489 with SMTP id
 m2-20020a17090a5a4200b0022c19cb9489mr496277pji.137.1675344673662; Thu, 02 Feb
 2023 05:31:13 -0800 (PST)
MIME-Version: 1.0
References: <78bc53e3-bad3-a5c3-9e53-7a89054aa37a@wdc.com>
 <ff3f25ee-1c98-242b-905e-0b01d9f0948d@linaro.org>
 <20230202093911.000053cb@Huawei.com>
 <2e85fdea-9ffc-9a20-1c61-45ddd17a7fd6@linaro.org>
 <CAFEAcA9ohWGgaCK60Di4iUdgYqpmHeB_WnDGv4PzyfyfquMUzw@mail.gmail.com>
 <20230202123118.00003bd6@Huawei.com>
In-Reply-To: <20230202123118.00003bd6@Huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Feb 2023 13:31:02 +0000
Message-ID: <CAFEAcA_b0TeXcGyNuELBe3c4QzVRr8OPpDGunprhfkZ3L3bEVg@mail.gmail.com>
Subject: Re: An issue with x86 tcg and MMIO
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?J=C3=B8rgen_Hansen?= <Jorgen.Hansen@wdc.com>, 
 Ajay Joshi <Ajay.Joshi@wdc.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Sid Manning <sidneym@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 2 Feb 2023 at 12:31, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> On Thu, 2 Feb 2023 11:39:28 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
> > You might want to look at whether QEMU's iommu functionality is helpful
> > to you -- I'm assuming CXL doesn't do weird stuff on a less-than-page
> > granularity, and the iommu APIs will let you do "programmatically decide
> > where this address should actually go". The other option involves
> > mapping and unmapping MemoryRegions inside a container MR.
>
> Unfortunately it does weird stuff well below a page granularity.
> Interleaving is down to 256 bytes.

That's unfortunate...

At any rate, conceptually we ought to be able to execute from
an instruction that overlaps between actual-RAM and an MMIO
MemoryRegion; it would be nice if we could fall back to the
execute-and-discard approach for that in the same way as if
the entire insn was in MMIO.

-- PMM

