Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5978930DC4F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:12:13 +0100 (CET)
Received: from localhost ([::1]:46080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7ItA-0000TN-Dv
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:12:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7IqG-0007AO-5J; Wed, 03 Feb 2021 09:09:12 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:40630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7IqE-0001QP-LI; Wed, 03 Feb 2021 09:09:11 -0500
Received: by mail-ej1-x636.google.com with SMTP id i8so19506703ejc.7;
 Wed, 03 Feb 2021 06:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gajXtVJZVHwZpZFBhwrQd0+vqRjN6swvpLY0hWAd5SE=;
 b=TY8xt72vqq6veCl9w1pNNq41qXuZ6oeFjv1PpFAJoOyGYzvS2HQ0RbPKDPo889l7ZZ
 8EXXb0UZwnCZ47qEtcvrCypwj+bN1YkSSpBDaKpqME5OErss+v86GDdA0wggleeZEg7g
 tp7g+/5KCbOMZw47FVo872TQCiDpzTwaPokqjfFJ4PUMNB7JaVZ5sYPRCU1EyHKln9WZ
 rWtRXSA9u8wfusU/hbKK81HoDoJ67jH5vp0hASDy0qx6DFZdOsgDHmaxbI+AeYRHKgr8
 UBisVH8dbstmE0X+4sHCxwunCfttZwFW3nbFyx73sLtaH+xr9V06EjpkWwZG5gu6dfK0
 Xs0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gajXtVJZVHwZpZFBhwrQd0+vqRjN6swvpLY0hWAd5SE=;
 b=hWyhQSzvAE0UFVJkIGRS0HMMoOL8FLzyZOH/vy5mZ+3XOBassmMJ/705AptNVAJ+QI
 xvw7HHEHBQea/HYXgOvM180Rr6SPAXcr2ltmsFvv7/f3hq8e/XVjKLeveD4ubVCXiyZV
 YdNQQUQO6Gpz1DAsUW/O2wsdUw/O36n3ggTzeG7PYw5EiF9Wi2V4Pm+aTcdZRxTb3bOQ
 HDtywJuhBn7nS6c01TBWstEIAqlqJjd58e5OVb8dhhMzOAvnkndmHGBTlRbY7KJUCznZ
 XDELQ1T5CQ2fuqQQlvCog4m/9xwH1oRDcT3lUjKUa18T6O+pvUn1Cma3yLwuXj8P8vuH
 NaJQ==
X-Gm-Message-State: AOAM532Kku4QIHAiP3bAF72ma9OcYpO9sTT7AncNhYoLrhPuQ8iny8Fd
 ea9oLtBITbX/1EFiig71p4z0ysOL/3Y=
X-Google-Smtp-Source: ABdhPJwSEe6CE+YWVfSNPxlDwk3127LuywO0VNz60NtTWqtJl62T/B1qrx+Z9rLv4YsuQNCZUw41hg==
X-Received: by 2002:a17:906:378d:: with SMTP id
 n13mr3244938ejc.386.1612361348083; 
 Wed, 03 Feb 2021 06:09:08 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id x25sm713383ejc.33.2021.02.03.06.09.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 06:09:07 -0800 (PST)
Subject: Re: [PATCH 2/2] hw/ppc: e500: Fill in correct <clock-frequency> for
 the serial nodes
To: Bin Meng <bmeng.cn@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <1612360893-4624-1-git-send-email-bmeng.cn@gmail.com>
 <1612360893-4624-2-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <16195e1d-ac75-e05f-a3df-5f178474d731@amsat.org>
Date: Wed, 3 Feb 2021 15:09:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1612360893-4624-2-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.178,
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 3:01 PM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> At present the <clock-frequency> property of the serial node is
> populated with value zero. U-Boot's ns16550 driver is not happy
> about this, so let's fill in a meaningful value.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  hw/ppc/e500.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


