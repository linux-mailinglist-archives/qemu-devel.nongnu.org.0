Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DED7866BDC8
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 13:25:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHOXi-0005Rd-Gx; Mon, 16 Jan 2023 07:24:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHOXZ-0005Pp-Qo
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 07:24:42 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHOXY-000242-BZ
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 07:24:41 -0500
Received: by mail-wr1-x429.google.com with SMTP id z5so26249117wrt.6
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 04:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=owx1GxvX7pABOn7kTA/4Lyl/4LpONf/KJwRoErEfOAs=;
 b=A06Whdck4D2qZzFsypsWNg39LRfLMBQ02SIJvhXRSfLJw+mFkNdZJ0scEOw/4gBwJa
 uFSiThfWH0XXHYftDALH0AvYJeWqjHQDlQeZnuggREDnhWpTCahfbnfx18ohjoZxvfYq
 y+lHyhjM6r4Cv6vJQSUxsF3E898joohAA4owxZQGv6S8Jzi/1McnHBXWcCKny6rsV73L
 UV/KexbZQ4elfG4v/1d/+kUXuv8HA5nWSC+y5cr3cz+38RFkgt7yLV3F+OwWXCOJaVJx
 UFlaxF5SGmU5lmmKqkEc89LomcuHTf7HPd4D7zyMM+Tp9ozREEo20N7it6a/PToLmR0+
 BZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=owx1GxvX7pABOn7kTA/4Lyl/4LpONf/KJwRoErEfOAs=;
 b=foY0reaUCMLu6d9Mqmu18LagJrqnvyqDi4jYEGPTSHDiYzkug4BmysrlfO5NRsf20L
 g7HnaNeR3Vt2RVwV1JknYpJQc3lzsnXlpJ0E/9LBXyMAgEJGc6nnkHVjAv3VsKAHIUSu
 ZsiqYU6gyBdHeUAwB7ddLCzproig+xpUgoLT9nye1cbXJI7giX0tLjJdOAModd/C7MdL
 R7WBdlbCIQX2/DFCuzerUr8L7FfRkaPuF5rSplSZ7zVoNlFraROLsB1WRZfJxinFnZzk
 05ss/6QMMtWVhmmPNCKiWhX3xfpB9hq83pMUy/zeP5TA01ttthgiuR2zpojisrg1pNTk
 No9g==
X-Gm-Message-State: AFqh2kpeqTVi7+Qk23RHYlUppMJN51ZvS0Mv0kcl/98o3aK4I7Rl/9iH
 fUzmqnKbXBLbsIj/3MYzw+ZPLA==
X-Google-Smtp-Source: AMrXdXt8EIC33aED5Bk82ULwGZvbzpTDXjm1FOsTb/94Rq4VR14dQ4sRAVM4MOeRF0tCw13WajQskQ==
X-Received: by 2002:adf:ebc1:0:b0:2bd:d34e:534c with SMTP id
 v1-20020adfebc1000000b002bdd34e534cmr10912704wrn.36.1673871878200; 
 Mon, 16 Jan 2023 04:24:38 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e20-20020a5d5954000000b002be099f78c0sm1829269wri.69.2023.01.16.04.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 04:24:37 -0800 (PST)
Message-ID: <a11752e3-b777-649d-9dae-bb4816029d99@linaro.org>
Date: Mon, 16 Jan 2023 13:24:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/6] hw/arm/aspeed: Remove local copy of at24c_eeprom_init
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
Cc: patrick@stwcx.xyz, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joal@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230114170151.87833-1-peter@pjd.dev>
 <20230114170151.87833-3-peter@pjd.dev>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230114170151.87833-3-peter@pjd.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 14/1/23 18:01, Peter Delevoryas wrote:
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> ---
>   hw/arm/aspeed.c | 10 +---------
>   1 file changed, 1 insertion(+), 9 deletions(-)

> -static void at24c_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
> -{
> -    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
> -    DeviceState *dev = DEVICE(i2c_dev);
> -
> -    qdev_prop_set_uint32(dev, "rom-size", rsize);
> -    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
> -}

Why not squash in previous commit as 'extract helper' change?

Anyhow,
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



