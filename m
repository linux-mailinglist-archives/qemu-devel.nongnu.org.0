Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0324355AA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 00:03:21 +0200 (CEST)
Received: from localhost ([::1]:39044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdJg8-0001yB-Gt
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 18:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdJeg-0008ND-A3; Wed, 20 Oct 2021 18:01:51 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:39737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdJeQ-0000OT-Av; Wed, 20 Oct 2021 18:01:49 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 y22-20020a1c7d16000000b003231ea3d705so551771wmc.4; 
 Wed, 20 Oct 2021 15:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aoIJUIH6+SlNtpmF3+8UXi0WP7pb8u3j+yh7IP3ST8w=;
 b=XP4+Hyv69QGmkcKgMuIsLykpVMRbQoS/8O+YacTWK7iXn3RV2zF7SbAO/SI2oBlaLY
 KAFOahNOFokoBY/5HE9uexEKGbBg60Du+SawwT21Qk6rk/KsaOkQZHwnttSq11EtclUg
 CZ/DIxPg+sGAjnCeGFgleiLGXmN0QKSjqfb37SU1ZjnPr6hOgQl03/ZeqAjg9Dlsbacn
 KpoTlkE1JfgQISTz48pZ8VsvgmJkp1NBBgkVQwxUXpXT+fMsDErHPHGGWYWOrXSgP0XF
 N/y7hZ5uAeHWEjVipa4XlntWzo2UaaU8YJE8+b2ehf3UUcfwJKXxgnmEVceNL3Bqp09r
 f/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aoIJUIH6+SlNtpmF3+8UXi0WP7pb8u3j+yh7IP3ST8w=;
 b=pfwoO5SwM/tkf8NWAbgkZHgMYaoafewReJbHS+FatSzoKRm1s8OOHE3y6PItiQEXwV
 4VlV0a7hExUR78wV8W3wCe+qD7x+sm23OCFZs7iENrBJumvWui8nABEpqJwc0JwTVbij
 9HPpEtPd75cTcFRXRaywTnIlTrU05es+4LwaIhTrMp4+GBDPa5Ns2xgaH33b065p4R9w
 QLiCJCzm88rlQcJZC7mypNBKIWBvi/H84881cGG6gQMuA4FQSnbRYb2k+q17YQg1G4FW
 xeLL3A1KyflXLVh2VKP5JXAGDA2JRVPAYep8DzgI/8uLazgQnose4I/Le+0VPhT50QiV
 aihg==
X-Gm-Message-State: AOAM530s0gVBoFfGcQYzBwf4w5iD74+HWtP/ct+oTXEAQ99cpIenRG5e
 SebMxhPthcMs2N7fgKJDNjk=
X-Google-Smtp-Source: ABdhPJzdbF16WlHzRMH4jK3RbeYWiFta6V0c15SUf2QANKDF+6ShLgZ2rRO3bC82bAcJtkOh5bAkPA==
X-Received: by 2002:a7b:c926:: with SMTP id h6mr2056193wml.133.1634767292725; 
 Wed, 20 Oct 2021 15:01:32 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l20sm6795614wmq.42.2021.10.20.15.01.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 15:01:32 -0700 (PDT)
Message-ID: <70220463-2177-801d-b85c-2e4a4c15c267@amsat.org>
Date: Thu, 21 Oct 2021 00:01:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 5/5] speed/sdhci: Add trace events
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20211018132609.160008-1-clg@kaod.org>
 <20211018132609.160008-6-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211018132609.160008-6-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.267,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/18/21 15:26, Cédric Le Goater wrote:
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/sd/aspeed_sdhci.c | 5 +++++
>  hw/sd/trace-events   | 4 ++++
>  2 files changed, 9 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

