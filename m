Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A91656BE5
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Dec 2022 15:33:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAB06-00046D-H3; Tue, 27 Dec 2022 09:32:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tudor.ambarus@linaro.org>)
 id 1pA3VI-00049o-Aq
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 01:32:00 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tudor.ambarus@linaro.org>)
 id 1pA3VG-00030A-Mp
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 01:31:59 -0500
Received: by mail-ej1-x62a.google.com with SMTP id t17so29972807eju.1
 for <qemu-devel@nongnu.org>; Mon, 26 Dec 2022 22:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=boSTgo8avblyAnpJfjmZFtDtWHK2Dzzg/JPbsPnGYtg=;
 b=PPY1hEETf1GOUz7XRjE8eyFsuIPgJo7FAgcH50sdPuUj1RRWlQLG7eU6Up6IQ6HfQ6
 1YoIZdT6LhnKdGG8+fYn5erVc3Gxhi7HpWZXxelUalzRLK/07z9zLlfGsUj6lLZXVVmF
 BSm5T3AvuL0DhhkHzpDT9+Vs8fduTxz8gyehQTvptCfbsuKOQtkolS5M9PQh/S3n6zzn
 b9z0EJ8n+Me5785p+oBA6LuURfTci1oIaJfONuE4WlPvnrmbGpmakJT2UQhxSNnXB9sk
 RpqjvZ2skw1YhH6qfearfnljwwiArVJZm8SOdrCTPjfIXHrtIJFEkaEssjufF7JD/6s9
 ZT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=boSTgo8avblyAnpJfjmZFtDtWHK2Dzzg/JPbsPnGYtg=;
 b=Jnj2ohGEwP4vzYeLF1zFOAds6OCZIyVZo5T628kxNXF9Nj4VNWe/KSVHH1AoBMVCb9
 C40s5+zPHA9svgGtszMJ2MRUTceMMvmmKNXbF5o+aupHTCb1LYdpiHCEMeW3LWvVd5A1
 dqtG4xgAkR03tUMGQTXdStRz4WDReNnzCb++1ru+ONhaHlHtQ767aOhFYRJZs9wXoRLx
 dPO7ez8ub1PZ/HPcoOlSnaDtFK/ZgkM2MQ99cCNoK/+k+aSazeFZ6LxgCiRTfEoxwOFY
 6+62h+APuyZH3Au5ECfXUljt5+3APJI186SmrG748V2H4ykeP9yUb2x28t/+EWxyPj5W
 ZmbQ==
X-Gm-Message-State: AFqh2krynpUMR55LkMlrGRwhadvQA2jvpn0uz78wK5ov0uQrWlVIXgWF
 iclishNJCKEksVGvtioL97hkVQ==
X-Google-Smtp-Source: AMrXdXt1EuQAwu78BN6SUwyqgZI3DqqGisONpL7bHtUL+zxy+yE+2XN9terMNrL++mg63J+m1loC/A==
X-Received: by 2002:a17:907:7e9f:b0:7c1:7d81:d2a8 with SMTP id
 qb31-20020a1709077e9f00b007c17d81d2a8mr20655752ejc.3.1672122716336; 
 Mon, 26 Dec 2022 22:31:56 -0800 (PST)
Received: from [192.168.0.104] ([82.77.81.131])
 by smtp.gmail.com with ESMTPSA id
 gf26-20020a170906e21a00b007c0b9500129sm5653264ejb.68.2022.12.26.22.31.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Dec 2022 22:31:55 -0800 (PST)
Message-ID: <b00bb842-a9e6-fa5c-94d9-876c241be600@linaro.org>
Date: Tue, 27 Dec 2022 08:31:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] m25p80: Add the is25wp256 SFPD table
Content-Language: en-US
To: Ben Dooks <ben@fluff.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Michael Walle <michael@walle.cc>
References: <20221221122213.1458540-1-linux@roeck-us.net>
 <2236d0ee-4fc6-5e2c-95b4-f97639e0955b@kaod.org>
 <20221225121850.4bjnskmlhsot54cf@hetzy.fluff.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20221225121850.4bjnskmlhsot54cf@hetzy.fluff.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=tudor.ambarus@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 27 Dec 2022 09:32:14 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 25.12.2022 14:18, Ben Dooks wrote:
> On Wed, Dec 21, 2022 at 06:36:02PM +0100, Cédric Le Goater wrote:
>> On 12/21/22 13:22, Guenter Roeck wrote:
>>> Generated from hardware using the following command and then padding
>>> with 0xff to fill out a power-of-2:
>>> 	xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
>>>
>>> Cc: Michael Walle <michael@walle.cc>
>>> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>
>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> 
> If SFDP is a standard, couldn't we have an function to generate it from
> the flash parameters?
> 

No, it's not practical as you have to specify all the flash parameters
at flash declaration.

