Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F4A319770
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 01:27:27 +0100 (CET)
Received: from localhost ([::1]:34914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAMIw-0006Y7-KC
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 19:27:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAMHp-00066f-Or
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 19:26:17 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAMHo-0001f8-8e
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 19:26:17 -0500
Received: by mail-wr1-x42a.google.com with SMTP id u14so6054453wri.3
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 16:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NSlasnGEyZiLzIv7NJUr4lraGZfsQquc137VarQzE0s=;
 b=rFjJukocyMibm3PyHTDHMeBjRWjOPUoXY9v2o5AwnW3c1gel+yGZvsIORqD526+pgn
 QxBj67LPqDxT550Jfwh0lbd1+vwlHzbK8/wjecbPHqnnAZXUNMvLfITVO/y4aw2CcYN2
 b2IgZTZJZj1JwfRHd6h6tLIcFCMXUhljmu0q7j9To4IVu7wWpmHF3Fbh3Qw0PnGjyL5K
 nMhANVEzSgoZI+BDiFygH/RFX69CwVfoGvKfzZ4BW5ZYms+BUM1ow4rzNs5v5j5Xewt7
 VIWoV0+2BumdVhcNP9gLX89BWrQmzUAK5o0y/B5E3x7y3jLBeBuJRVXgeRXOUtoqHdNR
 b4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NSlasnGEyZiLzIv7NJUr4lraGZfsQquc137VarQzE0s=;
 b=T2Zf6A40GjQWruhsXBOu1DF8+JiOWIpZfa6+YI2LiEiYn8bXmftUweMk2lFxd+eR0Y
 DyFu3vDcOiuxemL1ZS6odbBvWrUeTEk08jwoqwhmUAG1RIq55OEJmknVVwJtpkW1JB7y
 jPSbdzopOZy+gsoOkCw8sOulFkVNwG+lNJIA5FQ8TB4AjW1hYfcEgHepqf1CwvfjBQKG
 T4JWOaXrouZzoketoyZ3b+L0cF3REj9csSRaLaMovt/fRW5OzjxDJD0hgBG+6SgnX4/j
 Zcqjb4LHDy75ErkVi/YHLJz+TC8zgk76gf7Fym41jZVbYT8PH6BZEpezk6rAp7OCRLz2
 liyw==
X-Gm-Message-State: AOAM533w1pHO4KX+vxzFEJB/BkDLoMjB2BITAFVQRKATYGtBybGgaspl
 LAHIdWaKFYWDwPfJDZAwB7Q=
X-Google-Smtp-Source: ABdhPJzNKPBY4VPhVr+y0WOjvtzMD5FpCT6fETMlnvkzvAn9cmlCNfuDZHz72+zcpZchDWL2RLFq/A==
X-Received: by 2002:a05:6000:1362:: with SMTP id
 q2mr382302wrz.31.1613089574060; 
 Thu, 11 Feb 2021 16:26:14 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g15sm7567973wrx.1.2021.02.11.16.26.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 16:26:13 -0800 (PST)
Subject: Re: [PATCH v8 23/35] Hexagon (target/hexagon) opcode data structures
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-24-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7317f084-a80e-fc25-a9e6-058e82f59ae2@amsat.org>
Date: Fri, 12 Feb 2021 01:26:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-24-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
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
Cc: ale@rev.ng, alex.bennee@linaro.org, richard.henderson@linaro.org,
 laurent@vivier.eu, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/21 6:46 AM, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  target/hexagon/opcodes.h |  58 +++++++++++++++++++
>  target/hexagon/opcodes.c | 142 +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 200 insertions(+)
>  create mode 100644 target/hexagon/opcodes.h
>  create mode 100644 target/hexagon/opcodes.c

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

