Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4392ED5C1
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 18:38:28 +0100 (CET)
Received: from localhost ([::1]:53476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxZEx-00024p-KW
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 12:38:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kxZ1H-0005Vo-VQ
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:24:20 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:58862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kxZ1F-0005cP-Bd
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 12:24:19 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 107H9X73049772;
 Thu, 7 Jan 2021 17:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=SZUTpPZtOCRPRUrIsa6LiZCqg/8RH1hwihoK/QUb70E=;
 b=QDUt/nFmXly9va6nrn5qE50Q12k+7wg7fY63sIRbSjenfXGiSVd/o4vKoMXCoPfApbXR
 KBpTFT6b4uFDG2V/fnkjGHokyXC22Wxqyt1Ad0Jq7qRleKcSu4H6xPCG5gzbDilFVZ1k
 ETwydVUaBS4Sb143RqGxoGuyu9d1t16o+pphSc/oo/ngnG9+D+zT02dLVI3qU/i4BHbr
 YgL1jISUiYpcmoPJnpSww00poWgvBg2t7apFEtVu60Sfm1ZYgTg+HTuDAKAVU0RD0T1p
 PS1ypbDyFvBi98RdMS0SZwNeU+tLLFGwScqukxMz8deT6MnMykvTwp1UA1KCklE20GKA lA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 35wepmdex7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 07 Jan 2021 17:23:56 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 107HBR8M052192;
 Thu, 7 Jan 2021 17:23:55 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 35w3g321ur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Jan 2021 17:23:55 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 107HNrf0030291;
 Thu, 7 Jan 2021 17:23:53 GMT
Received: from [10.39.243.43] (/10.39.243.43)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 07 Jan 2021 17:23:52 +0000
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH] multi-process: Acceptance test for multiprocess QEMU
From: Jag Raman <jag.raman@oracle.com>
In-Reply-To: <CAJ+F1CLD8=GWaU788a2JLsOCtpnDsR4u6rg0ghZL_pvEcrVYOw@mail.gmail.com>
Date: Thu, 7 Jan 2021 12:23:49 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <241A0E86-9570-49DC-8F91-A4CEC9DA4B0B@oracle.com>
References: <785772783205140e219b8bfe7f793305ee768f03.1608705805.git.elena.ufimtseva@oracle.com>
 <CAJ+F1C+D6zjN-exiJnevB_GB58xCPcP7TpCHHzYxWm7BvOi3dw@mail.gmail.com>
 <20201223184940.GA251460@heatpipe>
 <1CFD4614-B351-487A-B01D-1F2D0E282FC5@oracle.com>
 <CAJ+F1CLD8=GWaU788a2JLsOCtpnDsR4u6rg0ghZL_pvEcrVYOw@mail.gmail.com>
