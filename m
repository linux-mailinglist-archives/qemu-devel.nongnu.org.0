Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5993BF9AD
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 14:03:43 +0200 (CEST)
Received: from localhost ([::1]:52750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Sko-0002hU-EU
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 08:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m1Sih-0000h1-F0
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:01:34 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:34323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m1Sif-0003rz-GX
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:01:31 -0400
Received: by mail-ej1-x634.google.com with SMTP id hr1so9199403ejc.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 05:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HVGcFNKQ/QamG8kWYFUwsfWKyMVDXAQQ5DmGd//lFQk=;
 b=bfNy3RbYIz0xuTnF0ps5UgmtmivQs67DPiuzEdRntcvi2hJhDcZqx0YZGNUgDjXpaR
 GZh1aNh60IHwut9T8IHpySCXLE0noG/LplaU8grkmoSq/YruqV/dOSCb63EKFQ8b/HFy
 fOQnYBwJQVtuqENUrH2MPut1uFvToHp0cnach2aamJ9jMaR85kMVawBRARzW8/4j7dm9
 G4zga2+mx746qblhTWDAsF7V6b1tLHB+phrIYs/m/fcsgg2vZkk8rudx8pA/xOIsMv5o
 36EsqclaJsyrLLjVt5jgaZ+2orYYFzKcox8cBFghR3syCZtn8oMwIFsu6OotHYuKglkm
 Y1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HVGcFNKQ/QamG8kWYFUwsfWKyMVDXAQQ5DmGd//lFQk=;
 b=mbjtPP0DGIvTActF/o+XHR147Mu4livKPKDWVuLjp9qnJpbKXREAEmZbTQiZ37hYJz
 0a7yPaUTCxQBcZ1S8bpFEsnehIFfwJPqJmJPGMUYLzuVImA/MtZ8xTS00cQGTSUwP3d4
 IYViYnWWYPsIZ9gDi3gODPsIm7jIEd3BIdKtDr2ncWrQgA/9T/pDAcmqTkSJk+0wnse7
 rO0pX4g2CCqWzSSJsg6mFPQHCGNvAOImnarn/FkHgYMXMUnGdfpob0w+IqpAC9Qe7QGO
 daYz7V8KemHsNnFsBcTV+EVz0OeNjNJWNW3r0OXOCJCzMDntFCRijZJdKhanu1FB72Qs
 k5hw==
X-Gm-Message-State: AOAM533fnMyNiD4Xe19MyZZ6Rxla5KxUz2U8zLHhUSjn+zkgPNq/YDmH
 a0nVeZjjAnKWtd5JA9+L6l5piQta0WW6XMdCRgM=
X-Google-Smtp-Source: ABdhPJx5E7fBBDDYnrgENeK6H5SGiBfXjOVs6BFUexfbZQlwRSelfFyW1VucOSY5h22BXJTHew3lEOCgIgaVYdeLWE8=
X-Received: by 2002:a17:907:ea5:: with SMTP id
 ho37mr30431251ejc.109.1625745686992; 
 Thu, 08 Jul 2021 05:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-2-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1625678434-240960-2-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 8 Jul 2021 16:01:15 +0400
Message-ID: <CAJ+F1CJ+rOSfuvpmF=u-HbmWxKkA-F8cobww1b4M-tnZO=ra5g@mail.gmail.com>
Subject: Re: [PATCH V5 01/25] qemu_ram_volatile
To: Steve Sistare <steven.sistare@oracle.com>
Content-Type: multipart/alternative; boundary="0000000000002b1be505c69b6a5d"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x634.google.com
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002b1be505c69b6a5d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jul 7, 2021 at 9:35 PM Steve Sistare <steven.sistare@oracle.com>
wrote:

> Add a function that returns true if any ram_list block represents
> volatile memory.
>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  include/exec/memory.h |  8 ++++++++
>  softmmu/memory.c      | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
>
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index b116f7c..7ad63f8 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -2649,6 +2649,14 @@ bool ram_block_discard_is_disabled(void);
>   */
>  bool ram_block_discard_is_required(void);
>
> +/**
> + * qemu_ram_volatile: return true if any memory regions are writable and
> not
> + * backed by shared memory.
> + *
> + * @errp: returned error message identifying the bad region.
> + */
> +bool qemu_ram_volatile(Error **errp);
>

Usually, bool-value functions with an error return true on success. If it
deviates from the recommendation, it should at least be documented.

Also, we have a preference for using _is_ in the function name for such
tests.

+
>  #endif
>
>  #endif
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index f016151..e9536bc 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -2714,6 +2714,36 @@ void memory_global_dirty_log_stop(void)
>      memory_global_dirty_log_do_stop();
>  }
>
> +/*
> + * Return true if any memory regions are writable and not backed by shar=
ed
> + * memory.
> + */
>

Let's not duplicate API comments.

