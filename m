Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BB0696DA6
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 20:16:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS0lZ-0001cd-Vq; Tue, 14 Feb 2023 14:15:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pS0lY-0001bx-Dt
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:15:00 -0500
Received: from esa12.hc2706-39.iphmx.com ([216.71.137.82])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pS0lW-00059b-Bs
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:15:00 -0500
X-IronPort-RemoteIP: 209.85.219.69
X-IronPort-MID: 258811651
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:TPKc7aoYS1Obdbq3BQG5QqdRMqheBmKlZxIvgKrLsJaIsI4StFCzt
 garIBnUOP2CYjSgc49/Ooi+o0tXvcTUyNRmTQVpqX1mEnsQ9ZacVYWSI3mrAy7DdceroGCLT
 ik9hnssCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRkPKwT5jcyqlFOZH4hDfDpR5fHatQMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+AsBOsDAbzsAB+v9T2M4nVKtio27hc+ada
 Tl6ncfYpQ8BZsUgkQmGOvVSO3gW0aZuodcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw+8BcXT1N3
 qAjFmovUkiE2e2I3L6SVbw57igjBJGD0II3v3hhyXTAE69jT86SBarN4tBc0XE7gcUm8fT2P
 ZJIL2oyKk6ZMlsRaz/7C7pn9AusrnD7YztUsnqfuOw673W7IAlZiuW9YIOMJIHTLSlTtk+Yt
 EflpHndPj8Xd+yVlDWu3kqVtMaayEsXX6pXTtVU7MVCmVCW2ykfBQMbUXO9pv+2jFP4XMhQQ
 3H44QIrpKk2sVW1F5zzAUz+r3mDsRoRHdFXFoXW9T2w90Yd2C7BbkBsc9KLQIdOWBMeLdDy6
 mK0og==
IronPort-HdrOrdr: A9a23:CzswK6Ax8sSwYmLlHemg55DYdb4zR+YMi2TDgXoBLCC9E/bo9P
 xG885x6faZslwssTQb9uxoW5PhfZq/z/JICNIqTNOftWDd0QOVxcNZg7cKqAeAJ8SRzINgPa
 kJSdkdNOHN
Received: from mail-qv1-f69.google.com ([209.85.219.69])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Feb 2023 14:14:52 -0500
Received: by mail-qv1-f69.google.com with SMTP id
 r10-20020a0562140c8a00b0056ed45f262dso731885qvr.11
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 11:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tji4O7ajWjQq1qUX98mOiJ2SCalGvGlufNKXu0xtLmM=;
 b=T6XumD+SUh46heDErd12jJuT2KqJQzEJVU2fnU93Sn+XiFJfH+aPvR7SRY14jEh2uD
 uinFwtqnDZCHKg9vHJbM3lFli7AR0opKIvAjTjGJp4EkJiQt0gZIPdaNH07mNOwyF33+
 f04mpYi86QAQLFZiyUPmHVfsFwwmmRAWwSOB15q5Wo+TsPK09p+7Vd22q4Kr83GGF6Ct
 zJMzLeL/cAN0OdHUXxtlIIVcwJVNEXF1nk7fFDgz29vPJeDVcuk4zdanhnfSiW+FktHQ
 CHLnkQXOyN2rU1F7QR+ssLvxYKrtjJKKUDu7UJnA44ArJbh0LibvWItfSuGbMBpHTKC9
 /BGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tji4O7ajWjQq1qUX98mOiJ2SCalGvGlufNKXu0xtLmM=;
 b=PzutsfEkYOr6VfyC2Q2e7uLhWKfFvc3ka4ZXojPx7KF+QRl32HMyPo3q3wFKv7hCr0
 zIs6jrX/N1VTgJONdjnAS/vf9Q9UyTeBlkFbwsMNY9DABxwuruBoYWCuJWD3Cb3rhWLI
 hzWp2Z1OZUzB4eBNH+KHA2m7T/I1oCtWj0ak5trw/yRBiHYYLHPZlU6AVrMfKqpsEPzl
 TVPOAjA/rG7WU0IKCvXTVXWqvueeYUqaCflOG5w2VCliL8YFL2cLx6BgFUkdioRRoWJC
 b8kpvGG8WNaLgzzx73NRelSfL8YWM1vK7PcveA4PrDl1X6BRaw4PKC0cY2QhLQ3sWZzM
 MIig==
