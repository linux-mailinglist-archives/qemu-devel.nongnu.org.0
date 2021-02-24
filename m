Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4338323A9A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 11:35:13 +0100 (CET)
Received: from localhost ([::1]:35252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lErVg-0001kN-Dr
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 05:35:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lErUb-0000tR-1Y
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 05:34:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lErUY-0001FT-2W
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 05:34:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614162840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ewn+KMSoi9jOD1z/fDcVhGYOUIzJhbrXIlgKrDSVTVY=;
 b=VBkGGvQT2m0WQSOXRcM7NMYiuEGuKRp44qKLjxvfVDkorstLojTQKM+8CQTkT+OPk0pjcv
 5LSIddCbTFyBLZX2feY0tuaeLwQ/UrYGsOuwFRCRlLtdR9gEEqlM+gk3cEUKq5y2Q0ZhtQ
 tp2I/NG5vsJaMWkXzQEQpo7XEorGCqU=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-Zcl48AS7Pd6iL95ptl3I1Q-1; Wed, 24 Feb 2021 05:33:43 -0500
X-MC-Unique: Zcl48AS7Pd6iL95ptl3I1Q-1
Received: by mail-il1-f199.google.com with SMTP id f2so1157182ils.22
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 02:33:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ewn+KMSoi9jOD1z/fDcVhGYOUIzJhbrXIlgKrDSVTVY=;
 b=AQa9h1yz35hDln/PlkB9I43t8iKS8Pyz8Pb2xQes5aiLIRaFEx80e92ZlPeIyAVqx0
 6AguzrKufvwltRIK/ZTOikQInTbpwtf5V8+VxBLeMG3KDnp4Lx1qurqDQNUhb7/iwcj1
 5s+KS2QidxscdWFoiYfYYKalZskDgoEPMh4m4LXp+5Do01sHrG4H+mZLrHPnuv0AP/y/
 IvOXxnR1OyICV2K1P6i4IsV0K425F153/Ht8TQ98pi9VGM+lP1FDbgFojSuwirR+8iLD
 czRHmMHvTkx1S8UfJXb9jCdZTX/8cwALNsW2MvyZvsCEvBSx/sH4/c5eLfDXj2wKkbyr
 0TtA==
X-Gm-Message-State: AOAM5328AFw9RxOjrN/pJgedzmlT+ZNzCU3m33fr8KsBy6+sytH02NQx
 YKhf61O3slOSQqAYtWSFeExTlHlFumQO6iAc1fR/Aa4SVYXJiihlpE5zle+9liUeLX+UNjQQZih
 L8KLOGse1rBRxe2fcbQTajBiw3lK059c=
X-Received: by 2002:a02:9716:: with SMTP id x22mr15787996jai.36.1614162823075; 
 Wed, 24 Feb 2021 02:33:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNrvrK86m5Kq8HytiOsruiJI+d4J4JFiinA+72RWXLfy0N5nW3eJ96mcRwlzYaoTMbzAC185vMBS308kNgz9A=
X-Received: by 2002:a02:9716:: with SMTP id x22mr15787983jai.36.1614162822868; 
 Wed, 24 Feb 2021 02:33:42 -0800 (PST)
MIME-Version: 1.0
References: <20210222161017.570837-1-stefanha@redhat.com>
 <20210222161017.570837-3-stefanha@redhat.com>
In-Reply-To: <20210222161017.570837-3-stefanha@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 24 Feb 2021 14:33:32 +0400
Message-ID: <CAMxuvaxXpRFa+V3H5qmKe4MAo+vUrasMTc+y_s8w4AVQGdnkAA@mail.gmail.com>
Subject: Re: [PATCH 2/3] memory: add memory_region_is_mapped_shared()
To: Stefan Hajnoczi <stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000aaca7805bc129138"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Wolf, Kevin" <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000aaca7805bc129138
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 22, 2021 at 8:11 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:

> Add a function to query whether a memory region is mmap(MAP_SHARED).
> This will be used to check that vhost-user memory regions can be shared
> with the device backend process in the next patch.
>
> An inline function in "exec/memory.h" would have been nice but RAMBlock
> fields are only accessible from memory.c (see "exec/ramblock.h").
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/exec/memory.h | 11 +++++++++++
>  softmmu/memory.c      |  6 ++++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index c6fb714e49..7b7dbe9fd0 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -2457,6 +2457,17 @@ static inline bool
> memory_access_is_direct(MemoryRegion *mr, bool is_write)
>      }
>  }
>
> +/**
> + * memory_region_is_mapped_shared: check whether a memory region is
> + * mmap(MAP_SHARED)
> + *
> + * Returns %true is a memory region is mmap(MAP_SHARED). This is always
> false
> + * on memory regions that do not support memory_region_get_ram_ptr().
> + *
> + * @mr: the memory region being queried
> + */
> +bool memory_region_is_mapped_shared(MemoryRegion *mr);
> +
>  /**
>   * address_space_read: read from an address space.
>   *
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 874a8fccde..e6631e5d4c 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1809,6 +1809,12 @@ bool memory_region_is_ram_device(MemoryRegion *mr)
>      return mr->ram_device;
>  }
>
> +bool memory_region_is_mapped_shared(MemoryRegion *mr)
> +{
> +    return memory_access_is_direct(mr, false) &&
>

memory_access_is_direct is a bit special, it treats ram-device differently
from rom-device since commit 4a2e242bbb306 ("memory: Don't use memcpy for
ram_device regions").

I don't think it's an issue for now, but I wonder if in the future we will
share ram-device as well.

Where did you get the idea to use that function? I suppose that's also the
one we use somewhere else in the code path sharing the VM memory.

+           (mr->ram_block->flags & RAM_SHARED);
> +}
> +
>  uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr)
>  {
>      uint8_t mask = mr->dirty_log_mask;
> --
> 2.29.2
>
>

--000000000000aaca7805bc129138
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 22, 2021 at 8:11 PM Stefa=
n Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com">stefanha@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Ad=
d a function to query whether a memory region is mmap(MAP_SHARED).<br>
This will be used to check that vhost-user memory regions can be shared<br>
with the device backend process in the next patch.<br>
<br>
An inline function in &quot;exec/memory.h&quot; would have been nice but RA=
MBlock<br>
fields are only accessible from memory.c (see &quot;exec/ramblock.h&quot;).=
<br>
<br>
Signed-off-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" t=
arget=3D"_blank">stefanha@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/exec/memory.h | 11 +++++++++++<br>
=C2=A0softmmu/memory.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++++++<br>
=C2=A02 files changed, 17 insertions(+)<br>
<br>
diff --git a/include/exec/memory.h b/include/exec/memory.h<br>
index c6fb714e49..7b7dbe9fd0 100644<br>
--- a/include/exec/memory.h<br>
+++ b/include/exec/memory.h<br>
@@ -2457,6 +2457,17 @@ static inline bool memory_access_is_direct(MemoryReg=
ion *mr, bool is_write)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+/**<br>
+ * memory_region_is_mapped_shared: check whether a memory region is<br>
+ * mmap(MAP_SHARED)<br>
+ *<br>
+ * Returns %true is a memory region is mmap(MAP_SHARED). This is always fa=
lse<br>
+ * on memory regions that do not support memory_region_get_ram_ptr().<br>
+ *<br>
+ * @mr: the memory region being queried<br>
+ */<br>
+bool memory_region_is_mapped_shared(MemoryRegion *mr);<br>
+<br>
=C2=A0/**<br>
=C2=A0 * address_space_read: read from an address space.<br>
=C2=A0 *<br>
diff --git a/softmmu/memory.c b/softmmu/memory.c<br>
index 874a8fccde..e6631e5d4c 100644<br>
--- a/softmmu/memory.c<br>
+++ b/softmmu/memory.c<br>
@@ -1809,6 +1809,12 @@ bool memory_region_is_ram_device(MemoryRegion *mr)<b=
r>
=C2=A0 =C2=A0 =C2=A0return mr-&gt;ram_device;<br>
=C2=A0}<br>
<br>
+bool memory_region_is_mapped_shared(MemoryRegion *mr)<br>
+{<br>
+=C2=A0 =C2=A0 return memory_access_is_direct(mr, false) &amp;&amp;<br></bl=
ockquote><div><br></div><div>memory_access_is_direct is a bit special, it t=
reats ram-device differently from rom-device since commit 4a2e242bbb306 (&q=
uot;memory: Don&#39;t use memcpy for ram_device regions&quot;).</div><div><=
br></div><div>I don&#39;t think it&#39;s an issue for now, but I wonder if =
in the future we will share ram-device as well.</div><div><br></div><div>Wh=
ere did you get the idea to use that function? I suppose that&#39;s also th=
e one we use somewhere else in the code path sharing the VM memory.<br></di=
v><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(mr-&gt;ram_block-&gt;flags &amp;=
 RAM_SHARED);<br>
+}<br>
+<br>
=C2=A0uint8_t memory_region_get_dirty_log_mask(MemoryRegion *mr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0uint8_t mask =3D mr-&gt;dirty_log_mask;<br>
-- <br>
2.29.2<br>
<br>
</blockquote></div></div>

--000000000000aaca7805bc129138--


