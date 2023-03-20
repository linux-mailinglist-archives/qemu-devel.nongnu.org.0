Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B836C1719
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 16:11:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peH9n-0000Hi-P3; Mon, 20 Mar 2023 11:10:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1peH9l-0000HX-VY
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 11:10:42 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1peH9k-0008Tv-8X
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 11:10:41 -0400
Received: by mail-pj1-x102f.google.com with SMTP id y2so12432863pjg.3
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 08:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679325038;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JPsbRMpQwAoG5fbe4+NmvCrMBXhRTdIL3SOMLZdNJ40=;
 b=Z+P6bvBBe8GUENrfZbatjcaZkXMrhk+4o3BeWzhh2MWv+8WziRq1rkfbPsTW9SBQLf
 FR5oLwJh6JK0OvCxo+2UFMGuFaVaTIhIGWQXrCcQq7r5ZaoYBrWL0VTS2yLOw9F6QPF7
 GVdAhqXW3KAhH6Rw/1A7IXl6dRgFH7n3kdLSq+27puYZDgVONHmChge8kZ2Zm2Wo0/Gr
 CK2aHnQCsZ3KMVS+4gDVXExalFPN/JQav7ZWmUnsbJ0Tqv6dcKJtFj44/FuTD065ec31
 Z7lmlAprFcI2a8m6qkYEDt1DPpSUxyjQBokbvlWGjnFs6b9ZR7uUq3VjmRn25f53S4oF
 RSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679325038;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JPsbRMpQwAoG5fbe4+NmvCrMBXhRTdIL3SOMLZdNJ40=;
 b=ahv4MDxSgpTLeBZ2+LCoP+/1pR1NbAoYThUjmdX1RnyKG3uATS1y7WiJmUc5kz4kFJ
 Gv9zeXBmiyYjy45cfoZ7+DwZw4flApBgFyEmvtfxwM0xcZRKB0XaRv2yFI2M/O6kpZFN
 foi/Z7N2HYLt7K3tCLW44VTBYPukVQXID/CNls+ZkRcrx37v9rw9N4AeaBcg0ab+qwQJ
 qqT9lyosgw+VylI3zx6O/wXUU4YFWACjG7+s6FkAW9RII1O0XY97gmNp9CmY/lAyAHiC
 3IiR9TQoE5u5koxRr+qt2oxCghMTy6MIzsCxobwCeYqER3473ChcFs9mAkMKlIgYvkML
 zZ+Q==
X-Gm-Message-State: AO0yUKVx6s/FF9pAccZnssMyVOtDDan+wk2+Cs6nUmPOjiX97CHKWl+P
 sTCP0Q6miiT9yfll9H2U4BsrO8Q1NAXVG9CK6eKPXQ==
X-Google-Smtp-Source: AK7set8ReBJgG6AOAIUU8cP9MGVe2mHHFy/V+Gp45hKR/1Du5aXG4m2f3YxxBTILPnYV7hUV9KhUmrd4pzC/VQziAzs=
X-Received: by 2002:a17:90a:5b01:b0:23b:517d:beca with SMTP id
 o1-20020a17090a5b0100b0023b517dbecamr5019317pji.0.1679325038440; Mon, 20 Mar
 2023 08:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230320130330.406378-1-thuth@redhat.com>
 <539ae95e-7e81-586c-b1d3-e8e41145cc42@redhat.com>
In-Reply-To: <539ae95e-7e81-586c-b1d3-e8e41145cc42@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Mar 2023 15:10:27 +0000
Message-ID: <CAFEAcA9_1Yyg=X6mNOyMn0NeGnJs4xj0m6VrkjOb=J-LZmVL1A@mail.gmail.com>
Subject: Re: [PULL 00/24] s390x and misc patches for 8.0-rc1
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102f.google.com
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

On Mon, 20 Mar 2023 at 14:02, Thomas Huth <thuth@redhat.com> wrote:
>
> On 20/03/2023 14.03, Thomas Huth wrote:
> >   Hi Peter!
> >
> > The following changes since commit 74c581b6452394e591f13beba9fea2ec0688e2f5:
> >
> >    Merge tag 'trivial-branch-for-8.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2023-03-17 14:22:01 +0000)
> >
> > are available in the Git repository at:
> >
> >    https://gitlab.com/thuth/qemu.git tags/pull-request-2023-03-20
> >
> > for you to fetch changes up to 48805df9c22a0700fba4b3b548fafaa21726ca68:
> >
> >    replace TABs with spaces (2023-03-20 12:43:50 +0100)
>
>   Hi Peter,
>
> FYI, since you likely did not put this into your CI branch yet, I did a
> small fix on top: I replaced the patch that fixes osdep.h with the one by
> Philippe, since it was slightly better (removing the "extern" keyword
> instead of swapping it).
>
> New commit ID for the tag is now: c29e73f7e65299ed9261abce3950710d89c64724
>
> I hope that's ok, if not, please let me know.

Ah, I've already merged the old tag into staging for the CI
run. I could drop it and re-do, but we'd burn another lot of
CI minutes on it. Is that worth doing?

thanks
-- PMM

