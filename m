Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E46C666E272
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 16:40:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHo2s-00042X-Tc; Tue, 17 Jan 2023 10:38:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHo2r-00042E-3o
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 10:38:41 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHo2p-0006MQ-ER
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 10:38:40 -0500
Received: by mail-pf1-x429.google.com with SMTP id a184so23772241pfa.9
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 07:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LPDGngE3HSAwjXUkGplEfrMuZMyJyu3kza/bCR7HC0Y=;
 b=SZ7WDqi6825gBI+/qNQXFNmnzZdsJObJqdsynW7ZYCu4YJvfg2XEwHyJK4lM5m9kVO
 rxxm21CGQh73iqBhabq2UU2zrTm69gv6UD0imrSF//m+8PS3cQjqUx66l+x+KFbVXFcB
 ZsfDGxOy+ayqTV2FusyzFPXONUZPHW0yD/kDIx67Sn2VU5JCChYOCxoiYgkFx94zqeYF
 aykK7H5dduOn+KV6WxEgz6nMjWMPBCpR7orTv2Y0IVQp3r43lNYM5ornaKHxCDYJjKK+
 SLftXlzwqJ6tDdhqhJJz9mCVcZ3Fu9+zCoHc0n5+ru+Gc8slRKUT7CaBnyTy6w9i1tkX
 tDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LPDGngE3HSAwjXUkGplEfrMuZMyJyu3kza/bCR7HC0Y=;
 b=KWup1ybvIaL+FGOsF2Y9F7CTQ1suKBwnmdn0D/spIjVqm2gBBFSJoY4ZUiMpXtX2qa
 wxZzdpAL8ajhz1Uu0qGEc/Ymw3s97YW8jAHZbUKnRM1esWU64RHTEQMzDacuqDbPzdmm
 ulRMx4Pb+3j5ud+SOjWNK/LA45GyKWKpP7pF/ST7PdIqkagxh1U2bdaYtAKVHcNkT5YM
 Twe0gI0JuJf89rCnWK18pHQV9wRRn8lMRoQYDAbYR1OiuBcVPnB4tfvksSAfA6sbT7Gg
 CGy/u8ZzcC2a0kZTc+b3LPjG4bKKrzWezBuornoJtDoV6kNAsWx9TD7iE3dCmjQC6KZe
 hvQA==
X-Gm-Message-State: AFqh2kr/t/dyDL0o0xK4mSzr1jTeTkmb0sQfMmokpE0NmivDeEltLQzU
 XoeqM3YerjDlkrABaHZXa0jcnKGDLlKg5YjsFercyQ==
X-Google-Smtp-Source: AMrXdXsPPvxTPSTeQQpu4bjN+hM5SDpSemRJg6h0NYh9u4DtlH7ozUipUKzIbmQnGxjUsTsWcXj/NB8YvXU1UMldNII=
X-Received: by 2002:a63:510f:0:b0:477:86c1:640f with SMTP id
 f15-20020a63510f000000b0047786c1640fmr280895pgb.231.1673969917758; Tue, 17
 Jan 2023 07:38:37 -0800 (PST)
MIME-Version: 1.0
References: <20230106172851.2430-1-eiakovlev@linux.microsoft.com>
 <20230106172851.2430-3-eiakovlev@linux.microsoft.com>
In-Reply-To: <20230106172851.2430-3-eiakovlev@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 15:38:26 +0000
Message-ID: <CAFEAcA_r=Aji3Dp_K7vcuQJ_D8Ynjxhv1KJZPU3KgLOhJL6imA@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/char/pl011: check if UART is enabled before RX or
 TX operation
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, marcandre.lureau@redhat.com, 
 pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 6 Jan 2023 at 17:29, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
> UART should be enabled in general and have RX enabled specifically to be
> able to receive data from peripheral device. Same goes for transmitting
> data to peripheral device and a TXE flag.
>
> Check if UART CR register has EN and RXE or TXE bits enabled before
> trying to receive or transmit data.

I wonder if the real hardware lets you fill the TX fifo
when TXE or EN are clear (and then transmits it when
you enable tx later)? That seems kind of an odd corner
case to implement, though, and the TRM doesn't specifically
say one way or the other, so it doesn't seem worth the bother.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I notice this device doesn't have a reset method, incidentally,
which is probably something we should fix.

thanks
-- PMM

