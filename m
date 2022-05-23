Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 941215311BD
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 17:56:56 +0200 (CEST)
Received: from localhost ([::1]:34776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntAQR-0007gq-GT
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 11:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntAOQ-0006NJ-0R
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:54:50 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:33599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntAOM-0008T1-Fb
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:54:48 -0400
Received: by mail-pg1-x533.google.com with SMTP id r71so14083820pgr.0
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 08:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nNx+pOO36hyIRA22R39vbgnJWME7+8ZjeHNBeaJn698=;
 b=zTU+7DBIO86SF/C5kQIagSDMBIa2ag9snecLEk51SNVvBbYalKcC3GLdf+daxH27MR
 Qiaub2XL42RZlMDv05t6Ltwl2DV/cqPpj8JIiccpSME7cMjhdDbUcW5yNRFK3EQO7Knc
 liQf/viLqiIqmbUMmZjbPYZcr2s8n2x1eFVdlQVc1X0fddJfnkvPr/nSQ2gYnKB/LxEM
 GcLsh+V8NHstuG3/2dww93gH31V/U/6+QAgeKuLzwkZ112fMSipMopJNdybuJ/QNWX64
 q5lSR1Xw4hib+9YKxYRBs2YMx4/HslqsPjbV9WZIcQeo75ODmTq25j3W1SUx65PVXNT/
 N0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nNx+pOO36hyIRA22R39vbgnJWME7+8ZjeHNBeaJn698=;
 b=7iL9dVYys1g92Y3U7edB4aZz78ZkG51YDxd0Kn+4L1tv195pDuLRytNu6ec5GNzkwE
 asOeQISXxAMR3cR7Qukime8ehlEYOYUCPutK+iB/lqws20uKBfLoIgyoVX+3JGMZETB4
 Bp2sIUGCXVj7/SRqtImMo9xdstJua3VwYraVjzV0NWm0k6bRajHadRPhGvXhFt7jug9x
 P0il9Tqlou59OUS67FGH6LirJ/4oRMGyc+5NmFEFvuLCljtBhD7HUeM/prAEccr0g9Vz
 e0irLooeXbVekSEzr3fxbReQi3Vwq3hPjgpHuszBgY4jPpiddQRqoZUkgEzQGreK20XX
 mIFw==
X-Gm-Message-State: AOAM531fUIhWXztsgcLQ7R/X609BV9UdXL9HyKg0iSQ/1QNv7iG2KPk/
 bCWQsLoRtGJi/O/eZqr9OMGWlA==
X-Google-Smtp-Source: ABdhPJyXZbpV/8fdcgWG8Gm4nQ5/80du/SlLB7InVVK27QQ4jt0nSNF8UFnB6QVHY9Qvcvlt0NNROg==
X-Received: by 2002:a63:2317:0:b0:3c1:f437:2e7c with SMTP id
 j23-20020a632317000000b003c1f4372e7cmr20022158pgj.351.1653321285011; 
 Mon, 23 May 2022 08:54:45 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 y132-20020a62ce8a000000b00518285976cdsm7362591pfg.9.2022.05.23.08.54.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 08:54:44 -0700 (PDT)
Message-ID: <8197ab7c-0a6c-294a-c8e1-2c5ca787fc54@linaro.org>
Date: Mon, 23 May 2022 08:54:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 06/12] target/ppc: implement xscvspdpn with
 helper_todouble
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220519201822.465229-1-matheus.ferst@eldorado.org.br>
 <20220519201822.465229-7-matheus.ferst@eldorado.org.br>
 <137135f0-c764-bce3-6c18-da7478de6788@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <137135f0-c764-bce3-6c18-da7478de6788@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/23/22 06:48, Daniel Henrique Barboza wrote:
> Checking 0006-target-ppc-declare-xscvspdpn-helper-with-call-flags.patch...
> ERROR: spaces required around that '*' (ctx:WxV)
> #69: FILE: target/ppc/translate/vsx-impl.c.inc:1049:
> +bool trans_XSCVSPDPN(DisasContext *ctx, arg_XX2 *a)
>                                                   ^
> 
> My guess is that since the var 'arg_XX2' ends with a numeral the script
> thinks that the following '*' is an arithmetic operation. Problem is that
> we have other examples of this kind of declaration in the same file, e.g.:
> 
> 
> static bool trans_XVCVBF16SPN(DisasContext *ctx, arg_XX2 *a)
> 
> 
> 
> Is there a way to convince checkpatch.pl that this is an okay format?

Not that I know of.  I just ignore these parsing errors.


r~