X-Gm-Message-State: AO0yUKWnU5/bx9QS28+3uce7FyiWLGVo3SCv4wic/9pRe668enKSIROh
 c3dJjefUvCOo+fNHfcfQfS8uPuYzfCnQHbF4k6OQuoCMqAHnkCAs13tEg/Z9bcfYPErXBPLmvb7
 HlUI7n1hxo0Y+HQw/4umjoIXp2YUUxA==
X-Received: by 2002:a05:622a:44d:b0:3b9:d1c1:6da6 with SMTP id
 o13-20020a05622a044d00b003b9d1c16da6mr6261560qtx.7.1676402092296; 
 Tue, 14 Feb 2023 11:14:52 -0800 (PST)
X-Google-Smtp-Source: AK7set/MVA63AeO7JxWNMSYB+9F6Bq2flrWVRXuAmYNUD5KazURr74slPX3kKNEBJ9/kh610BB+ryQ==
X-Received: by 2002:a05:622a:44d:b0:3b9:d1c1:6da6 with SMTP id
 o13-20020a05622a044d00b003b9d1c16da6mr6261531qtx.7.1676402091992; 
 Tue, 14 Feb 2023 11:14:51 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 p19-20020ac84093000000b003b6325dfc4esm11551512qtl.67.2023.02.14.11.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 11:14:51 -0800 (PST)
Date: Tue, 14 Feb 2023 14:14:47 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 00/10] Retire Fork-Based Fuzzing
Message-ID: <20230214191447.ugtjw33n65fio43u@mozz.bu.edu>
References: <20230205042951.3570008-1-alxndr@bu.edu> <Y+uq234pKMdKpPyT@fedora>
 <f5f42e9a-e0eb-341a-32ff-4d1ebd8830b7@linaro.org>
 <deaaf4c2-2a09-dadf-6de2-aa3351ce8abe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <deaaf4c2-2a09-dadf-6de2-aa3351ce8abe@redhat.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.82; envelope-from=alxndr@bu.edu;
 helo=esa12.hc2706-39.iphmx.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.635, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

