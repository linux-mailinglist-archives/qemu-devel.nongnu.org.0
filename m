Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648D533224C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 10:45:47 +0100 (CET)
Received: from localhost ([::1]:55922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJYvy-0005eZ-CM
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 04:45:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJYrK-0000NJ-FQ; Tue, 09 Mar 2021 04:40:58 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJYrH-0002ki-0v; Tue, 09 Mar 2021 04:40:57 -0500
Received: by mail-wr1-x42b.google.com with SMTP id v15so14449715wrx.4;
 Tue, 09 Mar 2021 01:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zVT/Zu11/6lpquaKnNSYtY8M1oQCLdlQlbLtc4Josag=;
 b=ic/JvaGddUFqh/epYb/rGBHn1f71wS6FEwfBURvcPK5fFFs7VUD5cdS3t4tnz/TEpN
 ps74YssowW3GtICnBNzlth7cA4BgiQPwzEVxg8BODl0Avu+yrrQ1ARMUKPg7KRxypjfo
 +D0LD2nBwblMtBFFiyfrx/iuqhjTWrQRo4hIUs281QzYPSJwxSGkeo6qIsNsO0yN+LOb
 fJBzHktL+OKdnwcMNX9D6Pp9z+leJVfhBq1R3xZa6vOuwfBSRTCg/ZjY48F/7iL2aIyt
 GsCDA6PQhGhZnGFuRjzLsV+WoFCGd43n3rhk3uotdqggKOk7H9zAQcT3WntbhA8lyQHU
 CV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zVT/Zu11/6lpquaKnNSYtY8M1oQCLdlQlbLtc4Josag=;
 b=Rmh5+odX0fvneou5zgfQNbZQKiIXr69bC9Z1ahYAfw3FlQAQ28nixadu7HOsc+KbiD
 1jaPeUfZUuW0rG6gMrQqi2/qmxsgov2k+w2Z8zr6/3uRyMjR2tourqxlBWpD90vJisqI
 xLnA31TTescxwKob3n66ucKhg4kJAuZvwEoNzc0tAbtbjCTGcNhc+noSvAO1Q4MeG9p2
 3Z7BAIzOp8IWBsXx7KCT+gQfrLuAx7x6/g1uBxeFhJH4C/FjHBqfMev6zlKNA+VUdZJD
 OeK6N87L52KKrYw9MRKVE45JHra8joLfs7xmT44hjKPFr78Suj/fYhT9tflEVS6/x75W
 00tw==
X-Gm-Message-State: AOAM5325Pt2e6W897WJTjp+2/zNCSgVYhJFc+O9XYj+AHFekctAx6/Aw
 QD43GSwVb1jIrxPUmFOWRW10rrN1zWc=
X-Google-Smtp-Source: ABdhPJxifkuo5JnPFSJGC4LRRmnO9Rdt+cmXay9z/vweD3o/HVzki01nCNcYQ8stexFalo+l2dM8cQ==
X-Received: by 2002:adf:82aa:: with SMTP id 39mr27860381wrc.114.1615282852989; 
 Tue, 09 Mar 2021 01:40:52 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j30sm27250480wrj.62.2021.03.09.01.40.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 01:40:52 -0800 (PST)
Subject: Re: [PATCH 1/2] hw: Model ASPEED's Hash and Crypto Engine
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
References: <20210303070331.70744-1-joel@jms.id.au>
 <20210303070331.70744-2-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ee41e324-501a-2a88-428e-916872736eef@amsat.org>
Date: Tue, 9 Mar 2021 10:40:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210303070331.70744-2-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 8:03 AM, Joel Stanley wrote:
> The HACE (Hash and Crpyto Engine) is a device that offloads MD5, SHA1,

Typo "Crypto"

> SHA2, RSA and other cryptographic algorithms.
> 
> This initial model implements a subset of the device's functionality;
> currently only direct access (non-scatter gather) hashing.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  include/hw/misc/aspeed_hace.h |  33 ++++
>  hw/misc/aspeed_hace.c         | 302 ++++++++++++++++++++++++++++++++++
>  hw/misc/meson.build           |   2 +-
>  3 files changed, 336 insertions(+), 1 deletion(-)
>  create mode 100644 include/hw/misc/aspeed_hace.h
>  create mode 100644 hw/misc/aspeed_hace.c

