Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 296A83A184
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jun 2019 21:36:37 +0200 (CEST)
Received: from localhost ([::1]:60078 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZh8k-0003Jx-IF
	for lists+qemu-devel@lfdr.de; Sat, 08 Jun 2019 15:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37310)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh0d-00069L-Kl
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:28:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh0c-0006hl-Pp
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:28:11 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:41967)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZh0c-0006hQ-KT
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:28:10 -0400
Received: by mail-ot1-x344.google.com with SMTP id 107so4910202otj.8
 for <qemu-devel@nongnu.org>; Sat, 08 Jun 2019 12:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kHf4THUqx0+OBwo43QAsRWY4jgZof0jOS8MVuoeENx8=;
 b=p9gatWyhQRlGTagyA4VcclY5KvCM68R2//y12fMWFf2AbPhaxYA8XyR4IP3QT92K5P
 X/aG1w3b4AqaBfOPYD+zJPybr/YX52TlEC7Dktz3DnM+YVIeDD7AYB+B7dUMizMFPwiM
 FRx2gFRzfNRjOE8zsK6xcP0V5ov0oMGwh/Jo/jOs8Lvk53n13wCnQOPnrQOmg2ezQANY
 D7l2RuSHbyl3yupbjr9XRGmLWiDu5gnuCvRhAafYw0AGPoBELUa5Vaq6S2wkLBUYvgQZ
 P78pI2GkJXzRHliwPBatPw2hI9XkUUa5cUMrOaWlscSAUyuMGdXsDyQMATg2rlSe3vBC
 42gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kHf4THUqx0+OBwo43QAsRWY4jgZof0jOS8MVuoeENx8=;
 b=IrjWU/UCCtxy+7GEQQSOzLEZlKoQY1Sk0J2P+LaZNBQVtjGqMq8bJ/qNoDQx71s2IC
 KdjxfGuJKCbcIdfdThl2TeqM8DX+1ENQcz9VgKjI3MU7EvyekAw4ZqrbDYDM5mmyu8Ew
 Eb6VWhEifVPJ2OtJCDOiYk+r3mNm17ZOanVHigMR/lT5uqP/D5brI1L58CAmK8at/vci
 QNXPodg+i1jrx1ccXV97gOeRnD4mKcG4tGdWRV8LInvtSOs2PY8DBUkcrxGrfkJNvKA6
 yx2MFubXHAiEwgZ4SQD9Lax6PONI44nSKZyTOi51Zgiw12lL3hVIddA8k5OQ49h7vzei
 68og==
X-Gm-Message-State: APjAAAUADUruJfhgKNJdZmGrsW73e4oTxmz4Clq4VcXBHI68HYpyMGkr
 UaPgYbRXf8Q5U2z5CAo/Pve0pdBnr4/IxA==
X-Google-Smtp-Source: APXvYqyvvK4bhRf1nPjQ38Qc/AeiZ/b0B8UjAYRd4KnIQ6+WBp6q7yyNFoa9SJz/bdcPJLlcJYOYaw==
X-Received: by 2002:a9d:6512:: with SMTP id i18mr22810900otl.217.1560022089719; 
 Sat, 08 Jun 2019 12:28:09 -0700 (PDT)
Received: from [10.219.49.199] ([187.217.230.84])
 by smtp.gmail.com with ESMTPSA id m10sm728514oih.6.2019.06.08.12.28.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 12:28:09 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-23-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9f0845aa-b335-d2e1-c68d-d0b8042dc216@linaro.org>
Date: Sat, 8 Jun 2019 13:28:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-23-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH 22/42] target/arm: Convert VMUL to
 decodetree
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/6/19 12:45 PM, Peter Maydell wrote:
> Convert the VMUL instruction to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 10 ++++++++++
>  target/arm/translate.c         |  5 +----
>  target/arm/vfp.decode          |  5 +++++
>  3 files changed, 16 insertions(+), 4 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

