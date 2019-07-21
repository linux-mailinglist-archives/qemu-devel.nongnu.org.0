Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF656F137
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Jul 2019 04:02:58 +0200 (CEST)
Received: from localhost ([::1]:54236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hp1Bh-0003kg-SV
	for lists+qemu-devel@lfdr.de; Sat, 20 Jul 2019 22:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59407)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hp1BT-0003ME-QC
 for qemu-devel@nongnu.org; Sat, 20 Jul 2019 22:02:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hp1BT-0001n1-09
 for qemu-devel@nongnu.org; Sat, 20 Jul 2019 22:02:43 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:37051)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hp1BS-0001le-QC
 for qemu-devel@nongnu.org; Sat, 20 Jul 2019 22:02:42 -0400
Received: by mail-pl1-x642.google.com with SMTP id b3so17451886plr.4
 for <qemu-devel@nongnu.org>; Sat, 20 Jul 2019 19:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SaRoAb9sFJg8AT+8RvcDi6yAQMItnOQAN7y6ggyWXR0=;
 b=G4wv0+CYg6NjPwtp4INoeIU4bUoPCDT2P7s4kL/oN4O9LCAR+ow0aGmXy8Pth41IMq
 a+YzMvygDPHhVY6910BOn1fILLBHH2aVAQWtUJHHUw02YkZESxp4wEw3fP64fRh/6JlQ
 amiPCIapsnLx37DxJglPnSLhajZiTwypQBupHSJ251z1B1ZDnk3ivxvS5uiX0IZlt1Zg
 3rKwNvZ0nyhxSQVclxLQODbU07t/A7z++PIogCRbTyaEsv0MOlgoVe4y/5BOLpzApEhN
 JpJE/kZCPYSgXoVULZyFaZH57cTu63FylZG2qavkt/4ro6C67TmCqlebFC22FEbFvP8S
 uOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SaRoAb9sFJg8AT+8RvcDi6yAQMItnOQAN7y6ggyWXR0=;
 b=I9xCGU8DqTb973UM4Kj9sTV24niviQWRKnK8hjgp2pIf4X94IlgMA2qk/4mYAItaM1
 0KTAlJyWSTyuo1PAIZndeDZxrMXQjC2lBauGksMcXNmFYiw/Pp2e3k7vXll2gzM0uFKO
 YXYGThMil94HMOjF0u1VGU93eXYfTWDyAUZxzrdksWOYPreZMbvnN+4pByLNZ//EIn2a
 JQCJiC/e1CVlh6tI0ryqsc0X1Eop3V4npf4g0uKBPVJT3qgR25TsaWRLmGPwlOj5xRPR
 xwXJXX6TwGanAfTejSU4Q6TMobpc7snJgRth1jk0KszqTw+7XQQ8eGduDEkY0+yOgvAA
 cMXg==
X-Gm-Message-State: APjAAAUo8DxGrsNcGMNvoOLK3rCfOHiIPrrQvsc8vEq4E7kmjPKgbUaC
 wUCoI9jeQZBZtzCxKKb+BrK2lg==
X-Google-Smtp-Source: APXvYqxI179E+t1NBNeE5r2GFIBEbSyGocw0AnlAmA13SpBIWTzvmZ2ADNDws+q24Gz+ApP0ssFFfA==
X-Received: by 2002:a17:902:9b81:: with SMTP id
 y1mr69397754plp.194.1563674561412; 
 Sat, 20 Jul 2019 19:02:41 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id l44sm31112581pje.29.2019.07.20.19.02.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 20 Jul 2019 19:02:40 -0700 (PDT)
To: Jan Bobek <jan.bobek@gmail.com>, qemu-devel@nongnu.org
References: <20190711223300.6061-1-jan.bobek@gmail.com>
 <20190711223300.6061-7-jan.bobek@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b2edef34-0e6a-4caf-bf77-87f566542120@linaro.org>
Date: Sat, 20 Jul 2019 19:02:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190711223300.6061-7-jan.bobek@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: Re: [Qemu-devel] [RISU PATCH v3 06/18] risugen_x86: add module
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/11/19 3:32 PM, Jan Bobek wrote:
> risugen_x86.pm is the main backend module for Intel i386 and x86_64
> architectures; it orchestrates generation of the test code with
> support from the rest of risugen_x86_* modules.
> 
> Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
> ---
>  risugen_x86.pm | 518 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 518 insertions(+)
>  create mode 100644 risugen_x86.pm

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

