Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BD446970E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 14:30:56 +0100 (CET)
Received: from localhost ([::1]:48054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muE4w-0002mW-1y
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 08:30:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muDuv-0001QY-H9; Mon, 06 Dec 2021 08:20:30 -0500
Received: from [2a00:1450:4864:20::42a] (port=37540
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muDut-000136-Ou; Mon, 06 Dec 2021 08:20:29 -0500
Received: by mail-wr1-x42a.google.com with SMTP id d9so22395885wrw.4;
 Mon, 06 Dec 2021 05:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ighAT2auGS4J13x0/RsIeaORbuyVZpSsOmD1mT4F/Ig=;
 b=iWl0RDcYmROeJR04HMMi+b1WVg14gMeilDS9buToeFDT9zkkDzZZ6350GBNDqHqR6Z
 v7Xl12MRfJ+h0u7EbAoww8O91FBrDliH1MOWRkA1uwH4qu8oySE85dMHNJnmm/anG+0V
 FzyRa6KEHKtOz//2VL6th0TBvKJ9zxM2ybenCXD70GPUYuM9SkQnhpcpQZTnO+xG0WtB
 AQewLGdQZ70RvBqpJvRlVuhbZikPdQSMRbpn+MIvx5GaC5sdw4wDC5ZYDWPa4N8GuUEA
 zMkohFQmu9P0EwQSF/KzQyetZMpD1qD+/9eRQEmM/SZa3g2bGk0sYNiBQ9loKNWqYsjQ
 /5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ighAT2auGS4J13x0/RsIeaORbuyVZpSsOmD1mT4F/Ig=;
 b=eV1+FPioz3aPop2nKn7Yzi3U7bUpcNxsOH760Tj6zGXk2gL1puBsooxYDS4PdNbF0m
 GXsBV/5W5xrP7RCpineBY6+ZGv+eq6VSkbS35wDyo2YwCi8HGlr0a/iFCx7Tb8g4eFPd
 MxsOp9ldwP4jt+Y1lHUDhY++X4sd+/WqGIRTx7Tr2hbsYlznnVZhDyA+s4eWEwkC3VwN
 6xS+VPuZdhxc6fnv+wANoNMqgZPi4JHBmYaiLyuVsXTMrfZwx6F3rHBGPaXdtbkd+/I3
 y11xTVjmFhWwjNhwb7HDjCSEkQRQKYQlt0V2igXj6tOv1mLmMFdPPximplhr9Y6ikYTH
 vYyw==
X-Gm-Message-State: AOAM530/TmzgKZScZHT+KV4DRO9itzYGahuusGZCi72x+83JreS+Tgbm
 V1O4uyEF9tHOvTw40RRckfM=
X-Google-Smtp-Source: ABdhPJx9T0PcK/Q3gMKZFzvKTQhcwpsYfYshqVr+p/65bG1Dj2ahQVEt++NAOOtRVtMzfB9R6r4g7w==
X-Received: by 2002:a5d:668f:: with SMTP id l15mr42719068wru.182.1638796826117; 
 Mon, 06 Dec 2021 05:20:26 -0800 (PST)
Received: from [192.168.1.36] (82.red-83-50-95.dynamicip.rima-tde.net.
 [83.50.95.82])
 by smtp.gmail.com with ESMTPSA id e8sm11198636wrr.26.2021.12.06.05.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 05:20:25 -0800 (PST)
Message-ID: <79aa31e6-07e1-cfe6-4cab-3e82e1a65a18@amsat.org>
Date: Mon, 6 Dec 2021 14:20:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 07/15] ppc/ppc405: Add some address space definitions
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211206103712.1866296-1-clg@kaod.org>
 <20211206103712.1866296-8-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211206103712.1866296-8-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.076,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/21 11:37, Cédric Le Goater wrote:
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/ppc/ppc405.h        |  7 +++++++
>  hw/ppc/ppc405_boards.c | 16 +++++++---------
>  2 files changed, 14 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

