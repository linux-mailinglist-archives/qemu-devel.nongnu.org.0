Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 914C6418108
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 12:30:51 +0200 (CEST)
Received: from localhost ([::1]:56402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU4xG-0000jb-KK
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 06:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU4v6-0008B2-Og
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:28:36 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU4v5-0007C5-3K
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:28:36 -0400
Received: by mail-wr1-x436.google.com with SMTP id g16so35118284wrb.3
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 03:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uwnQ23NcAyb6Wsb96UYUbpA86j8aizEWLIUAOeL0oCU=;
 b=X923DR/0GjpqH//d99CXJMuBUBmULD6ODQXyuO0WVliIwVj7GfEQJiL5kJqURMu2bw
 vRB2RrARBt+jnt+XeWE3dCkez1dB/TT8tGrut1SzQGfvIZW/GIAiTmYUPQkJOHdVEy1q
 TRbsmD7HEeWAHt4gJnC7PZA3yLH52tdR5EjRgc0pkQdKrwRWvosn4FGEDMo6HH6k3qmS
 rQ83l0lezaDg5a5w3iGZEnOo/gwf69CAJ/hEFXuGD4jb+flHCM6jclKCx9id0F8s1yo3
 0+5xxA/2selRqB95GAZsbbbPJ/FZW7WtUDet70z9hKACbWEiE5tpxIz2hQ99BJIfzotq
 KKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uwnQ23NcAyb6Wsb96UYUbpA86j8aizEWLIUAOeL0oCU=;
 b=FFoWXX5s60JlLKPaGloc5VyvtuejRBZqV+yQlwfk4ZhfGsN5b0cvu7AdrxhwrKUQ0M
 EEZNLzqn6DG3yumUmfuDA1TU3L5kdYgzC5+Pf+8OwmebXSUVbgkEFC3GIL9ER/poPBsY
 VDjHCWwdb4sgHeAXMmLo0pgrfL1OYvn25XrJBgyV0/faAa1/gx2DtND1XR/a0h9b8AAS
 3Y1r5mxEemNltlVqdFgwN+CsyBQczDx6gWze5RoG7Rb8cjOgkNTb1U7j2iF+wydOVg6w
 qUDqee66QIjGXRP4/oSfNQxm7aIgKpfUTlc+1r1AmPzyCYPt70ZG/ZdqYPcQHy+pn/gY
 9ilQ==
X-Gm-Message-State: AOAM5339W03JPXPeenow8zeineZQkZHFxfkOoJdcUh2ClZTm97iOElfn
 6ZqflSqqI7ZYhh2rxMdepFyvz7Ib7ug=
X-Google-Smtp-Source: ABdhPJztg8Ew0P7lTSefBoQRaWnTeyZpXawctmvhW9JbFH8g/W89GxuHlDtkXdSkX8eQNwASXih6ug==
X-Received: by 2002:adf:dd42:: with SMTP id u2mr14777163wrm.39.1632565713673; 
 Sat, 25 Sep 2021 03:28:33 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id 15sm2206375wmk.48.2021.09.25.03.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 03:28:32 -0700 (PDT)
Message-ID: <b79154c1-1d39-0f04-ee84-cafd98c95e3f@amsat.org>
Date: Sat, 25 Sep 2021 12:28:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 30/30] configure, meson.build: Mark support for
 loongarch64 hosts
Content-Language: en-US
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210924172527.904294-1-git@xen0n.name>
 <20210924172527.904294-31-git@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210924172527.904294-31-git@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 19:25, WANG Xuerui wrote:

Could you add an 'uname -a' here as example?

> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   configure   | 7 ++++++-
>   meson.build | 2 +-
>   2 files changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

