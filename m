Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C2A60B633
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 20:50:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on2JX-00017v-6Y; Mon, 24 Oct 2022 14:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1on2JS-00017k-TC; Mon, 24 Oct 2022 14:36:38 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1on2JQ-0001MP-H4; Mon, 24 Oct 2022 14:36:38 -0400
Received: by mail-lj1-x235.google.com with SMTP id o4so9036811ljp.8;
 Mon, 24 Oct 2022 11:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZGh8ORXvnZz+qnC/C8RbVs+jdWd8ZDxAFTTQcECGfaE=;
 b=DiwceOumuFe9HXMcbrNJr3vjbQ3MVYCwRxiZrxZ1zsrPMIFoJRrCFyJJr7V5uCOCZn
 3amN1rKwR40hSND3WIlxOg++mjf9vU3tnsHyhbNRmh5oRPyu4Vtegp0MP+2OGA+sTvgG
 3uFaobwa2rhGnfMqZqOIbzMcL98IJC4xHW2QdsinfwIvaJKF9KW0Vn2X8iuoHvYEfCgW
 FZatJU2a4bGTBC0Tw6DVPy4VV9AZOQQQWIWDBuvee6wxVm3N+DkRkcIqcHPzl38S4+V9
 QdbpSdzfwosnnpIu21YJrS0QRpnQhQ2V6R3Ur+bqTlA8VL89rjWq6D6FJlD5JYcIVF4q
 vumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZGh8ORXvnZz+qnC/C8RbVs+jdWd8ZDxAFTTQcECGfaE=;
 b=HlL0Ni1P38W0Vaj3kba8uIOxnYMsl0xNTlCn72zJQFHH0jMnXqV29YyOKFiQA+tWwZ
 xN8vm955vtvP+U5IxfdkST+8jXoZlEyFpNEj9JAcZ4VLqrzqXNeB0DjG9Xw1KwtpLAiO
 nKlyoUSm59komieMw0qqXcl1K0Qhz59SLUiYpEbsOyOSnN0M9artJBA7TqEB/gDt0pW6
 cRkXMubqdPcrS9QIBezAXVkEfNvs3jlIIX4zxt9/uNBbTnu3Uhk9GPZqFbE+bq3zoySY
 wlC5C0w4WGZb72gprcD0rwpGe/80Go8NCmwdFGSCGoip4RadjbOS8b0SiCpLDDlzHBAN
 jHXA==
X-Gm-Message-State: ACrzQf3h3T76w82R1v6jCCLuPexiVcxuiUnEUYAhGi2JFBVF9ZEWzM/Y
 st4BnejhTuLyUUbb5LODEU4ewbaqO2XDEU/T3RE=
X-Google-Smtp-Source: AMsMyM7YIE8wiUbVm3Axr29KbrC6FIqzpAw14HthqlnPj5VZRrh0V9qDMoWZr5hOJxzcfo/UNhY5SNhA9JpIeHXOq+g=
X-Received: by 2002:a2e:a44c:0:b0:26b:e70f:a026 with SMTP id
 v12-20020a2ea44c000000b0026be70fa026mr11895060ljn.94.1666636593774; Mon, 24
 Oct 2022 11:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <20221017083822.43118-1-frankja@linux.ibm.com>
 <20221017083822.43118-10-frankja@linux.ibm.com>
In-Reply-To: <20221017083822.43118-10-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 24 Oct 2022 22:36:21 +0400
Message-ID: <CAJ+F1CJMzq0U8ijgbCVUiT_iKfAmtfuYXR3Bg9GnJmV3WXuH4Q@mail.gmail.com>
Subject: Re: [PATCH v6 09/10] s390x: Add KVM PV dump interface
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com, 
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org, 
 seiden@linux.ibm.com, scgl@linux.ibm.com
Content-Type: multipart/alternative; boundary="00000000000024472705ebcc12de"
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000024472705ebcc12de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Janosch

