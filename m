Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D3F4CC230
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:04:35 +0100 (CET)
Received: from localhost ([::1]:45392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnwQ-0005uD-V7
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:04:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPnZm-0004kM-NK
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:41:10 -0500
Received: from [2607:f8b0:4864:20::112b] (port=36302
 helo=mail-yw1-x112b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPnZi-0001ij-Al
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:41:10 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2dbfe58670cso60281447b3.3
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 07:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7exvFchK4+RAA3nLEgCoXVbAwvZoYF/b/S3lTD6VKSM=;
 b=xfk5KjC7SG0odW2LtZyP5sSYNo1aeiDsbNe2U7daPBCiHXu9jSdI9BjMIlZ9tI4w7k
 NyhUrR/v9OeWrZBCPX+IxtbxjacMHnlcNK9W8SoL3kE7FKcjOrahnNjN/CA/y0mO4OYE
 cKpZn5KWpNEoh37QSJoi2h9XhpWgvJnxpwpK0ola+I24Xr6QV9CZRDJxUPiJ19lrlE4w
 rqNPtycHEsQeUOQnaAf9nXvH87iWlG/c+2sOCexiBK6VwEOjXxT7LUi0RNAB+FFXvNHd
 8iMQ9DpZu6bDBGqj8pUApLfMNkUd9aUgSluCnr/Ed08AFI+pkOa446eGgzjHxxc4dM/4
 zmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7exvFchK4+RAA3nLEgCoXVbAwvZoYF/b/S3lTD6VKSM=;
 b=Ne5RZBFkkkQnMi4m58PVRqQNQXMkMOFUmduSW3IPgO0CwmR0Em7j60tVQw2bGF6Tyv
 MV9EecC+Wk8u2VDdn5zcJYbiAqkAvh/HIqY5BDs4T5ZuktFkcGcx/9bW5mFol7dRUqhR
 aVP7yleJDzs/RVcz+8HgFcS6P9WqP/nYWNei6kQGUpM2oP1RR3vphcExYm2XQETl2ONA
 1MqyNgn59MgeNJ5mxvwVaf9+MypkAsLjKWSSEjmb0p4NkdwKKyGKSnKGRxT0DDf4zP3O
 qCbVK1geXCvzAHgPM20xBhD/OEObn3x+PlPAQjgPNND3YV8OWdMXhscCEINryo0QiRax
 yABQ==
X-Gm-Message-State: AOAM533nFnol5/eyDEL5oHzclhtuAHPvCogH9SO0rTk6wwuvXbHE9Csy
 O9GHwYY/7R5dSq1hteE3Zss0NJkUrI8Lx+1Pu7gLVA==
X-Google-Smtp-Source: ABdhPJzNQIkrIVJ7dWQvYfYehj+Pozog0k+zxcn8CAdosEXx94YYX+7G6yKlFZOon1ysMGJKhlr+kX3o3/t98ttnPw4=
X-Received: by 2002:a0d:e2c9:0:b0:2dc:1f22:e349 with SMTP id
 l192-20020a0de2c9000000b002dc1f22e349mr6951960ywe.10.1646322064563; Thu, 03
 Mar 2022 07:41:04 -0800 (PST)
MIME-Version: 1.0
References: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
 <20220302212752.6922-10-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220302212752.6922-10-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2022 15:40:53 +0000
Message-ID: <CAFEAcA9eMZFvqn-VuA2EevOM7ZV3PiVYora+CsKpdjcqM7L4_Q@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] esp: include the current PDMA callback in the
 migration stream
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
Cc: fam@euphon.net, pbonzini@redhat.com, Laurent@vivier.eu,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Mar 2022 at 21:38, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This involves (re)adding a PDMA-specific subsection to hold the reference to the
> current PDMA callback.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/scsi/esp.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index a818b2b07a..32926834bc 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -1209,6 +1209,25 @@ static int esp_post_load(void *opaque, int version_id)
>      return 0;
>  }
>
> +static bool esp_pdma_needed(void *opaque)
> +{
> +    ESPState *s = ESP(opaque);
> +
> +    return s->dma_memory_read == NULL && s->dma_memory_write == NULL &&
> +           s->dma_enabled;

A comment about why this is the correct condition would be helpful.
If I understand it correctly, something like this ?

 /*
  * pdma_cb is used only by the sysbus ESP device, not the PCI ESP
  * device. The PCI device sets the s->dma_memory_read and
  * s->dma_memory_write function pointers at realize.
  */

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

> +}
> +
> +static const VMStateDescription vmstate_esp_pdma = {
> +    .name = "esp/pdma",
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .needed = esp_pdma_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT8(pdma_cb, ESPState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  const VMStateDescription vmstate_esp = {
>      .name = "esp",
>      .version_id = 6,
> @@ -1243,6 +1262,10 @@ const VMStateDescription vmstate_esp = {
>          VMSTATE_UINT8_TEST(lun, ESPState, esp_is_version_6),
>          VMSTATE_END_OF_LIST()
>      },
> +    .subsections = (const VMStateDescription * []) {
> +        &vmstate_esp_pdma,
> +        NULL
> +    }
>  };

Do we need to do something similar to handle s->dma_cb ?

thanks
-- PMM

