Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E542DD8CC
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 19:56:31 +0100 (CET)
Received: from localhost ([::1]:58810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpyRy-00016g-Hw
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 13:56:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpyKo-0000KX-JM
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:49:06 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:43592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpyKm-0002CI-OJ
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 13:49:06 -0500
Received: by mail-ed1-x530.google.com with SMTP id q16so29691872edv.10
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 10:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AN2jGgv3zS9WmyZRs/4IQBiIwFus92oK1nrkAJ3DNYk=;
 b=Mr2UNJlCx1ScYS30qi7rC3CPHw9uutReMQAtDrqKJ32U/wbKIFWYaVeHcFxHHLPVki
 y3ux4UMRtCI83glAzX69EG+C0vcZBCcZuyjugjWxtf4sqMhwSRoDwPaXlbbjnRgeIgNH
 68pKry69aqjuO0MHKhWukMXCpqleDKNNkF9CD2+3C2EFpRbfCuFVzaZ8f+t65VG2XSYp
 toe5gS74HHYMqMmVg+WVnFZCHPQHCR/ioRWSQ3aenw3eSM4Sg1Ihcv58DPIvsIyrbWD1
 I7QYYFIuK5Rce0ftqDio3fkQlenI01ziwCUO/g/F0q8bE6CTv8S7ckJcYYAJrND8HkFw
 ffJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AN2jGgv3zS9WmyZRs/4IQBiIwFus92oK1nrkAJ3DNYk=;
 b=ZVpzruZqRaLH7c2Dw0z0jzVuJT+LKLxo+IwJYcYeGBnqgdQbKgpHqnVwIIgZ4Ag45e
 k75+Wtc+djF1Yij6yFSA1tTzqKrtMu8eNTIy0wlexKnJ6GRWH/KwqrneHf57mY9ZFGvk
 Qyw0OH64ZHkMAXofbfKSKIhdbPaOCal72ZMZshYPLcrqW9WRw3oIizZ2T2kd1TxLH315
 jNb7UvIhmswhTOMVKykjSWKZgnBTk0QrQ4voLwDq2//UrOXo2E+31zHMHJRCbFxn8pY8
 xNWLq7Ye054JeV6KPCsVSc5nArnrh5dJjZDJVqW/HbFtnSConsgK1An5AXVJZjvVodcr
 rwWw==
X-Gm-Message-State: AOAM532TZMesZ7L0jE9gDZJXzMrqiYR99uv7If7fjf5taASE2Ycp8kEN
 elOHuwFa3mN659Mus4cok9y5o7oB7Yl3p3+KL98Ofw==
X-Google-Smtp-Source: ABdhPJzdWzN1mv6lEP8CkObx6xiPV4XTrBQpTSNwZ1DGabDm/gb716VyZnb1cUmP8JgxL9B3SmCtKlOHC0PSkx633CI=
X-Received: by 2002:a05:6402:366:: with SMTP id s6mr782375edw.44.1608230943029; 
 Thu, 17 Dec 2020 10:49:03 -0800 (PST)
MIME-Version: 1.0
References: <20201217094330.17400-1-alex.bennee@linaro.org>
In-Reply-To: <20201217094330.17400-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Dec 2020 18:48:51 +0000
Message-ID: <CAFEAcA8SAGVe44y=6wHC_MxcmxUE=cSu5DGs-0Md3Zt+ZZrS+A@mail.gmail.com>
Subject: Re: [PULL v2 00/11] testing and configure updates
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Dec 2020 at 09:43, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit af3f37319cb1e1ca0c42842ecdbd1bcfc64a4b=
6f:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream'=
 into staging (2020-12-15 21:24:31 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-testing-171220-2
>
> for you to fetch changes up to a1c04860cec798914f8cd8ef77fce195f360d36e:
>
>   tests: update for rename of CentOS8 PowerTools repo (2020-12-17 09:38:5=
1 +0000)
>
> ----------------------------------------------------------------
> Testing and configure updates:
>
>   - add moxie-softmmu to deprecated_targets_list
>   - improve cross-build KVM coverage
>   - new --without-default-features configure flag
>   - add __repr__ for ConsoleSocket for debugging
>   - build tcg tests with -Werror
>   - test 32 bit builds with fedora
>   - remove last traces of debian9
>   - hotfix for centos8 powertools repo

This seems to fail for x86 builds on my local Linux system with
errors like this:
make: Entering directory '/home/petmay01/linaro/qemu-for-merges/build/alldb=
g'
MALLOC_PERTURB_=3D${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=3D./qemu-img
G_TEST_DBUS_DAEMON=3D/home/petmay01/linaro/qemu-for-merges/tests/dbus-vmsta=
te-daemon.sh
QTEST_QEMU_BINARY=3D./qemu-system-moxie tests/qtest/qmp-cmd-test --tap
-k
sh: 1: exec: ./qemu-system-moxie: not found
socket_accept failed: Resource temporarily unavailable
**
ERROR:../../tests/qtest/libqtest.c:308:qtest_init_without_qmp_handshake:
assertion failed: (s->fd >=3D 0 && s->qmp_fd >=3D 0)
../../tests/qtest/libqtest.c:172: kill_qemu() tried to terminate QEMU
process but encountered exit status 127 (expected 0)
ERROR qtest-moxie/qmp-cmd-test - Bail out!
ERROR:../../tests/qtest/libqtest.c:308:qtest_init_without_qmp_handshake:
assertion failed: (s->fd >=3D 0 && s->qmp_fd >=3D 0)
Makefile.mtest:2417: recipe for target 'run-test-300' failed
make: *** [run-test-300] Error 1
make: Leaving directory '/home/petmay01/linaro/qemu-for-merges/build/alldbg=
'

Something in the Moxie deprecation patch not right?
If we didn't build the executable we shouldn't try to
run tests for it...

thanks
-- PMM

