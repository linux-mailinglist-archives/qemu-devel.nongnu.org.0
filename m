Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D78E30057B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 15:33:07 +0100 (CET)
Received: from localhost ([::1]:53328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2xUn-0005tx-Uk
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 09:33:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1l2xS2-000582-Sn; Fri, 22 Jan 2021 09:30:14 -0500
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36]:46569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1l2xRy-0006QF-QK; Fri, 22 Jan 2021 09:30:14 -0500
Received: by mail-vs1-xe36.google.com with SMTP id 186so3061506vsz.13;
 Fri, 22 Jan 2021 06:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=deGSlh+unTITG4Kpy/l3tNcDTkCC/pmfpvP0NFZB2Fc=;
 b=ht1v/v6abanmX/a4Re59paqCc6bzTrDbu0n2VNN5QUK7WyzvsN4jS6oXZf9O8nkWgQ
 Tlbl3I8y78zItYtS8upNt22eSCsBx2wC8nFYYz+kgHr0D/yhwt1avIiDyAoGGg0gT4Pv
 WVxTNBpSQW8A+jCcw/zMdY6FAhNLqi6iQIxwL7ef3j38rr7f0gaKnHmVtyBlQn2hmRYA
 ueRTOhuQs9sYDGsnGHewCgt/ITzewCwlybZMq9taAbRLWdzZY7/bCPhGp8/GZXpSb/LH
 1AI0gzCBXkoRMpbzM15Rn6bHFF4AkqTymMaVB3R6v3H17Ehsd47ZzZ96YSaBGurD2tD1
 J7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=deGSlh+unTITG4Kpy/l3tNcDTkCC/pmfpvP0NFZB2Fc=;
 b=Bn3IMxwmCs2COL09lw3YmH7ltgnu0Lbl/AZKxhUpdqykBCXAPze7w1okRNQL+PRrb1
 ccVgxvFnIYuFqTGBo6DLbC7qZxS70hdIhuajOvDunAuynX5FryHIy5sE90PuczOaEuZ6
 cNXkLmtHA5XqG/WFi53KcumMPdh1/YA2OGejwZq60AT/jvVZNUvbx1bLNSc/0l7Bs52A
 PeBX1v3vexFdmgvVUHhijTACkQtzS1+LgvcvjofC4Sr+JUsZ8hcIpa2L09QPo/L7e9pr
 iUbj76QD2GR6wX5sh8jrVpJt/rODTdBHu335lpLeDJ9Ev+K7adZNthAzzldtnnu/VMoL
 079Q==
X-Gm-Message-State: AOAM530b/FRjomhibaXYG+CMlAtMpB3SkPWVNHk4lkCiAlepzQfaOfv4
 9KeCfU1wVGmtF9p6RvLiU9/ZPzHFr6Ec3Q1RU+M=
X-Google-Smtp-Source: ABdhPJx2+OG96b7LxcZmB9EZrvWKkr0r6R1Nu6yGyLKu7xUmWAlIwQv/sfttdgC2D0/aN0H/wEjBBz6WJMw32prwc1Y=
X-Received: by 2002:a67:e8c9:: with SMTP id y9mr613091vsn.39.1611325807310;
 Fri, 22 Jan 2021 06:30:07 -0800 (PST)
MIME-Version: 1.0
References: <20210113205221.32308-1-yaroshchuk2000@gmail.com>
 <20210114194703.134333-1-yaroshchuk2000@gmail.com>
 <YAceePtQwCy8Gmwx@SPB-NB-133.local>
In-Reply-To: <YAceePtQwCy8Gmwx@SPB-NB-133.local>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Fri, 22 Jan 2021 17:29:56 +0300
Message-ID: <CADO9X9QLq+oHdEarTghCzfJecWCKCVPwYjT3Ea9J4L3K7et6Fw@mail.gmail.com>
Subject: Re: [PATCH v2] target/i386/hvf: add vmware-cpuid-freq cpu feature
To: Roman Bolshakov <r.bolshakov@yadro.com>
Content-Type: multipart/alternative; boundary="0000000000005cbbbd05b97e0662"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-vs1-xe36.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, qemu-devel@nongnu.org,
 dirty@apple.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005cbbbd05b97e0662
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Roman,

=D0=B2=D1=82, 19 =D1=8F=D0=BD=D0=B2. 2021 =D0=B3. =D0=B2 21:01, Roman Bolsh=
akov <r.bolshakov@yadro.com>:

> On Thu, Jan 14, 2021 at 10:47:03PM +0300, yaroshchuk2000@gmail.com wrote:
> > From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> >
> > For `-accel hvf` cpu_x86_cpuid() is wrapped with hvf_cpu_x86_cpuid() to
> > add paravirtualization cpuid leaf 0x40000010
> > https://lkml.org/lkml/2008/10/1/246
> >
> > Leaf 0x40000010, Timing Information:
> > EAX: (Virtual) TSC frequency in kHz.
> > EBX: (Virtual) Bus (local apic timer) frequency in kHz.
> > ECX, EDX: RESERVED (Per above, reserved fields are set to zero).
> >
> > On macOS TSC and APIC Bus frequencies can be readed by sysctl call with
> > names `machdep.tsc.frequency` and `hw.busfrequency`
> >
> > This options is required for Darwin-XNU guest to be synchronized with
> > host
> >
> > Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> > ---
> >  target/i386/hvf/hvf.c | 90 ++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 89 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
> > index ed9356565c..a5daafe202 100644
> > --- a/target/i386/hvf/hvf.c
> > +++ b/target/i386/hvf/hvf.c
> > @@ -65,6 +65,7 @@
> >
> >  #include <Hypervisor/hv.h>
> >  #include <Hypervisor/hv_vmx.h>
> > +#include <sys/sysctl.h>
> >
> >  #include "exec/address-spaces.h"
> >  #include "hw/i386/apic_internal.h"
> > @@ -456,6 +457,48 @@ static void dummy_signal(int sig)
> >  {
> >  }
> >
> > +static void init_tsc_freq(CPUX86State *env)
> > +{
> > +    size_t length;
> > +    uint64_t tsc_freq;
> > +
> > +    if (env->tsc_khz !=3D 0) {
> > +        return;
> > +    }
> > +
> > +    length =3D sizeof(uint64_t);
> > +    if (sysctlbyname("machdep.tsc.frequency", &tsc_freq, &length, NULL=
,
> 0)) {
> > +        return;
> > +    }
> > +    env->tsc_khz =3D tsc_freq / 1000;  /* Hz to KHz */
> > +}
> > +
> > +static void init_apic_bus_freq(CPUX86State *env)
> > +{
> > +    size_t length;
> > +    uint64_t bus_freq;
> > +
> > +    if (env->apic_bus_freq !=3D 0) {
> > +        return;
> > +    }
> > +
> > +    length =3D sizeof(uint64_t);
> > +    if (sysctlbyname("hw.busfrequency", &bus_freq, &length, NULL, 0)) =
{
> > +        return;
> > +    }
> > +    env->apic_bus_freq =3D bus_freq;
> > +}
> > +
> > +static inline bool tsc_is_known(CPUX86State *env)
> > +{
> > +    return env->tsc_khz !=3D 0;
> > +}
> > +
> > +static inline bool apic_bus_freq_is_known(CPUX86State *env)
> > +{
> > +    return env->apic_bus_freq !=3D 0;
> > +}
> > +
> >  int hvf_init_vcpu(CPUState *cpu)
> >  {
> >
> > @@ -480,6 +523,15 @@ int hvf_init_vcpu(CPUState *cpu)
> >      hvf_state->hvf_caps =3D g_new0(struct hvf_vcpu_caps, 1);
> >      env->hvf_mmio_buf =3D g_new(char, 4096);
> >
> > +    if (x86cpu->vmware_cpuid_freq) {
> > +        init_tsc_freq(env);
> > +        init_apic_bus_freq(env);
> > +
> > +        if (!tsc_is_known(env) || !apic_bus_freq_is_known(env)) {
> > +            error_report("vmware-cpuid-freq: feature couldn't be
> enabled");
> > +        }
> > +    }
> > +
> >      r =3D hv_vcpu_create((hv_vcpuid_t *)&cpu->hvf_fd, HV_VCPU_DEFAULT)=
;
> >      cpu->vcpu_dirty =3D 1;
> >      assert_hvf_ok(r);
> > @@ -597,6 +649,42 @@ static void hvf_store_events(CPUState *cpu,
> uint32_t ins_len, uint64_t idtvec_in
> >      }
> >  }
> >
> > +static void hvf_cpu_x86_cpuid(CPUX86State *env, uint32_t index,
> uint32_t count,
> > +                              uint32_t *eax, uint32_t *ebx,
> > +                              uint32_t *ecx, uint32_t *edx)
> > +{
> > +    /*
> > +     * A wrapper extends cpu_x86_cpuid with 0x40000000 and 0x40000010
> leafs
> > +     * Provides vmware-cpuid-freq support to hvf
> > +     */
> > +
> > +    uint32_t signature[3];
> > +
> > +    if (!tsc_is_known(env) || !apic_bus_freq_is_known(env)) {
> > +        cpu_x86_cpuid(env, index, count, eax, ebx, ecx, edx);
> > +        return;
> > +    }
> > +
> > +    switch (index) {
> > +    case 0x40000000:
> > +        memcpy(signature, "TCGTCGTCGTCG", 12); /* QEMU Signature */
>
> Hi Vladislav,
>
>

> TCG belongs to TCG accel identification, for HVF it should be
> HVFHVFHVFHVF.
>
> > +        *eax =3D 0x40000010;                     /* Max available cpui=
d
> leaf */
> > +        *ebx =3D signature[0];
> > +        *ecx =3D signature[1];
> > +        *edx =3D signature[2];
>
> TCG and KVM don't report their identity unless kvm or tcg-cpuid
> properties are set. I wonder if we need to guard it likewise?
>
> But as of now QEMU is not consistent in that regard. Two parameters are
> needed for KVM - kvm=3Don,vmware-cpuid-freq=3Don. vmware-cpuid-freq is
> sufficient for WHPX but WHPX doesn't expose itself (ebx=3Decx=3Dedx=3D0).=
 TCG
> doesn't seem to support vmware-cpuid-freq but reports it's name only if
> tcg-cpuid property is set.
>
>
Ok, I understood the mistake. HVFHVFHVFHVF sounds more suitable, but
hypervisor signature is not a necessary thing for vmware-cpuid-freq
(especially unknown to anyone `HVFHVFHVFHVF`). Seems it can be dropped
by filling ebx=3Decx=3Dedx=3D0, as WHPX does. No reason to expose the HVF i=
n
this case. If needed, it can be added as another feature.

> +        break;
>
> CPUID for not implemented hypervisor-specific leafs from 0x40000001 up
> to 0x4000000f should be all zeroes but cpu_x86_cpuid() only returns zero
> values for 0x40000001. Likely, you need to reset return values for the
> leafs here or in cpu_x86_cpuid(). In the latter case you'll also fix a
> similar bug in WHPX accel.
>
>
I'll fix it in-place, resetting values in hvf_cpu_x86_cpuid()

Thank you for the review!

Sincerely,

Vladislav Yaroshchuk


> Otherwise, looks good.
>
> Thanks,
> Roman
>
> > +    case 0x40000010:
> > +        *eax =3D env->tsc_khz;
> > +        *ebx =3D env->apic_bus_freq / 1000; /* Hz to KHz */
> > +        *ecx =3D 0;
> > +        *edx =3D 0;
> > +        break;
> > +    default:
> > +        cpu_x86_cpuid(env, index, count, eax, ebx, ecx, edx);
> > +        break;
> > +    }
> > +}
> > +
> >  int hvf_vcpu_exec(CPUState *cpu)
> >  {
> >      X86CPU *x86_cpu =3D X86_CPU(cpu);
> > @@ -734,7 +822,7 @@ int hvf_vcpu_exec(CPUState *cpu)
> >              uint32_t rcx =3D (uint32_t)rreg(cpu->hvf_fd, HV_X86_RCX);
> >              uint32_t rdx =3D (uint32_t)rreg(cpu->hvf_fd, HV_X86_RDX);
> >
> > -            cpu_x86_cpuid(env, rax, rcx, &rax, &rbx, &rcx, &rdx);
> > +            hvf_cpu_x86_cpuid(env, rax, rcx, &rax, &rbx, &rcx, &rdx);
> >
> >              wreg(cpu->hvf_fd, HV_X86_RAX, rax);
> >              wreg(cpu->hvf_fd, HV_X86_RBX, rbx);
> > --
> > 2.28.0
> >
>

--0000000000005cbbbd05b97e0662
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Roman,</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">=D0=B2=D1=82, 19 =D1=8F=D0=BD=D0=
=B2. 2021 =D0=B3. =D0=B2 21:01, Roman Bolshakov &lt;<a href=3D"mailto:r.bol=
shakov@yadro.com">r.bolshakov@yadro.com</a>&gt;:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Thu, Jan 14, 2021 at 10:47:03PM +0300, =
<a href=3D"mailto:yaroshchuk2000@gmail.com" target=3D"_blank">yaroshchuk200=
0@gmail.com</a> wrote:<br>
&gt; From: Vladislav Yaroshchuk &lt;<a href=3D"mailto:yaroshchuk2000@gmail.=
com" target=3D"_blank">yaroshchuk2000@gmail.com</a>&gt;<br>
&gt; <br>
&gt; For `-accel hvf` cpu_x86_cpuid() is wrapped with hvf_cpu_x86_cpuid() t=
o<br>
&gt; add paravirtualization cpuid leaf 0x40000010<br>
&gt; <a href=3D"https://lkml.org/lkml/2008/10/1/246" rel=3D"noreferrer" tar=
get=3D"_blank">https://lkml.org/lkml/2008/10/1/246</a><br>
&gt; <br>
&gt; Leaf 0x40000010, Timing Information:<br>
&gt; EAX: (Virtual) TSC frequency in kHz.<br>
&gt; EBX: (Virtual) Bus (local apic timer) frequency in kHz.<br>
&gt; ECX, EDX: RESERVED (Per above, reserved fields are set to zero).<br>
&gt; <br>
&gt; On macOS TSC and APIC Bus frequencies can be readed by sysctl call wit=
h<br>
&gt; names `machdep.tsc.frequency` and `hw.busfrequency`<br>
&gt; <br>
&gt; This options is required for Darwin-XNU guest to be synchronized with<=
br>
&gt; host<br>
&gt; <br>
&gt; Signed-off-by: Vladislav Yaroshchuk &lt;<a href=3D"mailto:yaroshchuk20=
00@gmail.com" target=3D"_blank">yaroshchuk2000@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 target/i386/hvf/hvf.c | 90 +++++++++++++++++++++++++++++++++++++=
+++++-<br>
&gt;=C2=A0 1 file changed, 89 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c<br>
&gt; index ed9356565c..a5daafe202 100644<br>
&gt; --- a/target/i386/hvf/hvf.c<br>
&gt; +++ b/target/i386/hvf/hvf.c<br>
&gt; @@ -65,6 +65,7 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #include &lt;Hypervisor/hv.h&gt;<br>
&gt;=C2=A0 #include &lt;Hypervisor/hv_vmx.h&gt;<br>
&gt; +#include &lt;sys/sysctl.h&gt;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #include &quot;exec/address-spaces.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/i386/apic_internal.h&quot;<br>
&gt; @@ -456,6 +457,48 @@ static void dummy_signal(int sig)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +static void init_tsc_freq(CPUX86State *env)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 size_t length;<br>
&gt; +=C2=A0 =C2=A0 uint64_t tsc_freq;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (env-&gt;tsc_khz !=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 length =3D sizeof(uint64_t);<br>
&gt; +=C2=A0 =C2=A0 if (sysctlbyname(&quot;machdep.tsc.frequency&quot;, &am=
p;tsc_freq, &amp;length, NULL, 0)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 env-&gt;tsc_khz =3D tsc_freq / 1000;=C2=A0 /* Hz to KHz=
 */<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void init_apic_bus_freq(CPUX86State *env)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 size_t length;<br>
&gt; +=C2=A0 =C2=A0 uint64_t bus_freq;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (env-&gt;apic_bus_freq !=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 length =3D sizeof(uint64_t);<br>
&gt; +=C2=A0 =C2=A0 if (sysctlbyname(&quot;hw.busfrequency&quot;, &amp;bus_=
freq, &amp;length, NULL, 0)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 env-&gt;apic_bus_freq =3D bus_freq;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline bool tsc_is_known(CPUX86State *env)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return env-&gt;tsc_khz !=3D 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline bool apic_bus_freq_is_known(CPUX86State *env)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return env-&gt;apic_bus_freq !=3D 0;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 int hvf_init_vcpu(CPUState *cpu)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 <br>
&gt; @@ -480,6 +523,15 @@ int hvf_init_vcpu(CPUState *cpu)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 hvf_state-&gt;hvf_caps =3D g_new0(struct hvf_vcpu_=
caps, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;hvf_mmio_buf =3D g_new(char, 4096);<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 if (x86cpu-&gt;vmware_cpuid_freq) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 init_tsc_freq(env);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 init_apic_bus_freq(env);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!tsc_is_known(env) || !apic_bus_freq_=
is_known(env)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;vmware-c=
puid-freq: feature couldn&#39;t be enabled&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 r =3D hv_vcpu_create((hv_vcpuid_t *)&amp;cpu-&gt;h=
vf_fd, HV_VCPU_DEFAULT);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cpu-&gt;vcpu_dirty =3D 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 assert_hvf_ok(r);<br>
&gt; @@ -597,6 +649,42 @@ static void hvf_store_events(CPUState *cpu, uint3=
2_t ins_len, uint64_t idtvec_in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +static void hvf_cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint3=
2_t count,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t *eax, uint32_t *ebx,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t *ecx, uint32_t *edx)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* A wrapper extends cpu_x86_cpuid with 0x40000000=
 and 0x40000010 leafs<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Provides vmware-cpuid-freq support to hvf<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 uint32_t signature[3];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!tsc_is_known(env) || !apic_bus_freq_is_known(env))=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_x86_cpuid(env, index, count, eax, ebx=
, ecx, edx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 switch (index) {<br>
&gt; +=C2=A0 =C2=A0 case 0x40000000:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(signature, &quot;TCGTCGTCGTCG&quot=
;, 12); /* QEMU Signature */<br>
<br>
Hi Vladislav,<br>
<br></blockquote><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
TCG belongs to TCG accel identification, for HVF it should be<br>
HVFHVFHVFHVF.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *eax =3D 0x40000010;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Max available cpu=
id leaf */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ebx =3D signature[0];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ecx =3D signature[1];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *edx =3D signature[2];<br>
<br>
TCG and KVM don&#39;t report their identity unless kvm or tcg-cpuid<br>
properties are set. I wonder if we need to guard it likewise?<br>
<br>
But as of now QEMU is not consistent in that regard. Two parameters are<br>
needed for KVM - kvm=3Don,vmware-cpuid-freq=3Don. vmware-cpuid-freq is<br>
sufficient for WHPX but WHPX doesn&#39;t expose itself (ebx=3Decx=3Dedx=3D0=
). TCG<br>
doesn&#39;t seem to support vmware-cpuid-freq but reports it&#39;s name onl=
y if<br>
tcg-cpuid property is set.<br>
<br></blockquote><div>=C2=A0</div><div>Ok, I understood the mistake. HVFHVF=
HVFHVF sounds more suitable, but=C2=A0</div><div>hypervisor signature is no=
t a necessary thing for vmware-cpuid-freq=C2=A0</div><div>(especially unkno=
wn to anyone `HVFHVFHVFHVF`). Seems it can be dropped=C2=A0</div><div>by fi=
lling ebx=3Decx=3Dedx=3D0, as WHPX does. No reason to expose the HVF in=C2=
=A0</div><div>this case. If needed, it can be added as another feature.=C2=
=A0</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
<br>
CPUID for not implemented hypervisor-specific leafs from 0x40000001 up<br>
to 0x4000000f should be all zeroes but cpu_x86_cpuid() only returns zero<br=
>
values for 0x40000001. Likely, you need to reset return values for the<br>
leafs here or in cpu_x86_cpuid(). In the latter case you&#39;ll also fix a<=
br>
similar bug in WHPX accel.<br>
<br></blockquote><div><br></div><div>I&#39;ll fix it in-place, resetting va=
lues in hvf_cpu_x86_cpuid()</div><div><br></div><div>Thank you for the revi=
ew!</div><div><br></div><div>Sincerely,=C2=A0</div><div><br></div><div>Vlad=
islav Yaroshchuk</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
Otherwise, looks good.<br>
<br>
Thanks,<br>
Roman<br>
<br>
&gt; +=C2=A0 =C2=A0 case 0x40000010:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *eax =3D env-&gt;tsc_khz;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ebx =3D env-&gt;apic_bus_freq / 1000; /*=
 Hz to KHz */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ecx =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *edx =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_x86_cpuid(env, index, count, eax, ebx=
, ecx, edx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 int hvf_vcpu_exec(CPUState *cpu)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 X86CPU *x86_cpu =3D X86_CPU(cpu);<br>
&gt; @@ -734,7 +822,7 @@ int hvf_vcpu_exec(CPUState *cpu)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t rcx =3D (uint=
32_t)rreg(cpu-&gt;hvf_fd, HV_X86_RCX);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t rdx =3D (uint=
32_t)rreg(cpu-&gt;hvf_fd, HV_X86_RDX);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_x86_cpuid(env, rax, rcx=
, &amp;rax, &amp;rbx, &amp;rcx, &amp;rdx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hvf_cpu_x86_cpuid(env, rax,=
 rcx, &amp;rax, &amp;rbx, &amp;rcx, &amp;rdx);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wreg(cpu-&gt;hvf_fd, H=
V_X86_RAX, rax);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wreg(cpu-&gt;hvf_fd, H=
V_X86_RBX, rbx);<br>
&gt; -- <br>
&gt; 2.28.0<br>
&gt; <br>
</blockquote></div></div>

--0000000000005cbbbd05b97e0662--

