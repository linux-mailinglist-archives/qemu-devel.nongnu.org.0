Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB3D3D4DAC
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 15:16:59 +0200 (CEST)
Received: from localhost ([::1]:52704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7e02-0000lx-8J
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 09:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7dzF-0008Vz-4y
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 09:16:09 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:33646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7dzA-000575-RL
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 09:16:08 -0400
Received: by mail-pl1-x62a.google.com with SMTP id a20so8704000plm.0
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 06:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kOuDiSh41YIUeII5CsFCEl7K0RVQxQgvwOtacPkxKHQ=;
 b=URTYvD5f3YWv3IRQiEuI7puit0TQKZ6sJ2UE3bEr5zA1/o6M4eEtkvjinMuP6/erfc
 7ruwXU/nE6I1bthbCGYOMHO9b3mNxfnAPdaMEjVQ78+ub11yhIqc4zJveSDFfFTF6cCV
 7nygNq26PCx90FvqBj5Xpg1Eo1QD72yUUtDkjcPGMBocqdKN767w7uHA4orUFlwx0H7Y
 svepQg+3AfivjU/6p8VoLusKnG/8xALSGqcO4Ll5IfodMrzLGHqbJGR8J4qOjAahRQ+b
 dLuvDKdFMwaYP83nUUzXAeOKIh4+DyLvU8u7IeB8FPZHNlQ7l1QW4N4vuD9HOOpbvAw+
 SbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kOuDiSh41YIUeII5CsFCEl7K0RVQxQgvwOtacPkxKHQ=;
 b=chxVpLAxiBwQckgTktrGMnoXEBfC2/OlRBX/i1CWkc8OOUDWjvCZuUhtZ67YP1nOAY
 U5G5txgqt2tGVOzbCDu4H7wR339tbbDzQyDxJ6QtmYo58nUcktFnulcelts+wBzofetq
 /p77cWlzeUevF1GKSjz/ARc3wZuTD8D0LMiuz+pqRXqubWRtwOIJXCjMQ09im16JafNF
 gkjbmVQxXq3/zbnJMl0mnWJYLxkDOs5vhdi4+f5NE5Bw1SIV5ojWXPGGwXTPJH0m/cKB
 NbOUjBx6cgNZPOeJFvy4Z2zPC/pR3LuAZL8oe4HUL4wdIH2zPaNR3fm1va/xJMocoYUN
 TYoQ==
X-Gm-Message-State: AOAM530XAjH1w9reSoyyz1KKfdSpmpqqmySeF74RV049erH/JX1QDggH
 sRCZL+5ZkL/ohFpB4/HFu/mhSA==
X-Google-Smtp-Source: ABdhPJz+BjO1m91Xent9mR9HN+HRMh6Vc009Qi/CirXeLCCvkMu1lM0VXnwiRoPQwmnXX3V0eySPaA==
X-Received: by 2002:a62:cd47:0:b029:329:714e:cce2 with SMTP id
 o68-20020a62cd470000b0290329714ecce2mr13396143pfg.22.1627218962601; 
 Sun, 25 Jul 2021 06:16:02 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id x7sm41059880pfc.96.2021.07.25.06.16.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 06:16:02 -0700 (PDT)
Subject: Re: [PATCH 10/20] Hexagon HVX (target/hexagon) C preprocessor for
 decode tree
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
 <1625528074-19440-11-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f02f146f-e96e-7f9a-4303-abd14f4de508@linaro.org>
Date: Sun, 25 Jul 2021 03:15:59 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1625528074-19440-11-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.091,
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/21 1:34 PM, Taylor Simpson wrote:
> +        char *name = (char *)opcode_names[opcode];
> +        if (strncmp(name, test, strlen(test)) == 0) {

Why did you cast away const here?


r~