To: =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9857
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101070101
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9857
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101070101
Received-SPF: pass client-ip=141.146.126.78; envelope-from=jag.raman@oracle.com;
 helo=aserp2120.oracle.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John G Johnson <john.g.johnson@oracle.com>, QEMU <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
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
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jan 6, 2021, at 8:51 AM, Marc-Andr=C3=A9 Lureau =
<marcandre.lureau@gmail.com> wrote:
>=20
> Hi
>=20
> On Tue, Dec 29, 2020 at 8:19 PM Jag Raman <jag.raman@oracle.com> =
wrote:
>=20
>=20
> > On Dec 23, 2020, at 1:49 PM, Elena Ufimtseva =
<elena.ufimtseva@oracle.com> wrote:
> >=20
> > On Wed, Dec 23, 2020 at 03:01:24PM +0400, Marc-Andr=C3=A9 Lureau =
wrote:
> >> Hi
> >>=20
> >> On Wed, Dec 23, 2020 at 10:45 AM <elena.ufimtseva@oracle.com> =
wrote:
> >>=20
> >>> From: Jagannathan Raman <jag.raman@oracle.com>
> >>>=20
> >>> Runs the Avocado acceptance test to check if a
> >>> remote lsi53c895a device gets identified by the guest.
> >>>=20
> >>> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> >>> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> >>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> >>> ---
> >>> tests/acceptance/multiprocess.py | 104 =
+++++++++++++++++++++++++++++++
> >>> 1 file changed, 104 insertions(+)
> >>> create mode 100644 tests/acceptance/multiprocess.py
> >>>=20
> >>> diff --git a/tests/acceptance/multiprocess.py
> >>> b/tests/acceptance/multiprocess.py
> >>> new file mode 100644
> >>> index 0000000000..d10b4d2c05
> >>> --- /dev/null
> >>> +++ b/tests/acceptance/multiprocess.py
> >>> @@ -0,0 +1,104 @@
> >>> +# Test for multiprocess qemu
> >>> +#
> >>> +# This work is licensed under the terms of the GNU GPL, version 2 =
or
> >>> +# later.  See the COPYING file in the top-level directory.
> >>> +
> >>> +
> >>> +from avocado_qemu import Test
> >>> +from avocado_qemu import wait_for_console_pattern
> >>> +from avocado_qemu import exec_command_and_wait_for_pattern
> >>> +
> >>> +from qemu.accel import kvm_available
> >>> +
> >>> +import os
> >>> +import socket
> >>> +
> >>> +ACCEL_NOT_AVAILABLE_FMT =3D "%s accelerator does not seem to be =
available"
> >>> +KVM_NOT_AVAILABLE =3D ACCEL_NOT_AVAILABLE_FMT % "KVM"
> >>> +
> >>> +class Multiprocess(Test):
> >>> +    """
> >>> +    :avocado: tags=3Dmultiprocess
> >>> +    """
> >>> +    KERNEL_COMMON_COMMAND_LINE =3D 'printk.time=3D0 '
> >>> +
> >>> +    def wait_for_console_pattern(self, success_message, vm=3DNone):=

