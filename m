Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E406541087E
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 22:04:17 +0200 (CEST)
Received: from localhost ([::1]:44448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRgZM-0005I1-0l
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 16:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRgWq-0003vM-Me
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 16:01:40 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:45680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRgWo-0000ar-TM
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 16:01:40 -0400
Received: by mail-pg1-x529.google.com with SMTP id n18so13182401pgm.12
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 13:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mqJHWUxePRKMKsG+uWxJZwPYygZF7GlimNDUbJ/dCdM=;
 b=Ea5/iuQZb02Ew6M37nfgy5eZ2nR3BTU4Ce2OOhm1qATii34tLxK8HAfZXVgrL5+ewl
 XL44RJyDEKcS7zaE6IF/W3vdpU4DfWzYXfhP1fJ9wyd+B0Uwc/I7yYg3H8lQvmOkHxi4
 len7iFdrH6R7VSVvdpGdYa0yWX9pL8enBkQFl6JZ6lJyVESw2V6W1moKJNWOpFNpzCyC
 tR7/w1DNpmMUul4Fz93fQlEv/s++cu8ImB6OXs0MxTCVFIVcAfTLO4UazK7okP3VjsAx
 AHdTnEqccgIxJcGOCwCCzukRSG2+VFpEdIt6mmTFu8KmyV85EPDmBlHWCVUqnYm0ixvg
 bHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mqJHWUxePRKMKsG+uWxJZwPYygZF7GlimNDUbJ/dCdM=;
 b=q/wOsbINwll9mqNTZ90d4/FCrUQAcYH4rIcSVWZKKeSbvvVg4IgJG+rKA2DlEEEZGX
 Uq+CNcGxlGMyKzuEiNA76S3ClxwZvSARweQNPXsa0gvgfOuLgXeDslrR4nmeIXdiO232
 V1gnqfc0nVlh/rBZwDib/iv6m7VtJzULDbY4xRW0d1oPfwF6WJJgB85MsOetGvynMTlW
 OZ37xiuWIcLljj/Won3FEnF1AqHLgydUNHMXJ6OftrZBQc9Tv0iJkpv5v0HjLVTVFPnD
 2tuRCCPfG2TYCTrKdw35di9Em4jm6WHXKyZXyXE0BDWZpcKjjo5llvzr6zY/StBRzfe8
 kLHg==
X-Gm-Message-State: AOAM5331xLk5FIsdvoYXLUnI8xLh5BKxedLr8q/fQyeRuF75yXlmxwzm
 FnKoOXOlasZe2o9t74/vDc86sQ==
X-Google-Smtp-Source: ABdhPJyjEzetlJ127t0+VCNNonClsz1n9/mOOJaBmKzksqi3z/nVTyGF+btIWpu5Kg4K5+7LQLqsNg==
X-Received: by 2002:a63:4a18:: with SMTP id x24mr15918747pga.209.1631995297150; 
 Sat, 18 Sep 2021 13:01:37 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 26sm12126826pgx.72.2021.09.18.13.01.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Sep 2021 13:01:36 -0700 (PDT)
Subject: Re: Rust in Qemu BoF followup: Rust vs. qemu platform support
To: David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <YURYvaOpya498Xx2@yekko> <87k0jfh88i.fsf@redhat.com>
 <CAJ+F1CJJvqVQrG5iPXV2s7oLbduHfAhHs0pHdZ8XbxLkNi42VQ@mail.gmail.com>
 <YUR2BjppxkBo8mD0@yekko>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dc2df310-ee28-a912-3aad-4d3e38974182@linaro.org>
Date: Sat, 18 Sep 2021 13:01:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YUR2BjppxkBo8mD0@yekko>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.538,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Sergio Lopez <slp@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, hreitz@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/21 4:03 AM, David Gibson wrote:
>> For sparc 32, it was added to support Gentoo at that time which didn't
>> switch to 64-bit yet (https://github.com/rust-lang/rust/pull/48297)
>>
>> For the past 2-3y, Gentoo sparc is now 64 bit. (like Debian apparently for
>> a while)
>>
>> But apparently, by lack of CI it was downgraded to Tier-3.
>>
>> Is it reasonable to officially drop support for sparc 32 in QEMU
>> too?
> 
> As a qemu build arch I would say probably yes.

We dropped host support for sparcv8 (true 32-bit) a long time ago.
We only support sparcv9 in ilp32 (sparcv8plus) and lp64 (sparc64).

I'd be happy top drop sparcv8plus as well, because I haven't been able to test it for 
something like 2-3 years.


r~

