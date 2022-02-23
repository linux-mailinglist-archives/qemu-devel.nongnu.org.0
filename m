Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB434C0667
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 01:51:59 +0100 (CET)
Received: from localhost ([::1]:44822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMfss-0006yP-0h
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 19:51:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMfjL-0004g2-RH
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 19:42:08 -0500
Received: from [2607:f8b0:4864:20::42e] (port=35651
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMfjJ-0006M6-D8
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 19:42:07 -0500
Received: by mail-pf1-x42e.google.com with SMTP id l19so13762065pfu.2
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 16:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Olf0wa2AGpLOBwpdX3mJaOLFXwsdvtE1Sl8mdzXCuGA=;
 b=SYIZKQXTuU9zHry28De5YqDVveyha7ybMBEgDCpd1mcxiGPHwgKG73A0mbsrU9BSGf
 mYWHApXd4C155mpiL3MZuqBSUPCQw/T9mm2TLmXu2pn08iUOHCMyH3HKoSR76YzLFiQ0
 pu4Yt5/CTVF/1mwHqcNib2Bx1DcX9To9mpGnQPYmUGs1fFiS0gQsNkOyFxtlDLSIn2nC
 CqRgr8+Wsr9aNi6nd7h/2hSF+x4JImDfpfyIdAYxHmBnGAU6xBi2sOQCdmvdTt9X0ntq
 EevJoG01QHCjE/Qu3I/KRrOFcFEaig5Zvznevg+GeoMBxaRtiTJD83F1cDKG9WoySqMh
 mr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Olf0wa2AGpLOBwpdX3mJaOLFXwsdvtE1Sl8mdzXCuGA=;
 b=VbUstz/IIovT5uqV+yC3Jk3ahZJ/jWJpwM1fBI6qGqGuvAndk6OZHUMoJLioNlVnaV
 fFprHt4zJT5lO4jBBeq+fs4yO475bJKmzTwgwiTBvoFuOOZIG5hJVFSveQORkbEtzsqv
 bQP8dOqTkiNc14ExEiU1U6nMpzVEqrMa8pcUh65LV56SkDEKu1oA2ncjTFYVoVpVB2ai
 CyQYwKHmRxEwKImM6CamZtF9S4ZjL4FmkdKOjhsF/9gzdBBCDUG2jyYaIuWxwyt04/cy
 gj24lBPA3Vefigq+3j/w6008diRGlKO8Fwnj+izhyQPOfEbHZoLKYMhDWz+CfveBydI1
 dHCA==
X-Gm-Message-State: AOAM532rGsYf3CN4AhjjIjvjmKOlsDe8q8yjD0MJtnwv+Q1g0gNiJZqO
 zHCl5W6y8yigy+zV0504hwEzO0DOt0N0hg==
X-Google-Smtp-Source: ABdhPJyuSCvSGXRKZS/j5sZnnraUTW6Z7u/F49suU5qPZysywy1obU3mJQAQ/ujSBHKPHs/O2F4S/Q==
X-Received: by 2002:a63:4041:0:b0:372:c918:631a with SMTP id
 n62-20020a634041000000b00372c918631amr21803556pga.370.1645576908084; 
 Tue, 22 Feb 2022 16:41:48 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id n13sm787406pjq.13.2022.02.22.16.41.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 16:41:47 -0800 (PST)
Message-ID: <a776c647-7367-f62a-dbb7-c3796800e646@linaro.org>
Date: Tue, 22 Feb 2022 14:41:44 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 43/47] target/ppc: Implement xs{max,min}cqp
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-44-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-44-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> From: Víctor Colombo<victor.colombo@eldorado.org.br>
> 
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/fpu_helper.c             | 2 ++
>   target/ppc/helper.h                 | 2 ++
>   target/ppc/insn32.decode            | 3 +++
>   target/ppc/translate/vsx-impl.c.inc | 2 ++
>   4 files changed, 9 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

