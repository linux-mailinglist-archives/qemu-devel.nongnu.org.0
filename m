Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEB7610CF7
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 11:21:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooLY8-0003Sr-3B; Fri, 28 Oct 2022 05:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ooLY4-0003SP-5u
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:21:09 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ooLY2-0007Ju-79
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 05:21:07 -0400
Received: by mail-qv1-xf30.google.com with SMTP id w10so3686992qvr.3
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 02:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nTAjm6P6b/0Jtc4rTUm+DdCKdINKvTvuUU8JBMm1wno=;
 b=MSAwlIKmydKH81JuMQSB2x8rPgDAPrtzKXWc/y6HC81CWZvWdijzrckw8yxk+G8TKk
 UEEO4fVg64nD2N34ZRlyttgA/pvaxDfk7W6pGYwT6y/5eoOVuxLBAzBIYoKRRXMDRcnT
 DYp5grvFwvV9sHOITFJAD306TKlS095vMCc4a5xpou22224K97Etw6mfOTMIPwrYCgrE
 yWVuWkRPK/2LH8emNJ8AYuqxUiGdgDqmmHfzA11d4HRv5RF8LMTokPLB81hP5D6RLgvm
 0/V7cYlYRrighIvlTZaaF9Wg96EH5nxM8kpOA/shIwcBrhu0NgxG5q5xLbNaUCJxuu3x
 hgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nTAjm6P6b/0Jtc4rTUm+DdCKdINKvTvuUU8JBMm1wno=;
 b=z7amO3sCW3AYpfDhBf2K9YDdt58O+VkU3DXeDqmfgy2lf7gES6dX7oN47q6FkBp5J9
 EgEVL0h2NrYKwHXG5cPFihlXdX9p+mhYSxNTICCYWQuqQ3Odg7AsLtj0kX4QgyU/jaYg
 IQsEyOF+Pn1qNyDo5r4tgTZPhQHmg6fmCPusD/DBZggKARARS+nbfAFKay364Xx4mBjn
 nX874sFKuPsGNQjLVaBDnqR89ni4wBPXFbuAiOq+bIMbUv7hVaEgzIzJyS46hIeEs8TI
 P+eWrNH/4+vgBXS22qaKH0XoONr4/znbssjaddZpkElQ8+21HA0JDAI7jezFxnNwhfq8
 XQeg==
X-Gm-Message-State: ACrzQf1f70UDObEYcOhAcp4OamriY26fKmZnMDZeh8Sk+IjGlyc+9H7m
 m5K2GfEsrRfxUiO2MUZcjpahamMP7myuQmQy/6Q=
X-Google-Smtp-Source: AMsMyM5r7ExFaGUU8KL7Uu7a9X09Xb82JmtgBeAGWE85lwFLqkOKwAVyOAtAs3AgoMC1iscASjg7/m6bZmiz2TDUDlU=
X-Received: by 2002:a05:6214:2b06:b0:4bb:5716:d1c3 with SMTP id
 jx6-20020a0562142b0600b004bb5716d1c3mr30095831qvb.85.1666948861787; Fri, 28
 Oct 2022 02:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <20221028045736.679903-1-bin.meng@windriver.com>
 <CAMxuvawoU3P_eHknzzEaPnr6evzCOUij-pMnHJvpdvP4HZpc3g@mail.gmail.com>