On Mon, Oct 17, 2022 at 12:53 PM Janosch Frank <frankja@linux.ibm.com>
wrote:

> Let's add a few bits of code which hide the new KVM PV dump API from
> us via new functions.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
> ---
>  hw/s390x/pv.c         | 51 +++++++++++++++++++++++++++++++++++++++++++
>  include/hw/s390x/pv.h |  9 ++++++++
>  2 files changed, 60 insertions(+)
>
> diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
> index 4c012f2eeb..728ba24547 100644
> --- a/hw/s390x/pv.c
> +++ b/hw/s390x/pv.c
> @@ -175,6 +175,57 @@ bool kvm_s390_pv_info_basic_valid(void)
>      return info_valid;
>  }
>
> +static int s390_pv_dump_cmd(uint64_t subcmd, uint64_t uaddr, uint64_t
> gaddr,
> +                            uint64_t len)
> +{
> +    struct kvm_s390_pv_dmp dmp =3D {
> +        .subcmd =3D subcmd,
> +        .buff_addr =3D uaddr,
> +        .buff_len =3D len,
> +        .gaddr =3D gaddr,
> +    };
> +    int ret;
> +
> +    ret =3D s390_pv_cmd(KVM_PV_DUMP, (void *)&dmp);
> +    if (ret) {
> +        error_report("KVM DUMP command %ld failed", subcmd);
> +    }
> +    return ret;
> +}
> +
> +int kvm_s390_dump_cpu(S390CPU *cpu, void *buff)
> +{
> +    struct kvm_s390_pv_dmp dmp =3D {
> +        .subcmd =3D KVM_PV_DUMP_CPU,
> +        .buff_addr =3D (uint64_t)buff,
> +        .gaddr =3D 0,
> +        .buff_len =3D info_dump.dump_cpu_buffer_len,
> +    };
> +    struct kvm_pv_cmd pv =3D {
> +        .cmd =3D KVM_PV_DUMP,
> +        .data =3D (uint64_t)&dmp,
> +    };
> +
> +    return kvm_vcpu_ioctl(CPU(cpu), KVM_S390_PV_CPU_COMMAND, &pv);
> +}
> +
> +int kvm_s390_dump_init(void)
> +{
> +    return s390_pv_dump_cmd(KVM_PV_DUMP_INIT, 0, 0, 0);
> +}
> +
> +int kvm_s390_dump_mem_state(uint64_t gaddr, size_t len, void *dest)
> +{
> +    return s390_pv_dump_cmd(KVM_PV_DUMP_CONFIG_STOR_STATE, (uint64_t)des=
t,
> +                            gaddr, len);
> +}
> +
> +int kvm_s390_dump_completion_data(void *buff)
> +{
> +    return s390_pv_dump_cmd(KVM_PV_DUMP_COMPLETE, (uint64_t)buff, 0,
> +                            info_dump.dump_config_finalize_len);
> +}
> +
>  #define TYPE_S390_PV_GUEST "s390-pv-guest"
>  OBJECT_DECLARE_SIMPLE_TYPE(S390PVGuest, S390_PV_GUEST)
>
> diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
> index e5ea0eca16..3164006674 100644
> --- a/include/hw/s390x/pv.h
> +++ b/include/hw/s390x/pv.h
> @@ -51,6 +51,10 @@ uint64_t kvm_s390_pv_dmp_get_size_cpu(void);
>  uint64_t kvm_s390_pv_dmp_get_size_mem_state(void);
>  uint64_t kvm_s390_pv_dmp_get_size_completion_data(void);
>  bool kvm_s390_pv_info_basic_valid(void);
> +int kvm_s390_dump_init(void);
> +int kvm_s390_dump_cpu(S390CPU *cpu, void *buff);
> +int kvm_s390_dump_mem_state(uint64_t addr, size_t len, void *dest);
> +int kvm_s390_dump_completion_data(void *buff);
>  #else /* CONFIG_KVM */
>  static inline bool s390_is_pv(void) { return false; }
>  static inline int s390_pv_query_info(void) { return 0; }
> @@ -66,6 +70,11 @@ static inline uint64_t
> kvm_s390_pv_dmp_get_size_cpu(void) { return 0; }
>  static inline uint64_t kvm_s390_pv_dmp_get_size_mem_state(void) { return
> 0; }
>  static inline uint64_t kvm_s390_pv_dmp_get_size_completion_data(void) {
> return 0; }
>  static inline bool kvm_s390_pv_info_basic_valid(void) { return false; }
> +static inline int kvm_s390_dump_init(void) { return 0; }
> +static inline int kvm_s390_dump_cpu(S390CPU *cpu, void *buff, size_t len=
)
> { return 0; }
> +static inline int kvm_s390_dump_mem_state(uint64_t addr, size_t len,
> +                                          void *dest) { return 0; }
> +static inline int kvm_s390_dump_completion_data(void *buff) { return 0; =
}
>  #endif /* CONFIG_KVM */
>


