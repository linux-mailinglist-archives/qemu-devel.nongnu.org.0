Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3EB61EC51
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 08:43:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orwmJ-0006FN-Sj; Mon, 07 Nov 2022 02:42:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1orwmH-0006FA-RH
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 02:42:41 -0500
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1orwmF-0008MF-PO
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 02:42:41 -0500
Received: by mail-io1-xd2b.google.com with SMTP id q21so5292578iod.4
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 23:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lbVFanDYYpHjdibSq7kzApYTEuQ30dxcmNSIUYEgqNg=;
 b=IXnXBRw0V/vwr29B2eLGgga/xA/jaQ4ImICYBCkyR4UVfEjf9iIntIEvGx+hikwear
 LSN6a5WZrLGR5TczFO8OEMzDwP/6UdxlmEZ3W28NzkZgfFHUiE84Zq3EBaSgm8iW+3eA
 gSWyee19HuTw5GkS9VeTytCmcD2uNq9zMN2RBxg2knoTguTJW02PZ59ozfJRrSy24Wxe
 Fm+F4tPjCbzW2ZZmvc9TnShOty4TZmNN4x+Fx/gK7hKDj+X3Heb53bLSBKtXtiz3N7SU
 5/lPRK07GA9GGKPF0HpIt0PThZfn7K5kS0rLIZxqKjayQ1J8I2oxgxiUztL6NIIJcSoe
 dj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lbVFanDYYpHjdibSq7kzApYTEuQ30dxcmNSIUYEgqNg=;
 b=cVqldOp6KKBmwuX1b/R+cqZMil7fO73Z/nlh5zcydAqYq87LSWUEe+ZpVKWv1GTIh1
 Uj+4MJxv58xfSXXz5PSGRGErIxf3JVidOOdENwvlqImKapq/h6WK5Er6VFyTQHlw0UxT
 di8FDxoGvPwRrQqeQzpalhBnCwLhy83vv/uQNqZag8ITyDXgSjzQv+K3A6Bv7+LqB1mE
 puHFUwYPh81FtkJTAUmBbE6cmdm8bw8QynTk+YMs3k6D9Kj15h2fOYcvDw991ewXqKQs
 91EmsqsbEHsJovaAhYG3LTCjKUfPO5XZM8V8UylT2/5Sasg673XniAC70mRC8H72mDJJ
 Aqwg==
X-Gm-Message-State: ACrzQf2xKFb2Z5Tkz0oA9vYUMN/h1nT3GfzUEH2ZTeI4fJ5JjGwS4zN0
 DFsF7u69gZ8Yr3yqPSzaa1Y8aPwL62PtyoWaGcctVQ==
X-Google-Smtp-Source: AMsMyM5rZas7RNxcZmBzeFgcHNMZdNiIvUej07nTHSCWQLiWJ0CjDRR53OV+UtPBIaHRo7QZIlc45wcXIe0iX+vEqGA=
X-Received: by 2002:a05:6602:346:b0:6bb:f236:ae68 with SMTP id
 w6-20020a056602034600b006bbf236ae68mr28577425iou.161.1667806957292; Sun, 06
 Nov 2022 23:42:37 -0800 (PST)
MIME-Version: 1.0
References: <20221105171116.432921-1-mst@redhat.com>
 <20221105171116.432921-50-mst@redhat.com>
 <CAG4p6K6ZgVmKAfRoaaD99RqtEjU0+qwUncb2=n+8GhNAezgKjg@mail.gmail.com>
 <CAG4p6K7MH2zfpqRuKrNbO7XMweUMcR59om4XseTx=O7aEWc3Vg@mail.gmail.com>
In-Reply-To: <CAG4p6K7MH2zfpqRuKrNbO7XMweUMcR59om4XseTx=O7aEWc3Vg@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 7 Nov 2022 13:12:26 +0530
Message-ID: <CAARzgwxUvO00WhFcRyM_GifL=V6iAD2xL1L+ZD_L7tZBCgTNXQ@mail.gmail.com>
Subject: Re: [PULL v3 49/81] acpi: pc: vga: use AcpiDevAmlIf interface to
 build VGA device descriptors
