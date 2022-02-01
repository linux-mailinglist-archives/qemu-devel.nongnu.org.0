Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 022A24A683B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:53:33 +0100 (CET)
Received: from localhost ([::1]:52406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF21j-0004Yh-UL
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:53:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEyQq-0006FU-V8
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:03:14 -0500
Received: from [2607:f8b0:4864:20::62b] (port=42496
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEyQh-0006iq-IH
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:03:10 -0500
Received: by mail-pl1-x62b.google.com with SMTP id l13so7503987plg.9
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 11:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zxAMUHN2KyPQAA3Vcr+GVJ7CYS2nMpiGkYPYYQtzjXQ=;
 b=JHDwUm1YgQLyuz6NadWTxvtNDxs0sQFkya3qz+gGu6mK99m8Bzju1A78QVQjmn7lvj
 UkGWBeFtIXckEAMxYsuCSoHJLLGfk4l+tNNQRNrv5977qC5Elx0zGUq+TWQesdavLrWd
 Xqu3FO/45KYjC4IIWL1RJxKRfGzBypb8WNlmNmu2o0FxqHzcHKcaPq5cZkUcrnl/pQyE
 9YDgN2wPRp/5auNUu031UuuefX+RSmpQdrREV8NWUlGzeAAgmudMvJtKKvWzlNkKunsc
 oiIdzP2phEZSQ4NqcZNUAMC3dd5RuM9PsY0q1yhkP33jyr5CYnCgDRJHiCSddnPwC23l
 Aizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zxAMUHN2KyPQAA3Vcr+GVJ7CYS2nMpiGkYPYYQtzjXQ=;
 b=Wn9q4ZicEMSrCw3tlNDLlplPvIHCz3AK9k4YY0ctcuXwBHD59E9wB6EHm9lfgDer0f
 OA26dTSqGGRui77ekHpcqR4CpJhLXhbZPF9eW5jMvuYE5EbgZxYms04L86+/vpvs8rEV
 3UFqCKq2/wtyHQTLI8g903GicHc3DFtzmzTOYIcnOthwL2KhDFCRcreyvsa72UPwwKnh
 UC29FG4Lh7h6bmNW8EIwjlgycQTgsH7yoqZj0IXF1RamdfYPVrwWCoOSuZSBrtpVAy+Z
 JoN5Niswbg/Ri8juxc3F4qwjLXt+LPeNXpwk37Ib2MQWiK+hMYP/HR+Lh1PTORz5neQE
 RcVA==
X-Gm-Message-State: AOAM531oVQzFHU+XjlvA/4gxlELVPBluCXq3mcPqRRnMTqJOZhlDXkfN
 dymNhGWJG6HBgdbx3xwqDYg=
X-Google-Smtp-Source: ABdhPJyje5YUnTBU0CJPMwXHHc3LGCJNxpAX0lPBV+Y/hgVw7xRP9sWHNzMGPaXVRl9RbqMJjSg+pA==
X-Received: by 2002:a17:902:780d:: with SMTP id
 p13mr1246892pll.32.1643742145456; 
 Tue, 01 Feb 2022 11:02:25 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id a1sm31906951pgm.83.2022.02.01.11.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 11:02:25 -0800 (PST)
Message-ID: <59040e43-2375-1f73-15bb-ce1a47165145@amsat.org>
Date: Tue, 1 Feb 2022 20:02:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH] hw/i2c: flatten pca954x mux device
Content-Language: en-US
To: Patrick Venture <venture@google.com>, cminyard@mvista.com
Cc: qemu-devel@nongnu.org, Hao Wu <wuhaotsh@google.com>
References: <20220201163005.989457-1-venture@google.com>
In-Reply-To: <20220201163005.989457-1-venture@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 1/2/22 17:30, Patrick Venture wrote:
> Previously this device created N subdevices which each owned an i2c bus.
> Now this device simply owns the N i2c busses directly.
> 
> Tested: Verified devices behind mux are still accessible via qmp and i2c
> from within an arm32 SoC.
> 
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>   hw/i2c/i2c_mux_pca954x.c | 75 ++++++----------------------------------
>   1 file changed, 11 insertions(+), 64 deletions(-)

>   static void pca954x_init(Object *obj)
>   {
>       Pca954xState *s = PCA954X(obj);
>       Pca954xClass *c = PCA954X_GET_CLASS(obj);
>       int i;
>   
> -    /* Only initialize the children we expect. */
> +    /* SMBus modules. Cannot fail. */
>       for (i = 0; i < c->nchans; i++) {
> -        object_initialize_child(obj, "channel[*]", &s->channel[i],
> -                                TYPE_PCA954X_CHANNEL);
> +        /* start all channels as disabled. */
> +        s->enabled[i] = false;
> +        s->bus[i] = i2c_init_bus(DEVICE(s), "channel[*]");

This is not a QOM property, so you need to initialize manually:

-- >8 --
diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
index f9ce633b3a..a9517b612a 100644
--- a/hw/i2c/i2c_mux_pca954x.c
+++ b/hw/i2c/i2c_mux_pca954x.c
@@ -189,9 +189,11 @@ static void pca954x_init(Object *obj)

      /* SMBus modules. Cannot fail. */
      for (i = 0; i < c->nchans; i++) {
+        g_autofree gchar *bus_name = g_strdup_printf("i2c.%d", i);
+
          /* start all channels as disabled. */
          s->enabled[i] = false;
-        s->bus[i] = i2c_init_bus(DEVICE(s), "channel[*]");
+        s->bus[i] = i2c_init_bus(DEVICE(s), bus_name);
      }
  }

---

(look at HMP 'info qtree' output).

>       }
>   }

With the change:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

