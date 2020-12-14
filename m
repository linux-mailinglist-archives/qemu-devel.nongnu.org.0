Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DE32DA465
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 00:50:49 +0100 (CET)
Received: from localhost ([::1]:53460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koxc8-000272-DX
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 18:50:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1koxas-0001gB-Nd
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 18:49:30 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:33218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1koxap-0000Sg-Qw
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 18:49:30 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BENhvXR128640;
 Mon, 14 Dec 2020 23:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=PRm/3Yu37Tv+czEokXWY3L1HrO4eBTBd1ZGLsPLnmxs=;
 b=nAzYDfDEifzDWwqE9tlIL+smVaikpj3SnqpJm3fxn4qR4AGhAlhHpsDZcrDSXc8O+PLs
 ev3Lgl4YVUowO/vKC6iVVZneyvPyWCD0w1hoXvE8tsfiizU55zMJHlA+9u6efb+X26gd
 1oJG4M/5gwdX+1IdCRPkYAzFnRkUlmSs8m0+EPhk9ix66Igd6PcSA22DX5sIoIYSSHPT
 o+yqbPYT0XglOm26LLroFwln2TMbpgAFq9DBvzppjgPKQQymP+gbAYZx7XYMsA/AvF9A
 /ZOoU7yO5XUyuQi8pPiMw4BzcU4zk60D16JddYhxlTUxNnoueYhK9SN57Y5UaC20V6za 3g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 35ckcb8684-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 14 Dec 2020 23:49:18 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BENf9Zv190255;
 Mon, 14 Dec 2020 23:49:18 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 35d7em5frs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Dec 2020 23:49:17 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BENnFkD022474;
 Mon, 14 Dec 2020 23:49:15 GMT
Received: from dhcp-10-39-213-39.vpn.oracle.com (/10.39.213.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 14 Dec 2020 15:49:07 -0800
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH v13 00/19] Initial support for multi-process Qemu
From: Jag Raman <jag.raman@oracle.com>
In-Reply-To: <cover.1607922214.git.jag.raman@oracle.com>
Date: Mon, 14 Dec 2020 18:49:03 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <41C1BC40-0961-45AD-8994-18629612E8C2@oracle.com>
References: <cover.1607922214.git.jag.raman@oracle.com>
To: QEMU <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9835
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012140157
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9835
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012140157
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 swapnil.ingle@nutanix.com, John G Johnson <john.g.johnson@oracle.com>,
 Gerd Hoffmann <kraxel@redhat.com>, quintela@redhat.com, mst@redhat.com,
 armbru@redhat.com, kanth.ghatraju@oracle.com, felipe@nutanix.com,
 thuth@redhat.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 dgilbert@redhat.com, alex.williamson@redhat.com, stefanha@redhat.com,
 thanos.makatos@nutanix.com, kwolf@redhat.com, berrange@redhat.com,
 mreitz@redhat.com, ross.lagerwall@citrix.com, marcandre.lureau@gmail.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

In this series, we have incorporated the changes Marc-Andre proposed to
improve the code in v12. Following is a changelog that outlines the
differences between v12 and v13.

CHANGELOG:
--------------------

[PATCH v13 02/19] multi-process: add configure and usage information
  - Dropped =E2=80=9Ctests/multiprocess/multiprocess-lsi53c895a.py=E2=80=9D=
 based on
    feedback. We are working on acceptance tests instead.

[PATCH v13 03/19] memory: alloc RAM from file at offset
  - Changed the name of argument =E2=80=9Cstart=E2=80=9D to =
=E2=80=9Cmap_offset=E2=80=9D

[PATCH v13 05/19] multi-process: setup PCI host bridge for remote device
  - Renamed MULTIPROCESS_HOST as REMOTE_PCIHOST
  - Also renamed TYPE_REMOTE_HOST_DEVICE and
    REMOTE_HOST_DEVICE as TYPE_REMOTE_PCIHOST and
    REMOTE_PCIHOST respectively

[PATCH v13 06/19] multi-process: setup a machine object for remote =
device
                  process
  - Renamed =E2=80=9Cremote-device=E2=80=9D as =E2=80=9Cremote-pcihost=E2=80=
=9D
  - Set a description for the machine class

[PATCH v13 07/19] multi-process: add qio channel function to transmit =
data
                  and fds
  - Refactored qio_channel_writev_all() and =
qio_channel_writev_full_all()
    to avoid logic duplication

[PATCH v13 08/19] multi-process: define MPQemuMsg format and =
transmission
                  functions
  - Introduced qemu_in_iothread() helper function
  - Using ERRP_GUARD to handle input errp parameter
  - Addressed redundant typecasts to =E2=80=9Cvoid=E2=80=9D
  - mpqemu_msg_send() and mpqemu_msg_send() returns true/false to
    indicate success/failure
  - Added a comment to explain that the messaging protocol used would =
eventually
    be replaced by vfio-user
  - Prefixed the command enums with =E2=80=9CMPQEMU_CMD_=E2=80=9D.
  - Skip calling mpqemu_read() if msg->size is zero.

[PATCH v13 09/19] multi-process: Initialize message handler in remote =
device
  - Check for NULL IOChannel converted to an assert, and moved outside =
for loop
  - Moved error handling outside for loop
  - Shutdown with SHUTDOWN_CAUSE_HOST_ERROR with error in case of =
failure
  - Moved exit condition into the for loop statement

[PATCH v13 10/19] multi-process: Associate fd of a PCIDevice with its =
object
  - Removed a separate header file and merged it into the =E2=80=9C.c=E2=80=
=9D file
  - Replaced Object properties with Object Class properties
  - Accept the file descriptor as an integer property, and check if it =
is a
    valid socket using fd_is_socket()
  - Replaced runtime/dynamic property with a DeviceListener
  - Added a comment to explain the temporary limitation for one device =
per
    remote process

[PATCH v13 11/19] multi-process: setup memory manager for remote device
  - Dropped the calls to memory_region_transaction_begin() and
    memory_region_transaction_commit()
  - Using ERRP_GUARD to handle input errp parameter
  - Using g_autofree to automatically allocate the =E2=80=9Cname=E2=80=9D =
variable
  - Moved RET_MSG command definition to the patch that starts to use it

[PATCH v13 12/19] multi-process: introduce proxy object
  - device class property is defined just above the class_init function
  - Using ERRP_GUARD to handle input errp parameter
  - Check if IOChannel is NULL before closing in the exit function, to =
avoid
    crash
  - Early return if fd is not set
  - dev->migration_blocker is free=E2=80=99d by the exit function alone

[PATCH v13 13/19] multi-process: add proxy communication functions
  - Asset that mpqemu_msg_send_and_await_reply() thread is not in =
co-routine
    context
  - Using ERRP_GUARD to handle input errp parameter

[PATCH v13 14/19] multi-process: Forward PCI config space acceses to the
                  remote process
  - process_config_write() & process_config_read() take an Error** =
argument to
    return error
  - Use FMT_pid to format messages with PID
  - Use error_prepend to avoid leak of Error*
  - Check if return value from remote indicates failure in =
config_op_send()
  - Dropped typecasting return values of config_op_send to void as =
it=E2=80=99s not
    necessary

[PATCH v13 16/19] multi-process: Synchronize remote memory
  - Renamed RemoteMemSync as ProxyMemoryListener
  - Prefixed all related functions with =E2=80=9Cproxy_memory_listener_=E2=
=80=9D for consistency
  - Simplify logic in proxy_mrs_can_merge() to return efficiently and =
avoid
    unnecessary definition of local variable.

[PATCH v13 17/19] multi-process: create IOHUB object to handle irq
  - Replace calls to qemu_mutex_lock() and qemu_mutex_unlock() with
    QEMU_LOCK_GUARD

Thank you very much!

> On Dec 14, 2020, at 12:14 AM, Jagannathan Raman <jag.raman@oracle.com> =
wrote:
>=20
> Hello,
>=20
> This is the v13 of the patchset. Thank you very much for reviewing v12 =
and
> sharing your feedback.
>=20
> We have addressed all the comments from the v12 review except for the
> following two items, which we will be addressing in subsequent =
patches:
> - Prefix log messages with PID in the logging subsystem.
> - Refactor vfio-user and multi-process code to avoid logic =
duplication.
>=20
> To touch upon the history of this project, we posted the Proof Of =
Concept
> patches before the BoF session in 2018. Subsequently, we have posted =
12
> versions on the qemu-devel mailing list. You can find them by =
following the
> links below ([1] - [12]). Following people contributed to the design =
and
> implementation of this project:
> Jagannathan Raman <jag.raman@oracle.com>
> Elena Ufimtseva <elena.ufimtseva@oracle.com>
> John G Johnson <john.g.johnson@oracle.com>
> Stefan Hajnoczi <stefanha@redhat.com>
> Konrad Wilk <konrad.wilk@oracle.com>
> Kanth Ghatraju <kanth.ghatraju@oracle.com>
>=20
> We would like to thank the QEMU community for your feedback in the
> design and implementation of this project. Qemu wiki page:
> https://wiki.qemu.org/Features/MultiProcessQEMU
>=20
> For the full concept writeup about QEMU multi-process, please
> refer to docs/devel/qemu-multiprocess.rst. Also, see
> docs/qemu-multiprocess.txt for usage information.
>=20
> We have retained Stefan's "Reviewed-by" in the commit messages. Thank =
you
> very much for your time in reviewing these patches!
>=20
> [POC]: =
https://www.mail-archive.com/qemu-devel@nongnu.org/msg566538.html
> [1]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg602285.html
> [2]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg624877.html
> [3]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg642000.html
> [4]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg655118.html
> [5]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg682429.html
> [6]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg697484.html
> [7]: =
https://patchew.org/QEMU/cover.1593273671.git.elena.ufimtseva@oracle.com/
> [8]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg727007.html
> [9]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg734275.html
> [10]: =
https://www.mail-archive.com/qemu-devel@nongnu.org/msg747638.html
> [11]: =
https://www.mail-archive.com/qemu-devel@nongnu.org/msg750972.html
> [12]: =
https://patchew.org/QEMU/cover.1606853298.git.jag.raman@oracle.com/
>=20
> Elena Ufimtseva (7):
>  multi-process: add configure and usage information
>  multi-process: add qio channel function to transmit data and fds
>  multi-process: define MPQemuMsg format and transmission functions
>  multi-process: introduce proxy object
>  multi-process: add proxy communication functions
>  multi-process: Forward PCI config space acceses to the remote process
>  multi-process: perform device reset in the remote process
>=20
> Jagannathan Raman (11):
>  memory: alloc RAM from file at offset
>  multi-process: Add config option for multi-process QEMU
>  multi-process: setup PCI host bridge for remote device
>  multi-process: setup a machine object for remote device process
>  multi-process: Initialize message handler in remote device
>  multi-process: Associate fd of a PCIDevice with its object
>  multi-process: setup memory manager for remote device
>  multi-process: PCI BAR read/write handling for proxy & remote
>    endpoints
>  multi-process: Synchronize remote memory
>  multi-process: create IOHUB object to handle irq
>  multi-process: Retrieve PCI info from remote process
>=20
> John G Johnson (1):
>  multi-process: add the concept description to
>    docs/devel/qemu-multiprocess
>=20
> docs/devel/index.rst                      |   1 +
> docs/devel/multi-process.rst              | 966 =
++++++++++++++++++++++++++++++
> docs/multi-process.rst                    |  64 ++
> meson.build                               |   1 +
> hw/remote/trace.h                         |   1 +
> include/exec/memory.h                     |   2 +
> include/exec/ram_addr.h                   |   2 +-
> include/hw/pci-host/remote.h              |  31 +
> include/hw/pci/pci_ids.h                  |   3 +
> include/hw/remote/iohub.h                 |  42 ++
> include/hw/remote/machine.h               |  40 ++
> include/hw/remote/memory.h                |  19 +
> include/hw/remote/mpqemu-link.h           |  99 +++
> include/hw/remote/proxy-memory-listener.h |  28 +
> include/hw/remote/proxy.h                 |  52 ++
> include/io/channel.h                      |  50 ++
> include/qemu/mmap-alloc.h                 |   4 +-
> include/sysemu/iothread.h                 |   6 +
> backends/hostmem-memfd.c                  |   2 +-
> hw/misc/ivshmem.c                         |   3 +-
> hw/pci-host/remote.c                      |  75 +++
> hw/remote/iohub.c                         | 119 ++++
> hw/remote/machine.c                       |  80 +++
> hw/remote/memory.c                        |  65 ++
> hw/remote/message.c                       | 230 +++++++
> hw/remote/mpqemu-link.c                   | 267 +++++++++
> hw/remote/proxy-memory-listener.c         | 227 +++++++
> hw/remote/proxy.c                         | 371 ++++++++++++
> hw/remote/remote-obj.c                    | 206 +++++++
> io/channel.c                              |  63 +-
> iothread.c                                |   6 +
> softmmu/memory.c                          |   3 +-
> softmmu/physmem.c                         |  11 +-
> util/mmap-alloc.c                         |   7 +-
> util/oslib-posix.c                        |   2 +-
> MAINTAINERS                               |  24 +
> accel/Kconfig                             |   1 +
> hw/Kconfig                                |   1 +
> hw/meson.build                            |   1 +
> hw/pci-host/Kconfig                       |   3 +
> hw/pci-host/meson.build                   |   1 +
> hw/remote/Kconfig                         |   4 +
> hw/remote/meson.build                     |  13 +
> hw/remote/trace-events                    |   4 +
> 44 files changed, 3186 insertions(+), 14 deletions(-)
> create mode 100644 docs/devel/multi-process.rst
> create mode 100644 docs/multi-process.rst
> create mode 100644 hw/remote/trace.h
> create mode 100644 include/hw/pci-host/remote.h
> create mode 100644 include/hw/remote/iohub.h
> create mode 100644 include/hw/remote/machine.h
> create mode 100644 include/hw/remote/memory.h
> create mode 100644 include/hw/remote/mpqemu-link.h
> create mode 100644 include/hw/remote/proxy-memory-listener.h
> create mode 100644 include/hw/remote/proxy.h
> create mode 100644 hw/pci-host/remote.c
> create mode 100644 hw/remote/iohub.c
> create mode 100644 hw/remote/machine.c
> create mode 100644 hw/remote/memory.c
> create mode 100644 hw/remote/message.c
> create mode 100644 hw/remote/mpqemu-link.c
> create mode 100644 hw/remote/proxy-memory-listener.c
> create mode 100644 hw/remote/proxy.c
> create mode 100644 hw/remote/remote-obj.c
> create mode 100644 hw/remote/Kconfig
> create mode 100644 hw/remote/meson.build
> create mode 100644 hw/remote/trace-events
>=20
> --=20
> 1.8.3.1
>=20


