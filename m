Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF98DD95F
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Oct 2019 17:30:28 +0200 (CEST)
Received: from localhost ([::1]:56830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLqgV-00028w-AI
	for lists+qemu-devel@lfdr.de; Sat, 19 Oct 2019 11:30:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46872)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLqf6-0001TN-Vp
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 11:29:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLqf4-0007TL-TM
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 11:29:00 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38224)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLqf4-0007Sb-EI
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 11:28:58 -0400
Received: by mail-wr1-x442.google.com with SMTP id o15so8792980wru.5
 for <qemu-devel@nongnu.org>; Sat, 19 Oct 2019 08:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Bs56rXaMVBi0A3n97i2QeahnX8DFKcpNqKpC9oP2oG8=;
 b=pbfC1r8Q0yqnnSfjqiZu+fOYn/G3Pq84RREMSGkegXLzoB02WSzBKfVciKwulCCQA+
 nwCSZ8ty3v53WcacaM4vW8c0dAl40qra1AsVDDsPpPPKRXQV2+IynXhPZ4Em3P6SUQeh
 6Iybdghd/YEPmeS3aaF6oDzA2laKkU9d47EXZN1+KQI0CwLHhmYewvE+HcZn/lgYQxuA
 QhPhAWZXxytKaklw5uuQfYbdThZbcFiInQFZ81DOnQA8s1Ydd4T3/PuJA9XZjc3J98ob
 ohBE2dUop6DnGOdPT2Na4HbiIcJZ7kTDTOj5Wy/SDl6vZAHpD9oI6a9I+HjHGXHMi99Y
 KK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Bs56rXaMVBi0A3n97i2QeahnX8DFKcpNqKpC9oP2oG8=;
 b=ptmCiCnQqjhKbWjSNnwnSNQAG4WT4A7v5CMBn7Z9r3XOkvS+uXWROULmUPnZuC1teR
 khz+H9DhBzX7ypvwvwdG97PZ0H6iLY05F8BCM/ItxSl3bxOM628WlP4lbqQipXlM0zcG
 qfxf33+BH7wdAIUG8pH+NTUV+wsTJtMzn8sG45Uioh4supLKKpoPR8nCFU02XOE/Ofzz
 Vt10PKYYFp53spM1e0yWpG3c9dd5CtF42SfFlvMw4x3Q7oFzPLwy2MCh2YJy6HWd9k8O
 xnsNbv3HxN5Ek4mK2H8Ct1cJbnHxzp19Dn9hha7PZDlTZhIOUbDxsuOPRAW0wnHueP6h
 DOyg==
X-Gm-Message-State: APjAAAX31AeBq9gl2Tu3bJ4XLrr0Ogkrf1KhCWyLr7a5hlcqcyNacikU
 FxxCq+nUVI1XcuY8/URxDJ8=
X-Google-Smtp-Source: APXvYqypPysJQZgUkmdUcFDrBkRH8TV7DOFRGcj+GY5Ps4AWWK+4oez/QdN5vVifm30cH3QRqdcitQ==
X-Received: by 2002:a05:6000:1288:: with SMTP id
 f8mr11864907wrx.111.1571498936516; 
 Sat, 19 Oct 2019 08:28:56 -0700 (PDT)
Received: from [192.168.1.36] (14.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.14])
 by smtp.gmail.com with ESMTPSA id h7sm8767644wrt.17.2019.10.19.08.28.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Oct 2019 08:28:55 -0700 (PDT)
Subject: Re: [PATCH 00/11] tests/acceptance: Fix 64-bit MIPS target tests
To: qemu-devel@nongnu.org
References: <20191019151058.31733-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1190c83d-a0b2-c388-bd32-e910d7504bba@amsat.org>
Date: Sat, 19 Oct 2019 17:28:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191019151058.31733-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/19 5:10 PM, Philippe Mathieu-Daudé wrote:
> From: PhilMD <f4bug@amsat.org>

Oh I sent this from a new workspace, and forgot to set git.user.name :S
git.sendemail.from doesn't enforce it.
I'll simply resend.

> Commit 9090d3332cdcc introduced a regression which makes the
> 64-bit target tests to fail.
> 
> This series fix it (by previously refactoring the linux_ssh_malta
> test), and also add another test for the 5KEc CPU.
> 
> I had to include Avocado-related patches not yet merged again to
> avoid sending patches that will later not apply.
> 
> Please review,
> 
> Phil.
> 
> Cleber Rosa (1):
>    Acceptance tests: refactor wait_for_console_pattern
> 
> Philippe Mathieu-Daudé (10):
>    tests/acceptance: Fixe wait_for_console_pattern() hangs
>    tests/acceptance: Send <carriage return> on serial lines
>    tests/acceptance: Refactor exec_command_and_wait_for_pattern()
>    tests/boot_linux_console: Use Avocado archive::gzip_uncompress()
>    tests/boot_linux_console: Run BusyBox on 5KEc 64-bit cpu
>    tests/ssh_linux_malta: Run tests using a snapshot image
>    tests/ssh_linux_malta: Remove duplicated test
>    tests/ssh_linux_malta: Match stricter console output
>    tests/ssh_linux_malta: Refactor how to get image/kernel info
>    tests/ssh_linux_malta: Fix 64-bit target tests
> 
>   .mailmap                                  |   1 +

Oh, the mailmap change wasn't supposed to get send neither...
It was just to stop receiving bounce errors from Microsoft MTA.

>   tests/acceptance/avocado_qemu/__init__.py |  45 ++++++++
>   tests/acceptance/boot_linux_console.py    |  88 ++++++++-------
>   tests/acceptance/linux_ssh_mips_malta.py  | 124 +++++++++++-----------
>   4 files changed, 159 insertions(+), 99 deletions(-)
> 

