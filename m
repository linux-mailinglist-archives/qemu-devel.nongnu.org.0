Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E772E209A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 19:53:47 +0100 (CET)
Received: from localhost ([::1]:41744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ks9Gc-0000Qa-NE
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 13:53:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1ks9Ew-0007jl-0f
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 13:52:02 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:40612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1ks9Et-0000Zq-DM
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 13:52:01 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BNIYv1V038040;
 Wed, 23 Dec 2020 18:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2020-01-29;
 bh=AHZqh6ulQgmB6RQZrLvdN3q9g6nIu5MHYqNfkzmqtWU=;
 b=NjynKa3v1WWzSrDcSIn8XsVQsMOBi+DT4KxJ+n1R2XtREl4FUg7SDUoXUeUZvr8cSQ9b
 sai8evpBDqHxCFOfu9CcVAyEtilIwLL/TRktfwuJ71MQlfQ0177AQMRrmhAQt6r+ggL2
 5IU7FLCozHC4IJ+MdIjz64/teMy/qbkrtWlOHV8vH3PaZnfN7LeDhMQOjlnQR8OeGjap
 6xo3MBQvGy7UFtlOyeF0UnLhslsfVHNFfikkfpRgSjjkc8Qu1akg9qTIPNXKxE8orMWo
 6m9EGpqvP12CRqG8ORJD+eVddutChXDTDuzTLUr/V0KcoFptaGxxoHep+DL2XdX22BWE MQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 35ku8du9ub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Dec 2020 18:51:47 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BNIYdmE179127;
 Wed, 23 Dec 2020 18:49:46 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 35k0ev032n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Dec 2020 18:49:46 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BNInhkX029681;
 Wed, 23 Dec 2020 18:49:43 GMT
Received: from heatpipe (/67.180.143.163)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 23 Dec 2020 10:49:43 -0800
Date: Wed, 23 Dec 2020 10:49:40 -0800
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH] multi-process: Acceptance test for multiprocess QEMU
Message-ID: <20201223184940.GA251460@heatpipe>
References: <785772783205140e219b8bfe7f793305ee768f03.1608705805.git.elena.ufimtseva@oracle.com>
 <CAJ+F1C+D6zjN-exiJnevB_GB58xCPcP7TpCHHzYxWm7BvOi3dw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1C+D6zjN-exiJnevB_GB58xCPcP7TpCHHzYxWm7BvOi3dw@mail.gmail.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9844
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012230134
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9844
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 phishscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012230134
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=elena.ufimtseva@oracle.com; helo=userp2130.oracle.com
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
 Gerd Hoffmann <kraxel@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 Felipe Franciosi <felipe@nutanix.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 23, 2020 at 03:01:24PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Dec 23, 2020 at 10:45 AM <elena.ufimtseva@oracle.com> wrote:
