Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 531BA2F0C3E
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 06:24:15 +0100 (CET)
Received: from localhost ([::1]:48736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kypgc-0004g5-Df
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 00:24:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kypdB-0002W3-Ol
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 00:20:41 -0500
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:44435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kypd8-0004D0-TA
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 00:20:41 -0500
Received: by mail-lj1-x22f.google.com with SMTP id m13so2141137ljo.11
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 21:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=D5ly4KCZMu5DHq6DF0k0v5QnroEZzKRhqlwKk+0cjMs=;
 b=YdVLuYQjJu4qyHBM6ixcBC3xeJeGRVVNDMK7mbIaXobs9oxvxcXbyZ010hMdpBRKAW
 PN8DuVWa3dNJrMLV9IUS7v+uJxGkLvKdbVWAu+44qdPGMjcGoQ6FDNLwyRvZSO8FLmdB
 WDYjQQjEWndZ7/VwpBCivDwx1Sqo6pCb/SjEfbkfDY68kkzFFzd2U71tRKLMegJbN6G4
 vtiu6D5ME3b1leXtkDYgo2P4ue0JL9mnEi8xyAxGWfxtTc1igYqh2odaqFDqQZ5FQh4g
 S/1E2Mb2OQ7SA00VvbPqXppwAXxwq4SuJsABCt2Mx8tv6++6Ow3pdoz8ai0B3JbWia1N
 R3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=D5ly4KCZMu5DHq6DF0k0v5QnroEZzKRhqlwKk+0cjMs=;
 b=sgbQmaFcKnqjS758MgUISJ+9yhvx/M/6S4eYKg6pBfwEIvUnoHYd7NRJlmplmVrxPR
 Ol7Ujyy5KgNlJeiOupGHHg6OEZqkbKNvZDqoOSrha3nUXvridMqZTeh1+iTvMKboGExN
 VTboWQv+Eh+KUNOPWgzvn0xNDgtxnNkRrylxRWvK6lHCwYreiRdp7jTDfJ0qoGnQzByk
 DSb4LLx/ELv2g2J2jROnYV+04Lb5ySOJYxzabQfJ6TRn7av70vFxwRS6pE+TwTpvfGal
 /crcaTiWyDRLG4ViXXf2oIMA9GBUEDWlz1L3jnIPM2D43OmH42MU10QoWmHLVmtQIhkq
 ei8A==
X-Gm-Message-State: AOAM530M4h+QaPqAUSveT9gJWsgKpuw3eqHU5gGOD1vD6gmbSkmn3T44
 xs2MCzWBoZd2bl1TYwyT4wT8IYWEu+R+Y9bItW4=
X-Google-Smtp-Source: ABdhPJzVl/Rz07ZdDzlnCvIAkgmuQ7RguszxYDdT4vcilQY/DndCZastViDd0xj/jxExHyV6yvp6X8FfBt8rm10NP3s=
X-Received: by 2002:a2e:b80c:: with SMTP id u12mr6491628ljo.490.1610342437033; 
 Sun, 10 Jan 2021 21:20:37 -0800 (PST)
MIME-Version: 1.0
References: <cover.1610339529.git.jag.raman@oracle.com>
In-Reply-To: <cover.1610339529.git.jag.raman@oracle.com>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Mon, 11 Jan 2021 13:20:25 +0800
Message-ID: <CAE2XoE8ycXRGE6PWnCCR4TbGM0j=W7Osuv_bq+3=cD0xf5TQyw@mail.gmail.com>
Subject: Re: [PATCH v16 00/20] Initial support for multi-process Qemu
To: Jagannathan Raman <jag.raman@oracle.com>
Content-Type: multipart/alternative; boundary="000000000000ed1a5505b8991007"
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=luoyonggang@gmail.com; helo=mail-lj1-x22f.google.com
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, qemu-level <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 kanth.ghatraju@oracle.com, Felipe Franciosi <felipe@nutanix.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 konrad.wilk@oracle.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 alex.williamson@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Max Reitz <mreitz@redhat.com>, ross.lagerwall@citrix.com,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ed1a5505b8991007
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have a question, does this support/test on Windows?

On Mon, Jan 11, 2021 at 1:08 PM Jagannathan Raman <jag.raman@oracle.com>
wrote:
>
> Hi
>
> This is the v16 of the patchset. Thank you for your time reviewing v15.
>
> This version has the following changes:
>
> [PATCH v16 04/20] multi-process: Add config option for multi-process QEMU
>   - Using =E2=80=9Cdefault_feature=E2=80=9D value to enable/disable multi=
process
>
> [PATCH v16 07/20] io: add qio_channel_writev_full_all helper
>   - Removed local variable in qio_channel_writev_full_all(), setting
arguments
>     directly
>   - Fixed indentation issues
>   - Updated commit message
>
> [PATCH v16 08/20] io: add qio_channel_readv_full_all_eof &
>                   qio_channel_readv_full_all helpers
>   - Added two variants of readv - _full_all_eof & _full_all based on
feedback
>   - Dropped errno return value
>   - Updated commit message
>   - Unable to remove local variables and set arguments directly as the
>     arguments are later needed for cleanup (g_free/close) during failure
>
> Switched to using OBJECT_DECLARE_{SIMPLE_TYPE, TYPE} macros in the
> following patches:
>   - [PATCH v16 05/20] multi-process: setup PCI host bridge for remote
device
>   - [PATCH v16 06/20] multi-process: setup a machine object for remote
device
>                       process
>   - [PATCH v16 11/20] multi-process: Associate fd of a PCIDevice with its
object
>   - [PATCH v16 13/20] multi-process: introduce proxy object
>
> Updated copyright text to use the year 2021 in the files that show them.
>
> To touch upon the history of this project, we posted the Proof Of Concept
> patches before the BoF session in 2018. Subsequently, we have posted 15
> versions on the qemu-devel mailing list. You can find them by following
> the links below ([1] - [15]). Following people contributed to the design
and
> implementation of this project:
> Jagannathan Raman <jag.raman@oracle.com>
> Elena Ufimtseva <elena.ufimtseva@oracle.com>
> John G Johnson <john.g.johnson@oracle.com>
> Stefan Hajnoczi <stefanha@redhat.com>
> Konrad Wilk <konrad.wilk@oracle.com>
> Kanth Ghatraju <kanth.ghatraju@oracle.com>
>
> We would like to thank the QEMU community for your feedback in the
> design and implementation of this project. Qemu wiki page:
> https://wiki.qemu.org/Features/MultiProcessQEMU
>
> For the full concept writeup about QEMU multi-process, please
> refer to docs/devel/qemu-multiprocess.rst. Also, see
> docs/qemu-multiprocess.txt for usage information.
>
> Thank you for reviewing this series!
>
> [POC]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg566538.html
> [1]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg602285.html
> [2]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg624877.html
> [3]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg642000.html
> [4]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg655118.html
> [5]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg682429.html
> [6]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg697484.html
> [7]:
https://patchew.org/QEMU/cover.1593273671.git.elena.ufimtseva@oracle.com/
> [8]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg727007.html
> [9]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg734275.html
> [10]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg747638.html
> [11]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg750972.html
> [12]: https://patchew.org/QEMU/cover.1606853298.git.jag.raman@oracle.com/
> [13]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg766825.html
> [14]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg768376.html
> [15]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg769178.html
>
> Elena Ufimtseva (8):
>   multi-process: add configure and usage information
>   io: add qio_channel_writev_full_all helper
>   io: add qio_channel_readv_full_all_eof & qio_channel_readv_full_all
>     helpers
>   multi-process: define MPQemuMsg format and transmission functions
>   multi-process: introduce proxy object
>   multi-process: add proxy communication functions
>   multi-process: Forward PCI config space acceses to the remote process
>   multi-process: perform device reset in the remote process
>
> Jagannathan Raman (11):
>   memory: alloc RAM from file at offset
>   multi-process: Add config option for multi-process QEMU
>   multi-process: setup PCI host bridge for remote device
>   multi-process: setup a machine object for remote device process
>   multi-process: Initialize message handler in remote device
>   multi-process: Associate fd of a PCIDevice with its object
>   multi-process: setup memory manager for remote device
>   multi-process: PCI BAR read/write handling for proxy & remote
>     endpoints
>   multi-process: Synchronize remote memory
>   multi-process: create IOHUB object to handle irq
>   multi-process: Retrieve PCI info from remote process
>
> John G Johnson (1):
>   multi-process: add the concept description to
>     docs/devel/qemu-multiprocess
>
>  docs/devel/index.rst                      |   1 +
>  docs/devel/multi-process.rst              | 966
++++++++++++++++++++++++++++++
>  docs/multi-process.rst                    |  64 ++
>  configure                                 |  10 +
>  meson.build                               |   5 +-
>  hw/remote/trace.h                         |   1 +
>  include/exec/memory.h                     |   2 +
>  include/exec/ram_addr.h                   |   2 +-
>  include/hw/pci-host/remote.h              |  30 +
>  include/hw/pci/pci_ids.h                  |   3 +
>  include/hw/remote/iohub.h                 |  42 ++
>  include/hw/remote/machine.h               |  38 ++
>  include/hw/remote/memory.h                |  19 +
>  include/hw/remote/mpqemu-link.h           |  99 +++
>  include/hw/remote/proxy-memory-listener.h |  28 +
>  include/hw/remote/proxy.h                 |  48 ++
>  include/io/channel.h                      |  76 +++
>  include/qemu/mmap-alloc.h                 |   4 +-
>  include/sysemu/iothread.h                 |   6 +
>  backends/hostmem-memfd.c                  |   2 +-
>  hw/misc/ivshmem.c                         |   3 +-
>  hw/pci-host/remote.c                      |  75 +++
>  hw/remote/iohub.c                         | 119 ++++
>  hw/remote/machine.c                       |  80 +++
>  hw/remote/memory.c                        |  65 ++
>  hw/remote/message.c                       | 230 +++++++
>  hw/remote/mpqemu-link.c                   | 267 +++++++++
>  hw/remote/proxy-memory-listener.c         | 227 +++++++
>  hw/remote/proxy.c                         | 379 ++++++++++++
>  hw/remote/remote-obj.c                    | 203 +++++++
>  io/channel.c                              |  88 ++-
>  iothread.c                                |   6 +
>  softmmu/memory.c                          |   3 +-
>  softmmu/physmem.c                         |  11 +-
>  util/mmap-alloc.c                         |   7 +-
>  util/oslib-posix.c                        |   2 +-
>  Kconfig.host                              |   4 +
>  MAINTAINERS                               |  24 +
>  hw/Kconfig                                |   1 +
>  hw/meson.build                            |   1 +
>  hw/pci-host/Kconfig                       |   3 +
>  hw/pci-host/meson.build                   |   1 +
>  hw/remote/Kconfig                         |   4 +
>  hw/remote/meson.build                     |  13 +
>  hw/remote/trace-events                    |   4 +
>  45 files changed, 3234 insertions(+), 32 deletions(-)
>  create mode 100644 docs/devel/multi-process.rst
>  create mode 100644 docs/multi-process.rst
>  create mode 100644 hw/remote/trace.h
>  create mode 100644 include/hw/pci-host/remote.h
>  create mode 100644 include/hw/remote/iohub.h
>  create mode 100644 include/hw/remote/machine.h
>  create mode 100644 include/hw/remote/memory.h
>  create mode 100644 include/hw/remote/mpqemu-link.h
>  create mode 100644 include/hw/remote/proxy-memory-listener.h
>  create mode 100644 include/hw/remote/proxy.h
>  create mode 100644 hw/pci-host/remote.c
>  create mode 100644 hw/remote/iohub.c
>  create mode 100644 hw/remote/machine.c
>  create mode 100644 hw/remote/memory.c
>  create mode 100644 hw/remote/message.c
>  create mode 100644 hw/remote/mpqemu-link.c
>  create mode 100644 hw/remote/proxy-memory-listener.c
>  create mode 100644 hw/remote/proxy.c
>  create mode 100644 hw/remote/remote-obj.c
>  create mode 100644 hw/remote/Kconfig
>  create mode 100644 hw/remote/meson.build
>  create mode 100644 hw/remote/trace-events
>
> --
> 1.8.3.1
>
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000ed1a5505b8991007
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have a question, does this support/test on Windows?<br><=
br>On Mon, Jan 11, 2021 at 1:08 PM Jagannathan Raman &lt;<a href=3D"mailto:=
jag.raman@oracle.com">jag.raman@oracle.com</a>&gt; wrote:<br>&gt;<br>&gt; H=
i<br>&gt;<br>&gt; This is the v16 of the patchset. Thank you for your time =
reviewing v15.<br>&gt;<br>&gt; This version has the following changes:<br>&=
gt;<br>&gt; [PATCH v16 04/20] multi-process: Add config option for multi-pr=
ocess QEMU<br>&gt; =C2=A0 - Using =E2=80=9Cdefault_feature=E2=80=9D value t=
o enable/disable multiprocess<br>&gt;<br>&gt; [PATCH v16 07/20] io: add qio=
_channel_writev_full_all helper<br>&gt; =C2=A0 - Removed local variable in =
qio_channel_writev_full_all(), setting arguments<br>&gt; =C2=A0 =C2=A0 dire=
ctly<br>&gt; =C2=A0 - Fixed indentation issues<br>&gt; =C2=A0 - Updated com=
mit message<br>&gt;<br>&gt; [PATCH v16 08/20] io: add qio_channel_readv_ful=
l_all_eof &amp;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 qio_channel_readv_full_all helpers<br>&gt; =C2=A0 - Added two=
 variants of readv - _full_all_eof &amp; _full_all based on feedback<br>&gt=
; =C2=A0 - Dropped errno return value<br>&gt; =C2=A0 - Updated commit messa=
ge<br>&gt; =C2=A0 - Unable to remove local variables and set arguments dire=
ctly as the<br>&gt; =C2=A0 =C2=A0 arguments are later needed for cleanup (g=
_free/close) during failure<br>&gt;<br>&gt; Switched to using OBJECT_DECLAR=
E_{SIMPLE_TYPE, TYPE} macros in the<br>&gt; following patches:<br>&gt; =C2=
=A0 - [PATCH v16 05/20] multi-process: setup PCI host bridge for remote dev=
ice<br>&gt; =C2=A0 - [PATCH v16 06/20] multi-process: setup a machine objec=
t for remote device<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 process<br>&gt; =C2=A0 - [PATCH v16 11/20] =
multi-process: Associate fd of a PCIDevice with its object<br>&gt; =C2=A0 -=
 [PATCH v16 13/20] multi-process: introduce proxy object<br>&gt;<br>&gt; Up=
dated copyright text to use the year 2021 in the files that show them.<br>&=
gt;<br>&gt; To touch upon the history of this project, we posted the Proof =
Of Concept<br>&gt; patches before the BoF session in 2018. Subsequently, we=
 have posted 15<br>&gt; versions on the qemu-devel mailing list. You can fi=
nd them by following<br>&gt; the links below ([1] - [15]). Following people=
 contributed to the design and<br>&gt; implementation of this project:<br>&=
gt; Jagannathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com">jag.raman=
@oracle.com</a>&gt;<br>&gt; Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufi=
mtseva@oracle.com">elena.ufimtseva@oracle.com</a>&gt;<br>&gt; John G Johnso=
n &lt;<a href=3D"mailto:john.g.johnson@oracle.com">john.g.johnson@oracle.co=
m</a>&gt;<br>&gt; Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com=
">stefanha@redhat.com</a>&gt;<br>&gt; Konrad Wilk &lt;<a href=3D"mailto:kon=
rad.wilk@oracle.com">konrad.wilk@oracle.com</a>&gt;<br>&gt; Kanth Ghatraju =
&lt;<a href=3D"mailto:kanth.ghatraju@oracle.com">kanth.ghatraju@oracle.com<=
/a>&gt;<br>&gt;<br>&gt; We would like to thank the QEMU community for your =
feedback in the<br>&gt; design and implementation of this project. Qemu wik=
i page:<br>&gt; <a href=3D"https://wiki.qemu.org/Features/MultiProcessQEMU"=
>https://wiki.qemu.org/Features/MultiProcessQEMU</a><br>&gt;<br>&gt; For th=
e full concept writeup about QEMU multi-process, please<br>&gt; refer to do=
cs/devel/qemu-multiprocess.rst. Also, see<br>&gt; docs/qemu-multiprocess.tx=
t for usage information.<br>&gt;<br>&gt; Thank you for reviewing this serie=
s!<br>&gt;<br>&gt; [POC]: <a href=3D"https://www.mail-archive.com/qemu-deve=
l@nongnu.org/msg566538.html">https://www.mail-archive.com/qemu-devel@nongnu=
.org/msg566538.html</a><br>&gt; [1]: <a href=3D"https://www.mail-archive.co=
m/qemu-devel@nongnu.org/msg602285.html">https://www.mail-archive.com/qemu-d=
evel@nongnu.org/msg602285.html</a><br>&gt; [2]: <a href=3D"https://www.mail=
-archive.com/qemu-devel@nongnu.org/msg624877.html">https://www.mail-archive=
.com/qemu-devel@nongnu.org/msg624877.html</a><br>&gt; [3]: <a href=3D"https=
://www.mail-archive.com/qemu-devel@nongnu.org/msg642000.html">https://www.m=
ail-archive.com/qemu-devel@nongnu.org/msg642000.html</a><br>&gt; [4]: <a hr=
ef=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg655118.html">ht=
tps://www.mail-archive.com/qemu-devel@nongnu.org/msg655118.html</a><br>&gt;=
 [5]: <a href=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg6824=
29.html">https://www.mail-archive.com/qemu-devel@nongnu.org/msg682429.html<=
/a><br>&gt; [6]: <a href=3D"https://www.mail-archive.com/qemu-devel@nongnu.=
org/msg697484.html">https://www.mail-archive.com/qemu-devel@nongnu.org/msg6=
97484.html</a><br>&gt; [7]: <a href=3D"https://patchew.org/QEMU/cover.15932=
73671.git.elena.ufimtseva@oracle.com/">https://patchew.org/QEMU/cover.15932=
73671.git.elena.ufimtseva@oracle.com/</a><br>&gt; [8]: <a href=3D"https://w=
ww.mail-archive.com/qemu-devel@nongnu.org/msg727007.html">https://www.mail-=
archive.com/qemu-devel@nongnu.org/msg727007.html</a><br>&gt; [9]: <a href=
=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg734275.html">http=
s://www.mail-archive.com/qemu-devel@nongnu.org/msg734275.html</a><br>&gt; [=
10]: <a href=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg74763=
8.html">https://www.mail-archive.com/qemu-devel@nongnu.org/msg747638.html</=
a><br>&gt; [11]: <a href=3D"https://www.mail-archive.com/qemu-devel@nongnu.=
org/msg750972.html">https://www.mail-archive.com/qemu-devel@nongnu.org/msg7=
50972.html</a><br>&gt; [12]: <a href=3D"https://patchew.org/QEMU/cover.1606=
853298.git.jag.raman@oracle.com/">https://patchew.org/QEMU/cover.1606853298=
.git.jag.raman@oracle.com/</a><br>&gt; [13]: <a href=3D"https://www.mail-ar=
chive.com/qemu-devel@nongnu.org/msg766825.html">https://www.mail-archive.co=
m/qemu-devel@nongnu.org/msg766825.html</a><br>&gt; [14]: <a href=3D"https:/=
/www.mail-archive.com/qemu-devel@nongnu.org/msg768376.html">https://www.mai=
l-archive.com/qemu-devel@nongnu.org/msg768376.html</a><br>&gt; [15]: <a hre=
f=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg769178.html">htt=
ps://www.mail-archive.com/qemu-devel@nongnu.org/msg769178.html</a><br>&gt;<=
br>&gt; Elena Ufimtseva (8):<br>&gt; =C2=A0 multi-process: add configure an=
d usage information<br>&gt; =C2=A0 io: add qio_channel_writev_full_all help=
er<br>&gt; =C2=A0 io: add qio_channel_readv_full_all_eof &amp; qio_channel_=
readv_full_all<br>&gt; =C2=A0 =C2=A0 helpers<br>&gt; =C2=A0 multi-process: =
define MPQemuMsg format and transmission functions<br>&gt; =C2=A0 multi-pro=
cess: introduce proxy object<br>&gt; =C2=A0 multi-process: add proxy commun=
ication functions<br>&gt; =C2=A0 multi-process: Forward PCI config space ac=
ceses to the remote process<br>&gt; =C2=A0 multi-process: perform device re=
set in the remote process<br>&gt;<br>&gt; Jagannathan Raman (11):<br>&gt; =
=C2=A0 memory: alloc RAM from file at offset<br>&gt; =C2=A0 multi-process: =
Add config option for multi-process QEMU<br>&gt; =C2=A0 multi-process: setu=
p PCI host bridge for remote device<br>&gt; =C2=A0 multi-process: setup a m=
achine object for remote device process<br>&gt; =C2=A0 multi-process: Initi=
alize message handler in remote device<br>&gt; =C2=A0 multi-process: Associ=
ate fd of a PCIDevice with its object<br>&gt; =C2=A0 multi-process: setup m=
emory manager for remote device<br>&gt; =C2=A0 multi-process: PCI BAR read/=
write handling for proxy &amp; remote<br>&gt; =C2=A0 =C2=A0 endpoints<br>&g=
t; =C2=A0 multi-process: Synchronize remote memory<br>&gt; =C2=A0 multi-pro=
cess: create IOHUB object to handle irq<br>&gt; =C2=A0 multi-process: Retri=
eve PCI info from remote process<br>&gt;<br>&gt; John G Johnson (1):<br>&gt=
; =C2=A0 multi-process: add the concept description to<br>&gt; =C2=A0 =C2=
=A0 docs/devel/qemu-multiprocess<br>&gt;<br>&gt; =C2=A0docs/devel/index.rst=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 1 +<br>&gt; =C2=A0docs/devel/multi-process.rst =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 966 ++++++++++++++++++++++++++++++<br>&=
gt; =C2=A0docs/multi-process.rst =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A064 ++<br>&gt; =C2=A0configure =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A010 +<br>&gt; =C2=A0meson.build =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 5 +-<br>&gt; =C2=A0hw/remote/trace.h =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 1 +<br>&gt; =C2=A0include/exec/memory.h =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 2 +<br>&gt; =
=C2=A0include/exec/ram_addr.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | =C2=A0 2 +-<br>&gt; =C2=A0include/hw/pci-host/remote.h =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A030 +<br>&gt; =C2=A0=
include/hw/pci/pci_ids.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A0 3 +<br>&gt; =C2=A0include/hw/remote/iohub.h =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A042 ++<br>&gt; =C2=
=A0include/hw/remote/machine.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A038 ++<br>&gt; =C2=A0include/hw/remote/memory.h =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A019 +<br>&gt; =C2=A0includ=
e/hw/remote/mpqemu-link.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A099 +++=
<br>&gt; =C2=A0include/hw/remote/proxy-memory-listener.h | =C2=A028 +<br>&g=
t; =C2=A0include/hw/remote/proxy.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | =C2=A048 ++<br>&gt; =C2=A0include/io/channel.h =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A076 +++<br>&gt; =C2=A0include/qemu/mmap-alloc.h =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 4 +-<br>&gt; =C2=A0include/sysemu/=
iothread.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0=
 6 +<br>&gt; =C2=A0backends/hostmem-memfd.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 2 +-<br>&gt; =C2=A0hw/misc/ivshmem.=
