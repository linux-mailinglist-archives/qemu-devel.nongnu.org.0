Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6765A5658AA
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:33:12 +0200 (CEST)
Received: from localhost ([::1]:58248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8N8R-000857-GB
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M7s-0007w7-87
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:28:32 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:34707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M7q-0003tG-MJ
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:28:31 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id d145so13705798ybh.1
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MIjezOnfrTZk/ziSdi+WN/bXftMyOb/aZmQlr68sVUk=;
 b=BbaT6jL5qREwMSlaZGrs+OZY7ibAynTgos/WMd1kaF+SptCJ3b+kXWNod3aqx/DlvV
 f4SDi16RV6wU+lAIDqtK/j/7hjT7QH+vYjhnQqqf/6/oDkrRNo+EG/WZhCd0y5WF2FxC
 +XUhZbs5C97hKmUI22g+TXDoDeHV/wGuyREmQ3Y+OEkJPP4ehGubWtfIfZUP5j5fLdVP
 kXdxoMbyDN0HFkWCdS/raHNO2MquWxBaPXc/pxkj0jkhAEEvuBLqs7LnfDWWMN1vTV1T
 qwuVhhZHEG3zJt407mJNG/ZmrC/1PJ1qAjWdeCFpzzYmbiOZq53m9RytugN2vyqt+Usi
 C+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MIjezOnfrTZk/ziSdi+WN/bXftMyOb/aZmQlr68sVUk=;
 b=KU7v/IuOnQ/Y67DLD3D9jjMHQScbjz+Q0U3bo68DJXnQ3OdDFveT4lb7myxJYGYTV4
 hYqmBoXTYQSm5HFpb8s43aFEQSY++xvZbHA7m9QPKXK1q2Fp8KPOY9sChMAqWq8Bsip8
 rmfn5UdPXYZXOYvdAJd83pVsqSfIrIghUTcqcxjbvT+C9a/mMY7yZy874yfeC/YfGE3b
 3YMcZionrmZQowTIBwE0e3JCZ9Py7P7Msl6Nt9V2EdPh6zPAD8mMPbOxOLl7GY5vqIyG
 fE8xBpDhh9Akx4HqB2tTfqW0oLRXKPyoyCP108hRStptGfUph+suANikYZKrfJNh8YPY
 Qyvw==
X-Gm-Message-State: AJIora/Zg6Dj3xq6oJqm49MRNPgqteHrwgK1tGHCYM/+DDvI7+G9ITpg
 SJkRtbVpktk2vXwjMuGVg/wMyHoW0CQThcl5ykdvKQ==
X-Google-Smtp-Source: AGRyM1v2X+SqtkhmE9TVmbS/fZBLKYvr/lCSnadr5QN6ABsgl1b15whnXsv43IPELfZ2T2UNgSkaGYezkYJ9M72ZhOM=
X-Received: by 2002:a05:6902:1183:b0:66e:4860:575d with SMTP id
 m3-20020a056902118300b0066e4860575dmr6199217ybu.479.1656941309289; Mon, 04
 Jul 2022 06:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-29-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-29-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:28:18 +0100
Message-ID: <CAFEAcA8FGWZGgvVYJ+4gPCmpsxNAhAsRFfJ8=WdU+E7_5ubUbQ@mail.gmail.com>
Subject: Re: [PATCH 28/40] lasips2: switch to using port-based IRQs
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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
> Now we can implement port-based IRQs by wiring the PS2 device IRQs to the
> LASI2Port named input gpios rather than directly to the LASIPS2 device, and
> generate the LASIPS2 output IRQ from the int_status bitmap representing the
> individual port IRQs instead of the birq boolean.
>
> This enables us to remove the separate PS2 keyboard and PS2 mouse named input
> gpios from the LASIPS2 device and simplify the register implementation to
> drive the port IRQ using qemu_set_irq() rather than accessing the LASIPS2
> device IRQs directly. As a consequence the IRQ level logic in lasips2_set_irq()
> can also be simplified accordingly.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/lasips2.c         | 59 ++++++++++++--------------------------
>  include/hw/input/lasips2.h |  7 ++---
>  2 files changed, 20 insertions(+), 46 deletions(-)
>
> diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
> index 013d891af6..5ceb38c1af 100644
> --- a/hw/input/lasips2.c
> +++ b/hw/input/lasips2.c
> @@ -42,10 +42,8 @@ static const VMStateDescription vmstate_lasips2 = {
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT8(kbd_port.parent_obj.control, LASIPS2State),
>          VMSTATE_UINT8(kbd_port.parent_obj.id, LASIPS2State),
> -        VMSTATE_BOOL(kbd_port.parent_obj.birq, LASIPS2State),
>          VMSTATE_UINT8(mouse_port.parent_obj.control, LASIPS2State),
>          VMSTATE_UINT8(mouse_port.parent_obj.id, LASIPS2State),
> -        VMSTATE_BOOL(mouse_port.parent_obj.birq, LASIPS2State),
>          VMSTATE_END_OF_LIST()
>      }

You should bump the version number when you remove fields, so
that the error message on a mismatched-migration is clearer.


-- PMM

