Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC3032DB1B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:21:49 +0100 (CET)
Received: from localhost ([::1]:47590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHuTk-0003iq-N8
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:21:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHuPD-0001MY-My; Thu, 04 Mar 2021 15:17:07 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:37015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHuPA-0005lK-4X; Thu, 04 Mar 2021 15:17:06 -0500
Received: by mail-wm1-x32e.google.com with SMTP id m1so10915793wml.2;
 Thu, 04 Mar 2021 12:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eFc7El+FF+SQLUq+oEkeG+pA7TfRc3cJcwWvcGl2gfg=;
 b=QMVweet29o7eDU+9DEO6QVaOOFAazGVOULZ3+6TXR51JrK9qBDpGHt+OtqJKiiP4Wk
 f7jN/LVVI0UhmffmrlvEblKrCyPDRRJPN0vk3GIo5OPgp421VDWrzjSnEfxFGrWW/wOI
 g2Og1ixfOc6krElZSBtGU/HGMQp7ILb8csoBJtjPERF+L19Q/fWSQVSC2FBZU4KcjNOu
 nqjnLSIPiPxNeyyEVWGi2Wnl3/eS10KNxxanBlGRcLKt2Mm2UaMfjUuiN58vWP8V3vHr
 NSpU7PVxRCTKiuXkfUNJGsVAiQqoVvzbYWpxKuL6vxyT8kLFYjDnZB16O0DiJOSLBD9G
 w/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eFc7El+FF+SQLUq+oEkeG+pA7TfRc3cJcwWvcGl2gfg=;
 b=hnXih2Jr6WCEbHtBaUdIQSAohWMow5TeLKVMUKvyKS6xBjXm8AHTG22qqHsf7cSXRR
 YJkB0134zyUqwGZEN8rlPGdFyWVGM7HkJpQq7pg8EbZwN6LKxnjtsl/JNnUs0+LsZTpV
 TEWZkTD7DNO1Sf7S39yNVR5z1De0bvmv3uIsWNVzVBfwpqXzNo+Qj5rATB6bteCPoeEC
 Lf/2u2NNB9bNKwiatNL7xgeiezu9Uyj5qtglnSbpidMYW7MulD0oGcXMWeZ9m5okEdLE
 e9qxl3KeWJm7VuAtLCQjxFhjq2x/GY45f5K4zS7sMPgf+UmbjulqNreaJYkBnkhRsbo4
 9x2Q==
X-Gm-Message-State: AOAM532XmJNSXYGtLeTSRDM3hwYrldJvnMM8kuLNMkLKqqbCsbrWkblQ
 MIOdJ7oreqlZaWpb9BPAju2FFMzAmLs=
X-Google-Smtp-Source: ABdhPJwMkY8yw/zL/zNnUr9ilBpSkOxSFyE6ZkI1c/cyP+8oheRX1f1vVDNdBcirr6oh7nofkruXBg==
X-Received: by 2002:a05:600c:2512:: with SMTP id
 d18mr5420521wma.55.1614889022107; 
 Thu, 04 Mar 2021 12:17:02 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g1sm502387wrq.30.2021.03.04.12.17.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:17:01 -0800 (PST)
Subject: Re: [PATCH 41/44] hw/arm/mps2-tz: Make initsvtor0 setting
 board-specific
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-42-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <aee0208f-cc8a-205b-3524-3369115fc468@amsat.org>
Date: Thu, 4 Mar 2021 21:17:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-42-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 3:46 PM, Peter Maydell wrote:
> The AN547 configures the SSE-300 with a different initsvtor0
> setting from its default; make this a board-specific setting.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/mps2-tz.c | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

