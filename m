Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A91743E9F69
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 09:24:53 +0200 (CEST)
Received: from localhost ([::1]:35996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE55A-0000bd-PU
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 03:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mE54M-0007wt-7r; Thu, 12 Aug 2021 03:24:02 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mE54K-0004CQ-O3; Thu, 12 Aug 2021 03:24:01 -0400
Received: by mail-wr1-x431.google.com with SMTP id b11so6860689wrx.6;
 Thu, 12 Aug 2021 00:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WU7ZnQYweTWdSoUhKKvL7Lb6aL6skCRnEPgwwHkzlAM=;
 b=QIwoQD+wu9L5Wi7Qa2FrrstXK2RfYll8jKC+kefRK2VxfA1wadfekqkyF25j8aM9Ts
 HVeIKwqQzbVfK2D5vDXabStik2rWQX9PgnmsxbezjK99jYpCrqVA/O/27wby37WzETxn
 pwJUQpQ4QDV782WxsiYu3QiV/6NtDba4V9W+nJ8i3vmfy7IrwDUTdk6U8NmqoPNFQ75D
 yzGwcdCvfakoYQjIorj2hPt8410mbNn9sxjFsDrCwNJRv0NB9ypAqvMrN8Rur0N9LHFS
 4Lvsv4xgYqcoPl/I4XLphk4M5wP42s+qzSCLE+C44cz5gVKCpaMlVW0U+bqBff+dZAbC
 tRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WU7ZnQYweTWdSoUhKKvL7Lb6aL6skCRnEPgwwHkzlAM=;
 b=bmiyAaKrdMZh1qfouoRQikS+HQAuBJTpzATeb/w1XyBTQsSZvD9l1SSPb0eUxI+FUV
 m41ecY6SS3bQ4PYIYSxlfiTRf4ogtuDMcyTT01EZLQlluuCfRn85l/y0fTUlAfC3HWID
 zGEhZ2C2dFT+2BoSntkhjb62lbroAJJ1mhHOWCelYSyH9aGZ6AjMiRIFIjFuPvGpyet6
 Z06UP7lK/kJiakUDXJst1GXwQST7fGLeyHfmzy5Qch4sm35qknKOoVl35PHn3by9OFaX
 OCDTvu+bgdAqGNHH2AjoyAhB4Yk4gHftFUA+TmlixHfh23vCLnC+OUouWeGn8M9q3RdU
 WG4w==
X-Gm-Message-State: AOAM532wy0SxaaWfBdLPNHoHGksvzr4sXmFA1gd16CM/w0PBKu9NbP48
 cUysQ1BA4rknf0+veTTMnmw=
X-Google-Smtp-Source: ABdhPJwtv8rygyU8G9e1tQwhzS1FJNl+F4EU7EN1pQO8PgWizqYeT7qk5r36F3vS2SOjaPjaUUBAyA==
X-Received: by 2002:adf:cd86:: with SMTP id q6mr2284190wrj.385.1628753035636; 
 Thu, 12 Aug 2021 00:23:55 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id n186sm9354483wme.40.2021.08.12.00.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 00:23:54 -0700 (PDT)
Subject: Re: [PATCH] accel/tcg: remove redundant TCG_KICK_PERIOD define
To: Luc Michel <lmichel@kalray.eu>, qemu-devel@nongnu.org
References: <20210811141229.12470-1-lmichel@kalray.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b78c5462-304c-73f2-84f0-bfe944c7ebde@amsat.org>
Date: Thu, 12 Aug 2021 09:23:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210811141229.12470-1-lmichel@kalray.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/11/21 4:12 PM, Luc Michel wrote:
> The TCG_KICK_PERIOD macro is already defined in tcg-accel-ops-rr.h.
> Remove it from tcg-accel-ops-rr.c.
> 
> Signed-off-by: Luc Michel <lmichel@kalray.eu>
> ---
>  accel/tcg/tcg-accel-ops-rr.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

