Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C0B5AC42B
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 13:51:55 +0200 (CEST)
Received: from localhost ([::1]:44752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUoAM-0007f5-5k
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 07:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUo3Z-0003wo-5E; Sun, 04 Sep 2022 07:44:53 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:46842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUo3U-00055j-DH; Sun, 04 Sep 2022 07:44:52 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 k6-20020a05600c1c8600b003a54ecc62f6so4220704wms.5; 
 Sun, 04 Sep 2022 04:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=dqeHMibEuYe+9/CwRlNNfSnucAwEIMW2rkV4WDjQZxw=;
 b=V8K6YswDAF4Wfglh9593lXT+8O51ZtvdC8HXoHK7hipoc/kArEhiv30rVrX/0HBSgS
 53YhxONM8VkohhCn8ppV0adMN4xORJ5p4fE1G5FSdZzynHYAlJNotkg077LVxMZ+T49F
 my867WlgMp+G1tVmrvc5Jdc7ffD5ryWpMXjYgrMico9BLbrIFuzxksgic+4y1OGytrig
 8ZPJvXxBq76KJjCGjbWhwGG7De5oO5v7LvZmva9qyX3maVL/+tsivJg4oXk4ohn+7kMn
 HRPSoV0qUlBLFK2Rn8kzmzS+uD6+aYS945uXsbSAVdOxeCrFaIgitKpxj2hmPlTWbEAv
 D0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=dqeHMibEuYe+9/CwRlNNfSnucAwEIMW2rkV4WDjQZxw=;
 b=NNfKjtyJh5OsQh6/Zl3JH324pf9g7Mh4o43wqDCK+qpe8TiQFFcWkawL78Nz2pXdF5
 Bk5ZHjVkixefvUVcPLsjEJqMZsQGu9eLitYmIv+zZwL5rj2WGk37iJILm9SigHJr3qdf
 h9zjDzN8CB4ngiXMsJYsxjIhL5z+tOqFLAu2B9rypb4zgtga7daQTqv2YTDYHUFryBse
 BoZXDh0MHtnuHT+4O9uwT/J8dHKXDC/Z4JGIQkLPDdZ1FdBhT5gtz3T+uihZMiZI09rT
 8/yAe7EN4I44GGagRkr/he6uUzPbEvg9Yp578z4eTxCOuwf0EOUdEvdOzBEwy74hRBLC
 U86Q==
X-Gm-Message-State: ACgBeo2b5p8wO5GGMTNgtOjuGshMOlwDR0/JXthHwESZ5X/SWbYHBKrW
 xb49c5Bixi85kFBsJxqvkNo=
X-Google-Smtp-Source: AA6agR6qHAqlXAe3bcwMe1GkV61+BbCNL0Y2S+uFNvBxnoLKQHPFdzOWPBkw9bc9be3k+431jqIwgA==
X-Received: by 2002:a05:600c:354a:b0:3a5:bd8f:c2a5 with SMTP id
 i10-20020a05600c354a00b003a5bd8fc2a5mr7730142wmq.142.1662291886049; 
 Sun, 04 Sep 2022 04:44:46 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g26-20020a7bc4da000000b003a54f49c1c8sm7585019wmk.12.2022.09.04.04.44.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Sep 2022 04:44:45 -0700 (PDT)
Message-ID: <67f2e9de-d052-3122-4800-8b5189777464@amsat.org>
Date: Sun, 4 Sep 2022 13:44:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 02/20] ppc4xx: Introduce Ppc4xxSdramBank struct
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <cover.1660926381.git.balaton@eik.bme.hu>
 <ba17808e34e7515addaf3e9e897c714b6069350f.1660926381.git.balaton@eik.bme.hu>
In-Reply-To: <ba17808e34e7515addaf3e9e897c714b6069350f.1660926381.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.978,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 19/8/22 18:55, BALATON Zoltan wrote:
> Instead of storing sdram bank parameters in unrelated arrays put them
> in a struct so it's clear they belong to the same bank and simplify
> the state struct using this bank type.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/ppc440_uc.c      | 49 +++++++++++++++++-----------------
>   hw/ppc/ppc4xx_devs.c    | 59 ++++++++++++++++++++---------------------
>   include/hw/ppc/ppc4xx.h |  8 ++++++
>   3 files changed, 61 insertions(+), 55 deletions(-)

Good idea!
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

