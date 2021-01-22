Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3FB300617
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 15:53:43 +0100 (CET)
Received: from localhost ([::1]:55172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2xok-0002t0-IB
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 09:53:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1l2xn4-00012G-49; Fri, 22 Jan 2021 09:51:58 -0500
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934]:38419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1l2xn0-0008GV-QL; Fri, 22 Jan 2021 09:51:57 -0500
Received: by mail-ua1-x934.google.com with SMTP id g13so1889500uaw.5;
 Fri, 22 Jan 2021 06:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nk3L/12DbOXhH+EUbl+WgO3w2UX2QR/CerJXCAJ4FTc=;
 b=SKOtDAKhg0VoAdDA2MNZVMtzRQgjBvW8pUozkl+Ei46v2yGJJXU5LCrC75t/wDkkTc
 5EzdLn4q6CYbPhx2YVBrn6KubRIoITthoLWxwMTlmL/8kW/bdpd77mU8DTvvNAjjg6oM
 AajQqtYBzh5OQ5MmTLwlXFtA/A9aLaa8lCrPPbkKx552hvkYm9pVCZQ7Yn42/zhozkr3
 NAYLKg3XfitpQK4SKO65i4mCiTxuL2JgiX+At++DcxaWNlJR9kpkrNKBi71v2emwiZHV
 EclyTAcjIt3vZBRaLqqrYZPiytafwzAtFiIVgaJQu2CNNNhpMZtgK5Kt4BS/1k8XH0NQ
 H5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nk3L/12DbOXhH+EUbl+WgO3w2UX2QR/CerJXCAJ4FTc=;
 b=eGs/9M//0fO/iD0UhQJe1NuEXmTp6fJB8kZetLIzkY+5r69IKu/LPixeUIsYNOIuDg
 QfHOuE5uA/rBAaUqPbMplp1JelKwqvXgYmOSjphXjU4XpO5gqtUnGcOR9odyyFuyolNl
 /GyK6yBG2/9hp4O77MRpAZxTU3CeVFfcHsxIeV1SIx+q8sfM7N95DQVYQH7L1yTWCJks
 wYzHID8lKucO2u5MkhRkIJ3W6u/cpIrBTJE3T8nJp47d/cb0cyQJ2khTxD8KAfq2fxnO
 HYcpnwfT8zOuOf1p7CcuSdZRk44wDBQPbdl93rEFSoVGJbcSsAu4HmvhETGAvco/BQzv
 kPeQ==
X-Gm-Message-State: AOAM532UY1IUOuaMDqV5a83EK5fasU1AueCVqcVkI1+rxhDx/4wmzznA
 MPfuz4Psed/hjpzPU3CQjhqn8rOyeMEemNSl3nM=
X-Google-Smtp-Source: ABdhPJzyHGFuXyVM+nGBhE2YvWDr1Ddz1Zguvy1N2SaqqArLbsUJqxJM2nmZQclFNCpSS9TmIm8x5ynMuTrwzqEX+14=
X-Received: by 2002:ab0:725:: with SMTP id h34mr488231uah.91.1611327112449;
 Fri, 22 Jan 2021 06:51:52 -0800 (PST)
MIME-Version: 1.0
References: <20210113205221.32308-1-yaroshchuk2000@gmail.com>
 <20210114194703.134333-1-yaroshchuk2000@gmail.com>
 <B529CEBA-F2F4-4EF4-8E59-F166158BBE0A@apple.com>
In-Reply-To: <B529CEBA-F2F4-4EF4-8E59-F166158BBE0A@apple.com>
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Date: Fri, 22 Jan 2021 17:51:41 +0300
Message-ID: <CADO9X9Rfsh73XXaZLaSqOCfBdtr0PR_6j8-uJfpF7CfQLTXOVg@mail.gmail.com>
Subject: Re: [PATCH v2] target/i386/hvf: add vmware-cpuid-freq cpu feature
To: Cameron Esfahani <dirty@apple.com>
Content-Type: multipart/alternative; boundary="00000000000027946405b97e543c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-ua1-x934.google.com
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
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000027946405b97e543c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cameron,

=D1=81=D1=80, 20 =D1=8F=D0=BD=D0=B2. 2021 =D0=B3. =D0=B2 01:37, Cameron Esf=
ahani <dirty@apple.com>:

