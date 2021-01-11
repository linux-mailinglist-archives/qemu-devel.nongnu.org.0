Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D872F1D71
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 19:05:47 +0100 (CET)
Received: from localhost ([::1]:39344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz1Za-0002he-6d
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 13:05:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kz1WO-0001H0-1s
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 13:02:29 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:51448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kz1WK-0007JW-0j
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 13:02:27 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10BHj09d166567;
 Mon, 11 Jan 2021 18:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=H4eT4nGNLnByme5JCtPGXRi+/u8XB3FgM4wN0/ws7W4=;
 b=vlUjWJBpqIYosXzpANkkuZGE0UP/4yC8/lhUUUbpO275ZrJxdG0m9EChJUa1pFklFtyb
 HMC/N1jw0BFoJAZgJuhPTffx6fWvSCU6iOMssaW6lwqIljOnEoV8/QYlLf4m4Dp2pBsC
 nKlIAJ3HIkHSmCkkDMnuZ1gou/g0iyatXRbi5ETfLCLiiSUJYgekqSQA8hURbc+DO3sr
 Y4n07lhwtwrhsTP1TX4AxLTJomW4ydlQhgrPkBcsw6HBys9vVPpz7s8GJeL5l9uAtFZl
 oNqMwPoXjSL/zczLrMFXUq2a/lKz03KiLyLgw5kIA2fryNSTdDqP3hYFA+nCfZcMzDAs ow== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 360kvjtey7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 11 Jan 2021 18:02:12 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10BHkRVE092716;
 Mon, 11 Jan 2021 18:02:11 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 360kf3wu4x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jan 2021 18:02:11 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10BI27QG011299;
 Mon, 11 Jan 2021 18:02:08 GMT
Received: from [10.39.228.211] (/10.39.228.211)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 11 Jan 2021 10:02:07 -0800
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH v16 00/20] Initial support for multi-process Qemu
From: Jag Raman <jag.raman@oracle.com>
In-Reply-To: <CAE2XoE8ycXRGE6PWnCCR4TbGM0j=W7Osuv_bq+3=cD0xf5TQyw@mail.gmail.com>
Date: Mon, 11 Jan 2021 13:02:05 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <C66E6ACB-EE4C-4465-9DD2-1C3308D9CF07@oracle.com>
References: <cover.1610339529.git.jag.raman@oracle.com>
 <CAE2XoE8ycXRGE6PWnCCR4TbGM0j=W7Osuv_bq+3=cD0xf5TQyw@mail.gmail.com>
To: luoyonggang@gmail.com
X-Mailer: Apple Mail (2.3654.40.0.2.32)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9861
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101110101
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9861
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1011 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101110101
Received-SPF: pass client-ip=156.151.31.86; envelope-from=jag.raman@oracle.com;
 helo=userp2130.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
 John G Johnson <john.g.johnson@oracle.com>, qemu-level <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 kanth.ghatraju@oracle.com, Felipe Franciosi <felipe@nutanix.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 konrad.wilk@oracle.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 alex.williamson@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 thanos.makatos@nutanix.com, Kevin Wolf <kwolf@redhat.com>,
 =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>,
 Max Reitz <mreitz@redhat.com>, ross.lagerwall@citrix.com,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jan 11, 2021, at 12:20 AM, =E7=BD=97=E5=8B=87=E5=88=9A(Yonggang =
Luo) <luoyonggang@gmail.com> wrote:
>=20
> I have a question, does this support/test on Windows?

Hi Yonggang, we have not tested this on Windows. The project only builds =
on Linux for now.

Thank you!
=E2=80=94
Jag

