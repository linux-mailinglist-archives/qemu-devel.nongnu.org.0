Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79CF4842F3
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 15:03:08 +0100 (CET)
Received: from localhost ([::1]:58552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4kP5-000755-Ef
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 09:03:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4kNq-0006LO-Kq
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:01:50 -0500
Received: from [2a00:1450:4864:20::42a] (port=37608
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4kNp-0004Ea-1u
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:01:50 -0500
Received: by mail-wr1-x42a.google.com with SMTP id t26so76361806wrb.4
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 06:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UoIfNpnB5V0Jh3WE3OHhbOoe+3xtqIYyfBqTVsRsGAo=;
 b=AAPDh0Oz90PUZXvqW+EmE8MdgCJ0885YRlq3GEfMUCH4sQm5nNW6/UwkL8O24XgOvj
 xI8jM8JmifQqEqqkXWVNbgV85ZR8u+ORkAOTpqe0u2Pml7FFLlFHtq6AQISq0pT7QJUj
 jSuzi1GIets9Ii/KCdbiqYOVRndVteShawr+HSOZLnxA6Avv977j6kVX91xU9JYz61Xr
 NFoAuUZ35hRi9FhUb15KrIG5ZY0RYoqGmMhHdPnqglhVsT0OkuNdKVsxOrAbWTxuYbOg
 V5byP3a9tsxqbhqfK6EZf5UD6I27CqqeiyPtpTufT85sgFMWrlpIQ6+oiwPY3T5BmWCl
 8XXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UoIfNpnB5V0Jh3WE3OHhbOoe+3xtqIYyfBqTVsRsGAo=;
 b=op3Ezs+WS713cZ6WtHLbfP2toYLYwt5jKDM5bXzkcr953ZSM2tE2z+X9tkFMUIB4Wa
 bIEW75japuNi5z1XjOQA/OdGMqFDGRXgCMB9d75CCLntVfypH72AbfI3Q5Z6iZ8pmwj0
 vojXkeB3fEJY7TanY1gYRT5oZrsJ0tucZFglmoATli0Z1g8tkD76UkzX/faOhqFFN4rS
 wUCPUzhxo9b3yVoVbfFFpSwQWG42sLDBUFEKpcCUdElVpJeN5zHxzgh8pjOmmAShzsd1
 0IH9qI5spVBbxoBGIE6egZCvbhcekY/Bt5CGdLv2kSX+xaG0yvDoo/ycd0XI2KDhD/HM
 mzFg==
X-Gm-Message-State: AOAM532vgtM2RkcSGKUI+nuZ3Xk+gv30E31VP5Vc/pSANRlJALCyrG5x
 ShZkRXngxsQYxCCOmiJ48yU=
X-Google-Smtp-Source: ABdhPJx0/7airZ8vBFxlKxekrzep9nLOsMIPfj7LP6zvJsgX0y1D9hl+XHV5zooTPcki1MeUWvPj6A==
X-Received: by 2002:adf:aad6:: with SMTP id i22mr41897641wrc.40.1641304907677; 
 Tue, 04 Jan 2022 06:01:47 -0800 (PST)
Received: from [192.168.51.187] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id u3sm49269449wrs.0.2022.01.04.06.01.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 06:01:47 -0800 (PST)
Message-ID: <dda8ad03-8cfd-0ae9-3ee2-9ba9ba7e063a@amsat.org>
Date: Tue, 4 Jan 2022 15:01:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH v4 6/7] tcg/tci: Support raising sigbus for user-only
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220104021543.396571-1-richard.henderson@linaro.org>
 <20220104021543.396571-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220104021543.396571-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: git@xen0n.name, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/22 03:15, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tci.c | 20 ++++++++++++++------
>   1 file changed, 14 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

