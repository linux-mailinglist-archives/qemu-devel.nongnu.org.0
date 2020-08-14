Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C46AE244E82
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 20:41:38 +0200 (CEST)
Received: from localhost ([::1]:56524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6ee1-0006om-Sq
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 14:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6eco-000606-L5
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 14:40:22 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:32775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k6eci-00084R-VB
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 14:40:22 -0400
Received: by mail-pf1-x444.google.com with SMTP id u20so4980454pfn.0
 for <qemu-devel@nongnu.org>; Fri, 14 Aug 2020 11:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FLYAvJFaP9YNFPAywZx+MLXnbwDuPaBYiF2gR5XXG9w=;
 b=z2x6lzWUsQqf7yVwDfkXp8O9X4jYfB95BtpICU9uvUmxBulGQMJWrorNwbcb5hMw1m
 I+hNnlYVvb0oxMh9pgPCijtbc+1uUAJDGNJZaYk2PRSUerPt/E1pZpzIdfOn34RfUlGu
 wBLMD4JE3x9Pg8SsSSetq/NiImyUAFiE2/783xY94Cf9VHy++7Vt8aRkRU8iDoYEdBhB
 K2ppYPpro5BQgJnVRqFEern8RrIt47K8hrHZORanhqS/eKNjOkRBSPUknG2k/Gl48tKL
 wwCLg3Qd6oFoqO1T6xBliLZmpQRCVpnkd6vxCcTvm699xvaObrJDUbPBzq0rlpnTm6zP
 T+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FLYAvJFaP9YNFPAywZx+MLXnbwDuPaBYiF2gR5XXG9w=;
 b=h2jcoVa5PDmZdmSpV9MneeEQigHH5dsqJRFbC8DBbuEApK8bI/hknWwo+e5HwAyEU3
 nLzXIVWBHprJDxWH0fiyRPY04RBdk2/Ia7MU0UiYKDKutXecyL2kFLxv4PnmLtmU4bWv
 jzFjmZDY8p5kwtBbgfNkOAeHptB0kqgETo0tEcyDZeG4IFQT9nLOjswxkV4dAQz52ExJ
 J4i9RQFIUqjX0N+t7Y/09AxGo20rs8GYq6YhvqPHthq/Ws37dw0N9Spk3RX8KYh6sfJ+
 P7Qfegs3MH0YRKrQaHNMAkDPiUrO4LIkQYaLcgXO7r1OkTPglsz500/WacH8IeWQ6iep
 aUXQ==
X-Gm-Message-State: AOAM530rZTDuse+mBgIFH3wV/jovdd5xzJ+JldFNjG6rQfHb6jaRWKDs
 5hb797SkkhZujod7d0q3OW/LNg==
X-Google-Smtp-Source: ABdhPJzpPddmSNsPjnmbsx7jZfSYegj+Xs/qSmDxevnasDj2CTuJwwUut3M4kNgoAv8/VK1eICRW3w==
X-Received: by 2002:a63:8f41:: with SMTP id r1mr2480456pgn.375.1597430415696; 
 Fri, 14 Aug 2020 11:40:15 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id g17sm8738601pjl.37.2020.08.14.11.40.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 11:40:15 -0700 (PDT)
Subject: Re: [PATCH v5 09/20] docs/sphinx: Add new qapi-doc Sphinx extension
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20200810195019.25427-1-peter.maydell@linaro.org>
 <20200810195019.25427-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <89fbb475-06f9-7a6d-f149-6c4e6533f3c1@linaro.org>
Date: Fri, 14 Aug 2020 11:40:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200810195019.25427-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/10/20 12:50 PM, Peter Maydell wrote:
> Some of our documentation is auto-generated from documentation
> comments in the JSON schema.
> 
> For Sphinx, rather than creating a file to include, the most natural
> way to handle this is to have a small custom Sphinx extension which
> processes the JSON file and inserts documentation into the rST
> file being processed.
> 
> This is the same approach that kerneldoc and hxtool use.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Changes v4->v5: match the changes in parameters to the
> various visit_* methods from commit 7b3bc9e28f366
> ---
>  docs/conf.py           |   6 +-
>  docs/sphinx/qapidoc.py | 504 +++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS            |   1 +
>  3 files changed, 510 insertions(+), 1 deletion(-)
>  create mode 100644 docs/sphinx/qapidoc.py

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


