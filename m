Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B313E4923B0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 11:19:17 +0100 (CET)
Received: from localhost ([::1]:55572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9la8-00020V-5M
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 05:19:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuval.shaia.ml@gmail.com>)
 id 1n9lVN-0000aS-SH
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 05:14:22 -0500
Received: from [2a00:1450:4864:20::134] (port=37602
 helo=mail-lf1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuval.shaia.ml@gmail.com>)
 id 1n9lVM-0005eF-2y
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 05:14:21 -0500
Received: by mail-lf1-x134.google.com with SMTP id m1so68596693lfq.4
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 02:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1NenohmyHVLgfNTbjj3FHsIzMETb06V3H5FQqZ3iI80=;
 b=fvCqlaHsyPYiLaYendtHxzHIO0TbPJtM7Wo6NZAq8UKfan0ntGeLvFvINfDb+07GH5
 OkOHCLagYSDjTcwD/ytfhVPxPXeNUcfM6mtUiCZ8pzH4gVxjAQdsjq9E8XIhyguJ29Qs
 Qco/ELQEwBMmFhQ/Zdx3EylB4kBTTw8rdxuERwwXZfTBAA8VoyyJgOI7P7jhzCfwt4yc
 k43wYyg9OKCPiOJiFMtBWm1tSiUIlsH4CVeiYRXHeJbLRDE/tW82Esi69uGTVkeJmUNs
 cfSSXFbjSmt8SGpXJUUXY4PR+HTvrZ9itxHbJe0ZdPJophMGIhWwLfkYkvCNcR4WRTgW
 35Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1NenohmyHVLgfNTbjj3FHsIzMETb06V3H5FQqZ3iI80=;
 b=4wCVJPu/FSrkmB2liarDsxuCvk4MRFB98OXViuCe13fZRqC57RR5wtG5UpLbGj64N6
 iG5FaeCnxsJYnbfr0lqo7qH/oxy0lf1B8foHj3mXyzphkGMvw4frQaw5r2jjazECZzE7
 eu6YsUAXcFAm1/kqchteWo+D14I/3KJvXAclpXO50Ma8KqYRt67fyRjWqcgfheEVAl4v
 5xIa4pBJk1NT5Ec3PZ2M+IMAW1XSOgCQA1mkrLyDUDoCCrBlz63Rz0yIOx2r7SDNvaM5
 f+j45zyFj+rzyx9/MZpv18ICBcyRb9b/rqeJjVdf7inrpvTrRr68+dgLx6ZxPEKfYrzA
 jO+A==
X-Gm-Message-State: AOAM532RMWkUStZX8Li1xTrv19f46amZzxV6ixVz1KbeqqurTR9XtLGG
 OuL62Sp+mujsKXPrXzEwvqS6DX1fk0zjTywZepE=
X-Google-Smtp-Source: ABdhPJztnDBR3BpetmZjBcOAgBOxnGi0C0CLnrlKlKe5Aqs2pRhZQZNQuTXdmybCkb7mOKHBlT4zRpYXOevqRzsY87U=
X-Received: by 2002:a2e:8447:: with SMTP id u7mr19857043ljh.530.1642500847957; 
 Tue, 18 Jan 2022 02:14:07 -0800 (PST)
MIME-Version: 1.0
References: <20211231114901.976937-1-philmd@redhat.com>
 <20211231114901.976937-6-philmd@redhat.com>
