Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0713D4A7B83
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 00:09:35 +0100 (CET)
Received: from localhost ([::1]:37914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFOkn-0003kJ-O4
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 18:09:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFOgo-0002cn-EL; Wed, 02 Feb 2022 18:05:26 -0500
Received: from [2607:f8b0:4864:20::42f] (port=37611
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFOgm-0005bN-C3; Wed, 02 Feb 2022 18:05:25 -0500
Received: by mail-pf1-x42f.google.com with SMTP id a19so621063pfx.4;
 Wed, 02 Feb 2022 15:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Lr2GjeoiN17rUbzPRNE2b1PSRB0HiXf9jcLR8z+0tBo=;
 b=BmbjklBXXuU9fAzMTgBU7F9ICWLDiyGhhdRfKKxswftBPuWrSTYMnb55kIkn0r4jsX
 5s+NMVkbFmdDQygZmc885VdlQ6NJ1Sr8m2xHJ6IB3PtHLsLpgDgKd2vg1LWPpquIWvhQ
 jjDASVyvWotpfjjl/LIIDDE8OhVModx8RAa4qFjdfYDkaa+W+Ms7pPYnTkGpnWGUHJGj
 HTCgVDBeQ1xHzb3CGatxA5BpZud6wlwBT4mFbpjhphOPXCStflM4W0r/AVMAuOjRKoVq
 E+lRJJoapA5wV9zjf9pCx2uoAG6vsTiiSU40hAbmYmkN2nyftj3F8F5dBj3tuNtM7C8X
 mFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Lr2GjeoiN17rUbzPRNE2b1PSRB0HiXf9jcLR8z+0tBo=;
 b=pTNooYHpbLG1zjuSofiZPYVREeDNriRJt+YQ9DSXyZevf/b4LjQ5XERb8w6kWKOx3f
 mK8p5plLZPpVKJ2QNZjynr8n/NfI8l5iTUEQnYLfVMuE24wvaKzhhoyzRrbZlVfdCK44
 9TibPAnuBthLbpuJKkzQGvYHPeiPNDjrM/jemC1CA7NQc2ZqJJaIWu7AtGb0vt81AnC/
 ORWX1rjF6OP+ORpGUTJwB0G0rUuGKzkZzeHGgZwW8j5XoAHOvwIL7+Gy+s62Prdu43o0
 lvyvnB26w0eMIZCakKFJv5dfioFaNCFcukE5+dF5OOH+OWEqjcTjRZKNpY6fL1Dw6F59
 5DCA==
X-Gm-Message-State: AOAM533NvjDecSJBJQvRPpV6WzfHXAoFDyVwWVgaUihJ6pJ4VkMQ1Yjc
 IBX5/G97fTnCtyDJmNZTb8w=
X-Google-Smtp-Source: ABdhPJwWNXy+BxDgoX6NhCLlfionDqTtTa+OZi5oYxkWtTyxJGioAPz/2gImRdHnLeEJUbkqRCGdVw==
X-Received: by 2002:a05:6a00:1828:: with SMTP id
 y40mr31192010pfa.15.1643843121526; 
 Wed, 02 Feb 2022 15:05:21 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id c5sm26298105pfc.12.2022.02.02.15.05.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 15:05:21 -0800 (PST)
Message-ID: <77c6899b-5892-5aaa-97ee-a79a74928c09@amsat.org>
Date: Thu, 3 Feb 2022 00:05:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v2] Fix %#0 misuses
Content-Language: en-US
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, shorne@gmail.com, richard.henderson@linaro.org
Cc: qemu-trivial@nongnu.org
References: <20220202183417.116478-1-dgilbert@redhat.com>
In-Reply-To: <20220202183417.116478-1-dgilbert@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 2/2/22 19:34, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Joe Perches pointed out on lkml [1] that the format special %# (which
> adds 0x) is included in the character count, i.e.:
> 
>    printf("0: %#08x\n0: %#08x\n", 0xabcdef01,1);
> gives:
> 0: 0xabcdef01
> 0: 0x000001
> 
> rather than padding to the expected 8 data characters.
> 
> Replace all the '%#08' cases by '0x%08' and
> also handle a '%#02'; there are some other cases mostly
> in testing and a few that look like the authors have
> thought about the size, that I've ignored for now.
> 
> (Note I've not managed to test most of these)
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> [1] https://lore.kernel.org/lkml/9499203f1e993872b384aabdec59ac223a8ab931.camel@perches.com/
> 
> Fixup %#
> ---
>   chardev/baum.c          | 2 +-
>   disas/alpha.c           | 2 +-
>   disas/sparc.c           | 2 +-
>   hw/arm/omap1.c          | 2 +-
>   hw/timer/a9gtimer.c     | 4 ++--
>   include/hw/arm/omap.h   | 5 +++--
>   softmmu/device_tree.c   | 2 +-
>   target/openrisc/disas.c | 2 +-
>   8 files changed, 11 insertions(+), 10 deletions(-)

Few more:

$ git grep -E '\%#[0-9]{1,2}[dDxX]'
chardev/baum.c:369:            DPRINTF("Broken packet %#2x, tossing\n", 
req); \
disas/alpha.c:1854:  (*info->fprintf_func) (info->stream, ".long %#08x", 
insn);
hw/audio/ac97.c:244:    dolog ("bd %2d addr=%#x ctl=%#06x len=%#x(%d 
bytes)\n",
hw/dma/i8257.c:265:        linfo ("write_cont: nport %#06x, ichan % 2d, 
val %#06x\n",
hw/dma/i8257.c:290:    ldebug ("read_cont: nport %#06x, iport %#04x val 
%#x\n", nport, iport, val);
softmmu/device_tree.c:372:        error_report("%s: Couldn't set %s/%s = 
%#08x: %s", __func__,
target/openrisc/disas.c:48:        output(".long", "%#08x", insn);
tests/qemu-iotests/nbd-fault-injector.py:187: 
print('unrecognized command type %#02x' % req.type)
tests/tcg/arm/fcvt.c:60:    printf("%02d   HALF: %#04x  (%#x => %s)\n",
tests/tcg/multiarch/libs/float_helpers.c:72:    asprintf(&fmt, 
"f16(%#04x)", num);

In mood to add a regexp to checkpatch? :)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

