Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0925C203CEB
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 18:47:18 +0200 (CEST)
Received: from localhost ([::1]:33664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnPbH-0003qB-Nc
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 12:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jnPZU-0002Ub-Bx
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 12:45:24 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:33981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jnPZS-0008Fy-J3
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 12:45:24 -0400
Received: by mail-wr1-x444.google.com with SMTP id v3so9898360wrc.1
 for <qemu-devel@nongnu.org>; Mon, 22 Jun 2020 09:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zqxE+SqsntXFGDof21TROGBk05gG/0WdoxKbuB+qg9I=;
 b=MoempcsEm+w67EaMk0WVVUxgtHSIMIk0GaOlPrwqmFfesTP240OkjYM10U8q7fdVyi
 mWzRmhvVw/XE+VF5FQP3czxyBi9/TJ13MR4S0/ouMRB4W5D9gZLTJDLzvmfNcvl8TJJh
 jFaf80KQ6fhqZC86JuxJQjjaxLOnGTZp8i8PNHzDxfHxUb17/ZL8R5MaWyksXBDZ32/x
 7F/rVWsEt12shBPmwVmuhIaLxwCnZI2+i98ZMBVpG5urEGC+0uPpsoM+sxs2XcKYe6+m
 WIaGT2RbhOgEcON0zwQiHKXa/ksHvxBEmIhFyIDZSwUpBjBHOpU0D43g5iAyfngw0JVE
 L+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zqxE+SqsntXFGDof21TROGBk05gG/0WdoxKbuB+qg9I=;
 b=N5+h9aXb/xZk7FSvD1QeL4A/MSrP8wCWN9krOs3hX56A56U43jdQBkU/ftqGswBVo2
 LV0eSYMKML6h0ycAgGoNrP8hFBYnaaHRxopLqCFoocZIZdndreUdKhGiWeZ07pq8O9pr
 /kLdBpxP5aBnEuiI6R8Lc9+IFdbQ+TWKJBr8LAO5ienDKxFujNzGAFzXWukW0ovYYxAj
 XdGWCgpvcMno7Bj5FpXmKrRO+niW2dZ1PxITv4gU42SZ+u0eaQdoPBmnyCvgnN8CmJmB
 Yxj84WZr2/sfiRr1+uChoZba7966z093h5+81jq5x4lXivcvzAxmfvrcDEJDt66qdsa2
 co0A==
X-Gm-Message-State: AOAM532hZNc4T7qPL7p1fgQJVC6OD4GRQH54qqbxznACCEpII+wXGjyZ
 duq0XaYpQBFsqJSNuK7NoDk=
X-Google-Smtp-Source: ABdhPJykwIcoqbg40xcOMqb/jF5ReOSopAqbdFfsg5IqO0piPbhoIRkqxdVD6sr2VY3FTMFWMFnTEw==
X-Received: by 2002:adf:f450:: with SMTP id f16mr20229294wrp.307.1592844321128; 
 Mon, 22 Jun 2020 09:45:21 -0700 (PDT)
Received: from [192.168.1.40] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id n8sm15541105wrj.44.2020.06.22.09.45.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2020 09:45:20 -0700 (PDT)
Subject: Re: [PULL 00/15] Renesas hardware patches for 2020-06-21
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20200621124807.17226-1-f4bug@amsat.org>
 <CAFEAcA_5663fFNVqcr1maATB6v8R297LmJEtD+8V4LvhaSkjPA@mail.gmail.com>
 <CAFEAcA-w4DGH2wEwySZd+zj-m+YpL39tog9S9LNH2iTcL84F9Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8ec1ccc2-7e7f-94cf-dedf-86c09832c0f7@amsat.org>
Date: Mon, 22 Jun 2020 18:45:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-w4DGH2wEwySZd+zj-m+YpL39tog9S9LNH2iTcL84F9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Magnus Damm <magnus.damm@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Thomas

On 6/22/20 6:19 PM, Peter Maydell wrote:
> On Mon, 22 Jun 2020 at 17:01, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Sun, 21 Jun 2020 at 13:50, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>> Renesas hardware patches
>>>
>>> - Add a common entry for Renesas hardware in MAINTAINERS
>>> - Trivial SH4 cleanups
>>> - Add RX GDB simulator from Yoshinori Sato
>>>
>>> The Renesas RX target emulation was added in commit c8c35e5f51,
>>> these patches complete the target by adding the hardware emulation.
>>>
>>> Thank you Yoshinori for adding this code to QEMU, and your patience
>>> during the review process. Now your port is fully integrated.
>>>
>>> Travis-CI:
>>> https://travis-ci.org/github/philmd/qemu/builds/700461815
>>
>> Hi; I'm afraid there's a format-string issue here (manifests
>> on OSX, openbsd, and 32-bit platforms):
>>
>> /home/peter.maydell/qemu/hw/rx/rx-gdbsim.c: In function 'rx_gdbsim_init':
>> /home/peter.maydell/qemu/hw/rx/rx-gdbsim.c:93:22: error: format '%lli'
>> expects argument of type 'long long int', but argument 2 has type
>> 'ram_addr_t {aka unsigned int}' [-Werror=format=]
>>          error_report("Invalid RAM size, should be more than %" PRIi64 " Bytes",
>>                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>                       mc->default_ram_size);
>>                       ~~~~~~~~~~~~~~~~~~~~
> 
> Also there appears to be a makefile/dependency bug somewhere,
> because when I drop this merge attempt and retry building
> with current master I get this error:
> 
> make[1]: Entering directory '/home/petmay01/qemu-for-merges/slirp'
> make[1]: Nothing to be done for 'all'.
> make[1]: Leaving directory '/home/petmay01/qemu-for-merges/slirp'
>   CC      qga/main.o
>   CC      qemu-io.o
>   CC      monitor/qmp-cmds-control.o
> make: *** No rule to make target
> '/home/petmay01/qemu-for-merges/hw/rx/Kconfig', needed by
> 'aarch64-softmmu/config-devices.mak'.  Stop.
> make: *** Waiting for unfinished jobs....
> make: Leaving directory '/home/petmay01/qemu-for-merges/build/w64'
> 
> This seems to be because aarch64-softmmu/config-devices.mak.d
> in the build tree says that aarch64-softmmu/config-devices.mak
> depends on all the Kconfig files; this means that if a Kconfig
> file gets deleted then incremental build stops working?

This seems the same problem previously discussed here:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg676319.html

