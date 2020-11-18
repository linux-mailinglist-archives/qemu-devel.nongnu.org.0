Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF802B8109
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 16:45:25 +0100 (CET)
Received: from localhost ([::1]:58784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfPe8-0005MD-Ee
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 10:45:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfPcR-0004JD-4T
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:43:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kfPcO-0005Hs-Vi
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:43:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605714216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kLI8dJICPr4mBYsfnJ58ugSRgjVjwPVLc4bCYPdKeAM=;
 b=ShtBNfp744YBuVdq75C87LWpANR1pKEZvTxZ0HEI7B+pEOVXnLujo1ACcfxXJvqiSOAG6Y
 s3NMwwURifK2tH0rLGsmn2F0TWj7dTs214S+HrI4Br9tSoEZx1HKwIHt+UGxWBKWtOrD22
 uoGVm/+VEHsUo4GcaXfo3fvHeSti8Cc=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-VmrqiA_XN3-nAN2uI9ym2g-1; Wed, 18 Nov 2020 10:43:34 -0500
X-MC-Unique: VmrqiA_XN3-nAN2uI9ym2g-1
Received: by mail-pf1-f200.google.com with SMTP id w79so1414504pfc.14
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 07:43:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kLI8dJICPr4mBYsfnJ58ugSRgjVjwPVLc4bCYPdKeAM=;
 b=YvU5wSb9SA7vLNpVhSqdAJnGOQoEGCFCZVh58DGrPG1Z6IQl7AixvywGm4EnBKr138
 d3moF5A4b9s9KZi0wOnNIHyGNhtBs3tnh2ZeTdZkH/yr09YRVpH80kMQb0GNIjHRTaUI
 O4FFU3t6lkrc3UxK6jmZnAwOBstAWPxeHGfyAaN4hmidbCG4qc0loHEW03/8vUee2GU4
 BbsY3NcLWSguzTb6He4DSOwDrYgJFsyEksAsQ6j7/X32o6DtxSVnZ//jPMpJTS9f3Nuv
 Ail9duFtekd0ePYCYMTYy6RgORJiFbe3jpEpB0d68QhBuaKA4/2JP2Oj6Xtjs8Me2tT/
 MaMQ==
X-Gm-Message-State: AOAM5310kctrhQiz+JMMvqRpVJtvKVWMlWskya4IYiHG9uG/8EHMfdRM
 d/6csXmhosm1H/0FImymyNXSZAvqp7oGcINgy6n5MC4HkIRA5f/yVCtLc/y+xvZThgNEGfbGKZu
 oJdmYmH1HZ0e7rupvFGZvIp1SeEu3o3Q=
X-Received: by 2002:a17:90a:12cc:: with SMTP id
 b12mr482073pjg.150.1605714212007; 
 Wed, 18 Nov 2020 07:43:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydGAxG4XydZ7Tg+1QRGgoKJRhUL7ISb0YbOA5O35nm3Uw3SOdPMp9Td3bY0QFnTHu+BdFLSJcO67qaCeSluUI=
X-Received: by 2002:a17:90a:12cc:: with SMTP id
 b12mr482037pjg.150.1605714211715; 
 Wed, 18 Nov 2020 07:43:31 -0800 (PST)
MIME-Version: 1.0
References: <20201118102936.25569-1-cfontana@suse.de>
 <20201118102936.25569-9-cfontana@suse.de>
 <20201118124845.GC1509407@habkost.net>
 <6093de34-807d-3840-5402-4769385dd894@suse.de>
 <8f829e99-c346-00bc-efdd-3e6d69cfba35@redhat.com>
 <20201118143643.GF1509407@habkost.net>
 <a6071cd4-0787-01c8-775a-ede72e740376@redhat.com>
 <20201118152552.GG1509407@habkost.net>
In-Reply-To: <20201118152552.GG1509407@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 18 Nov 2020 16:43:19 +0100
Message-ID: <CABgObfYL-TNAMmqkUh6cjcytaAFEtXPfw8toO6gXEuyokdyLhA@mail.gmail.com>
Subject: Re: [RFC v3 8/9] module: introduce MODULE_INIT_ACCEL_CPU
To: Eduardo Habkost <ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000033597105b463794b"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Bruce Rogers <brogers@suse.com>,
 Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Olaf Hering <ohering@suse.de>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Cameron Esfahani <dirty@apple.com>, Colin Xu <colin.xu@intel.com>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, haxm-team@intel.com,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000033597105b463794b
Content-Type: text/plain; charset="UTF-8"

Il mer 18 nov 2020, 16:26 Eduardo Habkost <ehabkost@redhat.com> ha scritto:

>
> > The alternative is to store the (type, function) tuple directly, with the
> > type as a string.  Then you can just use type_init.
>
> Right.  Let's build on top of that:
>
> Another alternative would be to store a (type, X86CPUAccel) tuple
> directly, with the type as string.  This would save the extra
> indirection of the x86_cpu_accel_init() call.
>
> It turns out we already have a mechanism to register and store
> (type, StructContainingFunctionPointers) tuples at initialization
> time: QOM.
>
> X86CPUAccel can become X86CPUAccelClass, and be registered as a
> QOM type.  It could be a subtype of TYPE_ACCEL or not, it
> shouldn't matter.
>

It would be a weird type that isn't instantiated, and/or that does nothing
but monkey patching other classes. I don't think it's a good fit.

Yet another possibility is to use GHashTable. It is limited to one value
per key, but it's enough if everything is kept local to {hw,target}/i386.
If needed a new function pointer can be added to MachineClass, implemented
in X86MachineState (where the GHashTable would also be) and called in
accel.c.

Paolo

Paolo


> I remember this was suggested in a previous thread, but I don't
> remember if there were any objections.
>
> >
> > > Making sure module_call_init() is called at the correct moment is
> > > not easier or safer than just making sure accel_init_machine()
> > > (or another init function you create) is called at the correct
> > > moment.
> >
> > Since there is a way to do it without a new level, that would of course
> be
> > fine for me too.  Let me explain however why I think Claudio's design had
> > module_call_init() misplaced and what the fundamental difference is.  The
> > basic phases in qemu_init() are:
> >
> > - initialize stuff
> > - parse command line
> > - create machine
> > - create accelerator
> > - initialize machine
> > - create devices
> > - start
> >
> > with a mess of other object creation sprinkled between the various phases
> > (but we don't care about those).
> >
> > What I object to, is calling module_call_init() after the "initialize
> stuff"
> > phase.  Claudio was using it to call the function directly, so it had to
> be
> > exactly at "create accelerator".  This is different from all other
> > module_call_init() calls, which are done very early.
>
> I agree.
>
> >
> > With the implementation I sketched, accel_register_call must still be
> done
> > after type_init, so there's still an ordering constraint, but all it's
> doing
> > is registering a callback in the "initialize stuff" phase.
>
> Makes sense, if we really want to introduce a new accel_register_call()
> abstraction.  I don't think we need it, though.
>
> --
> Eduardo
>
>

--00000000000033597105b463794b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">Il mer 18 nov 2020, 16:26 Eduardo Habkost &lt;<a href=3D"mailt=
o:ehabkost@redhat.com">ehabkost@redhat.com</a>&gt; ha scritto:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><br>
&gt; The alternative is to store the (type, function) tuple directly, with =
the<br>
&gt; type as a string.=C2=A0 Then you can just use type_init.<br>
<br>
Right.=C2=A0 Let&#39;s build on top of that:<br>
<br>
Another alternative would be to store a (type, X86CPUAccel) tuple<br>
directly, with the type as string.=C2=A0 This would save the extra<br>
indirection of the x86_cpu_accel_init() call.<br>
<br>
It turns out we already have a mechanism to register and store<br>
(type, StructContainingFunctionPointers) tuples at initialization<br>
time: QOM.<br>
<br>
X86CPUAccel can become X86CPUAccelClass, and be registered as a<br>
QOM type.=C2=A0 It could be a subtype of TYPE_ACCEL or not, it<br>
shouldn&#39;t matter.<br></blockquote></div></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">It would be a weird type that isn&#39;t instantiated, =
and/or that does nothing but monkey patching other classes. I don&#39;t thi=
nk it&#39;s a good fit.</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Yet another possibility is to use GHashTable. It is limited to one value pe=
r key, but it&#39;s enough if everything is kept local to {hw,target}/i386.=
 If needed a new function pointer can be added to MachineClass, implemented=
 in X86MachineState (where the GHashTable would also be) and called in acce=
l.c.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
<br>
I remember this was suggested in a previous thread, but I don&#39;t<br>
remember if there were any objections.<br>
<br>
&gt; <br>
&gt; &gt; Making sure module_call_init() is called at the correct moment is=
<br>
&gt; &gt; not easier or safer than just making sure accel_init_machine()<br=
>
&gt; &gt; (or another init function you create) is called at the correct<br=
>
&gt; &gt; moment.<br>
&gt; <br>
&gt; Since there is a way to do it without a new level, that would of cours=
e be<br>
&gt; fine for me too.=C2=A0 Let me explain however why I think Claudio&#39;=
s design had<br>
&gt; module_call_init() misplaced and what the fundamental difference is.=
=C2=A0 The<br>
&gt; basic phases in qemu_init() are:<br>
&gt; <br>
&gt; - initialize stuff<br>
&gt; - parse command line<br>
&gt; - create machine<br>
&gt; - create accelerator<br>
&gt; - initialize machine<br>
&gt; - create devices<br>
&gt; - start<br>
&gt; <br>
&gt; with a mess of other object creation sprinkled between the various pha=
ses<br>
&gt; (but we don&#39;t care about those).<br>
&gt; <br>
&gt; What I object to, is calling module_call_init() after the &quot;initia=
lize stuff&quot;<br>
&gt; phase.=C2=A0 Claudio was using it to call the function directly, so it=
 had to be<br>
&gt; exactly at &quot;create accelerator&quot;.=C2=A0 This is different fro=
m all other<br>
&gt; module_call_init() calls, which are done very early.<br>
<br>
I agree.<br>
<br>
&gt; <br>
&gt; With the implementation I sketched, accel_register_call must still be =
done<br>
&gt; after type_init, so there&#39;s still an ordering constraint, but all =
it&#39;s doing<br>
&gt; is registering a callback in the &quot;initialize stuff&quot; phase.<b=
r>
<br>
Makes sense, if we really want to introduce a new accel_register_call()<br>
abstraction.=C2=A0 I don&#39;t think we need it, though.<br>
<br>
-- <br>
Eduardo<br>
<br>
</blockquote></div></div></div>

--00000000000033597105b463794b--


