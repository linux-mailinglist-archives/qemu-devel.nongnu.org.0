Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9C2320201
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 00:59:31 +0100 (CET)
Received: from localhost ([::1]:52034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDFgH-0005TE-Tl
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 18:59:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFfR-000503-75; Fri, 19 Feb 2021 18:58:37 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:39355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDFfO-0007Bm-6y; Fri, 19 Feb 2021 18:58:36 -0500
Received: by mail-ej1-x636.google.com with SMTP id t11so16827400ejx.6;
 Fri, 19 Feb 2021 15:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZEXCIWOnwxKj6kLM+kk6vKfGz2I2/tbSH+gH+D4L+mY=;
 b=B5Z/pEPcdTMkLtFusH6wbBF67RxGjOG0BPV4UfGupt0/MM3WN4DGs5GABafzjF9LaO
 EJoZU4WUIRHK3H9VcYnkrSwwziPCUwKbfqNIINGefRKES/E1kSL32BSacJH8h9AnYHBo
 DpGrNYCj2RdWitMmOVF3+aRb5IvGENv5NmHHNzRB25Wb1Ypnf32XpFZVPaf3Ls9Eb66x
 9P19vSIacwqMUjK0up4+aTQu//F56qNmWlRzwtAGaniHB+NRqQrRtFxFh9uAz1u38KpZ
 vGe5yRHKziQPh2yId4qptKxWrKB8IA26hhAdv1IgwT3po7s+L1rmStpeZPUL9PqogtzB
 611w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZEXCIWOnwxKj6kLM+kk6vKfGz2I2/tbSH+gH+D4L+mY=;
 b=oOy58e9D1epiyr4xz9uCpjKEshR+FJYjui/5yqvryQFZWvGce/UbZ1fv2ZHXpRDGIu
 1b8kL3/7GCDpPoOr6ruf9X17zc4Fhx4Ds6R/Z4KH7taUzgG+ZsPr8iZhGku2Sn/08EhW
 O7BT/gvCHWAQBXgSNv9tidAwFCgBkTUJ3wlObkE3ObaRSHKHPj9FhdZRilRlGlIE6tD6
 SJSdduqdhsJmDkm6m9yznbC8I0D5glKX/ayJslfgjJw/htgedLnGfaSUFQ2fb4sEfDCV
 9vLUIOLHusJTTHJwTqUsQsxMFNo1DA8cRfhKP9w3qaxNXTcQWU4JFegAYNe9weuAawiw
 R7bg==
X-Gm-Message-State: AOAM533F1fKIr9DtOBCnWmNxNpbKzdPlevYGNEjNfcdfKvw2fo9M5WeN
 NQ5CTBWPQYbOkIfDwiEWSdnuNPHj+Zw=
X-Google-Smtp-Source: ABdhPJyVhWUvWHcbkqBkhaFFAAYrzK3njA5DrfaHX7VT/L1tEmakehxni67XAVUjz+MZ02UX1hs4tg==
X-Received: by 2002:a17:906:1fd2:: with SMTP id
 e18mr10776371ejt.398.1613779111951; 
 Fri, 19 Feb 2021 15:58:31 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y1sm6108312edq.26.2021.02.19.15.58.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 15:58:31 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: Add Bin Meng as co-maintainer for SD/MMC
 cards
To: qemu-devel@nongnu.org
References: <20210216132841.1121653-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b95f1af2-df18-beb1-7f92-f9e721c0310f@amsat.org>
Date: Sat, 20 Feb 2021 00:58:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216132841.1121653-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 2:28 PM, Philippe Mathieu-Daudé wrote:
> There is new interest in the SD/MMC device emulation, so it
> would be good to have more than only one maintainer / reviewer
> for it.
> 
> Bin Meng proved by his contributions a deep understanding of the
> SD cards internals, so let's add him to the corresponding section
> in the MAINTAINERS file.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Thanks, applied to sdmmc-next tree.

