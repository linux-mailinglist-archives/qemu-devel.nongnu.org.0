Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E36BB61853B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:49:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqdNq-00034g-AL; Thu, 03 Nov 2022 12:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oqdNa-00031A-QT
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:48:01 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oqdNW-0004is-Pz
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:47:46 -0400
Received: by mail-io1-xd30.google.com with SMTP id d123so1823329iof.7
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 09:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WwGA3oHRlDfysv3GU/IbsGTjAbQaIy+AgutJ3LYMs90=;
 b=bYi3qpURVM4NrgBjgFHc37n5lQmiqOwpbH362X86+lX4CooKndoA7K0MUNQIPEfohM
 4AOHFw865qc5fWcPvMa2LvJa0SQDlIOv7kNJsroGINvYhW3TcdRCJ8exixvZWLdI+D5N
 BONNU/rCIPlQGgDUOduBfDk9V3H43JzfA9M0dSxDWIwZTMTKlUR4W/Q+JfCJxPd8XwFn
 SUVPznr8X6U5UwRZEYvjAFoZKncmb41mTosuux8zDvuRXOK60HmpjDUHeOf9rcoumEaX
 oQRuJjSEWrPdxFkQohkzOuzN8VuhO72m+N8el8cQlGQmOg7z+vlfTRvQx2K/KgOqLWvS
 4e0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WwGA3oHRlDfysv3GU/IbsGTjAbQaIy+AgutJ3LYMs90=;
 b=REdvWiaoIoPsfTvVrjG+MliDk8xQdSraWYOGZVMg+MnXBrQYZABwixgBJpAnyWYIFi
 M39yh6UOy5grVrcbfsLJmO704lJxA0U0vCJaoXRHlEIU6RMs6RhwapVhxla3Xrp8YRT+
 tbtR/ztWdmeF6FqTPHKa4jPiirXC3wY2pP9OUXfoxyZKgiQtMCK5aYszk4t97IfMJWu8
 heZC95nILhgZ6Z2FkpLAQlqBJ04qRGelW4wLAddPnyAlMv/aZH1KJaimzko+IEODAI5k
 cSaD0koG3oDwc3CGqGIpZs7JggelNyoIREpMTZUGpTCmvCyE1Kx/yTn/n5XIByIE6Hq5
 6Z3w==
X-Gm-Message-State: ACrzQf08pf0vqFlqnZOrlYcs6RrLyJhmnl5EAqaNJDbGolN5Sb/poQnp
 F4LzhG72jLLbVosxdN/9/Jh05gy296S5asoiNb65hQ==
X-Google-Smtp-Source: AMsMyM5VkB2FMls3eWxYC1uuN2zy1BlPFTv7AkmU0tAAm6HexP5hN0/T2c3LJxvSog2jrh5Ekh2SqCz30YWH7U2wI/A=
X-Received: by 2002:a05:6638:343:b0:375:8a1e:c186 with SMTP id
 x3-20020a056638034300b003758a1ec186mr4588839jap.92.1667494060330; Thu, 03 Nov
 2022 09:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <2821393d-21fe-cb7b-1396-dac6fe4dfa6b@linaro.org>
 <20221103154208.91501-1-ani@anisinha.ca>
In-Reply-To: <20221103154208.91501-1-ani@anisinha.ca>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 3 Nov 2022 22:17:29 +0530
Message-ID: <CAARzgwzc66yTTSiKT6Q4-hGZ2m1jcuy8d9D_NjacVpCMut=3tw@mail.gmail.com>
Subject: Re: [PULL v2 00/82] pci,pc,virtio: features, tests, fixes, cleanups
To: philmd@linaro.org
Cc: mst@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org, 
 stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Nov 3, 2022 at 9:12 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> > To pull this image:
>
> > $ docker pull registry.gitlab.com/qemu-project/qemu/fedora:latest
>
> Actually the URL is:
>
> $ docker pull registry.gitlab.com/qemu-project/qemu/qemu/fedora:latest
>
> > (or to be sure to pull the very same:)
>
> > $ docker pull
> > registry.gitlab.com/qemu-project/qemu/fedora:d6d20c1c6aede3a652eb01b781530cc10392de2764503c84f9bf4eb1d7a89d26
>
> Same here,
>
> registry.gitlab.com/qemu-project/qemu/qemu/fedora:d6d20c1c6aede3a652eb01b781530cc10392de2764503c84f9bf4eb1d7a89d26