In-Reply-To: <20211231114901.976937-6-philmd@redhat.com>
From: Yuval Shaia <yuval.shaia.ml@gmail.com>
Date: Tue, 18 Jan 2022 12:13:56 +0200
Message-ID: <CAMPkWoNO2TQbbWh2AgTXpiy0S2H+AOGJUD1e6sGryPCLGWxDbw@mail.gmail.com>
Subject: Re: [PATCH 5/8] hw/rdma/rdma_utils: Rename rdma_pci_dma_map 'len'
 argument
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000095faa805d5d887c3"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::134
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=yuval.shaia.ml@gmail.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000095faa805d5d887c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 31 Dec 2021 at 13:54, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> Various APIs use 'pval' naming for 'pointer to val'.
> rdma_pci_dma_map() uses 'plen' for 'PCI length', but since
> 'PCI' is already explicit in the function name, simplify
> and rename the argument 'len'. No logical change.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/rdma/rdma_utils.h |  2 +-
>  hw/rdma/rdma_utils.c | 14 +++++++-------
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/hw/rdma/rdma_utils.h b/hw/rdma/rdma_utils.h
> index 9fd0efd940b..0c6414e7e0a 100644
> --- a/hw/rdma/rdma_utils.h
> +++ b/hw/rdma/rdma_utils.h
> @@ -38,7 +38,7 @@ typedef struct RdmaProtectedGSList {
>      GSList *list;
>  } RdmaProtectedGSList;
>
> -void *rdma_pci_dma_map(PCIDevice *dev, dma_addr_t addr, dma_addr_t plen)=
;
> +void *rdma_pci_dma_map(PCIDevice *dev, dma_addr_t addr, dma_addr_t len);
>  void rdma_pci_dma_unmap(PCIDevice *dev, void *buffer, dma_addr_t len);
>  void rdma_protected_gqueue_init(RdmaProtectedGQueue *list);
>  void rdma_protected_gqueue_destroy(RdmaProtectedGQueue *list);
> diff --git a/hw/rdma/rdma_utils.c b/hw/rdma/rdma_utils.c
> index 98df58f6897..61cb8ede0fd 100644
> --- a/hw/rdma/rdma_utils.c
> +++ b/hw/rdma/rdma_utils.c
> @@ -17,29 +17,29 @@
>  #include "trace.h"
>  #include "rdma_utils.h"
>
> -void *rdma_pci_dma_map(PCIDevice *dev, dma_addr_t addr, dma_addr_t plen)
> +void *rdma_pci_dma_map(PCIDevice *dev, dma_addr_t addr, dma_addr_t len)
>  {
>      void *p;
> -    hwaddr len =3D plen;
> +    hwaddr pci_len =3D len;
>
>      if (!addr) {
>          rdma_error_report("addr is NULL");
>          return NULL;
>      }
>
> -    p =3D pci_dma_map(dev, addr, &len, DMA_DIRECTION_TO_DEVICE);
> +    p =3D pci_dma_map(dev, addr, &pci_len, DMA_DIRECTION_TO_DEVICE);
>      if (!p) {
>          rdma_error_report("pci_dma_map fail, addr=3D0x%"PRIx64",
> len=3D%"PRId64,
> -                          addr, len);
> +                          addr, pci_len);
>          return NULL;
>      }
>
> -    if (len !=3D plen) {
> -        rdma_pci_dma_unmap(dev, p, len);
> +    if (pci_len !=3D len) {
> +        rdma_pci_dma_unmap(dev, p, pci_len);
>          return NULL;
>      }
>
> -    trace_rdma_pci_dma_map(addr, p, len);
> +    trace_rdma_pci_dma_map(addr, p, pci_len);
>
>      return p;
>  }
>

Reviewed-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
Tested-by: Yuval Shaia <yuval.shaia.ml@gmail.com>


> --
> 2.33.1
>
>
>