+bool qemu_ram_volatile(Error **errp)
> +{
> +    RAMBlock *block;
> +    MemoryRegion *mr;
> +    bool ret =3D false;
> +
> +    rcu_read_lock();
>

RCU_READ_LOCK_GUARD()


> +    QLIST_FOREACH_RCU(block, &ram_list.blocks, next) {
>

RAMBLOCK_FOREACH() should do.

Or rather use the qemu_ram_foreach_block() helper.


+        mr =3D block->mr;
> +        if (mr &&
> +            memory_region_is_ram(mr) &&
> +            !memory_region_is_ram_device(mr) &&
> +            !memory_region_is_rom(mr) &&
> +            (block->fd =3D=3D -1 || !qemu_ram_is_shared(block))) {
> +
> +            error_setg(errp, "Memory region %s is volatile",
> +                       memory_region_name(mr));
> +            ret =3D true;
> +            break;
> +        }
> +    }
> +
> +    rcu_read_unlock();
> +    return ret;
> +}
> +
>  static void listener_add_address_space(MemoryListener *listener,
>                                         AddressSpace *as)
>  {
> --
> 1.8.3.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000002b1be505c69b6a5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 7, 2021 at 9:35 PM Stev=
e Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sistare@o=
racle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Add a function that returns true if any ram_list block represent=
s<br>
volatile memory.<br>
<br>
Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.co=
m" target=3D"_blank">steven.sistare@oracle.com</a>&gt;<br>
---<br>
=C2=A0include/exec/memory.h |=C2=A0 8 ++++++++<br>
=C2=A0softmmu/memory.c=C2=A0 =C2=A0 =C2=A0 | 30 +++++++++++++++++++++++++++=
+++<br>
=C2=A02 files changed, 38 insertions(+)<br>
<br>
diff --git a/include/exec/memory.h b/include/exec/memory.h<br>
index b116f7c..7ad63f8 100644<br>
--- a/include/exec/memory.h<br>
+++ b/include/exec/memory.h<br>
@@ -2649,6 +2649,14 @@ bool ram_block_discard_is_disabled(void);<br>
=C2=A0 */<br>
=C2=A0bool ram_block_discard_is_required(void);<br>
<br>
+/**<br>
+ * qemu_ram_volatile: return true if any memory regions are writable and n=
ot<br>
+ * backed by shared memory.<br>
+ *<br>
+ * @errp: returned error message identifying the bad region.<br>
+ */<br>
+bool qemu_ram_volatile(Error **errp);<br></blockquote><div><br></div><div>=
Usually, bool-value functions with an error return true on success. If it d=
eviates from the recommendation, it should at least be documented.<br></div=
><div><br></div><div>Also, we have a preference for using _is_ in the funct=
ion name for such tests.<br></div><div> <br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
+<br>
=C2=A0#endif<br>
<br>
=C2=A0#endif<br>
diff --git a/softmmu/memory.c b/softmmu/memory.c<br>
index f016151..e9536bc 100644<br>
--- a/softmmu/memory.c<br>
+++ b/softmmu/memory.c<br>
@@ -2714,6 +2714,36 @@ void memory_global_dirty_log_stop(void)<br>
=C2=A0 =C2=A0 =C2=A0memory_global_dirty_log_do_stop();<br>
=C2=A0}<br>
<br>
+/*<br>
+ * Return true if any memory regions are writable and not backed by shared=
<br>
+ * memory.<br>
+ */<br></blockquote><div><br></div><div>Let&#39;s not duplicate API commen=
ts.</div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+bool qemu_ram_volatile(Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 RAMBlock *block;<br>
+=C2=A0 =C2=A0 MemoryRegion *mr;<br>
+=C2=A0 =C2=A0 bool ret =3D false;<br>
+<br>
+=C2=A0 =C2=A0 rcu_read_lock();<br>
</blockquote><div><br></div><div>RCU_READ_LOCK_GUARD()<br></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">+=C2=A0 =C2=A0 QLIS=
T_FOREACH_RCU(block, &amp;ram_list.blocks, next) {<br></blockquote><div><br=
></div><div>RAMBLOCK_FOREACH() should do.<br></div><div><br></div><div>Or r=
ather use the qemu_ram_foreach_block() helper.<br></div><div><br></div><div=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mr =3D block-&gt;mr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (mr &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_region_is_ram(mr) &amp;&a=
mp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !memory_region_is_ram_device(mr)=
 &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !memory_region_is_rom(mr) &amp;&=
amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (block-&gt;fd =3D=3D -1 || !qemu=
_ram_is_shared(block))) {<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Memory re=
gion %s is volatile&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0memory_region_name(mr));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 rcu_read_unlock();<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
=C2=A0static void listener_add_address_space(MemoryListener *listener,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AddressS=
pace *as)<br>
=C2=A0{<br>
-- <br>
1.8.3.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000002b1be505c69b6a5d--

