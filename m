Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BDD2D35CB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 23:12:54 +0100 (CET)
Received: from localhost ([::1]:38590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmlE5-00066k-J7
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 17:12:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmktT-0004DY-GE
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 16:51:39 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:40648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmktR-00076R-7G
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 16:51:35 -0500
Received: by mail-ot1-x342.google.com with SMTP id j12so206836ota.7
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 13:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AcB7iPZH/6gryYNKiOK9LRk4ALwhtVZ0H0FlNoQ7ZeM=;
 b=KKXYPzgWdCnzpXrMlF0qNwOlBtZ80Lwvr1FLdadhrZ3zw1T06gxyPoQUgtPfQHGFKU
 gr3OWw5YDnqmK+/IcPsY//PFz1oLHgyIqPaq8Bz5GrA6Uj3pUyuazUzc/fcHmdWRxlP7
 AgPhTVevF+ST5iI/WZFAy8q3Wq4OW9uTtLbglpYofILXu04qGN5ViEurZBq5JjSCksHZ
 y557HsxE5UQTD7dTy3iFsJzW2s4VJ18M46sUBWRaWo3kQQuO+vmvKh3v7IGG9ScwmgZj
 XYzYDKzyh9zayLi9XPD70hAPXgP/4SFIMB6EdADRAuUHNHAMgpx/j7VnVMnFg+Vhswbt
 QBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AcB7iPZH/6gryYNKiOK9LRk4ALwhtVZ0H0FlNoQ7ZeM=;
 b=MOvxriFjv1Qo28pSfeTMrB/8sv4edD4uWOa/2gCow3MwM0pbbm4EWkGV4Dz74orPiM
 G0PQtuccBN4KYuxmD5sbvr2jctA9ZKCBqQPXq6Vohpp67sH764jZj91V+9tPJ8xPAvug
 07Ze706diR5cJr1JcwC5++EugnTjirj7xlTR9Ed9MvE+Qv4vt0nb+rqDs/BfhASS2S/x
 7CwRTesn1L/rOU1tWTH7/kXifgTpCYMhD5VN01uxJlkcWfpUiS+5afHZyXfpeoBVJ578
 Q0ueJ95ApoXMzXsy1ELXZFQYfc9svenTLZfc4ccBIrCIlQZI6QyqYnxN9TM0UZ7+jWzk
 wyQg==
X-Gm-Message-State: AOAM530r3tObTE3vFcyQanUVjvwmGGvaSfZpVTVbrTjXkigw2l3O1ZRp
 nSwaAwMGV4P4EkLLMtRYdmnrhw==
X-Google-Smtp-Source: ABdhPJw0iO65IFT6OUZQO2aiSQQcVDqIgAXdoz+mis7CW4sQQA1tfICMbjhUCuMC/BvCcx8xe1hrJw==
X-Received: by 2002:a9d:6317:: with SMTP id q23mr74231otk.251.1607464292083;
 Tue, 08 Dec 2020 13:51:32 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k63sm13525oia.14.2020.12.08.13.51.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 13:51:31 -0800 (PST)
Subject: Re: [PATCH 07/19] target/mips: Include "exec/memattrs.h" in
 'internal.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201206233949.3783184-1-f4bug@amsat.org>
 <20201206233949.3783184-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <62ff83ec-fdc4-61dc-6309-c68e3efda2db@linaro.org>
Date: Tue, 8 Dec 2020 15:51:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201206233949.3783184-8-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/20 5:39 PM, Philippe Mathieu-Daudé wrote:
> mips_cpu_do_transaction_failed() requires MemTxAttrs
> and MemTxResult declarations.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/internal.h | 1 +
>  target/mips/kvm.c      | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