--00000000000095faa805d5d887c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div><br></div><div><br></div><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 31 =
Dec 2021 at 13:54, Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd=
@redhat.com">philmd@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Various APIs use &#39;pval&#39; naming for &#=
39;pointer to val&#39;.<br>
rdma_pci_dma_map() uses &#39;plen&#39; for &#39;PCI length&#39;, but since<=
br>
&#39;PCI&#39; is already explicit in the function name, simplify<br>
and rename the argument &#39;len&#39;. No logical change.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/rdma/rdma_utils.h |=C2=A0 2 +-<br>
=C2=A0hw/rdma/rdma_utils.c | 14 +++++++-------<br>
=C2=A02 files changed, 8 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/hw/rdma/rdma_utils.h b/hw/rdma/rdma_utils.h<br>
index 9fd0efd940b..0c6414e7e0a 100644<br>
--- a/hw/rdma/rdma_utils.h<br>
+++ b/hw/rdma/rdma_utils.h<br>
@@ -38,7 +38,7 @@ typedef struct RdmaProtectedGSList {<br>
=C2=A0 =C2=A0 =C2=A0GSList *list;<br>
=C2=A0} RdmaProtectedGSList;<br>
<br>
-void *rdma_pci_dma_map(PCIDevice *dev, dma_addr_t addr, dma_addr_t plen);<=
br>
+void *rdma_pci_dma_map(PCIDevice *dev, dma_addr_t addr, dma_addr_t len);<b=
r>
=C2=A0void rdma_pci_dma_unmap(PCIDevice *dev, void *buffer, dma_addr_t len)=
;<br>
=C2=A0void rdma_protected_gqueue_init(RdmaProtectedGQueue *list);<br>
=C2=A0void rdma_protected_gqueue_destroy(RdmaProtectedGQueue *list);<br>
diff --git a/hw/rdma/rdma_utils.c b/hw/rdma/rdma_utils.c<br>
index 98df58f6897..61cb8ede0fd 100644<br>
--- a/hw/rdma/rdma_utils.c<br>
+++ b/hw/rdma/rdma_utils.c<br>
@@ -17,29 +17,29 @@<br>
=C2=A0#include &quot;trace.h&quot;<br>
=C2=A0#include &quot;rdma_utils.h&quot;<br>
<br>
-void *rdma_pci_dma_map(PCIDevice *dev, dma_addr_t addr, dma_addr_t plen)<b=
r>
+void *rdma_pci_dma_map(PCIDevice *dev, dma_addr_t addr, dma_addr_t len)<br=
>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0void *p;<br>
-=C2=A0 =C2=A0 hwaddr len =3D plen;<br>
+=C2=A0 =C2=A0 hwaddr pci_len =3D len;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!addr) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdma_error_report(&quot;addr is NULL&quot=
;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 p =3D pci_dma_map(dev, addr, &amp;len, DMA_DIRECTION_TO_DEVI=
CE);<br>
+=C2=A0 =C2=A0 p =3D pci_dma_map(dev, addr, &amp;pci_len, DMA_DIRECTION_TO_=
DEVICE);<br>
=C2=A0 =C2=A0 =C2=A0if (!p) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdma_error_report(&quot;pci_dma_map fail,=
 addr=3D0x%&quot;PRIx64&quot;, len=3D%&quot;PRId64,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 addr, len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 addr, pci_len);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (len !=3D plen) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rdma_pci_dma_unmap(dev, p, len);<br>
+=C2=A0 =C2=A0 if (pci_len !=3D len) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rdma_pci_dma_unmap(dev, p, pci_len);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 trace_rdma_pci_dma_map(addr, p, len);<br>
+=C2=A0 =C2=A0 trace_rdma_pci_dma_map(addr, p, pci_len);<br>
<br>
=C2=A0 =C2=A0 =C2=A0return p;<br>
=C2=A0}<br></blockquote><div><br></div><div>Reviewed-by: Yuval Shaia &lt;<a=
 href=3D"mailto:yuval.shaia.ml@gmail.com">yuval.shaia.ml@gmail.com</a>&gt;<=
/div><div>Tested-by: Yuval Shaia &lt;<a href=3D"mailto:yuval.shaia.ml@gmail=
.com">yuval.shaia.ml@gmail.com</a>&gt;

</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
-- <br>
2.33.1<br>
<br>
<br>
</blockquote></div></div>

--00000000000095faa805d5d887c3--

