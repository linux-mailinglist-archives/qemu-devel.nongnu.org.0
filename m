Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AC069439D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 11:57:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRWWI-0008Lj-4w; Mon, 13 Feb 2023 05:57:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRWWG-0008KL-8N
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:57:12 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRWWE-0003p8-Pl
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:57:11 -0500
Received: by mail-wr1-x434.google.com with SMTP id j23so11758470wra.0
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 02:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S0TYYX60bvctx73xSjISvMUCGGrxXP6yKr6R1yR2uJE=;
 b=By1zHRDbdfuaD2jXmKy1WACO6PITR1zw8BIsS9qSPZvg26xkR7h0Ou4BLjaxGMtjjL
 0KJh1SH14e/zTSTwFYOYHcDd5doTEeXuDAskhAxzwyj+J3IqLiRlXZbNk/He0cInCXpN
 Zs7hju48A57iyyYm6qTTn5Jeu86NYFVDfdQIjPVToPEPp5IyAH8v9awP3XJUBbCq3klP
 qw5jGXkIv70cCWsRjSvF94vfhEPiwxtVuwD/wx2wxMCaIXNczNUfyce8A531ZgGZYYgU
 x/Xs4Y63qENhLgGb05wSolEp6xUUYU9oNRUuc3tfNFtivQdR6AUpw644zbgEZu4DzdXc
 knyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S0TYYX60bvctx73xSjISvMUCGGrxXP6yKr6R1yR2uJE=;
 b=CfZNXXOGTn4FU9XeuH2yZX6BGRP4DMJxm3GuEto25mZVsJ+f4z3tdsdVMZFU0qitTR
 jB7/0ufsa0NcnifUo+i78+K9xxodCTRhuKmd6idmt28AOJhusWoOu9PAoCfNRNaWFTgN
 t2WyDd1dYgUjtsrf+sSzpkFGAvaWC6uGNBBUtxjMhSrsqmBPubkeeWLHtIP6lW2+FQG7
 1r4UPNv4SWMI4/UcGhccr3750Cc+XQeP+BL86GpG19MGi6o/9/UVBzXKbV1x/blewf22
 CZzG0NkhAduCGVNBrbb3gVb8xmzgfq7iYClXBqeCBWyvIcOCRXZo/VJb6X+RjZ/K8OBI
 WkEg==
X-Gm-Message-State: AO0yUKV5E84543HLnrmEmFtMcw0Yd2b+Qv0U7ZuL4dYWYW03+s0v/It2
 +XrUxmQSe7VY5DykM4l53YQZH6WX8XAaYvQn
X-Google-Smtp-Source: AK7set+CB8Ra22CLT/Dc3jNwJP926hGogpYBVyXqUl6HhqenXnA84p4dlvQhVK0VMltYdukC/ZRLJw==
X-Received: by 2002:a5d:6ac3:0:b0:2c5:4e77:62d with SMTP id
 u3-20020a5d6ac3000000b002c54e77062dmr6241338wrw.58.1676285829520; 
 Mon, 13 Feb 2023 02:57:09 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b5-20020a5d4d85000000b002c54b0e1405sm7736524wru.88.2023.02.13.02.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 02:57:09 -0800 (PST)
Message-ID: <e3f5e1ff-de85-b85b-21c8-abb064b36f86@linaro.org>
Date: Mon, 13 Feb 2023 11:57:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH] MAINTAINERS: update my email address for the clock
 framework
Content-Language: en-US
To: Damien Hedde <damien.hedde@dahe.fr>, qemu-devel@nongnu.org
Cc: luc@lmichel.fr, mark.burton@qti.qualcomm.com,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230213105227.2357-1-damien.hedde@dahe.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213105227.2357-1-damien.hedde@dahe.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.348,
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

On 13/2/23 11:53, Damien Hedde wrote:
> Also update mailmap
> 
> Signed-off-by: Damien Hedde <damien.hedde@dahe.fr>
> ---
>   MAINTAINERS | 2 +-
>   .mailmap    | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)

Thanks,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


