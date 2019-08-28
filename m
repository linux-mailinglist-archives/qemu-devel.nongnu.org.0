Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3F99F77C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 02:40:39 +0200 (CEST)
Received: from localhost ([::1]:59974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2m0s-0005Bv-Ht
	for lists+qemu-devel@lfdr.de; Tue, 27 Aug 2019 20:40:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58395)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i2lzo-0004m6-Me
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 20:39:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i2lzn-0003lC-Fu
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 20:39:32 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:43190)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i2lzn-0003kE-9B
 for qemu-devel@nongnu.org; Tue, 27 Aug 2019 20:39:31 -0400
Received: by mail-pg1-x52d.google.com with SMTP id k3so383190pgb.10
 for <qemu-devel@nongnu.org>; Tue, 27 Aug 2019 17:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oYqJyUsxqEQiQllyTaG43HIBhi33LzrW0fW3Gni8xEw=;
 b=ZTDcQPUQ+qGbjcubmMzHMk3XT2IWmoqf1hIXG+DBMY1hDElcU4s0292qoXtFJCPoAK
 3Gbdur2KPOEOuc7rUDAU8sQIToC5M26jiLeHkqwqcdjJQSPuBMeVle6Fgp6yyAEDYd9E
 qcNiCA2OrlSZc1DM0e8nN9ee6X7BDUo/MXkFKhjWFYIRpTRnyGijoci2I57sc6clT9ow
 NlnTGLxsM1DlrFbsOZml/rGXfFyaZbhMJ3P3POGHa91kQbZr7OEkzyT7KL6bupkGQpAI
 MatHq1m0ZaQGNL7MdO6GJ38hVb1Jtrm7mM5ma0f9gEePUcp0gyLRrvNHMBCjrSl2mUI4
 kwEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oYqJyUsxqEQiQllyTaG43HIBhi33LzrW0fW3Gni8xEw=;
 b=hqgJE0aeCIe3iEUvZV8JVCrskoRS+EvHWr7U0/6Uv8MP/AAGsrgyCS4lNY7ePO3FqF
 WPXp2v5XOdfTv3aRTztnSbRRf/06CwzEjjGdsBlnAM5Cz4GwOL5x82atHJs6f2mh5bq7
 hEPFmo/o5tZGdvgQxOnaqNIqTfGcf+/sptcXOlmuOdynHGTmYvo06x+92hhrlHQV6AjA
 ET+tLV+qXIXxWhMGeYaOvgpd+p+Fa3ai/Lbhef1390Mib6U6w8n1bYVH/+jz9VjNVq9t
 0m5a/VmIbVli2fe8vFvWPBHsWYzk5oi11hwA800WIWad521M5Lck/CahQFW3OejZDf8Q
 7bcg==
X-Gm-Message-State: APjAAAXugUYTmVL++Rv7yjo3PIiktYXNP92l24OtCGdjvAv8CmpxuT6S
 j+bDQVMeK3+bT2rLsJuVPC+k0z3wGKU=
X-Google-Smtp-Source: APXvYqws53mWOtw5GVyAvqr90+VfCihex80NG0ywcZaO0x1xDnu7Fzuew4S2pH/JMKqBPxJ8JI7cog==
X-Received: by 2002:a62:1444:: with SMTP id 65mr1470606pfu.145.1566952769404; 
 Tue, 27 Aug 2019 17:39:29 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id p20sm483166pgi.81.2019.08.27.17.39.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2019 17:39:28 -0700 (PDT)
To: Sandra Loosemore <sandra@codesourcery.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <81a8c0ca-c5fb-fc3d-cc7b-00c4da31d621@codesourcery.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6ee9f4b4-39ff-f36a-9430-3e7a5de7a2de@linaro.org>
Date: Tue, 27 Aug 2019 17:39:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <81a8c0ca-c5fb-fc3d-cc7b-00c4da31d621@codesourcery.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::52d
Subject: Re: [Qemu-devel] libvhost-user: undefined reference to
 MADV_NOHUGEPAGE
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

On 8/27/19 5:26 PM, Sandra Loosemore wrote:
> Yesterday I tried to build the recent 4.1 release system-mode QEMU for
> aarch64-none-elf and ran into a compilation error in
> ./contrib/libvhost-user/libvhost-user.c.

Why are you attempting to compile qemu for a non-hosted (aka bare metal)
configuration?  That is certainly not a supported thing to do.  We require
POSIX (or Win32) at a minimum.

I can only presume that you're intending a hosted configuration, and using a
cross-compiler that doesn't actually match up.  What is the intended host (and
libc if this is for Linux, since there are at least 3)?

> It's complaining about
> MADV_NOHUGEPAGE not being defined.  I'm not familiar with that code or even
> what it does; should that bit of logic be made conditional on MADV_NOHUGEPAGE
> being defined, or is this indicative of a configuration error for this target? 

I'm leaning toward the latter, but you're not giving much in the way of a hint.


r~

