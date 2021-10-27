Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 712C643CECA
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:34:10 +0200 (CEST)
Received: from localhost ([::1]:47590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mflsP-0000vm-JD
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mflGf-00033H-BT
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:55:09 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:52752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mflGZ-00065x-E5
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:55:09 -0400
Received: by mail-wm1-x32d.google.com with SMTP id m42so3072900wms.2
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 08:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=a0Gfjd+DFTfmkC9+wdYR/4VBb2irENfgH4eTcY2JP/Y=;
 b=njJbZePTa5hl0J0g3BUl6GqngDj/2SdkwvHjRbMprCeQGv4VaA6P50AvWwmOnxmPag
 XjXoAiRW/AnCud1OpO34MGY3G0YmnsoWNTJ/rwBRR/DNIVInQ2a7b/vg3stCkIaCYyZM
 zB7my37bnnCfCJMlvRQLqQTwHnVeMMMA7U6nqHgkiciqgq7QgvOTO9Xwl9f5uWqSAkms
 t5mbQBll2+ocBSRiePF3appULz2llL1JMFTDyMGcuNRTGqTTxVE0MMZWNMIkrWU/gbIs
 IyWSju3qf0SIRoAXVkC5xQhpXNOctw+YcMQb/xHKac4IlPsbazl3IQTIVZCoTbuiCDqI
 Bfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=a0Gfjd+DFTfmkC9+wdYR/4VBb2irENfgH4eTcY2JP/Y=;
 b=BgVNAX/YcLJuI7dZE7cXYhi252EO1vDCSoR211uuu3N1UQyGWOysHo39KiV3M+7Apa
 Pfk4vsbSN1nDVCc7r0oDPPuEEkz95HIDECnpQ6fBlKZapZ8GYyqVXoXx8vztI66/yRAK
 i9O603HaGJzJ+NduIRMTDgbZQcK2GGUtNeV2qfIp0PhB08E3SvBIMt4wuzRd2vPF8Spp
 6iGocR0whRK66Tqylo9Q5Oabl8CfVCC37hdzhQXcLNrUwkkyISuHBq1ll+vZl7eLTMEV
 shab1ySZTQuuzarqzz9WcVh07wQF/RRkdZW4+v8klFs0yFPezKsY6sjpgjaMXyqU/kaL
 e0/g==
X-Gm-Message-State: AOAM530H6lTuKGV5v3fR2hGhzlIn2im68UmmL6d+JXtSAkcZh+itWhrZ
 yTPyx/fTJdbum4dhshN1bOM=
X-Google-Smtp-Source: ABdhPJyrydL1VopNQKwpUUpJH3wfAwniwIJ1tYwVNz1mVr3xbHLXTJ+i19vZCuR8bC4JFIw8RnoBaA==
X-Received: by 2002:a1c:f:: with SMTP id 15mr6820045wma.66.1635350101072;
 Wed, 27 Oct 2021 08:55:01 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id a2sm246718wru.82.2021.10.27.08.54.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 08:55:00 -0700 (PDT)
Message-ID: <80c210e6-f469-2bfe-0efa-b0ac3b1a0528@amsat.org>
Date: Wed, 27 Oct 2021 17:54:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 04/11] hw/sh4/r2d: Use error_report instead of fprintf
 to stderr
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635342377.git.balaton@eik.bme.hu>
 <47e3807e2ee28531668379d9a9826e6d6c0f73f5.1635342377.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <47e3807e2ee28531668379d9a9826e6d6c0f73f5.1635342377.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 15:46, BALATON Zoltan wrote:
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/sh4/r2d.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