On 230214 2009, Thomas Huth wrote:
> On 14/02/2023 17.08, Philippe Mathieu-Daudé wrote:
> > On 14/2/23 16:38, Stefan Hajnoczi wrote:
> > > On Sat, Feb 04, 2023 at 11:29:41PM -0500, Alexander Bulekov wrote:
> > > > Hello,
> > > > This series removes fork-based fuzzing.
> > > > How does fork-based fuzzing work?
> > > >   * A single parent process initializes QEMU
> > > >   * We identify the devices we wish to fuzz (fuzzer-dependent)
> > > >   * Use QTest to PCI enumerate the devices
> > > >   * After that we start a fork-server which forks the process and executes
> > > >     fuzzer inputs inside the disposable children.
> > > > 
> > > > In a normal fuzzing process, everything happens in a single process.
> > > > 
> > > > Pros of fork-based fuzzing:
> > > >   * We only need to do common configuration once (e.g. PCI enumeration).
> > > >   * Fork provides a strong guarantee that fuzzer inputs will not
> > > > interfere with
> > > >     each-other
> > > >   * The fuzzing process can continue even after a child-process crashes
> > > >   * We can apply our-own timers to child-processes to exit slow
> > > > inputs, early
> > > > 
> > > > Cons of fork-based fuzzing:
> > > >   * Fork-based fuzzing is not supported by libfuzzer. We had to
> > > > build our own
> > > >     fork-server and rely on tricks using linker-scripts and shared-memory to
> > > >     support fuzzing. (
> > > > https://physics.bu.edu/~alxndr/libfuzzer-forkserver/ )
> > > >   * Fork-based fuzzing is currently the main blocker preventing
> > > > us from enabling
> > > >     other fuzzers such as AFL++ on OSS-Fuzz
> > > >   * Fork-based fuzzing may be a reason why coverage-builds are failing on
> > > >     OSS-Fuzz. Coverage is an important fuzzing metric which
> > > > would allow us to
> > > >     find parts of the code that are not well-covered.
> > > >   * Fork-based fuzzing has high overhead. fork() is an expensive
> > > > system-call,
> > > >     especially for processes running ASAN (with large/complex) VMA layouts.
> > > >   * Fork prevents us from effectively fuzzing devices that rely on
> > > >     threads (e.g. qxl).
> > > > 
> > > > These patches remove fork-based fuzzing and replace it with reboot-based
> > > > fuzzing for most cases. Misc notes about this change:
> > > >   * libfuzzer appears to be no longer in active development. As such, the
> > > >     current implementation of fork-based fuzzing (while having some nice
> > > >     advantages) is likely to hold us back in the future. If these changes
> > > >     are approved and appear to run successfully on OSS-Fuzz, we should be
> > > >     able to easily experiment with other fuzzing engines (AFL++).
> > > >   * Some device do not completely reset their state. This can lead to
> > > >     non-reproducible crashes. However, in my local tests, most crashes
> > > >     were reproducible. OSS-Fuzz shouldn't send us reports unless it can
> > > >     consistently reproduce a crash.
> > > >   * In theory, the corpus-format should not change, so the existing
> > > >     corpus-inputs on OSS-Fuzz will transfer to the new reset()-able
> > > >     fuzzers.
> > > >   * Each fuzzing process will now exit after a single crash is found. To
> > > >     continue the fuzzing process, use libfuzzer flags such as -jobs=-1
> > > >   * We no long control input-timeouts (those are handled by libfuzzer).
> > > >     Since timeouts on oss-fuzz can be many seconds long, I added a limit
> > > >     on the number of DMA bytes written.
> > > > 
> > > > Alexander Bulekov (10):
> > > >    hw/sparse-mem: clear memory on reset
> > > >    fuzz: add fuzz_reboot API
> > > >    fuzz/generic-fuzz: use reboots instead of forks to reset state
> > > >    fuzz/generic-fuzz: add a limit on DMA bytes written
> > > >    fuzz/virtio-scsi: remove fork-based fuzzer
> > > >    fuzz/virtio-net: remove fork-based fuzzer
> > > >    fuzz/virtio-blk: remove fork-based fuzzer
> > > >    fuzz/i440fx: remove fork-based fuzzer
> > > >    fuzz: remove fork-fuzzing scaffolding
> > > >    docs/fuzz: remove mentions of fork-based fuzzing
> > > > 
> > > >   docs/devel/fuzzing.rst              |  22 +-----
> > > >   hw/mem/sparse-mem.c                 |  13 +++-
> > > >   meson.build                         |   4 -
> > > >   tests/qtest/fuzz/fork_fuzz.c        |  41 ----------
> > > >   tests/qtest/fuzz/fork_fuzz.h        |  23 ------
> > > >   tests/qtest/fuzz/fork_fuzz.ld       |  56 --------------
> > > >   tests/qtest/fuzz/fuzz.c             |   6 ++
> > > >   tests/qtest/fuzz/fuzz.h             |   2 +-
> > > >   tests/qtest/fuzz/generic_fuzz.c     | 111 +++++++---------------------
> > > >   tests/qtest/fuzz/i440fx_fuzz.c      |  27 +------
> > > >   tests/qtest/fuzz/meson.build        |   6 +-
> > > >   tests/qtest/fuzz/virtio_blk_fuzz.c  |  51 ++-----------
> > > >   tests/qtest/fuzz/virtio_net_fuzz.c  |  54 ++------------
> > > >   tests/qtest/fuzz/virtio_scsi_fuzz.c |  51 ++-----------
> > > >   14 files changed, 72 insertions(+), 395 deletions(-)
> > > >   delete mode 100644 tests/qtest/fuzz/fork_fuzz.c
> > > >   delete mode 100644 tests/qtest/fuzz/fork_fuzz.h
> > > >   delete mode 100644 tests/qtest/fuzz/fork_fuzz.ld
> > > > 
> > > > -- 
> > > > 2.39.0
> > > > 
> > > 
> > > Whose tree should this go through? Laurent's qtest tree?
> > 
> > Do you mean Thomas?
> 
> I thought Alexander would be doing pull requests for fuzzing-related patches
> nowadays (since he's the listed maintainer for these files)? Or did I get
> that wrong?

I have, though in the past I've been asked to send the PR to different
people. Who should I send this PR to?
-Alex

