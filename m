Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B8E512B12
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 07:46:33 +0200 (CEST)
Received: from localhost ([::1]:37720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njwz2-0007jq-7g
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 01:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1njwq3-0005tX-Qc
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 01:37:17 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:38734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1njwq1-0001w6-In
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 01:37:15 -0400
Received: by mail-oi1-x22c.google.com with SMTP id r8so4304407oib.5
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 22:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ekTMYfKN4Uc3BCAaUC6PjjI1eropAXAKK6yzSfYoPZQ=;
 b=uYP6FXAa44WowIDHRUVfNIip0AGy6zCpsETHHjhF7Zl/yOdujbUUprivnkMotrLtXx
 oUMpa9a79sR7bDBbs6YL1S751j9eWFFqdhFeXpj77xYJBge/qTpGHR4LVTO9sBBy/3xm
 lc13C94YlKOP+EtQIfuBQtSzV4vk606ndP0KD7RE8icCOl5WFkPrci1uSpYeBIsi3vbc
 DhKsVdj9jqW27dOdTAg6FeBam/lHr6+HCRD8A93MjAOmM/gOqOeGhswnHzIgWU3qwZVn
 d27Rmw9Oduv6eBq5T8BQj3zZsGcHjZTqEFSzfKgZEZ4mhNA/MWG+r7wim/fD8Mlk+TYh
 2Qlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ekTMYfKN4Uc3BCAaUC6PjjI1eropAXAKK6yzSfYoPZQ=;
 b=QYn6U2MlIPBgRDacMZCI9Ljsmp1HdDSyTefTksUbNF9CLElFJBa4aAUzY4ESbZEcVE
 t8AX9LTh8k1hHusWrFtjTSNgM9d0VUFvDkLW6dBUnutqlXL8OnEhxCksNVxGCE4Yc2g2
 6AYYcY+cvE4f9r4ES6bJVV3jf8wymGekAsUtH0Nlfr3KBmsHDGxPCths4G3d4bc18mzg
 b9MvQs0gkH9Vc8/yrTAJM9BoAK2jyGM1b/HirCdIxli0oAtGHsHveB/niGMaTOSZui6X
 1RB+4+DAqt9KHFNZWPKDA/XGbVyIkldMUihfppw60mGaTUWqHDyQxzu4DvbbBK6ca9JV
 rlog==
X-Gm-Message-State: AOAM531KVpUI6KSlm2CcsAB4S9mQ3xJWiCd/vZlQ018oHKvF/5GuUKNF
 VjcbvUNgKH62vBvrIheQxT3HVQ==
X-Google-Smtp-Source: ABdhPJxFA8mZVt+UhH4U9JDki2YUe5sdvuzeejBQJeXjkM3bpQHKXZBSTWGAQ5iAkLb4sGLxTrsG1A==
X-Received: by 2002:a05:6808:1886:b0:322:f55c:133d with SMTP id
 bi6-20020a056808188600b00322f55c133dmr14724917oib.217.1651124231505; 
 Wed, 27 Apr 2022 22:37:11 -0700 (PDT)
Received: from [192.168.86.188] ([136.62.4.88])
 by smtp.gmail.com with ESMTPSA id
 bp17-20020a056808239100b00322c34c4afbsm6948218oib.25.2022.04.27.22.37.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 22:37:10 -0700 (PDT)
Message-ID: <ba41f9ab-bce4-b377-e99c-caa0d8240308@landley.net>
Date: Thu, 28 Apr 2022 00:41:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: serial hang in qemu-system-ppc64 -M pseries
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <74b9755a-4b5d-56b1-86f5-0c5c7688845a@landley.net>
 <8558c117-75a0-dc73-9b1a-be128e04056c@redhat.com>
From: Rob Landley <rob@landley.net>
In-Reply-To: <8558c117-75a0-dc73-9b1a-be128e04056c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::22c;
 envelope-from=rob@landley.net; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/22 10:27, Thomas Huth wrote:
> On 26/04/2022 12.26, Rob Landley wrote:
>> When I cut and paste 80-ish characters of text into the Linux serial console, it
>> reads 16 characters and stops. When I hit space, it reads another 16 characters,
>> and if I keep at it will eventually catch up without losing data. If I type,
>> every character shows up immediately.
> 
> That "16" certainly comes from VTERM_BUFSIZE in hw/char/spapr_vty.c in the 
> QEMU sources, I think.
> 
>> (On other qemu targets and kernels I can cut and paste an entire uuencoded
>> binary and it goes through just fine in one go, but this target hangs with big
>> pastes until I hit keys.)
>> 
>> Is this a qemu-side bug, or a kernel-side bug?
>> 
>> Kernel config attached (linux 5.18-rc3 or thereabouts), qemu invocation is:
>> 
>> qemu-system-ppc64 -M pseries -vga none -nographic -no-reboot -m 256 -kernel
>> vmlinux -initrd powerpc64leroot.cpio.gz -append "panic=1 HOST=powerpc64le
>> console=hvc0"
> 
> Which version of QEMU are you using?

$ qemu-system-ppc64 --version
QEMU emulator version 6.2.92 (v6.2.0-rc2)
Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers

From november. I can pull and rebuild but it'll take a bit. (Hopefully
rebuilding would fix the need to echo -e '\e[?7h' afterwards to undo the "bash
command line history marches up the screen because qemu's x86 bios disabled line
wrap and then left it that way" issue...)

> Which frontend (GTK or terminal?) ... 

The above command line has -nographic, forcing terminal. Running ldd on the
binary doesn't pull up anything gtk. (It pulls up libncursesw though.)

If you want to reproduce my test locally:

wget https://landley.net/toybox/downloads/binaries/mkroot/0.8.5/powerpc64le.tgz
tar xvzf powerpc64le.tgz
cd powerpc64le
./qemu-*.sh

Then paste something longer than 16 characters at the eventual command prompt
once the kernel finishes booting.

If you want to reproduce it all from source:

git clone https://github.com/landley/toybox
cd toybox && mkdir ccc && cd ccc
wget
https://landley.net/toybox/downloads/binaries/toolchains/latest/powerpc64le-linux-musl-cross.tar.xz
-O - | tar xv
cd ..
CROSS=powerpc64le LINUX=~/linux scripts/mkroot.sh
cd root/powerpc64le
./qemu-*.sh

This assumes your linux kernel source directory is in ~/linux of course, and
that qemu-system-ppc64 is in the $PATH...

> this rings a distant bell, but I thought we had fixed these issues long ago 
> in the past... e.g.:
>
> https://yhbt.net/lore/all/1380113886-16845-10-git-send-email-mdroth@linux.vnet.ibm.com/
> 
> https://git.qemu.org/?p=qemu.git;a=commitdiff;h=8a273cbe53221d28

The qemu I'm running is newer than 2016. :)

Most targets are fine with this: I cut and paste entire uuencoded binaries into
the serial console as an easy way to insert a file into an initramfs. It can
usually take multiple megabytes without dropping a character, so you just
"uudecode" enter, and then paste.

Even my 32 bit powerpc target works fine with this. (Although -M g3beige is a
very different machine from -M pseries...)

Alas this target (and sh4 -m r2d) stop at 16 chars. (On sh4 the extra is
discarded, not delivered progressively as more interrupts are generated.)

> ... but maybe my memory also just fails and this has never been properly fixed.
> 
>   Thomas

Rob