c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 3 +-<br>&gt; =C2=A0hw/pci-host/remote.c =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A075 ++=
+<br>&gt; =C2=A0hw/remote/iohub.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 119 ++++<br>&gt; =C2=A0hw/remo=
te/machine.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | =C2=A080 +++<br>&gt; =C2=A0hw/remote/memory.c =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A065 ++<br>&gt; =C2=A0hw/remote/message.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 230 +++++++<br>&gt; =C2=
=A0hw/remote/mpqemu-link.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | 267 +++++++++<br>&gt; =C2=A0hw/remote/proxy-memory-listene=
r.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 227 +++++++<br>&gt; =C2=A0hw/remote/proxy=
.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 379 ++++++++++++<br>&gt; =C2=A0hw/remote/remote-obj.c =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 203 +++=
++++<br>&gt; =C2=A0io/channel.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A088 ++=
-<br>&gt; =C2=A0iothread.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 6 +=
<br>&gt; =C2=A0softmmu/memory.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 3 +-<br>&gt; =C2=
=A0softmmu/physmem.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A011 +-<br>&gt; =C2=A0util/mmap-alloc=
.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 7 +-<br>&gt; =C2=A0util/oslib-posix.c =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 2 +-<br>&gt; =C2=A0Kconfig.host =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =
4 +<br>&gt; =C2=A0MAINTAINERS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A024 +<br=
>&gt; =C2=A0hw/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 1 +<br>=
&gt; =C2=A0hw/meson.build =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 1 +<br>&gt; =C2=A0=
hw/pci-host/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 3 +<br>&gt; =C2=A0hw/pci-host/meson.build =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 1 +=
<br>&gt; =C2=A0hw/remote/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 4 +<br>&gt; =C2=A0hw/rem=
ote/meson.build =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A013 +<br>&gt; =C2=A0hw/remote/trace-events =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 4 +<br>&gt;=
 =C2=A045 files changed, 3234 insertions(+), 32 deletions(-)<br>&gt; =C2=A0=
