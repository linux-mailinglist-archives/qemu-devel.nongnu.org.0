Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D90693C0D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:12:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pROJV-0006e8-IB; Sun, 12 Feb 2023 21:11:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pROJT-0006e0-Ag
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:11:27 -0500
Received: from esa7.hc2706-39.iphmx.com ([216.71.137.80])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pROJR-0000Hb-6O
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:11:27 -0500
X-IronPort-RemoteIP: 209.85.160.198
X-IronPort-MID: 259497414
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8cx3r6MEYIUPuHHvrR0blcFynXyQoLVcMsEvi/4bfWQNrUp3hjxSy
 TMYD2qObq3ZYDagc90jPdy28kgHsJXdnd9jSQZtpSBmQkwRlceUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraf656yEnj8lkf5KkYMbcICd9WAR4fykojBNnioYRj5VhxNO0GGthg
 /uryyHkEALjimEc3l48sfrZ80s15a6q4lv0g3RlDRx1lA6G/5UqJM9HTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiG9Y+DyDX4pZlc/HKbix5m8AH+v1T2MzwyKtgo27hc9hZk
 L2hvHErIOsjFvSkdO81CnG0H8ziVEHvFXCuzXWX6KSuI0P6n3TE29dqDVMIGKkh0LxSOH13y
 fgBFhIkV0XW7w626OrTpuhEg80iKIzyINpatCgxnXfWCvEpRZ2FSKLPjTNa9G1o14YeQLCHO
 ZJfMGs/BPjDS0Qn1lM/AZYumuuyrnPiNTBUtTp5oIJtvjmPnVMtieSF3Nz9U92lWOlqtUKhl
 ln3wGLzJxhEaOekxm/Qmp6rrqqV9c/hY6oLGbils/JnnlCX7moUDhIQSB28u/bRt6Klc9dWK
 khR4zZ36KZrpRztQd76UBm15nWDu3bwRuZtLgHz0ynVooK83upTLjFsouJpADD+iPILeA==
IronPort-HdrOrdr: A9a23:rJU02KP4NCfrNcBcTvCjsMiBIKoaSvp037BL7TEWdfUxSKfzqy
 nApoVi6faZslgssVsb+exoQZPwJU80rKQFhrX5Xo3CYOCFghrQEGgK1+KL/9SKIUHDH4BmuJ
 uJGMNFeb/N5TAQt7eY3ODBKbkdKS68gcWVuds=
Received: from mail-qt1-f198.google.com ([209.85.160.198])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 12 Feb 2023 21:11:20 -0500
Received: by mail-qt1-f198.google.com with SMTP id
 bs11-20020ac86f0b000000b003b9b4ec27c4so6627370qtb.19
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zf3WFpu5qlCtZNfTGc0HFG8UGYMt1sCTtR5zKMP/ujw=;
 b=Z3YPjgAnKrr4ERB+KGHNlF0N05My7Fj0KUOKdNeaXhj7MzUE3TOIpOflw1zuyrRIRB
 CJ0X+Gw2fR3xCPLi+gbFQBlfFWxqECG+xodzCp8cCTFDRrIsKjFyEcIkd8gUmqNiOV2i
 r9q+CpvV1SmzsKKBkgcnlePyu1O6bFe5Mk5+TYMf5OLYe9E0SFAZecjBoaZ3fl/bJ+Dn
 RcO/hueCZtLTzjCH2hvBzm253XuXo8MgYaZ0oSLP/y1nn+8/QnzN68SEfUFQhqNtr5fr
 0RPRXi2OXGfQOdUCbh+rsELUzEnF5FrSIJugRKW76LVbgB/2v1Cn7F0C84tB7qtWuywq
 guRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zf3WFpu5qlCtZNfTGc0HFG8UGYMt1sCTtR5zKMP/ujw=;
 b=PgPxYbwt3hOrxeMzryFyaGNj/6AwBpSpc6bIQ2ENtZkO2SZzCpdnrZkDJc0Iqp4o6R
 kIVMrNMDyENMXYBhwvnkc51ty1EVi2H72rA6eOdD3Tmp/+RjeDwf9l/Ld6lRWp7iUvzP
 SniUw8h+OfC9W16342IB3WDgR65ejfLEFuF0ESbqpZbtI2e6D+yvSn5WzYJH8Z4F1PUo
 CuK7TJ+0w6MH5PQsWIbzN2wdVcaHfcArOwvO+XyiXskXCHzGj4xHchwqupEG0pNSdji6
 HTklfGpuPtSmGJPDZo8CeZdFCPHSGgrt1WXDALeZ2OtsFq5a8qk9sbw1X7WFkO1nlf6r
 xx3w==
X-Gm-Message-State: AO0yUKXrB8qsIC9Ns4hsNPGXd+Z1jxyfZBB3I/Z0KHlhwALto24wG28F
 OZkfREC+fkVDhBn/NLM3yWaCjdsKseV9R+PWT3ycmO4lCT3aj2ci0bkQwy80imgTyQAdC1TlGnC
 Z9NZSkG+rN7ZR8QNrbBS8C75WJNRZxDqLfHQ=
X-Received: by 2002:ac8:5b4d:0:b0:3b5:87db:f99e with SMTP id
 n13-20020ac85b4d000000b003b587dbf99emr40382922qtw.39.1676254278745; 
 Sun, 12 Feb 2023 18:11:18 -0800 (PST)
X-Google-Smtp-Source: AK7set/GvXqXDgsvghC1Jcct4vA6b5YvOYS8X0DUmvfxxFiJBuMRNhN8asVF+pnkJYFH5P4n2oQBIw==
X-Received: by 2002:ac8:5b4d:0:b0:3b5:87db:f99e with SMTP id
 n13-20020ac85b4d000000b003b587dbf99emr40382907qtw.39.1676254278401; 
 Sun, 12 Feb 2023 18:11:18 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 d206-20020a3768d7000000b00725d8d6983asm8810504qkc.61.2023.02.12.18.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:11:17 -0800 (PST)