To fix build issue:
../target/s390x/arch_dump.c
../target/s390x/arch_dump.c: In function =E2=80=98s390x_write_elf64_pv=E2=
=80=99:
../target/s390x/arch_dump.c:195:5: error: too few arguments to
function =E2=80=98kvm_s390_dump_cpu=E2=80=99
195 | kvm_s390_dump_cpu(cpu, &note->contents.dynamic);
| ^~~~~~~~~~~~~~~~~
In file included from ../target/s390x/arch_dump.c:20:
/builds/qemu-project/qemu/include/hw/s390x/pv.h:74:19: note: declared here
74 | static inline int kvm_s390_dump_cpu(S390CPU *cpu, void *buff,
size_t len) { return 0; }
| ^~~~~~~~~~~~~~~~~

https://gitlab.com/qemu-project/qemu/-/jobs/3218295751

Can you ack squashing this to this patch?:

diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
index 3164006674..9360aa1091 100644
--- a/include/hw/s390x/pv.h
+++ b/include/hw/s390x/pv.h
@@ -71,7 +71,7 @@ static inline uint64_t
kvm_s390_pv_dmp_get_size_mem_state(void) { return 0; }
 static inline uint64_t kvm_s390_pv_dmp_get_size_completion_data(void) {
return 0; }
 static inline bool kvm_s390_pv_info_basic_valid(void) { return false; }
 static inline int kvm_s390_dump_init(void) { return 0; }
-static inline int kvm_s390_dump_cpu(S390CPU *cpu, void *buff, size_t len)
{ return 0; }
+static inline int kvm_s390_dump_cpu(S390CPU *cpu, void *buff) { return 0; =
}
 static inline int kvm_s390_dump_mem_state(uint64_t addr, size_t len,
                                           void *dest) { return 0; }
 static inline int kvm_s390_dump_completion_data(void *buff) { return 0; }

thanks


