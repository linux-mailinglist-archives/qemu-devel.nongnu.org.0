Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE263E3876
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 06:39:14 +0200 (CEST)
Received: from localhost ([::1]:43032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCaaf-0001L3-95
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 00:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCaZc-0000W2-Sz
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 00:38:09 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:46797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCaZb-00030m-Jl
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 00:38:08 -0400
Received: by mail-pl1-x631.google.com with SMTP id k2so12762298plk.13
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 21:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=u/nEYZy7sVb05QGdIUQy6qGnH0RJsxEUCh47mcO+z6I=;
 b=YuoTdF5lUX87ijGkHq3PQ8r2oIS+BAZywMuIj4YGDoUY7w+rLKDEC3OM1HvI42oX8S
 b3DgBKTxUmxCISaW4eTOJ9FqF7qVqH6Si/Eyub8vrjH2xjFl7u9WBxxblFgtlZz36TZp
 1Z3AdBabcTFdE7WpGnhS19osGvIU19isBHpSPUGWpHr7uBCuK/iHcdJuWg9+xkda6jrI
 BHdDDJ3ppLEIJzI6mKywrk5mfzy4sbZIVv297wBJ+M57Vv7JWMYhQswHuwSGxtF5Jax9
 batCzd6LpWJEpuOEcsQnFyFNr8VnERrY7ivPXg0UnnCtgioE2VrmSMYeRA69CpAkl+SV
 yhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u/nEYZy7sVb05QGdIUQy6qGnH0RJsxEUCh47mcO+z6I=;
 b=pTtAif39/i4xpZdDL+bmPvjVAe8hNb7hjnzAA5kn9viURSRZcn3cuoNhyLd5/D+Xi3
 iUoeBK3d/DfAnL4XDsfIFC3C+vOVTHrriZPDCncOJ3r5gNTwcg9Tbw37CJlvCDhvWeaM
 q701/zvuQb8Eisdy7Ytlidd5gpnI8p1ufXBQH7NDE4i5Ez42Rw6kHDRFjNi0uvcKq2cn
 rEmd+cxAJeU13jgvw0T8VrkNHv0TqyNUrkjF7Zfw+Lc+4XnqfCx9TlA2ZfLjqtkDKOXf
 m7WsvjPtJYq/bexAZilDAVi6wdLDDe2bJS9PO822yThwP2BFKwT6vX21yZOuyFFQ7cf+
 goxg==
X-Gm-Message-State: AOAM531CmZMWh5AfpmLCLLPvIL/CpaLil6OwyAgFINQz6kNoXWgIuDFg
 R65BLhlQSV6H4/hdqs3oxFLAPHiKWFCLKQ==
X-Google-Smtp-Source: ABdhPJzxzbQ3ktMZqHF4GJ2vg69JdpfpI8qvLur3RMZ5Wx0RtSG0A2y+w2UvcaKq11G9d+MHC6JLjA==
X-Received: by 2002:a63:4c1f:: with SMTP id z31mr892799pga.50.1628397486229;
 Sat, 07 Aug 2021 21:38:06 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id m6sm3169587pjv.40.2021.08.07.21.38.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 21:38:05 -0700 (PDT)
Subject: Re: [PATCH for 6.2 07/49] bsd-user: style nits: apply qemu style to
 these files
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-8-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5643e5a0-8882-e7ff-e687-eb4c79b286bf@linaro.org>
Date: Sat, 7 Aug 2021 18:38:03 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-8-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: kevans@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> Fix style wrt {} placement, spaces around () and line lengths.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/i386/target_arch_elf.h   | 27 ++++++++++++++++-----------
>   bsd-user/x86_64/target_arch_elf.h | 11 +++++++----
>   2 files changed, 23 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