> >>> +        wait_for_console_pattern(self, success_message,
> >>> +                                 failure_message=3D'Kernel panic =
- not
> >>> syncing',
> >>> +                                 vm=3Dvm)
> >>> +
> >>> +    def do_test(self, kernel_url, initrd_url, =
kernel_command_line,
> >>> +                machine_type):
> >>> +        if not kvm_available(self.arch, self.qemu_bin):
> >>> +            self.cancel(KVM_NOT_AVAILABLE)
> >>> +
> >>> +        # Create socketpair to connect proxy and remote processes
> >>> +        proxy_sock, remote_sock =3D =
socket.socketpair(socket.AF_UNIX,
> >>> +                                                    =
socket.SOCK_STREAM)
> >>> +        os.set_inheritable(proxy_sock.fileno(), True)
> >>> +        os.set_inheritable(remote_sock.fileno(), True)
> >>> +
> >>> +        kernel_path =3D self.fetch_asset(kernel_url)
> >>> +        initrd_path =3D self.fetch_asset(initrd_url)
> >>> +
> >>> +        # Create remote process
> >>> +        remote_vm =3D self.get_vm()
> >>> +        remote_vm.add_args('-machine', 'x-remote')
> >>> +        remote_vm.add_args('-nodefaults')
> >>> +        remote_vm.add_args('-device', 'lsi53c895a,id=3Dlsi1')
> >>> +        remote_vm.add_args('-object', 'x-remote-object,id=3Drobj1,'=

> >>> +                           =
'devid=3Dlsi1,fd=3D'+str(remote_sock.fileno()))
> >>> +        remote_vm.launch()
> >>> +
> >>> +        # Create proxy process
> >>> +        self.vm.set_console()
> >>> +        self.vm.add_args('-machine', machine_type)
> >>> +        self.vm.add_args('-accel', 'kvm')
> >>> +        self.vm.add_args('-cpu', 'host')
> >>> +        self.vm.add_args("-object",
> >>> +                         =
"memory-backend-memfd,id=3Dsysmem-file,size=3D2G")
> >>> +        self.vm.add_args("--numa", "node,memdev=3Dsysmem-file")
> >>> +        self.vm.add_args("-m", "2048")
> >>> +        self.vm.add_args('-kernel', kernel_path,
> >>> +                         '-initrd', initrd_path,
> >>> +                         '-append', kernel_command_line)
> >>> +        self.vm.add_args('-device',
> >>> +                         'x-pci-proxy-dev,'
> >>> +                         'id=3Dlsi1,fd=3D'+str(proxy_sock.fileno())=
)
> >>> +        self.vm.launch()
> >>> +        self.wait_for_console_pattern("as init process")
> >>> +        exec_command_and_wait_for_pattern(self, "mount -t sysfs =
sysfs
> >>> /sys",
> >>> +                                          '', '')
> >>> +        exec_command_and_wait_for_pattern(self,
> >>> +                                          "cat
> >>> /sys/bus/pci/devices/*/uevent",
> >>> +                                          "PCI_ID=3D1000:0012", =
'')
> >>> +
> >>> +    def test_multiprocess_x86_64(self):
> >>> +        """
> >>> +        :avocado: tags=3Darch:x86_64
> >>> +        """
> >>> +        kernel_url =3D ('
> >>> https://archives.fedoraproject.org/pub/archive/fedora'
> >>> +                      =
'/linux/releases/31/Everything/x86_64/os/images'
> >>> +                      '/pxeboot/vmlinuz')
> >>> +        initrd_url =3D ('
> >>> https://archives.fedoraproject.org/pub/archive/fedora'
> >>> +                      =
'/linux/releases/31/Everything/x86_64/os/images'
> >>> +                      '/pxeboot/initrd.img')
> >>> +        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE =
+
> >>> +                               'console=3DttyS0 =
rdinit=3D/bin/bash')
> >>> +        machine =3D 'pc'
> >>> +        self.do_test(kernel_url, initrd_url, kernel_command_line, =
machine)
> >>> +
> >>> +    def test_multiprocess_aarch64(self):
> >>> +        """
> >>> +        :avocado: tags=3Darch:aarch64
> >>> +        """
> >>> +        kernel_url =3D ('
> >>> https://archives.fedoraproject.org/pub/archive/fedora'
> >>> +                      =
'/linux/releases/31/Everything/aarch64/os/images'
> >>> +                      '/pxeboot/vmlinuz')
> >>> +        initrd_url =3D ('
> >>> https://archives.fedoraproject.org/pub/archive/fedora'
> >>> +                      =
'/linux/releases/31/Everything/aarch64/os/images'
> >>> +                      '/pxeboot/initrd.img')
> >>> +        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE =
+
> >>> +                               'rdinit=3D/bin/bash =
console=3DttyAMA0')
> >>> +        machine_type =3D 'virt,gic-version=3D3'
> >>> +        self.do_test(kernel_url, initrd_url, kernel_command_line,
> >>> machine_type)
> >>> --
> >>> 2.25.GIT
> >>>=20
> >>>=20
> >> The test looks quite nice, thanks. However, it times out for me. I =
have
> >> very limited experience with avocado. Any idea?
> >=20
> > Thanks Marc-Andre!
> >=20
> >> (13/40)
> >> =
tests/acceptance/multiprocess.py:Multiprocess.test_multiprocess_x86_64:
> >> ERROR: timed out (211.81 s)
> >=20
> > Can you check what is in the log file?
> > Should show the log file name before it gets cancelled.
> >=20
> > I have it on my system at =
$HOME/avocado/job-results/job-2020-12-23T10.37-452c8ab/job.log.
>=20
> Hi Marc-Andre,
>=20
> Thank you very much for taking a loot at it. If you are able to share =
the test log,
> that would be helpful to see what is causing the timeout.
>=20
> I tested it again, and it works now. No idea what happened.
>=20
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=20

Thank you for confirming, Marc-Andre!
>=20


