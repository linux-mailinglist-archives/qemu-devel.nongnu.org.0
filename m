Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C686539A408
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 17:12:10 +0200 (CEST)
Received: from localhost ([::1]:45712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lop0z-0005oX-9J
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 11:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1loozV-0004Rz-Nr
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:10:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1loozT-0005R7-21
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:10:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622733033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r8y0AvcHRCELm6t/Y7P+BjVBOZqRiYHk7yUx7sxCtpU=;
 b=Q3UV1fh3r8PwxZHU8ghXlKKOqXfioCjl3ygOLSBUfZPzduXDFxjEgdRQ90Yvp+lf8/da/T
 b8oCOM1/RryEWQ5yUgjdesu6uwC/GVsaJruzlKpHEVAxZjNmxGKprcU72PbmjxYf+1LA61
 ehuhe1pseIhxEr0/CcLfPNmSiX0phEA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-oAXHGHOAPf20_wIfCwdhUQ-1; Thu, 03 Jun 2021 11:10:30 -0400
X-MC-Unique: oAXHGHOAPf20_wIfCwdhUQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 df3-20020a05640230a3b029039179c0f290so1739425edb.13
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:10:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r8y0AvcHRCELm6t/Y7P+BjVBOZqRiYHk7yUx7sxCtpU=;
 b=Z1u89bRZPuh0ep/yVNyX9DltU2reUEstIcu+2Ukf9XQ4X8XP1bsvJKILV1VUzi+myk
 7xN+l/1xu5rQu2QuqXVt62cIkCYINBN8syUet1NnBZDJAwEP6JFjdGEhKIE/J6SwTH4N
 ZmrGKwm9QV3tFu68ki4XUlMTmLOhqLvDNZTdACvNEHXa0nT/aNUsjCChJ5SD1p8KN7Tp
 paTNThMlXK2SzvRwa/1zFXgD8B8MWAh4QID2KT0e5N993IkCGtEQfxUPXScnDLNGHyrR
 vzWDFdnCrXow5Gc542d4uOu/xOkECOOzVjKEIMXLhY9wcQTYhhl7H0FS3zlGbHdncHww
 qjfA==
X-Gm-Message-State: AOAM533HcoEJprDSq1KACbRxGS3t8jsoPMhvFYk5bAcXH8+YFYqYhcqa
 4VpXdSaZJrbII4mcwof4K7hBHUy2K6vlpSdo2i+UPhS7YYv56To6gZoJsLGsBdXWyXBoYiLEWj4
 2U4I8XHBBaC/F7FkUYYZY4G99s56z168=
X-Received: by 2002:a17:906:5049:: with SMTP id e9mr92442ejk.30.1622733029718; 
 Thu, 03 Jun 2021 08:10:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXExNHlLRtb/OkWZpkOmOaNpXpFo8+ae0qrvE/zQ9qIkCSJWcNHLOqSmhPcUrpGrQW1q721OTF9ztEbGKzpqU=
X-Received: by 2002:a17:906:5049:: with SMTP id e9mr92419ejk.30.1622733029525; 
 Thu, 03 Jun 2021 08:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210603123001.17843-1-cfontana@suse.de>
 <1da75e95-1255-652e-1ca3-d23a8f6bf392@suse.de>
In-Reply-To: <1da75e95-1255-652e-1ca3-d23a8f6bf392@suse.de>
From: Cleber Rosa Junior <crosa@redhat.com>
Date: Thu, 3 Jun 2021 11:10:17 -0400
Message-ID: <CA+bd_6K1BOSeswTszBGJrq4Z9F_KpPsSuOL-cLbYWGAfvjPEMA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Fixes for "Windows fails to boot"
To: Claudio Fontana <cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000ca5e5105c3ddf91e"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm@vger.kernel.org, Siddharth Chandrasekaran <sidcha@amazon.de>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ca5e5105c3ddf91e
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 3, 2021 at 10:29 AM Claudio Fontana <cfontana@suse.de> wrote:

> On 6/3/21 2:29 PM, Claudio Fontana wrote:
> > v1 -> v2:
> >  * moved hyperv realizefn call before cpu expansion (Vitaly)
> >  * added more comments (Eduardo)
> >  * fixed references to commit ids (Eduardo)
> >
> > The combination of Commits:
> > f5cc5a5c ("i386: split cpu accelerators from cpu.c"...)
>
> > 30565f10 ("cpu: call AccelCPUClass::cpu_realizefn in"...)
> >
> > introduced two bugs that break cpu max and host in the refactoring,
> > by running initializations in the wrong order.
> >
> > This small series of two patches is an attempt to correct the situation.
> >
> > Please provide your test results and feedback, thanks!
> >
> > Claudio
> >
> > Claudio Fontana (2):
> >   i386: reorder call to cpu_exec_realizefn in x86_cpu_realizefn
> >   i386: run accel_cpu_instance_init as instance_post_init
> >
> >  target/i386/cpu.c         | 89 +++++++++++++++++++++++++--------------
> >  target/i386/kvm/kvm-cpu.c | 12 +++++-
> >  2 files changed, 68 insertions(+), 33 deletions(-)
> >
>
> Btw, CI/CD is all green, but as mentioned, it does not seem to catch these
> kind of issues.
>
>
Hi Claudio,

Not familiar with the specifics of this bug, but can it be caught by
attempting to boot an image other than Windows?  If so, we can consider
adding a test along the lines of tests/acceptance/boot_linux_console.py.

Thanks,
- Cleber.


> https://gitlab.com/hw-claudio/qemu/-/pipelines/314286751
>
> C.
>
>
>

--000000000000ca5e5105c3ddf91e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 3, 2021 at 10:29 AM Claud=
io Fontana &lt;<a href=3D"mailto:cfontana@suse.de">cfontana@suse.de</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 6/3/2=
1 2:29 PM, Claudio Fontana wrote:<br>
&gt; v1 -&gt; v2:<br>
&gt;=C2=A0 * moved hyperv realizefn call before cpu expansion (Vitaly)<br>
&gt;=C2=A0 * added more comments (Eduardo)<br>
&gt;=C2=A0 * fixed references to commit ids (Eduardo)<br>
&gt; <br>
&gt; The combination of Commits:<br>
&gt; f5cc5a5c (&quot;i386: split cpu accelerators from cpu.c&quot;...)=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; 30565f10 (&quot;cpu: call AccelCPUClass::cpu_realizefn in&quot;...) <b=
r>
&gt; <br>
&gt; introduced two bugs that break cpu max and host in the refactoring,<br=
>
&gt; by running initializations in the wrong order.<br>
&gt; <br>
&gt; This small series of two patches is an attempt to correct the situatio=
n.<br>
&gt; <br>
&gt; Please provide your test results and feedback, thanks!<br>
&gt; <br>
&gt; Claudio<br>
&gt; <br>
&gt; Claudio Fontana (2):<br>
&gt;=C2=A0 =C2=A0i386: reorder call to cpu_exec_realizefn in x86_cpu_realiz=
efn<br>
&gt;=C2=A0 =C2=A0i386: run accel_cpu_instance_init as instance_post_init<br=
>
&gt; <br>
&gt;=C2=A0 target/i386/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 89 ++++++++=
+++++++++++++++++--------------<br>
&gt;=C2=A0 target/i386/kvm/kvm-cpu.c | 12 +++++-<br>
&gt;=C2=A0 2 files changed, 68 insertions(+), 33 deletions(-)<br>
&gt; <br>
<br>
Btw, CI/CD is all green, but as mentioned, it does not seem to catch these =
kind of issues.<br>
<br></blockquote><div><br></div><div>Hi Claudio,</div><div><br></div><div>N=
ot familiar with the specifics of this bug, but can it be caught by attempt=
ing to boot an image other than Windows?=C2=A0 If so, we can consider addin=
g a test along the lines of tests/acceptance/boot_linux_console.py.</div><d=
iv><br></div><div>Thanks,</div><div>- Cleber.=C2=A0=C2=A0=C2=A0</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<a href=3D"https://gitlab.com/hw-claudio/qemu/-/pipelines/314286751" rel=3D=
"noreferrer" target=3D"_blank">https://gitlab.com/hw-claudio/qemu/-/pipelin=
es/314286751</a><br>
<br>
C.<br>
<br>
<br>
</blockquote></div></div>

--000000000000ca5e5105c3ddf91e--


