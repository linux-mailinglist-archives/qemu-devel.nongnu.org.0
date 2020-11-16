Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F012B4EDA
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:11:55 +0100 (CET)
Received: from localhost ([::1]:46678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keiyo-0003HA-SA
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:11:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1keiva-0001Yb-91
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:08:34 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:32860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1keivU-00071f-3u
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:08:33 -0500
Received: by mail-wr1-x441.google.com with SMTP id u12so12590415wrt.0
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 10:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hoJC5Bx1zz2pKZf9T3BD1tkHPhc8DH6avYEF6Jmg7tM=;
 b=nto9gGLV0dqs5Ba0hRr8SXafPM/Sug3ZU9w03RaUdq5zR6VFG0mgSmHrpUK4gnT1cs
 IXrvQAUbHR719YTf8kT72OD8ytso2LvPYVSWpzJTSfSS21n4M+7gdLDbb06CmMzYk4bD
 aaUgmHnpHXUOb6m8O3b8nro7+Rs+mRc3zCtrvt2u5E9mDqK/80rpcRdwu6zitCi66lqk
 u/a0iX2kqevmahScAuN8bQMDbNnk/BhfWncVHyXEfW8axA6uSuzQOApsSLyfNaL3OfXN
 vpvXv77bOAF0hRxlgT4VhBdq8a1wV4dvBPrId5XWvs9IGDVJYT2fB1uh+CW4YmywMbH2
 xpWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hoJC5Bx1zz2pKZf9T3BD1tkHPhc8DH6avYEF6Jmg7tM=;
 b=RBP01fMho5TiZgro05n4R1NGrFnotoYk2Hv3ir7T11J0YzxPVfY7ShuY3GfdfMy8Bs
 05p4joHpkCK5vLtZ3kzKM9d7DLC6dwbHxOb2s5DZh51ggZFxr0XNQMzpYht/5WQ+kyAD
 eYVYkE6DgOHfxyCCPwXNsvWnUQOBD7icc46rU5BJBRO8aAN0ZadJm1T/dg7j8mkyE6oE
 84XXKIy162T2+70lvIBdfbQRuZBIy4QT8kAFgfq2mH83W+v9u6p0hqf2Nl1XI/JBuc98
 Qhi9cihPqgXvt9kf4MUNnVdjBjwADs3Fwxc427hMK92UHpD2Y4zvKE7OBAk1HNm6T7Lb
 8+KA==
X-Gm-Message-State: AOAM532a+OCEHB/+TZDbgd68H0yXzU4AhyDLMLgHBEgnZD5omF+RZfJb
 WrBAjW7SvzLc8EAin3ZJmllQPTYxkgrlogEkKUOBbw==
X-Google-Smtp-Source: ABdhPJyLfJzas7HbfdJfRON8EPsv+BVvtHfIaXWMeFcvHf7+yY+zNfW26ufBFHEuyF9/ivlGyeYVuRv1zmB+a2P99gs=
X-Received: by 2002:a5d:4ec2:: with SMTP id s2mr20561545wrv.258.1605550106426; 
 Mon, 16 Nov 2020 10:08:26 -0800 (PST)
MIME-Version: 1.0
References: <20201115220740.488850-1-mst@redhat.com>
 <20201115220740.488850-6-mst@redhat.com>
 <CAARzgwzVqPC5jwx9DERjW8cy+OsZ5cgkQceX=DOzZT5-0U09Yw@mail.gmail.com>
 <7074a192-ecfe-c0ab-065f-5494bca52dd9@redhat.com>
In-Reply-To: <7074a192-ecfe-c0ab-065f-5494bca52dd9@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 16 Nov 2020 23:38:15 +0530
Message-ID: <CAARzgwwTbbgxPpAb1v8bDxZTeqc4_75qik58dqC=A5wvpMTtyQ@mail.gmail.com>
Subject: Re: [PULL 05/17] hw/i386/acpi-build: Fix maybe-uninitialized error
 when ACPI hotplug off
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c3566805b43d437e"
Received-SPF: none client-ip=2a00:1450:4864:20::441;
 envelope-from=ani@anisinha.ca; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c3566805b43d437e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2020 at 23:32 Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m>
wrote:

> On 11/16/20 6:44 PM, Ani Sinha wrote:
> >
> >
> > On Mon, Nov 16, 2020 at 03:57 Michael S. Tsirkin <mst@redhat.com
> > <mailto:mst@redhat.com>> wrote:
> >
> >     From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com
> >     <mailto:philmd@redhat.com>>
> >
> >     GCC 9.3.0 thinks that 'method' can be left uninitialized. This code
> >     is already in the "if (bsel || pcihp_bridge_en)" block statement,
> >     but it isn't smart enough to figure it out.
> >
> >     Restrict the code to be used only in the "if (bsel ||
> pcihp_bridge_en)"
> >     block statement to fix (on Ubuntu):
> >
> >       ../hw/i386/acpi-build.c: In function
> 'build_append_pci_bus_devices':
> >       ../hw/i386/acpi-build.c:496:9: error: 'method' may be used
> >     uninitialized
> >       in this function [-Werror=3Dmaybe-uninitialized]
> >         496 |         aml_append(parent_scope, method);
> >             |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >       cc1: all warnings being treated as errors
> >
> >     Fixes: df4008c9c59 ("piix4: don't reserve hw resources when hotplug
> >     is off globally")
> >     Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com
> >     <mailto:philmd@redhat.com>>
> >     Message-Id: <20201107194045.438027-1-philmd@redhat.com
> >     <mailto:20201107194045.438027-1-philmd@redhat.com>>
> >     Acked-by: Ani Sinha <ani@anisinha.ca <mailto:ani@anisinha.ca>>
> >     Reviewed-by: Michael S. Tsirkin <mst@redhat.com <mailto:
> mst@redhat.com>>
> >     Signed-off-by: Michael S. Tsirkin <mst@redhat.com
> >     <mailto:mst@redhat.com>>
> >
> >
> > Is there any reason why my ack was removed from the patch that was
> > ultimately merged?
>
> The patch merged is not the patch Michael queued. So your Ack has not
> been removed, simply Alex queued an older version previous to your Ack.
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg760119.htm
> <https://www.mail-archive.com/qemu-devel@nongnu.org/msg760119.html>


Ugh! So is there any material difference between those two patches? I took
a quick look and it seemed the same patch.

<https://www.mail-archive.com/qemu-devel@nongnu.org/msg760119.html>

<https://www.mail-archive.com/qemu-devel@nongnu.org/msg760119.html>
>
> >
> >
> https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D811c74fb657db0559274a71=
0e50ef0096a1915a3
> > <
> https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D811c74fb657db0559274a71=
0e50ef0096a1915a3
> >
>
>

--000000000000c3566805b43d437e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Nov 16, 2020 at 23:32 Philippe Mathieu-Daud=C3=A9 &=
lt;<a href=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex" dir=3D"auto">On 11/16/20 6:44 PM, Ani=
 Sinha wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Mon, Nov 16, 2020 at 03:57 Michael S. Tsirkin &lt;<a href=3D"mailto=
:mst@redhat.com" target=3D"_blank">mst@redhat.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:mst@redhat.com" target=3D"_blank">mst@red=
hat.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0From: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"ma=
ilto:philmd@redhat.com" target=3D"_blank">philmd@redhat.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:philmd@redhat.com" tar=
get=3D"_blank">philmd@redhat.com</a>&gt;&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0GCC 9.3.0 thinks that &#39;method&#39; can be left =
uninitialized. This code<br>
&gt;=C2=A0 =C2=A0 =C2=A0is already in the &quot;if (bsel || pcihp_bridge_en=
)&quot; block statement,<br>
&gt;=C2=A0 =C2=A0 =C2=A0but it isn&#39;t smart enough to figure it out.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Restrict the code to be used only in the &quot;if (=
bsel || pcihp_bridge_en)&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0block statement to fix (on Ubuntu):<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 ../hw/i386/acpi-build.c: In function &#39;bu=
ild_append_pci_bus_devices&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 ../hw/i386/acpi-build.c:496:9: error: &#39;m=
ethod&#39; may be used<br>
&gt;=C2=A0 =C2=A0 =C2=A0uninitialized<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 in this function [-Werror=3Dmaybe-uninitiali=
zed]<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 496 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0aml_append(parent_scope, method);<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 cc1: all warnings being treated as errors<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Fixes: df4008c9c59 (&quot;piix4: don&#39;t reserve =
hw resources when hotplug<br>
&gt;=C2=A0 =C2=A0 =C2=A0is off globally&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a h=
ref=3D"mailto:philmd@redhat.com" target=3D"_blank">philmd@redhat.com</a><br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:philmd@redhat.com" tar=
get=3D"_blank">philmd@redhat.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Message-Id: &lt;<a href=3D"mailto:20201107194045.43=
8027-1-philmd@redhat.com" target=3D"_blank">20201107194045.438027-1-philmd@=
redhat.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:20201107194045.438027-=
1-philmd@redhat.com" target=3D"_blank">20201107194045.438027-1-philmd@redha=
t.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Acked-by: Ani Sinha &lt;<a href=3D"mailto:ani@anisi=
nha.ca" target=3D"_blank">ani@anisinha.ca</a> &lt;mailto:<a href=3D"mailto:=
ani@anisinha.ca" target=3D"_blank">ani@anisinha.ca</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Reviewed-by: Michael S. Tsirkin &lt;<a href=3D"mail=
to:mst@redhat.com" target=3D"_blank">mst@redhat.com</a> &lt;mailto:<a href=
=3D"mailto:mst@redhat.com" target=3D"_blank">mst@redhat.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Michael S. Tsirkin &lt;<a href=3D"ma=
ilto:mst@redhat.com" target=3D"_blank">mst@redhat.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:mst@redhat.com" target=
=3D"_blank">mst@redhat.com</a>&gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt; Is there any reason why my ack was removed from the patch that was<br>
&gt; ultimately merged?<br>
<br>
The patch merged is not the patch Michael queued. So your Ack has not<br>
been removed, simply Alex queued an older version previous to your Ack.<br>
<a href=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg760119.htm=
l" rel=3D"noreferrer" target=3D"_blank">https://www.mail-archive.com/qemu-d=
evel@nongnu.org/msg760119.htm</a></blockquote><div dir=3D"auto"><br></div><=
div dir=3D"auto">Ugh! So is there any material difference between those two=
 patches? I took a quick look and it seemed the same patch.</div><div dir=
=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><a href=3D"=
https://www.mail-archive.com/qemu-devel@nongnu.org/msg760119.html" rel=3D"n=
oreferrer" target=3D"_blank"></a></blockquote><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
" dir=3D"auto"><a href=3D"https://www.mail-archive.com/qemu-devel@nongnu.or=
g/msg760119.html" rel=3D"noreferrer" target=3D"_blank"></a><br>
<br>
&gt; <br>
&gt; <a href=3D"https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D811c74fb6=
57db0559274a710e50ef0096a1915a3" rel=3D"noreferrer" target=3D"_blank">https=
://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D811c74fb657db0559274a710e50ef0=
096a1915a3</a><br>
&gt; &lt;<a href=3D"https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D811c7=
4fb657db0559274a710e50ef0096a1915a3" rel=3D"noreferrer" target=3D"_blank">h=
ttps://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D811c74fb657db0559274a710e5=
0ef0096a1915a3</a>&gt;<br>
<br>
</blockquote></div></div>

--000000000000c3566805b43d437e--

