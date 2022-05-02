Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DB7517964
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 23:48:46 +0200 (CEST)
Received: from localhost ([::1]:51266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlduP-0000xZ-LR
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 17:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nldsv-00005U-0Q
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:47:13 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:38904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nldst-00040L-Jp
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:47:12 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so543711pjb.3
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 14:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HqZ68JeOQHIOr67u9WiIr9Rt0pivn7ZAlfTa+cKKU8M=;
 b=xgLkJQXsWkieDd7eNnIPSM0VMHCxEcV7ANLSsLfBjFUDJrFCVg6Hl/uvNbPZ+5MKNl
 o1fXRJrTywDxvAFqeyeq/WyWGnvKKLvtPHaaKIhulhMmIbu4d4gg70fz9vn6XKTc6QRA
 3VoCg0JTCyGL3S0d0Qajsq/fZuqKE0/M+WEER9X8hXqn1z0h5n/W3qBGz0aK/EJv4U7O
 dDZiaJqa/EbwnqsJb0Ug6ECXhFuormr8x0IF1ZzEMQ4E15s9fzyb5LVhqVoPoiEurYvJ
 NeOeQoVuHGZTBob/fP/qYS0629RfAEhL1Q/jAaN533Y9xvuBNKhR8SzF6hVoe54BPrfV
 nciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HqZ68JeOQHIOr67u9WiIr9Rt0pivn7ZAlfTa+cKKU8M=;
 b=btJtS+pZwbGXIRfFwn+aAUyKIpCmfqBgkLfzv7fSMj9QTYE61j41lFQUUEoFFOmVbl
 iFNQJB7Hx/K9CMluG8lfSPBMz9A4iF2eqZvOTxp6KuRRCBRB+fjPSc214GOIWOS18RAr
 Xy8wp4uqQ1HaW07qtr7vuJmBCHBlT0OYDAhVP1ZcUAEmUPWBfIa+NdHFHOzatXpj+nJ2
 +B+k66maY78q82KWoyr+p+vPqojETNPrIrkqUq0cpFu60OMP9EB6tzRtsUVfm/7uk1np
 r+bCOeYSACIloCWaUc6JfAaByxwCFOOQx85b6SgKrgOAhbZzvhWdVVnFh8fEv/UNL19V
 nSqg==
X-Gm-Message-State: AOAM530ABBmriLwyvKNuVl7m9bMirNhjhAH/UpstCS1SHHLADs9j3U5a
 8ZghTdKW6n8m8xs31zNLsphYfg==
X-Google-Smtp-Source: ABdhPJx8V07fdvL6mx1Bhfi5HavaHGg5friA1yIuIpKsNpHwpz1pmjh6E4QxdKGF/Q9kFEEzm7QqgQ==
X-Received: by 2002:a17:90b:1a8a:b0:1db:f282:5b3d with SMTP id
 ng10-20020a17090b1a8a00b001dbf2825b3dmr1286546pjb.198.1651528030171; 
 Mon, 02 May 2022 14:47:10 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 j22-20020aa78dd6000000b0050dc7628198sm5177638pfr.114.2022.05.02.14.47.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:47:09 -0700 (PDT)
Message-ID: <7526df52-95e9-a67d-f0d4-c5e53f9f83b0@linaro.org>
Date: Mon, 2 May 2022 14:47:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 15/21] target/ppc: Remove msr_dr macro
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, balaton@eik.bme.hu
References: <20220502143934.71908-1-victor.colombo@eldorado.org.br>
 <20220502143934.71908-16-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220502143934.71908-16-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 5/2/22 07:39, Víctor Colombo wrote:
>       if (!(value & env->msr & R_MSR_IR_MASK) ||
> -        ((value >> MSR_DR) & 1) != msr_dr) {
> +        !(value & env->msr & R_MSR_DR_MASK)) {

Xor, but then this becomes

   (value ^ env->msr) & (R_MSR_IR_MASK | R_MSR_DR_MASK)


r~

