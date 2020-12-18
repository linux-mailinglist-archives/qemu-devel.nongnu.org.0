Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE132DE093
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 10:48:38 +0100 (CET)
Received: from localhost ([::1]:37316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqCNJ-0003pP-S7
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 04:48:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kqCKH-0001ta-MJ; Fri, 18 Dec 2020 04:45:29 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:54890
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kqCKE-0001uz-UF; Fri, 18 Dec 2020 04:45:29 -0500
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id 06F375FA93;
 Fri, 18 Dec 2020 10:45:19 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi.denis.courmont@huawei.com>
To: qemu-arm@nongnu.org
Subject: Re: [PATCHv3 00/17] ARMv8.4 Secure EL2
Date: Fri, 18 Dec 2020 11:45:19 +0200
Message-ID: <1841243.PYKUYFuaPT@basile.remlab.net>
Organization: Huawei Technologies, Finland
In-Reply-To: <874kkwgzbe.fsf@linaro.org>
References: <3333301.iIbC2pHGDl@basile.remlab.net>
 <2120950.iZASKD2KPV@basile.remlab.net> <874kkwgzbe.fsf@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le tiistaina 8. joulukuuta 2020, 16.11.15 EET Alex Benn=C3=A9e a =C3=A9crit=
 :
> > Wiki implies that dependencies are automatically installed, but I
> > guess not?
>=20
> They should be in the venv that is built when you run the test the first
> time. Running the above command without the -V which it doesn't
> recognise gives me a list:
>=20
>   14:12:25 [alex@zen:~/l/q/b/all]
> xen/guest-loader-and-arm-build-cleanups-v2|=E2=9C=9A3=E2=80=A6(+5/-5) +
> ./tests/venv/bin/avocado list tests/acceptance/ | head -n 10 INSTRUMENTED
> tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_i440fx_tcg
> INSTRUMENTED
> tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_i440fx_kvm
> INSTRUMENTED tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_q35_tcg
> INSTRUMENTED tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_q35_kvm
> INSTRUMENTED tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg
> INSTRUMENTED
> tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv2
> INSTRUMENTED
> tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv3
> INSTRUMENTED tests/acceptance/boot_linux.py:BootLinuxPPC64.test_pseries_t=
cg
> INSTRUMENTED
> tests/acceptance/boot_linux.py:BootLinuxS390X.test_s390_ccw_virtio_tcg
> INSTRUMENTED
> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_x86_64_pc
> Exception ignored in: <_io.TextIOWrapper name=3D'<stdout>' mode=3D'w'
> encoding=3D'UTF-8'> BrokenPipeError: [Errno 32] Broken pipe
>=20
> I wonder are you running an in-tree build?

Yes. I suppose somebody fixed something because I can run the test cases no=
w=20
and pinpoint the failing change, though I've yet to debug it succesfully.

=2D-=20
R=C3=A9mi Denis-Courmont



