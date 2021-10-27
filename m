Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B060343CC9A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 16:44:19 +0200 (CEST)
Received: from localhost ([::1]:40880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfkA6-0000g8-PG
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 10:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfjQ8-00024j-BZ
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:56:48 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:52088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfjQ1-0004Es-MT
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:56:44 -0400
Received: by mail-wm1-x336.google.com with SMTP id z200so1890638wmc.1
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 06:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rGc6cJII8hzgCAKlCSGlEgepOT+Do5Fqk1rpfX79Bx0=;
 b=NUArEbE6Xu266zB6EB6OKoaAqLrKlBVjp4nWqHQBVagrc+XbnmzteKpaBqXq8pt4K6
 aR0xK4HzKrj8Vwr+Vj93nn8Jdol6PB/uWqEqFVZbNY6nCgduxrzSZPgusWBBG8z0Ok0A
 bQxV4Bpssd/bHSqfLyqfbUnM4TB++qe0EMatJDdzr/Nu9WGy02I0l6VRK5C4RXsLXKCO
 NRZu2/K9T5DfaVythmiP8zLDKg5mq8RcJUOXwigVLIB9OmL7E0otrRlT6TBnlc5DwHdJ
 vEo45H7EkSeYEsfQ83TP63vCHQisNI5+4k3ElfcioFa4Yl+RFUGJTeJg8nI1RDTu9W2m
 0nGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rGc6cJII8hzgCAKlCSGlEgepOT+Do5Fqk1rpfX79Bx0=;
 b=1YiqCUYxzhf8yq9/KlqGx5fmqeF832woeyGYJixYsiqFynSUIi16bx3Q8sq040Ngbq
 a1FHF48BKjRLizvpJBuctbe3/4K2OF4ioqXfkMZmdMzSK6B0veIfpP50qYmmab4N2m/q
 4CIpJS9C9GSRz0Kv0cyaD7fln7jboNO7gpNElit6Ro6vbNuwYAPDCBOxK9ScQr7kVx2L
 ZrtGkasRKr+Mt8zGLcspTqdE4LrZ4ztFZyxtDSUlMvTgFj0neTIZPLkuRlExWEkZ8/Ns
 5mVv81mEVPl5jhAC9w0sZwLubcxLIAm/k2Hw5CbkEHswmTqpxeJ4xIzcjfrNh3LPK7I5
 fDFw==
X-Gm-Message-State: AOAM532mabZhFTV3hGzrJlENH5KjtzByxrZLJal34UGNbn1iDotiA7pJ
 jywBdGoFHK/y8c2K8IqHgBE=
X-Google-Smtp-Source: ABdhPJyJysFNo7Am9ws6GmoS0dWabVafxBnzbzP4xkWgOiF/rMEzCz7WNhuWsoyYi9PUbM+Ghw7WLQ==
X-Received: by 2002:a1c:7201:: with SMTP id n1mr5783578wmc.176.1635342999763; 
 Wed, 27 Oct 2021 06:56:39 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id k17sm5870147wmj.0.2021.10.27.06.56.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 06:56:39 -0700 (PDT)
Message-ID: <eea5523e-643b-af5c-4b8e-c4f2541e4028@amsat.org>
Date: Wed, 27 Oct 2021 15:56:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 44/51] tcg/optimize: Use fold_xi_to_x for mul
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
 <20211026230943.1225890-45-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211026230943.1225890-45-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 01:09, Richard Henderson wrote:
> Recognize the identity function for low-part multiply.
> 
> Suggested-by: Luis Pires <luis.pires@eldorado.org.br>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

