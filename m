Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E62E2CEFCA
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 15:39:34 +0100 (CET)
Received: from localhost ([::1]:37748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klCFB-0000ta-NG
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 09:39:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1klCDq-0000Tl-9e
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 09:38:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1klCDk-0008U4-PG
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 09:38:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607092683;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=fHXIkn7MZHfHowV2+/t0h48tUWj7TVmo3AWUafwztMo=;
 b=hUFT7TbNSJ9uGE2NmRxoruYgDl8ScG4EqxRQa9vVSlCLooblBkVbFmq7xEhJBWwbdONEjk
 1VkuL94QBB0OlPo4JX4XQMs/rA9kjlRMVF53w/8K+/zdJXV5MYP/k5TzS4ku/8q71qXELl
 S6oMXFmH7K7ggaZyC9qhGUQAX/VKWZk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-vCUVoozkO12nfvfL-AhZYg-1; Fri, 04 Dec 2020 09:38:01 -0500
X-MC-Unique: vCUVoozkO12nfvfL-AhZYg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD0E2185E484;
 Fri,  4 Dec 2020 14:37:57 +0000 (UTC)
Received: from redhat.com (ovpn-115-10.ams2.redhat.com [10.36.115.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A631360C69;
 Fri,  4 Dec 2020 14:37:38 +0000 (UTC)
Date: Fri, 4 Dec 2020 14:37:35 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v12 02/19] multi-process: add configure and usage
 information
Message-ID: <20201204143735.GN3056135@redhat.com>
References: <cover.1606853298.git.jag.raman@oracle.com>
 <cc6c74cba091d2735f0dbcba4b5fa28d8a780908.1606853298.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <cc6c74cba091d2735f0dbcba4b5fa28d8a780908.1606853298.git.jag.raman@oracle.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 rth@twiddle.net, kwolf@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 01, 2020 at 03:22:37PM -0500, Jagannathan Raman wrote:
> From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> 
> Adds documentation explaining the command-line arguments needed
> to use multi-process. Also adds a python script that illustrates the
> usage.
> 
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  docs/multi-process.rst                        | 66 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  tests/multiprocess/multiprocess-lsi53c895a.py | 92 +++++++++++++++++++++++++++
>  3 files changed, 159 insertions(+)
>  create mode 100644 docs/multi-process.rst
>  create mode 100755 tests/multiprocess/multiprocess-lsi53c895a.py


> diff --git a/tests/multiprocess/multiprocess-lsi53c895a.py b/tests/multiprocess/multiprocess-lsi53c895a.py
> new file mode 100755
> index 0000000..bfe4f66
> --- /dev/null
> +++ b/tests/multiprocess/multiprocess-lsi53c895a.py
> @@ -0,0 +1,92 @@
> +#!/usr/bin/env python3
> +
> +import urllib.request
> +import subprocess
> +import argparse
> +import socket
> +import sys
> +import os
> +
> +arch = os.uname()[4]
> +proc_path = os.path.join(os.getcwd(), '..', '..', 'build', arch+'-softmmu',
> +                         'qemu-system-'+arch)
> +
> +parser = argparse.ArgumentParser(description='Launcher for multi-process QEMU')
> +parser.add_argument('--bin', required=False, help='location of QEMU binary',
> +                    metavar='bin');
> +args = parser.parse_args()
> +
> +if args.bin is not None:
> +    proc_path = args.bin
> +
> +if not os.path.isfile(proc_path):
> +    sys.exit('QEMU binary not found')
> +
> +kernel_path = os.path.join(os.getcwd(), 'vmlinuz')
> +initrd_path = os.path.join(os.getcwd(), 'initrd')
> +
> +proxy_cmd = [ proc_path,                                                    \
> +              '-name', 'Fedora', '-smp', '4', '-m', '2048', '-cpu', 'host', \

I wonder if setting 2 GB of RAM is too large for something that runs by
default as a test.

> +              '-object', 'memory-backend-memfd,id=sysmem-file,size=2G',     \
> +              '-numa', 'node,memdev=sysmem-file',                           \
> +              '-kernel', kernel_path, '-initrd', initrd_path,               \
> +              '-vnc', ':0',                                                 \
> +              '-monitor', 'unix:/home/qemu-sock,server,nowait',             \
> +            ]
> +
> +if arch == 'x86_64':
> +    print('Downloading images for arch x86_64')
> +    kernel_url = 'https://dl.fedoraproject.org/pub/fedora/linux/'    \
> +                 'releases/33/Everything/x86_64/os/images/'          \
> +                 'pxeboot/vmlinuz'
> +    initrd_url = 'https://dl.fedoraproject.org/pub/fedora/linux/'    \
> +                 'releases/33/Everything/x86_64/os/images/'          \
> +                 'pxeboot/initrd.img'
> +    proxy_cmd.append('-machine')
> +    proxy_cmd.append('pc,accel=kvm')
> +    proxy_cmd.append('-append')
> +    proxy_cmd.append('rdinit=/bin/bash console=ttyS0 console=tty0')
> +elif arch == 'aarch64':
> +    print('Downloading images for arch aarch64')
> +    kernel_url = 'https://dl.fedoraproject.org/pub/fedora/linux/'    \
> +                 'releases/33/Everything/aarch64/os/images/'         \
> +                 'pxeboot/vmlinuz'
> +    initrd_url = 'https://dl.fedoraproject.org/pub/fedora/linux/'    \
> +                 'releases/33/Everything/aarch64/os/images/'         \
> +                 'pxeboot/initrd.img'
> +    proxy_cmd.append('-machine')
> +    proxy_cmd.append('virt,gic-version=3')
> +    proxy_cmd.append('-accel')
> +    proxy_cmd.append('kvm')
> +    proxy_cmd.append('-append')
> +    proxy_cmd.append('rdinit=/bin/bash')
> +else:
> +    sys.exit('Arch %s not tested' % arch)

It doens't look like you really need a full OS here. Rather than
downloading the fairly large Fedora images, I'd suggest just using
the kernel that exists on the host OS already in /boot, and then
building a tiny initrd that contains just a static linked busybox.

I have this helper script that could be imported into QEMU for
this purpose:

  https://gitlab.com/berrange/tiny-vm-tools/-/blob/master/make-tiny-image.py

And just skip the test if busybox doesn't exist, or if the vmlinux
in /boot isn't accessible (Debian restricts it to root only IIRC)

> +
> +urllib.request.urlretrieve(kernel_url, kernel_path)
> +urllib.request.urlretrieve(initrd_url, initrd_path)
> +
> +proxy, remote = socket.socketpair(socket.AF_UNIX, socket.SOCK_STREAM)
> +
> +proxy_cmd.append('-device')
> +proxy_cmd.append('x-pci-proxy-dev,id=lsi1,fd='+str(proxy.fileno()))
> +
> +remote_cmd = [ proc_path,                                                      \
> +               '-machine', 'x-remote',                                         \
> +               '-device', 'lsi53c895a,id=lsi1',                                \
> +               '-object',                                                      \
> +               'x-remote-object,id=robj1,devid=lsi1,fd='+str(remote.fileno()), \
> +               '-display', 'none',                                             \
> +               '-monitor', 'unix:/home/rem-sock,server,nowait',                \
> +             ]
> +
> +pid = os.fork();
> +
> +if pid:
> +    # In Proxy
> +    print('Launching QEMU with Proxy object');
> +    process = subprocess.Popen(proxy_cmd, pass_fds=[proxy.fileno()])
> +else:
> +    # In remote
> +    print('Launching Remote process');
> +    process = subprocess.Popen(remote_cmd, pass_fds=[remote.fileno(), 0, 1, 2])

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


