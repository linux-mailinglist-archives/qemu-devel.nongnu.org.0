Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0D5627246
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Nov 2022 20:45:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouIvJ-0007Uj-4W; Sun, 13 Nov 2022 14:45:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouIvF-0007Tm-Ui
 for qemu-devel@nongnu.org; Sun, 13 Nov 2022 14:45:41 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ouIvE-0002Cs-9y
 for qemu-devel@nongnu.org; Sun, 13 Nov 2022 14:45:41 -0500
Received: by mail-wr1-x42c.google.com with SMTP id l14so13895907wrw.2
 for <qemu-devel@nongnu.org>; Sun, 13 Nov 2022 11:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0lLtmNQ6LH5I+HcnrU5C5VjkZ7wbmYvbDofxtU+sGGs=;
 b=F4ivjorNGs/5tVUn4A8mQuzmiy3MnLpSL7oW71ZWO7L7cqdf1J5asX4aJEvp+7zyOK
 7RpCZgUjHUmkIBKVleQn+zLyEBu2tOd1QjGG3qUe3V73dVjcfqkK8gimW0PzlLw45DY4
 4rZzZfaw3/iJRPvr5EX7fqzimz5wjE1CCJcCwgMA0HCa4KXBWA/wYPMR1E6H/GT8bhX1
 l41Yj47szKSWI9iiL2oTHGmzKRvyqK0hMLsALlwLrAxHRsVtROa7Ff8jJ/LXTnlJTPcE
 DOqhjkxpR/wOARAHYxBSnjnaSgh6iRsa+zj479NW+HBrcvCp0q2QLR4HvfGl7ndr1YvY
 La5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0lLtmNQ6LH5I+HcnrU5C5VjkZ7wbmYvbDofxtU+sGGs=;
 b=pV6tXilagGszjBwafMBJzMXx6bvB8j0cZfhKeEyugAxYJ4Q/Ms+0Ylk6iziGrqI4Rx
 8wup1o+WAVCYsSIUxzZWh/KAbtgl+YBJcSdoSZecpXc1OvMPP5UYuegrPaICamGbYF/k
 JGWWH/fpG52cYkZfjpANoyGkEYDJUz9C03vEtBWS4uR9/qNLQtJ+FBlrt8EJ53DaWBb/
 TUdRbXEOnYAs8Qd7EGKw3gMkwcuCVVUZ5kfYxpGHuF8mcYqvdRNH1ByhEgvOMe6pt3wc
 cnojFhjqhXKXPvqi+qbyuhmn3K4NJSoplEPdqSJgaZ9jMA2t2Q+33DUVeCRWgO7TZRz9
 m3eA==
X-Gm-Message-State: ANoB5pmZEp4rWWba5mLWSdgR5FfLC1jrq+5bOBEdui+oGdRhZ66EaI8s
 g31+j8InKselwIdAv+9OeTHT8A==
X-Google-Smtp-Source: AA0mqf6xuvGNUVhNolFBefvdH/D9A+cp1z/9SrgOmT7Wvxv0cxmncjMobHK9SgBhr7Xs1+bg8ivR1Q==
X-Received: by 2002:a05:6000:1146:b0:236:6aa1:5f13 with SMTP id
 d6-20020a056000114600b002366aa15f13mr5848969wrx.305.1668368738784; 
 Sun, 13 Nov 2022 11:45:38 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a5d554d000000b002366e3f1497sm7738205wrw.6.2022.11.13.11.45.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Nov 2022 11:45:38 -0800 (PST)
Message-ID: <ccdea475-72e7-07aa-079d-e40ff04b7184@linaro.org>
Date: Sun, 13 Nov 2022 20:45:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v5 11/20] target/sparc: initialise MemTxAttrs for CPU
 access
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-12-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221111182535.64844-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/11/22 19:25, Alex Bennée wrote:
> Both of the TLB fill functions and the cpu_sparc_get_phys_page deal
> with CPU based access. Use the new MEMTXATTRS_CPU constructor to
> ensure the correct CPU id is filled in should it ever be needed by any
> devices later.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/sparc/mmu_helper.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


