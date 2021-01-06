Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE04D2EC207
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 18:23:13 +0100 (CET)
Received: from localhost ([::1]:46394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxCWf-0007ZN-14
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 12:23:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxCV5-0006m6-W9
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 12:21:36 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:52735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxCV4-0000dL-Gk
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 12:21:35 -0500
Received: by mail-wm1-x32e.google.com with SMTP id a6so3026243wmc.2
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 09:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IiiDwWiLbjtQVq834bnOVeGf4B3XEfTJEzMtjDivp2I=;
 b=NiP23SmjZjP72NAvrz1sC5M3uUT0tjIr1dZ7dB9o2DyEq0z6kuXSw1MfFwf440MmLW
 1kWLwCAFDis8Ab8DaZKumAlS9AZCwXnPjF7pF6ThiSpDzDGNgf1tHwlUZQJQLeVjycKM
 iv2SDRfneV/Z9kk4IfskbHoqQEJ1vCovkfwKUcTcCFEg3FIIFojSQO98WbAxxd2GnKXc
 fS4+SWpvW299AtR/kow5fyLGozWJsWkJLeTBj3CK3Jl8NcLhzXKi313SuqBoKvD3Qc3o
 LMefIizs5zXhosCO+8Ddmjjx3YhFG7s7afRi+rZAWIFCTv9/KzNTdU4gwoDUMHl4DBca
 HPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IiiDwWiLbjtQVq834bnOVeGf4B3XEfTJEzMtjDivp2I=;
 b=szC16s6iEFfh4GbkIiURffE8cXIIzOsDKO30vAfX5YYc7AGG7OwnGKbxp8yHPW6qoE
 MWCmdKYiKqjAJQzdV5mxlo7FUhkfr96Ouo3z9yu637hGgP3MxFpvHdAkl8s5zZ+yTO0F
 CjlB18hf15Pvh8oQ/1U7NABMOlpegxn/lfozoZceNdmZ+5YvS77wad5LMsapTmGJiqdg
 URN10+mD5uw/1Nxd3NEnAUyeBlr8sAYyztMTMjp7pSB88k2p9iZwTf6l2YA3TeeuiU5b
 0HRuWfEqpXV0HsB39b8LWfEZNRMQYlftitzv+A0rBqxQf1K5Hdzx1mMocR5rsDkOKkQJ
 Q2vg==
X-Gm-Message-State: AOAM530gzxOEBeQtWgyO/3iPLi3pxky8v8MKgg6yXhxpGuvV1kpkoMnm
 KkfK0xe6RO2aaqGA1eK084UliiLgY1c=
X-Google-Smtp-Source: ABdhPJxLX0Voipkdovz57/YgGIvdY1N49rqKMHrzUH1TpN1YuWlrrjRkNecpaCic3pHIZAciR5VEZQ==
X-Received: by 2002:a7b:c7c8:: with SMTP id z8mr4562394wmk.87.1609953693179;
 Wed, 06 Jan 2021 09:21:33 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id h4sm3814332wrt.65.2021.01.06.09.21.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jan 2021 09:21:32 -0800 (PST)
Subject: Re: [PATCH v2 7/8] hw/mips/malta: Use bootloader helper to set BAR
 resgiters
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
 <20201215064507.30148-4-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <df669ac3-33ce-b654-0988-54afe31cd3d9@amsat.org>
Date: Wed, 6 Jan 2021 18:21:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201215064507.30148-4-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: chenhuacai@kernel.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 7:45 AM, Jiaxun Yang wrote:
> Translate embedded assembly into IO writes which is more
> readable.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  hw/mips/malta.c | 68 ++++++++++++++-----------------------------------
>  1 file changed, 19 insertions(+), 49 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

