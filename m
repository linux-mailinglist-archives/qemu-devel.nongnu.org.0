Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9DF601B05
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 23:09:35 +0200 (CEST)
Received: from localhost ([::1]:56852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okXMc-00019J-Ox
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 17:09:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okXJ1-0003Wg-V1
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 17:05:55 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1okXIy-0001aB-P5
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 17:05:50 -0400
Received: by mail-wr1-x435.google.com with SMTP id bv10so20419874wrb.4
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 14:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NF2CjD1sTffiqG8cR0LNgoNBcMtRKuvDEuphPp5k3VA=;
 b=OIIZKfjJWA189xMYmGnoy04bSgkQDLvjeUffVYEm1TOR47vpfgJrq01NemyVfHFsVD
 h7NitmbIj/tBgf9F3J29QgAlIAYCAUYwquq+tO0WqSbIiBIzYweN2vpYXiqUXgz5blmm
 iHn6EzF7ztqclCuAHafGMgyYVnk/iHSRnxw+7TLHFSYQ3SuZBiDi2CAFujZt0Gj92dUf
 m5RxEmISIl1hRSG/fAf6gLERkwcg2KwnPSLPI0sFkfRT0h5Z8LM8/pP5PyLSHJE9RuZH
 jJ7l4jYkU46KF6Ruob67Es3gndgXOrSTNoGX6BPtW/H0Bf6byUue7ddjcBng2FCYD35M
 6WGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NF2CjD1sTffiqG8cR0LNgoNBcMtRKuvDEuphPp5k3VA=;
 b=Ugh9ruY9eLo7L3u8nd51Lh9WFDTpfIwaVK7nh9+OwdsiyL8dRfrEr9swc4yA1HFDU/
 mKu9gT88lIHfJSBKHYn8Yd69fqu/ESL2Gn1T4IG0sIUFo7vkn1JxF+BksQIOa46XiuHm
 0nmu0R5O0ineBIAVpsgN0z/sfSvroi6+7aTkeyH/74RhU/5dP6ucBUDMFqCpnhE/AuQ4
 3gpvDEmG/5Pze1z8lAVZ6HC8Tap0MwuOMq8MPemYVs5Ea0AIguStvl9dgo/PnMJ0KizZ
 qdcAOod8oBHPV86XrY0exiSXRJjCxBZiZYn5A+tU5wlFTubqnG9xjxk52P2lAupDjcnP
 OY5A==
X-Gm-Message-State: ACrzQf2DB4pk4+Ve2SDAThn9wCddjHQouPO5NGtLl39MZG7WciKb0sc/
 IxoK+cfHOZixC8sPUxHpZnO5NQ==
X-Google-Smtp-Source: AMsMyM7kODA848wxTgIr6FV6MC9Y7odnn12V4ZEGcuRN3HlGp+OhK4yK8Jty19PYp1kvluhDvYSnnw==
X-Received: by 2002:a5d:6c6c:0:b0:22e:409c:90b3 with SMTP id
 r12-20020a5d6c6c000000b0022e409c90b3mr6973223wrz.146.1666040747279; 
 Mon, 17 Oct 2022 14:05:47 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a05600c155000b003a3442f1229sm3440102wmg.29.2022.10.17.14.05.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 14:05:46 -0700 (PDT)
Message-ID: <6b81eb39-836b-914c-934f-4b28cd8dc0f9@linaro.org>
Date: Mon, 17 Oct 2022 23:05:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH 2/2] hw/audio/intel-hda: Drop unnecessary prototype
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
References: <20221014142632.2092404-1-peter.maydell@linaro.org>
 <20221014142632.2092404-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221014142632.2092404-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 14/10/22 16:26, Peter Maydell wrote:
> The only use of intel_hda_reset() is after its definition, so we
> don't need to separately declare its prototype at the top of the
> file; drop the unnecessary line.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/audio/intel-hda.c | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


