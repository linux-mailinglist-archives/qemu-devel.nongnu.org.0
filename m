Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D743D42AFA8
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 00:31:38 +0200 (CEST)
Received: from localhost ([::1]:46216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maQJ7-00015n-V1
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 18:31:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1maQGg-0008Hg-Cp
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 18:29:07 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1maQGf-00079r-4m
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 18:29:06 -0400
Received: by mail-wr1-x431.google.com with SMTP id m22so1954605wrb.0
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 15:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=anjJzm0Yhc8v19D84RmnWRvx4/UVbc5EzWXCVX8rdaE=;
 b=HdvQ7zlmy3JJqMFXjv4zWbGiqYFmpJBsKjHVA7zZc0yGkFmOBlTSDkA3YSV8m8Vfc8
 q66IiNnVPvh0XBwzYS6oN1B3bbhSnpv7UyfS04IqTuukhX93+tTGk6wvN6pYIwqsGW76
 PG9QsK23Ntvl0GwQd6sDCG9dZzAPQk/Ja5odBR385Pu9+En7BWE8s6Tlpnzz+re4/OoE
 t/emmmjxtGchwQPgZ6BhcSgSnOJ0q5mLRDNj6zd8Q+sfTyJ1wJ/qEgh97MymZs3n9goN
 GZZEFqqFdpjzhdsvvzkR+ma5SB4dTIhuOQvQax4Q+/SrrM6rwJbr95bSTSOsiCjvmQaJ
 M/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=anjJzm0Yhc8v19D84RmnWRvx4/UVbc5EzWXCVX8rdaE=;
 b=Gs6VQtMG+iOPYgMDB97nQ4ThFLTp1DWpEZU94y+t2OKQO3vLb2FjV6PRZSAbOBYlHQ
 iXI+FEWBrCEW1xs5e3JiwlWhalGCUP7MVkMa02Sbitda572jGe47UpuHVlM9uk2qpGyy
 ftF8nD4AhdDFf9EKJVVTP/dS2Yds/K9DFlL201MZaOub8Wnl74KEFFxoz6suX72DJntz
 kPduhO014bgE5MKDh9+3t9Uxa2PW4fMqOdnUszYRy3oIynOyurKI64UN8NRgBJXXoMcm
 IqnSH9y88p4Wl0hlKu65uxQzt6Q8dbqepCJ/D+SzvJGJRCR5m+NlZpkYegC4UXFaRCRk
 IvLw==
X-Gm-Message-State: AOAM530EI/976+D749cx9G1FNmjKfe07Qgkr7p86gs0rBCOZqEESdDgF
 Gl5vSZ5aW2UTbjrbzwg3ucQ=
X-Google-Smtp-Source: ABdhPJwLsqpAVcKtRz+TOktg2YmNbDk8rmxlKoCanou+BKGr5pVLvxgQmxsx55XmeEvYlSYbxP007A==
X-Received: by 2002:a05:600c:5128:: with SMTP id
 o40mr8682770wms.91.1634077743894; 
 Tue, 12 Oct 2021 15:29:03 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id c17sm11594648wrq.4.2021.10.12.15.29.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 15:29:03 -0700 (PDT)
Message-ID: <d367ed3d-9a65-cff6-9db3-b3920dfbac91@amsat.org>
Date: Wed, 13 Oct 2021 00:29:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 22/23] target/tricore: Drop check for singlestep_enabled
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211012162159.471406-1-richard.henderson@linaro.org>
 <20211012162159.471406-23-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211012162159.471406-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/21 18:21, Richard Henderson wrote:
> GDB single-stepping is now handled generically.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/tricore/helper.h    |  1 -
>  target/tricore/op_helper.c |  7 -------
>  target/tricore/translate.c | 14 +-------------
>  3 files changed, 1 insertion(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

