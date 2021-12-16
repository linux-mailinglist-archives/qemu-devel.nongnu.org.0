Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 323A1478085
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 00:30:14 +0100 (CET)
Received: from localhost ([::1]:35372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my0CS-0000Vt-SU
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 18:30:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1my0Ax-0008FP-Hx
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 18:28:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1my0Ar-0006ZE-Hr
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 18:28:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639697312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P2aTQoTHgAG+yGRee0cor+aZird4yy9yjlHGlH6jhZA=;
 b=Mp32rIlCbf1mkPcjvCPFT+70SVCGjboHk7P3PIXU9wB/hqsUI81hTOLlDIyOT5EAIJcbK6
 81Qm41OiDirWm8ifHLpFEwOj9HTVAtToatQYaroPiK5bm38SJSTaRzKCE1yh+/VNLRkxFk
 EMRtjsIn8qJdcjOCoPdCjtyEuv/ymhM=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-i7zWiqdQPR6pcd3yYa4QFQ-1; Thu, 16 Dec 2021 18:28:30 -0500
X-MC-Unique: i7zWiqdQPR6pcd3yYa4QFQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 b19-20020ab00853000000b002f98f6d7c20so313298uaf.21
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 15:28:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P2aTQoTHgAG+yGRee0cor+aZird4yy9yjlHGlH6jhZA=;
 b=fkRhxuK+HP9YACrkUoJxJBL2xxsBE0bTXp7LOn+xXR7VnV5UVdxmNK9Twgo4JVv0IV
 tYGT2SKid63YftwWRz/hnhJI4aNZwrtte08fUi+izv77ULAuhmFTtoWd/9Q2p4DRnI9k
 LHDlaBLl7qWAGFJ15WvjNfcR86Y4x3tYXlqcoYSr68hFMDEwEDnU/yov7W054/R4Be4h
 Py/FKT3ncsjFCU+B0K63TbMSCZ1DEMvGbVzpKllv6naCR8lTBvWYac/F6u4PqZ8lmGnB
 drf43b089NUaMmYHy20iCY1He21OBFqKCRdk9wxjGXqokGfZ2MgeVcBmTOPYSGn7fet6
 bcHQ==
X-Gm-Message-State: AOAM532NDodJWrgYrgbQgMogInfz0fXONdtDNGkoFg4e7y3NvXfGNxoN
 x/KimZ8pRGgZQmtzU5+ASDznF9Ssy+BCPgyzt4XNUlWr6vdj5c87byTshLZlFzJ6/1u7sip0p8e
 8d8mgW7J2ws1nM6Z3p/Hf1g5WbVrixic=
X-Received: by 2002:ab0:2402:: with SMTP id f2mr74859uan.32.1639697309810;
 Thu, 16 Dec 2021 15:28:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0z3+JpixYSIkE+yObo6B8gZbO0BlziUnyyFbj/pwWT0VpYuuQMqqWVMt18ZXw5m2QOzWENiSa2332z3sqBLs=
X-Received: by 2002:ab0:2402:: with SMTP id f2mr74851uan.32.1639697309613;
 Thu, 16 Dec 2021 15:28:29 -0800 (PST)
MIME-Version: 1.0
References: <20211216123558.799425-1-philmd@redhat.com>
In-Reply-To: <20211216123558.799425-1-philmd@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 16 Dec 2021 18:28:18 -0500
Message-ID: <CAFn=p-ZanmkpiUohjTNBuVYnyRDp-PY4WbrA5-SgaDRU_YQ8YA@mail.gmail.com>
Subject: Re: [PATCH 0/8] hw: Have DMA API take MemTxAttrs arg & propagate
 MemTxResult (part 2)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000add6e805d34bc730"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 Qemu-block <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Keith Busch <kbusch@kernel.org>, Alexander Bulekov <alxndr@bu.edu>,
 Gerd Hoffmann <kraxel@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000add6e805d34bc730
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks OK at a very quick glance. Very weak ACK from me.

On Thu, Dec 16, 2021 at 7:36 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
wrote:

> This is the continuation of part 1 (dma_memory API):
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg820359.html
>
> This series update the dma_buf API.
>
> Based on "hw: Let the DMA API take a MemTxAttrs argument"
> Based-on: <20210702092439.989969-1-philmd@redhat.com>
>
> Philippe Mathieu-Daud=C3=A9 (8):
>   dma: Have dma_buf_rw() take a void pointer
>   dma: Have dma_buf_read() / dma_buf_write() take a void pointer
>   dma: Let pci_dma_rw() take MemTxAttrs argument
>   dma: Let dma_buf_rw() take MemTxAttrs argument
>   dma: Let dma_buf_write() take MemTxAttrs argument
>   dma: Let dma_buf_read() take MemTxAttrs argument
>   dma: Let dma_buf_rw() propagate MemTxResult
>   dma: Let dma_buf_read() / dma_buf_write() propagate MemTxResult
>
>  include/hw/pci/pci.h  | 10 +++++----
>  include/sysemu/dma.h  |  6 ++++--
>  hw/audio/intel-hda.c  |  3 ++-
>  hw/ide/ahci.c         | 10 +++++----
>  hw/nvme/ctrl.c        |  5 +++--
>  hw/scsi/esp-pci.c     |  2 +-
>  hw/scsi/megasas.c     | 48 ++++++++++++++++++++++++++++++-------------
>  hw/scsi/scsi-bus.c    |  4 ++--
>  softmmu/dma-helpers.c | 25 ++++++++++++++--------
>  9 files changed, 74 insertions(+), 39 deletions(-)
>
> --
> 2.33.1
>
>
>

--000000000000add6e805d34bc730
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Looks OK at a very quick glance. Very weak ACK from me.<br=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Thu, Dec 16, 2021 at 7:36 AM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D=
"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">This is the continuation of par=
t 1 (dma_memory API):<br>
<a href=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg820359.htm=
l" rel=3D"noreferrer" target=3D"_blank">https://www.mail-archive.com/qemu-d=
evel@nongnu.org/msg820359.html</a><br>
<br>
This series update the dma_buf API.<br>
<br>
Based on &quot;hw: Let the DMA API take a MemTxAttrs argument&quot;<br>
Based-on: &lt;<a href=3D"mailto:20210702092439.989969-1-philmd@redhat.com" =
target=3D"_blank">20210702092439.989969-1-philmd@redhat.com</a>&gt;<br>
<br>
Philippe Mathieu-Daud=C3=A9 (8):<br>
=C2=A0 dma: Have dma_buf_rw() take a void pointer<br>
=C2=A0 dma: Have dma_buf_read() / dma_buf_write() take a void pointer<br>
=C2=A0 dma: Let pci_dma_rw() take MemTxAttrs argument<br>
=C2=A0 dma: Let dma_buf_rw() take MemTxAttrs argument<br>
=C2=A0 dma: Let dma_buf_write() take MemTxAttrs argument<br>
=C2=A0 dma: Let dma_buf_read() take MemTxAttrs argument<br>
=C2=A0 dma: Let dma_buf_rw() propagate MemTxResult<br>
=C2=A0 dma: Let dma_buf_read() / dma_buf_write() propagate MemTxResult<br>
<br>
=C2=A0include/hw/pci/pci.h=C2=A0 | 10 +++++----<br>
=C2=A0include/sysemu/dma.h=C2=A0 |=C2=A0 6 ++++--<br>
=C2=A0hw/audio/intel-hda.c=C2=A0 |=C2=A0 3 ++-<br>
=C2=A0hw/ide/ahci.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++----<br>
=C2=A0hw/nvme/ctrl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +++--<br>
=C2=A0hw/scsi/esp-pci.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0hw/scsi/megasas.c=C2=A0 =C2=A0 =C2=A0| 48 +++++++++++++++++++++++++++=
+++-------------<br>
=C2=A0hw/scsi/scsi-bus.c=C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
=C2=A0softmmu/dma-helpers.c | 25 ++++++++++++++--------<br>
=C2=A09 files changed, 74 insertions(+), 39 deletions(-)<br>
<br>
-- <br>
2.33.1<br>
<br>
<br>
</blockquote></div>

--000000000000add6e805d34bc730--


