Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1070C58106E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 11:57:08 +0200 (CEST)
Received: from localhost ([::1]:54280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGHJL-0001Mz-7q
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 05:57:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGGu5-0005YI-Jj
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 05:31:01 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:46833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGGu2-0006p8-Nv
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 05:31:01 -0400
Received: by mail-yb1-xb36.google.com with SMTP id j63so3314556ybb.13
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 02:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+RwjP2jEvXBhQyFWtaV0gty7JoxI1yNZs1jTuNjMRI4=;
 b=BqkjdvRGpIXlfh6s7IE5XsTSteGYO1hr/kYx9fA6mP+b8jjKF3jLZI1w7SP83vvjKN
 QvNZ2/aUE6+x3CxmXtNpba1RF+HV8C0UIJBBY4TsBB2uqTkwCjAZhd1HYDIi0t0OERZd
 O6LxY9doH++GVI/8QFchLE0Gg6wrsQfV3cKNAIMBQHVGKfVTtTY3AeINngzfZTOKQ5LF
 QAK10O/sT7ucPtT0FFeizJsKaOPoG+NljBjDDoXVijsdfkwMt1n5vdJHTu7+3AHt3IRK
 NEbSXvlBvlkQ4GCoyQYXZuBDS11iuFHAzqCtH3uEfRtz+qroAv/suLsGzwGGVjPpV59R
 +l0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+RwjP2jEvXBhQyFWtaV0gty7JoxI1yNZs1jTuNjMRI4=;
 b=5gWvH3hcs4HEl9fuTXANnH24Qy0IsonQ8ttoIYVS/IRgAUgyMUFlm+7jCp1B167KYT
 c9W5eDQG6eswLId6Mxb9TMLDE2328NrVvA311VkCA2RufOtBUtUH4f8+SZX8icLn+5F0
 hfNVLtwxcaUZM8SDfAf9b8V9RI30K4oFTnreSbbYAxgK99VE64nEticbOlsdkJpSFC/5
 zWPhPf7vHF67FBQoU68M5BE4nwcyOUbAArnGUIyx4/riFPSFXXlrk53pna7bld+w5rCP
 b3SnGzCVgeWMpwmkzcPeKxzmaW4jR+P1A6t5BaA0/lGxFoD8b6B0nAGOvAnJvC+mXr+/
 u7rw==
X-Gm-Message-State: AJIora/T+9TOhBSLl5dGOW0gzNkPRZBi7HvClDMK+ExC1CRNiurIGkC4
 ylnGUSGTfAoHFcf3VBbo8jfcDH98GAo+XhYIvoecyg==
X-Google-Smtp-Source: AGRyM1vLRclGBqRAM8s8R6bxoyVFzTg7ADx5Bz9ELWpOWv05rnvq/9BoT4xfDynbya/uYmN8v2JzgPlFqLVGbOH0oTc=
X-Received: by 2002:a25:d617:0:b0:671:79bd:69bf with SMTP id
 n23-20020a25d617000000b0067179bd69bfmr434665ybg.85.1658827857298; Tue, 26 Jul
 2022 02:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220722170449.853222-1-pbonzini@redhat.com>
 <CAFEAcA9wRzwRgvwBzM=JJ3N4ZgVGpeZpuxjCWEsjyCJwmmKyYw@mail.gmail.com>
 <CABgObfZ69sC4O8=Oa_reRg7h-3ZDdiR=m953EuHLC3R0Keh18g@mail.gmail.com>
In-Reply-To: <CABgObfZ69sC4O8=Oa_reRg7h-3ZDdiR=m953EuHLC3R0Keh18g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jul 2022 10:30:17 +0100
Message-ID: <CAFEAcA_M3+E9WJ+1HaeekQ7KjcEj3cB9GN-yjPSHwZKQWQfyXg@mail.gmail.com>
Subject: Re: [PULL v2 0/8] More fixes + random seed patches for QEMU 7.1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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

On Tue, 26 Jul 2022 at 09:18, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On Mon, Jul 25, 2022 at 5:05 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Fri, 22 Jul 2022 at 18:08, Paolo Bonzini <pbonzini@redhat.com> wrote:
> > >
> > > The following changes since commit 5288bee45fbd33203b61f8c76e41b15bb5913e6e:
> > >
> > >   Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-07-21 11:13:01 +0100)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://gitlab.com/bonzini/qemu.git tags/for-upstream2
> > >
> > > for you to fetch changes up to 9fa032885583a2f1cb9cacad2f717784ccea02a1:
> > >
> > >   hw/i386: pass RNG seed via setup_data entry (2022-07-22 19:01:44 +0200)
> >
> > Hi -- this tag doesn't seem to be the same commit hash that this
> > pull request quotes. The tag is commit 67f7e426e53833. Is the
> > tag definitely pointing at the right thing ?
>
> Yes, the only difference is it fixes mojibake in a commit message:

Thanks for the clarification.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.1
for any user-visible changes.

-- PMM

