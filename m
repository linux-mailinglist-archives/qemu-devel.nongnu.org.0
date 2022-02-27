Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00634C5F4D
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 23:04:53 +0100 (CET)
Received: from localhost ([::1]:43592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nORev-0002p5-3B
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 17:04:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nORch-0000yQ-F7
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:02:35 -0500
Received: from [2607:f8b0:4864:20::1036] (port=53225
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nORcg-0008Qd-1K
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:02:35 -0500
Received: by mail-pj1-x1036.google.com with SMTP id v4so9473466pjh.2
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 14:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=L2+3dvVMabLDyd72eRqUSV9JJXAX4KPQwgy9yu5aeB0=;
 b=cYUsuxT7sJQHc7RC0YdwhapXuYP2SIdm4UNl86AL2ZHZmfeyy1XZbfR4sLvouq8iU2
 Ga7BiAAmxG7ME4u4tfTI7Z1ZuthYGB88U4cQRHWO6pHkvX9M9siZWrXyT3zo8/BJoRYT
 ep/Sm44fJ8edHcYePDufeJFI2e8oNhxDBXYjinmaQXngW25Kw/dnUq9lTtrvRHBxSBju
 8wHljUj0cbokl2TaatZ1G+TM6/2P4qcQjV39A97NKaI9BKRKYBqrSfppAe6Ud1BZ0d4r
 DwtpoPMXabaWeOFnkVN5IywmwVUXDwAknMefyZg4kZm42OLeGK8WQL0oCu41Z3NjCudJ
 ZHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=L2+3dvVMabLDyd72eRqUSV9JJXAX4KPQwgy9yu5aeB0=;
 b=KaFscCVvTxKHA+NNFzGZ6dra1rPLK7fBru3bIvoxk2E5bO0tDk5WEeRQ0t/jEEOaJu
 YA9WZaYDBICVIH5/ZdulRnvUvl71fEz/2UGUcBLQyg7T93DTOXLjoCF6/bLHL2wctczg
 sLviICkhp9v9J1IDtcQE97GeNG+ZbolHeD/cIv+mwST+pwgNdmjqbf5301m7OGYrM5qF
 oC3/tsPmO5zQuhIzX+tPCF06HjvBbD5KLZIGjbkgInkzbiAJnLNW75S3o1uADXY+coOR
 wqZT9ckd7Aq09+IrmXOs0dJFwHplL2lXdtbkX9BytnrVhgNBkDrD+OZQRJF7KqNYG/6e
 cXSQ==
X-Gm-Message-State: AOAM532X5nuvGz6k0V/edBpIYNdtxba2gzl7mxS+RuOztniMSRmzz9Mi
 O8mhghKw4foMHQUZM5cAQXQ=
X-Google-Smtp-Source: ABdhPJwER9ZrjDib9k9ylfKHBNTOQgr6oDOp20Q39xnuAzmSpn7SxIs11++uTLC882fXHw7hUSOFyw==
X-Received: by 2002:a17:90a:191e:b0:1bd:5400:8327 with SMTP id
 30-20020a17090a191e00b001bd54008327mr1472274pjg.121.1645999352672; 
 Sun, 27 Feb 2022 14:02:32 -0800 (PST)
Received: from [192.168.1.115] (32.red-88-28-25.dynamicip.rima-tde.net.
 [88.28.25.32]) by smtp.gmail.com with ESMTPSA id
 mi9-20020a17090b4b4900b001bc8dd413fesm8587677pjb.19.2022.02.27.14.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 14:02:32 -0800 (PST)
Message-ID: <87b66e86-0792-3143-b9f5-225b3c45309c@gmail.com>
Date: Sun, 27 Feb 2022 23:02:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 4/7] target/nios2: Hoist R_ZERO check in rdctl
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220227182125.21809-1-richard.henderson@linaro.org>
 <20220227182125.21809-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220227182125.21809-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/2/22 19:21, Richard Henderson wrote:
> This will avoid having to replicate the check to additional cases.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/nios2/translate.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