>
>
> > On Jan 14, 2021, at 11:47 AM, yaroshchuk2000@gmail.com wrote:
> >
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
> > target/i386/hvf/hvf.c | 90 ++++++++++++++++++++++++++++++++++++++++++-
> > 1 file changed, 89 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
> > index ed9356565c..a5daafe202 100644
> > --- a/target/i386/hvf/hvf.c
> > +++ b/target/i386/hvf/hvf.c
> > @@ -65,6 +65,7 @@
> >
> > #include <Hypervisor/hv.h>
> > #include <Hypervisor/hv_vmx.h>
> > +#include <sys/sysctl.h>
> >
> > #include "exec/address-spaces.h"
> > #include "hw/i386/apic_internal.h"
> > @@ -456,6 +457,48 @@ static void dummy_signal(int sig)
> > {
> > }
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
> > int hvf_init_vcpu(CPUState *cpu)
> > {
> >
> > @@ -480,6 +523,15 @@ int hvf_init_vcpu(CPUState *cpu)
> >     hvf_state->hvf_caps =3D g_new0(struct hvf_vcpu_caps, 1);
> >     env->hvf_mmio_buf =3D g_new(char, 4096);
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
> >     r =3D hv_vcpu_create((hv_vcpuid_t *)&cpu->hvf_fd, HV_VCPU_DEFAULT);
> >     cpu->vcpu_dirty =3D 1;
> >     assert_hvf_ok(r);
> > @@ -597,6 +649,42 @@ static void hvf_store_events(CPUState *cpu,
> uint32_t ins_len, uint64_t idtvec_in
> >     }
> > }
> >
>
> Seems that

> We already have hvf/x86_cpuid.c.  Can we put hvf_cpu_x86_cpuid() in there=
?
>
> hvf/x86_cpuid.c is about host features, hvf_cpu_x86_cpuid() does not fit
it, as for me.
Also, KVM extends cpuid in target/i386/kvm/kvm.c. Same to WHPX:
target/i386/whpx/whpx-all.c.
I wanted to meet this rule: target/i386/hvf/hvf.c

Thank you!

Vladislav Yaroshchuk

