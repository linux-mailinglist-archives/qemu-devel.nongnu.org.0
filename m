Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B914312A5
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 11:00:06 +0200 (CEST)
Received: from localhost ([::1]:45794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcOUy-0002xn-Gw
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 05:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcOTL-0001Jt-RG; Mon, 18 Oct 2021 04:58:19 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcOTK-0001Dc-GM; Mon, 18 Oct 2021 04:58:19 -0400
Received: by mail-wr1-x435.google.com with SMTP id u18so40090226wrg.5;
 Mon, 18 Oct 2021 01:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B7PZu9Ahb8gb+bA346ZFbHFjascQVf52lha+yTBf0JQ=;
 b=PMk9XjBRtl/r8Hl495dKARsTVV/XeBPYHotFOB7uAZi+YomttU08mFWUz41kUAZ1BF
 meIpuzOeGx6kB/sn2p4aunjUiIYOEkD2Nje4Y/bdGSSSeg0V4GLNU5MsRaGmP+SsCxmL
 7pTUMdQy/Tf/RxoEhefBXZpvaFbQQoDNVPlsjS1VALBCm7Uj8QIt9AmQ7eYZaHPSFzZq
 vUuRHzekeb/tsUiHXbDFLuyv00p1tVUxxU8rGUfNV6gSmgqXmU0b6oLSBxcnaDQFrFPb
 wTgjZExI7K4uLpTAEUWvsQwNKXq2cpvwlHKfaaD5NiPq7OmzHtM9vKSymDd18vXxi7hH
 TbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B7PZu9Ahb8gb+bA346ZFbHFjascQVf52lha+yTBf0JQ=;
 b=RcKMpJS+8xOw3gj3j+n6ACv1D8afZuJCtwVyRkBgA8Oy0qu0Ft8KOdYtYriNmbISou
 QCySxC2Cvgb1rhmdhLr7p4DGpi4pnz41OWHDDaDecJqrg4Wo607Z9jH0sIHsIAcmHuh6
 rFBQw7lpFB2kkO8cS9y8UODYOb5mr8HdlD3a/JJr2YmiNj3XT6wAOtChHcj9/kNsRIh0
 9HuWmV7h/lnTYbpC3qVwuxes3jUYGzn8fUY1Z4peD9AOTRUM1nFN475hIjBeSbj79PXh
 zg1GmRdyqG0Qb+mrkD1PqtxTujOk7U7ZcOgQr3mOP7GrV/zyXj+L+SRiYIwzDBC7G0JS
 XxVA==
X-Gm-Message-State: AOAM533AVqWLkdShp//IUewE71CfwB5g+t2UXC59Cobx+uGmr1n+ntur
 U6ZHMbpPjrzzY0WLjHJtsAE=
X-Google-Smtp-Source: ABdhPJzDSd9DCf9F1JzFfXuC/h/25G6P5MJwjy2LCZLt88NwwkIC53dDbmp9WT+B85pdcJfgoNIA7A==
X-Received: by 2002:adf:b1c5:: with SMTP id r5mr33843836wra.357.1634547496719; 
 Mon, 18 Oct 2021 01:58:16 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id q204sm17977152wme.10.2021.10.18.01.58.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 01:58:16 -0700 (PDT)
Message-ID: <f62220b0-9e00-aafd-c7f1-3c64d9204d2e@amsat.org>
Date: Mon, 18 Oct 2021 10:58:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/4] aspeed/smc: Dump address offset in trace events
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20211004154635.394258-1-clg@kaod.org>
 <20211004154635.394258-3-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211004154635.394258-3-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/4/21 17:46, Cédric Le Goater wrote:
> The register index is currently printed and this is confusing.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/ssi/aspeed_smc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

