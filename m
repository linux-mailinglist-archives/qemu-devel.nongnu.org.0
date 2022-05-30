Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D020153875C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 20:34:47 +0200 (CEST)
Received: from localhost ([::1]:39886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvkE2-00018d-N9
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 14:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvk98-0005mK-4r; Mon, 30 May 2022 14:29:42 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:33374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvk96-0005L0-6G; Mon, 30 May 2022 14:29:41 -0400
Received: by mail-pg1-x52b.google.com with SMTP id r71so10817661pgr.0;
 Mon, 30 May 2022 11:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kT94xVICxhV4yaWkuod7rsgqHpn34zDEs4cmMPTlIiQ=;
 b=m46g+DvNPuoWET5S9A8TxiWtQfwexAkH5E4mwZZJC8sfxilGrw8zD9CSGM8vfpwVSu
 nFYF2jeijDfK89+tpOuJTuYf/mmI7o0NZx/7yYrpXv1Ur9o38VL8BbLOK9TvjBNLXNLz
 5W3J3Lgl6ekgZYjArwN9GybSdODpPtn+bx9Y3Ek2I52XTfFxTaSXh1rsxENQ1pV6hAXf
 L+s2sQriNEdKA5ZX2YIZMEgR/9r9ypfIrEtATrEXwJdwLDU066xf9M9HNFfJbbaVUXML
 eSVAle8ssoHpEumLxsGbad0hmniP6g9RLXItLjMCW11pVCVYY1r5zU32nbCekRC0JgY/
 +/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kT94xVICxhV4yaWkuod7rsgqHpn34zDEs4cmMPTlIiQ=;
 b=qcwwbUvmAgQ78+1i7BaSU6CvspgyEmkMNQe9qTe2pB+vuF3G/i2KG8SLLa7mW2rhwL
 O2OyT7W0Mu2iorEzgQ7Xrv66rmhzYosU6Tm+QTpjOwDOETaU0tYDShXbE4XqHY/BE9/g
 img7xHAEOm4rpiXhwlWM7o2yRiBmgnInb57K26+9J+BcN++5y40XPps16ToYKIrggAwm
 /nvZvGqm+x7E4CAJTit4ayO6IFTdtCh/A7k8U9DhaDtRcEflW7mtQUMD0FElUKdb17S/
 JbHfD2pFgfoUy1EYeLr1ts5r7bbMYsSSJ7MaGtuhEF/ezFo3xI/kqvJrNXgie/FgfPuD
 aR2A==
X-Gm-Message-State: AOAM532zR+LBfs/zXpg9+M6DO0xe+6hK3ELpFmEZIb8/IM7CTZYywCta
 Zbd5xZusIXEMDNJBuMm6I1o=
X-Google-Smtp-Source: ABdhPJyTJ6heTwc18DWLZtpc7GsMGt5Rj7BWVo0IfKbe2Hg+i6+YNZKigBjq128BppGjKTD6NrYtjA==
X-Received: by 2002:a63:c008:0:b0:3fb:793:73b7 with SMTP id
 h8-20020a63c008000000b003fb079373b7mr19937465pgg.266.1653935377325; 
 Mon, 30 May 2022 11:29:37 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a170902690800b0015e8d4eb2e3sm9427672plk.301.2022.05.30.11.29.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 11:29:36 -0700 (PDT)
Message-ID: <74bd7e0f-807a-f43a-a282-d6d4db2a39e7@amsat.org>
Date: Mon, 30 May 2022 20:29:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 11/17] hw/sd: Add eMMC support
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Cc: Vincent Palatin <vpalatin@chromium.org>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Joel Stanley <joel@jms.id.au>
References: <20220318132824.1134400-1-clg@kaod.org>
 <20220318132824.1134400-12-clg@kaod.org>
In-Reply-To: <20220318132824.1134400-12-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 18/3/22 14:28, Cédric Le Goater wrote:
> The initial eMMC support from Vincent Palatin was largely reworked to
> match the current SD framework. The parameters mimick a real 4GB eMMC,
> but it can be set to various sizes.
> 
> This adds a new QOM object class for EMMC devices.
> 
> Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
> Link: https://lore.kernel.org/r/1311635951-11047-5-git-send-email-vpalatin@chromium.org
> [ jms: - Forward ported to QEMU 5.2 ]
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> [ clg: - ported on aspeed-7.0 patchset
>         - HPI activation ]
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/sd/sdmmc-internal.h |  97 +++++++++++++++++++
>   include/hw/sd/sd.h     |   9 ++
>   hw/sd/sd.c             | 205 ++++++++++++++++++++++++++++++++++++++++-
>   hw/sd/sdmmc-internal.c |   2 +-
>   4 files changed, 311 insertions(+), 2 deletions(-)

>   static void sd_instance_init(Object *obj)
>   {
>       SDState *sd = SD_CARD(obj);
> @@ -2162,10 +2338,19 @@ static void sd_instance_finalize(Object *obj)
>   static void sd_realize(DeviceState *dev, Error **errp)
>   {
>       SDState *sd = SD_CARD(dev);
> +    SDCardClass *sc = SD_CARD_GET_CLASS(sd);
>       int ret;
>   
>       sd->proto = sd->spi ? &sd_proto_spi : &sd_proto_sd;
>   
> +    if (sc->proto) {
> +        sd->proto = sc->proto;
> +    }
> +
> +    if (sc->spec_version) {
> +        sd->spec_version = sc->spec_version;
> +    }
> +
>       switch (sd->spec_version) {
>       case SD_PHY_SPECv1_10_VERS
>        ... SD_PHY_SPECv3_01_VERS:


Instead I'd use:

-- >8 --
@@ -2301,14 +2297,26 @@ static const TypeInfo sd_info = {
      .instance_finalize = sd_instance_finalize,
  };

+static void emmc_realize(DeviceState *dev, Error **errp)
+{
+    SDState *sd = SD_CARD(dev);
+
+    if (sd->spec_version < SD_PHY_SPECv3_01_VERS) {
+            error_setg(errp, "Minimum spec for eMMC is v3.01");
+            return;
+    }
+
+    sd_realize(dev, errp);
+}
+
  static void emmc_class_init(ObjectClass *klass, void *data)
  {
      DeviceClass *dc = DEVICE_CLASS(klass);
      SDCardClass *sc = SD_CARD_CLASS(klass);

      dc->desc = "eMMC";
+    dc->realize = emmc_realize;
      sc->proto = &sd_proto_emmc;
  }

---