> +static void hvf_cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t
> count,
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
> I agree with Roman, using "HVFHVFHVFHVF" is better.
>
> > +        *eax =3D 0x40000010;                     /* Max available cpui=
d
> leaf */
> > +        *ebx =3D signature[0];
> > +        *ecx =3D signature[1];
> > +        *edx =3D signature[2];
> > +        break;
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
> > int hvf_vcpu_exec(CPUState *cpu)
> > {
> >     X86CPU *x86_cpu =3D X86_CPU(cpu);
> > @@ -734,7 +822,7 @@ int hvf_vcpu_exec(CPUState *cpu)
> >             uint32_t rcx =3D (uint32_t)rreg(cpu->hvf_fd, HV_X86_RCX);
> >             uint32_t rdx =3D (uint32_t)rreg(cpu->hvf_fd, HV_X86_RDX);
> >
> > -            cpu_x86_cpuid(env, rax, rcx, &rax, &rbx, &rcx, &rdx);
> > +            hvf_cpu_x86_cpuid(env, rax, rcx, &rax, &rbx, &rcx, &rdx);
> >
> >             wreg(cpu->hvf_fd, HV_X86_RAX, rax);
> >             wreg(cpu->hvf_fd, HV_X86_RBX, rbx);
> > --
> > 2.28.0
> >
> >
>
> Looks good.
>
> Cameron Esfahani
> dirty@apple.com
>
>

--00000000000027946405b97e543c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Cameron,</div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">=D1=81=D1=80, 20 =D1=8F=D0=BD=
=D0=B2. 2021 =D0=B3. =D0=B2 01:37, Cameron Esfahani &lt;<a href=3D"mailto:d=
irty@apple.com">dirty@apple.com</a>&gt;:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><br>
<br>
&gt; On Jan 14, 2021, at 11:47 AM, <a href=3D"mailto:yaroshchuk2000@gmail.c=
om" target=3D"_blank">yaroshchuk2000@gmail.com</a> wrote:<br>
&gt; <br>
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
&gt; target/i386/hvf/hvf.c | 90 ++++++++++++++++++++++++++++++++++++++++++-=
<br>
&gt; 1 file changed, 89 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c<br>
&gt; index ed9356565c..a5daafe202 100644<br>
&gt; --- a/target/i386/hvf/hvf.c<br>
&gt; +++ b/target/i386/hvf/hvf.c<br>
&gt; @@ -65,6 +65,7 @@<br>
&gt; <br>
&gt; #include &lt;Hypervisor/hv.h&gt;<br>
&gt; #include &lt;Hypervisor/hv_vmx.h&gt;<br>
&gt; +#include &lt;sys/sysctl.h&gt;<br>
&gt; <br>
&gt; #include &quot;exec/address-spaces.h&quot;<br>
&gt; #include &quot;hw/i386/apic_internal.h&quot;<br>
&gt; @@ -456,6 +457,48 @@ static void dummy_signal(int sig)<br>
&gt; {<br>
&gt; }<br>
&gt; <br>
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
&gt; int hvf_init_vcpu(CPUState *cpu)<br>
&gt; {<br>
&gt; <br>
&gt; @@ -480,6 +523,15 @@ int hvf_init_vcpu(CPUState *cpu)<br>
&gt;=C2=A0 =C2=A0 =C2=A0hvf_state-&gt;hvf_caps =3D g_new0(struct hvf_vcpu_c=
aps, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0env-&gt;hvf_mmio_buf =3D g_new(char, 4096);<br>
&gt; <br>
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
&gt;=C2=A0 =C2=A0 =C2=A0r =3D hv_vcpu_create((hv_vcpuid_t *)&amp;cpu-&gt;hv=
f_fd, HV_VCPU_DEFAULT);<br>
&gt;=C2=A0 =C2=A0 =C2=A0cpu-&gt;vcpu_dirty =3D 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0assert_hvf_ok(r);<br>
&gt; @@ -597,6 +649,42 @@ static void hvf_store_events(CPUState *cpu, uint3=
2_t ins_len, uint64_t idtvec_in<br>
&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; }<br>
&gt; <br>
<br></blockquote><div>Seems that=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
We already have hvf/x86_cpuid.c.=C2=A0 Can we put hvf_cpu_x86_cpuid() in th=
ere?<br>
<br></blockquote><div>hvf/x86_cpuid.c is about host features,=C2=A0hvf_cpu_=
x86_cpuid() does not fit it, as for me.<br></div><div>Also, KVM extends cpu=
id in target/i386/kvm/kvm.c. Same to WHPX: target/i386/whpx/whpx-all.c.=C2=
=A0</div><div>I wanted to meet this rule:=C2=A0target/i386/hvf/hvf.c<br></d=
iv><div><br></div><div>Thank you!</div><div><br></div><div>Vladislav Yarosh=
chuk</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
I agree with Roman, using &quot;HVFHVFHVFHVF&quot; is better.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *eax =3D 0x40000010;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Max available cpu=
id leaf */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ebx =3D signature[0];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *ecx =3D signature[1];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *edx =3D signature[2];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
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
&gt; int hvf_vcpu_exec(CPUState *cpu)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0X86CPU *x86_cpu =3D X86_CPU(cpu);<br>
&gt; @@ -734,7 +822,7 @@ int hvf_vcpu_exec(CPUState *cpu)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t rcx =3D (uint3=
2_t)rreg(cpu-&gt;hvf_fd, HV_X86_RCX);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t rdx =3D (uint3=
2_t)rreg(cpu-&gt;hvf_fd, HV_X86_RDX);<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_x86_cpuid(env, rax, rcx=
, &amp;rax, &amp;rbx, &amp;rcx, &amp;rdx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hvf_cpu_x86_cpuid(env, rax,=
 rcx, &amp;rax, &amp;rbx, &amp;rcx, &amp;rdx);<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wreg(cpu-&gt;hvf_fd, HV=
_X86_RAX, rax);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wreg(cpu-&gt;hvf_fd, HV=
_X86_RBX, rbx);<br>
&gt; -- <br>
&gt; 2.28.0<br>
&gt; <br>
&gt; <br>
<br>
Looks good.<br>
<br>
Cameron Esfahani<br>
<a href=3D"mailto:dirty@apple.com" target=3D"_blank">dirty@apple.com</a><br=
>
<br>
</blockquote></div></div>

--00000000000027946405b97e543c--

