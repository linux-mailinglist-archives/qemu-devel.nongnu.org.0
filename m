Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CCA507987
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 20:58:45 +0200 (CEST)
Received: from localhost ([::1]:51714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngt3k-0003Fb-IA
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 14:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngt2E-0000uY-Mt
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:57:10 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:40912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngt2D-0004V5-76
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:57:10 -0400
Received: by mail-pf1-x42a.google.com with SMTP id i24so1571241pfa.7
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 11:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SL1+Qn7sZMzMKRsCNVi5C4dVPsrPj1B+5Nk0qa9Q8w0=;
 b=yhmt+w1Mvo8nKe4KBK1RvA/7cb458VA82wr1+kLD+PoKRoQyWvHHAjD0JCKiTeayOw
 A0ejKVLba3BGBd051UufAAPaEFb/2hdPtssdOhepcSqP8wusAb4oMYj4NtIwIsKWdEbD
 vPzexQHKI9LvI0u+HSE8yTk/8lw91W4hYLvgrvSD8lnhhJef/L9p9ZmiEOZUOX6FY5D0
 LiRIP4fN368zRw7gwb4C6MynqHuL8tDjBh9P1aNYzMpeZFIM3Hb7lbRaN5my4y/pWo8O
 k/JXLrkGS0Xfc6WBdPdT8byq+Zq7EQeBykt4hwJzrubiJYB7dwwhNxJg9iAcmu7fd/e9
 uQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SL1+Qn7sZMzMKRsCNVi5C4dVPsrPj1B+5Nk0qa9Q8w0=;
 b=cx8nOvOk4y11QBwPJsi1m67tRwVuqTEgksvOtwGGRmwQdKZFe8BQN3L32ph2BViHtj
 xZossyeNfKeA7QM3fntd98ZR34kkzKfm5CNd5mtp8mcV9RkIHJ0PR9YGnxFitKKsjALx
 gUA9CB04ta8uKae4B6KvdUV7mNaWiAtGRpBr5Jol7iI15/QchWFgKGRbTAKgVjBw1l95
 hAw7LXz5DQ67D+H/be2AyioRcifre6ue0R/iKjIKs55ZGU4Yo48btRrbgb7AFozqRQyJ
 lQesQvHA/id1Gbwl44iqQt4vhJXc7XVG6hgdwNmNa27CmACFZUScgKtrbj+KtWgNoeTJ
 Y4RQ==
X-Gm-Message-State: AOAM530zwmHWian6zQI5MB1squRYfyQuz2OPlbPkL/hneeWPHtMqRo0G
 +eOkEzSUmijzBF/74giGwL3JZw==
X-Google-Smtp-Source: ABdhPJwjGO5cAN1vxgDX3LtVo5qy23GKtys/lSMzWVjt2gbjYTOGOKUY5kjuiKqXeDDO0LRdPPdJSw==
X-Received: by 2002:aa7:943b:0:b0:505:70bd:61ab with SMTP id
 y27-20020aa7943b000000b0050570bd61abmr19212592pfo.58.1650394627847; 
 Tue, 19 Apr 2022 11:57:07 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a633741000000b0039958c06c53sm16733568pgn.61.2022.04.19.11.57.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 11:57:07 -0700 (PDT)
Message-ID: <9e138e1f-20c7-97b9-c32b-491ecd091fdc@linaro.org>
Date: Tue, 19 Apr 2022 11:57:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 15/25] tests/tcg: prepare Makefile.prereqs at configure
 time
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
 <20220419091020.3008144-16-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220419091020.3008144-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/22 02:10, Alex Bennée wrote:
> From: Paolo Bonzini<pbonzini@redhat.com>
> 
> List the dependencies of the build-tcg-tests-* and run-tcg-tests-*
> targets in a Makefile fragment, without going through Makefile.prereqs's
> "parsing" of config-*.mak.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> Message-Id:<20220401141326.1244422-13-pbonzini@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/Makefile.include     |  9 ++++++---
>   tests/tcg/Makefile.prereqs | 18 ------------------
>   tests/tcg/configure.sh     | 10 ++++++++--
>   3 files changed, 14 insertions(+), 23 deletions(-)
>   delete mode 100644 tests/tcg/Makefile.prereqs

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