I pulled this container, used the configure line Stefan mentioned
earlier in the thread and re-ran make check-qtest and still could not
repro the crash. All tests pass.

/usr/bin/meson test  --no-rebuild -t 0  --num-processes 1
--print-errorlogs  --suite qtest
 1/31 qemu:qtest+qtest-arm / qtest-arm/qom-test
    OK             293.59s   85 subtests passed
 2/31 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_pwm-test
    OK             96.69s   24 subtests passed
 3/31 qemu:qtest+qtest-arm / qtest-arm/test-hmp
    OK             56.11s   86 subtests passed
 4/31 qemu:qtest+qtest-arm / qtest-arm/boot-serial-test
    OK              0.45s   3 subtests passed
 5/31 qemu:qtest+qtest-arm / qtest-arm/qos-test
    OK             20.50s   115 subtests passed
 6/31 qemu:qtest+qtest-arm / qtest-arm/sse-timer-test
    OK              0.29s   3 subtests passed
 7/31 qemu:qtest+qtest-arm / qtest-arm/cmsdk-apb-dualtimer-test
    OK              0.20s   2 subtests passed
 8/31 qemu:qtest+qtest-arm / qtest-arm/cmsdk-apb-timer-test
    OK              0.22s   1 subtests passed
 9/31 qemu:qtest+qtest-arm / qtest-arm/cmsdk-apb-watchdog-test
    OK              0.25s   2 subtests passed
10/31 qemu:qtest+qtest-arm / qtest-arm/pflash-cfi02-test
    OK              4.31s   4 subtests passed
11/31 qemu:qtest+qtest-arm / qtest-arm/aspeed_hace-test
    OK             22.36s   16 subtests passed
12/31 qemu:qtest+qtest-arm / qtest-arm/aspeed_smc-test
    OK             144.47s   10 subtests passed
13/31 qemu:qtest+qtest-arm / qtest-arm/aspeed_gpio-test
    OK              0.21s   2 subtests passed
14/31 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_adc-test
    OK              1.88s   6 subtests passed
15/31 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_gpio-test
    OK              0.24s   18 subtests passed
16/31 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_rng-test
    OK              0.26s   2 subtests passed
17/31 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_sdhci-test
    OK              0.97s   3 subtests passed
18/31 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_smbus-test
    OK             11.23s   40 subtests passed
19/31 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_timer-test
    OK              1.91s   180 subtests passed
20/31 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_watchdog_timer-test
    OK             20.69s   15 subtests passed
21/31 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_emc-test
    OK              0.90s   6 subtests passed
22/31 qemu:qtest+qtest-arm / qtest-arm/arm-cpu-features
    OK              0.15s   1 subtests passed
23/31 qemu:qtest+qtest-arm / qtest-arm/microbit-test
    OK              4.46s   5 subtests passed
24/31 qemu:qtest+qtest-arm / qtest-arm/test-arm-mptimer
    OK              0.20s   61 subtests passed
25/31 qemu:qtest+qtest-arm / qtest-arm/hexloader-test
    OK              0.14s   1 subtests passed
26/31 qemu:qtest+qtest-arm / qtest-arm/cdrom-test
    OK              1.06s   9 subtests passed
27/31 qemu:qtest+qtest-arm / qtest-arm/device-introspect-test
    OK              3.18s   6 subtests passed
28/31 qemu:qtest+qtest-arm / qtest-arm/machine-none-test
    OK              0.09s   1 subtests passed
29/31 qemu:qtest+qtest-arm / qtest-arm/qmp-test
    OK              0.34s   4 subtests passed
30/31 qemu:qtest+qtest-arm / qtest-arm/qmp-cmd-test
    OK              7.80s   62 subtests passed
31/31 qemu:qtest+qtest-arm / qtest-arm/readconfig-test
    OK              0.22s   2 subtests passed


Ok:                 31
Expected Fail:      0
Fail:               0
Unexpected Pass:    0
Skipped:            0
Timeout:            0

Full log written to /qemu/qemu/build/meson-logs/testlog.txt

