Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C976E3AD919
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 11:43:29 +0200 (CEST)
Received: from localhost ([::1]:53102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luXVg-0005NI-Px
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 05:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luXOR-0002Vu-U0
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:35:59 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luXOQ-0002en-Gg
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 05:35:59 -0400
Received: by mail-wr1-x431.google.com with SMTP id y7so13510906wrh.7
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 02:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+Zsw46uIqXtiwK2FeoYblFYVmtwRS1Bq3tqJ6V9nua4=;
 b=PORZxGc1QwryeoA+tMfWfMMCtx1fnIPQHt0CtFC/qo6eIMXtP+MT3sSVqpLXU5tpXq
 DQ+ATezfS07qCWjAxYXyrB9By2wuqTRaxE2Zm13e6ZjufeVP21qV5+DnJgVyB0YK+t85
 +3N6fjDFwzFteKI/dLSs1uiOSAMBPPEDH0m7tJAYV9ykaSdMeUNGevMo3Y/Dk9gi225R
 Ii7Io13I0zvrct7Qx0/CxVtIr0suH819LcRAqBumYlem2Qqxuop68fgheZa0KnuvJxTn
 sOxAa4lkzhjzDuPk1iO5Mt3EnJnyqgk9h1nJ++ycCPHPrBll7x/4O+w/36r5/K3LuRqy
 hLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+Zsw46uIqXtiwK2FeoYblFYVmtwRS1Bq3tqJ6V9nua4=;
 b=Xg6mq1AMZ8yghnYbp3t92BCO+YtQKS+1h56xDPRfeeqZrHa78z/NIRtZZSXirTyqSC
 F+13Dk37RuJu3Dgm/gF4PrHNNoH3Rj6o3mVWX072wzRXIuklx3etnCrMiWT75ORdSHfR
 knHm/RmST3DNX0V9swkShL9JKjoggqvnjwqr2k/BK0n8juPWrb0BDELdRABQquKLQePq
 pTTpIDlPk1zdH8BZ3z2H2j8Po8LDh/Bw59jy/Xh15IRtvGfY8+JbPSnUVdlDgwvxbHP2
 3FwBAJ2fNkmHLh2421srKDuViAEZwUB32/MjDyD6zPh+RrOQw+CDhO8bND9MJlOiC/xc
 /a5A==
X-Gm-Message-State: AOAM531p5gn6sUq0o8iei95J8ZZ29Jji5+jAtA7HVVqq7bSGcISgI1JF
 pCrixnfO85NnOvbOIA/MzaA=
X-Google-Smtp-Source: ABdhPJz7572fnAT0aVzMY/anz32bsGs3dAZqyCRLfb0ESTQk9V6IEhocLcw3OvHDx7vsP5zhXKnpjw==
X-Received: by 2002:adf:e7cf:: with SMTP id e15mr1281018wrn.247.1624095357129; 
 Sat, 19 Jun 2021 02:35:57 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n18sm10156096wmq.41.2021.06.19.02.35.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 02:35:56 -0700 (PDT)
Subject: Re: [PATCH v2 15/23] linux-user/nios2: Document non-use of
 setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210618192951.125651-1-richard.henderson@linaro.org>
 <20210618192951.125651-16-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bd50920d-46f2-00b8-6f0c-9a3a4cba4c8c@amsat.org>
Date: Sat, 19 Jun 2021 11:35:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210618192951.125651-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/18/21 9:29 PM, Richard Henderson wrote:
> Cc: Chris Wulff <crwulff@gmail.com>
> Cc: Marek Vasut <marex@denx.de>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/nios2/target_signal.h | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

