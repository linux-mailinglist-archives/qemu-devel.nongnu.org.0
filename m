Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AE043CE82
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:16:50 +0200 (CEST)
Received: from localhost ([::1]:37296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mflbd-0007bC-KE
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfkzu-0002KR-4H
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:37:54 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfkzr-0002lV-8V
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:37:49 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 82-20020a1c0055000000b0032ccc3ad5c1so4698701wma.2
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 08:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8edYIwnNzh8R+KraDI08DyMMpWuESZG/Tm8bi7gpzFg=;
 b=UjjSsX7tqEcyYpuyHjwV9U7X6Ibdjn/AIr0KoMUnSYiX+PjzV5+7bX9voWPD9PHR3W
 QJ5d8NE+LeLA8Z6DJHN9sEsqZB/3KMxCqupW8hNTNNGfSwsMNa8h7tAebAr1cUAgNZCC
 VGX7vQnKcZE0plY4AxabzdwkzXzHY9PGYdJxdFe9HnNMY5HeyuiZFhpd/JgIXGimyahF
 T0GkQvRjDlDg3olrqNH62nP9z8pLoeSLiknrwAW0ah34lBk2IhU8HGK9T8NxZ+m/Xz2a
 QuWfna/K+MfFGyC+yvLDRDSf6nBltFil6ZcMZcONnbQyDO/PFfNBv9kz3PTWwkfjXo9n
 aW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8edYIwnNzh8R+KraDI08DyMMpWuESZG/Tm8bi7gpzFg=;
 b=ATeDz+DoTczToE5lSPyPgABoS1CyOsBCutMd9YBw+fXbKmRUw1tSH82CkMqXMqcW9E
 9Q6GJzHTExMXtTSqojFK445dDRNEwdayY20Yr+8NH105wkdyGBSsh4UUkGa5YPXGwZsY
 QGqwpPJ0xuojVUfLAz+qkY5Gv9FC53ziccChcM1dlOjg+7V+G0s3oMYWE2uPXdf+YMZI
 1MFPezsms4CmWozU0J1EJ+vAD7aJZd3h+nZR5cc95y8UN/iswfjHI4ivcLMj7efqbCy9
 pLkbFsDCrGjbZudBEOC+9Otquvk7HKK63BxB3euG+w0BcFeCZU/9s38QrA+2D/OvtTRI
 hbeA==
X-Gm-Message-State: AOAM5312Q0cwHjGl4VT34/Lcj4Uog2jJECSVpLaImW6ZYjHSvTLnjKbQ
 O6OeIadfFw4dHAtva6284ZQ=
X-Google-Smtp-Source: ABdhPJx3PGuMel6bl0LjQvSy9U0ONGEqFsF4optrdeM8Q57Cy4lUoh8rReeYwjuxqW7P/YOQYP/kkg==
X-Received: by 2002:a1c:7f0a:: with SMTP id a10mr6683662wmd.60.1635349065751; 
 Wed, 27 Oct 2021 08:37:45 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id u5sm205618wrg.57.2021.10.27.08.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 08:37:45 -0700 (PDT)
Message-ID: <3d34f8cc-acec-febc-5a96-d4db9676b7a7@amsat.org>
Date: Wed, 27 Oct 2021 17:37:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 11/11] hw/intc/sh_intc: Drop another useless macro
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635342377.git.balaton@eik.bme.hu>
 <2cac149cc6eaa157efa1704229b107e17ab8df3e.1635342377.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <2cac149cc6eaa157efa1704229b107e17ab8df3e.1635342377.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 15:46, BALATON Zoltan wrote:
> The INT_REG_PARAMS macro was only used a few times within one function
> on adjacent lines and is actually more complex than writing out the
> parameters so simplify it by expanding the macro at call sites and
> dropping the #define.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/intc/sh_intc.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