create mode 100644 docs/devel/multi-process.rst<br>&gt; =C2=A0create mode 1=
00644 docs/multi-process.rst<br>&gt; =C2=A0create mode 100644 hw/remote/tra=
ce.h<br>&gt; =C2=A0create mode 100644 include/hw/pci-host/remote.h<br>&gt; =
=C2=A0create mode 100644 include/hw/remote/iohub.h<br>&gt; =C2=A0create mod=
e 100644 include/hw/remote/machine.h<br>&gt; =C2=A0create mode 100644 inclu=
de/hw/remote/memory.h<br>&gt; =C2=A0create mode 100644 include/hw/remote/mp=
qemu-link.h<br>&gt; =C2=A0create mode 100644 include/hw/remote/proxy-memory=
-listener.h<br>&gt; =C2=A0create mode 100644 include/hw/remote/proxy.h<br>&=
gt; =C2=A0create mode 100644 hw/pci-host/remote.c<br>&gt; =C2=A0create mode=
 100644 hw/remote/iohub.c<br>&gt; =C2=A0create mode 100644 hw/remote/machin=
e.c<br>&gt; =C2=A0create mode 100644 hw/remote/memory.c<br>&gt; =C2=A0creat=
e mode 100644 hw/remote/message.c<br>&gt; =C2=A0create mode 100644 hw/remot=
e/mpqemu-link.c<br>&gt; =C2=A0create mode 100644 hw/remote/proxy-memory-lis=
tener.c<br>&gt; =C2=A0create mode 100644 hw/remote/proxy.c<br>&gt; =C2=A0cr=
eate mode 100644 hw/remote/remote-obj.c<br>&gt; =C2=A0create mode 100644 hw=
/remote/Kconfig<br>&gt; =C2=A0create mode 100644 hw/remote/meson.build<br>&=
gt; =C2=A0create mode 100644 hw/remote/trace-events<br>&gt;<br>&gt; --<br>&=
gt; 1.8.3.1<br>&gt;<br>&gt;<br><br><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>You=
rs<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo</div>

--000000000000ed1a5505b8991007--

