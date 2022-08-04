Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C5858A04C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 20:11:07 +0200 (CEST)
Received: from localhost ([::1]:49718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJfJK-0004SO-K5
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 14:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJfHh-0001i6-GG
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 14:09:25 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:46880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJfHc-0008HZ-Nv
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 14:09:25 -0400
Received: by mail-yb1-xb31.google.com with SMTP id j63so262731ybb.13
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 11:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=i/R2Pb4hboHdaXYg4O6Hev2AG0wV9uvZJwXk4hKdjak=;
 b=UDVqWJ3ahvNd9pTtLSPmb3QrABGpCm7hSjMDGGB8fQ8e1MDNTzn6L/NosnZs6yJnmX
 YrrLn4Ce0EN8pFayWyhn1vDRCK2gvL5y83Hr9ybU0YSJZ1X4Lpc9mrZs7RnzzXzltsG7
 LipdhmIrn3O5BEW0rHxAq+qmQAhYr4LdMiC0fACISNjmv5wMS3thBvXd3/UPV5kQfNjj
 lnTkf3/0JPA6qtDv1V+3yg8541ydAo2DAazasEzjjp0j6s/AkGZq4uDuxcCr1gwUDJiS
 5sMdNJbNockGW7wdyLk30bFLc6YxdEDXsFQFyMPqJhHmQtOtxhdoBe0LmopTwQvOkAc6
 2FKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=i/R2Pb4hboHdaXYg4O6Hev2AG0wV9uvZJwXk4hKdjak=;
 b=vCOPl2afn8W+Z8HvHb9HlDaFhR4/jb0wo1VhJLtwSQFNKoE0c5mVQXrC/OGCu2/BDs
 LQG/5XL+9DjqwtnBUqbhhfTTZ2npil5WXvvcSWGJm9kPHxlznl6GCN84lBmSFcniqSZ+
 FwkWScQbXq86T4tF2Sc5Bgdoh6W/R3AUf9kwqX6bh/cPCvsY3/V691Nu9XlW9icOwLE0
 m//NdB7iyOwk92O2plesNI3FWb4bYS1BzXDuUqXD+O/HXMrlXsCvr1XOVOVgZFpXdTPH
 ql/1Eh5FrgSGybSD6lWG7pdjt+qYk+6DyNQcNq4+WIg4hDyAcpWQwOKJLDFjxedfLveq
 G55g==
X-Gm-Message-State: ACgBeo3OEgUW3+iPZ/e1MdCNGuQWcf64P2df+lT4mgeluv/XHQDpVEkB
 zaOf7E6mWZ9bg8ZzpC+Ngbkj0RBdlfN/Kx25SyHM8Q==
X-Google-Smtp-Source: AA6agR4nxYcxVV9aI4g6KtWJQr5F8Uk2C8Xywxo6zvz/Z1LvAjTDo/UxlKfrllyUt6uZhM7lb4z0bxm5CD7NCL2HFwc=
X-Received: by 2002:a25:d617:0:b0:671:79bd:69bf with SMTP id
 n23-20020a25d617000000b0067179bd69bfmr2462755ybg.85.1659636559711; Thu, 04
 Aug 2022 11:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220804172939.325306-1-huqi@loongson.cn>
In-Reply-To: <20220804172939.325306-1-huqi@loongson.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Aug 2022 19:08:39 +0100
Message-ID: <CAFEAcA8M86MNQTdwg_bbM+v30bqswnEQ2NQXJf-Kfa7Zvy1StQ@mail.gmail.com>
Subject: Re: [PATCH] disas: Add LoongArch support
To: Qi Hu <huqi@loongson.cn>
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Song Gao <gaosong@loongson.cn>, 
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 4 Aug 2022 at 18:32, Qi Hu <huqi@loongson.cn> wrote:
>

More specifically, this is adding support for disassembling
on LoongArch hosts. The handling of disassembling LoongArch
guests is already connected up.

thanks
-- PMM

