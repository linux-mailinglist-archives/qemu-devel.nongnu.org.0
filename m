Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C230E6714C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 16:25:16 +0200 (CEST)
Received: from localhost ([::1]:49920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlwU7-0007NL-AK
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 10:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42451)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hlwTu-0006yV-Q6
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 10:25:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hlwTt-0003KV-47
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 10:25:02 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:36662)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hlwTs-0003IN-SF
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 10:25:01 -0400
Received: by mail-wm1-x343.google.com with SMTP id g67so5043518wme.1
 for <qemu-devel@nongnu.org>; Fri, 12 Jul 2019 07:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZtO4n09lSDjphtjtHxvcQ8EZIpzPQRY88uQFd31Q4Hk=;
 b=OU1N490Rn5wflZtkozO+kbzzgPnWyd5xiP7OdR6x2viAQpL7WmnjHeiJvJ91y01sP1
 3L+CdEliiAgvgMGbhqrnfQYl7ogy/w4nY1bXqW4C+Rxl7p+Toh6pq3915QnWQ7AeSQZE
 GU4QCai2SPTzBk/h/OLaaAI8ZZCMVAnZgwMqgZwuVzOvbYBieWXmW4oKeuM/yfbBX43I
 WDIiQ2cykhNie0qkrN0niPTgMCLEnXmK00ikRDcTMoifN8GRhf9wAEhVjoepILpXdwxF
 WD7XIdguVUK2hkdxxmIYBaQaMVrSPPZnyV2nwlVvpP4MNb4iA3G9+M6NAmt5cz5/MMps
 a1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZtO4n09lSDjphtjtHxvcQ8EZIpzPQRY88uQFd31Q4Hk=;
 b=udPStSnva5njWsXxs1lCx+Syb5bdeIp58MaYGlkaQ7Sv+94cze3EnC/bkLkSREhgS6
 lmms4ztFL8+O3ntsLQpI/vwFA/IpvZ6Rm3rgzKRwcGFlLnbCsuK9TjVVAdZiXNxEKnzf
 k/zpKivWxYWb4GNBiLegOa40GCbls+8eRWiM39tq82/s/CMsShgcoFY8mtfuIOplyqoH
 oU8xm0Kh01MkmdRS8t27T+WfDeh1cJpspTdQqXXQ10YQ3Xgqt5otHAiLJ1W2dk1S0Xn5
 bS6SG9cd70Wx5CevkVclsMqnbsvoZEzFLaO4AXRkFRs7MdU6g+TGUhwlXIqC9zJ6RP8K
 +3wg==
X-Gm-Message-State: APjAAAWdfqMZ3Rap1GzV21GaSA13FTmZlBuNYM3pRtE8mmQCeuKUKDHp
 kVtWX1BOIG2VQgDKsoHkD4h13A==
X-Google-Smtp-Source: APXvYqw7r30tWlRAYQjc/lBJ843W+hkfGr8w1tV0BnJnPj7ldjle7C2zuL60kRABjLBqBv8rGVB47w==
X-Received: by 2002:a05:600c:206:: with SMTP id
 6mr10033823wmi.91.1562941499432; 
 Fri, 12 Jul 2019 07:24:59 -0700 (PDT)
Received: from [192.168.42.31] ([176.12.107.132])
 by smtp.gmail.com with ESMTPSA id e5sm9210782wro.41.2019.07.12.07.24.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jul 2019 07:24:58 -0700 (PDT)
To: Jan Bobek <jan.bobek@gmail.com>, qemu-devel@nongnu.org
References: <20190711223300.6061-1-jan.bobek@gmail.com>
 <20190711223300.6061-5-jan.bobek@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e64091a9-d8f4-a71c-fcbd-ac27d85d2e64@linaro.org>
Date: Fri, 12 Jul 2019 16:24:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190711223300.6061-5-jan.bobek@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: Re: [Qemu-devel] [RISU PATCH v3 04/18] risugen_x86_constraints: add
 module
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/12/19 12:32 AM, Jan Bobek wrote:
> +sub vex($%)
> +{
> +    my ($insn, %vex) = @_;
> +    my $regidw = $is_x86_64 ? 4 : 3;
> +
> +    # There is no point in randomizing other VEX fields, since
> +    # VEX.R/.X/.B are encoded automatically by risugen_x86_asm, and
> +    # VEX.M/.P are opcodes.
> +    $vex{l} = randint(width => 1) ? 256 : 128 unless defined $vex{l};

VEX.L is sort-of opcode-like as well.  It certainly differentiates AVX1 vs
AVX2, and so probably should be constrained somehow.  I can't think of what's
the best way to do that at the moment, since our existing --xstate=foo isn't right.

Perhaps just a FIXME comment for now?

> +sub modrm_($%)
> +{
> +    my ($insn, %args) = @_;
> +    my $regidw = $is_x86_64 ? 4 : 3;
> +
> +    my %modrm = ();
> +    if (defined $args{reg}) {
> +        # This makes the config file syntax a bit more accommodating
> +        # in cases where MODRM.REG is an opcode extension field.
> +        $modrm{reg} = $args{reg};
> +    } else {
> +        $modrm{reg} = randint(width => $regidw);
> +    }
> +
> +    # There is also a displacement-only form, but we don't know
> +    # absolute address of the memblock, so we cannot test it.

32-bit mode has displacement-only, aka absolute; 64-bit replaces that with
rip-relative.  But agreed that the first is impossible to test and the second
is difficult.

> +sub modrm($%)
> +{
> +    my ($insn, %args) = @_;
> +    modrm_($insn, indexk => 'index', %args);
> +}

How are you avoiding %rsp as index?
I saw you die for that in the previous patch...


r~

