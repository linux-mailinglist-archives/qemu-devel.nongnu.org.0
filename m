Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C93CA2DF9D4
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 09:18:37 +0100 (CET)
Received: from localhost ([::1]:35866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krGOq-0003VY-TP
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 03:18:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1krGNl-0002wt-FR
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 03:17:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1krGNj-0002AV-NC
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 03:17:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608538647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jYxLRZ3EOr3SOXpHKs3VP3d8duK/x/0djdzIJlPn7D8=;
 b=QiCZ6aE1kv++ZT9CTrjipctIXI2Vwt7FgB0oDarfdGz94IzzOcdo3xLBlzLynva70Iosa2
 baYjhh5CQdNkIE99dCXQD/J9DDCaXxUXU/FrBr1UannTrJMleqj+k+U29g6I8BHvHEjGJd
 K45M/k2c8NJn6ztw6tjinY6b7H2Lfds=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-Kvp2oGtBOaKDZlOySgPevw-1; Mon, 21 Dec 2020 03:17:15 -0500
X-MC-Unique: Kvp2oGtBOaKDZlOySgPevw-1
Received: by mail-il1-f197.google.com with SMTP id z8so8622862ilq.21
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 00:17:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jYxLRZ3EOr3SOXpHKs3VP3d8duK/x/0djdzIJlPn7D8=;
 b=IaBmbuJDcAOapH24p0818NJZs1oxURJshyDrwn3vuLaXvvgVIPbu8klVEEGnEcjyf7
 R94H7NeLCbF7Rb9Q2QCJ6pZBx1Y9+IJLztZwRswzJCnFg/R4E2wOkNuIDHiANvZ9Yu9M
 /mqLsS+AzaXPNlXJ+eTjT+HBsvfYv3oN8tL9rtBosls+hrp3BIy75j2q8+4q4+jxYNH0
 eZ6SfLEQXgNU5+qT9R7/GhJKblMdT9vrAM2k4l0UEHQs3QLIiu6HupTaWQC07Zx8wSdt
 9WHi/jQI9VxwzRUvLSDDAoSWrHoVsP70PNrnpx9yEdh8VTokwiREWoUPTbu5mfspDFJr
 cJMA==
X-Gm-Message-State: AOAM532W9o8UTTKHPIqWeyLcuNW3J6NfUlwNCUbGmvDFCorV2OqF4EPE
 qcp+CqfqApECX9XMJBR12fpiVZ6HMJ/QFE1w8/dqSH2wJOggdrFZZ31e42u+FV3Bp2upDlFZX2/
 Rtz0QE5p+QLdtvXLG8Sr3teGf/RJhaLM=
X-Received: by 2002:a92:c26c:: with SMTP id h12mr14849081ild.165.1608538634425; 
 Mon, 21 Dec 2020 00:17:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyh9pE6SEdPW60TpKGhFulrd1VWfZtS+8eBnTps19vxCIl/kI3zaorjE18Ha9TUscAjRPY0L6j8OtVRiOOs8KI=
X-Received: by 2002:a92:c26c:: with SMTP id h12mr14849069ild.165.1608538634239; 
 Mon, 21 Dec 2020 00:17:14 -0800 (PST)
MIME-Version: 1.0
References: <20201219090637.1700900-1-pbonzini@redhat.com>
 <20201219090637.1700900-3-pbonzini@redhat.com>
In-Reply-To: <20201219090637.1700900-3-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 21 Dec 2020 12:17:03 +0400
Message-ID: <CAMxuvazLz+EANi7AF3D3BPSBKmnx9qp6eq4oZg8Nnqg6X_U4aA@mail.gmail.com>
Subject: Re: [PATCH 2/2] whpx: move internal definitions to whpx-internal.h
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e7003b05b6f51560"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e7003b05b6f51560
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 19, 2020 at 1:06 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Only leave the external interface in sysemu/whpx.h.  whpx_apic_in_platfor=
m
> is moved to a .c file because it needs whpx_state.
>
> Reported-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  include/sysemu/whpx.h            | 22 +---------------------
>  target/i386/whpx/whpx-all.c      |  4 ++++
>  target/i386/whpx/whpx-internal.h | 18 ++++++++++++++++++
>  3 files changed, 23 insertions(+), 21 deletions(-)
>
> diff --git a/include/sysemu/whpx.h b/include/sysemu/whpx.h
> index 9346fd92e9..8ca1c1c4ac 100644
> --- a/include/sysemu/whpx.h
> +++ b/include/sysemu/whpx.h
> @@ -15,28 +15,8 @@
>
>  #ifdef CONFIG_WHPX
>
> -#include "whp-dispatch.h"
> -
> -struct whpx_state {
> -    uint64_t mem_quota;
> -    WHV_PARTITION_HANDLE partition;
> -    bool kernel_irqchip_allowed;
> -    bool kernel_irqchip_required;
> -    bool apic_in_platform;
> -};
> -
> -struct whpx_lapic_state {
> -    struct {
> -        uint32_t data;
> -        uint32_t padding[3];
> -    } fields[256];
> -};
> -
> -extern struct whpx_state whpx_global;
>  int whpx_enabled(void);
> -
> -void whpx_apic_get(DeviceState *s);
> -#define whpx_apic_in_platform() (whpx_global.apic_in_platform)
> +bool whpx_apic_in_platform(void);
>
>  #else /* CONFIG_WHPX */
>
> diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
> index 12f79e2cd6..985ceba8f8 100644
> --- a/target/i386/whpx/whpx-all.c
> +++ b/target/i386/whpx/whpx-all.c
> @@ -1866,6 +1866,10 @@ int whpx_enabled(void)
>      return whpx_allowed;
>  }
>
> +bool whpx_apic_in_platform(void) {
> +    return whpx_global.apic_in_platform;
> +}
> +
>  static void whpx_accel_class_init(ObjectClass *oc, void *data)
>  {
>      AccelClass *ac =3D ACCEL_CLASS(oc);
> diff --git a/target/i386/whpx/whpx-internal.h
> b/target/i386/whpx/whpx-internal.h
> index e0a9ea1dce..8cfaaef141 100644
> --- a/target/i386/whpx/whpx-internal.h
> +++ b/target/i386/whpx/whpx-internal.h
> @@ -5,6 +5,24 @@
>  #include <WinHvPlatform.h>
>  #include <WinHvEmulation.h>
>
> +struct whpx_state {
> +    uint64_t mem_quota;
> +    WHV_PARTITION_HANDLE partition;
> +    bool kernel_irqchip_allowed;
> +    bool kernel_irqchip_required;
> +    bool apic_in_platform;
> +};
> +
> +struct whpx_lapic_state {
> +    struct {
> +        uint32_t data;
> +        uint32_t padding[3];
> +    } fields[256];
> +};
> +
> +extern struct whpx_state whpx_global;
> +void whpx_apic_get(DeviceState *s);
> +
>  #define WHV_E_UNKNOWN_CAPABILITY 0x80370300L
>
>  #define LIST_WINHVPLATFORM_FUNCTIONS(X) \
> --
> 2.26.2
>
>

--000000000000e7003b05b6f51560
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Dec 19, 2020 at 1:06 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Only=
 leave the external interface in sysemu/whpx.h.=C2=A0 whpx_apic_in_platform=
<br>
is moved to a .c file because it needs whpx_state.<br>
<br>
Reported-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0include/sysemu/whpx.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 22 +=
---------------------<br>
=C2=A0target/i386/whpx/whpx-all.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++++<br>
=C2=A0target/i386/whpx/whpx-internal.h | 18 ++++++++++++++++++<br>
=C2=A03 files changed, 23 insertions(+), 21 deletions(-)<br>
<br>
diff --git a/include/sysemu/whpx.h b/include/sysemu/whpx.h<br>
index 9346fd92e9..8ca1c1c4ac 100644<br>
--- a/include/sysemu/whpx.h<br>
+++ b/include/sysemu/whpx.h<br>
@@ -15,28 +15,8 @@<br>
<br>
=C2=A0#ifdef CONFIG_WHPX<br>
<br>
-#include &quot;whp-dispatch.h&quot;<br>
-<br>
-struct whpx_state {<br>
-=C2=A0 =C2=A0 uint64_t mem_quota;<br>
-=C2=A0 =C2=A0 WHV_PARTITION_HANDLE partition;<br>
-=C2=A0 =C2=A0 bool kernel_irqchip_allowed;<br>
-=C2=A0 =C2=A0 bool kernel_irqchip_required;<br>
-=C2=A0 =C2=A0 bool apic_in_platform;<br>
-};<br>
-<br>
-struct whpx_lapic_state {<br>
-=C2=A0 =C2=A0 struct {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t data;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t padding[3];<br>
-=C2=A0 =C2=A0 } fields[256];<br>
-};<br>
-<br>
-extern struct whpx_state whpx_global;<br>
=C2=A0int whpx_enabled(void);<br>
-<br>
-void whpx_apic_get(DeviceState *s);<br>
-#define whpx_apic_in_platform() (whpx_global.apic_in_platform)<br>
+bool whpx_apic_in_platform(void);<br>
<br>
=C2=A0#else /* CONFIG_WHPX */<br>
<br>
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c<br>
index 12f79e2cd6..985ceba8f8 100644<br>
--- a/target/i386/whpx/whpx-all.c<br>
+++ b/target/i386/whpx/whpx-all.c<br>
@@ -1866,6 +1866,10 @@ int whpx_enabled(void)<br>
=C2=A0 =C2=A0 =C2=A0return whpx_allowed;<br>
=C2=A0}<br>
<br>
+bool whpx_apic_in_platform(void) {<br>
+=C2=A0 =C2=A0 return whpx_global.apic_in_platform;<br>
+}<br>
+<br>
=C2=A0static void whpx_accel_class_init(ObjectClass *oc, void *data)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0AccelClass *ac =3D ACCEL_CLASS(oc);<br>
diff --git a/target/i386/whpx/whpx-internal.h b/target/i386/whpx/whpx-inter=
nal.h<br>
index e0a9ea1dce..8cfaaef141 100644<br>
--- a/target/i386/whpx/whpx-internal.h<br>
+++ b/target/i386/whpx/whpx-internal.h<br>
@@ -5,6 +5,24 @@<br>
=C2=A0#include &lt;WinHvPlatform.h&gt;<br>
=C2=A0#include &lt;WinHvEmulation.h&gt;<br>
<br>
+struct whpx_state {<br>
+=C2=A0 =C2=A0 uint64_t mem_quota;<br>
+=C2=A0 =C2=A0 WHV_PARTITION_HANDLE partition;<br>
+=C2=A0 =C2=A0 bool kernel_irqchip_allowed;<br>
+=C2=A0 =C2=A0 bool kernel_irqchip_required;<br>
+=C2=A0 =C2=A0 bool apic_in_platform;<br>
+};<br>
+<br>
+struct whpx_lapic_state {<br>
+=C2=A0 =C2=A0 struct {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t padding[3];<br>
+=C2=A0 =C2=A0 } fields[256];<br>
+};<br>
+<br>
+extern struct whpx_state whpx_global;<br>
+void whpx_apic_get(DeviceState *s);<br>
+<br>
=C2=A0#define WHV_E_UNKNOWN_CAPABILITY 0x80370300L<br>
<br>
=C2=A0#define LIST_WINHVPLATFORM_FUNCTIONS(X) \<br>
-- <br>
2.26.2<br>
<br>
</blockquote></div></div>

--000000000000e7003b05b6f51560--