>  int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000024472705ebcc12de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Janosch<br></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 17, 2022 at 12:53 PM Janosc=
h Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com">frankja@linux.ibm.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">L=
et&#39;s add a few bits of code which hide the new KVM PV dump API from<br>
us via new functions.<br>
<br>
Signed-off-by: Janosch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com" t=
arget=3D"_blank">frankja@linux.ibm.com</a>&gt;<br>
Reviewed-by: Janis Schoetterl-Glausch &lt;<a href=3D"mailto:scgl@linux.ibm.=
com" target=3D"_blank">scgl@linux.ibm.com</a>&gt;<br>
---<br>
=C2=A0hw/s390x/pv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 51 +++++++++++++++++=
++++++++++++++++++++++++++<br>
=C2=A0include/hw/s390x/pv.h |=C2=A0 9 ++++++++<br>
=C2=A02 files changed, 60 insertions(+)<br>
<br>
diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c<br>
index 4c012f2eeb..728ba24547 100644<br>
--- a/hw/s390x/pv.c<br>
+++ b/hw/s390x/pv.c<br>
@@ -175,6 +175,57 @@ bool kvm_s390_pv_info_basic_valid(void)<br>
=C2=A0 =C2=A0 =C2=A0return info_valid;<br>
=C2=A0}<br>
<br>
+static int s390_pv_dump_cmd(uint64_t subcmd, uint64_t uaddr, uint64_t gadd=
r,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t len)<br>
+{<br>
+=C2=A0 =C2=A0 struct kvm_s390_pv_dmp dmp =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .subcmd =3D subcmd,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .buff_addr =3D uaddr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .buff_len =3D len,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .gaddr =3D gaddr,<br>
+=C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 int ret;<br>
+<br>
+=C2=A0 =C2=A0 ret =3D s390_pv_cmd(KVM_PV_DUMP, (void *)&amp;dmp);<br>
+=C2=A0 =C2=A0 if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;KVM DUMP command %ld failed=
&quot;, subcmd);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+int kvm_s390_dump_cpu(S390CPU *cpu, void *buff)<br>
+{<br>
+=C2=A0 =C2=A0 struct kvm_s390_pv_dmp dmp =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .subcmd =3D KVM_PV_DUMP_CPU,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .buff_addr =3D (uint64_t)buff,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .gaddr =3D 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .buff_len =3D info_dump.dump_cpu_buffer_len,<b=
r>
+=C2=A0 =C2=A0 };<br>
+=C2=A0 =C2=A0 struct kvm_pv_cmd pv =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .cmd =3D KVM_PV_DUMP,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 .data =3D (uint64_t)&amp;dmp,<br>
+=C2=A0 =C2=A0 };<br>
+<br>
+=C2=A0 =C2=A0 return kvm_vcpu_ioctl(CPU(cpu), KVM_S390_PV_CPU_COMMAND, &am=
p;pv);<br>
+}<br>
+<br>
+int kvm_s390_dump_init(void)<br>
+{<br>
+=C2=A0 =C2=A0 return s390_pv_dump_cmd(KVM_PV_DUMP_INIT, 0, 0, 0);<br>
+}<br>
+<br>
+int kvm_s390_dump_mem_state(uint64_t gaddr, size_t len, void *dest)<br>
+{<br>
+=C2=A0 =C2=A0 return s390_pv_dump_cmd(KVM_PV_DUMP_CONFIG_STOR_STATE, (uint=
64_t)dest,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 gaddr, len);<br>
+}<br>
+<br>
+int kvm_s390_dump_completion_data(void *buff)<br>
+{<br>
+=C2=A0 =C2=A0 return s390_pv_dump_cmd(KVM_PV_DUMP_COMPLETE, (uint64_t)buff=
, 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 info_dump.dump_config_finalize_len);<br>
+}<br>
+<br>
=C2=A0#define TYPE_S390_PV_GUEST &quot;s390-pv-guest&quot;<br>
=C2=A0OBJECT_DECLARE_SIMPLE_TYPE(S390PVGuest, S390_PV_GUEST)<br>
<br>
diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h<br>
index e5ea0eca16..3164006674 100644<br>
--- a/include/hw/s390x/pv.h<br>
+++ b/include/hw/s390x/pv.h<br>
@@ -51,6 +51,10 @@ uint64_t kvm_s390_pv_dmp_get_size_cpu(void);<br>
=C2=A0uint64_t kvm_s390_pv_dmp_get_size_mem_state(void);<br>
=C2=A0uint64_t kvm_s390_pv_dmp_get_size_completion_data(void);<br>
=C2=A0bool kvm_s390_pv_info_basic_valid(void);<br>
+int kvm_s390_dump_init(void);<br>
+int kvm_s390_dump_cpu(S390CPU *cpu, void *buff);<br>
+int kvm_s390_dump_mem_state(uint64_t addr, size_t len, void *dest);<br>
+int kvm_s390_dump_completion_data(void *buff);<br>
=C2=A0#else /* CONFIG_KVM */<br>
=C2=A0static inline bool s390_is_pv(void) { return false; }<br>
=C2=A0static inline int s390_pv_query_info(void) { return 0; }<br>
@@ -66,6 +70,11 @@ static inline uint64_t kvm_s390_pv_dmp_get_size_cpu(void=
) { return 0; }<br>
=C2=A0static inline uint64_t kvm_s390_pv_dmp_get_size_mem_state(void) { ret=
urn 0; }<br>
=C2=A0static inline uint64_t kvm_s390_pv_dmp_get_size_completion_data(void)=
 { return 0; }<br>
