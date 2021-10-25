Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 663EE439DE7
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 19:51:05 +0200 (CEST)
Received: from localhost ([::1]:56808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf47k-0002AY-4I
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 13:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf43U-0007kK-0g
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 13:46:44 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:37540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mf43S-0001ZD-08
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 13:46:39 -0400
Received: by mail-pg1-x531.google.com with SMTP id s136so11693248pgs.4
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 10:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PsY3srdz7P6HvoiYKkW5N5D1l2mQoeSJNpODmaarFUM=;
 b=vh8HUj4vIsuJ3BvDLDKCM6DHFGFOGMAyM7ze4XfNk4d9WZbLw/ssmVzASN2XsBgOiC
 h8u6SwFDwdp3bSkcE0X2owScovmzTE/Mxngh5cx/c5PYR72LhbWcE0a9vT5W01Oupows
 OLCGVDJPLlNxY0iqc9/LehYMYnw4eN42UUxdZrdlGafsNAW37SzoheDLLeM11nC+82O1
 CipYLOH4EE7amqqa9CsZKoc8FWr+nBHLNVw/By56k9EODGeGrTPeS07A9OjmvOB36tMd
 o7adfxJIdMzZy74esnkVfeMnwrLTbhoD1GtKc3siTB0Fr0qp6xd2V5FDwrjPxUk37lnV
 kzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PsY3srdz7P6HvoiYKkW5N5D1l2mQoeSJNpODmaarFUM=;
 b=a1aCt9GAMKbnHIbYjBrtYZhOXpXJs1SzdEiN8WNv/XWTjZC9Sc/ULQQ4FkDvSZ+oIp
 xTNy6ziiQ/6HU/NieBm+Kn44ZTwqF7S4A2kkqaAVYlPPROtVAns1yckaRpnKHcSAuhbN
 A/adpN0Iyq8LcJpSVYD9znCJ/6O8VitaBUbKjyAgbD41O6ccRmA/M2acItoDRQ70WPfX
 k/0RH+5r/P5UPTM2wL33WW0UJCrLvDNmnI1OfxPnCkKaG/CrMPNPxTKtpXCOvsjAWd3g
 SUJHNcLV+lc35h+KtHixdnvg7x6Ba/hXOZ0hENKAzJK2KF0LcMlBa3PvaFOOR9okv5LO
 hmKg==
X-Gm-Message-State: AOAM5317xwtjRujQikSP4iYRlQMA0HHCaDxz0HnkYWWmAC4QXXHUvKnH
 VmrjNuXZsbMWpAL+R9oM45jWww==
X-Google-Smtp-Source: ABdhPJw2XmY8TEddq9LCFBcZIqDpIGnrKEI/HqETLHTgxJPCnFdJD0KC/KF+nbLvHyX9VCcap3CPFQ==
X-Received: by 2002:a63:9554:: with SMTP id t20mr5823758pgn.36.1635183995447; 
 Mon, 25 Oct 2021 10:46:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id s13sm22348745pfk.175.2021.10.25.10.46.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 10:46:34 -0700 (PDT)
Subject: Re: [PATCH v3 36/48] tcg/optimize: Split out fold_xi_to_x
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-37-richard.henderson@linaro.org>
 <CPXPR80MB522451793293BE9FDB45EF99DA839@CPXPR80MB5224.lamprd80.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d53a7834-a3a8-75fe-66fd-74b955083131@linaro.org>
Date: Mon, 25 Oct 2021 10:46:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CPXPR80MB522451793293BE9FDB45EF99DA839@CPXPR80MB5224.lamprd80.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.846,
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/25/21 7:26 AM, Luis Fernando Fujita Pires wrote:
> You missed adding 'fold_xi_to_x(ctx, op, -1)' to fold_orc() in this commit.
> It ended up being added in patch 42, but it should be here.

Oops, yes.

> And should we use fold_xi_to_x() to optimize multiply and divide when i==1, too?

A good idea; I'll put that in a new patch.


r~

