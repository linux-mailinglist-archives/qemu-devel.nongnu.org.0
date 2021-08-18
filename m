Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ECE3F0DDA
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 00:04:03 +0200 (CEST)
Received: from localhost ([::1]:46624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTfG-0006Uq-TD
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 18:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTdx-0005nw-PP
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:02:41 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:50796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTdv-0004ye-Qg
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:02:41 -0400
Received: by mail-wm1-x32b.google.com with SMTP id u1so2557097wmm.0
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 15:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=f0X3u5Kzp/x5FOzyhppDJtTcxYFEPcHT+NASd5BoXAI=;
 b=B7quNm98xUNxeEMB5jXkNdXSQ9SezD0kq4sJFmJik0lkPGeV7LrxHdW8kL+GYCWgbl
 sm5ki2RjQORWi2PX4Hpgr/r7E9vL9Dkbwh1rAXwVUxgwWrdcid4pAtVMV7FwPg8aX9ru
 Nt7Ek98BPRzpiisVoW1OdSAsD97DFWXEAVcX4nv1mHaYjOfwsToq9RvZsLyuWnzrv6n1
 KzcpTvFedvw1mufdz+b7k2DTy2MinQboMJ+6mL9zBfUl7pbmPd1qy6xfR8Jr5mD29aVg
 M0p7c49WuG6jmLM8QwpiRBaFOW7Gl2hWSZbDky8SSKwwmBPFMchD/pE+ZMseSitrVF8K
 BZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f0X3u5Kzp/x5FOzyhppDJtTcxYFEPcHT+NASd5BoXAI=;
 b=oazPs+4cTw+/tZzVoj/+bHNiKiVLrrQsmAoLiEsgThrVNPjWrSFyXQaiXbE2NGJKuq
 Bowe1V67hAD++Q0XBTbnw1DCtWvdScorXO4w+XMdwmMISr8BJUCYv5xVO8fsOxBGb580
 mu/laOy3XmVADVHXLg3qmGjIlgw4w+nU38BdWXnodD8iMO8DAGMwduxiPr5wXeGj/U1f
 oXYw6gufkLwE/qrW09CLN/nEDP8dSUOmkLkrCDEL2LgqVV5kJaZ7hbSWQcBka5r/Gilm
 GSNvInZX9AwsaGoQLaoHiX67sFD7Idiuy+mPSykJkBThuybv7q3/7ln7UcnGOloWPM/8
 xqvA==
X-Gm-Message-State: AOAM531VIQH+xk5iVBrqy5vT1AmXm4yWUpeIJ07chgRXf9ZNnmryyQiE
 92urrj9sKCuavtYAgpUdv2hh8eGhC7Q=
X-Google-Smtp-Source: ABdhPJwYVxcsDTJRlP6UNQZDxYw0d+Z8/2zyB8nGYWrHcFxpTddabQaK1jAvsUHFwBXriUK6W+MeIQ==
X-Received: by 2002:a1c:1b49:: with SMTP id b70mr10616573wmb.17.1629324157747; 
 Wed, 18 Aug 2021 15:02:37 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id q75sm6759769wme.40.2021.08.18.15.02.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 15:02:36 -0700 (PDT)
Subject: Re: [PATCH v3 09/14] tcg/arm: Drop inline markers
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210818212912.396794-1-richard.henderson@linaro.org>
 <20210818212912.396794-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <26dd4053-98b0-1737-729a-f1a638284037@amsat.org>
Date: Thu, 19 Aug 2021 00:02:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818212912.396794-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 11:29 PM, Richard Henderson wrote:
> Let the compiler decide about inlining.
> Remove tcg_out_nop as unused.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target.c.inc | 234 +++++++++++++++++++--------------------
>  1 file changed, 114 insertions(+), 120 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

