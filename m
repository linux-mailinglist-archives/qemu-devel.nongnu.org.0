Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4975A0FA5
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 13:55:36 +0200 (CEST)
Received: from localhost ([::1]:47286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRBSR-0007Vu-Qp
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 07:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oRBLj-00075d-1i
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 07:48:48 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:45655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oRBLh-0007m6-GW
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 07:48:38 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-33dba2693d0so40618907b3.12
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 04:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=2ZcwKWEP4OovGgEW58HrhtPtbd3cEDPUka0RMzG1CKg=;
 b=Fj4w1wNvcgMMHEFbcbHrbqyDCBTuAf/Y4iYH5aHzpYVqinJ2HZJljapwepWizQa0da
 MkH3iSAHcECAC2rfCNgkK5UygFNBp5oZpER+t6Wvk7mNNR7ke9+fUkdboUU0hn8DJcLZ
 10NrNGTAORcegDahRPfhO60vqyVoHS4Aw9IzWVH2mIuqhjKeiA3AvmlkP3PJfQhAhewy
 S0sFURSt8kQiTSmkT0etvBB4ggsHVXWfFYCvjIpn1X1iHHaLdx0ss7fpQbR+26Preq5X
 tdBexXSgBphG4DNo6HDq3Hl+4Qpo5UmuJirvQo56efK9wSffvYD7Mvzismzs/YvA4Pmz
 U/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=2ZcwKWEP4OovGgEW58HrhtPtbd3cEDPUka0RMzG1CKg=;
 b=jNn99uKg5wjUqsZ4PSqtK5+uVbpcTW18zADampFQeYD601DBrpJLlyT9wD/xdWyCX0
 /6LJra1C7oUZYTgO3Zyx3O1L7DvL+KwxW4TVmzh1Q+ekgfaFlLYDdmwFvdlMhkKvYIMa
 Ck1fNAHnhT+Ha52gyPtYpyDjBm0bErgVTtIkrnYLCAX5pPzm91xALh1oyE0L37gVi28v
 TDSfjMv/NmsoOqPyPjplwNHg5QR6BI2cbw94msU/SBOo4RTMDQOZgyXK8CCvX68Y4Bwm
 iO1J1Qoh7Zbd2u11aybxk/b/zspn3GU39Ur8C0Jsr/TYAZHf1+pa1W3dOSi7hw9bCUH0
 nbRA==
X-Gm-Message-State: ACgBeo2pktv+n9OvwzmfMNLCqEnLvpkJEIHm84h+3h8uSPKILRwhbMU0
 725EB7G8SzPFMpRLd/nFBFPXgwnyoWtjKFqZQR6O2Q==
X-Google-Smtp-Source: AA6agR4YgM1TToMLJS5DROSAKtYOo38C6tj/rsZJZfJeoH7lGKxH1/diDlfTlwWOk7qDHShENbm/9G6+m2WjblJZdZE=
X-Received: by 2002:a5b:7c6:0:b0:670:6ba6:d046 with SMTP id
 t6-20020a5b07c6000000b006706ba6d046mr2886069ybq.140.1661428116506; Thu, 25
 Aug 2022 04:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+F1CL27O8dmGSws=-QgutRRpM2NHcued28gnvt5jWo2WeUvw@mail.gmail.com>
 <e7b3468a-cdfb-4592-8a7a-48da2fa77647@redhat.com>
 <CAFEAcA9OH4ih2pOUbsv6dTMW=3_9LTkzSRj4ogO4oxVS4fOASw@mail.gmail.com>
 <bd40c251-b670-3a9a-f29c-86268d06a5b7@redhat.com>
In-Reply-To: <bd40c251-b670-3a9a-f29c-86268d06a5b7@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Aug 2022 12:47:54 +0100
Message-ID: <CAFEAcA85Ek=Uf-VfQmZKcyrBGU6zR-mrV3tA7mODorjr_52y2A@mail.gmail.com>
Subject: Re: Page alignment & memory regions expectations
To: David Hildenbrand <david@redhat.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qiaonuohan@cn.fujitsu.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Aug 2022 at 08:27, David Hildenbrand <david@redhat.com> wrote:
> On 24.08.22 21:55, Peter Maydell wrote:
> > Lumps of memory can be any size you like and anywhere in
> > memory you like. Sometimes we are modelling real hardware
> > that has done something like that. Sometimes it's just
> > a convenient way to model a device. Generic code in
> > QEMU does need to cope with this...
>
> But we are talking about system RAM here. And judging by the fact that
> this is the first time dump.c blows up like this, this doesn't seem to
> very common, no?

What's your definition of "system RAM", though? The biggest
bit of RAM in the system? Anything over X bytes? Whatever
the machine set up as MachineState::ram ? As currently
written, dump.c is operating on every RAM MemoryRegion
in the system, which includes a lot of things which aren't
"system RAM" (for instance, it includes framebuffers and
ROMs).

-- PMM

