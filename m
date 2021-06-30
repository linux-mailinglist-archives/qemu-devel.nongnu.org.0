Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6223B8488
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 15:58:16 +0200 (CEST)
Received: from localhost ([::1]:54830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyajH-000379-Ml
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 09:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuval.shaia.ml@gmail.com>)
 id 1lyahj-00029Z-0F
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 09:56:39 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:45882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuval.shaia.ml@gmail.com>)
 id 1lyahd-0001aI-E2
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 09:56:38 -0400
Received: by mail-lj1-x230.google.com with SMTP id u20so3368885ljo.12
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 06:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lC2p6uLB6XlAYguaGPZ5BbXFc+Cj0fkwDL2uJt3ClzI=;
 b=RijnA9pgmMOPgPV+rHGfhs3vSFp/TMCctrxNO7qJc9d78D+5cxNR9pBSAfChJfdh7p
 sc6Pj9CVkSWtgiFvoS7Wq2TK9wAc0zJXCbmHoFvpDb3M+iJ72Eh0JKBq+pEFceasWaEq
 CzGWQaDaiFd6dLXty7g5CGGl7iqBlnCek6OEC3WwnHN8uOjEG3yXHjGg9rWMvoUG9cGt
 jZ42t+LmOxVF5i58jYkX+/egBn+ORENknqeEdaTrKZBJ526lNHoY3/VCNIv4we1GsYyo
 hI5f/0kJr2wnzPjH+6jSuJQKp9UzmcYJRH5Bc7B1x9C9t59X3ZdB32pjomsdA56oR6pM
 fq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lC2p6uLB6XlAYguaGPZ5BbXFc+Cj0fkwDL2uJt3ClzI=;
 b=XTHHI8PqN/LdLPSlB6xbygNhYkM0R9CaZUwps7jdNB2Z7MSFDw2f6Ac+Sgkd55Kfhr
 f0hEQBnZgjksjzoffJj6lcInz85GftnqzS+sZ6HRMlYaCrc3887UPI8EdT/cecjZPrpC
 42T0aLoJDO0jLv0zYgcx7QIqwTVJYx+bPrqX2TYCNz0X6Uv+a0YfuCGRrwU9zp/dujbc
 7aK3BQNtiNk1bWauOcQi/vCnPrysN5222T+ltTl85w1PaUi9mSwc/YbllpM+iqkyBRmM
 +PsYEXLtc4lrV1KwFaM+Rc4iDO7SA48a9msgMtZxjuFg00GXLGbdGOAiennq2JuXijmF
 QafQ==
X-Gm-Message-State: AOAM531ilgF/iiCztbrB8TKLazu9UeXqEv5e4VHT54hgEHCxkjp9OvrQ
 SnuOxDJ15xfAzqR+9Mh/UdJEsAC7SQ6oMLqFSVI=
X-Google-Smtp-Source: ABdhPJwFZjqWQ4acYGaMkBwGD7uWAq2L5KnhmruVDalVL9rJ60KKCcD0VoTJLiUvfEHgk1+fxR3dc/qJr8DuXuWHaIc=
X-Received: by 2002:a2e:a7c5:: with SMTP id x5mr8179645ljp.258.1625061391040; 
 Wed, 30 Jun 2021 06:56:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210630114634.2168872-1-marcel@redhat.com>
In-Reply-To: <20210630114634.2168872-1-marcel@redhat.com>
From: Yuval Shaia <yuval.shaia.ml@gmail.com>
Date: Wed, 30 Jun 2021 16:55:45 +0300
Message-ID: <CAMPkWoNXaRN_PUr71DEVSEsSzz0xEKy5F5ueEipqDH_2aKYW9Q@mail.gmail.com>
Subject: Re: [PATCH] pvrdma: Ensure correct input on ring init (CVE-2021-3607)
To: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000f384e005c5fc16c1"
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=yuval.shaia.ml@gmail.com; helo=mail-lj1-x230.google.com
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
Cc: marcel@redhat.com, vv474172261@gmail.com, mcascell@redhat.com,
 pj.pandit@yahoo.co.in, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f384e005c5fc16c1
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Jun 2021 at 14:46, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
wrote:

> Check the guest passed a non zero page count
> for pvrdma device ring buffers.
>
> Fixes: CVE-2021-3607
> Reported-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
> Reviewed-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
> Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
> ---
>  hw/rdma/vmw/pvrdma_main.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
> index 84ae8024fc..7c0c3551a8 100644
> --- a/hw/rdma/vmw/pvrdma_main.c
> +++ b/hw/rdma/vmw/pvrdma_main.c
> @@ -92,6 +92,11 @@ static int init_dev_ring(PvrdmaRing *ring,
> PvrdmaRingState **ring_state,
>      uint64_t *dir, *tbl;
>      int rc = 0;
>
> +    if (!num_pages) {
> +        rdma_error_report("Ring pages count must be strictly positive");
> +        return -EINVAL;
> +    }
> +
>

Reviewed-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
Tested-by: Yuval Shaia <yuval.shaia.ml@gmail.com>


>      dir = rdma_pci_dma_map(pci_dev, dir_addr, TARGET_PAGE_SIZE);
>      if (!dir) {
>          rdma_error_report("Failed to map to page directory (ring %s)",
> name);
> --
> 2.31.1
>
>

--000000000000f384e005c5fc16c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, 30 Jun 2021 at 14:46, Marcel =
Apfelbaum &lt;<a href=3D"mailto:marcel.apfelbaum@gmail.com">marcel.apfelbau=
m@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Check the guest passed a non zero page count<br>
for pvrdma device ring buffers.<br>
<br>
Fixes: CVE-2021-3607<br>
Reported-by: VictorV (Kunlun Lab) &lt;<a href=3D"mailto:vv474172261@gmail.c=
om" target=3D"_blank">vv474172261@gmail.com</a>&gt;<br>
Reviewed-by: VictorV (Kunlun Lab) &lt;<a href=3D"mailto:vv474172261@gmail.c=
om" target=3D"_blank">vv474172261@gmail.com</a>&gt;<br>
Signed-off-by: Marcel Apfelbaum &lt;<a href=3D"mailto:marcel@redhat.com" ta=
rget=3D"_blank">marcel@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/rdma/vmw/pvrdma_main.c | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c<br>
index 84ae8024fc..7c0c3551a8 100644<br>
--- a/hw/rdma/vmw/pvrdma_main.c<br>
+++ b/hw/rdma/vmw/pvrdma_main.c<br>
@@ -92,6 +92,11 @@ static int init_dev_ring(PvrdmaRing *ring, PvrdmaRingSta=
te **ring_state,<br>
=C2=A0 =C2=A0 =C2=A0uint64_t *dir, *tbl;<br>
=C2=A0 =C2=A0 =C2=A0int rc =3D 0;<br>
<br>
+=C2=A0 =C2=A0 if (!num_pages) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rdma_error_report(&quot;Ring pages count must =
be strictly positive&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
+=C2=A0 =C2=A0 }<br>
+<br></blockquote><div><br></div>Reviewed-by: Yuval Shaia &lt;<a href=3D"ma=
ilto:yuval.shaia.ml@gmail.com" target=3D"_blank">yuval.shaia.ml@gmail.com</=
a>&gt;<br><div>Tested-by: Yuval Shaia &lt;<a href=3D"mailto:yuval.shaia.ml@=
gmail.com" target=3D"_blank">yuval.shaia.ml@gmail.com</a>&gt;</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0dir =3D rdma_pci_dma_map(pci_dev, dir_addr, TARGET_PAGE=
_SIZE);<br>
=C2=A0 =C2=A0 =C2=A0if (!dir) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rdma_error_report(&quot;Failed to map to =
page directory (ring %s)&quot;, name);<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000f384e005c5fc16c1--

