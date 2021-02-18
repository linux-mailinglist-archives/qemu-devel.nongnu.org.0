Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C61C31F2E0
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 00:18:40 +0100 (CET)
Received: from localhost ([::1]:56178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCsZD-0004hu-D1
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 18:18:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsWD-0003Z2-7C
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:15:33 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCsWB-0005LS-La
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 18:15:32 -0500
Received: by mail-wr1-x42a.google.com with SMTP id a4so2534699wro.8
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 15:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3xtCz2DoJoSYo34xzanQJB8JVumuh5XlDLY+scuFPLo=;
 b=vXsHg/sRKQzPcTrsfxdOZ5aKTLNVMO6jNTAbBWZVUmzUG0SaSST1S4oagFmgCUdxgD
 cITPNDbB5jZ3ar0Jydhq+9e5+FzIX5sNNZ7InBu3J+h/HZ/hJmg9WTgVhtoCE+xppeG+
 qIWGFjzech1Q65Lw/IKVLFAS2/Qyr26ahwhDVIFuyDR8iOvGQ6VgEekaSvu9PdQbRPuk
 xLdNMkBimi7XzyPga5ZXIfiZ6b6aZkXY4098wCAgq1mffzJdVEr0wA3EhClE+uKySvPm
 zvnBFGnF66XMuqnQvxgNHFss+A1B6Z9UXmT27gF+v7Po+Pa/SGO6Puxfd6THjipNfb9g
 b9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3xtCz2DoJoSYo34xzanQJB8JVumuh5XlDLY+scuFPLo=;
 b=nd62ERiiR6kycQoes/UTuYyfdgwDh0DQl3jWiaKY9O6VLjwgDAPghO/xsmOZdYLgFI
 50EnoIpixZ0lRX8AXYisxBpuHmtlhGiSURqnDSoh0TAxW/0npWY75U1UWxywHN0v44/G
 GJAL/6uzn/XloxK7uzoGfiojKp3powplxrpvsxoKK6Gp3707sk8wZ5N0cIL3Mcf56my2
 YQ4ELd/gxGa3xpxL4r8f6ORMYoNBAXsc9glF4uloXwR/E+U6ud+Tx60v1Ethj0pAw1JF
 8EnmkNPWtFfxsGGWbcWyepd26IT6RuBsmeDDh+D2W+a+W3QTtlnQqaa16JcLdBU+fuXv
 PK3Q==
X-Gm-Message-State: AOAM532KljMyY6QakE8I8rLQnaklmuKhQlXRRYaBgxb0JUVb2jtQ2by6
 UZKWJdoBGbGqfTjPxqEq69g=
X-Google-Smtp-Source: ABdhPJwjPET4P+YRzxa3mpE4lnFa0+6ibQ1RceNybceex9sk58FL/Zc7Svawy1Q82uBXS3zjVcB8eQ==
X-Received: by 2002:adf:e98d:: with SMTP id h13mr6465211wrm.246.1613690130177; 
 Thu, 18 Feb 2021 15:15:30 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x4sm10849058wrn.64.2021.02.18.15.15.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 15:15:29 -0800 (PST)
Subject: Re: [PATCH v4 08/71] tcg/tci: Remove tci_read_r16s
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
 <20210217202036.1724901-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b2eefe53-44eb-e02a-c09d-4e3edb749230@amsat.org>
Date: Fri, 19 Feb 2021 00:15:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210217202036.1724901-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/21 9:19 PM, Richard Henderson wrote:
> Use explicit casts for ext16s opcodes.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 26 ++++----------------------
>  1 file changed, 4 insertions(+), 22 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


