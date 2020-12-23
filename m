Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D35F2E2099
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 19:53:33 +0100 (CET)
Received: from localhost ([::1]:41092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ks9GO-00008y-84
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 13:53:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1ks9Eh-0007Z7-7Z
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 13:51:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1ks9Ec-0000UT-S8
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 13:51:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608749500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SUuvt9MaFk0xlJEdQsf1aFTBa8+wCmXY5hJxIk0e4Cw=;
 b=OyHy4cdNqOm0hGnJr1Z3L0Ib4wTSg9DUGBADL90pnfB2GohNofPmZkKOrxdXVFO3OPfkGz
 3OEH9tnaPL2PwVbOxo0MYkCrka2mdjuydkKGqTFbS1Agds/1QdMzJB7ymDwSJHX2JHJT6N
 Sq5ukWtExz5ZyKRqw/s+x05f71eGWXc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-i7vV1pjBO--96Hcd9mlY6Q-1; Wed, 23 Dec 2020 13:51:36 -0500
X-MC-Unique: i7vV1pjBO--96Hcd9mlY6Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A70EC425C9;
 Wed, 23 Dec 2020 18:51:34 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-175.gru2.redhat.com
 [10.97.116.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 725DE5F9B8;
 Wed, 23 Dec 2020 18:51:03 +0000 (UTC)
Subject: Re: [PATCH] multi-process: Acceptance test for multiprocess QEMU
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>
References: <785772783205140e219b8bfe7f793305ee768f03.1608705805.git.elena.ufimtseva@oracle.com>
 <CAJ+F1C+D6zjN-exiJnevB_GB58xCPcP7TpCHHzYxWm7BvOi3dw@mail.gmail.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <984ba705-7de7-350e-ef4f-cd38c47ab6bb@redhat.com>
Date: Wed, 23 Dec 2020 15:51:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1C+D6zjN-exiJnevB_GB58xCPcP7TpCHHzYxWm7BvOi3dw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative;
 boundary="------------B29880A6049C49C145879F62"
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-2.521, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 Stefan Hajnoczi <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------B29880A6049C49C145879F62
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 12/23/20 8:01 AM, Marc-André Lureau wrote:
> Hi
>
> On Wed, Dec 23, 2020 at 10:45 AM <elena.ufimtseva@oracle.com 
> <mailto:elena.ufimtseva@oracle.com>> wrote:
>
>     From: Jagannathan Raman <jag.raman@oracle.com
>     <mailto:jag.raman@oracle.com>>
>
>     Runs the Avocado acceptance test to check if a
>     remote lsi53c895a device gets identified by the guest.
>
>     Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com
>     <mailto:elena.ufimtseva@oracle.com>>
>     Signed-off-by: John G Johnson <john.g.johnson@oracle.com
>     <mailto:john.g.johnson@oracle.com>>
>     Signed-off-by: Jagannathan Raman <jag.raman@oracle.com
>     <mailto:jag.raman@oracle.com>>
>     ---
>      tests/acceptance/multiprocess.py | 104
>     +++++++++++++++++++++++++++++++
>      1 file changed, 104 insertions(+)
>      create mode 100644 tests/acceptance/multiprocess.py
>
>     diff --git a/tests/acceptance/multiprocess.py
>     b/tests/acceptance/multiprocess.py
>     new file mode 100644
>     index 0000000000..d10b4d2c05
>     --- /dev/null
>     +++ b/tests/acceptance/multiprocess.py
>     @@ -0,0 +1,104 @@
>     +# Test for multiprocess qemu
>     +#
>     +# This work is licensed under the terms of the GNU GPL, version 2 or
>     +# later.  See the COPYING file in the top-level directory.
>     +
>     +
>     +from avocado_qemu import Test
>     +from avocado_qemu import wait_for_console_pattern
>     +from avocado_qemu import exec_command_and_wait_for_pattern
>     +
>     +from qemu.accel import kvm_available
>     +
>     +import os
>     +import socket
>     +
>     +ACCEL_NOT_AVAILABLE_FMT = "%s accelerator does not seem to be
>     available"
>     +KVM_NOT_AVAILABLE = ACCEL_NOT_AVAILABLE_FMT % "KVM"
>     +
>     +class Multiprocess(Test):
>     +    """
>     +    :avocado: tags=multiprocess
>     +    """
>     +    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
>     +
>     +    def wait_for_console_pattern(self, success_message, vm=None):
>     +        wait_for_console_pattern(self, success_message,
>     +                                 failure_message='Kernel panic -
>     not syncing',
>     +                                 vm=vm)
>     +
>     +    def do_test(self, kernel_url, initrd_url, kernel_command_line,
>     +                machine_type):
>     +        if not kvm_available(self.arch, self.qemu_bin):
>     +            self.cancel(KVM_NOT_AVAILABLE)
>     +
>     +        # Create socketpair to connect proxy and remote processes
>     +        proxy_sock, remote_sock = socket.socketpair(socket.AF_UNIX,
>     + socket.SOCK_STREAM)
>     +        os.set_inheritable(proxy_sock.fileno(), True)
>     +        os.set_inheritable(remote_sock.fileno(), True)
>     +
>     +        kernel_path = self.fetch_asset(kernel_url)
>     +        initrd_path = self.fetch_asset(initrd_url)
>     +
>     +        # Create remote process
>     +        remote_vm = self.get_vm()
>     +        remote_vm.add_args('-machine', 'x-remote')
>     +        remote_vm.add_args('-nodefaults')
>     +        remote_vm.add_args('-device', 'lsi53c895a,id=lsi1')
>     +        remote_vm.add_args('-object', 'x-remote-object,id=robj1,'
>     +  'devid=lsi1,fd='+str(remote_sock.fileno()))
>     +        remote_vm.launch()
>     +
>     +        # Create proxy process
>     +        self.vm.set_console()
>     +        self.vm.add_args('-machine', machine_type)
>     +        self.vm.add_args('-accel', 'kvm')
>     +        self.vm.add_args('-cpu', 'host')
>     +        self.vm.add_args("-object",
>     +  "memory-backend-memfd,id=sysmem-file,size=2G")
>     +        self.vm.add_args("--numa", "node,memdev=sysmem-file")
>     +        self.vm.add_args("-m", "2048")
>     +        self.vm.add_args('-kernel', kernel_path,
>     +                         '-initrd', initrd_path,
>     +                         '-append', kernel_command_line)
>     +        self.vm.add_args('-device',
>     +                         'x-pci-proxy-dev,'
>     +  'id=lsi1,fd='+str(proxy_sock.fileno()))
>     +        self.vm.launch()
>     +        self.wait_for_console_pattern("as init process")
>     +        exec_command_and_wait_for_pattern(self, "mount -t sysfs
>     sysfs /sys",
>     +                                          '', '')
>     +        exec_command_and_wait_for_pattern(self,
>     +                                          "cat
>     /sys/bus/pci/devices/*/uevent",
>     + "PCI_ID=1000:0012", '')
>     +
>     +    def test_multiprocess_x86_64(self):
>     +        """
>     +        :avocado: tags=arch:x86_64
>     +        """
>     +        kernel_url =
>     ('https://archives.fedoraproject.org/pub/archive/fedora
>     <https://archives.fedoraproject.org/pub/archive/fedora>'
>     + '/linux/releases/31/Everything/x86_64/os/images'
>     +                      '/pxeboot/vmlinuz')
>     +        initrd_url =
>     ('https://archives.fedoraproject.org/pub/archive/fedora
>     <https://archives.fedoraproject.org/pub/archive/fedora>'
>     + '/linux/releases/31/Everything/x86_64/os/images'
>     +                      '/pxeboot/initrd.img')
>     +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
>     +                               'console=ttyS0 rdinit=/bin/bash')
>     +        machine = 'pc'
>     +        self.do_test(kernel_url, initrd_url, kernel_command_line,
>     machine)
>     +
>     +    def test_multiprocess_aarch64(self):
>     +        """
>     +        :avocado: tags=arch:aarch64
>     +        """
>     +        kernel_url =
>     ('https://archives.fedoraproject.org/pub/archive/fedora
>     <https://archives.fedoraproject.org/pub/archive/fedora>'
>     + '/linux/releases/31/Everything/aarch64/os/images'
>     +                      '/pxeboot/vmlinuz')
>     +        initrd_url =
>     ('https://archives.fedoraproject.org/pub/archive/fedora
>     <https://archives.fedoraproject.org/pub/archive/fedora>'
>     + '/linux/releases/31/Everything/aarch64/os/images'
>     +                      '/pxeboot/initrd.img')
>     +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
>     +                               'rdinit=/bin/bash console=ttyAMA0')
>     +        machine_type = 'virt,gic-version=3'
>     +        self.do_test(kernel_url, initrd_url, kernel_command_line,
>     machine_type)
>     -- 
>     2.25.GIT
>
>
> The test looks quite nice, thanks. However, it times out for me. I 
> have very limited experience with avocado. Any idea?
>  (13/40) 
> tests/acceptance/multiprocess.py:Multiprocess.test_multiprocess_x86_64: 
> ERROR: timed out (211.81 s)

Perhaps the test is stuck somewhere and it hits the default Avocado 
timeout. You can look at the test logs at:

<BUILD_DIR>/tests/results/latest/test-results/13-tests_acceptance_multiprocess.py_Multiprocess.test_multiprocess_x86_64/debug.log

If you feel that the test needs more time to finish then you can 
increase the timeout in the code:

$ git diff
diff --git a/tests/acceptance/multiprocess.py 
b/tests/acceptance/multiprocess.py
index d10b4d2c05..83d97079af 100644
--- a/tests/acceptance/multiprocess.py
+++ b/tests/acceptance/multiprocess.py
@@ -22,6 +22,8 @@ class Multiprocess(Test):
      """
      KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '

+    timeout = 300
+
      def wait_for_console_pattern(self, success_message, vm=None):
          wait_for_console_pattern(self, success_message,
                                   failure_message='Kernel panic - not 
syncing',


For the records, it raw successful on my machine:

(13/40) 
tests/acceptance/multiprocess.py:Multiprocess.test_multiprocess_x86_64: 
PASS (58.87 s)


>
>
> -- 
> Marc-André Lureau

--------------B29880A6049C49C145879F62
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <div class="moz-cite-prefix">On 12/23/20 8:01 AM, Marc-André Lureau
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJ+F1C+D6zjN-exiJnevB_GB58xCPcP7TpCHHzYxWm7BvOi3dw@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">Hi<br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Wed, Dec 23, 2020 at
            10:45 AM &lt;<a href="mailto:elena.ufimtseva@oracle.com"
              moz-do-not-send="true">elena.ufimtseva@oracle.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">From: Jagannathan Raman
            &lt;<a href="mailto:jag.raman@oracle.com" target="_blank"
              moz-do-not-send="true">jag.raman@oracle.com</a>&gt;<br>
            <br>
            Runs the Avocado acceptance test to check if a<br>
            remote lsi53c895a device gets identified by the guest.<br>
            <br>
            Signed-off-by: Elena Ufimtseva &lt;<a
              href="mailto:elena.ufimtseva@oracle.com" target="_blank"
              moz-do-not-send="true">elena.ufimtseva@oracle.com</a>&gt;<br>
            Signed-off-by: John G Johnson &lt;<a
              href="mailto:john.g.johnson@oracle.com" target="_blank"
              moz-do-not-send="true">john.g.johnson@oracle.com</a>&gt;<br>
            Signed-off-by: Jagannathan Raman &lt;<a
              href="mailto:jag.raman@oracle.com" target="_blank"
              moz-do-not-send="true">jag.raman@oracle.com</a>&gt;<br>
            ---<br>
             tests/acceptance/multiprocess.py | 104
            +++++++++++++++++++++++++++++++<br>
             1 file changed, 104 insertions(+)<br>
             create mode 100644 tests/acceptance/multiprocess.py<br>
            <br>
            diff --git a/tests/acceptance/multiprocess.py
            b/tests/acceptance/multiprocess.py<br>
            new file mode 100644<br>
            index 0000000000..d10b4d2c05<br>
            --- /dev/null<br>
            +++ b/tests/acceptance/multiprocess.py<br>
            @@ -0,0 +1,104 @@<br>
            +# Test for multiprocess qemu<br>
            +#<br>
            +# This work is licensed under the terms of the GNU GPL,
            version 2 or<br>
            +# later.  See the COPYING file in the top-level directory.<br>
            +<br>
            +<br>
            +from avocado_qemu import Test<br>
            +from avocado_qemu import wait_for_console_pattern<br>
            +from avocado_qemu import exec_command_and_wait_for_pattern<br>
            +<br>
            +from qemu.accel import kvm_available<br>
            +<br>
            +import os<br>
            +import socket<br>
            +<br>
            +ACCEL_NOT_AVAILABLE_FMT = "%s accelerator does not seem to
            be available"<br>
            +KVM_NOT_AVAILABLE = ACCEL_NOT_AVAILABLE_FMT % "KVM"<br>
            +<br>
            +class Multiprocess(Test):<br>
            +    """<br>
            +    :avocado: tags=multiprocess<br>
            +    """<br>
            +    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '<br>
            +<br>
            +    def wait_for_console_pattern(self, success_message,
            vm=None):<br>
            +        wait_for_console_pattern(self, success_message,<br>
            +                                 failure_message='Kernel
            panic - not syncing',<br>
            +                                 vm=vm)<br>
            +<br>
            +    def do_test(self, kernel_url, initrd_url,
            kernel_command_line,<br>
            +                machine_type):<br>
            +        if not kvm_available(self.arch, self.qemu_bin):<br>
            +            self.cancel(KVM_NOT_AVAILABLE)<br>
            +<br>
            +        # Create socketpair to connect proxy and remote
            processes<br>
            +        proxy_sock, remote_sock =
            socket.socketpair(socket.AF_UNIX,<br>
            +                                                   
            socket.SOCK_STREAM)<br>
            +        os.set_inheritable(proxy_sock.fileno(), True)<br>
            +        os.set_inheritable(remote_sock.fileno(), True)<br>
            +<br>
            +        kernel_path = self.fetch_asset(kernel_url)<br>
            +        initrd_path = self.fetch_asset(initrd_url)<br>
            +<br>
            +        # Create remote process<br>
            +        remote_vm = self.get_vm()<br>
            +        remote_vm.add_args('-machine', 'x-remote')<br>
            +        remote_vm.add_args('-nodefaults')<br>
            +        remote_vm.add_args('-device', 'lsi53c895a,id=lsi1')<br>
            +        remote_vm.add_args('-object',
            'x-remote-object,id=robj1,'<br>
            +                         
             'devid=lsi1,fd='+str(remote_sock.fileno()))<br>
            +        remote_vm.launch()<br>
            +<br>
            +        # Create proxy process<br>
            +        self.vm.set_console()<br>
            +        self.vm.add_args('-machine', machine_type)<br>
            +        self.vm.add_args('-accel', 'kvm')<br>
            +        self.vm.add_args('-cpu', 'host')<br>
            +        self.vm.add_args("-object",<br>
            +                       
             "memory-backend-memfd,id=sysmem-file,size=2G")<br>
            +        self.vm.add_args("--numa",
            "node,memdev=sysmem-file")<br>
            +        self.vm.add_args("-m", "2048")<br>
            +        self.vm.add_args('-kernel', kernel_path,<br>
            +                         '-initrd', initrd_path,<br>
            +                         '-append', kernel_command_line)<br>
            +        self.vm.add_args('-device',<br>
            +                         'x-pci-proxy-dev,'<br>
            +                       
             'id=lsi1,fd='+str(proxy_sock.fileno()))<br>
            +        self.vm.launch()<br>
            +        self.wait_for_console_pattern("as init process")<br>
            +        exec_command_and_wait_for_pattern(self, "mount -t
            sysfs sysfs /sys",<br>
            +                                          '', '')<br>
            +        exec_command_and_wait_for_pattern(self,<br>
            +                                          "cat
            /sys/bus/pci/devices/*/uevent",<br>
            +                                         
            "PCI_ID=1000:0012", '')<br>
            +<br>
            +    def test_multiprocess_x86_64(self):<br>
            +        """<br>
            +        :avocado: tags=arch:x86_64<br>
            +        """<br>
            +        kernel_url = ('<a
              href="https://archives.fedoraproject.org/pub/archive/fedora"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://archives.fedoraproject.org/pub/archive/fedora</a>'<br>
            +                     
            '/linux/releases/31/Everything/x86_64/os/images'<br>
            +                      '/pxeboot/vmlinuz')<br>
            +        initrd_url = ('<a
              href="https://archives.fedoraproject.org/pub/archive/fedora"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://archives.fedoraproject.org/pub/archive/fedora</a>'<br>
            +                     
            '/linux/releases/31/Everything/x86_64/os/images'<br>
            +                      '/pxeboot/initrd.img')<br>
            +        kernel_command_line =
            (self.KERNEL_COMMON_COMMAND_LINE +<br>
            +                               'console=ttyS0
            rdinit=/bin/bash')<br>
            +        machine = 'pc'<br>
            +        self.do_test(kernel_url, initrd_url,
            kernel_command_line, machine)<br>
            +<br>
            +    def test_multiprocess_aarch64(self):<br>
            +        """<br>
            +        :avocado: tags=arch:aarch64<br>
            +        """<br>
            +        kernel_url = ('<a
              href="https://archives.fedoraproject.org/pub/archive/fedora"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://archives.fedoraproject.org/pub/archive/fedora</a>'<br>
            +                     
            '/linux/releases/31/Everything/aarch64/os/images'<br>
            +                      '/pxeboot/vmlinuz')<br>
            +        initrd_url = ('<a
              href="https://archives.fedoraproject.org/pub/archive/fedora"
              rel="noreferrer" target="_blank" moz-do-not-send="true">https://archives.fedoraproject.org/pub/archive/fedora</a>'<br>
            +                     
            '/linux/releases/31/Everything/aarch64/os/images'<br>
            +                      '/pxeboot/initrd.img')<br>
            +        kernel_command_line =
            (self.KERNEL_COMMON_COMMAND_LINE +<br>
            +                               'rdinit=/bin/bash
            console=ttyAMA0')<br>
            +        machine_type = 'virt,gic-version=3'<br>
            +        self.do_test(kernel_url, initrd_url,
            kernel_command_line, machine_type)<br>
            -- <br>
            2.25.GIT<br>
            <br>
          </blockquote>
        </div>
        <div><br>
        </div>
        <div>The test looks quite nice, thanks. However, it times out
          for me. I have very limited experience with avocado. Any idea?<br>
        </div>
        <div> (13/40)
          tests/acceptance/multiprocess.py:Multiprocess.test_multiprocess_x86_64:
          ERROR: timed out (211.81 s)</div>
      </div>
    </blockquote>
    <p>Perhaps the test is stuck somewhere and it hits the default
      Avocado timeout. You can look at the test logs at:<br>
    </p>
    <p>&lt;BUILD_DIR&gt;/tests/results/latest/test-results/13-tests_acceptance_multiprocess.py_Multiprocess.test_multiprocess_x86_64/debug.log<br>
    </p>
    <p>If you feel that the test needs more time to finish then you can
      increase the timeout in the code:<br>
    </p>
    <p>$ git diff<br>
      diff --git a/tests/acceptance/multiprocess.py
      b/tests/acceptance/multiprocess.py<br>
      index d10b4d2c05..83d97079af 100644<br>
      --- a/tests/acceptance/multiprocess.py<br>
      +++ b/tests/acceptance/multiprocess.py<br>
      @@ -22,6 +22,8 @@ class Multiprocess(Test):<br>
           """<br>
           KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '<br>
       <br>
      +    timeout = 300<br>
      +<br>
           def wait_for_console_pattern(self, success_message, vm=None):<br>
               wait_for_console_pattern(self, success_message,<br>
                                        failure_message='Kernel panic -
      not syncing',<br>
    </p>
    <p><br>
    </p>
    <p>For the records, it raw successful on my machine:</p>
    <p>(13/40)
      tests/acceptance/multiprocess.py:Multiprocess.test_multiprocess_x86_64:
      PASS (58.87 s)<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CAJ+F1C+D6zjN-exiJnevB_GB58xCPcP7TpCHHzYxWm7BvOi3dw@mail.gmail.com">
      <div dir="ltr"><br clear="all">
        <br>
        -- <br>
        <div dir="ltr" class="gmail_signature">Marc-André Lureau<br>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------B29880A6049C49C145879F62--


