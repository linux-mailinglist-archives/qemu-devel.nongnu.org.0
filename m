Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BDD39208F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 21:07:44 +0200 (CEST)
Received: from localhost ([::1]:53154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llysZ-0002lN-Fk
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 15:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llygm-0004Aq-41
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:55:32 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:45988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llygk-0004OV-HH
 for qemu-devel@nongnu.org; Wed, 26 May 2021 14:55:31 -0400
Received: by mail-pg1-x529.google.com with SMTP id q15so1705535pgg.12
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 11:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ttErNmXdBMo6qjwg4YsWdVTUVKtj3WQKBIqlO+hffiI=;
 b=KPhAK8zDWJxzhs4qda0b9C2UvyBGoynre9wRhQh4naeYjDSwp9jDlte410GnQ9sLaO
 URJeeGrIGvG0uoQXPyCy8LRKt4IV5JtkBqT14vKLXH2XdRe+tjmdVU9RA5X80wniei7O
 HBW17cnuDRtc2TJU83Pm1If7CmRPEvFeQVD1W6DZpKmRuhBSEH7urV8QOlD9qZRW/zR5
 yTi+jFffMGwn3ry69LiYoZnxUwazWSxB9H3aXUgsyCVCK3bU/5CDzrm9mSAB7989E0Fm
 yxorjZ2DoMS77w/oIOOZSkiCcpmzOP2i6PE6X7F8+yzhtSBcw3PcnLxs8YzqbFLqiV7q
 0x4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ttErNmXdBMo6qjwg4YsWdVTUVKtj3WQKBIqlO+hffiI=;
 b=N9bhlQ/nYIeYltOZFmHwJdxRasreG0LzHAMitC7X50UAb6G0VavrReNre1H1FzESqU
 gyTCGUHzbvV/elqvYf3oE1Tv/Uois+D7Wa+YkFb34H+Ons0uGfRl12SzIrdRXlASQl3A
 lF4fLPlfDUhYw/vcm/5O8IxYgJ2beleSqUju3zbiKO/DSU1XwT4Y0hukOPjh1Sw6QsWG
 sLHZTN5nByRAPFiJsuBqefoKqbvlUdbEfdZZXm3o6DOYaSDU8xamsoHUYwIjoKo0yPL5
 A5FrjYx55cy0d4Dplw0b52LuJzGpyMf2UW4K7g2rdiPw5c6aZWUpk1ZI5dwPPKR8GuP0
 yBcQ==
X-Gm-Message-State: AOAM532PP7VekHavPka6ZH/cYuw5FcFJKY5xmCuFkneG4xVEKxfqKg2d
 jvdte3ofenNhl39SM3UvtrZP3A==
X-Google-Smtp-Source: ABdhPJzGgS7/ih/6k1NvlFE6azW4Up7u/QQ71gkIXpDq/L2iGAKmFvlHOztwdWCug1MRlKswUbINTQ==
X-Received: by 2002:a62:1d0e:0:b029:2d8:30a3:687f with SMTP id
 d14-20020a621d0e0000b02902d830a3687fmr36756928pfd.17.1622055329329; 
 Wed, 26 May 2021 11:55:29 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 p8sm15981926pfw.165.2021.05.26.11.55.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 11:55:29 -0700 (PDT)
Subject: Re: [RFC PATCH 09/15] softmmu/runstate: Clean headers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517115525.1088693-1-f4bug@amsat.org>
 <20210517115525.1088693-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <68dfc861-a2cc-3200-8c1e-575a68471edd@linaro.org>
Date: Wed, 26 May 2021 11:55:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517115525.1088693-10-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 4:55 AM, Philippe Mathieu-Daudé wrote:
> Add the missing 'qemu/log.h' header and remove the
> unused 'exec/exec-all.h' one.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   softmmu/runstate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

