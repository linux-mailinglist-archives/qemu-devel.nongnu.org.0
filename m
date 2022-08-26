Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 086025A2C04
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 18:09:16 +0200 (CEST)
Received: from localhost ([::1]:54652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRbtT-0005AL-3q
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 12:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oRbkH-0007Hq-Bv
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 11:59:45 -0400
Received: from mail-vk1-f172.google.com ([209.85.221.172]:39711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oRbkF-0004SM-Dp
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 11:59:44 -0400
Received: by mail-vk1-f172.google.com with SMTP id o14so856487vkl.6
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 08:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=dDfZvlOZbDAB3G7NJKdGUAJi/q7dI8NcGvz+GmFVxiw=;
 b=Kui1mBv2ZDJbtXdM8aeqekGW/ZGCs8yOCd/elpin76NcinSK8Qd78sNJZKPofOwjea
 WxdQjS8o6hVukIiO1Y8okcE/fni/WC9PAPVLL4O9wi1qCf10u0LqmWRqdohM4FeHOAhc
 bnrlmITQoAP+VR+bZNo9SSdBL0fB8OWoWBQrZ5KoefZ/Ht1Pb6bwiPoXzO4/8U0wEx/k
 OoAcEaCeWOpVJhsxysn56oKaO0Y/jodeSPSU7yus8EdQPmMkH+bBNasCACyGC63qUF1p
 BxjmOZIG+SZEk2FYAO/+zIPVbT6Ksf4l7eKbQ+0Mev4tB4i54u8uU73rGVkqWTQGWrRA
 eXIQ==
X-Gm-Message-State: ACgBeo2/bs/FEC6iaC93YaaBtFfv8iEC6rPPanfhvBM+d6IxUPoVreyd
 lUJo1q8Ql9sEZzGnnwB88AYwKzrie02CZ8olfQM=
X-Google-Smtp-Source: AA6agR7HUz48NCWHy2GQAdHE+ekkr0RNpRonbct9tFPQ4onlsa5qp0IAyOteBzz7o9cgWATy8kHrPLHDkWWJB5BhOV4=
X-Received: by 2002:a1f:34d8:0:b0:377:142f:3e2f with SMTP id
 b207-20020a1f34d8000000b00377142f3e2fmr131553vka.27.1661529581843; Fri, 26
 Aug 2022 08:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220826110029.59382-1-pbonzini@redhat.com>
In-Reply-To: <20220826110029.59382-1-pbonzini@redhat.com>
Date: Fri, 26 Aug 2022 17:59:30 +0200
Message-ID: <CAAdtpL6QSx0DFCACP_=+UAx_CO4g3gEcHmXKsrxvDp1MC3PXiw@mail.gmail.com>
Subject: Re: [PATCH] KVM: dirty ring: add missing memory barrier
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Gavin Shan <gshan@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000827a4005e7270073"
Received-SPF: pass client-ip=209.85.221.172;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-vk1-f172.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

--000000000000827a4005e7270073
Content-Type: text/plain; charset="UTF-8"

Hi Paolo,

On Fri, Aug 26, 2022 at 1:17 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> The KVM_DIRTY_GFN_F_DIRTY flag ensures that the entry is valid.  If
> the read of the fields are not ordered after the read of the flag,
> QEMU might see stale values.
>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  accel/kvm/kvm-all.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 8d81ab74de..f49643cd24 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -719,7 +719,7 @@ static void kvm_dirty_ring_mark_page(KVMState *s,
> uint32_t as_id,
>
>  static bool dirty_gfn_is_dirtied(struct kvm_dirty_gfn *gfn)
>  {
> -    return gfn->flags == KVM_DIRTY_GFN_F_DIRTY;
> +    return qatomic_load_acquire(&gfn->flags, KVM_DIRTY_GFN_F_DIRTY);
>

Is this patch based on another which changes the qatomic_load_acquire()
prototype?


>  }
>
>  static void dirty_gfn_set_collected(struct kvm_dirty_gfn *gfn)
> --
> 2.37.1
>
>
>

--000000000000827a4005e7270073
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Paolo,</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 26, 2022 at 1:17 PM =
Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>The KVM_DIRTY_GFN_F_DIRTY flag ensures that the entry is valid.=C2=A0 If<b=
r>
the read of the fields are not ordered after the read of the flag,<br>
QEMU might see stale values.<br>
<br>
Cc: Peter Xu &lt;<a href=3D"mailto:peterx@redhat.com" target=3D"_blank">pet=
erx@redhat.com</a>&gt;<br>
Cc: Gavin Shan &lt;<a href=3D"mailto:gshan@redhat.com" target=3D"_blank">gs=
han@redhat.com</a>&gt;<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
---<br>
=C2=A0accel/kvm/kvm-all.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c<br>
index 8d81ab74de..f49643cd24 100644<br>
--- a/accel/kvm/kvm-all.c<br>
+++ b/accel/kvm/kvm-all.c<br>
@@ -719,7 +719,7 @@ static void kvm_dirty_ring_mark_page(KVMState *s, uint3=
2_t as_id,<br>
<br>
=C2=A0static bool dirty_gfn_is_dirtied(struct kvm_dirty_gfn *gfn)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return gfn-&gt;flags =3D=3D KVM_DIRTY_GFN_F_DIRTY;<br>
+=C2=A0 =C2=A0 return qatomic_load_acquire(&amp;gfn-&gt;flags, KVM_DIRTY_GF=
N_F_DIRTY);<br></blockquote><div><br></div><div>Is this patch based on anot=
her which changes the=C2=A0qatomic_load_acquire() prototype?</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0}<br>
<br>
=C2=A0static void dirty_gfn_set_collected(struct kvm_dirty_gfn *gfn)<br>
-- <br>
2.37.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000827a4005e7270073--

