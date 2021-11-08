Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 743DF449C7E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 20:39:59 +0100 (CET)
Received: from localhost ([::1]:55640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkAUo-0003YC-Jd
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 14:39:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkASp-00027E-1l
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 14:37:55 -0500
Received: from [2a00:1450:4864:20::436] (port=37613
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkASm-0003BN-Qv
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 14:37:54 -0500
Received: by mail-wr1-x436.google.com with SMTP id b12so28846880wrh.4
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 11:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hq9J6BRvUpcZtWX9XdoHPC9yP8ivT6bX2uTc0lkntG0=;
 b=H942cEDDEcbATOo9gw35MIEl0lrOowMJnTRkqFkOGxnxG1km0Em3X7VDXrn7u8QS+g
 krd/o9rGZI9plbEupi3DvKcf9yzkWybHmPprTCdHtnoq/RKgxxCfIjI3s7EuPdq0BGgl
 DJ8liAMLdI6As/e1wiLfy3wPzQa+AkHCKZssI/5Ii0JBAKXo4aRUHoDaZvE6qOw/PFD6
 GCH0wogARFyJC/VMo+uV3JC5ChQ2nMI+9OHXZBtcDJlSs3vUkIBeS3lbeOFR2Hqv/Clx
 VNZd01c9CjLlTrJKK7MI3kCKaGlSCBwoUurJS9UHF30GG3zE70Ddnl7dFHgzdcswOQUN
 owvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hq9J6BRvUpcZtWX9XdoHPC9yP8ivT6bX2uTc0lkntG0=;
 b=q8cmxhQqaLIo7Shd1N7cn/7lT65VRba6EAcOIgwNvMX43KusvjcWFux5NHJXp8v7LE
 eBqnAw5g9fGkvaYrYeHjl5eVIsyod/yWwFNCI8YkszoiPtwP19d6NI8rH43LT2kxH50p
 80y8tPfhZPSm+Y0gDnY7QS1KjIVaxqS/Q3q2Abnam08lwzZGEvuKadYuWiSiaXsG51xM
 rtX3OyVFj9/cPaKbJgFcUDjNDB6mWD9cXRTkuz+2Dm/S6GIYMrADqNqgJvgu+3mEI89W
 qbk1t/c7Kqf7R+qNCRIixXrLyo2JuWkTe9p7GdOyhwgAhbz7sZFfhZVTysmDTk6pmsNE
 mp1g==
X-Gm-Message-State: AOAM533vNxmO9GCyfZi6XBiMpfBcsFQWnUI8Vszn2B8K56QmrdBqr5u4
 t1lMgjQF85KuEK8WUANY5KGIZw==
X-Google-Smtp-Source: ABdhPJxJrwe6YrVvw1sPtVdJkbu0msoyU9C9R7XJW5LnbvFx7/A+WVcMe0osA40mzpQTvBkndGQcWQ==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr2042752wrz.286.1636400270516; 
 Mon, 08 Nov 2021 11:37:50 -0800 (PST)
Received: from [192.168.8.106] (173.red-95-126-185.staticip.rima-tde.net.
 [95.126.185.173])
 by smtp.gmail.com with ESMTPSA id m17sm10393035wrz.22.2021.11.08.11.37.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 11:37:49 -0800 (PST)
Subject: Re: [PULL 0/9] Integration testing patches for 2021-11-08
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211108161739.1371503-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cdd16315-c5a3-80e1-19c7-7e785d9f2659@linaro.org>
Date: Mon, 8 Nov 2021 20:37:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211108161739.1371503-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.06,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 5:17 PM, Philippe Mathieu-Daudé wrote:
> The following changes since commit 260f9210d2ce892c5e162a45b0e5ec0036bedc79:
> 
>    Merge remote-tracking branch 'remotes/marcandre.lureau/tags/sphinx-pull-request' into staging (2021-11-08 14:56:10 +0100)
> 
> are available in the Git repository at:
> 
>    https://github.com/philmd/qemu.git tags/avocado-20211108
> 
> for you to fetch changes up to b94d00898a9ee708b4d4b79432c2272905a56b06:
> 
>    tests/avocado: Remove p7zip binary availability check (2021-11-08 17:00:22 +0100)
> 
> ----------------------------------------------------------------
> Integration testing patches
> 
> - Rename tests/acceptance/ -> tests/avocado/
> - Rename avocado_qemu.Test -> avocado_qemu.QemuSystemTest
> - Introduce QemuUserTest class
> - Add the first linux-user test, covering the bFLT loader
> 
> ----------------------------------------------------------------
> 
> Philippe Mathieu-Daudé (7):
>    tests/avocado: Extract QemuBaseTest from Test
>    tests/avocado: Make pick_default_qemu_bin() more generic
>    tests/avocado: Introduce QemuUserTest base class
>    tests/avocado: Share useful helpers from virtiofs_submounts test
>    tests/avocado: Add bFLT loader linux-user test
>    tests/avocado: Rename avocado_qemu.Test -> QemuSystemTest
>    tests/avocado: Remove p7zip binary availability check
> 
> Willian Rampazzo (2):
>    tests/acceptance: introduce new check-avocado target
>    tests/acceptance: rename tests acceptance to tests avocado
> 
>   docs/devel/build-system.rst                   |   2 +-
>   docs/devel/ci-definitions.rst.inc             |   2 +-
>   docs/devel/testing.rst                        |  57 +++---
>   docs/system/arm/orangepi.rst                  |   8 +-
>   python/qemu/machine/README.rst                |   2 +-
>   python/qemu/qmp/README.rst                    |   2 +-
>   python/qemu/utils/README.rst                  |   2 +-
>   tests/acceptance/README.rst                   |  10 --
>   tests/avocado/README.rst                      |  10 ++
>   configure                                     |   2 +-
>   .gitlab-ci.d/buildtest-template.yml           |   2 +-
>   .gitlab-ci.d/buildtest.yml                    |  56 +++---
>   MAINTAINERS                                   |  52 +++---
>   tests/Makefile.include                        |  21 ++-
>   .../avocado_qemu/__init__.py                  | 163 +++++++++++++-----
>   tests/{acceptance => avocado}/boot_linux.py   |   0
>   .../boot_linux_console.py                     |  11 +-
>   tests/{acceptance => avocado}/boot_xen.py     |   0
>   tests/{acceptance => avocado}/cpu_queries.py  |   4 +-
>   .../empty_cpu_model.py                        |   4 +-
>   tests/{acceptance => avocado}/hotplug_cpu.py  |   0
>   tests/{acceptance => avocado}/info_usernet.py |   4 +-
>   tests/{acceptance => avocado}/intel_iommu.py  |   0
>   tests/{acceptance => avocado}/linux_initrd.py |   6 +-
>   .../linux_ssh_mips_malta.py                   |   5 +-
>   tests/avocado/load_bflt.py                    |  54 ++++++
>   .../machine_arm_canona1100.py                 |   4 +-
>   .../machine_arm_integratorcp.py               |   4 +-
>   .../machine_arm_n8x0.py                       |   4 +-
>   tests/{acceptance => avocado}/machine_avr6.py |   6 +-
>   .../machine_m68k_nextcube.py                  |   4 +-
>   .../machine_microblaze.py                     |   4 +-
>   .../machine_mips_fuloong2e.py                 |   4 +-
>   .../machine_mips_loongson3v.py                |   4 +-
>   .../machine_mips_malta.py                     |   4 +-
>   .../machine_rx_gdbsim.py                      |   4 +-
>   .../machine_s390_ccw_virtio.py                |   4 +-
>   .../machine_sparc64_sun4u.py                  |   0
>   .../machine_sparc_leon3.py                    |   4 +-
>   tests/{acceptance => avocado}/migration.py    |   4 +-
>   tests/{acceptance => avocado}/multiprocess.py |   4 +-
>   .../pc_cpu_hotplug_props.py                   |   4 +-
>   tests/{acceptance => avocado}/ppc_405.py      |   4 +-
>   tests/{acceptance => avocado}/ppc_bamboo.py   |   4 +-
>   .../{acceptance => avocado}/ppc_mpc8544ds.py  |   4 +-
>   tests/{acceptance => avocado}/ppc_prep_40p.py |   4 +-
>   tests/{acceptance => avocado}/ppc_pseries.py  |   4 +-
>   .../ppc_virtex_ml507.py                       |   4 +-
>   .../{acceptance => avocado}/replay_kernel.py  |   0
>   tests/{acceptance => avocado}/replay_linux.py |   0
>   .../reverse_debugging.py                      |   0
>   tests/{acceptance => avocado}/smmu.py         |   0
>   tests/{acceptance => avocado}/tcg_plugins.py  |   0
>   .../tesseract_utils.py                        |   0
>   tests/{acceptance => avocado}/version.py      |   4 +-
>   tests/{acceptance => avocado}/virtio-gpu.py   |   4 +-
>   .../virtio_check_params.py                    |   4 +-
>   .../{acceptance => avocado}/virtio_version.py |   4 +-
>   .../virtiofs_submounts.py                     |  59 +------
>   .../virtiofs_submounts.py.data/cleanup.sh     |   0
>   .../guest-cleanup.sh                          |   0
>   .../virtiofs_submounts.py.data/guest.sh       |   0
>   .../virtiofs_submounts.py.data/host.sh        |   0
>   tests/{acceptance => avocado}/vnc.py          |   4 +-
>   .../x86_cpu_model_versions.py                 |   4 +-
>   65 files changed, 364 insertions(+), 284 deletions(-)
>   delete mode 100644 tests/acceptance/README.rst
>   create mode 100644 tests/avocado/README.rst
>   rename tests/{acceptance => avocado}/avocado_qemu/__init__.py (87%)
>   rename tests/{acceptance => avocado}/boot_linux.py (100%)
>   rename tests/{acceptance => avocado}/boot_linux_console.py (99%)
>   rename tests/{acceptance => avocado}/boot_xen.py (100%)
>   rename tests/{acceptance => avocado}/cpu_queries.py (91%)
>   rename tests/{acceptance => avocado}/empty_cpu_model.py (88%)
>   rename tests/{acceptance => avocado}/hotplug_cpu.py (100%)
>   rename tests/{acceptance => avocado}/info_usernet.py (92%)
>   rename tests/{acceptance => avocado}/intel_iommu.py (100%)
>   rename tests/{acceptance => avocado}/linux_initrd.py (96%)
>   rename tests/{acceptance => avocado}/linux_ssh_mips_malta.py (98%)
>   create mode 100644 tests/avocado/load_bflt.py
>   rename tests/{acceptance => avocado}/machine_arm_canona1100.py (93%)
>   rename tests/{acceptance => avocado}/machine_arm_integratorcp.py (97%)
>   rename tests/{acceptance => avocado}/machine_arm_n8x0.py (95%)
>   rename tests/{acceptance => avocado}/machine_avr6.py (94%)
>   rename tests/{acceptance => avocado}/machine_m68k_nextcube.py (97%)
>   rename tests/{acceptance => avocado}/machine_microblaze.py (94%)
>   rename tests/{acceptance => avocado}/machine_mips_fuloong2e.py (95%)
>   rename tests/{acceptance => avocado}/machine_mips_loongson3v.py (94%)
>   rename tests/{acceptance => avocado}/machine_mips_malta.py (98%)
>   rename tests/{acceptance => avocado}/machine_rx_gdbsim.py (97%)
>   rename tests/{acceptance => avocado}/machine_s390_ccw_virtio.py (99%)
>   rename tests/{acceptance => avocado}/machine_sparc64_sun4u.py (100%)
>   rename tests/{acceptance => avocado}/machine_sparc_leon3.py (94%)
>   rename tests/{acceptance => avocado}/migration.py (97%)
>   rename tests/{acceptance => avocado}/multiprocess.py (98%)
>   rename tests/{acceptance => avocado}/pc_cpu_hotplug_props.py (93%)
>   rename tests/{acceptance => avocado}/ppc_405.py (94%)
>   rename tests/{acceptance => avocado}/ppc_bamboo.py (95%)
>   rename tests/{acceptance => avocado}/ppc_mpc8544ds.py (93%)
>   rename tests/{acceptance => avocado}/ppc_prep_40p.py (97%)
>   rename tests/{acceptance => avocado}/ppc_pseries.py (94%)
>   rename tests/{acceptance => avocado}/ppc_virtex_ml507.py (93%)
>   rename tests/{acceptance => avocado}/replay_kernel.py (100%)
>   rename tests/{acceptance => avocado}/replay_linux.py (100%)
>   rename tests/{acceptance => avocado}/reverse_debugging.py (100%)
>   rename tests/{acceptance => avocado}/smmu.py (100%)
>   rename tests/{acceptance => avocado}/tcg_plugins.py (100%)
>   rename tests/{acceptance => avocado}/tesseract_utils.py (100%)
>   rename tests/{acceptance => avocado}/version.py (88%)
>   rename tests/{acceptance => avocado}/virtio-gpu.py (98%)
>   rename tests/{acceptance => avocado}/virtio_check_params.py (98%)
>   rename tests/{acceptance => avocado}/virtio_version.py (98%)
>   rename tests/{acceptance => avocado}/virtiofs_submounts.py (82%)
>   rename tests/{acceptance => avocado}/virtiofs_submounts.py.data/cleanup.sh (100%)
>   rename tests/{acceptance => avocado}/virtiofs_submounts.py.data/guest-cleanup.sh (100%)
>   rename tests/{acceptance => avocado}/virtiofs_submounts.py.data/guest.sh (100%)
>   rename tests/{acceptance => avocado}/virtiofs_submounts.py.data/host.sh (100%)
>   rename tests/{acceptance => avocado}/vnc.py (96%)
>   rename tests/{acceptance => avocado}/x86_cpu_model_versions.py (99%)

Applied, thanks.

r~


