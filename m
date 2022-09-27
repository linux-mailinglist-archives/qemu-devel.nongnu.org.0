Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 728785ED0F6
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 01:20:16 +0200 (CEST)
Received: from localhost ([::1]:49826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odJs7-0005WS-Hj
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 19:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odJpr-0003CY-T9
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 19:17:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odJpo-0004VL-Oa
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 19:17:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664320671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3B4DSVFpJTN+ana5TALFwQIHTaNxEFBw3QBi0+AuzGU=;
 b=AlD48Zwig73X2V3f3b+hPU86zp/hpDEFVBpJGcuxKxjLLpEfD/lKjysWJML73RAXiwfmD1
 E9Wvkre3DBkD6o3epegEjNfKgQ10lK7oEkoKQ7JpGmyt6KnnRyqMxCGTWh2LNygUSHYv98
 DvC+w5Pl9Zm223KCCJKwgEPTmnjZdHE=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-257-xfnU1Rr4N2m5XaUn3Fk_kQ-1; Tue, 27 Sep 2022 19:17:50 -0400
X-MC-Unique: xfnU1Rr4N2m5XaUn3Fk_kQ-1
Received: by mail-ua1-f72.google.com with SMTP id
 y10-20020ab0560a000000b003af33bfa8c4so2865888uaa.21
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 16:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=3B4DSVFpJTN+ana5TALFwQIHTaNxEFBw3QBi0+AuzGU=;
 b=nmY1I+ymbFGsZIsLybZrZITFkdFrIBZMD+7GAfISPbihzycdQMhP8HqAgO5V5mwmJ0
 sIe2fdZO0NHlt4lGQM6e4EiRbvqTzRu31QI1+m4armg/XDxJ//WUczMH+jUwX1U83W1U
 82WXBajKj65mccRuDLX5+z7qOdpkimsOGfX1j4K/yoKwjdiOIHEyME1Nio9VmzTLaGFQ
 yXlZAFywwnTHCOCvyYSn0xgfkQDgxJw4pyBUXYQyC4jTV2Mbg7ymrrD91PTEJVIVTEt/
 vPXu75Ka6AAHALCJ8Vw+nsSpQQYkTrFCrl7Rkk49I+szKrWNatIaOnd3JigWcLnm6OpT
 GDdQ==
X-Gm-Message-State: ACrzQf07qLxezk1gy5r05PkBK6I86AA+w3drOoSPI1LWj0LBEQ4Y6OHA
 2wEk5wVCL4t7Hopfd6KCQL5zZQf1Phax0MfcLSZh29UHde+vVK3QnCpQDiG2hLsKO9sJyliyovq
 0ZBZJMpLQAhUZcUBs0V30Doo4Enb50Kw=
X-Received: by 2002:a67:ac4c:0:b0:3a4:b881:4490 with SMTP id
 n12-20020a67ac4c000000b003a4b8814490mr8901932vsh.42.1664320669271; 
 Tue, 27 Sep 2022 16:17:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4wmkvXd6jkGuXxYStqIGe18bNDc2sVpnRG9HkSoEKjuEMXQJ/cFwx9UG9ItJxu/Mtt96tsdANRManjefaqAD0=
X-Received: by 2002:a67:ac4c:0:b0:3a4:b881:4490 with SMTP id
 n12-20020a67ac4c000000b003a4b8814490mr8901923vsh.42.1664320668947; Tue, 27
 Sep 2022 16:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <2ca557c8eb947112103168a9da3033ac5dc6ab99.1664291365.git.maciej.szmigiero@oracle.com>
In-Reply-To: <2ca557c8eb947112103168a9da3033ac5dc6ab99.1664291365.git.maciej.szmigiero@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 28 Sep 2022 01:17:37 +0200
Message-ID: <CABgObfb7ow0hZyHFEKBs_c=pbB7k7aCQjL1Qj=xu4+M9CSTzaQ@mail.gmail.com>
Subject: Re: [PATCH][RESEND] hyperv: fix SynIC SINT assertion failure on guest
 reset
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Marcelo Tosatti <mtosatti@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, kvm <kvm@vger.kernel.org>, 
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000043f53b05e9b0da40"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000043f53b05e9b0da40
Content-Type: text/plain; charset="UTF-8"

Why does this need to be a virtual function, if it is the same for all CPUs
(it differs between system and user-mode emulation, but it is never called
by user-mode emulation so that does not matter)?

Paolo

Il mar 27 set 2022, 17:12 Maciej S. Szmigiero <mail@maciej.szmigiero.name>
ha scritto:

> From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
>
> Resetting a guest that has Hyper-V VMBus support enabled triggers a QEMU
> assertion failure:
> hw/hyperv/hyperv.c:131: synic_reset: Assertion
> `QLIST_EMPTY(&synic->sint_routes)' failed.
>
> This happens both on normal guest reboot or when using "system_reset" HMP
> command.
>
> The failing assertion was introduced by commit 64ddecc88bcf ("hyperv:
> SControl is optional to enable SynIc")
> to catch dangling SINT routes on SynIC reset.
>
> The root cause of this problem is that the SynIC itself is reset before
> devices using SINT routes have chance to clean up these routes.
>
> Since there seems to be no existing mechanism to force reset callbacks (or
> methods) to be executed in specific order let's use a similar method that
> is already used to reset another interrupt controller (APIC) after devices
> have been reset - by invoking the SynIC reset from the machine reset
> handler via a new "after_reset" X86 CPU method.
>
> Fixes: 64ddecc88bcf ("hyperv: SControl is optional to enable SynIc") #
> exposed the bug
> Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> ---
>  hw/i386/pc.c               |  6 ++++++
>  target/i386/cpu-qom.h      |  2 ++
>  target/i386/cpu.c          | 10 ++++++++++
>  target/i386/kvm/hyperv.c   |  4 ++++
>  target/i386/kvm/kvm.c      | 24 +++++++++++++++++-------
>  target/i386/kvm/kvm_i386.h |  1 +
>  6 files changed, 40 insertions(+), 7 deletions(-)
>
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 566accf7e6..e44f11efb3 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1850,6 +1850,7 @@ static void pc_machine_reset(MachineState *machine)
>  {
>      CPUState *cs;
>      X86CPU *cpu;
> +    const X86CPUClass *cpuc;
>
>      qemu_devices_reset();
>
> @@ -1858,6 +1859,11 @@ static void pc_machine_reset(MachineState *machine)
>       */
>      CPU_FOREACH(cs) {
>          cpu = X86_CPU(cs);
> +        cpuc = X86_CPU_GET_CLASS(cpu);
> +
> +        if (cpuc->after_reset) {
> +            cpuc->after_reset(cpu);
> +        }
>
>          if (cpu->apic_state) {
>              device_legacy_reset(cpu->apic_state);
> diff --git a/target/i386/cpu-qom.h b/target/i386/cpu-qom.h
> index c557a522e1..339d23006a 100644
> --- a/target/i386/cpu-qom.h
> +++ b/target/i386/cpu-qom.h
> @@ -43,6 +43,7 @@ typedef struct X86CPUModel X86CPUModel;
>   * @static_model: See CpuDefinitionInfo::static
>   * @parent_realize: The parent class' realize handler.
>   * @parent_reset: The parent class' reset handler.
> + * @after_reset: Reset handler to be called only after all other devices
> have been reset.
>   *
>   * An x86 CPU model or family.
>   */
> @@ -68,6 +69,7 @@ struct X86CPUClass {
>      DeviceRealize parent_realize;
>      DeviceUnrealize parent_unrealize;
>      DeviceReset parent_reset;
> +    void (*after_reset)(X86CPU *cpu);
>  };
>
>
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 1db1278a59..c908b944bd 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -6034,6 +6034,15 @@ static void x86_cpu_reset(DeviceState *dev)
>  #endif
>  }
>
> +static void x86_cpu_after_reset(X86CPU *cpu)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    if (kvm_enabled()) {
> +        kvm_arch_after_reset_vcpu(cpu);
> +    }
> +#endif
> +}
> +
>  static void mce_init(X86CPU *cpu)
>  {
>      CPUX86State *cenv = &cpu->env;
> @@ -7099,6 +7108,7 @@ static void x86_cpu_common_class_init(ObjectClass
> *oc, void *data)
>      device_class_set_props(dc, x86_cpu_properties);
>
>      device_class_set_parent_reset(dc, x86_cpu_reset, &xcc->parent_reset);
> +    xcc->after_reset = x86_cpu_after_reset;
>      cc->reset_dump_flags = CPU_DUMP_FPU | CPU_DUMP_CCOP;
>
>      cc->class_by_name = x86_cpu_class_by_name;
> diff --git a/target/i386/kvm/hyperv.c b/target/i386/kvm/hyperv.c
> index 9026ef3a81..e3ac978648 100644
> --- a/target/i386/kvm/hyperv.c
> +++ b/target/i386/kvm/hyperv.c
> @@ -23,6 +23,10 @@ int hyperv_x86_synic_add(X86CPU *cpu)
>      return 0;
>  }
>
> +/*
> + * All devices possibly using SynIC have to be reset before calling this
> to let
> + * them remove their SINT routes first.
> + */
>  void hyperv_x86_synic_reset(X86CPU *cpu)
>  {
>      hyperv_synic_reset(CPU(cpu));
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index a1fd1f5379..774484c588 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -2203,20 +2203,30 @@ void kvm_arch_reset_vcpu(X86CPU *cpu)
>          env->mp_state = KVM_MP_STATE_RUNNABLE;
>      }
>
> +    /* enabled by default */
> +    env->poll_control_msr = 1;
> +
> +    kvm_init_nested_state(env);
> +
> +    sev_es_set_reset_vector(CPU(cpu));
> +}
> +
> +void kvm_arch_after_reset_vcpu(X86CPU *cpu)
> +{
> +    CPUX86State *env = &cpu->env;
> +    int i;
> +
> +    /*
> +     * Reset SynIC after all other devices have been reset to let them
> remove
> +     * their SINT routes first.
> +     */
>      if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNIC)) {
> -        int i;
>          for (i = 0; i < ARRAY_SIZE(env->msr_hv_synic_sint); i++) {
>              env->msr_hv_synic_sint[i] = HV_SINT_MASKED;
>          }
>
>          hyperv_x86_synic_reset(cpu);
>      }
> -    /* enabled by default */
> -    env->poll_control_msr = 1;
> -
> -    kvm_init_nested_state(env);
> -
> -    sev_es_set_reset_vector(CPU(cpu));
>  }
>
>  void kvm_arch_do_init_vcpu(X86CPU *cpu)
> diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h
> index 4124912c20..096a5dd781 100644
> --- a/target/i386/kvm/kvm_i386.h
> +++ b/target/i386/kvm/kvm_i386.h
> @@ -38,6 +38,7 @@ bool kvm_has_adjust_clock_stable(void);
>  bool kvm_has_exception_payload(void);
>  void kvm_synchronize_all_tsc(void);
>  void kvm_arch_reset_vcpu(X86CPU *cs);
> +void kvm_arch_after_reset_vcpu(X86CPU *cpu);
>  void kvm_arch_do_init_vcpu(X86CPU *cs);
>
>  void kvm_put_apicbase(X86CPU *cpu, uint64_t value);
>
>

--00000000000043f53b05e9b0da40
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Why does this need to be a virtual function, if it is the=
 same for all CPUs (it differs between system and user-mode emulation, but =
it is never called by user-mode emulation so that does not matter)?<div dir=
=3D"auto"><br></div><div dir=3D"auto">Paolo=C2=A0</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il mar 27 set 2022, =
17:12 Maciej S. Szmigiero &lt;<a href=3D"mailto:mail@maciej.szmigiero.name"=
>mail@maciej.szmigiero.name</a>&gt; ha scritto:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">From: &quot;Maciej S. Szmigiero&quot; &lt;<a href=3D"mailto:m=
aciej.szmigiero@oracle.com" target=3D"_blank" rel=3D"noreferrer">maciej.szm=
igiero@oracle.com</a>&gt;<br>
<br>
Resetting a guest that has Hyper-V VMBus support enabled triggers a QEMU<br=
>
assertion failure:<br>
hw/hyperv/hyperv.c:131: synic_reset: Assertion `QLIST_EMPTY(&amp;synic-&gt;=
sint_routes)&#39; failed.<br>
<br>
This happens both on normal guest reboot or when using &quot;system_reset&q=
uot; HMP<br>
command.<br>
<br>
The failing assertion was introduced by commit 64ddecc88bcf (&quot;hyperv: =
SControl is optional to enable SynIc&quot;)<br>
to catch dangling SINT routes on SynIC reset.<br>
<br>
The root cause of this problem is that the SynIC itself is reset before<br>
devices using SINT routes have chance to clean up these routes.<br>
<br>
Since there seems to be no existing mechanism to force reset callbacks (or<=
br>
methods) to be executed in specific order let&#39;s use a similar method th=
at<br>
is already used to reset another interrupt controller (APIC) after devices<=
br>
have been reset - by invoking the SynIC reset from the machine reset<br>
handler via a new &quot;after_reset&quot; X86 CPU method.<br>
<br>
Fixes: 64ddecc88bcf (&quot;hyperv: SControl is optional to enable SynIc&quo=
t;) # exposed the bug<br>
Signed-off-by: Maciej S. Szmigiero &lt;<a href=3D"mailto:maciej.szmigiero@o=
racle.com" target=3D"_blank" rel=3D"noreferrer">maciej.szmigiero@oracle.com=
</a>&gt;<br>
---<br>
=C2=A0hw/i386/pc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 6 ++++++<br>
=C2=A0target/i386/cpu-qom.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A0target/i386/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 10 ++++++++++<b=
r>
=C2=A0target/i386/kvm/hyperv.c=C2=A0 =C2=A0|=C2=A0 4 ++++<br>
=C2=A0target/i386/kvm/kvm.c=C2=A0 =C2=A0 =C2=A0 | 24 +++++++++++++++++-----=
--<br>
=C2=A0target/i386/kvm/kvm_i386.h |=C2=A0 1 +<br>
=C2=A06 files changed, 40 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/hw/i386/pc.c b/hw/i386/pc.c<br>
index 566accf7e6..e44f11efb3 100644<br>
--- a/hw/i386/pc.c<br>
+++ b/hw/i386/pc.c<br>
@@ -1850,6 +1850,7 @@ static void pc_machine_reset(MachineState *machine)<b=
r>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs;<br>
=C2=A0 =C2=A0 =C2=A0X86CPU *cpu;<br>
+=C2=A0 =C2=A0 const X86CPUClass *cpuc;<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_devices_reset();<br>
<br>
@@ -1858,6 +1859,11 @@ static void pc_machine_reset(MachineState *machine)<=
br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0CPU_FOREACH(cs) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpu =3D X86_CPU(cs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpuc =3D X86_CPU_GET_CLASS(cpu);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpuc-&gt;after_reset) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpuc-&gt;after_reset(cpu);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu-&gt;apic_state) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0device_legacy_reset(cpu-&gt=
;apic_state);<br>
diff --git a/target/i386/cpu-qom.h b/target/i386/cpu-qom.h<br>
index c557a522e1..339d23006a 100644<br>
--- a/target/i386/cpu-qom.h<br>
+++ b/target/i386/cpu-qom.h<br>
@@ -43,6 +43,7 @@ typedef struct X86CPUModel X86CPUModel;<br>
=C2=A0 * @static_model: See CpuDefinitionInfo::static<br>
=C2=A0 * @parent_realize: The parent class&#39; realize handler.<br>
=C2=A0 * @parent_reset: The parent class&#39; reset handler.<br>
+ * @after_reset: Reset handler to be called only after all other devices h=
ave been reset.<br>
=C2=A0 *<br>
=C2=A0 * An x86 CPU model or family.<br>
=C2=A0 */<br>
@@ -68,6 +69,7 @@ struct X86CPUClass {<br>
=C2=A0 =C2=A0 =C2=A0DeviceRealize parent_realize;<br>
=C2=A0 =C2=A0 =C2=A0DeviceUnrealize parent_unrealize;<br>
=C2=A0 =C2=A0 =C2=A0DeviceReset parent_reset;<br>
+=C2=A0 =C2=A0 void (*after_reset)(X86CPU *cpu);<br>
=C2=A0};<br>
<br>
<br>
diff --git a/target/i386/cpu.c b/target/i386/cpu.c<br>
index 1db1278a59..c908b944bd 100644<br>
--- a/target/i386/cpu.c<br>
+++ b/target/i386/cpu.c<br>
@@ -6034,6 +6034,15 @@ static void x86_cpu_reset(DeviceState *dev)<br>
=C2=A0#endif<br>
=C2=A0}<br>
<br>
+static void x86_cpu_after_reset(X86CPU *cpu)<br>
+{<br>
+#ifndef CONFIG_USER_ONLY<br>
+=C2=A0 =C2=A0 if (kvm_enabled()) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kvm_arch_after_reset_vcpu(cpu);<br>
+=C2=A0 =C2=A0 }<br>
+#endif<br>
+}<br>
+<br>
=C2=A0static void mce_init(X86CPU *cpu)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUX86State *cenv =3D &amp;cpu-&gt;env;<br>
@@ -7099,6 +7108,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc=
, void *data)<br>
=C2=A0 =C2=A0 =C2=A0device_class_set_props(dc, x86_cpu_properties);<br>
<br>
=C2=A0 =C2=A0 =C2=A0device_class_set_parent_reset(dc, x86_cpu_reset, &amp;x=
cc-&gt;parent_reset);<br>
+=C2=A0 =C2=A0 xcc-&gt;after_reset =3D x86_cpu_after_reset;<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;reset_dump_flags =3D CPU_DUMP_FPU | CPU_DUMP_CCO=
P;<br>
<br>
=C2=A0 =C2=A0 =C2=A0cc-&gt;class_by_name =3D x86_cpu_class_by_name;<br>
diff --git a/target/i386/kvm/hyperv.c b/target/i386/kvm/hyperv.c<br>
index 9026ef3a81..e3ac978648 100644<br>
--- a/target/i386/kvm/hyperv.c<br>
+++ b/target/i386/kvm/hyperv.c<br>
@@ -23,6 +23,10 @@ int hyperv_x86_synic_add(X86CPU *cpu)<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
+/*<br>
+ * All devices possibly using SynIC have to be reset before calling this t=
o let<br>
+ * them remove their SINT routes first.<br>
+ */<br>
=C2=A0void hyperv_x86_synic_reset(X86CPU *cpu)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0hyperv_synic_reset(CPU(cpu));<br>
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c<br>
index a1fd1f5379..774484c588 100644<br>
--- a/target/i386/kvm/kvm.c<br>
+++ b/target/i386/kvm/kvm.c<br>
@@ -2203,20 +2203,30 @@ void kvm_arch_reset_vcpu(X86CPU *cpu)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;mp_state =3D KVM_MP_STATE_RUNNABL=
E;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 /* enabled by default */<br>
+=C2=A0 =C2=A0 env-&gt;poll_control_msr =3D 1;<br>
+<br>
+=C2=A0 =C2=A0 kvm_init_nested_state(env);<br>
+<br>
+=C2=A0 =C2=A0 sev_es_set_reset_vector(CPU(cpu));<br>
+}<br>
+<br>
+void kvm_arch_after_reset_vcpu(X86CPU *cpu)<br>
+{<br>
+=C2=A0 =C2=A0 CPUX86State *env =3D &amp;cpu-&gt;env;<br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Reset SynIC after all other devices have been reset =
to let them remove<br>
+=C2=A0 =C2=A0 =C2=A0* their SINT routes first.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0if (hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNIC)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZE(env-&gt;m=
sr_hv_synic_sint); i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;msr_hv_synic_sint[i=
] =3D HV_SINT_MASKED;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hyperv_x86_synic_reset(cpu);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 /* enabled by default */<br>
-=C2=A0 =C2=A0 env-&gt;poll_control_msr =3D 1;<br>
-<br>
-=C2=A0 =C2=A0 kvm_init_nested_state(env);<br>
-<br>
-=C2=A0 =C2=A0 sev_es_set_reset_vector(CPU(cpu));<br>
=C2=A0}<br>
<br>
=C2=A0void kvm_arch_do_init_vcpu(X86CPU *cpu)<br>
diff --git a/target/i386/kvm/kvm_i386.h b/target/i386/kvm/kvm_i386.h<br>
index 4124912c20..096a5dd781 100644<br>
--- a/target/i386/kvm/kvm_i386.h<br>
+++ b/target/i386/kvm/kvm_i386.h<br>
@@ -38,6 +38,7 @@ bool kvm_has_adjust_clock_stable(void);<br>
=C2=A0bool kvm_has_exception_payload(void);<br>
=C2=A0void kvm_synchronize_all_tsc(void);<br>
=C2=A0void kvm_arch_reset_vcpu(X86CPU *cs);<br>
+void kvm_arch_after_reset_vcpu(X86CPU *cpu);<br>
=C2=A0void kvm_arch_do_init_vcpu(X86CPU *cs);<br>
<br>
=C2=A0void kvm_put_apicbase(X86CPU *cpu, uint64_t value);<br>
<br>
</blockquote></div>

--00000000000043f53b05e9b0da40--


