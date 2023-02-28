Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CBA6A562F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 10:58:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWwj1-0006dl-VO; Tue, 28 Feb 2023 04:56:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1pWwiy-0006dV-Ta
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 04:56:45 -0500
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1pWwiw-0008K7-HO
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 04:56:44 -0500
Received: by mail-lf1-x12e.google.com with SMTP id r27so12345128lfe.10
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 01:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1677578199;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kL3nzxVuFSZW2Xm6DTx/7dmwetVtgBohQcbxDZFp37E=;
 b=OkPhYc2VdXgREVY2urYhQMaWpZy88PglfzzIxqJWLReJuYLmc+3QSHsTcNOa/2DmIS
 7f6D7zgT1+3upZyzQruwsS4srbav96UxtigtYjAPWLklayiet89+Ykw1+WyRw+ELukPv
 rA9uRjpMLQ/4madnyiUHEtFKEoF4tCQV4W9gEcAINFIMrftO+GpdTdVhstHT9A+rHSoi
 sQ6sbx+8Yf+lJdE9AdXVxP84ODAyOVThCcl/eniRcytr/IxfDKrnJH1QAEokManff5Vv
 Pt/5np5nShNRq7Q6j1xdUwnrflaaNHKrTU9Oc+tXwjgLuEdYebI3ChL6TTAclIF/iB3v
 mV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677578199;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kL3nzxVuFSZW2Xm6DTx/7dmwetVtgBohQcbxDZFp37E=;
 b=JeXbepu2v11YxRsmy0pE2nBJmFSiu+4BPxOYBgdorW230r53qky8fiut5WwYpNbLsu
 t0rVWUlyT3Fio23NiP5lFZr1WDOfmRMwRxdc+rqUEbvoiMWsI1n7ooD1M6zaJLkylKqG
 yfiVbdVpxLAuV+iuekYfUBOuCKVVL5Cb1clPG3wbf6puEMoGcaHFQWlRF9XxYK+Zbj7B
 evOfVwNB9i7zoE7RlCXWTJW/QK6yR0Lefo14fIDQPGU1oNgk64cFLNxoTWpLFBmNaKuT
 m+UWcDr7XESpGEp3Tv/J1xWW5L7THhUHmMr7QINtTwKQRdIU1Fw+87K4c+BYFlNk2Qxy
 05jA==
X-Gm-Message-State: AO0yUKWO0aOkdxFsEVb3Np19EmWWwkfiO+xYOxCOE4D0rA+EgPrKBXVY
 vRE0bfIMVztAZrx3S2+lBRS92yqVlrZ9EC/Rc1jEuQ==
X-Google-Smtp-Source: AK7set9BnZgajpxEGwzIR6Bvv1p5nrwpGJDPK19PXcBp2laXzqqFbN9t+LiXIsuIb9+8SBEJe0I0s2hiGsun2FhL2kE=
X-Received: by 2002:a19:761a:0:b0:4dd:9931:c4ee with SMTP id
 c26-20020a19761a000000b004dd9931c4eemr532146lff.12.1677578199514; Tue, 28 Feb
 2023 01:56:39 -0800 (PST)
MIME-Version: 1.0
References: <20230219162100.174318-1-andrew@daynix.com>
 <20230219162100.174318-4-andrew@daynix.com>
 <Y/NCQhGmqIadlw0y@redhat.com>
In-Reply-To: <Y/NCQhGmqIadlw0y@redhat.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Tue, 28 Feb 2023 11:56:27 +0200
Message-ID: <CAOEp5Of-sC1nuz4rAZkt8YoL2ctnSPAQ9QyxoQ97XiQ17wZ1Fg@mail.gmail.com>
Subject: Re: [PATCH 3/5] qmp: Added the helper stamp check.
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Andrew Melnychenko <andrew@daynix.com>, jasowang@redhat.com, mst@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, thuth@redhat.com, 
 philmd@linaro.org, armbru@redhat.com, eblake@redhat.com, 
 qemu-devel@nongnu.org, toke@redhat.com, mprivozn@redhat.com, yan@daynix.com
Content-Type: multipart/alternative; boundary="000000000000aa539a05f5bf9c04"
Received-SPF: none client-ip=2a00:1450:4864:20::12e;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000aa539a05f5bf9c04
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 20, 2023 at 11:50=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@=
redhat.com>
wrote:

