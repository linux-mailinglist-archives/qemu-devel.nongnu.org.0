Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BF835CA43
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 17:42:26 +0200 (CEST)
Received: from localhost ([::1]:45404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVyhl-000690-JM
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 11:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lVygJ-0005AE-8u
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 11:40:55 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:35833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lVygH-0004Fz-J8
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 11:40:54 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 il9-20020a17090b1649b0290114bcb0d6c2so9080021pjb.0
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 08:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L/pRjHXnFo51gYjRF/+SU0qd/zGF3hh2Z66FSRH448g=;
 b=x+OYjH9hFkhHD5IXDqu1QDUns5mjk3QgKsZ6s+d6jepJU61EPwa8cCCz9azRUIO+8L
 kPusspPacdvy5ZY1Ej6AyEVbyP84sIFPQdsEVFEEs4MtyKcZoe5s53uEhWRG3bgCrnaW
 Dt2FWxVcrYwh/Zz+WXVUl+0JOXGPlEKD7MhSfDEBbI8hREBxsnIk+M3G4FR8v9i+v4nl
 Y7oGzkXSyLudDSnyUsjh6HH/M5Lz/+PlYatXnpbZZ5B6WGH9pfiuAMqKHtrSEYXx2Lgk
 V+w6bTWCOrR8ATcbprYyrgfhNKkOF3/pY++GIf7PjCV0SHGlZv4gCAaoDEsuIQr46TPt
 +ZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L/pRjHXnFo51gYjRF/+SU0qd/zGF3hh2Z66FSRH448g=;
 b=q6fzTCUodP4YFkugH2VWIrBycmB3tXA1pVCG8b2VvZ5veybR+8fGTL/5yQ54dQ4uZr
 NFYvremh/AKXWjJXu9fBscWvNK4bmsVxamTMJhqC869nzJtsQkIYh/uJZkqZyDAByWMC
 u54+WfOJMKdDRT6iH2gAP0vHhfAD4oxoK800zzSph0LzZpIopUZW2nlEWFp8ywtnbV1u
 xjpaODhC1pZyDU6yuBujGMJerEVWEUBVx37B8mKINFWjeFrGjsR1cWKAKQ7EVXX2pdTp
 RD+LHtihuqwNDTfx3Wv6vCAOMeBAU3C/WAKUfAX08NtsLAbgoF/V6VGwMM2/44ITZP0w
 QOrA==
X-Gm-Message-State: AOAM531PZSz+RihAnitMsWu2csNRqZakhDTYxtoIQwzKxmxAYNfqPN9y
 HQaESV5tV3RsGpvGH3sqjMDTMQ==
X-Google-Smtp-Source: ABdhPJzMeiXAX+gJNGNmmo5CRHpp0Crz3JEMpPPwhkiqZxKAXzlNMbyHQstPTV8DA5ed8XeKUdupUg==
X-Received: by 2002:a17:90a:6c45:: with SMTP id
 x63mr28913758pjj.138.1618242051378; 
 Mon, 12 Apr 2021 08:40:51 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id n4sm10462739pfu.45.2021.04.12.08.40.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Apr 2021 08:40:50 -0700 (PDT)
Subject: Re: [PATCH 2/4] target/ppc: added solutions for building with
 disable-tcg
To: David Gibson <david@gibson.dropbear.id.au>,
 "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
References: <20210409151916.97326-1-bruno.larsen@eldorado.org.br>
 <20210409151916.97326-3-bruno.larsen@eldorado.org.br>
 <YHPV19l06sgXCNEj@yekko.fritz.box>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <26d5b8e4-693d-f747-3b7f-d984a43f0209@linaro.org>
Date: Mon, 12 Apr 2021 08:40:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHPV19l06sgXCNEj@yekko.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, lagarcia@br.ibm.com, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 andre.silva@eldorado.org.br, matheus.ferst@eldorado.org.br,
 luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/11/21 10:08 PM, David Gibson wrote:
> Not directly related to what you're trying to accomplish here, but the
> whole vscr_sat thing looks really weird.  I have no idea why we're
> splitting out the storage of VSCR[SAT] for the TCG case at all.  If
> you wanted to clean that up as a preliminary, I'd be grateful.

That's about efficiently implementing the vector saturation instructions in 
TCG.  See GEN_VXFORM_SAT in translate/vmx-impl.c.inc.

The SAT bit is represented as a vector that e.g. compares the result of 
addition with the result of saturating addition.  We don't need to resolve that 
to a single bit until the VSCR register is read.


r~

