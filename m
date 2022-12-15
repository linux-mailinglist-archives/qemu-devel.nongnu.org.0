Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0E864DBD5
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 13:59:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5npe-0007yQ-J1; Thu, 15 Dec 2022 07:59:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5npK-0007m4-33
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:59:06 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5npI-0008FL-Hs
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:59:05 -0500
Received: by mail-wr1-x431.google.com with SMTP id i7so2936094wrv.8
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Pd+WzUnCc/vHhF8+sUjSCch9sSXxilWUxKZQJ8mNWko=;
 b=ahetI8rUU0jeearRSq9Cf5B17q3LlFsAlIEiN8xz0Cysm0PM1BMfTFB9gpVAFcpgY2
 cGmfjmWhZn2MoLzi+IH7qR8iYIS9KM3qFcdUL7ZgBTjYzRWzix7eAv1/tDLWLAuDFUJk
 M+Y4W7HAS33PvRkQFyNQZjMhZ3IWScpzBFmUf8SHjzFExGVGYpllnK+rYKhSL7P2OmJQ
 XN1ThjhDZjl83/B7Erb2nA2OzQdFkdLbH8eLHIAmawtydhuVUmlLs7G5NL4PJfQRqJPn
 oUVraUVqBNSwMlhqUeWhE1kWOthKGubHtoEaGwdVfgFKDmWuK3R/mNFDG+yR2050u1XO
 mgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pd+WzUnCc/vHhF8+sUjSCch9sSXxilWUxKZQJ8mNWko=;
 b=F1mwO38hgLaQOd7jJyW6AunmNZxYRtS3gOyGBNjnHnZ/pCmwGB9LbXkzMyGasQmXla
 YM+ryQ5Ep9+HoUw9v4Sxz4/mD1AkshB0Wu0aVKS6F9yXSO8tq8TskEndz0EW6IDkWQSc
 FSTYG6KDsnV7IR8XEagSEBoS+rl9KaDhMcg3ADWLKiIo9bdZJA3EAhoULNJOQsuKSdZX
 cNsuP3WHo8ARWUwEXLWy1ji1bRljyDKqQ9ChJYG6dh3pQMhBPfAvyFAwqLfVFToBWa1+
 oWp3iWAH6okreWRSQ9hDbxf+XEyjU9sBd0tc2QQZm3zAksKnGjSAHOTsc8Zw1MTyul2f
 Mg7A==
X-Gm-Message-State: ANoB5pn7wAMnfKNldGjag7YRbBOFslMsWpVelA8ld6GGD7CgdDWNO+C/
 GGpw7+hc+blqRD4GEqTxROVPDA==
X-Google-Smtp-Source: AA0mqf7NE++WZsl6mdQKb9zoxC0dCeim79pm9DnY7GJBbSMfQbHGWQoi493fWb85cghdXpRTZi7G9Q==
X-Received: by 2002:a5d:51cd:0:b0:242:17d3:a9f9 with SMTP id
 n13-20020a5d51cd000000b0024217d3a9f9mr17346084wrv.68.1671109142967; 
 Thu, 15 Dec 2022 04:59:02 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b8-20020a05600003c800b0024258722a7fsm6062964wrg.37.2022.12.15.04.59.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 04:59:02 -0800 (PST)
Message-ID: <1c926e93-2118-b8c7-a40b-51ca537dfb6c@linaro.org>
Date: Thu, 15 Dec 2022 13:59:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH Trivial] hw/cxl/cxl-cdat.c: spelling: missmatch
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20221215123749.1026775-1-mjt@msgid.tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221215123749.1026775-1-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 15/12/22 13:37, Michael Tokarev wrote:
> Introduced by: aba578bdace5303a441f8a37aad781b5cb06f38c
> 
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>   hw/cxl/cxl-cdat.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



