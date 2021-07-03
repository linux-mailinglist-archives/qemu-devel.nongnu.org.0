Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DE73BA97A
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 18:28:08 +0200 (CEST)
Received: from localhost ([::1]:37242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lziUx-00025V-Cv
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 12:28:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lziU3-0001Gf-MU
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 12:27:11 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lziU2-0007nj-4b
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 12:27:11 -0400
Received: by mail-wr1-x42b.google.com with SMTP id p8so16418557wrr.1
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 09:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2UC8suEhSXLBMH8DpGN2CWxjXDkeOsjC9qpuD1YaRk0=;
 b=b6+raSLt1Jzpakl3RiM6WvMP9YwpGR3xu5RrwvHxeDXsbgQp8ZMF+bUzZq9SchWzF3
 hED509MSBi32IvECBmVlieN3UJWTfuEEKMH8t7jv6BpL4ND+6GdUI6eQLWTAJ65ElJP5
 86axPF2tRcbvJfaM36lHbZ3hzmslumo8OtckXRChFwSGvo/1Do7Z2UUrHlBNSksj4n3i
 BPxCIIOoHsKiu+GJ/QlApKbEwOJ2di60pDusyeSyMXxXUhMKvhf9MpfbFt+Duw6VZNyq
 SmPSTlqk89Pauc2dyPvbRapFtjYcJ/06C1S5QJHPKFdFmmtaS9JjAotLNwllQNitwYRY
 LRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2UC8suEhSXLBMH8DpGN2CWxjXDkeOsjC9qpuD1YaRk0=;
 b=IVoDJpfH5m6xIrvv8E4zGHaA2yHLKpfZCcaVl1siW1+o2QJcXNxT3IWpgxJCSwV2K/
 uYFE0rJPK3bVPPNBu3HPD7tup3sT+ovpHK/5HsMU/3bVhUok8/TXY73YSTiYPYNV9+aj
 W3K70sQnyyP3zodKCzUmCB1q9vBoHy+/i67r6k4PrM+UMIPc6YfPhWwsBCLNJrVyseJ7
 +VJOggHJJ3zk1IlD12WAU6z8wrs/kzsqGMr9eGEreB7gXPyrjnLMhTxaYqe7nWjL4rPp
 wsXM2UmmVXIvzHKXjdivd8ISBkBybRRnLXa3ry04mjt+WMCfcQasIiSSh+XxkqWEVPzK
 F1Xg==
X-Gm-Message-State: AOAM531A2l30iAByexZYipWG5+wU8eCFauWLjDx/IlzxLhisIEC/zE7k
 fondFJ40NinLFmxiqM4Pb1DMMaY42spLug==
X-Google-Smtp-Source: ABdhPJxRY1EoRdEGW6+vAbtqN9BarnDY8cIuZwGHby/gnG3bFUS/1fAiWYCpxBlECBu/3RVgXg2lrg==
X-Received: by 2002:a5d:4ac6:: with SMTP id y6mr5897287wrs.347.1625329628668; 
 Sat, 03 Jul 2021 09:27:08 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id r18sm7905938wmh.23.2021.07.03.09.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jul 2021 09:27:08 -0700 (PDT)
Subject: Re: clang build error on i686
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Cole Robinson <crobinso@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
References: <abc8f7fe-2afe-0f5d-d391-6277db6e6f42@redhat.com>
 <b969e4eb-c39d-636c-4bc6-8eeb63c971cb@amsat.org>
Message-ID: <6cc46516-6c69-e4ca-7d4d-3f90942e7de5@amsat.org>
Date: Sat, 3 Jul 2021 18:27:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b969e4eb-c39d-636c-4bc6-8eeb63c971cb@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/3/21 6:20 PM, Philippe Mathieu-Daudé wrote:
> On 7/3/21 4:34 PM, Cole Robinson wrote:
>> Hi, I'm hitting build errors with clang on i686 userspace on x86_64
>> kernel. Affects both qemu 6.0.0 and qemu.git, tested with fedora
>> clang-12.0.1~rc3-1.fc35.i686.
> 
>> /builddir/build/BUILD/qemu-6.0.0/include/qemu/stats64.h:58:21: warning:
>> misaligned atomic operation may incur significant performance penalty;
>> the expected alignment (8 bytes) exceeds the actual alignment (4 bytes)
>> [-Watomic-alignment]
>>     uint64_t orig = qatomic_read__nocheck(&s->value);
>>                     ^
>> /builddir/build/BUILD/qemu-6.0.0/include/qemu/atomic.h:129:5: note:
>> expanded from macro 'qatomic_read__nocheck'
>>     __atomic_load_n(ptr, __ATOMIC_RELAXED)
> 
> Ah I hit this one few months ago using Clang10 to build i386 guest
> on mips64el host.

> Ah wait, there is also another one (which I reverted later):
> 
> -- >8 --
> diff --git a/meson.build b/meson.build
> index 372576f82c5..1a5da5ee56b 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -161,6 +161,9 @@
>    error('Multipath is supported only on Linux')
>  endif
> 
> +if 'CONFIG_ATOMIC64' in config_host
> +  atomic = cc.find_library('atomic', required: config_host['ARCH'] in
> ['i386', 'arm', 'riscv32'])
> +endif
>  m = cc.find_library('m', required: false)
>  util = cc.find_library('util', required: false)
>  winmm = []
> @@ -1534,7 +1537,7 @@
>  util_ss = util_ss.apply(config_all, strict: false)
>  libqemuutil = static_library('qemuutil',
>                               sources: util_ss.sources() +
> stub_ss.sources() + genh,
> -                             dependencies: [util_ss.dependencies(), m,
> glib, socket, malloc])
> +                             dependencies: [util_ss.dependencies(),
> atomic, m, glib, socket, malloc])
>  qemuutil = declare_dependency(link_with: libqemuutil,
>                                sources: genh + version_res)
> 
> ---
> 
> No clue neither. Posting in case it ring a bell to someone.

I suppose I dropped it after reading this thread:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg445404.html

