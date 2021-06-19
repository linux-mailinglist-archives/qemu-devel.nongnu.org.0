Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 136153ADB36
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:04:56 +0200 (CEST)
Received: from localhost ([::1]:48700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufKx-0002bD-59
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lufIj-0007r4-BD
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:02:40 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:46658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lufIh-0002mn-Dj
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:02:36 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 v20-20020a05600c2154b02901dcefb16af0so230407wml.5
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t9qKIqg810fLVca1Z7y4TtvRS9IoKx86I5uYcl8vUdE=;
 b=SoeJZ3TRkE8lNk9kEUJV4cec4N0o/qb7kBov9Fps6yY/5xa1hbTYD46CwoOu0+R+3w
 YDY+WOjkwt9hjtFOoceIvWFar9g3pb3E/qwrQ+ED9fN7vMluA/7SoxALYVqJ+zLWqxyh
 ZIj9PSv+Rycx72IzHFcKPrmlsqpCBUANisjZr7Ta7VYMklOemaU7zKL4KEEQsan2P4wC
 tuB9BHCP71mc8KAf/F1saZfm6LBlYsm09GdkZZnXg8KMHtbWEw7bLqnwiHENODdInx47
 mBiDyIaAeT1TpNWr0+o1OVxEGx2yzSA7r6UAINkQxR8RoEv/CfAO5f9SeDgUJCgItiYu
 ZRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t9qKIqg810fLVca1Z7y4TtvRS9IoKx86I5uYcl8vUdE=;
 b=V1cBxxB5W25wVEj3U1UNyXBCNpwWO5raMJLOkWjplGGXZNsUAS3iNSARSUlLMRxecM
 wCttWZ3il92Pdepp0YO0QOcFRZLEVyGZ6Kosfs56MpMJ53OPI28Jk79bWfk5eVOnsJ8I
 Me66HifXVriksBxNwnZlIn+QAQzzkOo9UaNAwKP2jdteqxaN36q10dkoVVcdnryshveO
 XpHg6eqvtR8dSw/ppPPjjll0PK6Zk5Qb6HdbyDrbBAprZ27dsR84/q222eBiiN5sWD0K
 wUgNUhhJGmrJKRiN78ISbWOOhj9xB6CU3avwfJ4I7D7g7V0k6fK3VSD8JK0s1L3QTFf5
 PFkw==
X-Gm-Message-State: AOAM530JOZZ7geqxKb1moGdazItRTsD4hFzPbxnbAeoQlXTKj7p/O6cX
 84FaSjy9PvFOjVW85A1Eff7qpwYJK8249g==
X-Google-Smtp-Source: ABdhPJyQt+l6rq1y8WcZYzRYF6i3iJQJmz4Zc6K32qnKBDmw/3ISNwxtu8teNThcPhVxJeBOzYJtgA==
X-Received: by 2002:a1c:2155:: with SMTP id h82mr17841438wmh.115.1624125754093; 
 Sat, 19 Jun 2021 11:02:34 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id m18sm12290922wmq.45.2021.06.19.11.02.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 11:02:33 -0700 (PDT)
Subject: Re: [PATCH 0/2] target/mips: Simplify MSA decodetree
To: qemu-devel@nongnu.org
References: <20210617174636.2902654-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bbfff996-633b-1208-2820-4fa7b897c8a7@amsat.org>
Date: Sat, 19 Jun 2021 20:02:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210617174636.2902654-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.202,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/21 7:46 PM, Philippe Mathieu-Daudé wrote:
> Merge MSA32 & MSA64.
> 
> Philippe Mathieu-Daudé (2):
>   target/mips: Remove pointless gen_msa()
>   target/mips: Merge msa32/msa64 decodetree definitions
> 
>  target/mips/tcg/{msa32.decode => msa.decode} |  8 +++++---
>  target/mips/tcg/msa64.decode                 | 17 ----------------
>  target/mips/tcg/msa_translate.c              | 21 +++++---------------
>  target/mips/tcg/meson.build                  |  3 +--
>  4 files changed, 11 insertions(+), 38 deletions(-)
>  rename target/mips/tcg/{msa32.decode => msa.decode} (74%)
>  delete mode 100644 target/mips/tcg/msa64.decode

Thanks, applied to mips-next.

