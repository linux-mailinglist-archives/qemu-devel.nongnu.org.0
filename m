Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 663284A39B8
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 22:09:00 +0100 (CET)
Received: from localhost ([::1]:50606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEHRT-0003u8-IL
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 16:08:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEHPG-0002C2-08
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 16:06:42 -0500
Received: from [2607:f8b0:4864:20::1029] (port=53899
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEHPE-0006Df-H0
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 16:06:41 -0500
Received: by mail-pj1-x1029.google.com with SMTP id h12so11860413pjq.3
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 13:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YL6/s8Y5sCxxTBp3nmiCyFu6go7ORuhrFxSDrzkpspg=;
 b=tyfdfGbEgdwlMjbH5CtaK2298xXuGzWYBJ7ac0T/F0uXKmq2hSLiUNokhupXpeCwXK
 M60sx9B8K8/y5a3ADec7etv+ny8qbkMm2n4JlGNiOfcpPWjJVmT1whudpRLTXM+ZCJVU
 02ZYm8Ft/aUM045n1VjgeDaTtGafOl9rQ4gNdfg4c8iLer7bP5p7YH2JIQ3MhlA0+4K2
 9WLYLOKvEhzUTk2oQTFgevyH21n4j3KnXpprgqQhdRZSlipTNHHsW36Xp2MH2+KF8JTH
 qbvYjHdVnagIOMER4zYZISuyjKNaXniFC34qXYpn47O0a23RP2tg/Uf7ILX0wwnwTrnZ
 Hjcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YL6/s8Y5sCxxTBp3nmiCyFu6go7ORuhrFxSDrzkpspg=;
 b=6Aho3Sng0yziWjTX+ElOZGOCbdUBOZMceTP3x+7a3ywJ5YdgnGyN5zyr7WOK6qpkSn
 Q93NI7ZfgSiomiPjjjr+eHDiPo+4NRt2hL7NL/JikNAe4x5KuWhI3oZS2Q7U2PXjZOGP
 3P+zlFyySpKXiPk00h/BAU+uSADwGKqXv8eNE1X7EcwbFx6zXq8U3PK6tGj2yGwEXw2G
 f0nCHY7P94kBNguoveqVV3Ppr9cIHAgqitET19Ojk0AkTI5WmSzHUNLb5oC+qNjlu+Wn
 KfG3q7+n2sHEN7PfkQZwG4ohH4UaPp3shRA6VforPjjgsSfpsSp0bfpN9HRULmsM9GGt
 TDag==
X-Gm-Message-State: AOAM532LF13gHFYWwK7D49iAAAnIcMZaUmNuj19ZHGTOEZ4i0ZKnHwJM
 MaWLcf7fJ5jk4zwDPl7+i2VKfQhA3QVQVB+W
X-Google-Smtp-Source: ABdhPJylPR5VHb1oq0AU+UIlKUY9CZUCQCKY/QmMLGstk0/Tbtiqk6LTaguab5T0/p8wB+dhz/nE+g==
X-Received: by 2002:a17:90b:1e42:: with SMTP id
 pi2mr21313343pjb.176.1643576799246; 
 Sun, 30 Jan 2022 13:06:39 -0800 (PST)
Received: from [192.168.2.37] (240.194.168.125.sta.wbroadband.net.au.
 [125.168.194.240])
 by smtp.gmail.com with ESMTPSA id q19sm15540594pfn.159.2022.01.30.13.06.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 13:06:38 -0800 (PST)
Message-ID: <33e05a91-34d6-18da-d84e-37bc76bbddbb@linaro.org>
Date: Mon, 31 Jan 2022 08:06:34 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 7/7] target/riscv: add a MAINTAINERS entry for
 XVentanaCondOps
Content-Language: en-US
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20220128145642.1305416-1-philipp.tomsich@vrull.eu>
 <20220128145642.1305416-8-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220128145642.1305416-8-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Greg Favor <gfavor@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/22 01:56, Philipp Tomsich wrote:
> The XVentanaCondOps extension is supported by VRULL on behalf of the
> Ventana Micro.  Add myself as a point-of-contact.
> 
> Signed-off-by: Philipp Tomsich<philipp.tomsich@vrull.eu>
> 
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

