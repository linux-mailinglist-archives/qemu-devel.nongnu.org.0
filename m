Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF8943CEA5
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:22:04 +0200 (CEST)
Received: from localhost ([::1]:50020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mflgh-00082L-UF
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfl3J-0006Wm-B6
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:41:22 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:53181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfl3H-0001q3-Hk
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:41:21 -0400
Received: by mail-wm1-x32f.google.com with SMTP id m42so3037644wms.2
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 08:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FMk50lKfQM1mDKuy10nO9KEq/tYBcMKOpTfx1qp4e+s=;
 b=VXDT7QG1K+w/WRzXK2TuYZodsZdk0NCD32sy2whpPPJtofjDnfVfsAnbKgAteMkvS8
 jgtVDa72Wg48JvUreQO2xIpByZD/95rMS67W+jZeKTdeyHNCzePRxpcfiI60upWN6HB2
 vFO1D5MQrOQnCwQ5os7m01bmjHSqhTAd4ORa1AP/RHuEkd2L74WpCPFLUFvpFw0vcKk6
 xfLi8TgiV0BRK70nQQUU8V6I1F3kVeo35/r4slLutvr13ra6ZoLxdSiNYbTL/iMmrfWq
 yIluz0TyjViL9E2n3Hv8T8Zc1V+gSLRTpb+kErddAAVE9zlwoLp9ruhUY6EOzOnn+RXl
 noPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FMk50lKfQM1mDKuy10nO9KEq/tYBcMKOpTfx1qp4e+s=;
 b=ROJ0Ge085rGxEOIgMe9Vh250KC3YP9mevlp3efu0dG+d5oc6yOeO2HD7D20yo5kXnl
 dQaSNNobY2u0mv+FekTIj0W06ng3nw5wkd8tK52OlkAQDELsRZ1yJHzuH6JI7EhpyeGJ
 aNphRUGHwNb2MSqG0Orf9G4IfVXEi37EDwfJ3znt5CsQQKe2bbHVTZBOyhktJvUO3qZL
 2uarzRJCOe06Oy5UMK/487k/gfLA2L6FKxyijdDFiFVDiJzNilljnBcWDqUcMhRKMtcj
 eIWHBxhWY+kQ4Hl2O1Uwej3ykhBSbERi2ckkencEC+cvSdaZYcVS/dUCRKHlTUKK8RVe
 zAxA==
X-Gm-Message-State: AOAM533ylxMksn6ytILO9QVjsrhp38Ypjg8iInQS2NV4smGndBUrFhHH
 vepW2DnuB4aPZAUFMgj0NVY=
X-Google-Smtp-Source: ABdhPJyaTwrwNWdHADl5D9N5XEdHTthar2PS2lEPIm26WHLyOskcIehb4feUZJINEdG0YQppwVkFAg==
X-Received: by 2002:a05:600c:1d19:: with SMTP id
 l25mr6568896wms.119.1635349278050; 
 Wed, 27 Oct 2021 08:41:18 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id x7sm3513997wmi.43.2021.10.27.08.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 08:41:17 -0700 (PDT)
Message-ID: <ce659b4d-1be1-db0f-566d-ffa42d3357dd@amsat.org>
Date: Wed, 27 Oct 2021 17:41:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 05/11] hw/char/sh_serial: Rename type sh_serial_state
 to SHSerialState
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635342377.git.balaton@eik.bme.hu>
 <029a0597b27a0f2ed989f5838451269c176b6310.1635342377.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <029a0597b27a0f2ed989f5838451269c176b6310.1635342377.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
> Coding style says types should be camel case.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/char/sh_serial.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

