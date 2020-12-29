Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB412E7236
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 17:21:41 +0100 (CET)
Received: from localhost ([::1]:52366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuHki-0000IP-Dh
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 11:21:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kuHj6-0008Ax-Vw
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 11:20:01 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:57352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kuHj4-0008KA-Iu
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 11:20:00 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BTGARjd080633;
 Tue, 29 Dec 2020 16:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=7lnUwgzL71hq8UfoLtDp6cunTYS2Wr18vskDpxS8TRc=;
 b=YLrLrMZHKM/OxKismic5A7X/w4+6QLRu9WLNva2O+UjVGWOWOr90Z+aRxnHB5f9BxM1J
 JEyDEOo8vbtx5q37dXNPy1gIITzcJIpAS2gcQgoB9AZXVj9s5sCtzuW2TCcuuGc1TNh/
 Wf8ATqYuYHrkS2uuMCRNHI3RH5tT2djwNf5tPi+RwZAmKAuSk4WByvSudeOwxSB1FXxI
 g+MC3GON/Tsd98CNp7T1GVZnPaU21RmWon5+l+A6M1bq2X775tzZC0wxT04YcrycFlx/
 e4foRPOl2kuQeslf/IvkrQAcG0BjCb54QjS+rkad+c/IsFT0h0MZf3tn/IGTRYjUeBTl ug== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 35ntpapu84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 29 Dec 2020 16:19:38 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BTGB3U3084650;
 Tue, 29 Dec 2020 16:17:37 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 35pf3wt6qq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Dec 2020 16:17:37 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BTGHY3v002128;
 Tue, 29 Dec 2020 16:17:34 GMT
Received: from dhcp-10-39-219-163.vpn.oracle.com (/10.39.219.163)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 29 Dec 2020 08:17:33 -0800
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH] multi-process: Acceptance test for multiprocess QEMU
From: Jag Raman <jag.raman@oracle.com>
In-Reply-To: <20201223184940.GA251460@heatpipe>
Date: Tue, 29 Dec 2020 11:17:30 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <1CFD4614-B351-487A-B01D-1F2D0E282FC5@oracle.com>
References: <785772783205140e219b8bfe7f793305ee768f03.1608705805.git.elena.ufimtseva@oracle.com>
 <CAJ+F1C+D6zjN-exiJnevB_GB58xCPcP7TpCHHzYxWm7BvOi3dw@mail.gmail.com>
 <20201223184940.GA251460@heatpipe>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9849
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012290101
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9849
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012290101
Received-SPF: pass client-ip=141.146.126.79; envelope-from=jag.raman@oracle.com;
 helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 Felipe Franciosi <felipe@nutanix.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Dec 23, 2020, at 1:49 PM, Elena Ufimtseva =
