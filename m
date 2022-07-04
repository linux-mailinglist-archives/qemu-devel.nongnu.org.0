Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 622875657C9
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:50:03 +0200 (CEST)
Received: from localhost ([::1]:46838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8MSe-0007kn-Iy
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Ly6-0002Ul-Dn
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:18:26 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:36534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Ly4-0002Ls-Rq
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:18:26 -0400
Received: by mail-yb1-xb30.google.com with SMTP id c143so8310659ybf.3
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xptBX/D3GnqKCo/Q7ni8rXondMIzZbtwru7Wp5jqL/0=;
 b=wbkIX19a3PuIDdWZhWQZrqMvuOLfAclkD97AMc8bBCi2RF9838bCOXUmSuHyzyhUyx
 1nGfAvMfGlefp9k+KpUzKVId10tPnjYGsV3DYDWbkxh+x0RMyUTkVHSbc0h2t9/eC6kI
 L9Fd5pcxpQ/4qtqh81lT+H9kCfQUrtG/299c6zJX/BZnpyJT6+t9DWq0epsIx94odb7V
 rJIq3HlrYlwsMXK7ATh7tKHjLWRoCoOGiinl1lXfAGKJv1QnWwIWOUV0fzPj3nvErIlS
 KyDh/VyeSkVITQlslCnqAaEIFBPcTwjpZqxOLPGvpJ5noohgTbGgMyBaS4kO5zytIvtb
 OX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xptBX/D3GnqKCo/Q7ni8rXondMIzZbtwru7Wp5jqL/0=;
 b=a0VcGJjq6NyCtrNGWE6msgTY1I8QiCchJnpdRrV6yUTepA92t3zuEWN5/sUg3zrl5j
 pWzpN2Myt2DvCc5qj6TgqUpjy82g+XqiGDX/50YgGkA3UdxMoLd8CcKDJ8vxDXFI8U3+
 ncFZ4iTMNAbvxP3+2qCgSS2ubNlJ/vQyljrJ+i0s5y2Pqg6D3pJCEBvH/vazsNJxhYJI
 vmETlZ+p7GZjZkEoIIWIwDxTKRdD2LB6LZ/d8cQA8En+0zEqZwpXrE5wz37+nkD8cF7a
 qqlTKFwyNJCyytOgn8j70bTj+5Tmp9U/9YCFUpkdZI2mur31sdNneKn+S9es+cySCmjz
 zapg==
X-Gm-Message-State: AJIora+7FkPdVLgRRzqi2h9TKActG7SMKx9/i2y3PbHnw94zYiyv/rpo
 g68TfLjuOKJZAnT4vglVpXHRmur6eeER9djSEpa0eg==
X-Google-Smtp-Source: AGRyM1tNSEdVLapFt53A8WUOr5GOURBucblZKYqxPR7ZGRA9Ffyztit0LLTjwXo2WWVMYeqGk79FeARn8FCc+2Xev7M=
X-Received: by 2002:a5b:e87:0:b0:66d:4669:9871 with SMTP id
 z7-20020a5b0e87000000b0066d46699871mr31235218ybr.288.1656940698338; Mon, 04
 Jul 2022 06:18:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-10-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-10-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:18:06 +0100
Message-ID: <CAFEAcA9cgeZRCpTGwUjEhqyvEQghbwR+0PZ8BNJ2w-5WcLwFoA@mail.gmail.com>
Subject: Re: [PATCH 09/40] pl050: introduce pl050_mouse_class_init() and
 pl050_mouse_realize()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Introduce a new pl050_mouse_class_init() function containing a call to
> device_class_set_parent_realize() which calls a new pl050_mouse_realize()
> function to initialise the PS2 mouse device.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

