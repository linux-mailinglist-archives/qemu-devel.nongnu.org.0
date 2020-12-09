Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8313A2D46A7
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 17:24:33 +0100 (CET)
Received: from localhost ([::1]:60910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn2GW-0003Lf-Il
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 11:24:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kn2DE-00011o-TM
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 11:21:09 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:42024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kn2DB-0003Eb-NO
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 11:21:08 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B9G9MFU083784;
 Wed, 9 Dec 2020 16:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=26vVnEcFO4uuplk1QdymuuoUv3oXWlDIVizUeXbiQ6A=;
 b=UxzBqLwjM+ageDOf0V94Pc/Mma4OShRp02tvvP+qrrG+KeyLoFVaIcufzLduf+GDvaOk
 mylYruer+drMfPaqiTPm64ULTMguKGlm8ocSyUPOefp8xOC2QIwYENbWLEa7pGj5YDwj
 4vNpibQBa8nTF5TuATOZ85FF6/jsAjZBIGuRqHeRhQvHJeym2llX+uwMoRV6wWC4ulai
 Rsx/UYzvPHV/Idkm/vC8gIqC+X9M3xp4mFbPj38ldaOO5uiktFzsjrxNZCKTHSlCeUKu
 SEig17iLMJGV78xvoFibCrMy2TLTGNK5QxXDoSeokKp4PaQsNKgYmJ8uYUz7Q0rUqthN LA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 357yqc14m1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 09 Dec 2020 16:20:54 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B9GKqSh097173;
 Wed, 9 Dec 2020 16:20:53 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 358ksqayka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Dec 2020 16:20:53 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B9GKkMW017380;
 Wed, 9 Dec 2020 16:20:46 GMT
Received: from [192.168.0.3] (/24.147.50.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 09 Dec 2020 08:20:45 -0800
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH v12 02/19] multi-process: add configure and usage
 information
From: Jag Raman <jag.raman@oracle.com>
In-Reply-To: <20201204143735.GN3056135@redhat.com>
Date: Wed, 9 Dec 2020 11:20:42 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <D912DE81-0407-451F-9829-3FDD2B0D44C0@oracle.com>
References: <cover.1606853298.git.jag.raman@oracle.com>
 <cc6c74cba091d2735f0dbcba4b5fa28d8a780908.1606853298.git.jag.raman@oracle.com>
 <20201204143735.GN3056135@redhat.com>
To: =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090114
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090113
Received-SPF: pass client-ip=141.146.126.79; envelope-from=jag.raman@oracle.com;
 helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 kraxel@redhat.com, quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 rth@twiddle.net, kwolf@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Dec 4, 2020, at 9:37 AM, Daniel P. Berrang=C3=A9 =
<berrange@redhat.com> wrote:
>=20
> On Tue, Dec 01, 2020 at 03:22:37PM -0500, Jagannathan Raman wrote:
>> From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>>=20
>> Adds documentation explaining the command-line arguments needed
>> to use multi-process. Also adds a python script that illustrates the
>> usage.
>>=20
>> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
>> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>> docs/multi-process.rst                        | 66 =
+++++++++++++++++++
>> MAINTAINERS                                   |  1 +
>> tests/multiprocess/multiprocess-lsi53c895a.py | 92 =
+++++++++++++++++++++++++++
>> 3 files changed, 159 insertions(+)
>> create mode 100644 docs/multi-process.rst
>> create mode 100755 tests/multiprocess/multiprocess-lsi53c895a.py
>=20
>=20
>> diff --git a/tests/multiprocess/multiprocess-lsi53c895a.py =
b/tests/multiprocess/multiprocess-lsi53c895a.py
>> new file mode 100755
>> index 0000000..bfe4f66
>> --- /dev/null
>> +++ b/tests/multiprocess/multiprocess-lsi53c895a.py
>> @@ -0,0 +1,92 @@
>> +#!/usr/bin/env python3
>> +
>> +import urllib.request
>> +import subprocess
>> +import argparse
>> +import socket
>> +import sys
>> +import os
>> +
>> +arch =3D os.uname()[4]
>> +proc_path =3D os.path.join(os.getcwd(), '..', '..', 'build', =
arch+'-softmmu',
>> +                         'qemu-system-'+arch)
>> +
>> +parser =3D argparse.ArgumentParser(description=3D'Launcher for =
multi-process QEMU')
>> +parser.add_argument('--bin', required=3DFalse, help=3D'location of =
QEMU binary',
>> +                    metavar=3D'bin');
>> +args =3D parser.parse_args()
>> +
>> +if args.bin is not None:
>> +    proc_path =3D args.bin
>> +
>> +if not os.path.isfile(proc_path):
>> +    sys.exit('QEMU binary not found')
>> +
>> +kernel_path =3D os.path.join(os.getcwd(), 'vmlinuz')
>> +initrd_path =3D os.path.join(os.getcwd(), 'initrd')
>> +
>> +proxy_cmd =3D [ proc_path,                                           =
         \
>> +              '-name', 'Fedora', '-smp', '4', '-m', '2048', '-cpu', =
'host', \
>=20
> I wonder if setting 2 GB of RAM is too large for something that runs =
by
> default as a test.
>=20
>> +              '-object', =
'memory-backend-memfd,id=3Dsysmem-file,size=3D2G',     \
>> +              '-numa', 'node,memdev=3Dsysmem-file',                  =
         \
>> +              '-kernel', kernel_path, '-initrd', initrd_path,        =
       \
>> +              '-vnc', ':0',                                          =
       \
>> +              '-monitor', 'unix:/home/qemu-sock,server,nowait',      =
       \
>> +            ]
>> +
>> +if arch =3D=3D 'x86_64':
>> +    print('Downloading images for arch x86_64')
>> +    kernel_url =3D 'https://dl.fedoraproject.org/pub/fedora/linux/'  =
  \
>> +                 'releases/33/Everything/x86_64/os/images/'          =
\
>> +                 'pxeboot/vmlinuz'
>> +    initrd_url =3D 'https://dl.fedoraproject.org/pub/fedora/linux/'  =
  \
>> +                 'releases/33/Everything/x86_64/os/images/'          =
\
>> +                 'pxeboot/initrd.img'
>> +    proxy_cmd.append('-machine')
>> +    proxy_cmd.append('pc,accel=3Dkvm')
>> +    proxy_cmd.append('-append')
>> +    proxy_cmd.append('rdinit=3D/bin/bash console=3DttyS0 =
console=3Dtty0')
>> +elif arch =3D=3D 'aarch64':
>> +    print('Downloading images for arch aarch64')
>> +    kernel_url =3D 'https://dl.fedoraproject.org/pub/fedora/linux/'  =
  \
>> +                 'releases/33/Everything/aarch64/os/images/'         =
\
>> +                 'pxeboot/vmlinuz'
>> +    initrd_url =3D 'https://dl.fedoraproject.org/pub/fedora/linux/'  =
  \
>> +                 'releases/33/Everything/aarch64/os/images/'         =
\
>> +                 'pxeboot/initrd.img'
>> +    proxy_cmd.append('-machine')
>> +    proxy_cmd.append('virt,gic-version=3D3')
>> +    proxy_cmd.append('-accel')
>> +    proxy_cmd.append('kvm')
>> +    proxy_cmd.append('-append')
>> +    proxy_cmd.append('rdinit=3D/bin/bash')
>> +else:
>> +    sys.exit('Arch %s not tested' % arch)
>=20
> It doens't look like you really need a full OS here. Rather than
> downloading the fairly large Fedora images, I'd suggest just using
> the kernel that exists on the host OS already in /boot, and then
> building a tiny initrd that contains just a static linked busybox.
>=20
> I have this helper script that could be imported into QEMU for
> this purpose:
>=20
>  =
https://gitlab.com/berrange/tiny-vm-tools/-/blob/master/make-tiny-image.py=


Hi Daniel,

That=E2=80=99s a nifty script. I was trying to do something similar. =
Thank you for sharing!

=E2=80=94
Jag

>=20
> And just skip the test if busybox doesn't exist, or if the vmlinux
> in /boot isn't accessible (Debian restricts it to root only IIRC)
>=20
>> +
>> +urllib.request.urlretrieve(kernel_url, kernel_path)
>> +urllib.request.urlretrieve(initrd_url, initrd_path)
>> +
>> +proxy, remote =3D socket.socketpair(socket.AF_UNIX, =
socket.SOCK_STREAM)
>> +
>> +proxy_cmd.append('-device')
>> +proxy_cmd.append('x-pci-proxy-dev,id=3Dlsi1,fd=3D'+str(proxy.fileno())=
)
>> +
>> +remote_cmd =3D [ proc_path,                                          =
            \
>> +               '-machine', 'x-remote',                               =
          \
>> +               '-device', 'lsi53c895a,id=3Dlsi1',                    =
            \
>> +               '-object',                                            =
          \
>> +               =
'x-remote-object,id=3Drobj1,devid=3Dlsi1,fd=3D'+str(remote.fileno()), \
>> +               '-display', 'none',                                   =
          \
>> +               '-monitor', 'unix:/home/rem-sock,server,nowait',      =
          \
>> +             ]
>> +
>> +pid =3D os.fork();
>> +
>> +if pid:
>> +    # In Proxy
>> +    print('Launching QEMU with Proxy object');
>> +    process =3D subprocess.Popen(proxy_cmd, =
pass_fds=3D[proxy.fileno()])
>> +else:
>> +    # In remote
>> +    print('Launching Remote process');
>> +    process =3D subprocess.Popen(remote_cmd, =
pass_fds=3D[remote.fileno(), 0, 1, 2])
>=20
> Regards,
> Daniel
> --=20
> |: https://berrange.com      -o-    =
https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            =
https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    =
https://www.instagram.com/dberrange :|
>=20
>=20