>=20
> On Mon, Jan 11, 2021 at 1:08 PM Jagannathan Raman =
<jag.raman@oracle.com> wrote:
> >
> > Hi
> >
> > This is the v16 of the patchset. Thank you for your time reviewing =
v15.
> >
> > This version has the following changes:
> >
> > [PATCH v16 04/20] multi-process: Add config option for multi-process =
QEMU
> >   - Using =E2=80=9Cdefault_feature=E2=80=9D value to enable/disable =
multiprocess
> >
> > [PATCH v16 07/20] io: add qio_channel_writev_full_all helper
> >   - Removed local variable in qio_channel_writev_full_all(), setting =
arguments
> >     directly
> >   - Fixed indentation issues
> >   - Updated commit message
> >
> > [PATCH v16 08/20] io: add qio_channel_readv_full_all_eof &
> >                   qio_channel_readv_full_all helpers
> >   - Added two variants of readv - _full_all_eof & _full_all based on =
feedback
> >   - Dropped errno return value
> >   - Updated commit message
> >   - Unable to remove local variables and set arguments directly as =
the
> >     arguments are later needed for cleanup (g_free/close) during =
failure
> >
> > Switched to using OBJECT_DECLARE_{SIMPLE_TYPE, TYPE} macros in the
> > following patches:
> >   - [PATCH v16 05/20] multi-process: setup PCI host bridge for =
remote device
> >   - [PATCH v16 06/20] multi-process: setup a machine object for =
remote device
> >                       process
> >   - [PATCH v16 11/20] multi-process: Associate fd of a PCIDevice =
with its object
> >   - [PATCH v16 13/20] multi-process: introduce proxy object
> >
> > Updated copyright text to use the year 2021 in the files that show =
them.
> >
> > To touch upon the history of this project, we posted the Proof Of =
Concept
> > patches before the BoF session in 2018. Subsequently, we have posted =
15
> > versions on the qemu-devel mailing list. You can find them by =
following
> > the links below ([1] - [15]). Following people contributed to the =
design and
> > implementation of this project:
> > Jagannathan Raman <jag.raman@oracle.com>
> > Elena Ufimtseva <elena.ufimtseva@oracle.com>
> > John G Johnson <john.g.johnson@oracle.com>
> > Stefan Hajnoczi <stefanha@redhat.com>
> > Konrad Wilk <konrad.wilk@oracle.com>
> > Kanth Ghatraju <kanth.ghatraju@oracle.com>
> >
> > We would like to thank the QEMU community for your feedback in the
> > design and implementation of this project. Qemu wiki page:
> > https://wiki.qemu.org/Features/MultiProcessQEMU
> >
> > For the full concept writeup about QEMU multi-process, please
> > refer to docs/devel/qemu-multiprocess.rst. Also, see
> > docs/qemu-multiprocess.txt for usage information.
> >
> > Thank you for reviewing this series!
> >
> > [POC]: =
https://www.mail-archive.com/qemu-devel@nongnu.org/msg566538.html
> > [1]: =
https://www.mail-archive.com/qemu-devel@nongnu.org/msg602285.html
> > [2]: =
https://www.mail-archive.com/qemu-devel@nongnu.org/msg624877.html
> > [3]: =
https://www.mail-archive.com/qemu-devel@nongnu.org/msg642000.html
> > [4]: =
https://www.mail-archive.com/qemu-devel@nongnu.org/msg655118.html
> > [5]: =
https://www.mail-archive.com/qemu-devel@nongnu.org/msg682429.html
> > [6]: =
https://www.mail-archive.com/qemu-devel@nongnu.org/msg697484.html
> > [7]: =
https://patchew.org/QEMU/cover.1593273671.git.elena.ufimtseva@oracle.com/
> > [8]: =
https://www.mail-archive.com/qemu-devel@nongnu.org/msg727007.html
> > [9]: =
https://www.mail-archive.com/qemu-devel@nongnu.org/msg734275.html
> > [10]: =
https://www.mail-archive.com/qemu-devel@nongnu.org/msg747638.html
> > [11]: =
https://www.mail-archive.com/qemu-devel@nongnu.org/msg750972.html
> > [12]: =
https://patchew.org/QEMU/cover.1606853298.git.jag.raman@oracle.com/
> > [13]: =
https://www.mail-archive.com/qemu-devel@nongnu.org/msg766825.html
> > [14]: =
https://www.mail-archive.com/qemu-devel@nongnu.org/msg768376.html
> > [15]: =
https://www.mail-archive.com/qemu-devel@nongnu.org/msg769178.html
> >
> > Elena Ufimtseva (8):
> >   multi-process: add configure and usage information
> >   io: add qio_channel_writev_full_all helper
> >   io: add qio_channel_readv_full_all_eof & =
qio_channel_readv_full_all
> >     helpers
> >   multi-process: define MPQemuMsg format and transmission functions
> >   multi-process: introduce proxy object
> >   multi-process: add proxy communication functions
> >   multi-process: Forward PCI config space acceses to the remote =
process
> >   multi-process: perform device reset in the remote process
> >
> > Jagannathan Raman (11):
> >   memory: alloc RAM from file at offset
> >   multi-process: Add config option for multi-process QEMU
> >   multi-process: setup PCI host bridge for remote device
> >   multi-process: setup a machine object for remote device process
> >   multi-process: Initialize message handler in remote device
> >   multi-process: Associate fd of a PCIDevice with its object
> >   multi-process: setup memory manager for remote device
> >   multi-process: PCI BAR read/write handling for proxy & remote
> >     endpoints
> >   multi-process: Synchronize remote memory
> >   multi-process: create IOHUB object to handle irq
> >   multi-process: Retrieve PCI info from remote process
> >
> > John G Johnson (1):
> >   multi-process: add the concept description to
> >     docs/devel/qemu-multiprocess
> >
> >  docs/devel/index.rst                      |   1 +
> >  docs/devel/multi-process.rst              | 966 =
++++++++++++++++++++++++++++++
> >  docs/multi-process.rst                    |  64 ++
> >  configure                                 |  10 +
> >  meson.build                               |   5 +-
> >  hw/remote/trace.h                         |   1 +
> >  include/exec/memory.h                     |   2 +
> >  include/exec/ram_addr.h                   |   2 +-
> >  include/hw/pci-host/remote.h              |  30 +
> >  include/hw/pci/pci_ids.h                  |   3 +
> >  include/hw/remote/iohub.h                 |  42 ++
> >  include/hw/remote/machine.h               |  38 ++
> >  include/hw/remote/memory.h                |  19 +
> >  include/hw/remote/mpqemu-link.h           |  99 +++
> >  include/hw/remote/proxy-memory-listener.h |  28 +
> >  include/hw/remote/proxy.h                 |  48 ++
> >  include/io/channel.h                      |  76 +++
> >  include/qemu/mmap-alloc.h                 |   4 +-
> >  include/sysemu/iothread.h                 |   6 +
> >  backends/hostmem-memfd.c                  |   2 +-
> >  hw/misc/ivshmem.c                         |   3 +-
> >  hw/pci-host/remote.c                      |  75 +++
> >  hw/remote/iohub.c                         | 119 ++++
> >  hw/remote/machine.c                       |  80 +++
> >  hw/remote/memory.c                        |  65 ++
> >  hw/remote/message.c                       | 230 +++++++
> >  hw/remote/mpqemu-link.c                   | 267 +++++++++
> >  hw/remote/proxy-memory-listener.c         | 227 +++++++
> >  hw/remote/proxy.c                         | 379 ++++++++++++
> >  hw/remote/remote-obj.c                    | 203 +++++++
> >  io/channel.c                              |  88 ++-
> >  iothread.c                                |   6 +
> >  softmmu/memory.c                          |   3 +-
> >  softmmu/physmem.c                         |  11 +-
> >  util/mmap-alloc.c                         |   7 +-
> >  util/oslib-posix.c                        |   2 +-
> >  Kconfig.host                              |   4 +
> >  MAINTAINERS                               |  24 +
> >  hw/Kconfig                                |   1 +
> >  hw/meson.build                            |   1 +
> >  hw/pci-host/Kconfig                       |   3 +
> >  hw/pci-host/meson.build                   |   1 +
> >  hw/remote/Kconfig                         |   4 +
> >  hw/remote/meson.build                     |  13 +
> >  hw/remote/trace-events                    |   4 +
> >  45 files changed, 3234 insertions(+), 32 deletions(-)
> >  create mode 100644 docs/devel/multi-process.rst
> >  create mode 100644 docs/multi-process.rst
> >  create mode 100644 hw/remote/trace.h
> >  create mode 100644 include/hw/pci-host/remote.h
> >  create mode 100644 include/hw/remote/iohub.h
> >  create mode 100644 include/hw/remote/machine.h
> >  create mode 100644 include/hw/remote/memory.h
> >  create mode 100644 include/hw/remote/mpqemu-link.h
> >  create mode 100644 include/hw/remote/proxy-memory-listener.h
> >  create mode 100644 include/hw/remote/proxy.h
> >  create mode 100644 hw/pci-host/remote.c
> >  create mode 100644 hw/remote/iohub.c
> >  create mode 100644 hw/remote/machine.c
> >  create mode 100644 hw/remote/memory.c
> >  create mode 100644 hw/remote/message.c
> >  create mode 100644 hw/remote/mpqemu-link.c
> >  create mode 100644 hw/remote/proxy-memory-listener.c
> >  create mode 100644 hw/remote/proxy.c
> >  create mode 100644 hw/remote/remote-obj.c
> >  create mode 100644 hw/remote/Kconfig
> >  create mode 100644 hw/remote/meson.build
> >  create mode 100644 hw/remote/trace-events
> >
> > --
> > 1.8.3.1
> >
> >
>=20
>=20
> --
>          =E6=AD=A4=E8=87=B4
> =E7=A4=BC
> =E7=BD=97=E5=8B=87=E5=88=9A
> Yours
>     sincerely,
> Yonggang Luo


