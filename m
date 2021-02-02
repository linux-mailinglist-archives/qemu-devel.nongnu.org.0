Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B1330BA17
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 09:40:24 +0100 (CET)
Received: from localhost ([::1]:43660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6rEU-0003qm-NZ
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 03:40:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6rDH-0003FE-2y; Tue, 02 Feb 2021 03:39:07 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6rDE-0004Bk-S5; Tue, 02 Feb 2021 03:39:06 -0500
Received: by mail-wm1-x335.google.com with SMTP id m1so1502331wml.2;
 Tue, 02 Feb 2021 00:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7KR8RtDPhZ7WvgcThnbu5rf/VgNmNmDvFTyg63DYfis=;
 b=oq1qWUK7UI2agPP0hgl4g8lz5B5PRaBnivuFtKJRQJJjZa3Ywk23KiRG+YfqRae50M
 AVg5z6pwEivvkOMAQ70J7A+KlpQll3jfA4PhkWQWzyouY9rLjTB72k5v+E3PuVFpHv7m
 zWctwXicnU5wZWp2rwJjgp1wd8nLNsXpjSJz8sCjFQ67vGMR6AovL6a96qZ0Ve0ZTPh+
 UO6qHOmDbl46OalegA1Wrpw7OUd7jCB2ScWP6YmH/J6OCbc5xmzBdzSYuBSE7YkXIYXc
 EEOiSf7WmDBOfcJvEF7wAYWd8tgqwvoOgz47UZ3GJ/413A8Va1h9A14o75h018ZaiQcq
 rQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7KR8RtDPhZ7WvgcThnbu5rf/VgNmNmDvFTyg63DYfis=;
 b=LGbbUZgZ3rQ6lavbTGeA998XefPKV02Of5uGOP2iF2CCGgUkMzJlIM3Od8D0pLP8h+
 CFGHKZ/5qlUfK9LpOB1PwXD5hc68CPP8ICmtl+GYzIIq1j1GMQhC+AeA7ilyWgTguKgU
 jJaciFT19/3vDO4JuextKzsU6m/taz9JHlYnyhyPJCbVcHeVue1C+kYW4sJ7x6rHUZMy
 yOx2lQYWQOOB8gMZT84ZHMi8Rhd7MGGJSqlfpJXqROAZt1PG+WEsg14GQVDuJsEiHoHn
 AXYbB24Y86qjgsy7lwZtfFbJBteD6JyVHv03rlWtuI5OfGPUVTY/5Rh0ISPmTcBXhant
 0G9w==
X-Gm-Message-State: AOAM530iQ80JYjcbxSNyV8Zz1pcNzWBqfOthXeVRq8/y5lgFjzZ0/bh0
 dNOF4Qbmb4/d23ekit59IEFWxw6BhpQ=
X-Google-Smtp-Source: ABdhPJykmAKfIBIzhZIYjjPFeO5DcpoGdoGuRKtHWtzUhFY0q1aE9UBOY3yZnsEME7bqELoMolF1xA==
X-Received: by 2002:a7b:c4d4:: with SMTP id g20mr2511256wmk.144.1612255142023; 
 Tue, 02 Feb 2021 00:39:02 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id 9sm21704166wra.80.2021.02.02.00.39.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 00:39:01 -0800 (PST)
Subject: Re: [PATCH] Fix SPDX-License-Identifier typos
To: Ryan Finnie <ryan@finnie.org>, qemu-devel@nongnu.org
References: <20210201200147.211914-1-ryan@finnie.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c9e96c6b-1bbe-12e0-2a39-fa4f2d2816a6@amsat.org>
Date: Tue, 2 Feb 2021 09:38:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210201200147.211914-1-ryan@finnie.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/21 9:01 PM, Ryan Finnie wrote:
> Several SPDX headers contain "SPDX-License-Identifer" (note the
> missing "i" before "er"); fix these typos.
> 
> Signed-off-by: Ryan Finnie <ryan@finnie.org>
> Cc: qemu-trivial@nongnu.org
> ---
>  hw/misc/aspeed_xdma.c         | 2 +-
>  hw/misc/sbsa_ec.c             | 2 +-
>  hw/sd/aspeed_sdhci.c          | 2 +-
>  include/hw/misc/aspeed_xdma.h | 2 +-
>  include/hw/sd/aspeed_sdhci.h  | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


