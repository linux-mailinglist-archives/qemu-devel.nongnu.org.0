Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 918453B9F60
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 12:55:44 +0200 (CEST)
Received: from localhost ([::1]:37716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzGpj-00053U-Jm
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 06:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzGo0-0003Hx-BP; Fri, 02 Jul 2021 06:53:57 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzGnz-0008Hy-1w; Fri, 02 Jul 2021 06:53:56 -0400
Received: by mail-wr1-x429.google.com with SMTP id i8so12009660wrc.0;
 Fri, 02 Jul 2021 03:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=76AMih/0CdvT88bh+p2rDyuQw/2AO+hwfxP8GDEeKNs=;
 b=LlIZLTUL4F/FaTUooBGWKRYw/O+4KhwCgCvNVtYPkREHnQpCEnHRDmZvS75PyuMuEZ
 s9pyvZeLDe5bcC3s74YZy3eTSX9FigwE5xDqHuTZyd2+3SNGdESuB8Db3TPf4Xkwd7o7
 wC0krl7hrMfsaCtKYKiHEWWOPRVtgXCXX1X0nr32f4UuuBakTeaBv/rDA4LcH9lJZk5o
 kL2DBPELV6PRBft73hEA+HqWhgG2IXuhElP4k2JwgVxe9ovVoY3ZFOM9mMJ0ivRHIh57
 NLXVRadBXBvyBaQWDMoAsY/5m3ZRZu3193V3qCthoA9FPJ8YHYy9EwIy43QVLkAtVSt6
 D9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=76AMih/0CdvT88bh+p2rDyuQw/2AO+hwfxP8GDEeKNs=;
 b=pS0zaPsoJFZe3btFXzFEF+cXjaRnD+hVr6Z7dCFKigADMbsZ7+Q2WBah4RSHcCd0oI
 43AzAuRsLnJqU2r5swcBXJE2srQYOOljGZzORlgNK0AMP4CjnNP4pvkxqNCZr8GYFvQY
 8ayqY0yGXzgEWedJ2ojEXS9io2E2SBpm9rwYH2W4uYI22WgFKyy/k4BMXdO5iWHP01SB
 C9vmwhNUl7u7Xd+zeIC9cl76f1iuq1vEtQY4JS9Mzx/qUO9vCcXy88dzZpWZSqy6pRZb
 SE7WTejzkhGIJ1TwKZ/T7i00Uupqjzk6eHRxMDAzQ4hCvJrHBLqrnRpGgeBR7Awb7v3o
 ytPA==
X-Gm-Message-State: AOAM531Azmj24kp0aJVzzGrMekQGOWEgyPwrUdb/cpyKy4PFaEaNj7xK
 YqX6c/LcY6Z73m2I6dIMb0c=
X-Google-Smtp-Source: ABdhPJzwAJxglpCdgwG6q0MpHAlpSvPtcm+hZOISKjzKvcHVqupvKl8/XeA5QGRx8FelUvZLESzaFg==
X-Received: by 2002:a5d:534d:: with SMTP id t13mr5104915wrv.171.1625223233309; 
 Fri, 02 Jul 2021 03:53:53 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-94.mobile.abo.orange.fr.
 [92.184.108.94])
 by smtp.gmail.com with ESMTPSA id g1sm1088539wmh.30.2021.07.02.03.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 03:53:52 -0700 (PDT)
Subject: Re: [PATCH 02/11] hw/gpio/pl061: Convert DPRINTF to tracepoints
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210702104018.19881-1-peter.maydell@linaro.org>
 <20210702104018.19881-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <26e398f8-0e41-8791-f09f-14dcca6195d4@amsat.org>
Date: Fri, 2 Jul 2021 12:53:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702104018.19881-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/2/21 12:40 PM, Peter Maydell wrote:
> Convert the use of the DPRINTF debug macro in the PL061 model to
> use tracepoints.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/gpio/pl061.c      | 27 +++++++++------------------
>  hw/gpio/trace-events |  6 ++++++
>  2 files changed, 15 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

