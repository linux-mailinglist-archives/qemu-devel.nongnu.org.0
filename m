Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 379AC12FE72
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jan 2020 22:49:43 +0100 (CET)
Received: from localhost ([::1]:57104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1inUpB-0006uE-P0
	for lists+qemu-devel@lfdr.de; Fri, 03 Jan 2020 16:49:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44408)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1inUoF-0006F4-Fd
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 16:48:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1inUoE-0008QL-9F
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 16:48:43 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:37833)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1inUoE-0008L4-0V
 for qemu-devel@nongnu.org; Fri, 03 Jan 2020 16:48:42 -0500
Received: by mail-pj1-x1041.google.com with SMTP id m13so5196870pjb.2
 for <qemu-devel@nongnu.org>; Fri, 03 Jan 2020 13:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=RCYW5GbZR9CzpS/KcAepnWIafeha8r2adJmtOW4Iswo=;
 b=WuODK1waDqABqUfHaVY7f3FQIpqkSna131UiY/xECLT35yxmubV5H7tHINe5nliF2m
 YWkd4bquOYYNLise8hS01BV9s9TTXhC5yugoybMYUTbFutcmPlcjoPtwLQ3+D56YbQTm
 j7cm3bOX6xszqyLH20hefQZvNG+40iGQHyGK4oysWZrssor47aqdgRWvYNiyk2kstdn0
 dEmFUavaWhpMrf3F5m130g/1MqkkqzNl6cO5IMJ1adH8o4aEAWOZFeVtoVXJr+cvDYQP
 kRrRsWv0HXgeOKQoVC39HOg6h7Ci9ABZ2LlAJbuLzhdOo8678o/lOkTMz2Tbcmu5GV7M
 GDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RCYW5GbZR9CzpS/KcAepnWIafeha8r2adJmtOW4Iswo=;
 b=ZejOsx5UWwu+3fQzGhGayz3MBdGIfWkyGcvAQtFrOKL/2g0Abjl+0yp8J5uYCu4Djy
 dDM6SeyTxk6Qzqr+tmvo+XR45Z7oKlmF6jLcF9Go38PdL78DqiAbyBAeiOLMvVtERG2U
 nKn5OdLclA9iMBxqtB1SnTqPZWs6Ymik8Ltb6KqdwWwLNNvcSQ5ppu6N9cvLOF3zuBuE
 nfLdfSJ+4fg3kMbiac71Yhw7iVVsLZXlqAAdEYXgg89x7cgnH+opDzRLrbm3zQw0bJmM
 xF5U477/UJSDyG2Ql1dP16aPgEHWvOmnwvOgmXWkGhwqBhqhToGhuSiPj26ecdaSA2aw
 egvA==
X-Gm-Message-State: APjAAAXQ6ClDmonL+jFlzGxUuy0Sk0ZggEk3ltf91XRZLlRrNu7ZTV5F
 BiH8Mv1VROB+OyHb9L0Pc6OcPQ==
X-Google-Smtp-Source: APXvYqzdXLIr3S+QyJ7hTGWCyyRDNbAqZCYTxVh7lrprVaAI7BKPZX1JvziVFhvNIjNCcVamk5m1qw==
X-Received: by 2002:a17:902:c693:: with SMTP id
 r19mr98060342plx.25.1578088120634; 
 Fri, 03 Jan 2020 13:48:40 -0800 (PST)
Received: from [10.103.5.8] (59-100-211-22.bri.static-ipl.aapt.com.au.
 [59.100.211.22])
 by smtp.gmail.com with ESMTPSA id x18sm68308741pfr.26.2020.01.03.13.48.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jan 2020 13:48:39 -0800 (PST)
Subject: Re: [PATCH v3 0/3] Update capstone module
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x <qemu-s390x@nongnu.org>,
 David Hildenbrand <david@redhat.com>
References: <20191015175133.16598-1-richard.henderson@linaro.org>
 <6651b95d-cca2-1173-027b-cc64b86a8ab9@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c2fdf291-3f92-8bfe-c7c9-580de4296541@linaro.org>
Date: Sat, 4 Jan 2020 08:48:32 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <6651b95d-cca2-1173-027b-cc64b86a8ab9@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1041
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/3/20 6:16 PM, Philippe Mathieu-Daudé wrote:
>   -0x0010e8f6:  lpswe     160(%r15)
>   +0x0010e8f6:   .byte    0xb2, 0xb2, 0xf0, 0xa0
> 
> Is it possible to fallback to the older disassembler on a per-instruction basis
> if Capstone doesn't know about an instruction?

Not as written.  But I suppose we could rearrange both dump loops to allow such
a thing.


r~

