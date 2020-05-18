Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 586DF1D72D6
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 10:21:11 +0200 (CEST)
Received: from localhost ([::1]:49764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jab1K-0004C3-DO
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 04:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1jab07-00037O-Ra
 for qemu-devel@nongnu.org; Mon, 18 May 2020 04:19:55 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1jab07-0002na-12
 for qemu-devel@nongnu.org; Mon, 18 May 2020 04:19:55 -0400
Received: by mail-wr1-x444.google.com with SMTP id e16so10685038wra.7
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 01:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sUGxyD3pCqn39kdOLryWobNHkgLQpSK22VX/ahmoU4A=;
 b=rNtxIJHSGlUHXJeQAR1okmoHjMpIKFc6km4y/qM7LCFAHorvoShiVwinO9SLRsC8ZS
 jk/0pZLU7R8MdbYVX+z4xnsL0FLbpVJoDtjdcHsFEA5MKHHdKXbbsU6E4ClXVdEl3NF1
 43HvowxJ7w4YJWpggpeSudsExL3ldlpN1fPoRxieJjUpU9yqiMTo0zUJu5tq4VaCkAs2
 bgYZ5guSfYiF/+SA3INKeOGgeALlhXW+ftKpjzUCDleaiMzqgeUmpe/JsUCR2pzprOaC
 whbjUPuzIg5L51wrRxE2SZKjokKib81lygGtr2v0LgH4SRnQrJsnavVOpAuHmss3P8Ja
 3/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sUGxyD3pCqn39kdOLryWobNHkgLQpSK22VX/ahmoU4A=;
 b=nU3D53QcNOKHLVULX2Umf5KA3WrJG3BIHuWIB82tg13tCGRkqYMpuZbYuO9+Pbc0Mg
 RH8pcgMmH3rTZTyUv3xbDrCorAGD/M9J1O3GmTyVZ0jDhhcmM1xgd0Gb+nL+k7F/VB6H
 2KCq0MBzCdB7bc5J976ewzfMvdjKS0e+HXJz3jO8FryZXjCb+ofAsIgFcWSW2aM9H4su
 hXx1XD7XylQZthPmLZYJT9gOz80lrYQn8bvmutrVp6Z3WPWDRWn/RdwEhuA/s1ln7ccF
 QeQrXURYGdNtVyfRdGVDBzJTxpfysdYowL7uNRdZszL2rpbaOZbCI22trzUCpkFaN6HA
 xuMw==
X-Gm-Message-State: AOAM530O7kCgOocn3FfvdsyXMM/1QTjqANTgnTykBU97P4NnSW+hzslT
 fsq258lPwtGw0AlI36RKvhduIA==
X-Google-Smtp-Source: ABdhPJwj7kBncs+BdbOnpDmJYRA9vL7DLpLLfl/96vqaNR8mEjE5kRzd+Cv+6zJF6tHADpgCsd/pPw==
X-Received: by 2002:a5d:61d2:: with SMTP id q18mr17839844wrv.46.1589789993279; 
 Mon, 18 May 2020 01:19:53 -0700 (PDT)
Received: from linux.home ([2a01:cb19:867e:2100:7eef:23e0:9210:3e8])
 by smtp.gmail.com with ESMTPSA id x184sm15843483wmg.38.2020.05.18.01.19.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 01:19:51 -0700 (PDT)
Subject: Re: [PATCH 02/24] display/xlnx_dp: Fix to realize "i2c-ddc" and
 "aux-to-i2c-bridge"
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-3-armbru@redhat.com>
From: Fred Konrad <konrad@adacore.com>
Message-ID: <d6b1e66a-23be-e38f-1140-9b45618741e7@adacore.com>
Date: Mon, 18 May 2020 10:19:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200518050408.4579-3-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=konrad@adacore.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, berrange@redhat.com,
 ehabkost@redhat.com, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 pbonzini@redhat.com, KONRAD Frederic <fred.konrad@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Le 5/18/20 à 7:03 AM, Markus Armbruster a écrit :
> xlnx_dp_init() creates these two devices, but they're never realized.
> Affects machine xlnx-zcu102.
> 
> I wonder how this ever worked.  If the "device becomes real only on
> realize" thing actually works, then we've always been missing these
> two devices, yet nobody noticed.

I can't tell, but it used to work back in 2016 since these devices were required
to have a working framebuffer.

> 
> Fix by realizing them in xlnx_dp_realize().
> 
> Fixes: 58ac482a66de09a7590f705e53fc6a3fb8a055e8
> Cc: KONRAD Frederic <fred.konrad@greensocs.com>
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/display/xlnx_dp.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index 3e5fb44e06..bdc229a51e 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -1264,9 +1264,13 @@ static void xlnx_dp_realize(DeviceState *dev, Error **errp)
>       DisplaySurface *surface;
>       struct audsettings as;
>   
> +    qdev_init_nofail(DEVICE(s->aux_bus->bridge));
> +
>       qdev_init_nofail(DEVICE(s->dpcd));
>       aux_map_slave(AUX_SLAVE(s->dpcd), 0x0000);
>   
> +    qdev_init_nofail(DEVICE(s->edid));
> +
>       s->console = graphic_console_init(dev, 0, &xlnx_dp_gfx_ops, s);
>       surface = qemu_console_surface(s->console);
>       xlnx_dpdma_set_host_data_location(s->dpdma, DP_GRAPHIC_DMA_CHANNEL,
> 

