Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F99311F05
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 18:07:38 +0100 (CET)
Received: from localhost ([::1]:58256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8R3Z-0002uM-Am
	for lists+qemu-devel@lfdr.de; Sat, 06 Feb 2021 12:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l8Qzt-0001C1-1U
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 12:03:50 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:36306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l8Qzg-00063n-Dq
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 12:03:48 -0500
Received: by mail-ej1-x635.google.com with SMTP id lg21so18022902ejb.3
 for <qemu-devel@nongnu.org>; Sat, 06 Feb 2021 09:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DiT9G3DnYoEDx5MMfkMbS+N1wUtvb/Wa8/tQTBIy8P8=;
 b=oO4lEMfUXzWosANA970mnm5goKjceOSj4PBCz89ZK3vzIHCCzCtT771e6dWcCsaADN
 qnW9nvnN9GaT4sEjIfQ5/YrQpDamav9qH+b0FXZqyzKyt+Jxaf9gT2fLIAUc2OpkkYCK
 pyhr2Y/oqSQnltoOhd7fRrXuf5tZcCPQjMPeYYe68qCZisPXUpnt0tEX1TqbxMs1vg2p
 +YmCI9AXh1Csdu5udYG9CiLjFC3ya9ebYVYmTwtVCHLPtXIYxPaZyQWT7kR82xSg+ia4
 dPBth8xGE6gvY4KTMa3gco3GPl0bSBYD/ibt+rX3HY9ZW2x6fXv8pb0V92WTPBeH5XLP
 crzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DiT9G3DnYoEDx5MMfkMbS+N1wUtvb/Wa8/tQTBIy8P8=;
 b=A9Ng+epomEZx2gqcdyEOilXBOe0FEaGkFfH+s9G+qiwRUi2rVGJqc7gXQ6prHQBd5D
 1RH59tafGTT1PbeOFlW86fAgEssukh4SHXNALbAHddEROcIYzm3X9cVL2wws2QDnLS/N
 8lJqi9tppMmOZvhf+bOlj7dY/jsBpA0sNexBhVrePi4RRU/vvym0gcZ3hjyN+Jfg7+bl
 w1xWahW7gm6DPZYifY+TY8/jGwxFH5JziDl83Fva7XKJY3DcxRiBQlpxxzLLmn7tAz5w
 elr5ov1yKmlk4Flrbd3dlx191i0pSU6LdYvBioPmn2lOvM5KTMAxJNBA/vf89mnlLW52
 X7BQ==
X-Gm-Message-State: AOAM532UNlQr9Jrtu2R7lhwlPedWaWINxHKxCsC2CG+lCCjenMnIL/VT
 gHE5NUZzoBle7okgE8FHfR6OKHUYUthNXN/bHSkaaw==
X-Google-Smtp-Source: ABdhPJzX5K8SfElyTlzy99aC+AN2vLwGXIMYpZK21ute4f75kRUZjhacHXkUSI7sIe1ZX7GTJ+Z44WVSDE9Dzph+pkA=
X-Received: by 2002:a17:906:b4a:: with SMTP id
 v10mr5601653ejg.382.1612631012278; 
 Sat, 06 Feb 2021 09:03:32 -0800 (PST)
MIME-Version: 1.0
References: <20210205164459.432714-1-stefanha@redhat.com>
 <CAFEAcA-dQtOaXB-eHEbiF0Z7jF-wSHt0LwW8Bk+BU2B66+=Cyw@mail.gmail.com>
In-Reply-To: <CAFEAcA-dQtOaXB-eHEbiF0Z7jF-wSHt0LwW8Bk+BU2B66+=Cyw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 6 Feb 2021 17:03:20 +0000
Message-ID: <CAFEAcA8sOgF9Czy+GUBti7W-C9ZtW9PB+1YxG7mqAXKr5mV18g@mail.gmail.com>
Subject: Re: [PULL v3 00/27] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, John G Johnson <john.g.johnson@oracle.com>,
 Thomas Huth <thuth@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Feb 2021 at 22:53, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 5 Feb 2021 at 16:45, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > The following changes since commit e2c5093c993ef646e4e28f7aa78429853bcc06ac:
> >
> >   iotests: 30: drop from auto group (and effectively from make check) (2021-02-05 15:16:13 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
> >
> > for you to fetch changes up to b07011f375bda3319cf72eee7cb18d310078387b:
> >
> >   docs: fix Parallels Image "dirty bitmap" section (2021-02-05 16:36:36 +0000)
> >
> > ----------------------------------------------------------------
> > Pull request
> >
> > v3:
> >  * Replace {0} array initialization with {} to make clang happy [Peter]
> >
> > ----------------------------------------------------------------
>
>
> Fails 'make check' on s390x host:

I gave this a rerun to check it was reproducible (it is) and realised
I missed what looks like an important line in the log. As usual,
trying to disentangle which lines of a parallel make check correspond
to the failure is pretty tricky, but the lines
 Type 'remote-pcihost' is missing its parent 'pcie-host-bridge'

are probably the proximate causes of the assertion failures.

MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=./qemu-img
G_TEST_DBUS_DAEMON=/home/ubuntu/qemu/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=./qemu-system-rx tests/qtest/qos-test --tap -k
PASS 45 qtest-rx/qmp-cmd-test /rx/qmp/query-memory-size-summary
SKIP
MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=./qemu-img
G_TEST_DBUS_DAEMON=/home/ubuntu/qemu/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=./qemu-system-s390x tests/qtest/pxe-test --tap -k
PASS 46 qtest-rx/qmp-cmd-test /rx/qmp/query-memory-devices
Type 'remote-pcihost' is missing its parent 'pcie-host-bridge'
PASS 47 qtest-rx/qmp-cmd-test /rx/qmp/query-replay
PASS 48 qtest-rx/qmp-cmd-test /rx/qmp/query-yank
PASS 49 qtest-rx/qmp-cmd-test /rx/qmp/query-name
PASS 50 qtest-rx/qmp-cmd-test /rx/qmp/query-iothreads
PASS 51 qtest-rx/qmp-cmd-test /rx/qmp/query-fdsets
PASS 52 qtest-rx/qmp-cmd-test /rx/qmp/query-command-line-options
PASS 53 qtest-rx/qmp-cmd-test /rx/qmp/query-acpi-ospm-status
PASS 54 qtest-rx/qmp-cmd-test /rx/qmp/object-add-failure-modes
MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=./qemu-img
G_TEST_DBUS_DAEMON=/home/ubuntu/qemu/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=./qemu-system-s390x tests/qtest/test-netfilter --tap
-k
Type 'remote-pcihost' is missing its parent 'pcie-host-bridge'
socket_accept failed: Resource temporarily unavailable
socket_accept failed: Resource temporarily unavailable
**
ERROR:../../tests/qtest/libqtest.c:308:qtest_init_without_qmp_handshake:
assertion failed: (s->fd >= 0 && s->qmp_fd >= 0)
**
ERROR:../../tests/qtest/libqtest.c:308:qtest_init_without_qmp_handshake:
assertion failed: (s->fd >= 0 && s->qmp_fd >= 0)
../../tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from
signal 6 (Aborted) (core dumped)
../../tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from
signal 6 (Aborted) (core dumped)
ERROR qtest-s390x/pxe-test - Bail out!
ERROR:../../tests/qtest/libqtest.c:308:qtest_init_without_qmp_handshake:
assertion failed: (s->fd >= 0 && s->qmp_fd >= 0)
ERROR qtest-s390x/test-netfilter - Bail out!
ERROR:../../tests/qtest/libqtest.c:308:qtest_init_without_qmp_handshake:
assertion failed: (s->fd >= 0 && s->qmp_fd >= 0)
Makefile.mtest:3113: recipe for target 'run-test-387' failed
make: *** [run-test-387] Error 1
make: *** Waiting for unfinished jobs....
Makefile.mtest:3121: recipe for target 'run-test-388' failed

thanks
-- PMM

