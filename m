Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 208FD3DBC75
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 17:42:51 +0200 (CEST)
Received: from localhost ([::1]:43676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Uev-0006kU-NC
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 11:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m9UdQ-0005yf-VN
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 11:41:16 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:37540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m9UdP-00083k-1y
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 11:41:16 -0400
Received: by mail-wr1-x435.google.com with SMTP id d8so11837895wrm.4
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 08:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UVLNUt8YrBBaGocCmd5M2LTtHcvI1AgI32XF1W0ipvY=;
 b=IRVlux8KYPQIkRIsa5qbXGkNtKbMRuBm2ZNEIR+9V0bNah3DntUp27hVplBCjMlyfQ
 UjRstABY9V3eFH6qoWF69vNXhgmc/B58OM1XknmK2P6DkifsJ0LfT62GYh4mPSdhi6Is
 0seGJvgyBlZUxfr3quP/eKCTpihmHasKOIJUgGyd9ZZOq9nGv8H+Li91c27WX8gKjNkT
 6udS1wOmXE1ilXFqM7/uL53fuHLXRiEEVgEcVherpm5glu6TfrBd4n33KOtZkXsjBLKl
 C67lSqHzflfRJ56Ww0oeTqsKxIDcsHa5t20g22XozuoxTyE8hNfmRauUiH/e/dZrFFfm
 2ldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UVLNUt8YrBBaGocCmd5M2LTtHcvI1AgI32XF1W0ipvY=;
 b=BgPJMAxIOVBhqnwjfQ4Ge26iOXXrrf5LVAN0nrzBTGbONT3uG7glDyVj+si9zzZYjb
 xn3oEXufeVeLQdE4gmku6Pb4nPK3DWJAAuaojNmBSIh/P4GoM8QxFm3pWLg7b41WvooS
 wML9z7DoXj8VZ3SZB27Xb5VecmlHTSkq281JCgVMLhwk7KRhPUOzkwEUmIRGn2lUdKYc
 g2jSfl/hNPV5PQmFDHU5Cf2tgBoXRquZeLyy6q+LiQ+xOfytv+XCM/tcxMzfWPsyYg/G
 EvBhpRnlvxkImz/XXYqZ9l5ujLzpkAhfHdMFCz5KL8QR7yy6da5MRdOkJNLnwxN+RlU5
 HGig==
X-Gm-Message-State: AOAM531t+EkrBvWKTqixjSEohrXCe0I1KDICKzRSMahJ3noekLtSJXMi
 8ClyTGwuLSlhhNggVZZnDt0=
X-Google-Smtp-Source: ABdhPJyCIgvzccYRc1ZQikdTQTP11TqzJU3gowyWvSYJ59L7a+pIHplbCPECKoRMJYrriZoLTx5V2Q==
X-Received: by 2002:adf:f44e:: with SMTP id f14mr3731513wrp.101.1627659673580; 
 Fri, 30 Jul 2021 08:41:13 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id y197sm2285920wmc.7.2021.07.30.08.41.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 08:41:13 -0700 (PDT)
Subject: Re: "make check-acceptance" takes way too long
To: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a79d07ea-31a8-2a9d-37ec-317a61091c32@amsat.org>
Date: Fri, 30 Jul 2021 17:41:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.125,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/30/21 5:12 PM, Peter Maydell wrote:
> "make check-acceptance" takes way way too long. I just did a run
> on an arm-and-aarch64-targets-only debug build and it took over
> half an hour, and this despite it skipping or cancelling 26 out
> of 58 tests!
> 
> I think that ~10 minutes runtime is reasonable. 30 is not;
> ideally no individual test would take more than a minute or so.
> 
> Output saying where the time went. The first two tests take
> more than 10 minutes *each*. I think a good start would be to find
> a way of testing what they're testing that is less heavyweight.

IIRC the KVM forum BoF, we suggested a test shouldn't take more than
60sec. But then it was borderline for some tests so we talked about
allowing 90-120sec, and more should be discussed and documented.

However it was never documented / enforced.

This seems to match my memory:

$ git grep 'timeout =' tests/acceptance/
tests/acceptance/avocado_qemu/__init__.py:440:    timeout = 900
tests/acceptance/boot_linux_console.py:99:    timeout = 90
tests/acceptance/boot_xen.py:26:    timeout = 90
tests/acceptance/linux_initrd.py:27:    timeout = 300
tests/acceptance/linux_ssh_mips_malta.py:26:    timeout = 150 # Not for
'configure --enable-debug --enable-debug-tcg'
tests/acceptance/machine_arm_canona1100.py:18:    timeout = 90
tests/acceptance/machine_arm_integratorcp.py:34:    timeout = 90
tests/acceptance/machine_arm_n8x0.py:20:    timeout = 90
tests/acceptance/machine_avr6.py:25:    timeout = 5
tests/acceptance/machine_m68k_nextcube.py:30:    timeout = 15
tests/acceptance/machine_microblaze.py:14:    timeout = 90
tests/acceptance/machine_mips_fuloong2e.py:18:    timeout = 60
tests/acceptance/machine_mips_loongson3v.py:18:    timeout = 60
tests/acceptance/machine_mips_malta.py:38:    timeout = 30
tests/acceptance/machine_ppc.py:14:    timeout = 90
tests/acceptance/machine_rx_gdbsim.py:22:    timeout = 30
tests/acceptance/machine_s390_ccw_virtio.py:24:    timeout = 120
tests/acceptance/machine_sparc64_sun4u.py:20:    timeout = 90
tests/acceptance/machine_sparc_leon3.py:15:    timeout = 60
tests/acceptance/migration.py:27:    timeout = 10
tests/acceptance/ppc_prep_40p.py:18:    timeout = 60
tests/acceptance/replay_kernel.py:34:    timeout = 120
tests/acceptance/replay_kernel.py:357:    timeout = 180
tests/acceptance/reverse_debugging.py:33:    timeout = 10
tests/acceptance/tcg_plugins.py:24:    timeout = 120

> 
>  (01/58) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2:
> PASS (629.74 s)
>  (02/58) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3:
> PASS (628.75 s)
>  (03/58) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm:
> CANCEL: kvm accelerator does not seem to be available (1.18 s)

We could restrict these to one of the projects runners (x86 probably)
with something like:

  @skipUnless(os.getenv('X86_64_RUNNER_AVAILABLE'), '...')

>  (15/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi:
> PASS (4.86 s)
>  (16/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_initrd:
> PASS (39.85 s)
>  (17/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_sd:
> PASS (53.57 s)
>  (18/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bionic_20_08:
> SKIP: storage limited
>  (19/58) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_uboot_netbsd9:
> SKIP: storage limited

I've been thinking about restricting them to my sdmmc-tree, but if
I don't send pull-req I won't test or catch other introducing
regressions. They respect the 60sec limit.

We could restrict some jobs to maintainers fork namespace, track
mainstream master branch and either run the pipelines when /master
is updated or regularly
(https://docs.gitlab.com/ee/ci/pipelines/schedules.html)
but them if the maintainer becomes busy / idle / inactive we
similarly won't catch regressions in mainstream.

Anyway Daniel already studied the problem and send a RFC but we
ignored it:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg761087.html

Maybe worth continuing the discussion there?

