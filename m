Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EE5347504
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 10:49:29 +0100 (CET)
Received: from localhost ([::1]:33334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP08m-0001Kt-Hx
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 05:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP07H-0008Pl-6X; Wed, 24 Mar 2021 05:47:55 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:41686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP07F-0000l9-NX; Wed, 24 Mar 2021 05:47:54 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso820896wmi.0; 
 Wed, 24 Mar 2021 02:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yWjwqs6d404aI1hPO6hPJVKceVybdVWjxYfbshjaNXI=;
 b=McrjIBEEDjKpZpPT70P0buk2KLnYuyIAEW6reaU1LQ43Q6bTvdY08etC+DIPBOYXX9
 w81oX2a806EtZXb/zd8NQz+DCsPzjyjQ7oQAyQSC2JOjaq959rk2043t0/0FHeUMES9Y
 nlJv8E8YRXIv5rTLnWF9EFcBMi1uSbSbNog3275SJOKkdOWN6yE3yx+MY+kB2ePMz4zp
 NSRwh8WWbJHzDp6tHEqio3Prnh6/7HECL9ugxTPPcDDXxjRpN9Tafv2lx9f8SnaExBs/
 NrCUGPogk5Rld7CsgLRI9X2C+d6l9rp5SX/t+QSev7r2xhASsjGNZS9kY7NJJjWa+ffj
 E7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yWjwqs6d404aI1hPO6hPJVKceVybdVWjxYfbshjaNXI=;
 b=oraJIm6Ffvnr/xITXAXMV5leoHodMmSvZ5OZ6PL3f3964SEBHiLOVU1GSfUaEZ6jOw
 wei9PZadjcawJieW/MoUtPb3XkJZLUnGB3TBRyJGsEI0EwUjJdeuhNhUXDci2tg6Okdd
 1QI7hUcrQSKyp6qqyxl07nVGfObYASxFumvFIB2P7SxCFsma2Jucl9Tu1Wn9oDcWz/iV
 nk6vo0GMk6J+z1aoadT4E7Xd8cRn+dOQvZXIlCZpEFfvBBSLRCfaR+eV2CbdNlZ+zXMw
 ZgQa1jqHeGSMNg+qD/Yba5OpZSfbIxUJ9M4DJ72szDZhx0yO10mGKI+eyhjCwZFrDxYB
 pUQg==
X-Gm-Message-State: AOAM532fZvgKoiIVymldL/1m9uSCYwNC7Ij0RMB+5jAp+YaqwE1S5vP5
 4NBrMUttx+SGPgvsep56eBm9Uexvf+RKpg==
X-Google-Smtp-Source: ABdhPJyq8ugrLYmSw59qE3OU+Fnnwt9Q8zq84+nvLfGioAseZfX7KEp8OGsG7ShFBu0qjTkK7aryBg==
X-Received: by 2002:a1c:bc82:: with SMTP id m124mr2058624wmf.118.1616579270799; 
 Wed, 24 Mar 2021 02:47:50 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j136sm1747441wmj.35.2021.03.24.02.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 02:47:50 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] aspeed: Integrate HACE
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
References: <20210324070955.125941-1-joel@jms.id.au>
 <20210324070955.125941-3-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <30ea65c8-ce09-c582-fe98-64315bb54e62@amsat.org>
Date: Wed, 24 Mar 2021 10:47:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210324070955.125941-3-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 8:09 AM, Joel Stanley wrote:
> Add the hash and crypto engine model to the Aspeed socs.
> 
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v3: Rebase on upstream
> v4: Update integration for soc-specific hace objects
> ---
>  docs/system/arm/aspeed.rst  |  2 +-
>  include/hw/arm/aspeed_soc.h |  3 +++
>  hw/arm/aspeed_ast2600.c     | 15 +++++++++++++++
>  hw/arm/aspeed_soc.c         | 16 ++++++++++++++++
>  4 files changed, 35 insertions(+), 1 deletion(-)

LGTM.
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

