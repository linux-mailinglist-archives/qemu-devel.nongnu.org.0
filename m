Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDDD503292
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Apr 2022 05:50:17 +0200 (CEST)
Received: from localhost ([::1]:36136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfZRw-0008Pi-CB
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 23:50:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nfZQy-0007jv-Mp
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 23:49:16 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:46792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nfZQx-0002D0-1g
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 23:49:16 -0400
Received: by mail-pg1-x52b.google.com with SMTP id q12so9505952pgj.13
 for <qemu-devel@nongnu.org>; Fri, 15 Apr 2022 20:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ibxrYeh4pBznYTealIeHUgdxgfY0Zmya6KwWmxP/rXU=;
 b=yIGVTlqx6SXoHd3vAyRF92bgwDEC35hCzEeV4EoBQq3OYeI5TW3bfIDOZ5ND27Oije
 Cmn1ZUPZ4ksvkKlBwU+4eAQn4xEWAOECPE0Y71GdQSK5286KkN9N49wdQA5XP1dPl1xx
 7fxxci+7mWrBgyehu/eJIZ3Csx6Sqr+wXjAbtHrJwKihlJ6IHGecEU9eoHVZXbiGDLve
 rAEkPuZjkhacaVFb4Jvt1ZS20Zk5wL+rDOap28PQ2u7Qw5UIAlOyMvbfzRlogZ8bGaNp
 AnTL4AK8P+1/4SnMfon2g8aEs1wUSEXdMdLr3bBoGWPXBu+y7vQ32r6d4awWVutmirOw
 XZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ibxrYeh4pBznYTealIeHUgdxgfY0Zmya6KwWmxP/rXU=;
 b=eHQeCVAAcQc868jgT1be9pfiSFC+f/Ufa4NFW7Dk5g2UIByDhS9my16akN4vt/1ndL
 u7zcZWabvY/iAQx3vtndTuzi4tOaS0wGKT7Dql2plnauJEeFFXZv5X5x8hzjqKTI56g3
 L9omrYPA/YrIt3A0DoksYZ/K+11sh42uCCebxWvaVl9MmUMgSrInR9UFZjym2f12xb8T
 2aqyjRA5xtaifgUxFCoqifLXAmvDFa83y5/YL1C1KgvRvpGW0+S9wmQomgw4/NnhszXm
 hIErp7emsk6J4kHTPsH2IUiC9DXrsdnbqEWjtwXH1EKwnASK6nRRUZAY0CmjPlukHBF5
 xytg==
X-Gm-Message-State: AOAM532HHZ9gnszrOobGXWX7O5l0T1lI1LReH4J7JutN5Mc9KuaTlR0t
 Dx9Kv1Vb6iIyLDVlg1aMD8Qnew==
X-Google-Smtp-Source: ABdhPJysHLtkpU0a7X6GZ1nP39BJKBO0A4HxAvehtOJTqgjNt4acvcCMsmaQzwA9GXnmPTey+jX8sA==
X-Received: by 2002:a05:6a00:1903:b0:4fa:fa9e:42e6 with SMTP id
 y3-20020a056a00190300b004fafa9e42e6mr2081052pfi.1.1650080953122; 
 Fri, 15 Apr 2022 20:49:13 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 196-20020a6300cd000000b0039940fd184dsm5778437pga.9.2022.04.15.20.49.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 20:49:12 -0700 (PDT)
Message-ID: <a1cba7a5-3d75-430e-1bea-babbe817adbf@linaro.org>
Date: Fri, 15 Apr 2022 20:49:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 28/43] target/loongarch: Add other core instructions
 support
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-29-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220415094058.3584233-29-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/22 02:40, Xiaojuan Yang wrote:
> This includes:
> -CACOP
> -LDDIR
> -LDPTE
> -ERTN
> -DBCL
> -IDLE
> 
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                      | 17 ++++
>   target/loongarch/helper.h                     |  5 +
>   .../insn_trans/trans_privileged.c.inc         | 65 +++++++++++++
>   target/loongarch/insns.decode                 | 11 +++
>   target/loongarch/internals.h                  |  5 +
>   target/loongarch/op_helper.c                  | 36 +++++++
>   target/loongarch/tlb_helper.c                 | 93 +++++++++++++++++++
>   7 files changed, 232 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

