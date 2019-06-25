Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BFB5539A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 17:40:48 +0200 (CEST)
Received: from localhost ([::1]:33242 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfnYt-00050T-BJ
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 11:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34023)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hfnUo-0001pu-MY
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 11:36:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hfnUn-0006kS-8W
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 11:36:34 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40755)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hfnUm-0006ii-F8
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 11:36:32 -0400
Received: by mail-wr1-x444.google.com with SMTP id p11so18397112wre.7
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2019 08:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EOXiXqRkOBnlWG2kLlaZsuMqLACxnqUCtoQCgNdNGHQ=;
 b=EAKAeXQHuYOaCw0CIJlmAGs81ognnLHgoWaMTWsDTlE3lyiu1V07NAMO0KGKbIAk93
 4egUneO+TZab3oeGry0d/jmfRG98vpMS1tQRy+gEOT8pYQU5Zer9qMpvpGo3N0k8qZtu
 jY5+lqS09EXSZfhDKtRjFucCVQy+vdzGXxxWCIQnoVOTEnKlTn3H0CO839T89bbyieZD
 5G6oZjOxMxcfu6Q4GVX1kIYHFSgx8dAEwBCBNqK3ypNAvEJv3A4oiUu1bHSnFeXbCeqq
 ttjKSNNmjAUl/Iqev0Ku7DeeTBPUO/wb1XpWrG6bzc0fMxQtQm/mRB2lDC3Dv7NnDfhV
 7rUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EOXiXqRkOBnlWG2kLlaZsuMqLACxnqUCtoQCgNdNGHQ=;
 b=Br/TMhNdO+Kf06XxZgtQO8Ge0BbrOF34UDQldObvhHzRvV0dbJJ1FMzMuRoBLhDu+N
 9ok/5C9cBa9u4Q2HgtRBjkfA2dBqACbsVoLwRldgnxiSCn7wNYB/86oTnXXy2aikoROM
 YJCrt5jK6rqex9mGEwJv5X9nqsTGF3WzE60WBxgpP2XvyHzyPcDHpHbavGqKafJ9cWwc
 9aRd7sxirK0qHl/tGfS0PONjfVCDxOTy4oPonzRNIhG0w3yAQR3teiDMysKWO+uCiwo+
 bBDJ9Rk2yqQXQS1f9CSB0w/Sah/q9SqOIGSquwKVNYpYvoDTVMdtVmE2GmBL+S8DCTEb
 Ws/w==
X-Gm-Message-State: APjAAAXszOJ0dFInk+zLFfvzdV7f+2XFcnvad7RTacHE2t2NI+j0MK1U
 B03vCUwezRZZjuDWYkkgJYV2LA==
X-Google-Smtp-Source: APXvYqyD8hCkcsWYnDQpfX9oIVeRdGOMYAkW+61Y+0dj0/ziOrt4vQK3ol4hCy9Bp+n/Zn1lA31njg==
X-Received: by 2002:adf:b64e:: with SMTP id i14mr63977390wre.248.1561476990653; 
 Tue, 25 Jun 2019 08:36:30 -0700 (PDT)
Received: from [192.168.2.137] (93-34-153-63.ip50.fastwebnet.it.
 [93.34.153.63])
 by smtp.gmail.com with ESMTPSA id 128sm4317958wme.12.2019.06.25.08.36.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 08:36:30 -0700 (PDT)
To: Joel Sing <joel@sing.id.au>
References: <20190616191900.GH61734@hippo.sing.id.au>
 <41ef5fbf-f438-e60a-2fba-a72e3ad422f9@linaro.org>
 <20190624180837.GM61734@hippo.sing.id.au>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <2dec03cb-22af-4d0d-f182-3bee9db83d6f@linaro.org>
Date: Tue, 25 Jun 2019 17:36:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190624180837.GM61734@hippo.sing.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-devel] [PATCH] atomic failures on qemu-system-riscv64
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
Cc: me@carlosedp.com, qemu-riscv@nongnu.org, palmer@sifive.com,
 qemu-devel@nongnu.org, Alistair.Francis@wdc.com, marco@decred.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/19 8:08 PM, Joel Sing wrote:
> Regarding the alignment for reservations, the
> specification does require this, although I do not recall seeing any enforcement
> of this by qemu itself.

Ah, I see it now.  Enforcement begins here:

static bool trans_lr_w(DisasContext *ctx, arg_lr_w *a)
{
    REQUIRE_EXT(ctx, RVA);
    return gen_lr(ctx, a, (MO_ALIGN | MO_TESL));
                           ^^^^^^^^

This will force softmmu (but notably not linux-user; a design limitation) to
generate an alignment fault for an unaligned address.


r~

