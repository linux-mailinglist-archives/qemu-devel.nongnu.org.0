Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9335466606D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 17:28:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFdxO-000095-3t; Wed, 11 Jan 2023 11:28:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.daney@fungible.com>)
 id 1pFdtC-0006x7-HK
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:23:46 -0500
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <david.daney@fungible.com>)
 id 1pFdt9-0004aQ-Ri
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:23:45 -0500
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1433ef3b61fso16018355fac.10
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 08:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fungible.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RGqntA6TXpxPqNtwO+iPD8ITry4FocB1TueRIrxVQlA=;
 b=UGtOvNHut3nRhtp6amY/h3wWduYcB1Vjkn3Ujp3nPN7+FTEKQaRzrDfLbfAhSbrAkt
 mOBpO9MGfB/giMTOuLStdZCEql6RcxvAWCMFP65G49DECRRkeTa7p5j8H5pe4bNoyHIr
 X2Y2eX3ZVJ6LR5Tr8GUuBcsuePO1Ahn8+ie28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RGqntA6TXpxPqNtwO+iPD8ITry4FocB1TueRIrxVQlA=;
 b=FocuRb0f3jlVYYwcQfBT9abwbxXBw/u5MvttSxC3nFpZYLuR4aFuE1CGl/JHd9FzaO
 padcSpKFYEPbO0wslOvHJR4a1s7YzKnE4+3J3seGnmuFuKXQ5x7TuPjOhL2F4Lbwp6g3
 8ismZ+J8rv3q5R5G07k33cXblqRJT1axx6eZeQ9sl3hfqI1Q85NG+Fr1UTCiAEL+Q5Dy
 l5KgUd+zGlR01Sj/+YQ2HNhmKOsfuratrNotbzhdqdtH/tvCW+k6hRP40ULgu00xsQRL
 Cphvnjbq6bGOrOFTXCMnEqIaciAZBrGRXZIDWbdeh/VFsLtgS457xJkxMh9hbLY4u6Gs
 I4iQ==
X-Gm-Message-State: AFqh2kp5Q2P3tvAEXfyPaq2gIxLEUE9rzMn4V7TCYU5tibS39VPb04Im
 gC053s6gg9uyfwXJjdKCaooOSyQClbK3L8AsgVvf+A==
X-Google-Smtp-Source: AMrXdXumlKWmhwpuZVt9wmWlR3s6iUjArkQou3HBf8xdhIe87VKRfahlKtvMvkL6Sa4E/DS6wVsYKGiiTcVmfMAoQNo=
X-Received: by 2002:a05:6870:1d13:b0:15b:8aa2:9090 with SMTP id
 pa19-20020a0568701d1300b0015b8aa29090mr1132961oab.47.1673454221202; Wed, 11
 Jan 2023 08:23:41 -0800 (PST)
MIME-Version: 1.0
References: <20230109105809.163975-1-dgilbert@redhat.com>
In-Reply-To: <20230109105809.163975-1-dgilbert@redhat.com>
From: David Daney <david.daney@fungible.com>
Date: Wed, 11 Jan 2023 10:23:30 -0600
Message-ID: <CAFHkhwhehrxy0Ds1NykzT+UJtzW+vEYtK2xySZ2Vw+FN-0gDvg@mail.gmail.com>
Subject: Re: [PATCH] virtio-rng-pci: fix migration compat for vectors
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, eduardo@habkost.net, 
 stefanha@redhat.com
Content-Type: multipart/alternative; boundary="00000000000067322c05f1ff6c5a"
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=david.daney@fungible.com; helo=mail-oa1-x33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 11 Jan 2023 11:28:04 -0500
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000067322c05f1ff6c5a
Content-Type: text/plain; charset="UTF-8"

Seems good to me.

Acked-by: David Daney <david.daney@fungible.com>

On Mon, Jan 9, 2023 at 4:58 AM Dr. David Alan Gilbert (git) <
dgilbert@redhat.com> wrote:

> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> Fixup the migration compatibility for existing machine types
> so that they do not enable msi-x.
>
> Symptom:
>
> (qemu) qemu: get_pci_config_device: Bad config data: i=0x34 read: 84
> device: 98 cmask: ff wmask: 0 w1cmask:0
> qemu: Failed to load PCIDevice:config
> qemu: Failed to load virtio-rng:virtio
> qemu: error while loading state for instance 0x0 of device
> '0000:00:03.0/virtio-rng'
> qemu: load of migration failed: Invalid argument
>
> Note: This fix will break migration from 7.2->7.2-fixed with this patch
>
> bz: https://bugzilla.redhat.com/show_bug.cgi?id=2155749
> Fixes: 9ea02e8f1 ("virtio-rng-pci: Allow setting nvectors, so we can use
> MSI-X")
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  hw/core/machine.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index f589b92909..45459d1cef 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -45,6 +45,7 @@ const size_t hw_compat_7_2_len =
> G_N_ELEMENTS(hw_compat_7_2);
>
>  GlobalProperty hw_compat_7_1[] = {
>      { "virtio-device", "queue_reset", "false" },
> +    { "virtio-rng-pci", "vectors", "0" },
>  };
>  const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
>
> --
> 2.39.0
>
>

--00000000000067322c05f1ff6c5a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Seems good to me.<br></div><div><br></div><div>Acked-=
by: David Daney &lt;<a href=3D"mailto:david.daney@fungible.com">david.daney=
@fungible.com</a>&gt;</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, Jan 9, 2023 at 4:58 AM Dr. David Alan Gi=
lbert (git) &lt;<a href=3D"mailto:dgilbert@redhat.com">dgilbert@redhat.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">F=
rom: &quot;Dr. David Alan Gilbert&quot; &lt;<a href=3D"mailto:dgilbert@redh=
at.com" target=3D"_blank">dgilbert@redhat.com</a>&gt;<br>
<br>
Fixup the migration compatibility for existing machine types<br>
so that they do not enable msi-x.<br>
<br>
Symptom:<br>
<br>
(qemu) qemu: get_pci_config_device: Bad config data: i=3D0x34 read: 84 devi=
ce: 98 cmask: ff wmask: 0 w1cmask:0<br>
qemu: Failed to load PCIDevice:config<br>
qemu: Failed to load virtio-rng:virtio<br>
qemu: error while loading state for instance 0x0 of device &#39;0000:00:03.=
0/virtio-rng&#39;<br>
qemu: load of migration failed: Invalid argument<br>
<br>
Note: This fix will break migration from 7.2-&gt;7.2-fixed with this patch<=
br>
<br>
bz: <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D2155749" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.cgi?=
id=3D2155749</a><br>
Fixes: 9ea02e8f1 (&quot;virtio-rng-pci: Allow setting nvectors, so we can u=
se MSI-X&quot;)<br>
<br>
Signed-off-by: Dr. David Alan Gilbert &lt;<a href=3D"mailto:dgilbert@redhat=
.com" target=3D"_blank">dgilbert@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/core/machine.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/hw/core/machine.c b/hw/core/machine.c<br>
index f589b92909..45459d1cef 100644<br>
--- a/hw/core/machine.c<br>
+++ b/hw/core/machine.c<br>
@@ -45,6 +45,7 @@ const size_t hw_compat_7_2_len =3D G_N_ELEMENTS(hw_compat=
_7_2);<br>
<br>
=C2=A0GlobalProperty hw_compat_7_1[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0{ &quot;virtio-device&quot;, &quot;queue_reset&quot;, &=
quot;false&quot; },<br>
+=C2=A0 =C2=A0 { &quot;virtio-rng-pci&quot;, &quot;vectors&quot;, &quot;0&q=
uot; },<br>
=C2=A0};<br>
=C2=A0const size_t hw_compat_7_1_len =3D G_N_ELEMENTS(hw_compat_7_1);<br>
<br>
-- <br>
2.39.0<br>
<br>
</blockquote></div>

--00000000000067322c05f1ff6c5a--

