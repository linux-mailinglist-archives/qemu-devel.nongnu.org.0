Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6C151332B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:59:38 +0200 (CEST)
Received: from localhost ([::1]:39368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk2o5-0003ZQ-Rl
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nk2cu-0005sT-8U
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 07:48:04 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:40760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nk2cs-0005Ra-FB
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 07:48:03 -0400
Received: by mail-pl1-x631.google.com with SMTP id k4so4127508plk.7
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 04:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5QhcIJoJFpwZZ9y5sGb15PYJ4tqQpvnSV2qPERe1X7s=;
 b=QNNcn3Xzue+RIEwiYhKmQam+68pSKo2Uu3926ibp1LTkqEemRZdZZWxK6fm/ExWHpI
 ooHeVIqzi+UuRvvZptrDeBmBYDKbdv2UkQ7cc2mkU1qyjcniePW/M/ZG6V1Nq8CSFeEB
 C2refY2LlCK7Zg3gLEIIZnKneE2n/Egdf2JdHiibmEvWmvluJ+yTlsEo+vZYVcBKV1tl
 GRW9GuKkYlGsZk9u0K9X5/bLIHxKV5qVO+Vu+eCupAxbPlJ1FYHvYD/adtcnsa4O3Nr6
 GcFdWuaA6gsSHTK7MABLSe+Bv4ZySuWTaW7NFDRvE2Y30skL16Z02TdbIJ096Sr8CF9H
 lmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5QhcIJoJFpwZZ9y5sGb15PYJ4tqQpvnSV2qPERe1X7s=;
 b=zVnGgiUY8IGizU1lUH1jO+rhOZFmhz5+uIUZxIVbp805d4qtYP8hmiJnCLdLEFbnOJ
 ZUBLYmjVdqfNhebGUnGiVOEKiOghQkMsR6PDfToEvqlOB95VNg1jYgPoFjJaWWeGmyFS
 RwPTpcWmAmCPwc/+ndBhV+agwXYcdIz7ELjI3Y1jeH54oyhxJTloYW3N+tHQZO4v8k2M
 6mvoksj1ZQkONJaXAGslNGzGzR2FfOja4mCh9CaNYnJSVaE/L7LSYDqZ3F+mzY4kLm7Z
 Iim6gY783r8pYlk6f/wQQpUIUHvMT0n/oipYO+/Q/LUrYr93nSR30jvcZAafGmHwpfRu
 beiw==
X-Gm-Message-State: AOAM532MgNQgIKYBj10o8uz6lyqohvHHiKR6m9kyIgnQSkCa0WYXV5NW
 ywIIKYVr3biQKfNZMFoMVag=
X-Google-Smtp-Source: ABdhPJxSCwcJAk38aDcM6BAVoyj0UfQT2/DiFNDU3lEe3r+PLSGb+v33eWlonYezQD61mu4oQYkuLw==
X-Received: by 2002:a17:902:6bc2:b0:158:a26b:5884 with SMTP id
 m2-20020a1709026bc200b00158a26b5884mr33146065plt.38.1651146480851; 
 Thu, 28 Apr 2022 04:48:00 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 u7-20020aa78487000000b00505d9277cb3sm21593998pfn.38.2022.04.28.04.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 04:48:00 -0700 (PDT)
Date: Thu, 28 Apr 2022 20:47:58 +0900
From: Stafford Horne <shorne@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [Qemu-devel] [PATCH 2/7] target/openrisc: add shutdown logic
Message-ID: <Ymp+7vYQvA0Wr4sl@antec>
References: <cover.1492384862.git.shorne@gmail.com>
 <fb69c137317a365dcb549dfef1ecd2fbff48e92c.1492384862.git.shorne@gmail.com>
 <YmmA4li384azQ2i9@zx2c4.com>
 <CAFEAcA9FZZzzZJaCHrepni+5oUELxW1TtZ3gZHxSUdfKdx+ghQ@mail.gmail.com>
 <Ymm6K3DjesAZR0OY@antec> <YmnaDUpVI5ihgvg6@zx2c4.com>
 <Ymp3owBiSQIimgSy@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ymp3owBiSQIimgSy@zx2c4.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=shorne@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, openrisc@lists.librecores.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 28, 2022 at 01:16:51PM +0200, Jason A. Donenfeld wrote:
> Hey again,
> 
> On Thu, Apr 28, 2022 at 02:04:29AM +0200, Jason A. Donenfeld wrote:
> > By the way, would this also help the reboot case? That's
> > `reboot(RB_AUTOBOOT);`, which does:
> > 
> > machine_restart() ->
> >   do_kernel_restart() ->
> >     atomic_notifier_chain_register(&restart_handler_list, nb) ->
> >       ???
> > 
> > As far as I can tell, nothing is wired into the reboot case for
> > OpenRISC. Is this something that could be fixed in the kernel without
> > having to patch QEMU? If so, then I could effectively get shutdown for
> > my CI with the -no-reboot option, which is what I'm already doing for a
> > few platforms.
> 
> I added 13 for this: https://lists.librecores.org/pipermail/openrisc/2022-April/003884.html
> 
> When you go add these nops to the specification, please remember to add
> one for reboot too. Then, once that kernel code is merged and the
> specification published, it'll be sensible to add shutdown and reboot
> support to QEMU, per Peter's description.

This sounds fair.

-Stafford

