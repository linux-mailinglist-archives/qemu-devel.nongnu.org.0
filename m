Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7094E373D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 04:07:27 +0100 (CET)
Received: from localhost ([::1]:35550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWUrn-00042I-0a
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 23:07:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nWUq0-00037l-Qi; Mon, 21 Mar 2022 23:05:36 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:57808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1nWUpy-0005QH-7L; Mon, 21 Mar 2022 23:05:36 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 22M2shuT079375;
 Tue, 22 Mar 2022 10:54:43 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from aspeedtech.com (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 22 Mar
 2022 11:05:11 +0800
Date: Tue, 22 Mar 2022 11:04:57 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v1 1/1] test/avocado/machine_aspeed.py: Add ast1030 test
 case
Message-ID: <20220322030455.GA4273@aspeedtech.com>
References: <20220321091646.17234-1-jamin_lin@aspeedtech.com>
 <20220321091646.17234-2-jamin_lin@aspeedtech.com>
 <1f14533c-1163-f3c0-72ee-b79eba79480c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1f14533c-1163-f3c0-72ee-b79eba79480c@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 22M2shuT079375
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Steven Lee <steven_lee@aspeedtech.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 03/21/2022 17:39, Thomas Huth wrote:
> On 21/03/2022 10.16, Jamin Lin wrote:
> > Add test case to test "ast1030-evb" machine with zephyr os
> > 
> > Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> > ---
> >   tests/avocado/machine_aspeed.py | 36 +++++++++++++++++++++++++++++++++
> >   1 file changed, 36 insertions(+)
> >   create mode 100644 tests/avocado/machine_aspeed.py
> > 
> > diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
> > new file mode 100644
> > index 0000000000..33090af199
> > --- /dev/null
> > +++ b/tests/avocado/machine_aspeed.py
> > @@ -0,0 +1,36 @@
> > +# Functional test that boots the ASPEED SoCs with firmware
> > +#
> > +# Copyright (C) 2022 ASPEED Technology Inc
> > +#
> > +# This work is licensed under the terms of the GNU GPL, version 2 or
> > +# later.  See the COPYING file in the top-level directory.
> > +
> > +from avocado_qemu import QemuSystemTest
> > +from avocado_qemu import wait_for_console_pattern
> > +from avocado_qemu import exec_command_and_wait_for_pattern
> > +from avocado.utils import archive
> > +
> > +
> > +class AST1030Machine(QemuSystemTest):
> > +    """Boots the zephyr os and checks that the console is operational"""
> > +
> > +    timeout = 10
> > +
> > +    def test_ast1030_zephyros(self):
> > +        """
> > +        :avocado: tags=arch:arm
> > +        :avocado: tags=machine:ast1030-evb
> > +        """
> > +        tar_url = ('https://github.com/AspeedTech-BMC'
> > +                   '/zephyr/releases/download/v00.01.04/ast1030-evb-demo.zip')
> > +        tar_hash = '4c6a8ce3a8ba76ef1a65dae419ae3409343c4b20'
> > +        tar_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
> > +        archive.extract(tar_path, self.workdir)
> > +        kernel_file = self.workdir + "/ast1030-evb-demo/zephyr.elf"
> > +        self.vm.set_console()
> > +        self.vm.add_args('-kernel', kernel_file,
> > +                         '-nographic')
> > +        self.vm.launch()
> > +        wait_for_console_pattern(self, "Booting Zephyr OS")
> > +        exec_command_and_wait_for_pattern(self, "help",
> > +                                          "Available commands")
> Looks like this belongs to a new machine type that we do not have in QEMU 
> yet? ... in that case, please send it along in a threaded patch series where 
> you add the new machine type, otherwise it does not make much sense to see 
> this as a single patch on the list.
> 
>   Thomas
>
I created a new series patch to support AST1030 model which included
this patch for avocado test.
http://patchwork.ozlabs.org/project/qemu-devel/list/?series=291430
Thanks-Jamin