To: Bernhard Beschow <shentey@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Igor Mammedov <imammedo@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd2b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Nov 7, 2022 at 3:09 AM Bernhard Beschow <shentey@gmail.com> wrote:
>
>
>
> On Sun, Nov 6, 2022 at 10:16 PM Bernhard Beschow <shentey@gmail.com> wrot=
e:
>>
>>
>>
>> On Sat, Nov 5, 2022 at 6:45 PM Michael S. Tsirkin <mst@redhat.com> wrote=
:
>>>
>>> From: Igor Mammedov <imammedo@redhat.com>
>>>
>>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>>> Message-Id: <20221017102146.2254096-2-imammedo@redhat.com>
>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>> NB: we do not expect any functional change in
>>> any ACPI tables with this change. It's only a refactoring.
>>>
>>> Reviewed-by: Ani Sinha <ani@anisinha.ca>
>>> ---
>>>  hw/display/vga_int.h       |  2 ++
>>>  hw/display/acpi-vga-stub.c |  7 +++++++
>>>  hw/display/acpi-vga.c      | 26 ++++++++++++++++++++++++++
>>>  hw/display/vga-pci.c       |  4 ++++
>>>  hw/i386/acpi-build.c       | 26 +-------------------------
>>>  hw/display/meson.build     | 17 +++++++++++++++++
>>>  6 files changed, 57 insertions(+), 25 deletions(-)
>>>  create mode 100644 hw/display/acpi-vga-stub.c
>>>  create mode 100644 hw/display/acpi-vga.c
>>
>>
>> With this "qemu:qtest+qtest-hppa / qtest-hppa/display-vga-test" fails du=
e to the symbol "aml_return" being undefined:
>>
>> # starting QEMU: exec ./qemu-system-hppa -qtest unix:/tmp/qtest-515650.s=
ock -qtest-log /dev/null -chardev socket,path=3D/tmp/qtest-515650.qmp,id=3D=
char0 -mon chardev=3Dchar0,mode=3Dcontrol -display none -vga none -device v=
irtio-vga -accel qtest
>> ----------------------------------- stderr -----------------------------=
------
>> Failed to open module: qemu/build/qemu-bundle/usr/lib/qemu/hw-display-vi=
rtio-vga.so: undefined symbol: aml_return
>> qemu-system-hppa: -device virtio-vga: 'virtio-vga' is not a valid device=
 model name
>> Broken pipe
>> ../src/tests/qtest/libqtest.c:179: kill_qemu() tried to terminate QEMU p=
rocess but encountered exit status 1 (expected 0)
>>
>> (test program exited with status code -6)
>
>
> It doesn't only affect hppa:
>
> grep -e "undefined symbol: aml_return" meson-logs/testlog.txt | wc -l
> 139
>

Hmm.

I see it here too: https://gitlab.com/qemu-project/qemu/-/jobs/3281425457

>>> QTEST_QEMU_IMG=3D./qemu-img MALLOC_PERTURB_=3D60 G_TEST_DBUS_DAEMON=3D/=
builds/qemu-project/qemu/tests/dbus-vmstate-daemon.sh QTEST_QEMU_BINARY=3D.=
/qemu-system-or1k QTEST_QEMU_STORAGE_DAEMON_BINARY=3D./storage-daemon/qemu-=
storage-daemon /builds/qemu-project/qemu/build/tests/qtest/device-introspec=
t-test --tap -k
219=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80 =E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95
220stderr:
221failed to open module:
/builds/qemu-project/qemu/build/qemu-bundle/usr/local/lib64/qemu/hw-display=
-virtio-vga.so:
undefined symbol: aml_return
222qemu-system-or1k: ../util/error.c:59: error_setv: Assertion `*errp
=3D=3D NULL' failed.
223Broken pipe
224../tests/qtest/libqtest.c:188: kill_qemu() detected QEMU death from
signal 6 (Aborted) (core dumped)
225TAP parsing error: Too few tests run (expected 6, got 0)
226(test program exited with status code -6)
227=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95
228154/274 qemu:qtest+qtest-or1k / qtest-or1k/machine-none-test OK
0.05s 1 subtests passed
229155/274 qemu:qtest+qtest-or1k / qtest-or1k/qmp-test OK 0.19s 4
subtests passed
230156/274 qemu:qtest+qtest-or1k / qtest-or1k/qmp-cmd-test ERROR 1.72s
killed by signal 6 SIGABRT
231>>> QTEST_QEMU_IMG=3D./qemu-img
G_TEST_DBUS_DAEMON=3D/builds/qemu-project/qemu/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=3D./qemu-system-or1k
QTEST_QEMU_STORAGE_DAEMON_BINARY=3D./storage-daemon/qemu-storage-daemon
MALLOC_PERTURB_=3D53
/builds/qemu-project/qemu/build/tests/qtest/qmp-cmd-test --tap -k
232=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80 =E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95
233stderr:
234failed to open module:
/builds/qemu-project/qemu/build/qemu-bundle/usr/local/lib64/qemu/hw-display=
-virtio-vga.so:
undefined symbol: aml_return
235qemu-system-or1k: ../util/error.c:59: error_setv: Assertion `*errp
=3D=3D NULL' failed.
236Broken pipe
237../tests/qtest/libqtest.c:188: kill_qemu() detected QEMU death from
signal 6 (Aborted) (core dumped)
238TAP parsing error: Too few tests run (expected 62, got 31)
239(test program exited with status code -6)
240

