Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A6D44520A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 12:14:06 +0100 (CET)
Received: from localhost ([::1]:40896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miah3-00052l-7A
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 07:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1miaeg-00035M-6d
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 07:11:38 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:38617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1miaee-0004er-9S
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 07:11:37 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 a20-20020a1c7f14000000b003231d13ee3cso6908380wmd.3
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 04:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Vwonmle2nZhFpkaoLiPD3pWkHX/BW9Nnb1izCtQJD9s=;
 b=F4puwFdiUMFgOj2LA+QfjUJP3V0iz2rkoKb4R4iM90VpX7GLZ02yqsu31HX/awkzqZ
 +JERjw4l4ZU4ygdmj95a35Nu88BhNCg9iCwrXpDD6OWvJNex5+tCIrX4fCmqOHMtRD0e
 TF0ItyYynuvd14IRKTwsm+ssnF5IGV/egGzwV+DpBUK1/jls9DiFtDWqyo9psuCcjBDs
 LSdOO4pvJAJdR9F9pa4FGuefCMhEg1eomHxTjHZ9lG3qM7rkYQ/CF2QG+YpKeq/LXgU7
 At1xzwETCGDwkj7qGd8B0e9rZMx8CaXmfcFIcuqh3Vd2ORjgI+e+M133AAtlzykCJd8a
 J2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Vwonmle2nZhFpkaoLiPD3pWkHX/BW9Nnb1izCtQJD9s=;
 b=wxYV3cXMlDw6vaWuE+f2DYHi9OeklrZvk45E5+4PnwCAIV+66VyXg9peumBkwuBBDo
 hdlhe2aYc3UmniM2dAklLYAcdEo8rAz6srpDNT/7CR0KyvcA9mfpOigOnKqk9ehgn811
 zERUAfut85Ai6VlxMt0+iH89OKq9M3QSBy3MjvcLqS6uoRLUPrYxq/0xp6cwXp2Y/Qfl
 5iWcco+OiJMqd1q5aPLJoHWiUDW8sPXYss8ViUse6OUSh8+YC6g8AlTptvcwAZc4n5l0
 Tnbd/RT8X1nzLEd/2QRYjHBtkM0+EL7+Bh1cJBGi/hDOhbm8A//7Ps4uxUNV12eh+tkm
 RZMw==
X-Gm-Message-State: AOAM530jY3ODXv7A80rd1np1JycIGBSBZQv0hWTL4AL+mBrAM5EhB1Ts
 k3iJESjwalmaDl1BBt1rT/j9xrL//MuxZYBnKAD9Zg==
X-Google-Smtp-Source: ABdhPJzejyLLk6WX5nd80a6xmBjZ7UD3f2cPKjJVdSdMGkVCet/bnDGFr4WmHoSE46baDyB2zJLWx9Kn/0nqM47npPw=
X-Received: by 2002:a05:600c:1993:: with SMTP id
 t19mr3717976wmq.21.1636024294330; 
 Thu, 04 Nov 2021 04:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <07e63acb-b756-2586-2ba2-b54b837f7fc8@tribudubois.net>
In-Reply-To: <07e63acb-b756-2586-2ba2-b54b837f7fc8@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Nov 2021 11:11:23 +0000
Message-ID: <CAFEAcA89YQ_vN-JpCeB+L==F5g1hM=CNMBzjaf5c3EHF19NVyQ@mail.gmail.com>
Subject: Re: Qemu and ARM secure state.
To: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Nov 2021 at 13:27, Jean-Christophe DUBOIS <jcd@tribudubois.net> w=
rote:
> I have a little application that is designed to work on the i.MX6UL proce=
ssor.
>
> I developed it and tested it on the mcimx6ul-evk platform emulated by Qem=
u.
>
> This application used to work "flawlessly" on Qemu 5.0.50 and is working =
on Qemu 6.0.0 (available as a pre-built package on the latest Ubuntu).
>
> But when I try to run the exact same command line on a Qemu version I com=
pile myself from main/latest of github (Qemu 6.1.50), my application fails =
to start.
>
> So a little background:
>
> My application expects to start in "secure" state and supervisor mode (wh=
ich is the default state of i.MX6UL when booting barebone [without u-boot])=
.
>
> From this state the application tries to get to "non secure" / hypervisor=
 mode which imply going to the "secure" / monitor state before being able t=
o drop to "non secure" / hypervisor. To do so is runs a "smc 0" operand (fr=
om "secure" / supervisor).
>
> This "smc" instruction is processed "as expected" by Qemu 5.0.50 and Qemu=
 6.0.0 (getting to "secure" / monitor mode) but on Qemu 6.1.50 (latest from=
 github) it is as if the smc operand was a no-op. It doesn't trigger any ex=
ception and the processor just get to the next instruction after the "smc" =
instruction. So I am a bit puzzled.
>
> Is there something that changed in Qemu (since Qemu 6.0.0) when it comes =
to the "secure" world/state?
> Is there some additional command line parameters to use (I search in the =
documentation but without luck) to get secure world behavior ?
> Is it necessary to "adapt" the emulated platform (i.MX6UL/mcimx6ul-evk) i=
n some way (it looks like the "virt" machine with "secure=3Don" does work f=
or arm platform)?

Could you try doing a bisect to find the QEMU commit that caused
your guest to stop working ?

thanks
-- PMM

