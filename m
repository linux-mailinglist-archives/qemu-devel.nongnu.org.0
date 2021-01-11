Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832592F207D
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 21:15:30 +0100 (CET)
Received: from localhost ([::1]:59306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz3b7-0002GC-6O
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 15:15:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kz3Ze-0001WE-NT
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 15:13:58 -0500
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:34318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kz3Zb-00080A-Jg
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 15:13:58 -0500
Received: by mail-lf1-x12d.google.com with SMTP id o19so1442636lfo.1
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 12:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=aoM/3CNTxJyesOGrY5tXtlXRchjT9ygqaKabRJRQ7to=;
 b=iLP6bhR45751+/DAhstWkjYcTM0TunINDIWq+c/VodXv+jDBK12gznNE4uztNDswPc
 44XXpvvZD/N57lhmFl87opNqM8O0UpOlf7zIGuhVVerO2VxP4SVYObpSsJlcZNAtAms1
 MFuJ2VKPFptrjuOLWquI8hxmqanHtyyYg4iL44ROOSFzXomf77XaEl8P9ixWjg6i+56Z
 neV3hr0avEoz1inMrML550UqmAybJMwgYjZAbSZJ3wA6gDdFbD321RQMelbGPZrIz8VW
 f9p1WGx8hfW6srB/wPkA4Zu+r00kUM+QYNn70N25kfE5lPBgrVbTlZNZZx6fSnPnh0SF
 uZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=aoM/3CNTxJyesOGrY5tXtlXRchjT9ygqaKabRJRQ7to=;
 b=hOUOGPiBLOuZ8AD0ViAXyviyWBaZZwoA3cUBeRULjNhDPFmixQJfEjrf3f5Hdl4tk2
 jpFjmVLqHwVX0/9WtmNoaG8+7pSseQ0XzNkHDGuvILm++qc0aV6ObA4EKl4wX6emgf6d
 0YHfPMGtuAdIMydPjxBRNBvSrQThwJSeVsi97tUQC0DxMcfA3zeAK69Vo0cGJe09iwdu
 hzOeQUTDGyV/xNRSi19A4spFW2NRDsAzcstR8aAVYrQWcj7ZLcONeyeL2k9DRQ+YGXLt
 snmKVEO+VXqorODal0HlP06nDedn1J9WKsLm1SkXtfCcAaHJP7DIt8s/lc5TVBQFZGZ6
 Mxbg==
X-Gm-Message-State: AOAM5303xA5Up5oFJktz7DgiBT8LYeuXoRijAFytw2yZTnMveuMYzUMP
 OLJIOv1m910z0bPCnwCrVYyscwLtavcCxUPlVQM=
X-Google-Smtp-Source: ABdhPJyygbA8J6D15H85ZViHattBcDzce+HZtwKz2lCPyrSzudFX482UFBIBwjEbj6BwRPVOHztg4vt2S7RWabhwfeM=
X-Received: by 2002:a19:6a1a:: with SMTP id u26mr503461lfu.497.1610396033070; 
 Mon, 11 Jan 2021 12:13:53 -0800 (PST)
MIME-Version: 1.0
References: <cover.1610339529.git.jag.raman@oracle.com>
 <CAE2XoE8ycXRGE6PWnCCR4TbGM0j=W7Osuv_bq+3=cD0xf5TQyw@mail.gmail.com>
 <C66E6ACB-EE4C-4465-9DD2-1C3308D9CF07@oracle.com>
In-Reply-To: <C66E6ACB-EE4C-4465-9DD2-1C3308D9CF07@oracle.com>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Tue, 12 Jan 2021 04:13:40 +0800
Message-ID: <CAE2XoE_A=mX418VyL_Lxt=0+sZ0YY1RpK6yNWEJQdZ+52tndRQ@mail.gmail.com>
Subject: Re: [PATCH v16 00/20] Initial support for multi-process Qemu
To: Jag Raman <jag.raman@oracle.com>
Content-Type: multipart/alternative; boundary="0000000000007fbdfb05b8a58b4a"
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=luoyonggang@gmail.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: luoyonggang@gmail.com
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
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Max Reitz <mreitz@redhat.com>, ross.lagerwall@citrix.com,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007fbdfb05b8a58b4a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 2:02 AM Jag Raman <jag.raman@oracle.com> wrote:
>
>
>
> > On Jan 11, 2021, at 12:20 AM, =E7=BD=97=E5=8B=87=E5=88=9A(Yonggang Luo)=
 <luoyonggang@gmail.com>
wrote:
> >
> > I have a question, does this support/test on Windows?
>
> Hi Yonggang, we have not tested this on Windows. The project only builds
on Linux for now.
>
> Thank you!
I may interested add Windows support, what's the hard part?
If we add Windows/OSX support, we can create same code base for all three
platforms, and reduce #ifdef _WIN32 like macros


> =E2=80=94
> Jag
>
> >
> > On Mon, Jan 11, 2021 at 1:08 PM Jagannathan Raman <jag.raman@oracle.com=
>
wrote:
> > >
> > > Hi
> > >
> > > This is the v16 of the patchset. Thank you for your time reviewing
v15.
> > >
> > > This version has the following changes:
> > >
> > > [PATCH v16 04/20] multi-process: Add config option for multi-process
QEMU
> > >   - Using =E2=80=9Cdefault_feature=E2=80=9D value to enable/disable m=
ultiprocess
> > >
> > > [PATCH v16 07/20] io: add qio_channel_writev_full_all helper
> > >   - Removed local variable in qio_channel_writev_full_all(), setting
arguments
> > >     directly
> > >   - Fixed indentation issues
> > >   - Updated commit message
> > >
> > > [PATCH v16 08/20] io: add qio_channel_readv_full_all_eof &
> > >                   qio_channel_readv_full_all helpers
> > >   - Added two variants of readv - _full_all_eof & _full_all based on
feedback
> > >   - Dropped errno return value
> > >   - Updated commit message
> > >   - Unable to remove local variables and set arguments directly as th=
e
> > >     arguments are later needed for cleanup (g_free/close) during
failure
> > >
> > > Switched to using OBJECT_DECLARE_{SIMPLE_TYPE, TYPE} macros in the
> > > following patches:
> > >   - [PATCH v16 05/20] multi-process: setup PCI host bridge for remote
device
> > >   - [PATCH v16 06/20] multi-process: setup a machine object for
remote device
> > >                       process
> > >   - [PATCH v16 11/20] multi-process: Associate fd of a PCIDevice with
its object
> > >   - [PATCH v16 13/20] multi-process: introduce proxy object
> > >
> > > Updated copyright text to use the year 2021 in the files that show
them.
> > >
> > > To touch upon the history of this project, we posted the Proof Of
Concept
> > > patches before the BoF session in 2018. Subsequently, we have posted
15
> > > versions on the qemu-devel mailing list. You can find them by
following
> > > the links below ([1] - [15]). Following people contributed to the
design and
> > > implementation of this project:
> > > Jagannathan Raman <jag.raman@oracle.com>
> > > Elena Ufimtseva <elena.ufimtseva@oracle.com>
> > > John G Johnson <john.g.johnson@oracle.com>
> > > Stefan Hajnoczi <stefanha@redhat.com>
> > > Konrad Wilk <konrad.wilk@oracle.com>
> > > Kanth Ghatraju <kanth.ghatraju@oracle.com>
> > >
> > > We would like to thank the QEMU community for your feedback in the
> > > design and implementation of this project. Qemu wiki page:
> > > https://wiki.qemu.org/Features/MultiProcessQEMU
> > >
> > > For the full concept writeup about QEMU multi-process, please
> > > refer to docs/devel/qemu-multiprocess.rst. Also, see
> > > docs/qemu-multiprocess.txt for usage information.
> > >
> > > Thank you for reviewing this series!
> > >
> > > [POC]:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg566538.html
> > > [1]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg602285.htm=
l
> > > [2]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg624877.htm=
l
> > > [3]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg642000.htm=
l
> > > [4]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg655118.htm=
l
> > > [5]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg682429.htm=
l
> > > [6]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg697484.htm=
l
> > > [7]:
https://patchew.org/QEMU/cover.1593273671.git.elena.ufimtseva@oracle.com/
> > > [8]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg727007.htm=
l
> > > [9]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg734275.htm=
l
> > > [10]:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg747638.html
> > > [11]:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg750972.html
> > > [12]:
https://patchew.org/QEMU/cover.1606853298.git.jag.raman@oracle.com/
> > > [13]:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg766825.html
> > > [14]:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg768376.html
> > > [15]:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg769178.html
> > >
> > > Elena Ufimtseva (8):
> > >   multi-process: add configure and usage information
> > >   io: add qio_channel_writev_full_all helper
> > >   io: add qio_channel_readv_full_all_eof & qio_channel_readv_full_all
> > >     helpers
> > >   multi-process: define MPQemuMsg format and transmission functions
> > >   multi-process: introduce proxy object
> > >   multi-process: add proxy communication functions
> > >   multi-process: Forward PCI config space acceses to the remote
process
> > >   multi-process: perform device reset in the remote process
> > >
> > > Jagannathan Raman (11):
> > >   memory: alloc RAM from file at offset
> > >   multi-process: Add config option for multi-process QEMU
> > >   multi-process: setup PCI host bridge for remote device
> > >   multi-process: setup a machine object for remote device process
> > >   multi-process: Initialize message handler in remote device
> > >   multi-process: Associate fd of a PCIDevice with its object
> > >   multi-process: setup memory manager for remote device
> > >   multi-process: PCI BAR read/write handling for proxy & remote
> > >     endpoints
> > >   multi-process: Synchronize remote memory
> > >   multi-process: create IOHUB object to handle irq
> > >   multi-process: Retrieve PCI info from remote process
> > >
> > > John G Johnson (1):
> > >   multi-process: add the concept description to
> > >     docs/devel/qemu-multiprocess
> > >
> > >  docs/devel/index.rst                      |   1 +
> > >  docs/devel/multi-process.rst              | 966
++++++++++++++++++++++++++++++
> > >  docs/multi-process.rst                    |  64 ++
> > >  configure                                 |  10 +
> > >  meson.build                               |   5 +-
> > >  hw/remote/trace.h                         |   1 +
> > >  include/exec/memory.h                     |   2 +
> > >  include/exec/ram_addr.h                   |   2 +-
> > >  include/hw/pci-host/remote.h              |  30 +
> > >  include/hw/pci/pci_ids.h                  |   3 +
> > >  include/hw/remote/iohub.h                 |  42 ++
> > >  include/hw/remote/machine.h               |  38 ++
> > >  include/hw/remote/memory.h                |  19 +
> > >  include/hw/remote/mpqemu-link.h           |  99 +++
> > >  include/hw/remote/proxy-memory-listener.h |  28 +
> > >  include/hw/remote/proxy.h                 |  48 ++
> > >  include/io/channel.h                      |  76 +++
> > >  include/qemu/mmap-alloc.h                 |   4 +-
> > >  include/sysemu/iothread.h                 |   6 +
> > >  backends/hostmem-memfd.c                  |   2 +-
> > >  hw/misc/ivshmem.c                         |   3 +-
> > >  hw/pci-host/remote.c                      |  75 +++
> > >  hw/remote/iohub.c                         | 119 ++++
> > >  hw/remote/machine.c                       |  80 +++
> > >  hw/remote/memory.c                        |  65 ++
> > >  hw/remote/message.c                       | 230 +++++++
> > >  hw/remote/mpqemu-link.c                   | 267 +++++++++
> > >  hw/remote/proxy-memory-listener.c         | 227 +++++++
> > >  hw/remote/proxy.c                         | 379 ++++++++++++
> > >  hw/remote/remote-obj.c                    | 203 +++++++
> > >  io/channel.c                              |  88 ++-
> > >  iothread.c                                |   6 +
> > >  softmmu/memory.c                          |   3 +-
> > >  softmmu/physmem.c                         |  11 +-
> > >  util/mmap-alloc.c                         |   7 +-
> > >  util/oslib-posix.c                        |   2 +-
> > >  Kconfig.host                              |   4 +
> > >  MAINTAINERS                               |  24 +
> > >  hw/Kconfig                                |   1 +
> > >  hw/meson.build                            |   1 +
> > >  hw/pci-host/Kconfig                       |   3 +
> > >  hw/pci-host/meson.build                   |   1 +
> > >  hw/remote/Kconfig                         |   4 +
> > >  hw/remote/meson.build                     |  13 +
> > >  hw/remote/trace-events                    |   4 +
> > >  45 files changed, 3234 insertions(+), 32 deletions(-)
> > >  create mode 100644 docs/devel/multi-process.rst
> > >  create mode 100644 docs/multi-process.rst
> > >  create mode 100644 hw/remote/trace.h
> > >  create mode 100644 include/hw/pci-host/remote.h
> > >  create mode 100644 include/hw/remote/iohub.h
> > >  create mode 100644 include/hw/remote/machine.h
> > >  create mode 100644 include/hw/remote/memory.h
> > >  create mode 100644 include/hw/remote/mpqemu-link.h
> > >  create mode 100644 include/hw/remote/proxy-memory-listener.h
> > >  create mode 100644 include/hw/remote/proxy.h
> > >  create mode 100644 hw/pci-host/remote.c
> > >  create mode 100644 hw/remote/iohub.c
> > >  create mode 100644 hw/remote/machine.c
> > >  create mode 100644 hw/remote/memory.c
> > >  create mode 100644 hw/remote/message.c
> > >  create mode 100644 hw/remote/mpqemu-link.c
> > >  create mode 100644 hw/remote/proxy-memory-listener.c
> > >  create mode 100644 hw/remote/proxy.c
> > >  create mode 100644 hw/remote/remote-obj.c
> > >  create mode 100644 hw/remote/Kconfig
> > >  create mode 100644 hw/remote/meson.build
> > >  create mode 100644 hw/remote/trace-events
> > >
> > > --
> > > 1.8.3.1
> > >
> > >
> >
> >
> > --
> >          =E6=AD=A4=E8=87=B4
> > =E7=A4=BC
> > =E7=BD=97=E5=8B=87=E5=88=9A
> > Yours
> >     sincerely,
> > Yonggang Luo
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--0000000000007fbdfb05b8a58b4a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Tue, Jan 12, 2021 at 2:02 AM Jag Raman &lt;<a h=
ref=3D"mailto:jag.raman@oracle.com">jag.raman@oracle.com</a>&gt; wrote:<br>=
&gt;<br>&gt;<br>&gt;<br>&gt; &gt; On Jan 11, 2021, at 12:20 AM, =E7=BD=97=
=E5=8B=87=E5=88=9A(Yonggang Luo) &lt;<a href=3D"mailto:luoyonggang@gmail.co=
m">luoyonggang@gmail.com</a>&gt; wrote:<br>&gt; &gt;<br>&gt; &gt; I have a =
question, does this support/test on Windows?<br>&gt;<br>&gt; Hi Yonggang, w=
e have not tested this on Windows. The project only builds on Linux for now=
.<br>&gt;<br>&gt; Thank you!<div>I may interested add Windows support, what=
&#39;s the hard part?</div><div>If we add Windows/OSX support, we can creat=
e same code base for all three platforms, and reduce #ifdef _WIN32 like mac=
ros</div><div><br></div><div><br>&gt; =E2=80=94<br>&gt; Jag<br>&gt;<br>&gt;=
 &gt;<br>&gt; &gt; On Mon, Jan 11, 2021 at 1:08 PM Jagannathan Raman &lt;<a=
 href=3D"mailto:jag.raman@oracle.com">jag.raman@oracle.com</a>&gt; wrote:<b=
r>&gt; &gt; &gt;<br>&gt; &gt; &gt; Hi<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; T=
his is the v16 of the patchset. Thank you for your time reviewing v15.<br>&=
gt; &gt; &gt;<br>&gt; &gt; &gt; This version has the following changes:<br>=
&gt; &gt; &gt;<br>&gt; &gt; &gt; [PATCH v16 04/20] multi-process: Add confi=
g option for multi-process QEMU<br>&gt; &gt; &gt; =C2=A0 - Using =E2=80=9Cd=
efault_feature=E2=80=9D value to enable/disable multiprocess<br>&gt; &gt; &=
gt;<br>&gt; &gt; &gt; [PATCH v16 07/20] io: add qio_channel_writev_full_all=
 helper<br>&gt; &gt; &gt; =C2=A0 - Removed local variable in qio_channel_wr=
itev_full_all(), setting arguments<br>&gt; &gt; &gt; =C2=A0 =C2=A0 directly=
<br>&gt; &gt; &gt; =C2=A0 - Fixed indentation issues<br>&gt; &gt; &gt; =C2=
=A0 - Updated commit message<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; [PATCH v16=
 08/20] io: add qio_channel_readv_full_all_eof &amp;<br>&gt; &gt; &gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qio_channel_rea=
dv_full_all helpers<br>&gt; &gt; &gt; =C2=A0 - Added two variants of readv =
- _full_all_eof &amp; _full_all based on feedback<br>&gt; &gt; &gt; =C2=A0 =
- Dropped errno return value<br>&gt; &gt; &gt; =C2=A0 - Updated commit mess=
age<br>&gt; &gt; &gt; =C2=A0 - Unable to remove local variables and set arg=
uments directly as the<br>&gt; &gt; &gt; =C2=A0 =C2=A0 arguments are later =
needed for cleanup (g_free/close) during failure<br>&gt; &gt; &gt;<br>&gt; =
&gt; &gt; Switched to using OBJECT_DECLARE_{SIMPLE_TYPE, TYPE} macros in th=
e<br>&gt; &gt; &gt; following patches:<br>&gt; &gt; &gt; =C2=A0 - [PATCH v1=
6 05/20] multi-process: setup PCI host bridge for remote device<br>&gt; &gt=
; &gt; =C2=A0 - [PATCH v16 06/20] multi-process: setup a machine object for=
 remote device<br>&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 process<br>&gt; &gt; &gt; =C2=A0 - [PATC=
H v16 11/20] multi-process: Associate fd of a PCIDevice with its object<br>=
&gt; &gt; &gt; =C2=A0 - [PATCH v16 13/20] multi-process: introduce proxy ob=
ject<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; Updated copyright text to use the =
year 2021 in the files that show them.<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; =
To touch upon the history of this project, we posted the Proof Of Concept<b=
r>&gt; &gt; &gt; patches before the BoF session in 2018. Subsequently, we h=
ave posted 15<br>&gt; &gt; &gt; versions on the qemu-devel mailing list. Yo=
u can find them by following<br>&gt; &gt; &gt; the links below ([1] - [15])=
. Following people contributed to the design and<br>&gt; &gt; &gt; implemen=
tation of this project:<br>&gt; &gt; &gt; Jagannathan Raman &lt;<a href=3D"=
mailto:jag.raman@oracle.com">jag.raman@oracle.com</a>&gt;<br>&gt; &gt; &gt;=
 Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufimtseva@oracle.com">elena.uf=
imtseva@oracle.com</a>&gt;<br>&gt; &gt; &gt; John G Johnson &lt;<a href=3D"=
mailto:john.g.johnson@oracle.com">john.g.johnson@oracle.com</a>&gt;<br>&gt;=
 &gt; &gt; Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com">stefa=
nha@redhat.com</a>&gt;<br>&gt; &gt; &gt; Konrad Wilk &lt;<a href=3D"mailto:=
konrad.wilk@oracle.com">konrad.wilk@oracle.com</a>&gt;<br>&gt; &gt; &gt; Ka=
nth Ghatraju &lt;<a href=3D"mailto:kanth.ghatraju@oracle.com">kanth.ghatraj=
u@oracle.com</a>&gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; We would like to t=
hank the QEMU community for your feedback in the<br>&gt; &gt; &gt; design a=
nd implementation of this project. Qemu wiki page:<br>&gt; &gt; &gt; <a hre=
f=3D"https://wiki.qemu.org/Features/MultiProcessQEMU">https://wiki.qemu.org=
/Features/MultiProcessQEMU</a><br>&gt; &gt; &gt;<br>&gt; &gt; &gt; For the =
full concept writeup about QEMU multi-process, please<br>&gt; &gt; &gt; ref=
er to docs/devel/qemu-multiprocess.rst. Also, see<br>&gt; &gt; &gt; docs/qe=
mu-multiprocess.txt for usage information.<br>&gt; &gt; &gt;<br>&gt; &gt; &=
gt; Thank you for reviewing this series!<br>&gt; &gt; &gt;<br>&gt; &gt; &gt=
; [POC]: <a href=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg5=
66538.html">https://www.mail-archive.com/qemu-devel@nongnu.org/msg566538.ht=
ml</a><br>&gt; &gt; &gt; [1]: <a href=3D"https://www.mail-archive.com/qemu-=
devel@nongnu.org/msg602285.html">https://www.mail-archive.com/qemu-devel@no=
ngnu.org/msg602285.html</a><br>&gt; &gt; &gt; [2]: <a href=3D"https://www.m=
ail-archive.com/qemu-devel@nongnu.org/msg624877.html">https://www.mail-arch=
ive.com/qemu-devel@nongnu.org/msg624877.html</a><br>&gt; &gt; &gt; [3]: <a =
href=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg642000.html">=
https://www.mail-archive.com/qemu-devel@nongnu.org/msg642000.html</a><br>&g=
t; &gt; &gt; [4]: <a href=3D"https://www.mail-archive.com/qemu-devel@nongnu=
.org/msg655118.html">https://www.mail-archive.com/qemu-devel@nongnu.org/msg=
655118.html</a><br>&gt; &gt; &gt; [5]: <a href=3D"https://www.mail-archive.=
com/qemu-devel@nongnu.org/msg682429.html">https://www.mail-archive.com/qemu=
-devel@nongnu.org/msg682429.html</a><br>&gt; &gt; &gt; [6]: <a href=3D"http=
s://www.mail-archive.com/qemu-devel@nongnu.org/msg697484.html">https://www.=
mail-archive.com/qemu-devel@nongnu.org/msg697484.html</a><br>&gt; &gt; &gt;=
 [7]: <a href=3D"https://patchew.org/QEMU/cover.1593273671.git.elena.ufimts=
eva@oracle.com/">https://patchew.org/QEMU/cover.1593273671.git.elena.ufimts=
eva@oracle.com/</a><br>&gt; &gt; &gt; [8]: <a href=3D"https://www.mail-arch=
ive.com/qemu-devel@nongnu.org/msg727007.html">https://www.mail-archive.com/=
qemu-devel@nongnu.org/msg727007.html</a><br>&gt; &gt; &gt; [9]: <a href=3D"=
https://www.mail-archive.com/qemu-devel@nongnu.org/msg734275.html">https://=
www.mail-archive.com/qemu-devel@nongnu.org/msg734275.html</a><br>&gt; &gt; =
&gt; [10]: <a href=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/ms=
g747638.html">https://www.mail-archive.com/qemu-devel@nongnu.org/msg747638.=
html</a><br>&gt; &gt; &gt; [11]: <a href=3D"https://www.mail-archive.com/qe=
mu-devel@nongnu.org/msg750972.html">https://www.mail-archive.com/qemu-devel=
@nongnu.org/msg750972.html</a><br>&gt; &gt; &gt; [12]: <a href=3D"https://p=
atchew.org/QEMU/cover.1606853298.git.jag.raman@oracle.com/">https://patchew=
.org/QEMU/cover.1606853298.git.jag.raman@oracle.com/</a><br>&gt; &gt; &gt; =
[13]: <a href=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg7668=
25.html">https://www.mail-archive.com/qemu-devel@nongnu.org/msg766825.html<=
/a><br>&gt; &gt; &gt; [14]: <a href=3D"https://www.mail-archive.com/qemu-de=
vel@nongnu.org/msg768376.html">https://www.mail-archive.com/qemu-devel@nong=
nu.org/msg768376.html</a><br>&gt; &gt; &gt; [15]: <a href=3D"https://www.ma=
il-archive.com/qemu-devel@nongnu.org/msg769178.html">https://www.mail-archi=
ve.com/qemu-devel@nongnu.org/msg769178.html</a><br>&gt; &gt; &gt;<br>&gt; &=
gt; &gt; Elena Ufimtseva (8):<br>&gt; &gt; &gt; =C2=A0 multi-process: add c=
onfigure and usage information<br>&gt; &gt; &gt; =C2=A0 io: add qio_channel=
_writev_full_all helper<br>&gt; &gt; &gt; =C2=A0 io: add qio_channel_readv_=
full_all_eof &amp; qio_channel_readv_full_all<br>&gt; &gt; &gt; =C2=A0 =C2=
=A0 helpers<br>&gt; &gt; &gt; =C2=A0 multi-process: define MPQemuMsg format=
 and transmission functions<br>&gt; &gt; &gt; =C2=A0 multi-process: introdu=
ce proxy object<br>&gt; &gt; &gt; =C2=A0 multi-process: add proxy communica=
tion functions<br>&gt; &gt; &gt; =C2=A0 multi-process: Forward PCI config s=
pace acceses to the remote process<br>&gt; &gt; &gt; =C2=A0 multi-process: =
perform device reset in the remote process<br>&gt; &gt; &gt;<br>&gt; &gt; &=
gt; Jagannathan Raman (11):<br>&gt; &gt; &gt; =C2=A0 memory: alloc RAM from=
 file at offset<br>&gt; &gt; &gt; =C2=A0 multi-process: Add config option f=
or multi-process QEMU<br>&gt; &gt; &gt; =C2=A0 multi-process: setup PCI hos=
t bridge for remote device<br>&gt; &gt; &gt; =C2=A0 multi-process: setup a =
machine object for remote device process<br>&gt; &gt; &gt; =C2=A0 multi-pro=
cess: Initialize message handler in remote device<br>&gt; &gt; &gt; =C2=A0 =
multi-process: Associate fd of a PCIDevice with its object<br>&gt; &gt; &gt=
; =C2=A0 multi-process: setup memory manager for remote device<br>&gt; &gt;=
 &gt; =C2=A0 multi-process: PCI BAR read/write handling for proxy &amp; rem=
ote<br>&gt; &gt; &gt; =C2=A0 =C2=A0 endpoints<br>&gt; &gt; &gt; =C2=A0 mult=
i-process: Synchronize remote memory<br>&gt; &gt; &gt; =C2=A0 multi-process=
: create IOHUB object to handle irq<br>&gt; &gt; &gt; =C2=A0 multi-process:=
 Retrieve PCI info from remote process<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; =
John G Johnson (1):<br>&gt; &gt; &gt; =C2=A0 multi-process: add the concept=
 description to<br>&gt; &gt; &gt; =C2=A0 =C2=A0 docs/devel/qemu-multiproces=
s<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; =C2=A0docs/devel/index.rst =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =
1 +<br>&gt; &gt; &gt; =C2=A0docs/devel/multi-process.rst =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 966 ++++++++++++++++++++++++++++++<br>&gt;=
 &gt; &gt; =C2=A0docs/multi-process.rst =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A064 ++<br>&gt; &gt; &gt; =C2=A0con=
figure =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A010 +<br>&gt; &gt; &gt=
; =C2=A0meson.build =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 5 +-<br>&gt; &gt=
; &gt; =C2=A0hw/remote/trace.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 1 +<br>&gt; &gt; &gt; =
=C2=A0include/exec/memory.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 2 +<br>&gt; &gt; &gt; =C2=A0include/exec/=
ram_addr.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 2 +-<br>&gt; &gt; &gt; =C2=A0include/hw/pci-host/remote.h =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A030 +<br>&gt; &gt; &gt; =C2=
=A0include/hw/pci/pci_ids.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 3 +<br>&gt; &gt; &gt; =C2=A0include/hw/remote/ioh=
ub.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A042 ++<=
br>&gt; &gt; &gt; =C2=A0include/hw/remote/machine.h =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A038 ++<br>&gt; &gt; &gt; =C2=A0include/h=
w/remote/memory.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A019 +<br>&gt; &gt; &gt; =C2=A0include/hw/remote/mpqemu-link.h =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A099 +++<br>&gt; &gt; &gt; =C2=A0include/=
hw/remote/proxy-memory-listener.h | =C2=A028 +<br>&gt; &gt; &gt; =C2=A0incl=
ude/hw/remote/proxy.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A048 ++<br>&gt; &gt; &gt; =C2=A0include/io/channel.h =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A07=
6 +++<br>&gt; &gt; &gt; =C2=A0include/qemu/mmap-alloc.h =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 4 +-<br>&gt; &gt; &gt; =C2=
=A0include/sysemu/iothread.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 6 +<br>&gt; &gt; &gt; =C2=A0backends/hostmem-memfd.c =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 2 +-=
<br>&gt; &gt; &gt; =C2=A0hw/misc/ivshmem.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 3 +-<br>&gt; =
&gt; &gt; =C2=A0hw/pci-host/remote.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A075 +++<br>&gt; &gt; &gt; =C2=
=A0hw/remote/iohub.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 119 ++++<br>&gt; &gt; &gt; =C2=A0hw/remot=
e/machine.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A080 +++<br>&gt; &gt; &gt; =C2=A0hw/remote/memory.c =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A065 ++<br>&gt; &gt; &gt; =C2=A0hw/remote/message.c =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 230 ++=
+++++<br>&gt; &gt; &gt; =C2=A0hw/remote/mpqemu-link.c =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 267 +++++++++<br>&gt; &gt; &gt;=
 =C2=A0hw/remote/proxy-memory-listener.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 227 =
+++++++<br>&gt; &gt; &gt; =C2=A0hw/remote/proxy.c =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 379 +++++++++=
+++<br>&gt; &gt; &gt; =C2=A0hw/remote/remote-obj.c =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 203 +++++++<br>&gt; &gt; &gt=
; =C2=A0io/channel.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A088 ++-<br>&gt; =
&gt; &gt; =C2=A0iothread.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 6 +=
<br>&gt; &gt; &gt; =C2=A0softmmu/memory.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 3 +-<br=
>&gt; &gt; &gt; =C2=A0softmmu/physmem.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A011 +-<br>&gt; &gt;=
 &gt; =C2=A0util/mmap-alloc.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 7 +-<br>&gt; &gt; &gt; =C2=
=A0util/oslib-posix.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 2 +-<br>&gt; &gt; &gt; =C2=A0Kconfi=
g.host =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 4 +<br>&gt; &gt; &gt; =C2=A0=
MAINTAINERS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A024 +<br>&gt; &gt; &gt; =
=C2=A0hw/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 1 +<br>&gt;=
 &gt; &gt; =C2=A0hw/meson.build =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 1 +<br>&gt;=
 &gt; &gt; =C2=A0hw/pci-host/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 3 +<br>&gt; &gt; &gt; =C2=
=A0hw/pci-host/meson.build =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | =C2=A0 1 +<br>&gt; &gt; &gt; =C2=A0hw/remote/Kconfig =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 4 +<br>&gt; &gt; &gt; =C2=A0hw/remote/meson.build =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A013 +=
<br>&gt; &gt; &gt; =C2=A0hw/remote/trace-events =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 4 +<br>&gt; &gt; &gt; =
=C2=A045 files changed, 3234 insertions(+), 32 deletions(-)<br>&gt; &gt; &g=
t; =C2=A0create mode 100644 docs/devel/multi-process.rst<br>&gt; &gt; &gt; =
=C2=A0create mode 100644 docs/multi-process.rst<br>&gt; &gt; &gt; =C2=A0cre=
ate mode 100644 hw/remote/trace.h<br>&gt; &gt; &gt; =C2=A0create mode 10064=
4 include/hw/pci-host/remote.h<br>&gt; &gt; &gt; =C2=A0create mode 100644 i=
nclude/hw/remote/iohub.h<br>&gt; &gt; &gt; =C2=A0create mode 100644 include=
/hw/remote/machine.h<br>&gt; &gt; &gt; =C2=A0create mode 100644 include/hw/=
remote/memory.h<br>&gt; &gt; &gt; =C2=A0create mode 100644 include/hw/remot=
e/mpqemu-link.h<br>&gt; &gt; &gt; =C2=A0create mode 100644 include/hw/remot=
e/proxy-memory-listener.h<br>&gt; &gt; &gt; =C2=A0create mode 100644 includ=
e/hw/remote/proxy.h<br>&gt; &gt; &gt; =C2=A0create mode 100644 hw/pci-host/=
remote.c<br>&gt; &gt; &gt; =C2=A0create mode 100644 hw/remote/iohub.c<br>&g=
t; &gt; &gt; =C2=A0create mode 100644 hw/remote/machine.c<br>&gt; &gt; &gt;=
 =C2=A0create mode 100644 hw/remote/memory.c<br>&gt; &gt; &gt; =C2=A0create=
 mode 100644 hw/remote/message.c<br>&gt; &gt; &gt; =C2=A0create mode 100644=
 hw/remote/mpqemu-link.c<br>&gt; &gt; &gt; =C2=A0create mode 100644 hw/remo=
te/proxy-memory-listener.c<br>&gt; &gt; &gt; =C2=A0create mode 100644 hw/re=
mote/proxy.c<br>&gt; &gt; &gt; =C2=A0create mode 100644 hw/remote/remote-ob=
j.c<br>&gt; &gt; &gt; =C2=A0create mode 100644 hw/remote/Kconfig<br>&gt; &g=
t; &gt; =C2=A0create mode 100644 hw/remote/meson.build<br>&gt; &gt; &gt; =
=C2=A0create mode 100644 hw/remote/trace-events<br>&gt; &gt; &gt;<br>&gt; &=
gt; &gt; --<br>&gt; &gt; &gt; 1.8.3.1<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<b=
r>&gt; &gt;<br>&gt; &gt;<br>&gt; &gt; --<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>&gt; &gt; =E7=A4=BC<br>&gt; &gt; =E7=BD=
=97=E5=8B=87=E5=88=9A<br>&gt; &gt; Yours<br>&gt; &gt; =C2=A0 =C2=A0 sincere=
ly,<br>&gt; &gt; Yonggang Luo<br>&gt;<br><br><br>--<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=
=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo</div></div>

--0000000000007fbdfb05b8a58b4a--

