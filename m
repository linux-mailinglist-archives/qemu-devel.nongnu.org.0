Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBC249195
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 22:45:48 +0200 (CEST)
Received: from localhost ([::1]:51868 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcyVe-0001PL-Uy
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 16:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39608)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hcyTN-0000TJ-L1
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 16:43:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hcyTM-0006Fo-M8
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 16:43:25 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:34698)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hcyTM-0006Eo-Ci
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 16:43:24 -0400
Received: by mail-pg1-x544.google.com with SMTP id p10so6443349pgn.1
 for <qemu-devel@nongnu.org>; Mon, 17 Jun 2019 13:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xsrpd3kMOPUZ4MznF4kLmVwCzElCqGBrIkNNQsGG4lM=;
 b=RuTyIkd94xIsdEdLRyQF2GA68HUO7OfTft6wm13tQLpBKbI2yme/zdnR+dTqs7dqNY
 W01Il4QfuchPCQX5wWSNWmqQLGOB91n8ybaqUmPF0w0LmTIzAIXks3jOnFkpnsCsC0ba
 Vk7maYM4tP4gaVh34vpHhnhzdit9uus/kvfrkm4eijr/KH0CYoBXRu1+cAkHO/li+7rh
 CKi/SemhuKme6yPiTP8/p8kLJee1wz7hw/nZJaB7xDcZ5zuNE87C8SU4qOPPQlo+lm6Y
 dGQ1fAmXs9fzymLKhwfDWWTHN9oeUIiEs6uI5hLB6ct5MiuZ8WQ6LqoGQOfWSB5St/Pf
 xZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xsrpd3kMOPUZ4MznF4kLmVwCzElCqGBrIkNNQsGG4lM=;
 b=Tv1qosiotK0HEk1B6fpnHV119VjBWx6z34o4jqdIXHB0EaF12xurzBJDTv+wMqKLJX
 /hGsoMWUTTh3V8i+gjxWOAMhhbNAK588PG1iyfhT4da37Fet1BEExXIweQMY0fjlstQR
 /6xORbR+5tgNRyxWDhe3iVUxodA7XuYMwxez6+gd+91aUkNoa8hBwLKVcr6Xidrirvl/
 PgZfexplY9jy8i1NnbX74iX951WmSNFv4nxIKTjSWmirOOa/iwxxCViPvwhcXcKs5siZ
 pRqdzzSYLj9Ct43oIdiSELmrwenPv/LbnCyVmVIW4oGawzRHgeAJFwalI6LEMwSnYnMf
 OmkQ==
X-Gm-Message-State: APjAAAUDiU7GOlTk1DRFj/5DVzYfidSJyXtWdYMMQ6mdWuICC9WA5eZb
 guDFCzntB86fG9JKIJHnZEycqg==
X-Google-Smtp-Source: APXvYqwT4TrSq/tYqkZI8KVRFfwlC/jz0aeG4/w/ZJz6qmgR0SZofhxlbBCEPeNkxfOxJYJjhfqWCg==
X-Received: by 2002:a17:90a:3270:: with SMTP id
 k103mr907037pjb.54.1560804201960; 
 Mon, 17 Jun 2019 13:43:21 -0700 (PDT)
Received: from [192.168.1.11] (97-113-2-33.tukw.qwest.net. [97.113.2.33])
 by smtp.gmail.com with ESMTPSA id l63sm13161048pfl.181.2019.06.17.13.43.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 13:43:21 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20190614171200.21078-1-alex.bennee@linaro.org>
 <20190614171200.21078-16-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <92083b56-a36d-d5a1-50b0-09749d056d70@linaro.org>
Date: Mon, 17 Jun 2019 13:43:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614171200.21078-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-devel] [PATCH v3 15/50] tcg: add MO_HADDR to TCGMemOp
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
Cc: "Emilio G. Cota" <cota@braap.org>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/19 10:11 AM, Alex Bennée wrote:
> +    /*
> +     * SoftMMU-only: if set, the TCG backend puts the corresponding host address
> +     * in CPUArchState.hostaddr.
> +     */
> +    MO_HSHIFT = MO_ASHIFT + 3,
> +    MO_HADDR = 1 << MO_HSHIFT,

FYI, Alex and I talked about recomputing the host address within the helper.

For at least a few of the hosts, we currently never compute the full host
address into a single register -- we use reg+reg addressing when possible.
It's only a couple of instructions to re-compute, given that we know that the
tlb lookup succeeded, and importantly they are all out of line and not bloating
the inline code further.


r~

