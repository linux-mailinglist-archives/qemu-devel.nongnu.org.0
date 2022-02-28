Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7EA4C7E23
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 00:12:47 +0100 (CET)
Received: from localhost ([::1]:54176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOpCA-0004gK-Hx
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 18:12:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOpA0-0003yq-02
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 18:10:32 -0500
Received: from [2607:f8b0:4864:20::42d] (port=45807
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOp9y-00061N-F7
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 18:10:31 -0500
Received: by mail-pf1-x42d.google.com with SMTP id u16so12423862pfg.12
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 15:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=yjGJO3T5230yPpccbdua+hkTFefHCRXZqOrpLyZkSh0=;
 b=NlkfKPooTTB2yWLyds/pgABWjrNWnojWG1bleaye6U/3Urb46kWC5eA7SjLElumOQ1
 Sa/aekafnVEHWVzGny93D7hsnOP7DZ7xBLZaOMKluDsu/Plm+noP4mr1fVfKScSbX6xB
 S2u6H0X7aM1k4zW8Wzroa6Y9NLY5d6nU7UYsk3TiX8HduPFwTi6F9HustnpzMVspg+Ex
 4mcjN6an+ZxasVplaWCi+pkC1yzwYb5QalMLIO/3dIJ2gMCVEeFMlnhVwKOh5+9OHxBA
 5bP1e3N75EDZmT6XNOSjDl2wlmY0MYbFqHFMOuwjETEdGswzOWUs6UKxDTy5JL2zeuPR
 67/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yjGJO3T5230yPpccbdua+hkTFefHCRXZqOrpLyZkSh0=;
 b=Jj+GAp5ufMCTpyA13SAb22UYMoQ9N05UbtoOUR3Bv6ZfVXt/tX8VYzcz77XUoYY+DL
 otoL88kvz3dI8S6O/I1RRv2rU1ZF8iN3Itj/xnHpuOsMtZcLf/AOjPvjJQWOdHkcBQID
 pBiCQP7pUwQXoD0948OE3EFyRsSBlDe0dbkmkyPs/YqAQt5IjwloRtzK9tQAsN1JizIc
 yIVIPpIWgIsf8P8vb/qMft+VCH2gYvaHw8BkzWy9q9LZD8SqvcfZbH3FaMnTmMg8qqaG
 M21kdkhKR3WPndMlR2X6OqFpfUE417PH8RGn5kFHAcSXtf/dZGSW/dwAcpfzxMQ/LL7s
 zyPw==
X-Gm-Message-State: AOAM531TMIdO9Yesr5ev9lAB1t//T81QVXTPwr+DcIDuGLFGx4XtFGRm
 KiWTORSE1CPD+saHZEJvjoE=
X-Google-Smtp-Source: ABdhPJw9Xsf5piJybyuMo71SHBrR0hhotEPZGMgQZ0seQcgcgVyW4cttPOT3Sv5D1EsboTw59TrqNQ==
X-Received: by 2002:a63:114:0:b0:34d:efd0:762a with SMTP id
 20-20020a630114000000b0034defd0762amr18999753pgb.71.1646089829129; 
 Mon, 28 Feb 2022 15:10:29 -0800 (PST)
Received: from [192.168.1.115] (133.red-95-127-186.staticip.rima-tde.net.
 [95.127.186.133]) by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001bc4ec15949sm360574pjy.2.2022.02.28.15.10.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 15:10:28 -0800 (PST)
Message-ID: <f4927d00-f37a-3970-37ba-40e672154c0d@gmail.com>
Date: Tue, 1 Mar 2022 00:10:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 08/10] esp: convert ESPState pdma_cb from a function
 pointer to an integer
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, laurent@vivier.eu,
 pbonzini@redhat.com, fam@euphon.net, qemu-devel@nongnu.org
References: <20220228222527.8234-1-mark.cave-ayland@ilande.co.uk>
 <20220228222527.8234-9-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220228222527.8234-9-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/2/22 23:25, Mark Cave-Ayland wrote:
> This prepares for the inclusion of the current PDMA callback in the migration
> stream since the callback is referenced by an integer instead of a function
> pointer.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/scsi/esp.c         | 47 ++++++++++++++++++++++++++++++-------------
>   include/hw/scsi/esp.h | 11 +++++++++-
>   2 files changed, 43 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index 035fb0d1f6..e8b6f25dbb 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -195,14 +195,10 @@ static void esp_pdma_write(ESPState *s, uint8_t val)
>       esp_set_tc(s, dmalen);
>   }
>   
> -static void esp_set_pdma_cb(ESPState *s, void (*cb)(ESPState *))
> +static void esp_set_pdma_cb(ESPState *s, int pdma_cb)

Why signed?

>   {
> -    s->pdma_cb = cb;
> -}
> -
> -static void esp_pdma_cb(ESPState *s)
> -{
> -    s->pdma_cb(s);
> +    assert(pdma_cb >= 0 && pdma_cb < PDMA_NUM_CBS);

No need to check >=0 if using unsigned.

> +    s->pdma_cb = pdma_cb;
>   }

> +static void esp_pdma_cb(ESPState *s)
> +{
> +    switch (s->pdma_cb) {
> +    case PDMA_SATN_PDMA_CB:
> +        satn_pdma_cb(s);
> +        break;
> +    case PDMA_S_WITHOUT_SATN_PDMA_CB:
> +        s_without_satn_pdma_cb(s);
> +        break;
> +    case PDMA_SATN_STOP_PDMA_CB:
> +        satn_stop_pdma_cb(s);
> +        break;
> +    case PDMA_WRITE_RESPONSE_PDMA_CB:
> +        write_response_pdma_cb(s);
> +        break;
> +    case PDMA_DO_DMA_PDMA_CB:
> +        do_dma_pdma_cb(s);
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +}
> +

> index b1ec27612f..885ccf4660 100644
> --- a/include/hw/scsi/esp.h
> +++ b/include/hw/scsi/esp.h
> @@ -51,7 +51,7 @@ struct ESPState {
>       ESPDMAMemoryReadWriteFunc dma_memory_write;
>       void *dma_opaque;
>       void (*dma_cb)(ESPState *s);
> -    void (*pdma_cb)(ESPState *s);
> +    uint8_t pdma_cb;

And here you use unsigned :)

>       uint8_t mig_version_id;
>   
> @@ -150,6 +150,15 @@ struct SysBusESPState {
>   #define TCHI_FAS100A 0x4
>   #define TCHI_AM53C974 0x12
>   
> +/* PDMA callbacks */
> +#define PDMA_SATN_PDMA_CB              0
> +#define PDMA_S_WITHOUT_SATN_PDMA_CB    1
> +#define PDMA_SATN_STOP_PDMA_CB         2
> +#define PDMA_WRITE_RESPONSE_PDMA_CB    3
> +#define PDMA_DO_DMA_PDMA_CB            4

I'd rather use an enum (and in esp_pdma_cb's switch).

> +#define PDMA_NUM_CBS                   5
> +
>   void esp_dma_enable(ESPState *s, int irq, int level);
>   void esp_request_cancelled(SCSIRequest *req);
>   void esp_command_complete(SCSIRequest *req, size_t resid);

Preferrably using unsigned:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

