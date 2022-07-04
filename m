Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A83D856589E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:29:23 +0200 (CEST)
Received: from localhost ([::1]:51660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8N4k-0003KZ-PN
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M6r-0005HD-Vh
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:27:30 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:39462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M6c-0003oP-Kg
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:27:29 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-31c9b70c382so19737737b3.6
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2ezvAVUKuzndz/NZBA2mYifg8TZWvsk30mzolA5tuAc=;
 b=PTMWRIF5zHZxyWp9GFOC9Twzi7tRrC4lP4ZWPuEsXe4662+ldgzWWThpFHp02ahzMe
 q+w+lT2P/vAAZwzdTZk17NqnEnIIK2X4XRnNNjhyzZqPLJyCacxbp92aemJpx5RHK8XT
 NKv0yExDGgpHn6G2vC/Hqo9dMghFMONpZjErptfFDG+Jnmjzu2RDj9FE4CRnNfWwYzmb
 NzN0Ivpr2DFvpXv89swTsTruNBcvCj+VO0t0P9zmINm2h3OByeUwFgUXtRU7c7E5ouwQ
 5z5B78i0HtRL0Z5//P20qUPJMl7eh80S7vi27rBGqGir/uWbyDXhr6UkzPWeZAkj05wU
 MdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2ezvAVUKuzndz/NZBA2mYifg8TZWvsk30mzolA5tuAc=;
 b=ajcprVv/maFop3PIsv+JTj/F5Xuk6odmdxtTEalWYfTgwekN4zH3rA848JIlSTvNLT
 dC5Eu5bs6acFBCfZIt9xKuGGYIo0wd34aY2P6t0ACgpnZopEW8jZZMYYGtucnRnT9n3z
 KEo6DLZa2X3vdgp9hN8woTS9BFw0jyukcGSv+waZExCu4Q28l3R35ybXRn9qlxROPAKO
 aMVXJhO6Lur/na9njEP09ELdjyQMj7s3fIrwl9k5mKWFyLFs2bpULDBx4dMZXTH9Y7yY
 2HxnLAqWEd9QAiWv1DafSrN29q+n/WKddpmK5PSKYmVRHen0fC7f2k+WtGjjEnHNKa5r
 vehw==
X-Gm-Message-State: AJIora9Qu9cPd54oLh4w3LptsrzdPxmbDdb9qJqxXRcjJllIyO3kj4U4
 EbCGAY/61fq6je6BPXhiPDAj2j6z4U3iiq+uZ/5/iA==
X-Google-Smtp-Source: AGRyM1vsv/ZdOM9Y+yXGvSUrl+krPmmGTRMC29PDE21BVoKlJADMYRm7Yfn1X/64DGKgKmbmE29A/MYVbfgk1rrfzTg=
X-Received: by 2002:a0d:eb83:0:b0:31c:8741:a033 with SMTP id
 u125-20020a0deb83000000b0031c8741a033mr10026953ywe.455.1656941233745; Mon, 04
 Jul 2022 06:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-27-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-27-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:27:03 +0100
Message-ID: <CAFEAcA9SMa7dp3sEa2O=6LYR8UCc-EquviJmHoypuCDzqTgLQQ@mail.gmail.com>
Subject: Re: [PATCH 26/40] lasips2: add named input gpio to port for
 downstream PS2 device IRQ
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The named input gpio is to be connected to the IRQ output of the downstream
> PS2 device and used to drive the port IRQ. Initialise the named input gpio
> in lasips2_port_init() and add new lasips2_port_class_init() and
> lasips2_port_realize() functions to connect the PS2 device output gpio to
> the new named input gpio.
>
> Note that the reference to lasips2_port_realize() is stored in
> LASIPS2PortDeviceClass but not yet used.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

