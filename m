Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C258F372D9C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 18:09:54 +0200 (CEST)
Received: from localhost ([::1]:37344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldxcP-0007sG-Kh
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 12:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldxU1-00020G-0i
 for qemu-devel@nongnu.org; Tue, 04 May 2021 12:01:14 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldxTv-00082d-Ci
 for qemu-devel@nongnu.org; Tue, 04 May 2021 12:01:12 -0400
Received: by mail-wr1-x436.google.com with SMTP id l13so8411726wru.11
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 09:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RTdskdAdQVXmHlemL9vDem9lYirVvZoEyZ1WAR+paeQ=;
 b=bijpp7KCExvXEkanUSu80p+WmDXBkEYCs2m1PfKrrkiI0Gc7llfCxocflutz/kfoiF
 ZotCaHJWhdWetV9j5+Ggz18ZbeeGBlxNdJvdVD/KsB4su+iGiYyzVVx1kZkcVa5c1dYF
 IqHWd4EnpwqxvguWRugg9jwNVT8Fd11UiwEJHi+VdXkffSYAqM4AmvmRTHmZDijLUj5/
 G31JVgsvvFvPLea0YuJRKIC7m2t4cIuIdg9wVNBTxG3ZSGw/TeBYYEtOf2cY3DlPo0bf
 wSaROpc+RWU7KHRUaiz3FLR/b2ytvzMmuNyUCWg3B84srU8Ek8h8Tl2vYtW/KWem3aYe
 b26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RTdskdAdQVXmHlemL9vDem9lYirVvZoEyZ1WAR+paeQ=;
 b=krfUigLqTeROYyV/zLk8rMj75DofZlYVUCmvC1vy/R8OWy9U/z0aKhbqVpkh4+uBzJ
 WS+7Ooq8Y/RJwgKdOAoURvAnSND40z90m0U23jeb0CoIczfJqgUyx8hjty6fStwVAPZg
 ea7Ncx4iPKJAZ4rNSyt83sASRMnccKHpAsSlscwFum4q9Y50VaOkz+Y/AQFpOOn3/WIn
 zjWTyqIfIjFDe98iVe1OIdmG04/vr1uOsM9rkCyURvB0OQX80DeQVCGfPLvB2LH8pfWv
 5ct27dgtE1ucbR4/YxP2rB4N+Dde/t+hNdUmc6o2dNmpedRvb/A9tBUpnWh9Quj6DLbu
 klOA==
X-Gm-Message-State: AOAM533FLHGs3VgEfY5b2ro4YcOuYveWz3PMU/78zTFMKdmMmQxNTvYG
 U5gJLyISnC0Q4yXXplZnr9o=
X-Google-Smtp-Source: ABdhPJz/0Na5Cs6sZUVA73RkI0oC2KaNTBgVExx9uZQ1PLhYrsh3XI0PNnl8QoBWL6bqQCyMRR91CA==
X-Received: by 2002:a05:6000:2ad:: with SMTP id
 l13mr31956278wry.417.1620144063742; 
 Tue, 04 May 2021 09:01:03 -0700 (PDT)
Received: from [192.168.1.19]
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id t10sm2965304wmf.16.2021.05.04.09.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 09:01:03 -0700 (PDT)
Subject: Re: [PATCH 4/7] tests/acceptance: Sun4uMachine: Remove dependency to
 LinuxKernelTest
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
References: <20210503224326.206208-1-wainersm@redhat.com>
 <20210503224326.206208-5-wainersm@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0aaa0e83-ea50-8836-20a8-75ef32617731@amsat.org>
Date: Tue, 4 May 2021 18:01:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503224326.206208-5-wainersm@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: willianr@redhat.com, Thomas Huth <thuth@redhat.com>, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Wainer,

On 5/4/21 12:43 AM, Wainer dos Santos Moschetta wrote:
> The Sun4uMachine class inherit from LinuxKernelTest to effectively only use
> the KERNEL_COMMON_COMMAND_LINE attribute. This change remove that unneeded
> dependency, making Sun4uMachine self-content.

It is odd because the test boots a Linux kernel...

Once you added ConsoleMixIn, LinuxKernelTest is left with
2 methods related to archive extraction. Not particularly
specific to Linux kernel. Beside, shouldn't these methods
be provided by Avocado directly, by avocado.utils.archive
and avocado.utils.software_manager.backends?

> I took the occasion to delint the code: the unused os import was
> removed, imports were reordered, and the module has a docstring now.
> 
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> ---
>  tests/acceptance/machine_sparc64_sun4u.py | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