> On Sun, Feb 19, 2023 at 06:20:58PM +0200, Andrew Melnychenko wrote:
> > Added a function to check the stamp in the helper.
> > eBPF helper should have a special symbol that generates during the buil=
d.
> > QEMU checks the helper and determines that it fits, so the helper
> > will produce proper output.
>
> I think this is quite limiting for in place upgrades.
>
> Consider this scenario
>
>  * Host has QEMU 8.1.0 installed
>  * VM is running QEMU 8.1.0
>  * QEMU 8.1.1 is released with a bug fix in the EBF program
>  * Host is upgraded to QEMU 8.1.1
>  * User attempts to hotplug a NIC to the running VM
>
> IIUC this last step is going to fail because we'll be loading
> the EBF program from 8.1.1 and so its hash is different from
> that expected by the QEMU 8.1.0 that the pre-existing VM is
> running.
>
>   Indeed we did not take in account the in-place upgrade.



> If some changes to the EBF program are not going to be back
> compatible from the POV of the QEMU process, should we instead
> be versioning the EBF program. eg so new QEMU will ship both
> the old and new versions of the EBF program.
>
>
This does not seem to be an elegant option: QEMU theoretically can include
different eBPF programs but it hardly can interface with each one of them.
The code of QEMU (access to eBPF maps etc) includes header files which eBPF
of the day is being built with them.

I see 2 options to address this issue (of course there are more)
1. Build and install qemu-rss-helper-<hash> executable. Libvirt will always
have a correct name, so for the running instance it will use
qemu-rss-helper-<old-hash>, for the new instance it will use
qemu-rss-helper-<new-hash>
2. Build the helper executable and link it inside qemu as a blob. Libvirt
will always retrieve the executable to the temporary file name and use it.
So the retrieved helper will always be compatible with QEMU. I'm not sure
what is the most portable way to do that.

Daniel,
Does one of these seem suitable?


> With regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--000000000000aa539a05f5bf9c04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>On Mon, Feb 20, 2023 at 11:50=E2=80=
=AFAM Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">be=
rrange@redhat.com</a>&gt; wrote:<br></div></div><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, Feb 19, 2023 at 0=
6:20:58PM +0200, Andrew Melnychenko wrote:<br>
&gt; Added a function to check the stamp in the helper.<br>
&gt; eBPF helper should have a special symbol that generates during the bui=
ld.<br>
&gt; QEMU checks the helper and determines that it fits, so the helper<br>
&gt; will produce proper output.<br>
<br>
I think this is quite limiting for in place upgrades.<br>
<br>
Consider this scenario<br>
<br>
=C2=A0* Host has QEMU 8.1.0 installed<br>
=C2=A0* VM is running QEMU 8.1.0<br>
=C2=A0* QEMU 8.1.1 is released with a bug fix in the EBF program<br>
=C2=A0* Host is upgraded to QEMU 8.1.1<br>
=C2=A0* User attempts to hotplug a NIC to the running VM<br>
<br>
IIUC this last step is going to fail because we&#39;ll be loading<br>
the EBF program from 8.1.1 and so its hash is different from<br>
that expected by the QEMU 8.1.0 that the pre-existing VM is<br>
running.<br>
<br></blockquote><div>=C2=A0 Indeed we did not take in account the in-place=
 upgrade.<div><br></div></div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
If some changes to the EBF program are not going to be back<br>
compatible from the POV of the QEMU process, should we instead<br>
be versioning the EBF program. eg so new QEMU will ship both<br>
the old and new versions of the EBF program. <br>
<br></blockquote><div><br></div><div>This does not seem to be an elegant op=
tion: QEMU theoretically can include different eBPF programs but it hardly =
can interface with each one of them.</div><div>The code of QEMU (access to =
eBPF maps etc) includes header files which eBPF of the day is being built w=
ith them.</div><div><br></div><div>I see 2 options to address this issue (o=
f course there are more)</div><div>1. Build and install qemu-rss-helper-&lt=
;hash&gt; executable. Libvirt will always have a correct name, so for the r=
unning instance it will use qemu-rss-helper-&lt;old-hash&gt;, for the new i=
nstance it will use=C2=A0 qemu-rss-helper-&lt;new-hash&gt;</div><div>2. Bui=
ld the helper executable and link it inside qemu as a blob. Libvirt will al=
ways retrieve the executable to the temporary file name and use it. So the =
retrieved helper will always be compatible with QEMU. I&#39;m not sure what=
 is the most portable way to do that.</div><div><br></div><div>Daniel,</div=
><div>Does one of these seem suitable?</div><div><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div>

--000000000000aa539a05f5bf9c04--

