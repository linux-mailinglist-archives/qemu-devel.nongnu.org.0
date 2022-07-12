Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF8457178C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 12:49:03 +0200 (CEST)
Received: from localhost ([::1]:46948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBDRu-00068b-Cz
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 06:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBDEy-00055M-NX
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:35:40 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:34415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBDEx-0003be-67
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:35:40 -0400
Received: by mail-pl1-x62b.google.com with SMTP id z1so6913172plb.1
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 03:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=t4UNkJju1Vr7eV8CpE7Tkp9LwU7fd6ukHE9W4PlUp2Y=;
 b=KPStznxitazAKL+UqKProhiGjeKjGHB/RVQbI0uA7Zek8IeHSJl7gGw9xHo1tzu2ax
 thiTUQOHJ2D33A5eIrnT67iTvF/voqMURw0LA7bAslsFeOfu8YKYmrAfc8YnzaoekXdF
 5vo+2LAUkqV02rUQy3bu41xLRePjvqU7YQzleem6Sq+itIEUUfiXWXXmJTLpCFdknuKu
 41dofTcY4cGV9BZLhxkG05Tj3b8j301rTvTVwn1nn3GASotHooZh7BWznn/thAnpoG/F
 YpQT5QPpn7bfNTOs/Z2tcPiuEX/hlC5ZIc1/JnX7zu6pH4vWnhWLt6qzztUbh7b2NQXH
 mviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=t4UNkJju1Vr7eV8CpE7Tkp9LwU7fd6ukHE9W4PlUp2Y=;
 b=8JjxKngiPkJ87pKSdfpyIrwXQfq/eItbC47llkxGu6aZuXSwzNn9ClDPcrc/YsszqC
 tUsatxAAzyOL9VyYlHwG+xsLNHUXdH/wuqyVQSVACONGdfxuE1PFPKfbNPDehD6+OS4N
 T4YOxNdEWSlVoZlc2V7TABRSSdqT0YIzuwaHEI+uR0rTCm6ZY2O3B5n/UfpIWNLM2eww
 lH92/tQzj1UDb4Fz5kl7lxqupvadBx6kT3z39jJ/Oqs/U9g3PwNTcr6tcAGtuQ6OsiEL
 mb5COFYM1XaLmc3dGU/1Rg517yuonsh9x9l89bfs1j2rAC2YDvDoEKWRpCZ3p+OWSGw7
 9q0g==
X-Gm-Message-State: AJIora/Tjju/I5P5xRFr/BbuRwWrxCDWR4ohtT+EIz2v730Fen/Tf9dr
 pfX6ceBxJ8Re4yjZAOb98NQTzg==
X-Google-Smtp-Source: AGRyM1uUpm+ORGwbzzjZLiXCRccuftx6GE8UPh3jnh+8JSfGvR7pAgTt49o3WEt0x6bebg5e7ZkaRw==
X-Received: by 2002:a17:902:ce05:b0:16b:e725:6f6c with SMTP id
 k5-20020a170902ce0500b0016be7256f6cmr23321311plg.110.1657622137476; 
 Tue, 12 Jul 2022 03:35:37 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 i19-20020a17090320d300b0016a1e2c2efcsm6362554plb.223.2022.07.12.03.35.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 03:35:37 -0700 (PDT)
Message-ID: <6c60fe1e-bb15-e6ac-8b0c-72af0a57c2c6@linaro.org>
Date: Tue, 12 Jul 2022 16:05:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH] docs/devel: fix description of
 OBJECT_DECLARE_SIMPLE_TYPE
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220712103131.2006653-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220712103131.2006653-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/12/22 16:01, Alex Bennée wrote:
> Since 30b5707c26 (qom: Remove module_obj_name parameter from
> OBJECT_DECLARE* macros) we don't need the additional two parameters.
> Fix the documentation.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   docs/devel/qom.rst | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

