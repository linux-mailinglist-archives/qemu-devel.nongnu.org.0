Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 073C417AB1E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 18:03:41 +0100 (CET)
Received: from localhost ([::1]:53388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9tuN-0007cN-RA
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 12:03:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34327)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j9tiC-0002Wh-TR
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:51:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j9tiB-00067C-G7
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:51:04 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:55897)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j9tiB-00066I-9u
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 11:51:03 -0500
Received: by mail-pj1-x1042.google.com with SMTP id a18so2718846pjs.5
 for <qemu-devel@nongnu.org>; Thu, 05 Mar 2020 08:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=jdAT1lY5ZSNfZXH4oW7IfrU6JXM0IDrAIQ1QPwd6vNc=;
 b=iw2cWdhQreyFtYWFC4xYFL05xeaIQJHWlVU4u9hOAuTvdjDPtspjErh/RRzXpujPST
 W9mCYfg5tpPWAdAl5oYcnisorv/DsEVXWOiSAFOxUg/2PFT032CBJowJPLnhNP+9/41f
 MJqbDDXXF7Spv3CYl+m+7I0SoQfO9ERmQpYQLIpGel7RjGu6rHfgcbtrcUirZpgqod3o
 sPXXu73v6QZCeRA2iuLVbdftBn3o/vaPMtKbICdewgtqS3WObRCLbt4cuFf2VDr2TD73
 Q8eKQIQFiW1kj2K+danqnCQjmEefWHqYPd7KcVQWnPErU7VmrOIzeIIouMpTE63T6TxM
 Xp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=jdAT1lY5ZSNfZXH4oW7IfrU6JXM0IDrAIQ1QPwd6vNc=;
 b=o3OqYB4aBnuwW/BHlCIwxUUWYTG0QQngj6wJSZ1pRbGs1NNisp99SkWuW/VJ8HbBEH
 66EzaOTvNw6lRDWxqG+qgXQ1FlXnJ0/gL+drYpZYRg//yNba4AIsHHZz9oiqpNLPiW+w
 WH6ROwNGROxCNE9qoplJkOunFxtqtIQy4TB/0VyA3QMeTFALIlADusZfgQ3Nkb2xf1vV
 mE+WMI7b5Wem7+R8evnRfJXexjhoYqqA4TNM1olwkAsz0hgew+l6iwqj+WJj+BawQXd/
 l4Qtk+bd/2OAvovRYVW1Mci3pRmTLTHLtTVMpVlI1oWScZmB0S2SjBrKFxR06NY8Tlpm
 xhzg==
X-Gm-Message-State: ANhLgQ0AZQyNb4YYXwKoXm1CLinn8ZmgMr2eTp01nAcajopeixuzqfYu
 2U2jO2Id3w4zysPgUcKvrlnAIw==
X-Google-Smtp-Source: ADFU+vs9pqKTgXqxcX6QlnKcqMBPvRPqnZt71b1QGOhJp+SOpkMMpjVrO2jqpt++yqXgtpiWmkBD3Q==
X-Received: by 2002:a17:902:5ac9:: with SMTP id
 g9mr4220219plm.125.1583427062096; 
 Thu, 05 Mar 2020 08:51:02 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id b9sm3651887pgi.75.2020.03.05.08.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 08:51:01 -0800 (PST)
Date: Thu, 05 Mar 2020 08:51:01 -0800 (PST)
X-Google-Original-Date: Thu, 05 Mar 2020 08:50:39 PST (-0800)
Subject: Re: [PULL 04/38] target/riscv: Add support for the new execption
 numbers
In-Reply-To: <CAFEAcA9gHNXfGutEZiW-PYJbhdUZEd-dPDp8iwO-Ni_cSD9gZw@mail.gmail.com>
CC: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <mhng-fa11262f-92d7-4d2c-a674-dc177483da95@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
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

On Thu, 05 Mar 2020 08:44:20 PST (-0800), Peter Maydell wrote:
> On Tue, 3 Mar 2020 at 00:49, Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>>
>> From: Alistair Francis <alistair.francis@wdc.com>
>>
>> The v0.5 Hypervisor spec add new execption numbers, let's add support
>> for those.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
>> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
>> ---
>>  target/riscv/cpu.c        |  8 ++++++++
>>  target/riscv/cpu_bits.h   | 35 +++++++++++++++++++----------------
>>  target/riscv/cpu_helper.c |  7 +++++--
>>  target/riscv/csr.c        |  7 +++++--
>>  4 files changed, 37 insertions(+), 20 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index efbd676edb..2f62f5ea19 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -67,6 +67,14 @@ const char * const riscv_excp_names[] = {
>>      "load_page_fault",
>>      "reserved",
>>      "store_page_fault"
>> +    "reserved",
>
> Hi; Coverity (CID 1420223) notice that there's no comma
> after "store_page_fault", which means that there's been
> a concatenation of that string and the following "reserved".
> Could one of you send a patch which adds the missing comma?

Sorry about that.  I just sent the patch, LMK if you want me to PR it or if you
want to just pick it up.  I do have a few other things in my queue right now,
but I'm not quite ready to send those (testing and such).

>
>> +    "reserved",
>> +    "reserved",
>> +    "reserved",
>> +    "guest_exec_page_fault",
>> +    "guest_load_page_fault",
>> +    "reserved",
>> +    "guest_store_page_fault"
>
> You might also like to add a trailing comma here to avoid
> the bug happening again in future.
>
>>  };
>>
>
> thanks
> -- PMM

