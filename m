Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B133F54693B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 17:15:47 +0200 (CEST)
Received: from localhost ([::1]:49394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzgMU-0006aM-QE
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 11:15:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzgJT-0003aC-IP
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 11:12:40 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:45688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzgJS-0007I0-8k
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 11:12:39 -0400
Received: by mail-pf1-x433.google.com with SMTP id x138so2298290pfc.12
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 08:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WXgxa6OudNEYQ3BmkG5Zfbk0pwB1j+Wt4sIYiDrFChY=;
 b=jvSd/B3Msm0BG3Ddqx8wnV9vW1IEjjtc+El79PETk77y7G9lXQunRXmhMO3riNTU2r
 LvN4FfJal7skROmOrVJuKhJJNgCbsuWa0hahfolGul3sAhOdXSJ0+DvONLeY1f6Bcsqd
 EMs0BJGxffPwXU81a35bGv1JFVeie4LfvXk2TFJ6tQgYJQ/N4Sf+uMWs0f6DTI+2DkGE
 tBBr+HgkfMw8y5UApQP2BzmmcEcYyRIttjORNtq9AEUXN1TsLT+YHC+iJyi+V5BcurhR
 NUZqrwAPXdEQlwuV5XYWsapz+Z64SoBfT6QtfaYlL6DZqmzxPONYH3hV86TY/r8wGBb9
 dkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WXgxa6OudNEYQ3BmkG5Zfbk0pwB1j+Wt4sIYiDrFChY=;
 b=qc/hH6nyeJuGL/1k7EH9R9SFraUqRw665VqjDyILVgULypdMKeUHM4+bVJ+plGoe9l
 6I1IAhIgFCSSLZjBRp7rxV/sOtN5KhBWGQcntfpIUhNXHRUbBu89llO6tvgsab6CPlaA
 H3pdLMUUXHqja1qu+03HayjLGp3Qa9+mU92cOIzNO4yhdfuD59UEP8vTEHgYUnVv7nku
 hm4EXSOlOAIbrlwtySPPWoV4Z/i0TyGQ9Djg5yKt7hAA474LXVBdTlFDrBuip7AUNG5m
 Fk+11KtN3N+Fv1y3LKlUR2sMF9hxVki/q2h9ckP4LxIQ8wZyKixUAVEg/TSMQJaKkuRm
 kXvw==
X-Gm-Message-State: AOAM532UGRox6+UV3bQlrHXget7zg7TVsJoaD9LN+Z9kU7jpXVqBu0D6
 do8b3DbaOODLvxgKFi63J4nu5jYMHaQ=
X-Google-Smtp-Source: ABdhPJwUApoxkXGBwwCkvw587q9nQfpOExDUkUU2Pq1XU4JBhXpuHjxFXpWWNk+iqPhSueAYQKOpnQ==
X-Received: by 2002:a63:680a:0:b0:3fd:233:79ca with SMTP id
 d10-20020a63680a000000b003fd023379camr37402289pgc.233.1654873955780; 
 Fri, 10 Jun 2022 08:12:35 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a17090340cf00b0016168e90f2csm18704043pld.208.2022.06.10.08.12.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 08:12:35 -0700 (PDT)
Message-ID: <e238125a-e42e-cb72-9dbf-9a794ff8a649@amsat.org>
Date: Fri, 10 Jun 2022 17:12:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v4 11/11] target/mips: Remove GET_TARGET_STRING and
 FREE_TARGET_STRING
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220608051945.802339-1-richard.henderson@linaro.org>
 <20220608051945.802339-12-richard.henderson@linaro.org>
In-Reply-To: <20220608051945.802339-12-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 8/6/22 07:19, Richard Henderson wrote:
> Inline these macros into the only two callers.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/mips/tcg/sysemu/mips-semi.c | 27 +++++++++------------------
>   1 file changed, 9 insertions(+), 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


