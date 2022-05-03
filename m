Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6849518D52
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 21:42:26 +0200 (CEST)
Received: from localhost ([::1]:38276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlyPg-0005EF-Ue
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 15:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyMA-00048p-5n
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:38:46 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyM7-0007QM-PZ
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:38:45 -0400
Received: by mail-pl1-x633.google.com with SMTP id i1so9716916plg.7
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1wLgFQvMfozryiUJzF4lct9+gFEt/H+qwK7DYS9HYaU=;
 b=B54FH0dPn9BCgIG6/WBEEmdumIU9kOeF8VJKOuPE7EuqEA8w/GnOQ7XkD1rfwTH5Tz
 jwDJC1wnz+hi+5N1auk8o5M8Thr0/hmXf6nFsxhunfV8rU0lcUlplvMGB/2RC3d99AYB
 lAPxiJg4auNOdvXSvryZf6m+0q4NZX3Mac0aOLnENFD5I3QWlyYb9JhaHseELw0RVxIV
 dl01/dobnGVoZ5yOGrIgbrg8jfbEldrFBo5sXYTDMCzCd7eRTlAaD3sGP4urbfcrsIYD
 yhompe4UWAHKARJWWjFuCgeVl+nMtHfA8/RFMLQDZva8j6ytS0GTC4g7etMiGOZtT5i+
 mvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1wLgFQvMfozryiUJzF4lct9+gFEt/H+qwK7DYS9HYaU=;
 b=TOwRMiydnAJTrYAcUvWk30WRKb02FRyEoxZDG3Y+XzvT6X7gdxfuEwL/4DpNVqkNUt
 qygTxzz8OlhKqa/tEmem68VZjWvP51tf7r8Cz30zdzm9NDn2vE8ntDmbvJm2Rcw/QJRU
 7WDT9DpEkt1enaSWFHoRUNq6mCG4uCjJ5xGvSKrZLiEnOIPCzqpxwgzfkcgpfi+yjez2
 ie8LVnUTRF6JFbGVIDAQlzYX3T81T6Qdh4v1Qm4F4SkfzECIbhJIwzszlqhUCaONY7cp
 2yRcDHWHM4s75tNQLWtiGfxFPrHP6U5HeJwcs+shL5iGbyNodo+uG7DekbG85iGnH7gy
 3fTg==
X-Gm-Message-State: AOAM533uj0QnZHW5H5CAmJerUJMPv7sLLQd8tx7kR1Q0H3dXbwIWAQIG
 PAAsoIkM5zBn0k4Utz7Eb8FWSQ==
X-Google-Smtp-Source: ABdhPJxmbbwTTYCkbrQhLUog1gYriKTEBLMQgeuvr6NHmJ1Z/xqq8cKiX3+1X12mUniuwYZVSKgqZQ==
X-Received: by 2002:a17:902:eb8d:b0:15e:bf22:2791 with SMTP id
 q13-20020a170902eb8d00b0015ebf222791mr2161885plg.88.1651606722103; 
 Tue, 03 May 2022 12:38:42 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a17090aad8d00b001cb978f906esm1725676pjq.0.2022.05.03.12.38.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 12:38:41 -0700 (PDT)
Message-ID: <158d064f-d8a7-ee9d-5309-bc4fa1f02d5f@linaro.org>
Date: Tue, 3 May 2022 12:38:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 00/23] Misc patches
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20220503131256.187238-1-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220503131256.187238-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/22 06:12, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The following changes since commit f5643914a9e8f79c606a76e6a9d7ea82a3fc3e65:
> 
>    Merge tag 'pull-9p-20220501' of https://github.com/cschoenebeck/qemu into staging (2022-05-01 07:48:11 -0700)
> 
> are available in the Git repository at:
> 
>    git@gitlab.com:marcandre.lureau/qemu.git tags/misc-pull-request
> 
> for you to fetch changes up to ff5927baa7ffb9c97873a071f6a8d85a3584182b:
> 
>    util: rename qemu_*block() socket functions (2022-05-03 15:53:20 +0400)
> 
> ----------------------------------------------------------------
> Misc cleanups

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~



