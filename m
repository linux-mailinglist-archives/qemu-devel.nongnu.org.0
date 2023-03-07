Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6424F6ADB3A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 10:58:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZU57-0006Ov-H1; Tue, 07 Mar 2023 04:58:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZU55-0006Oi-FT
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 04:58:03 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZU53-0007z1-MG
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 04:58:03 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 u3-20020a17090a450300b00239db6d7d47so11349474pjg.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 01:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678183080;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=i6Pwz45J9LzwJofAkHrVXdagxe5e5PDpRamNgJGFu4w=;
 b=fS8GmLuPVlsui4dXCmUbMdXQtyZeqRM7ko6FHwWnGrTSCvt56faCwwEdniA5X7Va7v
 iWLwi9tFSqOeIB3BAoI51W9AL16uhPVmKPJSADfwBj5nNYsAur5T3WOlQCuqL8d3w+ij
 l3ILWY44/PAVhrZPCSqoU39/72p6A2ooxbvdhdSoVFFz1epA/dhaaV6RwIp5UIhGoBKo
 4law2xlid1FTuKGRuM8NriiL7EZMquMySxF4tjgnLl/vJA3SRcAQMPpLralQBQukSLVf
 BeK+Cs4fUAlGCKcvTQaqx8ySYLLUTVtBsIxWYf1d44vSGAYKy8yhPIf7JrJGCTLJaim8
 Q81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678183080;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i6Pwz45J9LzwJofAkHrVXdagxe5e5PDpRamNgJGFu4w=;
 b=5n9KU0E6cm8NuubRAD9uKp6fn5UjWSWShh7SOgqieolLnsvDXJCZKD6vGjjrviaSNM
 EjaD8B18Gz+6neQKmTL64dmRPfQ6rfUuzy0Zq9ve6eSUadGWyI1qZXN9UlmA7Re1cb50
 eHWSf/ntLdC64AMWA/aTbxK2FK/ud0ZsBXFiQFmvq4uMMsZKBsandl+RECEv6+KWBeh8
 2bvQ+4gAsCZsgH8Ewz/uOR3Ylzu4yLs7KWVcFl1yXgk7m4jZPLSphIr/Cg1LEKMyqr7A
 YgXgolc22MpQHDTWyQATMAvTIpq10Pgsk9mQBTnXzjGN0kv4DuqbWSqImzJaxodnXngX
 3Z8g==
X-Gm-Message-State: AO0yUKUcVVf+ygzHbWmYaH44ONTtj+aOKuYdZt3ty42BOu9t7/WNE9aV
 VaUrAmGYku4/MAWooS7JFt/HE11NX4PRCdvRNoI6XMBEYT2x1F9X
X-Google-Smtp-Source: AK7set/LzYre9GlbKiFnq0aEylh2X5mnKHmEEhxJNtHwzyqQOFpHoYDki69amqnCtL4zosSZH/UhBZVcMsvGGhlO0/E=
X-Received: by 2002:a17:902:efd4:b0:19a:efe3:b922 with SMTP id
 ja20-20020a170902efd400b0019aefe3b922mr5568008plb.9.1678183080041; Tue, 07
 Mar 2023 01:58:00 -0800 (PST)
