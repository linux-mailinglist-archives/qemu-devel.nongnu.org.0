Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C45903A5F04
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 11:18:24 +0200 (CEST)
Received: from localhost ([::1]:58398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsijf-0006GG-SF
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 05:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsia7-0007Y4-9i
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:08:31 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:42964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsia5-0007t7-L8
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 05:08:30 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso12340597wms.1
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 02:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BegdXMnWqEqv/Ej8REp4BzVeIcBOTRvBL4KStq/Idfo=;
 b=d7I2x+HDzUhDXVpVVlOd8ooJp3YGQIgIB5yKbiWXaq42zyxWQSVP0F+v/7PKo/GPqO
 p43fIipiYXxZtDmlkM6NVrdOBNQBMKV0edNBccJBaJ59Qt3WzahoRLY93xuYRg45cE6m
 L6IxjHitVaCDLOfanCrOSgCoY/SMO+fXR3LsaiMxkboNrJ00y4qw+6qk+pfeMJWEnFb8
 LStOXReo31hM4LKfhbtA/qiV6Ka9ICgePVwScVCTnG7Lyi5UCrf9KNxXq2oLxLppCHcl
 1xFJSSM740uuUN5/y2ahRFeitzv6KcMnfjQZIeNXxRqQJD002+bwBYJ3ZiD/Z8ANxm4/
 ZYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BegdXMnWqEqv/Ej8REp4BzVeIcBOTRvBL4KStq/Idfo=;
 b=qKskgHKy5hjzyZ8wq8eh4UaDdgHGgIgsTom/ixOSLvWlNWSnhKN0h9nWMVFP1SHTa7
 KiLMYXfTCrpDURXmOzJ+6rFHTCaf2IGMTPfceNEUF0kX8cge+lBLFNFb1ugCyUzJ0/0e
 jpQsLv4IFqF2qG/EekH5FMKNyU4HMLuHyLHHgd9fQneA6/pTpzuMmtVicRP7YVr2zjJ3
 PProDD9CXgX12KK4/EjW/yNV1MsfbevBkfNHBJ9RZ+MsvJh3MK67qH/l2pYd/HIpdDKA
 5OG1loKf7URI9Bmsc5mis2JbSzhKK4u+WM1DihsQARiLje8Hy5uSH/E9fFJc7LQRLBHr
 id1Q==
X-Gm-Message-State: AOAM533DpASajRCrW0/XiWjltJEu7IwMV4dVxLRP7MTUzYP9PjH5wQAM
 GllqoyXA7GQpSSpN/IaX9m0=
X-Google-Smtp-Source: ABdhPJzIodTHAIKPU/JFmu/OtPjX/86IGFHWEzG65+wzZy6CEasXbp/JK8rslVDDwnknlPA4bKZv0Q==
X-Received: by 2002:a1c:9a45:: with SMTP id c66mr14982140wme.43.1623661707830; 
 Mon, 14 Jun 2021 02:08:27 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id 4sm14968847wry.74.2021.06.14.02.08.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 02:08:27 -0700 (PDT)
Subject: Re: [PATCH 20/28] target/arm: Improve REV32
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-21-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7825e01b-6a3e-26b0-fdb9-0edf468e105f@amsat.org>
Date: Mon, 14 Jun 2021 11:08:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614083800.1166166-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.144,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 10:37 AM, Richard Henderson wrote:
> For the sf version, we are performing two 32-bit bswaps
> in either half of the register.  This is equivalent to
> performing one 64-bit bswap followed by a rotate.
> 
> For the non-sf version, we can remove TCG_BSWAP_IZ
> and the preceding zero-extension.
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 17 ++++-------------
>  1 file changed, 4 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

