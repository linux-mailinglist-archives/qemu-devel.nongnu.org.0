Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2388A538750
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 20:31:42 +0200 (CEST)
Received: from localhost ([::1]:34268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvkB2-0005fC-Oa
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 14:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvjNf-0000C6-FP; Mon, 30 May 2022 13:40:42 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:46848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvjNd-00054G-Kp; Mon, 30 May 2022 13:40:39 -0400
Received: by mail-pf1-x42e.google.com with SMTP id j6so11064364pfe.13;
 Mon, 30 May 2022 10:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fsjL9jyPpQ6LCmLFCrwYCqtM2ZVnjgs4WTjxA9p/ilA=;
 b=Yn16/tv94zkVPQJ3DEd0C3/iByhrvAPvvsUB2JsMRIvHb633VcNVJL7Cn2D2DZoRdx
 9Ev/nmyMc1dHPj0ZfAgqg77erJvfXmR4fK4WhquNq7XM15zHaiTKCReBkcOJTHT4DrPc
 x1Kak494pgac2dW7mHHHKGwhRg8yqyOAzA4AyYFT/3mL12kJAlRGTieiaKzd6WEaq67E
 BLPxmTo24eMGkxczsP9ixe6J1CwW6A9FtjaymuUgGOSrvznza5r4YZGlV7QtmAxnn1Yq
 RIh17u59F4UKHJ3UTS/eVEenbBmWCCko+BhQoEmuQKMvvuqSQbVEylKMP/TaCurggWc4
 Eqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fsjL9jyPpQ6LCmLFCrwYCqtM2ZVnjgs4WTjxA9p/ilA=;
 b=N1JQTFzo2oDLuAu86k+PeNplVJb71PMW7EdoIGnfn75SKfoy00JG6sv0L251hQB0CE
 DVyE608offpyFof6Ehz6T6isRQevVauSQs3O1bNSxxrQRp1Xr/ML48N4+CmSXu0WriQF
 FyGxdYy/UGwX5pODQLiRyg1jQtP6+XQQDUN3QKfmJRwBZQoANYigvR0DkrvDZPhN5Sn+
 EesIOaZyU0s7iu7beUq9Qb8XAazbr19JqdEa8ssL+bBrhWtKIPkLJYzjJd0/u+7nttXZ
 oHiBV9UNIqkDPuDvFs+nXtDQbXshnEkHzzH/UcHWKZApQYNAm4G3rH+QrDpuCtLQiw3I
 0+bg==
X-Gm-Message-State: AOAM532DQ/voRvkyLZCN8xafK3Hce/KS2UbmAtkoUtmUjVOD6R0Uav8T
 S98BPBpiNoHaweMUgWDLQqc=
X-Google-Smtp-Source: ABdhPJwrcLgDvsmWm/VJvMogCI5iDxPqvTwTx/4z+Siwkq3FRydMltuG3w6AcIQqeGLzIz66oFzwIQ==
X-Received: by 2002:a05:6a00:a94:b0:4fd:c14b:21cb with SMTP id
 b20-20020a056a000a9400b004fdc14b21cbmr58003786pfl.53.1653932435766; 
 Mon, 30 May 2022 10:40:35 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 7-20020a621407000000b0050dc76281bfsm8991880pfu.153.2022.05.30.10.40.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 10:40:35 -0700 (PDT)
Message-ID: <bd3df6e1-62f9-04b6-f288-b12e6860ddaa@amsat.org>
Date: Mon, 30 May 2022 19:40:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 11/17] hw/sd: Add eMMC support
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Cc: Vincent Palatin <vpalatin@chromium.org>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Joel Stanley <joel@jms.id.au>
References: <20220318132824.1134400-1-clg@kaod.org>
 <20220318132824.1134400-12-clg@kaod.org>
In-Reply-To: <20220318132824.1134400-12-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42e.google.com
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


> +static void emmc_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    SDCardClass *sc = SD_CARD_CLASS(klass);
> +
> +    dc->desc = "eMMC";
> +    sc->proto = &sd_proto_emmc;
> +    sc->spec_version = SD_PHY_SPECv3_01_VERS; /* eMMC requirement */
> +    sc->set_csd = sd_emmc_set_csd;
> +}
> +
> +static const TypeInfo emmc_info = {
> +    .name = TYPE_EMMC,
> +    .parent = TYPE_SD_CARD,

Hmm this is odd to have the model inheriting features from SD_CARD but 
then behaving differently (one could enumerate QDEV objects implementing
TYPE_SD_CARD then use them expecting they match the SD card protocol).

Why do you need to have TYPE_SD_CARD as parent?

Could we simply duplicate sd_class_init() assignations instead? That
would likely make it easier to modify eMMC handlers.

> +    .class_init = emmc_class_init,
> + };