MIME-Version: 1.0
References: <20230306133002.418421-1-thuth@redhat.com>
In-Reply-To: <20230306133002.418421-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Mar 2023 09:57:49 +0000
Message-ID: <CAFEAcA_tM1gxRonaNNzUpBxGJ+dt=D3r9MsT-4SXhXDKDK422w@mail.gmail.com>
Subject: Re: [PULL 00/16] Final tests,
 s390x and misc updates before the soft freeze
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 6 Mar 2023 at 13:30, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter!
>
> The following changes since commit 2946e1af2704bf6584f57d4e3aec49d1d5f3ecc0:
>
>   configure: Disable thread-safety warnings on macOS (2023-03-04 14:03:46 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2023-03-06
>
> for you to fetch changes up to cb161e95334dd9ba6835dbe8a8a60a2a87ddfe7e:
>
>   pc-bios/s390-ccw: Update s390-ccw.img with the list-directed IPL fix (2023-03-06 12:05:10 +0100)
>
> ----------------------------------------------------------------
> * Refine the distro support policy
> * Deprecate 32-bit x86 and arm hosts for system emulation
> * Check bison version to be >= 3.0
> * Compile vnc test only if vnc is really enabled
> * Check some configs in docs/config/ via the readconfig-test
> * s390x: Add support for list-directed IPL from ECKD DASD
>
> ----------------------------------------------------------------

On the centost-stream-8 job:
https://gitlab.com/qemu-project/qemu/-/jobs/3883361977

the readconfig test falls over because it assumes the existence
of the 'user' network backend:

------------------------------------------------------------------------------
154/177 qemu:qtest+qtest-x86_64 / qtest-x86_64/readconfig-test ERROR
0.97s killed by signal 6 SIGABRT
18:31:45 QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon
QTEST_QEMU_IMG=./qemu-img
G_TEST_DBUS_DAEMON=/home/gitlab-runner/builds/Jpwtyaz7/0/qemu-project/qemu/tests/dbus-vmstate-daemon.sh
MALLOC_PERTURB_=173 QTEST_QEMU_BINARY=./qemu-system-x86_64
/home/gitlab-runner/builds/Jpwtyaz7/0/qemu-project/qemu/build/tests/qtest/readconfig-test
--tap -k
----------------------------------- output -----------------------------------
stdout:
# random seed: R02Sdb70713b71430613420095c4ac69e492
1..5
# Start of x86_64 tests
# Start of readconfig tests
# starting QEMU: exec ./qemu-system-x86_64 -qtest
unix:/tmp/qtest-2231080.sock -qtest-log /dev/null -chardev
socket,path=/tmp/qtest-2231080.qmp,id=char0 -mon
chardev=char0,mode=control -display none -nodefaults -machine none
-readconfig /tmp/readconfig-test-8KX601 -accel qtest
ok 1 /x86_64/readconfig/spice
# starting QEMU: exec ./qemu-system-x86_64 -qtest
unix:/tmp/qtest-2231080.sock -qtest-log /dev/null -chardev
socket,path=/tmp/qtest-2231080.qmp,id=char0 -mon
chardev=char0,mode=control -display none -nodefaults -machine none
-readconfig /tmp/readconfig-test-JDLQ11 -accel qtest
ok 2 /x86_64/readconfig/object-rng
# Start of x86 tests
# starting QEMU: exec ./qemu-system-x86_64 -qtest
unix:/tmp/qtest-2231080.sock -qtest-log /dev/null -chardev
socket,path=/tmp/qtest-2231080.qmp,id=char0 -mon
chardev=char0,mode=control -display none -nodefaults -machine none
-readconfig /tmp/readconfig-test-7J9M11 -accel qtest
ok 3 /x86_64/readconfig/x86/memdev
# starting QEMU: exec ./qemu-system-x86_64 -qtest
unix:/tmp/qtest-2231080.sock -qtest-log /dev/null -chardev
socket,path=/tmp/qtest-2231080.qmp,id=char0 -mon
chardev=char0,mode=control -display none -nodefaults -readconfig
docs/config/ich9-ehci-uhci.cfg -accel qtest
ok 4 /x86_64/readconfig/x86/ich9-ehci-uhci
# starting QEMU: exec ./qemu-system-x86_64 -qtest
unix:/tmp/qtest-2231080.sock -qtest-log /dev/null -chardev
socket,path=/tmp/qtest-2231080.qmp,id=char0 -mon
chardev=char0,mode=control -display none -machine none -accel qtest
# starting QEMU: exec ./qemu-system-x86_64 -qtest
unix:/tmp/qtest-2231080.sock -qtest-log /dev/null -chardev
socket,path=/tmp/qtest-2231080.qmp,id=char0 -mon
chardev=char0,mode=control -display none -machine none -nodefaults
-readconfig /tmp/q35-emulated-2KMB11.cfg -accel qtest
stderr:
qemu-system-x86_64:/tmp/q35-emulated-2KMB11.cfg:245: network backend
'user' is not compiled into this binary
Broken pipe
../tests/qtest/libqtest.c:184: kill_qemu() tried to terminate QEMU
process but encountered exit status 1 (expected 0)
TAP parsing error: Too few tests run (expected 5, got 4)
(test program exited with status code -6)

thanks
-- PMM