> 
> ----------------------------------------------------------------
> 
> Marc-André Lureau (23):
>    Use QEMU_SANITIZE_THREAD
>    Use QEMU_SANITIZE_ADDRESS
>    tests: move libqtest.h back under qtest/
>    libqtest: split QMP part in libqmp
>    Use g_unix_set_fd_nonblocking()
>    block: move fcntl_setfl()
>    Replace qemu_pipe() with g_unix_open_pipe()
>    util: replace pipe()+cloexec with g_unix_open_pipe()
>    qga: replace pipe() with g_unix_open_pipe(CLOEXEC)
>    tests: replace pipe() with g_unix_open_pipe(CLOEXEC)
>    os-posix: replace pipe()+cloexec with g_unix_open_pipe(CLOEXEC)
>    virtiofsd: replace pipe() with g_unix_open_pipe(CLOEXEC)
>    io: replace pipe() with g_unix_open_pipe(CLOEXEC)
>    Replace fcntl(O_NONBLOCK) with g_unix_set_fd_nonblocking()
>    io: make qio_channel_command_new_pid() static
>    chardev: replace qemu_set_nonblock()
>    io: replace qemu_set{_non}block()
>    qga: replace qemu_set_nonblock()
>    hw: replace qemu_set_nonblock()
>    ui: replace qemu_set_nonblock()
>    net: replace qemu_set_nonblock()
>    tests: replace qemu_set_nonblock()
>    util: rename qemu_*block() socket functions
> 
>   docs/devel/qtest.rst                          |   2 +-
>   include/io/channel-command.h                  |  25 --
>   include/qemu/atomic.h                         |   8 +-
>   include/qemu/osdep.h                          |   4 -
>   include/qemu/sockets.h                        |   6 +-
>   include/sysemu/os-posix.h                     |   2 -
>   subprojects/libvhost-user/include/compiler.h  |   1 +
>   tests/qtest/acpi-utils.h                      |   2 +-
>   tests/qtest/boot-sector.h                     |   2 +-
>   tests/qtest/fuzz/fuzz.h                       |   2 +-
>   tests/qtest/libqmp.h                          |  50 ++++
>   tests/qtest/libqos/fw_cfg.h                   |   2 +-
>   tests/qtest/libqos/i2c.h                      |   2 +-
>   tests/qtest/libqos/libqos.h                   |   2 +-
>   tests/qtest/libqos/malloc.h                   |   2 +-
>   tests/qtest/libqos/pci.h                      |   2 +-
>   tests/qtest/libqos/sdhci-cmd.h                |   2 +-
>   tests/qtest/libqtest-single.h                 |   2 +-
>   tests/qtest/{libqos => }/libqtest.h           |  29 +--
>   tests/qtest/migration-helpers.h               |   2 +-
>   tests/qtest/tpm-emu.h                         |   2 +-
>   block/file-posix.c                            |  15 ++
>   chardev/char-fd.c                             |   4 +-
>   chardev/char-pty.c                            |   5 +-
>   chardev/char-serial.c                         |   5 +-
>   chardev/char-socket.c                         |   2 +-
>   chardev/char-stdio.c                          |   5 +-
>   contrib/ivshmem-server/ivshmem-server.c       |   2 +-
>   hw/hyperv/syndbg.c                            |   2 +-
>   hw/input/virtio-input-host.c                  |   5 +-
>   hw/misc/ivshmem.c                             |   2 +-
>   hw/virtio/vhost-user.c                        |   2 +-
>   hw/virtio/vhost-vsock.c                       |  11 +-
>   io/channel-command.c                          |  46 +++-
>   io/channel-file.c                             |  13 +-
>   io/channel-socket.c                           |   6 +-
>   net/l2tpv3.c                                  |   2 +-
>   net/socket.c                                  |  10 +-
>   net/tap-bsd.c                                 |   4 +-
>   net/tap-linux.c                               |   2 +-
>   net/tap-solaris.c                             |   2 +-
>   net/tap.c                                     |  33 +--
>   os-posix.c                                    |   3 +-
>   qemu-nbd.c                                    |   5 +-
>   qga/channel-posix.c                           |   2 +-
>   qga/commands-posix.c                          |   8 +-
>   tests/qtest/ac97-test.c                       |   2 +-
>   tests/qtest/ahci-test.c                       |   2 +-
>   tests/qtest/am53c974-test.c                   |   2 +-
>   tests/qtest/arm-cpu-features.c                |   2 +-
>   tests/qtest/aspeed_hace-test.c                |   2 +-
>   tests/qtest/boot-order-test.c                 |   2 +-
>   tests/qtest/boot-sector.c                     |   2 +-
>   tests/qtest/boot-serial-test.c                |   2 +-
>   tests/qtest/cdrom-test.c                      |   2 +-
>   tests/qtest/dbus-display-test.c               |   2 +-
>   tests/qtest/dbus-vmstate-test.c               |   2 +-
>   tests/qtest/device-introspect-test.c          |   2 +-
>   tests/qtest/device-plug-test.c                |   2 +-
>   tests/qtest/drive_del-test.c                  |   2 +-
>   tests/qtest/ds1338-test.c                     |   2 +-
>   tests/qtest/e1000-test.c                      |   2 +-
>   tests/qtest/eepro100-test.c                   |   2 +-
>   tests/qtest/endianness-test.c                 |   2 +-
>   tests/qtest/erst-test.c                       |   2 +-
>   tests/qtest/es1370-test.c                     |   2 +-
>   tests/qtest/fdc-test.c                        |   2 +-
>   tests/qtest/fuzz-e1000e-test.c                |   2 +-
>   tests/qtest/fuzz-lsi53c895a-test.c            |   2 +-
>   tests/qtest/fuzz-megasas-test.c               |   2 +-
>   tests/qtest/fuzz-sb16-test.c                  |   2 +-
>   tests/qtest/fuzz-sdcard-test.c                |   2 +-
>   tests/qtest/fuzz-virtio-scsi-test.c           |   2 +-
>   tests/qtest/fuzz-xlnx-dp-test.c               |   2 +-
>   tests/qtest/fuzz/fuzz.c                       |   2 +-
>   tests/qtest/fuzz/generic_fuzz.c               |   2 +-
>   tests/qtest/fuzz/i440fx_fuzz.c                |   2 +-
>   tests/qtest/fuzz/qos_fuzz.c                   |   2 +-
>   tests/qtest/fuzz/virtio_blk_fuzz.c            |   2 +-
>   tests/qtest/fuzz/virtio_net_fuzz.c            |   4 +-
>   tests/qtest/fuzz/virtio_scsi_fuzz.c           |   2 +-
>   tests/qtest/fw_cfg-test.c                     |   2 +-
>   tests/qtest/hd-geo-test.c                     |   2 +-
>   tests/qtest/hexloader-test.c                  |   2 +-
>   tests/qtest/ide-test.c                        |   2 +-
>   tests/qtest/ipoctal232-test.c                 |   2 +-
>   tests/qtest/ivshmem-test.c                    |   7 +-
>   tests/qtest/libqmp.c                          | 233 ++++++++++++++++++
>   .../libqos/aarch64-xlnx-zcu102-machine.c      |   2 +-
>   tests/qtest/libqos/ahci.c                     |   2 +-
>   tests/qtest/libqos/arm-imx25-pdk-machine.c    |   2 +-
>   tests/qtest/libqos/arm-n800-machine.c         |   2 +-
>   tests/qtest/libqos/arm-raspi2-machine.c       |   2 +-
>   tests/qtest/libqos/arm-sabrelite-machine.c    |   2 +-
>   tests/qtest/libqos/arm-smdkc210-machine.c     |   2 +-
>   tests/qtest/libqos/arm-virt-machine.c         |   2 +-
>   .../qtest/libqos/arm-xilinx-zynq-a9-machine.c |   2 +-
>   tests/qtest/libqos/e1000e.c                   |   2 +-
>   tests/qtest/libqos/fw_cfg.c                   |   2 +-
>   tests/qtest/libqos/i2c-imx.c                  |   2 +-
>   tests/qtest/libqos/i2c-omap.c                 |   2 +-
>   tests/qtest/libqos/i2c.c                      |   2 +-
>   tests/qtest/libqos/libqos.c                   |   2 +-
>   tests/qtest/libqos/pci-pc.c                   |   2 +-
>   tests/qtest/libqos/pci-spapr.c                |   2 +-
>   tests/qtest/libqos/ppc64_pseries-machine.c    |   2 +-
>   tests/qtest/libqos/qgraph.c                   |   2 +-
>   tests/qtest/libqos/qos_external.c             |   2 +-
>   tests/qtest/libqos/rtas.c                     |   2 +-
>   tests/qtest/libqos/sdhci-cmd.c                |   2 +-
>   tests/qtest/libqos/sdhci.c                    |   2 +-
>   tests/qtest/libqos/tpci200.c                  |   2 +-
>   tests/qtest/libqos/usb.c                      |   2 +-
>   tests/qtest/libqos/vhost-user-blk.c           |   2 +-
>   tests/qtest/libqos/virtio-9p.c                |   2 +-
>   tests/qtest/libqos/virtio-balloon.c           |   2 +-
>   tests/qtest/libqos/virtio-blk.c               |   2 +-
>   tests/qtest/libqos/virtio-iommu.c             |   2 +-
>   tests/qtest/libqos/virtio-mmio.c              |   2 +-
>   tests/qtest/libqos/virtio-net.c               |   2 +-
>   tests/qtest/libqos/virtio-pci.c               |   2 +-
>   tests/qtest/libqos/virtio-rng.c               |   2 +-
>   tests/qtest/libqos/virtio-scsi.c              |   2 +-
>   tests/qtest/libqos/virtio-serial.c            |   2 +-
>   tests/qtest/libqos/virtio.c                   |   2 +-
>   tests/qtest/libqos/x86_64_pc-machine.c        |   2 +-
>   tests/qtest/libqtest.c                        | 207 +---------------
>   tests/qtest/lpc-ich9-test.c                   |   2 +-
>   tests/qtest/m48t59-test.c                     |   2 +-
>   tests/qtest/machine-none-test.c               |   2 +-
>   tests/qtest/megasas-test.c                    |   2 +-
>   tests/qtest/microbit-test.c                   |   2 +-
>   tests/qtest/migration-test.c                  |   2 +-
>   tests/qtest/modules-test.c                    |   2 +-
>   tests/qtest/ne2000-test.c                     |   2 +-
>   tests/qtest/npcm7xx_adc-test.c                |   2 +-
>   tests/qtest/npcm7xx_pwm-test.c                |   2 +-
>   tests/qtest/npcm7xx_sdhci-test.c              |   2 +-
>   tests/qtest/npcm7xx_smbus-test.c              |   2 +-
>   tests/qtest/npcm7xx_watchdog_timer-test.c     |   2 +-
>   tests/qtest/numa-test.c                       |   2 +-
>   tests/qtest/nvme-test.c                       |   2 +-
>   tests/qtest/pca9552-test.c                    |   2 +-
>   tests/qtest/pci-test.c                        |   2 +-
>   tests/qtest/pcnet-test.c                      |   2 +-
>   tests/qtest/pflash-cfi02-test.c               |   2 +-
>   tests/qtest/pnv-xscom-test.c                  |   2 +-
>   tests/qtest/prom-env-test.c                   |   2 +-
>   tests/qtest/pvpanic-pci-test.c                |   2 +-
>   tests/qtest/pvpanic-test.c                    |   2 +-
>   tests/qtest/pxe-test.c                        |   2 +-
>   tests/qtest/q35-test.c                        |   2 +-
>   tests/qtest/qmp-cmd-test.c                    |   2 +-
>   tests/qtest/qmp-test.c                        |   2 +-
>   tests/qtest/qom-test.c                        |   2 +-
>   tests/qtest/rtas-test.c                       |   2 +-
>   tests/qtest/sdhci-test.c                      |   2 +-
>   tests/qtest/spapr-phb-test.c                  |   2 +-
>   tests/qtest/tco-test.c                        |   2 +-
>   tests/qtest/test-filter-mirror.c              |   2 +-
>   tests/qtest/test-filter-redirector.c          |   2 +-
>   tests/qtest/test-hmp.c                        |   2 +-
>   tests/qtest/tpm-crb-swtpm-test.c              |   2 +-
>   tests/qtest/tpm-tis-device-swtpm-test.c       |   2 +-
>   tests/qtest/tpm-tis-swtpm-test.c              |   2 +-
>   tests/qtest/tpm-util.c                        |   2 +-
>   tests/qtest/tulip-test.c                      |   2 +-
>   tests/qtest/vhost-user-test.c                 |   4 +-
>   tests/qtest/virtio-net-failover.c             |   2 +-
>   tests/qtest/virtio-rng-test.c                 |   2 +-
>   tests/qtest/virtio-test.c                     |   2 +-
>   tests/qtest/vmgenid-test.c                    |   2 +-
>   tests/qtest/vmxnet3-test.c                    |   2 +-
>   tests/qtest/wdt_ib700-test.c                  |   2 +-
>   tests/qtest/xlnx-can-test.c                   |   2 +-
>   tests/unit/socket-helpers.c                   |   2 +-
>   tests/unit/test-crypto-tlssession.c           |   8 +-
>   tests/unit/test-io-channel-file.c             |   2 +-
>   tests/unit/test-iov.c                         |   4 +-
>   tests/unit/test-qga.c                         |   2 +-
>   tools/virtiofsd/helper.c                      |   2 +-
>   ui/input-linux.c                              |   5 +-
>   util/compatfd.c                               |   5 +-
>   util/coroutine-ucontext.c                     |   2 +-
>   util/event_notifier-posix.c                   |   8 +-
>   util/main-loop.c                              |   2 +-
>   util/oslib-posix.c                            |  61 +----
>   util/oslib-win32.c                            |   8 +-
>   util/vhost-user-server.c                      |   4 +-
>   scripts/oss-fuzz/output_reproducer.py         |   2 +-
>   tests/qtest/libqos/meson.build                |   5 +-
>   tests/unit/meson.build                        |   2 +-
>   192 files changed, 609 insertions(+), 565 deletions(-)
>   create mode 120000 subprojects/libvhost-user/include/compiler.h
>   create mode 100644 tests/qtest/libqmp.h
>   rename tests/qtest/{libqos => }/libqtest.h (95%)
>   create mode 100644 tests/qtest/libqmp.c
> 


