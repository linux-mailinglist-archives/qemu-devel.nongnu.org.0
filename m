Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DE551DC8E
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 17:49:30 +0200 (CEST)
Received: from localhost ([::1]:33798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn0Cv-0007a7-FF
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 11:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nn0BP-0006oI-B3
 for qemu-devel@nongnu.org; Fri, 06 May 2022 11:47:55 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:33718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nn0BN-00009x-Lb
 for qemu-devel@nongnu.org; Fri, 06 May 2022 11:47:54 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2f863469afbso86209647b3.0
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 08:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sosfutbpKaR3jx4Waf0NdDErdIdOva+C0xx7+gKUxfA=;
 b=Qp5nAbfGEFkm2B4FWvnEsHKkA1vB/XqZq37fMx4CPxbp+gqek9bUuSUPpPkNmstHiu
 mMrNsg50o8b8+l9Pmw+p++LgWfXo0/asiNoWgeyKQliqCrYd8QTvxE+6N9cw1hvyND+V
 l9ut1PF2AN1Eb4iFS1R9jQ+gdBkaz/6wyxwTLQ+nCP5yvVy363+x5cnvzYMov+lJFsMZ
 u6tDa7JTq3HdV2CfTtbeUuiBRN0nRC6ieuVJTJDpOTtnZk0gjcli4ox9hetqCuXVQeji
 tuRTdKXE3rm/ruThehTOG1KHLbnfe5oKsTtKQpnhvCw8JoABjULcoHGzp7oyF38S6csQ
 cI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sosfutbpKaR3jx4Waf0NdDErdIdOva+C0xx7+gKUxfA=;
 b=iOV+WNiiZhUAH+wYnt+8Ks0N2jXjqKEMtz72dw4AySvT8D6+1W4nmIeZv7MCjSQrzC
 6O7lcBh7JGkQNK7qMleiFIIcvTPOLYJ5IPyXenYAgAWHZLIzmSPqXahfg0vVcUkkwWki
 NlkUfngRyCjAVKpP7/w2aSG07ln22jlJnYDRdRh2V0tvnGP9Si5H3YRTd2MtgaiaFsAY
 R3cr8Rm6vccYEC79vQnBkP1RSZAk2N9uCR6P1FEKjcufITUTvLgvU/gtxvgfQ2i5dmyb
 9bnXE1nux3s4zBimQjh15FaYyjuDfgJq2nmDm0CbPimHi7IbpJUbjMJ13fcFKHw8fnYv
 2kCQ==
X-Gm-Message-State: AOAM533f9gc5VMw4e23nlSZGBi4IkddIBihllI+19GSdpwrJD23lpvOl
 aBD7kjUuGQ3lYizAjQBKIwFvyWyKwgIVfbMZeYfI2g==
X-Google-Smtp-Source: ABdhPJx1tej4JbXYmY7oQcbauBOYfY3pyBNXeKDz7JxG8cufUSEZMsbtvFyiFf6Xboz/BM/yLWG75O0Mz1kFkYlMcpo=
X-Received: by 2002:a81:1dcf:0:b0:2fa:d094:14ff with SMTP id
 d198-20020a811dcf000000b002fad09414ffmr3161990ywd.10.1651852072446; Fri, 06
 May 2022 08:47:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220501122505.29202-1-gautamnagrawal@gmail.com>
 <YnUvpsaM0hwUSZvM@stefanha-x1.localdomain>
 <b16d2b2d-f086-636b-4da5-79d3134a4482@redhat.com>
 <CAFEAcA9rK6T03mkUrojf+Wz=UCiakibXtj56W0F=uuEjeqoZig@mail.gmail.com>
 <7551dedd-7417-6292-907b-28ff8304cd83@redhat.com>
In-Reply-To: <7551dedd-7417-6292-907b-28ff8304cd83@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 May 2022 16:47:41 +0100
Message-ID: <CAFEAcA8i5t0i61HT0NEV5BHYEkK_ipSAeNGuc+3Zg3uqTGkzYQ@mail.gmail.com>
Subject: Re: [PATCH v3] Warn user if the vga flag is passed but no vga device
 is created
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>, kraxel@redhat.com,
 qemu-devel@nongnu.org, Gautam Agrawal <gutamnagrawal@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Fri, 6 May 2022 at 16:43, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 5/6/22 16:48, Peter Maydell wrote:
> >> I'm just in progress of preparing a pull request with misc patches, I can
> >> also throw it in there if nobody minds.
> > Paolo mentioned on IRC yesterday that there was some detail he thought
> > it wasn't handling right with VGA_DEVICE, but I didn't really understand
> > the details. Paolo ?
>
> Yeah, I was wondering if this would warn for "-device VGA".  But if so
> it should be enough to do this to fix it:
>
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index eef1558281..7ff76b795a 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -1352,6 +1352,7 @@ static void qemu_disable_default_devices(void)
>
>       if (!vga_model && !default_vga) {
>           vga_interface_type = VGA_DEVICE;
> +        vga_interface_created = true;
>       }
>       if (!has_defaults || machine_class->no_serial) {
>           default_serial = 0;

Can you explain why that's right? qemu_disable_default_devices()
isn't creating any devices at all, so it's not clear to me
(a) why it's setting vga_interface_type or (b) why setting
vga_interface_created to true is OK.

What I would have expected would have been some kind
of callback where the device created with -device whatever
arranged to set vga_interface_type to VGA_DEVICE when
it was created; but that's clearly not how the code works,
so I'm confused about how it does work...

thanks
-- PMM

