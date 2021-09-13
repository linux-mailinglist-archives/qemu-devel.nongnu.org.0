Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B7040972B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 17:23:16 +0200 (CEST)
Received: from localhost ([::1]:45890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPnnf-0004D4-L5
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 11:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPnmo-0003Uq-Nu
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:22:22 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:33328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPnmm-0006ux-S9
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:22:22 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 192-20020a1c04c9000000b002f7a4ab0a49so209942wme.0
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 08:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q6ql9Tgz7OCs8ANfCHjiOWcNC03VrO+U2SXnfIwjSic=;
 b=jCQKURioAPBjM3r44bEOpxqP/3poUaoY31b0+Gt4xay9eU8oiVx6KAQoVKTE0savIm
 PH4teoB6gVlm/PRtahQr/B29dvAAgVKI8RwyxlVqeBL7OjS82hYknwq27RDgm/S88iRG
 3+ANo94ArRiHwPW4kCrx3r/i6AV/ONij+FHNvVz/uGC30LSWJhiq1ANljh9zEJIm/W3g
 RLqSScAEZlAjlLzZOzGV3rTrEep6K9flKrdjJqpMV4AujdzwV6fcBysO6mrGz4HIeQ2M
 K52CMhbPZuKu9xuy51Jclellk4TPwXl3wp5t5W0HTTL8l9xIwAcNcHbDetjJGVU/foGQ
 csZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q6ql9Tgz7OCs8ANfCHjiOWcNC03VrO+U2SXnfIwjSic=;
 b=Jz5MGankWrVdXFiNFkl8XjifCSmqspbhsQGhCTPnC4VuLH8qKtd0yzUut0t/V/9o5C
 ZmooddlWYY4P8aT4fhaGslaGLe3U5MrxfP2wPhK7ITuxJ9WOCHMjV8K9a6QqygHvc8UZ
 5ghgyf9K7zM8damfRRjlF7YZtGuiNexUJh5yx4OcUda5lpXtScV021nfn4UiMwTfnsZk
 1mwAbrbNokA7CKCnDq2rs/3RtGBgxLPIpEFsQmVTdcLuoGwnsXrpJyYforuO0oCYffJW
 6GVD8VLKOwlWz3soU6o+QWQh28X3E9Xpx4KxdZ8dSyVmY/uP7AvFa6dYOBphkf0Yyklh
 eJFw==
X-Gm-Message-State: AOAM532PHtYa9ikZoLZRIdydWePtUNk0lpJt5XKEimNA/yeeA7du7C5B
 pknkkAYIiNJCg9/nSveUIeQNR+Xp+4k=
X-Google-Smtp-Source: ABdhPJyFgqA00S5QXC5MduXUQyOe75iOzSeEZBcuRUOXuSBbvD+tulDPoWbdoKz0t8SPQ5A5j/4nXw==
X-Received: by 2002:a7b:c8da:: with SMTP id f26mr11668427wml.109.1631546538498; 
 Mon, 13 Sep 2021 08:22:18 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id n3sm7470923wmi.0.2021.09.13.08.22.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 08:22:18 -0700 (PDT)
Subject: Re: [PATCH v2] docs: add supported host CPU architectures section
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20210913130950.214756-1-marcandre.lureau@redhat.com>
 <CAFEAcA97pX7qHLXkGL23_ygFk2hcJEw2J7CSKDJukdbxpvgKpg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f2a05978-430e-1964-7d1e-c32b4babd0bc@amsat.org>
Date: Mon, 13 Sep 2021 17:22:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA97pX7qHLXkGL23_ygFk2hcJEw2J7CSKDJukdbxpvgKpg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.969,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/13/21 3:50 PM, Peter Maydell wrote:
> On Mon, 13 Sept 2021 at 14:10, <marcandre.lureau@redhat.com> wrote:
>>
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> I was looking for such documentation, but couldn't find it. Add it to
>> the build-platform.rst document.
>>
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> ---
>>  docs/about/build-platforms.rst | 28 ++++++++++++++++++++++++++++
>>  meson.build                    |  2 +-
>>  2 files changed, 29 insertions(+), 1 deletion(-)
>>
>> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
>> index 692323609e..518a19aff7 100644
>> --- a/docs/about/build-platforms.rst
>> +++ b/docs/about/build-platforms.rst
>> @@ -29,6 +29,34 @@ The `Repology`_ site is a useful resource to identify
>>  currently shipped versions of software in various operating systems,
>>  though it does not cover all distros listed below.
>>
>> +Supported host architectures
>> +----------------------------
>> +
>> +Those hosts have a native TCG backend and are regularly tested:
>> +
>> +  .. list-table::
>> +   :header-rows: 1
>> +
>> +   * - CPU Architecture
>> +     - Accelerators
>> +   * - Arm
>> +     - kvm (64 bit only), xen
>> +   * - MIPS
>> +     - kvm
>> +   * - PPC
>> +     - kvm
>> +   * - RISC-V
>> +     -
>> +   * - s390x
>> +     - kvm
>> +   * - SPARC
>> +     -
>> +   * - x86
>> +     - kvm, xen, hax, hvf (64 bit only), nvmm, whpx (64 bit only)
> 
> I still wonder if this would be clearer if we listed 'tcg' as
> an accelerator like all the others, rather than describing it as
> a kind of special case in the text above the table. After all, you
> can select it with '-accel tcg' the same as any other.
> 
> I think the information in the table is correct now.

What is TCI at this point?

> Sort the list of accelerators alphabetically ?
> 
>> +
>> +Other architectures are not actively maintained. They may be removed in future
>> +releases.

What are the other archs which could be removed?

FYI QEMU is still being built by Debian on alpha/hppa/ia64:

https://buildd.debian.org/status/package.php?p=qemu&suite=sid

Recent failures comes from:

../meson.build:1218:6: ERROR: Problem encountered: virtio-9p (virtfs)
needs system emulation support

Which is a bug but I hadn't time to look at it.

