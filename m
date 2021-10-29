Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 632784405E0
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 01:48:04 +0200 (CEST)
Received: from localhost ([::1]:41250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgbbP-0004ON-Fd
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 19:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgbQb-0007Oh-KB
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:36:53 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:37843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgbQX-0002Mj-AK
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:36:53 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 y84-20020a1c7d57000000b00330cb84834fso3620246wmc.2
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 16:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4PRdQlm0TCFUrjR76HYwhzGCQ7HwjBmJrLya9AqbdJE=;
 b=TCioDvM+yPzFAy5gddquuKfqAEDzSD1PshPP2Op4RdzArnMMzSoZJzw4glioizrFwM
 JVlgeOFhDjg0mzKV7RZ+e1R3rUqqOPvWyHnAVI7WhdUjY/wq+mmhUiHpPBzgG1FQhznf
 mv6mCqwUnrS2NrwCVfy36DqDWZi+a1FCnXn2DR01KJSO/oRvNUrEZPL8hd29o/6Ito1E
 Kl/bYMZAxvuOqQWyzp2iAsK0rbKb9UEJ7f+GHJKWCPqZBmLcQsH/B9Ia7iI3kZehU4iQ
 jNp66o/YIHvlyuBlrtjYJyeOnKw9u2nWHY9zk+/UWriySh1MSYkboY6BOkHBtNpkm48P
 a1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4PRdQlm0TCFUrjR76HYwhzGCQ7HwjBmJrLya9AqbdJE=;
 b=eTDtxuoadbLXWXVgOjF3BzVbpgPnArB1adpdaBudgz5/U+X+OhVeGbuTjRv7560NA9
 N16t/D0fk4ywcgT1LOUhxCvhDVIr/BfsMg40mtGv7ibCpdwaLFTgtnJDfWKqoQzT7Nn+
 hp7YCPHvC9gbsvxoQZw0Yr6Mcl6OFK38olvEL6fSxv7AXnJYf2cjhnTilkx53E+GtH2X
 5Z8f3lRo9VTv7CVWpQNLk9QER+y7cUGt5lJ+Gt9sTKutGt1DAUfFPOYUz91MkaQYyaYt
 oIVSmtp6lFh1M3bN93GbbbMe97HtW+lUYHADiYW2hvI/cZNJxMRLT1qNFKoOH/LLNnvk
 Pddw==
X-Gm-Message-State: AOAM533WFxgeqDhonaGmf+R2MdA5trKW9buO/uH/HY58A2+/kj9O8Kdc
 /P4T41StD4HsKME+Whcg57w=
X-Google-Smtp-Source: ABdhPJzYcGiv/o+hOlBUOPInjkt9AZFBVGNMhv114LQnKbJbHQm0tQ8bXYUU5s3/szliVj4Fa5hoAQ==
X-Received: by 2002:a05:600c:2043:: with SMTP id
 p3mr12169730wmg.117.1635550605209; 
 Fri, 29 Oct 2021 16:36:45 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id d3sm8149581wrb.36.2021.10.29.16.36.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 16:36:44 -0700 (PDT)
Message-ID: <59f15b6e-03ff-f8b8-6f75-7fa82c16dc0e@amsat.org>
Date: Sat, 30 Oct 2021 01:36:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 51/67] target/ppc: Restrict ppc_cpu_do_unaligned_access
 to sysemu
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-52-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211015041053.2769193-52-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.512,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 06:10, Richard Henderson wrote:
> This is not used by, nor required by, user-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/ppc/internal.h    | 8 +++-----
>  target/ppc/excp_helper.c | 8 +++-----
>  2 files changed, 6 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

