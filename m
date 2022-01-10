Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 015EC4895BA
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 10:55:04 +0100 (CET)
Received: from localhost ([::1]:59242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6rOJ-0003fU-4B
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 04:55:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6rNA-0002OB-G3
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:53:53 -0500
Received: from [2a00:1450:4864:20::332] (port=43903
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6rN6-0008Sp-MR
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:53:49 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 o203-20020a1ca5d4000000b003477d032384so5276988wme.2
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 01:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xUhwzRo4BEwXAVJVtFG/5JfM4KcUg45Qroix1t4+7Ik=;
 b=APFYJ8KgIrpk31eoxlAG8R98AApwh2TVSTniRpBstlYINhF4tcrHOpctO1yV4FiVnl
 B/o3CBNFxTCY9i8gbvYeL8lO0PV6Ka3M4jZbgo8wFq8WTn3yb/E6ObZpwKyE9JTmBixX
 li6KDcoa0DzqR05UVyRW9ysNA489p2XPSo5xbUCZtRTfo8ylSWIME1IlOUVEsc+lFEej
 Z8UCiUnvWTrukN4SNq9jwDWLc8EyiKYY2omc7Y36OTpRSTA1jP8ZGi12P98srpfq/7dw
 4qYA4bnOPZnHQg7yjsKYuoUebQIzOEHf7up9hJshz2pFFrLyhx9IMbOlNVH8hCdTIjby
 6bZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xUhwzRo4BEwXAVJVtFG/5JfM4KcUg45Qroix1t4+7Ik=;
 b=J1w2tsIDyk3JCDYVqAKbKYmDeD276BPofcsRaGem8JmKSl4Bmv1ss07KpKCdfW80Kq
 Ltq0/WPi6UXyZVoLK9go3P5p3zGH1d8hLVDtxH9Ol348p+wpSNMnOAWAfopsmlrF0IR+
 u+bqTfvQYRFDoyv/wA0WQhec8n703TYHiHHae681qC7SHqNDwVo3oqEXB+8kqgVMlWg1
 /CiQ81O7HuT7Qfhw14TXiud95zhzvmlQ+3j8k9dCGBH/0Hi7FSfK163NJ+IWoFBtCY5G
 GGrhCLt5zxHfBXhUi2TCLftjhxBEZ6BXWar7Nwa2oksrHOup4F4iPO3janteIoKCr17O
 4yTA==
X-Gm-Message-State: AOAM531ej1+tLcBr666F90hT4ypAYkmKFEdejHL+IUG8ikC+VDoW/+lS
 Y6l7t5IZn86eHeQQa3NuYdw=
X-Google-Smtp-Source: ABdhPJw0zZ2jZjFbnfk3FYTJU3xTBR2VAbh3YgeJ4U1QB/hgDe2Kj7HGh4WzwtFDNNzSfM0wrRXOtQ==
X-Received: by 2002:a7b:cbc3:: with SMTP id n3mr12064338wmi.12.1641808427508; 
 Mon, 10 Jan 2022 01:53:47 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id m10sm6250242wms.25.2022.01.10.01.53.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 01:53:47 -0800 (PST)
Message-ID: <1018b87d-819a-ed07-ff4f-5512d8589c11@amsat.org>
Date: Mon, 10 Jan 2022 10:53:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 25/34] linux-user/elfload: add extra logging for hole
 finding
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
 <20220105135009.1584676-26-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220105135009.1584676-26-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, Laurent Vivier <laurent@vivier.eu>,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/22 14:50, Alex Bennée wrote:
> The various approaches to finding memory holes are quite complicated
> to follow especially at a distance. Improve the logging so we can see
> exactly what method found the space for the guest memory.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  linux-user/elfload.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

> @@ -2391,6 +2403,9 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
>      }
>  
>      guest_base = addr;
> +
> +    qemu_log_mask(CPU_LOG_PAGE, "%s: base @ %"PRIxPTR" for %" PRIdPTR" bytes\n",
> +                  __func__, addr, hiaddr - loaddr);

TIL PRIxPTR / PRIdPTR!

>  }
>  
>  static void pgb_dynamic(const char *image_name, long align)
> @@ -2447,6 +2462,9 @@ static void pgb_reserved_va(const char *image_name, abi_ulong guest_loaddr,
>                       "using -R option)", reserved_va, test, strerror(errno));
>          exit(EXIT_FAILURE);
>      }
> +
> +    qemu_log_mask(CPU_LOG_PAGE, "%s: base @ %p for %ld bytes\n",

"for %lu bytes", otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +                  __func__, addr, reserved_va);
>  }
>  
>  void probe_guest_base(const char *image_name, abi_ulong guest_loaddr,

