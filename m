Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D644180EE
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 12:02:46 +0200 (CEST)
Received: from localhost ([::1]:34820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU4W5-0000D3-Ip
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 06:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU4TN-0007QA-Fh
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 05:59:57 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:35726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU4TM-0006zq-2q
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 05:59:57 -0400
Received: by mail-wr1-x42b.google.com with SMTP id i23so35018428wrb.2
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 02:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zUSlCvCNDS8WcqzbthORLsCGTjsAl+JUVF43K0fKldo=;
 b=fqv+xkiNrOB93DJ58ariGlS5aFMTW1S0PrYxmUG4FxYiir0deXIkl1Ya58hJIqk9QE
 YqQmKuC9xlXZabJKThPsPZXy4smoe4Uv/FnOOJCXfgCBpC78Q5ZG4t9E+tSoCt2J+y61
 tOY2xd2f+1ULRNbNN/YEuiNr/aAR0agOtgVqxC04mt2QA1jCmZyM4Jj1PVW1rySsutUi
 BBF44tP5jasEdn0SqPEUiicRFj0ego0YW5XsJDRwp/cu7LnwDBlL0Q4Fn0DzhAPCZLUg
 IKmtiTKEFuEmzcOUfGG9loSN88f5sImJrm131rYXKk9Lcp5Y5l9tdKNlg5Gy6wwq8Aod
 FJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zUSlCvCNDS8WcqzbthORLsCGTjsAl+JUVF43K0fKldo=;
 b=FjiEXc8cm3xAULe2Bzcuqk1PB+R48045f2lvByJfIPHPqV2/RvsA9fKKIyfVdETwqE
 UxsdqUti0tghquDkc7e5oJdViY3jtY6+aV0ILzKdamzUwa3BQzwwy/s0i3oKXEadC353
 RNpJVRMuHH+iRoyyDsuNp6CI3RjJZ+0nCHmysezCr3QnuiDC9kO/b2GcrfksE7B/o56P
 5GkCverkghPB5AvwgLHjUokb5odk98eUbOfBH/kQy94X6r1A+MmVBCc2mswYYnRmec8g
 BuhNsAMi25tfHQPOe6LslqvSV1dUECGTyHhCzsk+1/smQG8Y9UuZPNzrPpY1VGSkNnDE
 8Yew==
X-Gm-Message-State: AOAM532n9xj1c1oeWQsXoueWxIMbW/Sz/4Nksq8F4AXSuLgv14rtZGTO
 bZkuRRSJsPSDmLv1Rwsx8sA=
X-Google-Smtp-Source: ABdhPJwip7Ro5sPgxyo9NKTj6P/rH1ZCEZY2bzSuO8qjg1o4SKkhq8SE0eUv6kDd7q/BgKipy8DL4A==
X-Received: by 2002:a7b:cb49:: with SMTP id v9mr6195469wmj.76.1632563994299;
 Sat, 25 Sep 2021 02:59:54 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id a75sm11452689wmd.4.2021.09.25.02.59.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 02:59:53 -0700 (PDT)
Message-ID: <c3114f8c-3cd3-550e-6f9a-f8236b2f10b0@amsat.org>
Date: Sat, 25 Sep 2021 11:59:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 12/30] tcg/loongarch64: Implement
 not/and/or/xor/nor/andc/orc ops
Content-Language: en-US
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210924172527.904294-1-git@xen0n.name>
 <20210924172527.904294-13-git@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210924172527.904294-13-git@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 19:25, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-target-con-set.h |  2 +
>   tcg/loongarch64/tcg-target.c.inc     | 88 ++++++++++++++++++++++++++++
>   tcg/loongarch64/tcg-target.h         | 16 ++---
>   3 files changed, 98 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

