Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6478C2BC8D1
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Nov 2020 20:48:57 +0100 (CET)
Received: from localhost ([::1]:54758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgvM0-0003ft-FT
	for lists+qemu-devel@lfdr.de; Sun, 22 Nov 2020 14:48:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgvKu-0003EI-RK
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 14:47:49 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:35345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgvKr-0005jh-U9
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 14:47:47 -0500
Received: by mail-wr1-x443.google.com with SMTP id k2so16548652wrx.2
 for <qemu-devel@nongnu.org>; Sun, 22 Nov 2020 11:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wPtSYsqetkwqEyPerk6Z2axjSG+NkgQR/lZYfNSOkrs=;
 b=NrUGDDYKNLWuG4PIDedfFDM6j3rcmW4Y5cIK/yvGg3Ssx7rvP/V8vu+XWASQVLa3Tv
 7nm+IBrKcbQY88fPfHb5CCil8fSgYDZ0o1Wls6V96KJ3eQJC7L9tYZQ+X23soiLQZvlI
 C4hlisQ2S2zCCq6ilcX1XwTu8uCcZIO0l2AEADYWpS4ECz5xvZWCJfbQVSn8R4ecprnX
 XteObjZJfLFnTi0ElAm0uXKDYWDcTLdkGUNa8ZmnIiZjx8l4YSzpJBagZ+xxdaN+kKFS
 xd5j4XS+6+Xho1LI6sMAYuIw2Em0nCv8tCI5vlJCE/HqBTQDu8cIJjnZxIZ2juMlUl6m
 LfDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wPtSYsqetkwqEyPerk6Z2axjSG+NkgQR/lZYfNSOkrs=;
 b=Yh3B9xmfHuLg6dFJzWFKqLhMk11fajkjSOrZARh7uCJDeR7v3/ib3D/13JNXaR+7PM
 G0hk8J/ZaVQaSKtldCcY/0TrEDdCaByOgFNNZ9qftcDcnvJl55IpHQsRMFvtGmeC9B7l
 3rNeDYbMh52TlEKMQci8Gi2AIRRSZTrhXj+ERnyuQni7F8psypPb7l9DdS/wNsW/R/HN
 lFeD19Ljpvezb2UWCu7KUVgmINoOpo53GxzjLgz+5H4DkMeBJCnwhq1r0hAlWCFEpFzi
 KBKVA5ZYP4URdbJkaV6EfS/A6HzV2eg+QJOnnMEbcc1buSEXvl5/F44y4jxr95ax4/+A
 hVvQ==
X-Gm-Message-State: AOAM533qdHNeGA/VVOaKCsBpL93+qvBCXoI6TKXCXfH9KR4JttT+3czo
 TENziF6c6KEiTYCMQPQPp44=
X-Google-Smtp-Source: ABdhPJw9RsZQki4t0Bjz1S2EMPU5n6Vx0xi1Me4s1hLEMLptGTDXuVb4bJ/f4TOPiaKy0dQxwFFw3w==
X-Received: by 2002:a5d:6689:: with SMTP id l9mr26038760wru.134.1606074464500; 
 Sun, 22 Nov 2020 11:47:44 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id r1sm6828370wra.97.2020.11.22.11.47.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Nov 2020 11:47:43 -0800 (PST)
Subject: Re: [PATCH 23/26] target/mips: Extract Toshiba TX79 multimedia
 translation routines
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-24-f4bug@amsat.org>
 <4a090d68-f727-3805-4e0b-6c31c3689b2e@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7ba55ef7-ca1d-d437-0d01-b2a0b94357a0@amsat.org>
Date: Sun, 22 Nov 2020 20:47:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <4a090d68-f727-3805-4e0b-6c31c3689b2e@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/21/20 9:17 PM, Richard Henderson wrote:
> On 11/20/20 1:08 PM, Philippe Mathieu-Daudé wrote:
>> +++ b/target/mips/vendor-tx_translate.c.inc
>> @@ -41,6 +41,8 @@
>>  
>>  #if defined(TARGET_MIPS64)
>>  
>> +#include "vendor-tx-mmi_translate.c.inc"
> 
> Do you really want to nest include files like this?

Can do better, indeed ;)

> 
> 
> r~
> 

