Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D44575D6F
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 10:27:51 +0200 (CEST)
Received: from localhost ([::1]:57768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCGfu-0000Sj-Em
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 04:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oCGbg-0006Go-2c; Fri, 15 Jul 2022 04:23:28 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:42936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oCGbe-0001Gy-6n; Fri, 15 Jul 2022 04:23:27 -0400
Received: by mail-lf1-x131.google.com with SMTP id o7so6659856lfq.9;
 Fri, 15 Jul 2022 01:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DVd+5iQmuFqYg0dUI4T1ac5rJJlTpHCT+7FCvYTLgfM=;
 b=Tanpk1DRlDZk9Xlf4X1qYnqN5clYeVuf4fPNAYBLa5FzKHyy7e/yDVDKvWc1MMNbij
 bUwhnKrMCWpNsKGXFjrGnSLtiQYCqd1asQ8rq/yhKuk8fzLIgqkNh3bFfbc8K/WRwZGV
 s6WiYBLQlU+fP49r+60H9hI4GTc6dHtA36gsbWm3WSJjcHHlRp1EpQ0/YWeSz0yDxgU0
 MuzyznkHHKiveh/ZmL0fBW0oU0YEk4l/fY3O64mkT06L0qgPEM3KQz97p7JYt+09JU3r
 B+1UR2VN2QB7UxBqRY0kRiMQTwrLoKSNeAXGCvX5shDH0hM3IrsCwe2vIegiyG+Tzko2
 IvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DVd+5iQmuFqYg0dUI4T1ac5rJJlTpHCT+7FCvYTLgfM=;
 b=RyUkSNET0DqWmDZwx13vtkNBCuxRaqhtmIgM1RDKAUBZvRDaVGM26qQFfuKQTL/Umz
 B1s07io0Tvy5NWHUC2SjzTFTjjb4w4PPTM4/IwXW1iMZ/QXjci2RgRCiiUKmRWxfPaWR
 nAJQlufTO0qy2dG+Cx/6f14kNaZYOtj0BlepY+NLzt2JwxKjks0H06Ge/D2ZMXXa0zME
 08XNn3mlj0gRxwlm2ay4eGN3ZHDU8nB51O/1SE/ppxK7tOQqtYecc6VIkA0qd09oXp9e
 /sv1HoXeSA2JeSMH1iK1/S8q7YcwArTy1SlRVzg9vgv01JySLEK6wiO2o38GRRl3RA9p
 RG+Q==
X-Gm-Message-State: AJIora8AQUkpY/nIPyYUuMvYJyXgat5/fggwHcKcb0p60uDZenSoRkL6
 DVD1BfA12JWLG4AEl1zIJi3TpE9LbNXZmmIEtrY=
X-Google-Smtp-Source: AGRyM1uIC0oh1ucy2SPati0kTs1a0zzeFQKMLAdjo07peR+c/z60ijYagss31c0y2oqdK+ohbRRlwZiL9rZFaOnQTwA=
X-Received: by 2002:a05:6512:3f27:b0:47f:77d9:f23b with SMTP id
 y39-20020a0565123f2700b0047f77d9f23bmr7216740lfa.94.1657873403149; Fri, 15
 Jul 2022 01:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220713130322.25517-1-frankja@linux.ibm.com>
 <20220713130322.25517-10-frankja@linux.ibm.com>
 <CAJ+F1C+NuKMHYZWC9w0Q5DpvnyYBExqtk2agRx+7o6v_PjOcug@mail.gmail.com>
 <475e9918-aced-1d01-ec67-5615624a9256@linux.ibm.com>
In-Reply-To: <475e9918-aced-1d01-ec67-5615624a9256@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 15 Jul 2022 12:23:11 +0400
Message-ID: <CAJ+F1CKcNS7KFKX5OuecadjZL=PJ0auxvAYF7=BMuPWLVokB6Q@mail.gmail.com>
Subject: Re: [PATCH v2 09/11] s390x: Introduce PV query interface
To: Janosch Frank <frankja@linux.ibm.com>
Cc: QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 mhartmay@linux.ibm.com, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, imbrenda@linux.ibm.com, 
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qemu-s390x list <qemu-s390x@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000047032d05e3d3bb50"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--00000000000047032d05e3d3bb50
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 15, 2022 at 12:18 PM Janosch Frank <frankja@linux.ibm.com>
wrote:

> On 7/15/22 10:10, Marc-Andr=C3=A9 Lureau wrote:
> [...]
> >>       ms->pv =3D true;
> >>
> >> +    rc =3D s390_pv_query_info();
> >> +    if (rc) {
> >> +        goto out_err;
> >>
> >
> > Maybe it's not necessary to make it fatal on error?
> >
> > lgtm otherwise
>
> Hmm, yes and no.
> The info API is fenced by the dump CAP so I don't ever expect an error
> here but on the other hand an optional info API fail might not warrant
> an error.
>
>
I see. You could explain more explicitly in the commit messages and/or
comments the kernel version/requirements.



> >
> >
> >> +    }
> >> +
> >>       /* Set SE header and unpack */
> >>       rc =3D s390_ipl_prepare_pv_header();
> >>       if (rc) {
> >> diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
> >> index 1f1f545bfc..6fa55bf70e 100644
> >> --- a/include/hw/s390x/pv.h
> >> +++ b/include/hw/s390x/pv.h
> >> @@ -38,6 +38,7 @@ static inline bool s390_is_pv(void)
> >>       return ccw->pv;
> >>   }
> >>
> >> +int s390_pv_query_info(void);
> >>   int s390_pv_vm_enable(void);
> >>   void s390_pv_vm_disable(void);
> >>   int s390_pv_set_sec_parms(uint64_t origin, uint64_t length);
> >> @@ -46,8 +47,13 @@ void s390_pv_prep_reset(void);
> >>   int s390_pv_verify(void);
> >>   void s390_pv_unshare(void);
> >>   void s390_pv_inject_reset_error(CPUState *cs);
> >> +uint64_t kvm_s390_pv_dmp_get_size_cpu(void);
> >> +uint64_t kvm_s390_pv_dmp_get_size_mem(void);
> >> +uint64_t kvm_s390_pv_dmp_get_size_complete(void);
> >> +bool kvm_s390_pv_info_basic_valid(void);
> >>   #else /* CONFIG_KVM */
> >>   static inline bool s390_is_pv(void) { return false; }
> >> +static inline int s390_pv_query_info(void) { return 0; }
> >>   static inline int s390_pv_vm_enable(void) { return 0; }
> >>   static inline void s390_pv_vm_disable(void) {}
> >>   static inline int s390_pv_set_sec_parms(uint64_t origin, uint64_t
> length)
> >> { return 0; }
> >> @@ -56,6 +62,10 @@ static inline void s390_pv_prep_reset(void) {}
> >>   static inline int s390_pv_verify(void) { return 0; }
> >>   static inline void s390_pv_unshare(void) {}
> >>   static inline void s390_pv_inject_reset_error(CPUState *cs) {};
> >> +static inline uint64_t kvm_s390_pv_dmp_get_size_cpu(void) { return 0;=
 }
> >> +static inline uint64_t kvm_s390_pv_dmp_get_size_mem(void) { return 0;=
 }
> >> +static inline uint64_t kvm_s390_pv_dmp_get_size_complete(void) { retu=
rn
> >> 0; }
> >> +static inline bool kvm_s390_pv_info_basic_valid(void) { return false;=
 }
> >>   #endif /* CONFIG_KVM */
> >>
> >>   int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
> >> --
> >> 2.34.1
> >>
> >>
> >>
> >
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000047032d05e3d3bb50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 15, 2022 at 12:18 PM Jano=
sch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com">frankja@linux.ibm.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On 7/15/22 10:10, Marc-Andr=C3=A9 Lureau wrote:<br>
[...]<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ms-&gt;pv =3D true;<br>
&gt;&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 rc =3D s390_pv_query_info();<br>
&gt;&gt; +=C2=A0 =C2=A0 if (rc) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_err;<br>
&gt;&gt;<br>
&gt; <br>
&gt; Maybe it&#39;s not necessary to make it fatal on error?<br>
&gt; <br>
&gt; lgtm otherwise<br>
<br>
Hmm, yes and no.<br>
The info API is fenced by the dump CAP so I don&#39;t ever expect an error =
<br>
here but on the other hand an optional info API fail might not warrant <br>
an error.<br>
<br></blockquote><div><br></div><div>I see. You could explain more explicit=
ly in the commit messages and/or comments the kernel version/requirements.<=
/div><div><br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
&gt; <br>
&gt; <br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Set SE header and unpack */<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D s390_ipl_prepare_pv_header();<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc) {<br>
&gt;&gt; diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h<br>
&gt;&gt; index 1f1f545bfc..6fa55bf70e 100644<br>
&gt;&gt; --- a/include/hw/s390x/pv.h<br>
&gt;&gt; +++ b/include/hw/s390x/pv.h<br>
&gt;&gt; @@ -38,6 +38,7 @@ static inline bool s390_is_pv(void)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return ccw-&gt;pv;<br>
&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; +int s390_pv_query_info(void);<br>
&gt;&gt;=C2=A0 =C2=A0int s390_pv_vm_enable(void);<br>
&gt;&gt;=C2=A0 =C2=A0void s390_pv_vm_disable(void);<br>
&gt;&gt;=C2=A0 =C2=A0int s390_pv_set_sec_parms(uint64_t origin, uint64_t le=
ngth);<br>
&gt;&gt; @@ -46,8 +47,13 @@ void s390_pv_prep_reset(void);<br>
&gt;&gt;=C2=A0 =C2=A0int s390_pv_verify(void);<br>
&gt;&gt;=C2=A0 =C2=A0void s390_pv_unshare(void);<br>
&gt;&gt;=C2=A0 =C2=A0void s390_pv_inject_reset_error(CPUState *cs);<br>
&gt;&gt; +uint64_t kvm_s390_pv_dmp_get_size_cpu(void);<br>
&gt;&gt; +uint64_t kvm_s390_pv_dmp_get_size_mem(void);<br>
&gt;&gt; +uint64_t kvm_s390_pv_dmp_get_size_complete(void);<br>
&gt;&gt; +bool kvm_s390_pv_info_basic_valid(void);<br>
&gt;&gt;=C2=A0 =C2=A0#else /* CONFIG_KVM */<br>
&gt;&gt;=C2=A0 =C2=A0static inline bool s390_is_pv(void) { return false; }<=
br>
&gt;&gt; +static inline int s390_pv_query_info(void) { return 0; }<br>
&gt;&gt;=C2=A0 =C2=A0static inline int s390_pv_vm_enable(void) { return 0; =
}<br>
&gt;&gt;=C2=A0 =C2=A0static inline void s390_pv_vm_disable(void) {}<br>
&gt;&gt;=C2=A0 =C2=A0static inline int s390_pv_set_sec_parms(uint64_t origi=
n, uint64_t length)<br>
&gt;&gt; { return 0; }<br>
&gt;&gt; @@ -56,6 +62,10 @@ static inline void s390_pv_prep_reset(void) {}<=
br>
&gt;&gt;=C2=A0 =C2=A0static inline int s390_pv_verify(void) { return 0; }<b=
r>
&gt;&gt;=C2=A0 =C2=A0static inline void s390_pv_unshare(void) {}<br>
&gt;&gt;=C2=A0 =C2=A0static inline void s390_pv_inject_reset_error(CPUState=
 *cs) {};<br>
&gt;&gt; +static inline uint64_t kvm_s390_pv_dmp_get_size_cpu(void) { retur=
n 0; }<br>
&gt;&gt; +static inline uint64_t kvm_s390_pv_dmp_get_size_mem(void) { retur=
n 0; }<br>
&gt;&gt; +static inline uint64_t kvm_s390_pv_dmp_get_size_complete(void) { =
return<br>
&gt;&gt; 0; }<br>
&gt;&gt; +static inline bool kvm_s390_pv_info_basic_valid(void) { return fa=
lse; }<br>
&gt;&gt;=C2=A0 =C2=A0#endif /* CONFIG_KVM */<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Er=
ror **errp);<br>
&gt;&gt; --<br>
&gt;&gt; 2.34.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; <br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000047032d05e3d3bb50--

