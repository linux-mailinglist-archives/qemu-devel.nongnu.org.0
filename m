Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 711FC16016A
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Feb 2020 03:14:03 +0100 (CET)
Received: from localhost ([::1]:56522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j39Ra-0004X8-Ht
	for lists+qemu-devel@lfdr.de; Sat, 15 Feb 2020 21:14:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43870)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j39Qq-0003s5-04
 for qemu-devel@nongnu.org; Sat, 15 Feb 2020 21:13:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j39Qn-0005cc-SK
 for qemu-devel@nongnu.org; Sat, 15 Feb 2020 21:13:15 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:33721)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j39Qm-0005YD-EY
 for qemu-devel@nongnu.org; Sat, 15 Feb 2020 21:13:12 -0500
Received: by mail-pg1-x541.google.com with SMTP id 6so7188814pgk.0
 for <qemu-devel@nongnu.org>; Sat, 15 Feb 2020 18:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0i/8vyIJ5wu9UGFb7UIbVzbbKbomjX1pIlEt9t5VRSc=;
 b=K6sRqm5bgDEYI3+Asa/7wgtxZuQbBiADQBav9LRYfdMvLJzPXfr7aks3DR+jbezIww
 EBtsuHyWH+tvBkXbF8l9PQWYo0j6UCHjkKXYaMyElq/4Z7zRoUfh5Gdykjb9MlggM9AM
 b08cQim4lHFiR7TJ41PK+Tj2bfgUCehhSBU8yZRx9gmCq0rnC63GE82u1UtfJ5scxm+S
 eAZIfKn8QD5SOAW2XJIkr+ZWpVAobfmrYM8DfkRJuHaMu42WDMu2l4QgZDlEVDWlsPcg
 oEMZWXkU3tmUPeEtqT68nKzzoYUSztxq9/9oTssx305XWliR1IX/u4v8TS4Wh3iPum5j
 W1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0i/8vyIJ5wu9UGFb7UIbVzbbKbomjX1pIlEt9t5VRSc=;
 b=Pxscvze0f9VLqGBhyt9wrxWRFFIeDb/IjdgyHRSD1mDsX1I/Ev6ML+yefW/99CZJe1
 rTcd4X33sBFAwcwbpAPBYhL2+8d+DAX19Dwfl1MzL0QWBRRZ25dsfJ0bYDce+SlzQ0+b
 ETmz29KlhmI4jMoJcCpOpxo938wNdDgiMWZnAbX4+nVeK+i8zW7KTiYN/xcaW14NpPDX
 UhUNV3AaYwymkxlruu8NXPsQ6ds3YPRaxDS01+ppEI0TxoroqpXwyFQb3MmmIaGHvr4Q
 Q1R68sHJF0M8Jmo3O2dPUX9HobJWQH3BEVNLnuqwABEHFfiLM9vLYEQ89M5Ya/2+830F
 hL0A==
X-Gm-Message-State: APjAAAWxFhVLCQLAEqJxFC8oofW1MGQtEmC6s2baDd5GZfdWKUNyS9vq
 uQbPa7L+yp9c8EP2lZMkVt8nAQ==
X-Google-Smtp-Source: APXvYqyeB24/7PcrXCIaBeK0Z+H1qepDBn0dJFGijDGSReMHx0AZ92cEvrOjeNO7eZ+OhSu2HeSd4g==
X-Received: by 2002:a63:9dcd:: with SMTP id i196mr10895890pgd.93.1581819189852; 
 Sat, 15 Feb 2020 18:13:09 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 70sm11709067pgd.28.2020.02.15.18.13.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Feb 2020 18:13:09 -0800 (PST)
Subject: Re: [PATCH 2/3] hw/display/qxl: Remove unneeded variable assignment
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200215161557.4077-1-philmd@redhat.com>
 <20200215161557.4077-3-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c8f77648-9c09-9aae-c1e5-b33c803ad9d8@linaro.org>
Date: Sat, 15 Feb 2020 18:13:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200215161557.4077-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/20 8:15 AM, Philippe Mathieu-Daudé wrote:
> Fix warning reported by Clang static code analyzer:
> 
>   hw/display/qxl.c:1634:14: warning: Value stored to 'orig_io_port' during its initialization is never read
>       uint32_t orig_io_port = io_port;
>                ^~~~~~~~~~~~   ~~~~~~~
> 
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/display/qxl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