> 
> > From: Jagannathan Raman <jag.raman@oracle.com>
> >
> > Runs the Avocado acceptance test to check if a
> > remote lsi53c895a device gets identified by the guest.
> >
> > Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> > Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> > Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> > ---
> >  tests/acceptance/multiprocess.py | 104 +++++++++++++++++++++++++++++++
> >  1 file changed, 104 insertions(+)
> >  create mode 100644 tests/acceptance/multiprocess.py
> >
> > diff --git a/tests/acceptance/multiprocess.py
> > b/tests/acceptance/multiprocess.py
> > new file mode 100644
> > index 0000000000..d10b4d2c05
> > --- /dev/null
> > +++ b/tests/acceptance/multiprocess.py
> > @@ -0,0 +1,104 @@
> > +# Test for multiprocess qemu
> > +#
> > +# This work is licensed under the terms of the GNU GPL, version 2 or
> > +# later.  See the COPYING file in the top-level directory.
> > +
> > +
> > +from avocado_qemu import Test
> > +from avocado_qemu import wait_for_console_pattern
> > +from avocado_qemu import exec_command_and_wait_for_pattern
> > +
> > +from qemu.accel import kvm_available
> > +
> > +import os
> > +import socket
> > +
> > +ACCEL_NOT_AVAILABLE_FMT = "%s accelerator does not seem to be available"
> > +KVM_NOT_AVAILABLE = ACCEL_NOT_AVAILABLE_FMT % "KVM"
> > +
> > +class Multiprocess(Test):
> > +    """
> > +    :avocado: tags=multiprocess
> > +    """
> > +    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
> > +
> > +    def wait_for_console_pattern(self, success_message, vm=None):
> > +        wait_for_console_pattern(self, success_message,
> > +                                 failure_message='Kernel panic - not
> > syncing',
> > +                                 vm=vm)
> > +
> > +    def do_test(self, kernel_url, initrd_url, kernel_command_line,
> > +                machine_type):
> > +        if not kvm_available(self.arch, self.qemu_bin):
> > +            self.cancel(KVM_NOT_AVAILABLE)
> > +
> > +        # Create socketpair to connect proxy and remote processes
> > +        proxy_sock, remote_sock = socket.socketpair(socket.AF_UNIX,
> > +                                                    socket.SOCK_STREAM)
> > +        os.set_inheritable(proxy_sock.fileno(), True)
> > +        os.set_inheritable(remote_sock.fileno(), True)
> > +
> > +        kernel_path = self.fetch_asset(kernel_url)
> > +        initrd_path = self.fetch_asset(initrd_url)
> > +
> > +        # Create remote process
> > +        remote_vm = self.get_vm()
> > +        remote_vm.add_args('-machine', 'x-remote')
> > +        remote_vm.add_args('-nodefaults')
> > +        remote_vm.add_args('-device', 'lsi53c895a,id=lsi1')
> > +        remote_vm.add_args('-object', 'x-remote-object,id=robj1,'
> > +                           'devid=lsi1,fd='+str(remote_sock.fileno()))
> > +        remote_vm.launch()
> > +
> > +        # Create proxy process
> > +        self.vm.set_console()
> > +        self.vm.add_args('-machine', machine_type)
> > +        self.vm.add_args('-accel', 'kvm')
> > +        self.vm.add_args('-cpu', 'host')
> > +        self.vm.add_args("-object",
> > +                         "memory-backend-memfd,id=sysmem-file,size=2G")
> > +        self.vm.add_args("--numa", "node,memdev=sysmem-file")
> > +        self.vm.add_args("-m", "2048")
> > +        self.vm.add_args('-kernel', kernel_path,
> > +                         '-initrd', initrd_path,
> > +                         '-append', kernel_command_line)
> > +        self.vm.add_args('-device',
> > +                         'x-pci-proxy-dev,'
> > +                         'id=lsi1,fd='+str(proxy_sock.fileno()))
> > +        self.vm.launch()
> > +        self.wait_for_console_pattern("as init process")
> > +        exec_command_and_wait_for_pattern(self, "mount -t sysfs sysfs
> > /sys",
> > +                                          '', '')
> > +        exec_command_and_wait_for_pattern(self,
> > +                                          "cat
> > /sys/bus/pci/devices/*/uevent",
> > +                                          "PCI_ID=1000:0012", '')
> > +
> > +    def test_multiprocess_x86_64(self):
> > +        """
> > +        :avocado: tags=arch:x86_64
> > +        """
> > +        kernel_url = ('
> > https://archives.fedoraproject.org/pub/archive/fedora'
> > +                      '/linux/releases/31/Everything/x86_64/os/images'
> > +                      '/pxeboot/vmlinuz')
> > +        initrd_url = ('
> > https://archives.fedoraproject.org/pub/archive/fedora'
> > +                      '/linux/releases/31/Everything/x86_64/os/images'
> > +                      '/pxeboot/initrd.img')
> > +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> > +                               'console=ttyS0 rdinit=/bin/bash')
> > +        machine = 'pc'
> > +        self.do_test(kernel_url, initrd_url, kernel_command_line, machine)
> > +
> > +    def test_multiprocess_aarch64(self):
> > +        """
> > +        :avocado: tags=arch:aarch64
> > +        """
> > +        kernel_url = ('
> > https://archives.fedoraproject.org/pub/archive/fedora'
> > +                      '/linux/releases/31/Everything/aarch64/os/images'
> > +                      '/pxeboot/vmlinuz')
> > +        initrd_url = ('
> > https://archives.fedoraproject.org/pub/archive/fedora'
> > +                      '/linux/releases/31/Everything/aarch64/os/images'
> > +                      '/pxeboot/initrd.img')
> > +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> > +                               'rdinit=/bin/bash console=ttyAMA0')
> > +        machine_type = 'virt,gic-version=3'
> > +        self.do_test(kernel_url, initrd_url, kernel_command_line,
> > machine_type)
> > --
> > 2.25.GIT
> >
> >
> The test looks quite nice, thanks. However, it times out for me. I have
> very limited experience with avocado. Any idea?

Thanks Marc-Andre!

>  (13/40)
> tests/acceptance/multiprocess.py:Multiprocess.test_multiprocess_x86_64:
> ERROR: timed out (211.81 s)

Can you check what is in the log file?
Should show the log file name before it gets cancelled.

I have it on my system at $HOME/avocado/job-results/job-2020-12-23T10.37-452c8ab/job.log.

Thank you!

Elena
> 
> 
> -- 
> Marc-André Lureau