In-Reply-To: <CAMxuvawoU3P_eHknzzEaPnr6evzCOUij-pMnHJvpdvP4HZpc3g@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 28 Oct 2022 17:20:50 +0800
Message-ID: <CAEUhbmWPAa+KX=pu4d5WmnxkSpHTcLKYgaK_JE8g_5X3SK_NvA@mail.gmail.com>
Subject: Re: [PATCH v6 00/11] tests/qtest: Enable running qtest on Windows
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Oct 28, 2022 at 4:09 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Hi
>
> On Fri, Oct 28, 2022 at 8:58 AM Bin Meng <bin.meng@windriver.com> wrote:
>>
>> In preparation to adding virtio-9p support on Windows, this series
>> enables running qtest on Windows, so that we can run the virtio-9p
>> tests on Windows to make sure it does not break accidently.
>>
>> Changes in v6:
>> - drop patches that are already in Alex and Daniel's tree
>> - remove CONFIG_POSIX from meson.build
>> - include <qemu/sockets.h> in libqtest.c
>> - move documentation comments of qemu_send_full() from util/osdep.c
>>   to qemu/sockets.h
>> - save the "exit_code" in struct QTestState
>> - new patch: "tests/qtest: device-plug-test: Reverse the usage of double=
/single quotes"
>> - new patch: "tests/qtest: Use EXIT_FAILURE instead of magic number"
>> - new patch: "tests/qtest: libqtest: Introduce qtest_wait_qemu()"
>> - change to use qtest_wait_qemu() API
>> - new patch: "test/qtest/libqos: meson.build: Do not build virtio-9p unc=
onditionally"
>>
>> Changes in v5:
>> - restore to v1 version which does not touch the posix implementation
>> - Drop patches that are already merged
>>
>> Changes in v3:
>> - Add a usleep(1) in the busy wait loop
>> - Drop the host test
>>
>> Changes in v2:
>> - Introduce qemu_send_full() and use it
>> - Move the enabling of building qtests on Windows to a separate
>>   patch to keep bisectablity
>> - Call socket_init() unconditionally
>> - Add a missing CloseHandle() call
>> - Change to a busy wait after migration is canceled
>> - Change the timeout limit to 90 minutes
>> - new patch: "tests/qtest: Enable qtest build on Windows"
>>
>> Bin Meng (8):
>>   tests/qtest: Support libqtest to build and run on Windows
>>   tests/qtest: device-plug-test: Reverse the usage of double/single
>>     quotes
>>   tests/qtest: Use EXIT_FAILURE instead of magic number
>>   tests/qtest: libqtest: Introduce qtest_wait_qemu()
>>   tests/qtest: libqos: Do not build virtio-9p unconditionally
>>   tests/qtest: libqtest: Correct the timeout unit of blocking receive
>>     calls for win32
>>   .gitlab-ci.d/windows.yml: Increase the timeout to 90 minutes
>>   tests/qtest: Enable qtest build on Windows
>>
>> Xuzhou Cheng (3):
>>   accel/qtest: Support qtest accelerator for Windows
>>   tests/qtest: Use send/recv for socket communication
>>   tests/qtest: migration-test: Make sure QEMU process "to" exited after
>>     migration is canceled
>>
>>  include/hw/core/cpu.h           |   1 +
>>  include/qemu/sockets.h          |  13 +++
>>  tests/qtest/libqtest.h          |   9 ++
>>  accel/dummy-cpus.c              |  14 ++-
>>  softmmu/cpus.c                  |   9 +-
>>  tests/qtest/dbus-vmstate-test.c |   2 +-
>>  tests/qtest/device-plug-test.c  |  16 ++--
>>  tests/qtest/libqmp.c            |   5 +-
>>  tests/qtest/libqtest.c          | 151 ++++++++++++++++++++++++++++----
>>  tests/qtest/migration-test.c    |   8 +-
>>  util/osdep.c                    |  22 +++++
>>  .gitlab-ci.d/windows.yml        |   4 +-
>>  accel/meson.build               |   2 +-
>>  accel/qtest/meson.build         |   3 +-
>>  tests/qtest/libqos/meson.build  |   6 +-
>>  tests/qtest/meson.build         |   6 --
>>  16 files changed, 221 insertions(+), 50 deletions(-)
>>
>> --
>> 2.25.1
>>
>
> Series looks good to me:
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
>
> However, many qtests are flaky on Windows. I get a number of "broken pipe=
" exit code 3 & timeout. Should gitlab ignore windows test failures ? Or pe=
rhaps have a new "ignored" job for the windows qtests. What's your experien=
ce running gitlab CI with this series? Can you share results? (I kicked off=
 one here https://gitlab.com/marcandre.lureau/qemu/-/pipelines/679511572)
>

This "broken pipe" error was fixed by [1] which is currently in
Daniel's tree. Please apply it in your tree and it should have a 100%
pass rate.

[1] http://patchwork.ozlabs.org/project/qemu-devel/patch/20221006151927.207=
9583-17-bmeng.cn@gmail.com/

Regards,
Bin