=C2=A0static inline bool kvm_s390_pv_info_basic_valid(void) { return false;=
 }<br>
+static inline int kvm_s390_dump_init(void) { return 0; }<br>
+static inline int kvm_s390_dump_cpu(S390CPU *cpu, void *buff, size_t len) =
{ return 0; }<br>
+static inline int kvm_s390_dump_mem_state(uint64_t addr, size_t len,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v=
oid *dest) { return 0; }<br>
+static inline int kvm_s390_dump_completion_data(void *buff) { return 0; }<=
br>
=C2=A0#endif /* CONFIG_KVM */<br></blockquote><div><br></div><div><br></div=
><div>To fix build issue:</div><div>
../target/s390x/arch_dump.c<br>
../target/s390x/arch_dump.c: In function =E2=80=98s390x_write_elf64_pv=E2=
=80=99:<br>
../target/s390x/arch_dump.c:195:5: error: too few arguments to<br>
function =E2=80=98kvm_s390_dump_cpu=E2=80=99<br>
195 | kvm_s390_dump_cpu(cpu, &amp;note-&gt;contents.dynamic);<br>
| ^~~~~~~~~~~~~~~~~<br>
In file included from ../target/s390x/arch_dump.c:20:<br>
/builds/qemu-project/qemu/include/hw/s390x/pv.h:74:19: note: declared here<=
br>
74 | static inline int kvm_s390_dump_cpu(S390CPU *cpu, void *buff,<br>
size_t len) { return 0; }<br>
| ^~~~~~~~~~~~~~~~~<br>
<br>
<a href=3D"https://gitlab.com/qemu-project/qemu/-/jobs/3218295751" rel=3D"n=
oreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/jobs/32=
18295751</a></div><div></div><div><br></div><div>Can you ack squashing this=
 to this patch?:</div><div><br></div><div>diff --git a/include/hw/s390x/pv.=
h b/include/hw/s390x/pv.h<br>index 3164006674..9360aa1091 100644<br>--- a/i=
nclude/hw/s390x/pv.h<br>+++ b/include/hw/s390x/pv.h<br>@@ -71,7 +71,7 @@ st=
atic inline uint64_t kvm_s390_pv_dmp_get_size_mem_state(void) { return 0; }=
<br>=C2=A0static inline uint64_t kvm_s390_pv_dmp_get_size_completion_data(v=
oid) { return 0; }<br>=C2=A0static inline bool kvm_s390_pv_info_basic_valid=
(void) { return false; }<br>=C2=A0static inline int kvm_s390_dump_init(void=
) { return 0; }<br>-static inline int kvm_s390_dump_cpu(S390CPU *cpu, void =
*buff, size_t len) { return 0; }<br>+static inline int kvm_s390_dump_cpu(S3=
90CPU *cpu, void *buff) { return 0; }<br>=C2=A0static inline int kvm_s390_d=
ump_mem_state(uint64_t addr, size_t len,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void *dest) { return 0; }<b=
r>=C2=A0static inline int kvm_s390_dump_completion_data(void *buff) { retur=
n 0; }<br></div><div>=C2=A0</div><div>thanks</div><div><br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);<br=
>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000024472705ebcc12de--

