Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FD937C9EC
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:52:06 +0200 (CEST)
Received: from localhost ([::1]:41930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgs5d-0003uZ-Gc
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgs2M-0001g3-L5
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:48:42 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:44879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgs2G-0006x3-IE
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:48:42 -0400
Received: by mail-qt1-x82e.google.com with SMTP id y12so17673409qtx.11
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 09:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ar9l4Bw/2rLohV2Hp92eWCxltY9p9GlcJO6WE05s6OQ=;
 b=B+nxMfq65NmIBygN54boHGiWkATcC63xNcmiUl80sm5LTSTpvy9XdVym3GkdEB2ovI
 wpQmpJzlWMkJv2atsn/ZHF5c4uiOeRO2CRKU4VFba7p0BqZKFFwDxiYIRmuLVOET1u/e
 6Hn3v3waH6O+llpkF3IxydcDMP5/EhwNlJVBvUxohGSw73ZNF6pFCtE3/qBfTkdfjWep
 Wfh8Z5thqzrGvYHGL6sWd1tYdx7yJwJKawkki/51zvx8+LfLprE+c7ut2o1H75XUg374
 5829g2dx25ROaSnhR/VxaTijsf9ITT6zNg22DVcOya70P3L8TyQaRQb96CO4TmNnDdo5
 S7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ar9l4Bw/2rLohV2Hp92eWCxltY9p9GlcJO6WE05s6OQ=;
 b=rophmeAwer33wtokTfh1LqW7asLGw8/gu0SAuf0iPh2k9X4eQPMHCtwRHjdYQBVSDp
 NInmL8O7fdkInWJICXRZ64oUZzozPr9qrPyDW+qJp8KsKwZngczjp68KnzAcHgdFZ1zy
 oI/7KVO8nKVgieSjMd0LJzsT1FZNieArTyRLaES3n3h/zVXetnhUcJu1GYUNXxQZ+HOm
 iSvqBszyZi1G5b8cFAFhcgVSKfOTpa4hwy/T7qsQnPFA19OeyzzqlHlsi71BpFeWk4dE
 NWIKLV3w9SHPLTs/kcD+nQ1M9NjVTG0m+LYdqSK0CRfpZJzUTU2BIHr+bGXsBcLB4max
 6/9w==
X-Gm-Message-State: AOAM530KfCLaiArBPBxgiCL3b8Y1OnX6nXHNavrtaGAAT5bfnTTVVOPx
 bTN4wmxnKWITzOKGgNHvf/0xqg==
X-Google-Smtp-Source: ABdhPJw9Hu1PEH5QPHiPskBvDEQs5BOp3x14etxuGC26RM+9bjTVNZ6H6mv0cEe/h+yWmliRumjiFA==
X-Received: by 2002:ac8:5691:: with SMTP id h17mr34060613qta.185.1620838115323; 
 Wed, 12 May 2021 09:48:35 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id i10sm430355qko.68.2021.05.12.09.48.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 09:48:35 -0700 (PDT)
Subject: Re: [PATCH 01/11] target/ppc: created ppc_{store,get}_vscr for
 generic vscr usage
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-2-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3c2176a7-efb0-9445-8547-22c6f31f1648@linaro.org>
Date: Wed, 12 May 2021 11:48:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512140813.112884-2-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 9:08 AM, Bruno Larsen (billionai) wrote:
> Some functions unrelated to TCG use helper_m{t,f}vscr, so generic versions
> of those functions were added to cpu.c, in preparation for compilation
> without TCG
> 
> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> ---
>   target/ppc/arch_dump.c  |  3 +--
>   target/ppc/cpu.c        | 16 ++++++++++++++++
>   target/ppc/cpu.h        |  2 ++
>   target/ppc/cpu_init.c   |  2 +-
>   target/ppc/gdbstub.c    |  4 ++--
>   target/ppc/int_helper.c |  9 ++-------
>   6 files changed, 24 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

