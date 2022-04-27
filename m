Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AED2A510E08
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 03:44:30 +0200 (CEST)
Received: from localhost ([::1]:46662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njWjF-0004jt-R6
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 21:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njWi3-00042j-Tz
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 21:43:15 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:34557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njWhz-0007ge-9w
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 21:43:12 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 d23-20020a17090a115700b001d2bde6c234so2858598pje.1
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 18:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=q9nh7GDMjoEWtpr4dM/T/HW5Sz+GgP7NA0I9LjN6is8=;
 b=TW41KJ/8D1AN1wFTw2U91ihw2AuKpSPc6nh6p/m3MuNE+3M/WMfCTNkOfRYZ2WouyQ
 f3HVYdnTi5rutHced1PgOeYa7zVQMxiUjxBm3u6pbpDF/xuGdTVhqxDawikXdjYDGLT+
 sm3qrFeFXl8ryvSRIbG8Ax2e12zhAyf9DDnz3DQw3yiscn/6nCer4Lm1vhi1ksLpHPv3
 ayh4eb9/MVNlln3+RBEgMJJh8q5N3cjUrlelYHP3z7t4ExhhySnNTi5JXVyB4Ldfm7/b
 jRAWmUbwQ8zaoqJ3i6qTji4Yb7UtwoQVa3akheiqfE/ryxUSz+Z11oHT4v96M7bE+1GI
 kfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=q9nh7GDMjoEWtpr4dM/T/HW5Sz+GgP7NA0I9LjN6is8=;
 b=Tg0X3yLXtkTDEqZYZ7cwQrUp/SDm69ceOdvG3xnhp50e+c52p740mewasn41PC2eUv
 LvKgEefccXaIB+k4iYYJfxYf3KxMFqOeUyBXP84Aj0mfDD9/1GXJvEM5B5jjErgqa6kg
 ivLdalRWXfQYobSWcqgWhZqLzO5PWOoTVgC9V/IuYKZqhezCXottBhk4jaxK5IT9IiUY
 UdOmW01MswsuR86A/lLmcBWIUaUI5vLvydJQKMO154DMaYiPixwPfx0UPVIbnubVLnyZ
 RYMzp8D9/FNhZeARfgcifAVEQtMMpM5MS1m/arkqYnGqs9z75KOQDwTzl1CB0N8mBIiF
 clVw==
X-Gm-Message-State: AOAM533D+eL+nh7GNTUtPKnDHrKTJpmzShUBn40yg/Q3qvU4Q8r+Cisl
 UFkhGohhPfchnf45sSRMY1Ip4A==
X-Google-Smtp-Source: ABdhPJxN7HLdVON26rq22gwl9iPSwkh7qjhrSijMvRXJuP0lpAFt3aHokwTcBcl43PGrsdYSfZ7Nnw==
X-Received: by 2002:a17:903:240c:b0:153:c452:f282 with SMTP id
 e12-20020a170903240c00b00153c452f282mr25659793plo.88.1651023789468; 
 Tue, 26 Apr 2022 18:43:09 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 f127-20020a62db85000000b0050d3dd1138csm8973767pfg.126.2022.04.26.18.43.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 18:43:08 -0700 (PDT)
Message-ID: <0d3b971a-d521-785b-ca05-065c198507b4@linaro.org>
Date: Tue, 26 Apr 2022 18:43:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 30/43] hw/loongarch: Add support loongson3 virt machine
 type.
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
 <20220425091027.2877892-31-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220425091027.2877892-31-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/22 02:10, Xiaojuan Yang wrote:
> Emulate a 3A5000 board use the new loongarch instruction.
> 3A5000 belongs to the Loongson3 series processors.
> The board consists of a 3A5000 cpu model and the virt
> bridge. The host 3A5000 board is really complicated and
> contains many functions.Now for the tcg softmmu mode
> only part functions are emulated.
> 
> More detailed info you can see
> https://github.com/loongson/LoongArch-Documentation
> 
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

