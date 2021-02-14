Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C75B31B180
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 18:18:15 +0100 (CET)
Received: from localhost ([::1]:47032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBL2D-0000kQ-4a
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 12:18:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBL0l-0008Fm-Sn
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 12:16:43 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:41574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBL0k-00076o-Dr
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 12:16:43 -0500
Received: by mail-pl1-x62e.google.com with SMTP id a9so305827plh.8
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 09:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UcXPnpfWT9fzpLoxmEWcnhDqeoJwiOWCu2a4BLSW1HI=;
 b=o6GN8GEFZFSMBCc639es+YJmGJutz/2ogbXag5h7BqKO/WlcEO7rGb762dNK1Qt9YR
 bEsEMBfc4VieUP7llK2OytqznDNZeQRmmVEI337Xe/0/oUWfrFhF94m347IIk+FdzMyo
 oF2fmaZvFe7/gaSigWelQRA2JofCL/iLN1Gkk0EtfvRr3JjN6eXhYSUJM5xuTwBTcttb
 Du/hu+NkATjT6P/BPHupEPDrhWctXvGD6M1t76XsSrZ9KH4ltX67RA41dTEaTXZlJgns
 ljmzrz8P7rqR/Fh6iLM5isF2Jqjs+VogV/a/NDXWAYVMtgutRPX4gycuPTZ1HHDjaP2c
 PBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UcXPnpfWT9fzpLoxmEWcnhDqeoJwiOWCu2a4BLSW1HI=;
 b=AYVDqijiA+d77j1OTjFXwTaA60zL/Vc0H4hW49ElovZmrcYzI3cDpKwJmrwYsAVCFz
 z2XrLHo6ZRb08LMI8lmPMpavo7CioUX+oO/hIua928K7OW5jX5BCkTXb1DdGHj6tD1Q4
 RyjXwvj6IjGrKPna1cHYjWvGtRFgRnY85lG5Aot91X4NutvfHPmC5RnVtH7vn/Y8FiIr
 ejW5k5RxhU5mlXv4CaIpJY9aGmtSRIVQJtsF7NMp2vnPo6VAuNtaTTrSG20IAgVOb46I
 KTzzx08QujtfsLXPvQty/0f2hxq8S4y4mTmJCSfXdImfq6+40J3iWm0a0iBtaWSuLvG7
 qgVA==
X-Gm-Message-State: AOAM531twEKeIWcc1DFlBMBbDIJdKpEzj0UmPcUVa4x5Wkk86r6ek25E
 VjpboccA262Xu1CSFOUS6wSf7Q==
X-Google-Smtp-Source: ABdhPJyjJQMLME4V4XP4OZ8esTZKlZngGaOEQfAEMERv1PWBGoXz9LRxd+Hq/Dg3teUXhDLuZY7a6Q==
X-Received: by 2002:a17:902:e84e:b029:e2:dbb6:73f8 with SMTP id
 t14-20020a170902e84eb02900e2dbb673f8mr11685190plg.52.1613323000717; 
 Sun, 14 Feb 2021 09:16:40 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 g15sm15362310pfb.30.2021.02.14.09.16.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 09:16:40 -0800 (PST)
Subject: Re: [PATCH v8 09/35] Hexagon (target/hexagon) architecture types
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-10-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b31720fe-1de1-eab9-eb6d-d0b05ec3c973@linaro.org>
Date: Sun, 14 Feb 2021 09:16:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-10-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: ale@rev.ng, alex.bennee@linaro.org, philmd@redhat.com, laurent@vivier.eu,
 bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/7/21 9:45 PM, Taylor Simpson wrote:
> Define types used in files imported from the Hexagon architecture library
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  target/hexagon/hex_arch_types.h | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 target/hexagon/hex_arch_types.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