<elena.ufimtseva@oracle.com> wrote:
>=20
> On Wed, Dec 23, 2020 at 03:01:24PM +0400, Marc-Andr=C3=A9 Lureau =
wrote:
>> Hi
>>=20
>> On Wed, Dec 23, 2020 at 10:45 AM <elena.ufimtseva@oracle.com> wrote:
>>=20
>>> From: Jagannathan Raman <jag.raman@oracle.com>
>>>=20
>>> Runs the Avocado acceptance test to check if a
>>> remote lsi53c895a device gets identified by the guest.
>>>=20
>>> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>>> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
>>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
>>> ---
>>> tests/acceptance/multiprocess.py | 104 =
+++++++++++++++++++++++++++++++
>>> 1 file changed, 104 insertions(+)
>>> create mode 100644 tests/acceptance/multiprocess.py
>>>=20
>>> diff --git a/tests/acceptance/multiprocess.py
>>> b/tests/acceptance/multiprocess.py
>>> new file mode 100644
>>> index 0000000000..d10b4d2c05
>>> --- /dev/null
>>> +++ b/tests/acceptance/multiprocess.py
>>> @@ -0,0 +1,104 @@
>>> +# Test for multiprocess qemu
>>> +#
>>> +# This work is licensed under the terms of the GNU GPL, version 2 =
or
>>> +# later.  See the COPYING file in the top-level directory.
>>> +
>>> +
>>> +from avocado_qemu import Test
>>> +from avocado_qemu import wait_for_console_pattern
>>> +from avocado_qemu import exec_command_and_wait_for_pattern
>>> +
>>> +from qemu.accel import kvm_available
>>> +
>>> +import os
>>> +import socket
>>> +
>>> +ACCEL_NOT_AVAILABLE_FMT =3D "%s accelerator does not seem to be =
available"
>>> +KVM_NOT_AVAILABLE =3D ACCEL_NOT_AVAILABLE_FMT % "KVM"
>>> +
>>> +class Multiprocess(Test):
>>> +    """
>>> +    :avocado: tags=3Dmultiprocess
>>> +    """
>>> +    KERNEL_COMMON_COMMAND_LINE =3D 'printk.time=3D0 '
>>> +
>>> +    def wait_for_console_pattern(self, success_message, vm=3DNone):
>>> +        wait_for_console_pattern(self, success_message,
>>> +                                 failure_message=3D'Kernel panic - =
not
>>> syncing',
>>> +                                 vm=3Dvm)
>>> +
>>> +    def do_test(self, kernel_url, initrd_url, kernel_command_line,
>>> +                machine_type):
>>> +        if not kvm_available(self.arch, self.qemu_bin):
>>> +            self.cancel(KVM_NOT_AVAILABLE)
>>> +
>>> +        # Create socketpair to connect proxy and remote processes
>>> +        proxy_sock, remote_sock =3D =
socket.socketpair(socket.AF_UNIX,
>>> +                                                    =
socket.SOCK_STREAM)
>>> +        os.set_inheritable(proxy_sock.fileno(), True)
>>> +        os.set_inheritable(remote_sock.fileno(), True)
>>> +
>>> +        kernel_path =3D self.fetch_asset(kernel_url)
>>> +        initrd_path =3D self.fetch_asset(initrd_url)
>>> +
>>> +        # Create remote process
>>> +        remote_vm =3D self.get_vm()
>>> +        remote_vm.add_args('-machine', 'x-remote')
>>> +        remote_vm.add_args('-nodefaults')
>>> +        remote_vm.add_args('-device', 'lsi53c895a,id=3Dlsi1')
>>> +        remote_vm.add_args('-object', 'x-remote-object,id=3Drobj1,'
>>> +                           =
'devid=3Dlsi1,fd=3D'+str(remote_sock.fileno()))
>>> +        remote_vm.launch()
>>> +
>>> +        # Create proxy process
>>> +        self.vm.set_console()
>>> +        self.vm.add_args('-machine', machine_type)
>>> +        self.vm.add_args('-accel', 'kvm')
>>> +        self.vm.add_args('-cpu', 'host')
>>> +        self.vm.add_args("-object",
>>> +                         =
"memory-backend-memfd,id=3Dsysmem-file,size=3D2G")
>>> +        self.vm.add_args("--numa", "node,memdev=3Dsysmem-file")
>>> +        self.vm.add_args("-m", "2048")
>>> +        self.vm.add_args('-kernel', kernel_path,
>>> +                         '-initrd', initrd_path,
>>> +                         '-append', kernel_command_line)
>>> +        self.vm.add_args('-device',
>>> +                         'x-pci-proxy-dev,'
>>> +                         'id=3Dlsi1,fd=3D'+str(proxy_sock.fileno()))
>>> +        self.vm.launch()
>>> +        self.wait_for_console_pattern("as init process")
>>> +        exec_command_and_wait_for_pattern(self, "mount -t sysfs =
sysfs
>>> /sys",
>>> +                                          '', '')
>>> +        exec_command_and_wait_for_pattern(self,
>>> +                                          "cat
>>> /sys/bus/pci/devices/*/uevent",
>>> +                                          "PCI_ID=3D1000:0012", '')
>>> +
>>> +    def test_multiprocess_x86_64(self):
>>> +        """
>>> +        :avocado: tags=3Darch:x86_64
>>> +        """
>>> +        kernel_url =3D ('
>>> https://archives.fedoraproject.org/pub/archive/fedora'
>>> +                      =
'/linux/releases/31/Everything/x86_64/os/images'
>>> +                      '/pxeboot/vmlinuz')
>>> +        initrd_url =3D ('
>>> https://archives.fedoraproject.org/pub/archive/fedora'
>>> +                      =
'/linux/releases/31/Everything/x86_64/os/images'
>>> +                      '/pxeboot/initrd.img')
>>> +        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
>>> +                               'console=3DttyS0 rdinit=3D/bin/bash')
>>> +        machine =3D 'pc'
>>> +        self.do_test(kernel_url, initrd_url, kernel_command_line, =
machine)
>>> +
>>> +    def test_multiprocess_aarch64(self):
>>> +        """
>>> +        :avocado: tags=3Darch:aarch64
>>> +        """
>>> +        kernel_url =3D ('
>>> https://archives.fedoraproject.org/pub/archive/fedora'
>>> +                      =
'/linux/releases/31/Everything/aarch64/os/images'
>>> +                      '/pxeboot/vmlinuz')
>>> +        initrd_url =3D ('
>>> https://archives.fedoraproject.org/pub/archive/fedora'
>>> +                      =
'/linux/releases/31/Everything/aarch64/os/images'
>>> +                      '/pxeboot/initrd.img')
>>> +        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
>>> +                               'rdinit=3D/bin/bash =
console=3DttyAMA0')
>>> +        machine_type =3D 'virt,gic-version=3D3'
>>> +        self.do_test(kernel_url, initrd_url, kernel_command_line,
>>> machine_type)
>>> --
>>> 2.25.GIT
>>>=20
>>>=20
>> The test looks quite nice, thanks. However, it times out for me. I =
have
>> very limited experience with avocado. Any idea?
>=20
> Thanks Marc-Andre!
>=20
>> (13/40)
>> =
tests/acceptance/multiprocess.py:Multiprocess.test_multiprocess_x86_64:
>> ERROR: timed out (211.81 s)
>=20
> Can you check what is in the log file?
> Should show the log file name before it gets cancelled.
>=20
> I have it on my system at =
$HOME/avocado/job-results/job-2020-12-23T10.37-452c8ab/job.log.

Hi Marc-Andre,

Thank you very much for taking a loot at it. If you are able to share =
the test log,
that would be helpful to see what is causing the timeout.

=E2=80=94
Jag

>=20
> Thank you!
>=20
> Elena
>>=20
>>=20
>> --=20
>> Marc-Andr=C3=A9 Lureau
>=20


