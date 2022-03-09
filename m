Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 079BA4D30EB
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 15:20:27 +0100 (CET)
Received: from localhost ([::1]:54398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRxAw-00075b-0B
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 09:20:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRx9d-0006OE-RB
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 09:19:05 -0500
Received: from [2a00:1450:4864:20::331] (port=50735
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRx9c-0004uR-4R
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 09:19:05 -0500
Received: by mail-wm1-x331.google.com with SMTP id l10so1491217wmb.0
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 06:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R12VSaEhe448bgNcMknQ6XNwodGUpXf7vRxcwh3KDmQ=;
 b=kvVbh1g28q6ZK+VNEGmApeYJw8PK54DF2KZL0TW6iuGSqI9k/ljveO9wgLkdIoHJoY
 BHIJMWEH8zA+DnrbvE7m6XGxt7MoASc62xf870B4y5l8SVb7LC9Q6+wRXthAtGpEpSmD
 LU9FsVqlHrhUMJitkS0Samp55IGJqwVTUk2KkuFKF7oY4dSnaPPNEokUBEOsXT10wv3X
 2xFZ1ImoJxj0D3Y5bD7jmsWZeeuiPmb+fUVWJgxIGBzQAzb2QuBMmpV2vtCR5ai4F+4t
 UT6kK1u3N51KU45Pap+9GDw/MbnncJV3BJD5mh00j42h7U0uKO9Yfp0a1pwImnpcAhRo
 sepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R12VSaEhe448bgNcMknQ6XNwodGUpXf7vRxcwh3KDmQ=;
 b=X4yTCjyR3frLMLA/5FPSnDRlY96/IOLxn1ZFJmLVgWvxdAVdHl5dpP9o+JXO+sfNgH
 W/rzW829AKld9B2aKKObI8/J5pNa+9zv+0ZLuUgCogbta+ya5LKmrzNzZeU664uZJJfP
 2MRMVgrZPWqntB1l7gWKhS64iQnBW2c++LhHO73p9cgwn/pGVo42nfQVlLH+/ERpqfMM
 /nsJfyhk2IkwipXbaJnSFDiaPgN65myhcM5DCTFEyJ7Vi7H89TNB2I7gQ+1MZmVJxWw8
 vhZgtLbSEO9lnD6UXOLfwlLfauUIznRGDewiY721eb88Nf6uWuICop86apqGv+Jb16jn
 3SEg==
X-Gm-Message-State: AOAM533aanUUseeiDk0zh4HW2MPe0zSjam5M7e/vooFdMPTpNJicnLkr
 +hKUiZ6NemvXYACya75CvI+DhZooO36ygRU9FlY=
X-Google-Smtp-Source: ABdhPJylV2V+9HQVD6EZoMKUFQaRA6ryUqRmtjPRXhUTUkRt6/sDlJDh+0YYkLpznuJc+lI33sh35yS3awr37l61vVc=
X-Received: by 2002:a05:600c:1c9f:b0:389:cf43:da64 with SMTP id
 k31-20020a05600c1c9f00b00389cf43da64mr3604638wms.206.1646835542789; Wed, 09
 Mar 2022 06:19:02 -0800 (PST)
MIME-Version: 1.0
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-9-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1640199934-455149-9-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 9 Mar 2022 18:18:50 +0400
Message-ID: <CAJ+F1CJXSsGLnozEJLX84tENO9Lw=Hhra0Bwv3oy_4MavTHmVw@mail.gmail.com>
Subject: Re: [PATCH V7 08/29] memory: flat section iterator
To: Steve Sistare <steven.sistare@oracle.com>
Content-Type: multipart/alternative; boundary="00000000000088128105d9c9c7eb"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000088128105d9c9c7eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Dec 23, 2021 at 12:17 AM Steve Sistare <steven.sistare@oracle.com>
wrote:

> Add an iterator over the sections of a flattened address space.
>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  include/exec/memory.h | 31 +++++++++++++++++++++++++++++++
>  softmmu/memory.c      | 20 ++++++++++++++++++++
>  2 files changed, 51 insertions(+)
>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 137f5f3..9660475 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -2338,6 +2338,37 @@ void
> memory_region_set_ram_discard_manager(MemoryRegion *mr,
>                                             RamDiscardManager *rdm);
>
>  /**
> + * memory_region_section_cb: callback for
> address_space_flat_for_each_section()
> + *
> + * @s: MemoryRegionSection of the range
> + * @opaque: data pointer passed to address_space_flat_for_each_section()
> + * @errp: error message, returned to the
> address_space_flat_for_each_section
> + *        caller.
> + *
> + * Returns: non-zero to stop the iteration, and 0 to continue.  The same
> + * non-zero value is returned to the address_space_flat_for_each_section
> caller.
> + */
> +
> +typedef int (*memory_region_section_cb)(MemoryRegionSection *s,
> +                                        void *opaque,
> +                                        Error **errp);
> +
> +/**
> + * address_space_flat_for_each_section: walk the ranges in the address
> space
> + * flat view and call @func for each.  Return 0 on success, else return
> non-zero
> + * with a message in @errp.
> + *
> + * @as: target address space
> + * @func: callback function
> + * @opaque: passed to @func
> + * @errp: passed to @func
> + */
> +int address_space_flat_for_each_section(AddressSpace *as,
> +                                        memory_region_section_cb func,
> +                                        void *opaque,
> +                                        Error **errp);
> +
> +/**
>   * memory_region_find: translate an address/size relative to a
>   * MemoryRegion into a #MemoryRegionSection.
>   *
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 30b2f68..40f3522 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2663,6 +2663,26 @@ bool memory_region_is_mapped(MemoryRegion *mr)
>      return mr->container ? true : false;
>  }
>
> +int address_space_flat_for_each_section(AddressSpace *as,
> +                                        memory_region_section_cb func,
> +                                        void *opaque,
> +                                        Error **errp)
> +{
> +    FlatView *view =3D address_space_get_flatview(as);
> +    FlatRange *fr;
> +    int ret;
> +
> +    FOR_EACH_FLAT_RANGE(fr, view) {
> +        MemoryRegionSection section =3D section_from_flat_range(fr, view=
);
> +        ret =3D func(&section, opaque, errp);
> +        if (ret) {
> +            return ret;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>  /* Same as memory_region_find, but it does not add a reference to the
>   * returned region.  It must be called from an RCU critical section.
>   */
> --
> 1.8.3.1
>
>
>
lgtm,

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


--=20
Marc-Andr=C3=A9 Lureau

--00000000000088128105d9c9c7eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 23, 2021 at 12:17 AM St=
eve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sistare=
@oracle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Add an iterator over the sections of a flattened address space.<=
br>
<br>
Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.co=
m" target=3D"_blank">steven.sistare@oracle.com</a>&gt;<br>
---<br>
=C2=A0include/exec/memory.h | 31 +++++++++++++++++++++++++++++++<br>
=C2=A0softmmu/memory.c=C2=A0 =C2=A0 =C2=A0 | 20 ++++++++++++++++++++<br>
=C2=A02 files changed, 51 insertions(+)<br>
<br>
diff --git a/include/exec/memory.h b/include/exec/memory.h<br>
index 137f5f3..9660475 100644<br>
--- a/include/exec/memory.h<br>
+++ b/include/exec/memory.h<br>
@@ -2338,6 +2338,37 @@ void memory_region_set_ram_discard_manager(MemoryReg=
ion *mr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 RamDiscardManager *rdm);<br>
<br>
=C2=A0/**<br>
+ * memory_region_section_cb: callback for address_space_flat_for_each_sect=
ion()<br>
+ *<br>
+ * @s: MemoryRegionSection of the range<br>
+ * @opaque: data pointer passed to address_space_flat_for_each_section()<b=
r>
+ * @errp: error message, returned to the address_space_flat_for_each_secti=
on<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 caller.<br>
+ *<br>
+ * Returns: non-zero to stop the iteration, and 0 to continue.=C2=A0 The s=
ame<br>
+ * non-zero value is returned to the address_space_flat_for_each_section c=
aller.<br>
+ */<br>
+<br>
+typedef int (*memory_region_section_cb)(MemoryRegionSection *s,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *op=
aque,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **=
errp);<br>
+<br>
+/**<br>
+ * address_space_flat_for_each_section: walk the ranges in the address spa=
ce<br>
+ * flat view and call @func for each.=C2=A0 Return 0 on success, else retu=
rn non-zero<br>
+ * with a message in @errp.<br>
+ *<br>
+ * @as: target address space<br>
+ * @func: callback function<br>
+ * @opaque: passed to @func<br>
+ * @errp: passed to @func<br>
+ */<br>
+int address_space_flat_for_each_section(AddressSpace *as,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_r=
egion_section_cb func,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *op=
aque,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **=
errp);<br>
+<br>
+/**<br>
=C2=A0 * memory_region_find: translate an address/size relative to a<br>
=C2=A0 * MemoryRegion into a #MemoryRegionSection.<br>
=C2=A0 *<br>
diff --git a/softmmu/memory.c b/softmmu/memory.c<br>
index 30b2f68..40f3522 100644<br>
--- a/softmmu/memory.c<br>
+++ b/softmmu/memory.c<br>
@@ -2663,6 +2663,26 @@ bool memory_region_is_mapped(MemoryRegion *mr)<br>
=C2=A0 =C2=A0 =C2=A0return mr-&gt;container ? true : false;<br>
=C2=A0}<br>
<br>
+int address_space_flat_for_each_section(AddressSpace *as,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_r=
egion_section_cb func,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *op=
aque,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **=
errp)<br>
+{<br>
+=C2=A0 =C2=A0 FlatView *view =3D address_space_get_flatview(as);<br>
+=C2=A0 =C2=A0 FlatRange *fr;<br>
+=C2=A0 =C2=A0 int ret;<br>
+<br>
+=C2=A0 =C2=A0 FOR_EACH_FLAT_RANGE(fr, view) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 MemoryRegionSection section =3D section_from_f=
lat_range(fr, view);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D func(&amp;section, opaque, errp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
+<br>
=C2=A0/* Same as memory_region_find, but it does not add a reference to the=
<br>
=C2=A0 * returned region.=C2=A0 It must be called from an RCU critical sect=
ion.<br>
=C2=A0 */<br>
-- <br>
1.8.3.1<br>
<br>
<br></blockquote><div><br></div><div>lgtm,</div><div><br></div><div>Reviewe=
d-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.=
com">marcandre.lureau@redhat.com</a>&gt; <br></div></div><br clear=3D"all">=
<br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lurea=
u<br></div></div>

--00000000000088128105d9c9c7eb--

