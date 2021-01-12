Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D73832F363B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 17:55:59 +0100 (CET)
Received: from localhost ([::1]:54712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzMxa-0007kV-VY
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 11:55:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzMvv-00070G-Oj
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:54:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzMvs-0005aA-K0
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:54:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610470450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bGHAPi2t51r5n5A2jmtc3ypL9s1SnQD5AFgAeLZmfX8=;
 b=eybYV4BUw9VJ3dk/lWDxiO0zwA9DVAqPJrLI8pHghPceCdDj8AWvDhPsFwiioAUTKTKkff
 TrTfJ39OZzCPfOR3cehiiqSIOUNP5i0B6CWR9q0meMoIz1TokZG+xKoVnwK9H+f8WxiiXA
 zOVPW8t2aanzS+PTTE3WcuCTOEhtAnA=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594--exVPoOdNp6-euroBhQw1w-1; Tue, 12 Jan 2021 11:54:08 -0500
X-MC-Unique: -exVPoOdNp6-euroBhQw1w-1
Received: by mail-pg1-f197.google.com with SMTP id 18so2009738pgp.22
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 08:54:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bGHAPi2t51r5n5A2jmtc3ypL9s1SnQD5AFgAeLZmfX8=;
 b=aYmcvC89kPEnFRN+44zt52EJU7/GaGB6Grn7GHmhBjrYY9EQzFMzSxy/BZjCiBTzSt
 vtxEuxHhOH5DFPhASJImkBA28l7xoBwrmvRVaoJM4UwdlSSqYhqWsRPHM0O+fGnyq6Vm
 8aDrjiu3uphnAQU38n/7RBN5Gf16YAH5RHHD2Ga+XE21MoiYUcYfC5zh+zgOGUlI1tEI
 eLnLc8eHzvPqER179Q0qbYiNsEsQdMMRs/r+tc/MvALrW2tRKZT1gcDKm/QH33MIf4l/
 PCTNxHz9HdpDhMJCLraN4+X9lEBFMbNPQuUHYrVNw/KxOhG2gzfOtIm9mNSxVbaupyg4
 +p0w==
X-Gm-Message-State: AOAM5331rwISYiob0ZunmBBr0x1wYqmAZXW4yz4CVmNZwLDWINZSr5/I
 kJDk7TEfIoM2ZK5nWqHmzDrfMJmPr3ChYNiSvt9FYT1psBjZ3jfB1vdi5E55Z8i5d37tMGcvLPo
 16fqW7hfbsc5IxHQcE2bpNF74nl2Z8To=
X-Received: by 2002:a17:902:6903:b029:da:f458:798c with SMTP id
 j3-20020a1709026903b02900daf458798cmr297163plk.68.1610470447027; 
 Tue, 12 Jan 2021 08:54:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxvg66/GvN5MgOb9lCaKSUf4ACWhO9+eIeHZhBeRY1B8xSr1kFuu6TjLCcqgIXGMuFpJLIdBsFKp37l47R74c0=
X-Received: by 2002:a17:902:6903:b029:da:f458:798c with SMTP id
 j3-20020a1709026903b02900daf458798cmr297140plk.68.1610470446683; Tue, 12 Jan
 2021 08:54:06 -0800 (PST)
MIME-Version: 1.0
References: <abd662c1-9a4a-9c77-6533-875ab1924695@0bits.com>
 <c9b36f34-8783-9c11-ffb9-afd25fdf9ac0@redhat.com>
 <428592f1-a5fd-7e6a-f181-28f31343518a@0bits.com>
In-Reply-To: <428592f1-a5fd-7e6a-f181-28f31343518a@0bits.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 12 Jan 2021 17:53:55 +0100
Message-ID: <CABgObfaZECGDvgsvebx44h84okDMKWZFw1ZtqcXk8W9SaD38Zg@mail.gmail.com>
Subject: Re: absolute firmware path made relocatable in qemu 5.2.0
To: Dave <dave@0bits.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e570cd05b8b6de76"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e570cd05b8b6de76
Content-Type: text/plain; charset="UTF-8"

Il mar 12 gen 2021, 17:48 Dave <dave@0bits.com> ha scritto:

> Hi Paolo,
>
> While this (option 2) partially works, it will still search for
> /nonexistent/libexec/qemu-bridge-helper for example so seems that some
> paths are still absolute and some relative.
>

Ok, that's a bug that can be fixed in 5.2.1. Are there other instances?


> To explain, what we are expecting that we compile one binary with the
> relevant options, test that and then it goes into production. If we
> compile with --prefix=/usr (it's final resting place will be /usr/bin)
> then everything works as expected once it is in production (since
> /usr/share/qemu, /usr/libexec, /etc/qemu exists as expected).  However
> when we are testing the binary in a directory /root/qemu/5.2.0 with
> --prefix=/usr it breaks since it converts the firmware and bios paths to
> /root/qemu/5.2.0/../share/qemu. This means we need to recompile twice
> with relevant prefixes since if i use --prefix=/nonexistent then we
> can't find the qemu-bridge-helper when the binary goes into production.
>
> It would be nicer with the relocatable binary took some fixed paths from
> /etc/qemu.conf for the bridge-helper, firmware, bios, qemu-ifup/down.
>
> thanks
> Dave
>
>
> On 12/01/2021 18:48, Paolo Bonzini wrote:
> > On 12/01/21 15:05, Dave wrote:
> >> Is seem that absolute firmwarepath compilation option is converted  to
> >> relocatable in 5.2.0 qemu.
> >>
> >> # QEMU configure log Tue 12 Jan 14:46:41 GST 2021
> >> # Configured with: '../configure' '--prefix=/usr'
> >> '--sysconfdir=/etc/qemu' '--disable-bochs'
> >> '*--firmwarepath=/usr/share/qemu:/usr/share/qemu-firmware*'
> >> #
> >
> > Yes, all paths within the prefix are relocated.  The workaround is
> > simply to configure the intended prefix with configure:
> >
> > ./configure --prefix=/root/qemu ...
> >
> > or if you don't know the prefix:
> >
> > ./configure --prefix=/nonexistent ...
> >
> > Because /usr/share/qemu and /usr/share/qemu-firmware are outside /usr,
> > they will be treated as absolute just like /etc/qemu.
> >
> > Thanks,
> >
> > Paolo
> >
> >> And trying to run the executable
> >>
> >>     bash-5.1# ./qemu-system-x86_64
> >>     qemu: could not load PC BIOS 'bios-256k.bin'
> >>
> >> If i print out the resultant binary paths
> >>
> >>     bash-5.1# ./qemu-system-x86_64 -L help
> >>     /root/qemu/../share/qemu
> >>     /root/qemu/../share/qemu-firmware
> >>
> >> So there is no way to have a absolute path for firmware /bios and all
> >> qemu's that we test need to be at the right directory nesting to find
> >> firmware, bios etc or else they all need their own duplicate firmware
> >> files. Firmware path needs to honor the absolute paths i believe.
> >>
> >
>
>

--000000000000e570cd05b8b6de76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mar 12 gen 2021, 17:48 Dave &lt;<a href=3D"mailto:d=
ave@0bits.com" target=3D"_blank" rel=3D"noreferrer">dave@0bits.com</a>&gt; =
ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Paolo,<br>
<br>
While this (option 2) partially works, it will still search for <br>
/nonexistent/libexec/qemu-bridge-helper for example so seems that some <br>
paths are still absolute and some relative.<br></blockquote></div></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Ok, that&#39;s a bug that can be=
 fixed in 5.2.1. Are there other instances?</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
<br>
To explain, what we are expecting that we compile one binary with the <br>
relevant options, test that and then it goes into production. If we <br>
compile with --prefix=3D/usr (it&#39;s final resting place will be /usr/bin=
) <br>
then everything works as expected once it is in production (since <br>
/usr/share/qemu, /usr/libexec, /etc/qemu exists as expected).=C2=A0 However=
 <br>
when we are testing the binary in a directory /root/qemu/5.2.0 with <br>
--prefix=3D/usr it breaks since it converts the firmware and bios paths to =
<br>
/root/qemu/5.2.0/../share/qemu. This means we need to recompile twice <br>
with relevant prefixes since if i use --prefix=3D/nonexistent then we <br>
can&#39;t find the qemu-bridge-helper when the binary goes into production.=
<br>
<br>
It would be nicer with the relocatable binary took some fixed paths from <b=
r>
/etc/qemu.conf for the bridge-helper, firmware, bios, qemu-ifup/down.<br>
<br>
thanks<br>
Dave<br>
<br>
<br>
On 12/01/2021 18:48, Paolo Bonzini wrote:<br>
&gt; On 12/01/21 15:05, Dave wrote:<br>
&gt;&gt; Is seem that absolute firmwarepath compilation option is converted=
=C2=A0 to <br>
&gt;&gt; relocatable in 5.2.0 qemu.<br>
&gt;&gt;<br>
&gt;&gt; # QEMU configure log Tue 12 Jan 14:46:41 GST 2021<br>
&gt;&gt; # Configured with: &#39;../configure&#39; &#39;--prefix=3D/usr&#39=
; <br>
&gt;&gt; &#39;--sysconfdir=3D/etc/qemu&#39; &#39;--disable-bochs&#39; <br>
&gt;&gt; &#39;*--firmwarepath=3D/usr/share/qemu:/usr/share/qemu-firmware*&#=
39;<br>
&gt;&gt; #<br>
&gt; <br>
&gt; Yes, all paths within the prefix are relocated.=C2=A0 The workaround i=
s <br>
&gt; simply to configure the intended prefix with configure:<br>
&gt; <br>
&gt; ./configure --prefix=3D/root/qemu ...<br>
&gt; <br>
&gt; or if you don&#39;t know the prefix:<br>
&gt; <br>
&gt; ./configure --prefix=3D/nonexistent ...<br>
&gt; <br>
&gt; Because /usr/share/qemu and /usr/share/qemu-firmware are outside /usr,=
 <br>
&gt; they will be treated as absolute just like /etc/qemu.<br>
&gt; <br>
&gt; Thanks,<br>
&gt; <br>
&gt; Paolo<br>
&gt; <br>
&gt;&gt; And trying to run the executable<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 bash-5.1# ./qemu-system-x86_64<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 qemu: could not load PC BIOS &#39;bios-256k.bin=
&#39;<br>
&gt;&gt;<br>
&gt;&gt; If i print out the resultant binary paths<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 bash-5.1# ./qemu-system-x86_64 -L help<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 /root/qemu/../share/qemu<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 /root/qemu/../share/qemu-firmware<br>
&gt;&gt;<br>
&gt;&gt; So there is no way to have a absolute path for firmware /bios and =
all <br>
&gt;&gt; qemu&#39;s that we test need to be at the right directory nesting =
to find <br>
&gt;&gt; firmware, bios etc or else they all need their own duplicate firmw=
are <br>
&gt;&gt; files. Firmware path needs to honor the absolute paths i believe.<=
br>
&gt;&gt;<br>
&gt; <br>
<br>
</blockquote></div></div></div>

--000000000000e570cd05b8b6de76--


