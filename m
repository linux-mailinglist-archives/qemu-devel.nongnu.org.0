Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7C24DB8E5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 20:31:16 +0100 (CET)
Received: from localhost ([::1]:57656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUZMY-0000uR-Vg
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 15:31:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUZKr-0008EK-Vn
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 15:29:29 -0400
Received: from [2607:f8b0:4864:20::b2b] (port=39749
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUZKq-00067l-5V
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 15:29:29 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id t11so6282897ybi.6
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 12:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hz3UmrMT6h7UDeaym2J3rCQvzdFwINHI1s1ZlDxoeU8=;
 b=n4k4AiCLNJlr7ggSRLgPjEm3DZ/qQyZTMLarauk/GLcuQwnFQGLYOf8jIdl7hlyBWy
 Q7IAnWJrDI7ZTxaEI5jzwJNiI274se9QGP5dkDdrR5Zf3U9t3EbdTv/Uz97A1W7wd6gr
 GTEQWfwZyaLVNS7FjJ3ZC1urSLK6KnyfBCLQpkcUPGEGu/WzHV/GlQd1xHGXwfMt6jID
 rEBdsiECuLPqgMWCiegJf/3oFyf+Vib5y3l0zrUonYmFyJAYKJffT4QHlqcHM+5ADvjQ
 G95T10g09+i/r7BlGaghfHqJdlS774Rb5MzIPuM6TM8lMznZh4+sxYCMHzWFzC2UUeiY
 ectw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hz3UmrMT6h7UDeaym2J3rCQvzdFwINHI1s1ZlDxoeU8=;
 b=uZKIlePt69OogsaopaSWl+m+BkelKtyM9UtQNKLlfM0zDPGAWAfL7nUrVo7oi+vvtv
 P+wz8jeYlLkneiXxdo/fC6KCJTDtSjOmrKhwN/oVStbIWZ2QLIqg29jr09wUU/bfPDxX
 kwDwIumJanCF1YxD0B1O4+LwjN24Nem+YS55XfoJvHNsob8qp4zxDJU46C8YJsLyxIuK
 XSMISZbX/ajCpOEZT7s9rdYTcyGoTFsI949CRVzmiR+MDtpeMxEHN8uhvb2xvxvjqAnf
 UOJ+2cpS47AAg74Ae6jRVQR5AhTiC+99xVV1o0cdQ14Fenf6q/sl+K4Pqp4b52W2YvGc
 jCmQ==
X-Gm-Message-State: AOAM530A+buqak8CvKEnv7WOvhkm1JW9vK/HzJq926rO/xgKDZ0pSqaQ
 wP2ZseerYULOXYRHraFo+GxSg6Wj1TFoK3xSBj5T1A==
X-Google-Smtp-Source: ABdhPJzcPgGrwv1w44Pxb3AoUfHPVS06ULTu/ZCBcf7INRnF/BdkVDTDHO5rhNNPpGvBXQ1UxVJZ8oSW8Sls4JsibSQ=
X-Received: by 2002:a25:2d27:0:b0:633:7521:4794 with SMTP id
 t39-20020a252d27000000b0063375214794mr1531894ybt.193.1647458964779; Wed, 16
 Mar 2022 12:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220316160300.85438-1-philippe.mathieu.daude@gmail.com>
 <e1a5b41b-708d-ef3b-4c9b-8b2469cf4a92@gmail.com>
 <f7fb6c55-60ba-f510-b9cc-8a257859072e@redhat.com>
In-Reply-To: <f7fb6c55-60ba-f510-b9cc-8a257859072e@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Mar 2022 19:29:13 +0000
Message-ID: <CAFEAcA_JHky3XJYVsq9VzG38fWQgSO4k7QWWf+hAyUXrh-BfJQ@mail.gmail.com>
Subject: Re: [RFC PATCH-for-7.0 v2] cocoa: run qemu_init in the main thread
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Mar 2022 at 17:31, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 3/16/22 17:22, Akihiko Odaki wrote:
> > I was thinking that it may be better to let softmmu/main.c do the
> > details if it involves the internals of qemu_main() like qemu_main_loop().
> >
> > More concretely, softmmu/main.c would provide a function to register a
> > function pointer to take over the main thread. main() implemented in
> > softmmu/main.c would call qemu_init(). If a function pointer gets
> > registered in qemu_init(), it would create a thread for main loop and
> > call the registered function pointer. Otherwise, it would directly call
> > qemu_main_loop().
> >
> > It would be a semantically appropriate division of ui/cocoa.m and
> > softmmu/main.c. It would also be beneficial for end-users as it would
> > also allow to isolate ui/cocoa.m into a separate module when
> > --enable-modules in the future. (With "In the future", I mean sometime
> > when we have time to hack Meson build files and some details we cannot
> > fill by 7.0.)
>
> I would like this for 7.1.
>
> Basically rename qemu_main_loop to qemu_default_main_loop, and
> cocoa_display_init would do
>
>      qemu_main_loop = qemu_cocoa_main_loop;
>
> qemu_cocoa_main_loop would include the bulk of the current main of
> ui/cocoa.m.  Seems like a good idea.

Speaking of 7.1, is cocoa currently completely broken, ie in need
of an interim fix for 7.0 ? If so, which of the various patches/approaches
should it be ?

thanks
-- PMM