Date: Sun, 12 Feb 2023 21:11:14 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/10] Retire Fork-Based Fuzzing
Message-ID: <20230213021114.4dppxgu2mbpx4ept@mozz.bu.edu>
References: <20230205042951.3570008-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230205042951.3570008-1-alxndr@bu.edu>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.80; envelope-from=alxndr@bu.edu;
 helo=esa7.hc2706-39.iphmx.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.632, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URI_DOTEDU=1.999 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

ping

On 230204 2329, Alexander Bulekov wrote:
> Hello,
> This series removes fork-based fuzzing.
> How does fork-based fuzzing work?
>  * A single parent process initializes QEMU
>  * We identify the devices we wish to fuzz (fuzzer-dependent)
>  * Use QTest to PCI enumerate the devices
>  * After that we start a fork-server which forks the process and executes
>    fuzzer inputs inside the disposable children.
> 
> In a normal fuzzing process, everything happens in a single process.
> 
> Pros of fork-based fuzzing:
>  * We only need to do common configuration once (e.g. PCI enumeration).
>  * Fork provides a strong guarantee that fuzzer inputs will not interfere with
>    each-other
>  * The fuzzing process can continue even after a child-process crashes
>  * We can apply our-own timers to child-processes to exit slow inputs, early
> 
> Cons of fork-based fuzzing:
>  * Fork-based fuzzing is not supported by libfuzzer. We had to build our own
>    fork-server and rely on tricks using linker-scripts and shared-memory to
>    support fuzzing. ( https://physics.bu.edu/~alxndr/libfuzzer-forkserver/ )
>  * Fork-based fuzzing is currently the main blocker preventing us from enabling
>    other fuzzers such as AFL++ on OSS-Fuzz
>  * Fork-based fuzzing may be a reason why coverage-builds are failing on
>    OSS-Fuzz. Coverage is an important fuzzing metric which would allow us to
>    find parts of the code that are not well-covered.
>  * Fork-based fuzzing has high overhead. fork() is an expensive system-call,
>    especially for processes running ASAN (with large/complex) VMA layouts.
>  * Fork prevents us from effectively fuzzing devices that rely on
>    threads (e.g. qxl).
> 
> These patches remove fork-based fuzzing and replace it with reboot-based
> fuzzing for most cases. Misc notes about this change:
>  * libfuzzer appears to be no longer in active development. As such, the
>    current implementation of fork-based fuzzing (while having some nice
>    advantages) is likely to hold us back in the future. If these changes
>    are approved and appear to run successfully on OSS-Fuzz, we should be
>    able to easily experiment with other fuzzing engines (AFL++).
>  * Some device do not completely reset their state. This can lead to
>    non-reproducible crashes. However, in my local tests, most crashes
>    were reproducible. OSS-Fuzz shouldn't send us reports unless it can
>    consistently reproduce a crash.
>  * In theory, the corpus-format should not change, so the existing
>    corpus-inputs on OSS-Fuzz will transfer to the new reset()-able
>    fuzzers.
>  * Each fuzzing process will now exit after a single crash is found. To
>    continue the fuzzing process, use libfuzzer flags such as -jobs=-1
>  * We no long control input-timeouts (those are handled by libfuzzer).
>    Since timeouts on oss-fuzz can be many seconds long, I added a limit
>    on the number of DMA bytes written.
>  
> 
> Alexander Bulekov (10):
>   hw/sparse-mem: clear memory on reset
>   fuzz: add fuzz_reboot API
>   fuzz/generic-fuzz: use reboots instead of forks to reset state
>   fuzz/generic-fuzz: add a limit on DMA bytes written
>   fuzz/virtio-scsi: remove fork-based fuzzer
>   fuzz/virtio-net: remove fork-based fuzzer
>   fuzz/virtio-blk: remove fork-based fuzzer
>   fuzz/i440fx: remove fork-based fuzzer
>   fuzz: remove fork-fuzzing scaffolding
>   docs/fuzz: remove mentions of fork-based fuzzing
> 
>  docs/devel/fuzzing.rst              |  22 +-----
>  hw/mem/sparse-mem.c                 |  13 +++-
>  meson.build                         |   4 -
>  tests/qtest/fuzz/fork_fuzz.c        |  41 ----------
>  tests/qtest/fuzz/fork_fuzz.h        |  23 ------
>  tests/qtest/fuzz/fork_fuzz.ld       |  56 --------------
>  tests/qtest/fuzz/fuzz.c             |   6 ++
>  tests/qtest/fuzz/fuzz.h             |   2 +-
>  tests/qtest/fuzz/generic_fuzz.c     | 111 +++++++---------------------
>  tests/qtest/fuzz/i440fx_fuzz.c      |  27 +------
>  tests/qtest/fuzz/meson.build        |   6 +-
>  tests/qtest/fuzz/virtio_blk_fuzz.c  |  51 ++-----------
>  tests/qtest/fuzz/virtio_net_fuzz.c  |  54 ++------------
>  tests/qtest/fuzz/virtio_scsi_fuzz.c |  51 ++-----------
>  14 files changed, 72 insertions(+), 395 deletions(-)
>  delete mode 100644 tests/qtest/fuzz/fork_fuzz.c
>  delete mode 100644 tests/qtest/fuzz/fork_fuzz.h
>  delete mode 100644 tests/qtest/fuzz/fork_fuzz.ld
> 
> -- 
> 2.39.0
> 

