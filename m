Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13100482E46
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 06:48:52 +0100 (CET)
Received: from localhost ([::1]:47676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4GDC-0002H8-He
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 00:48:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n4G8J-0000zG-Vp
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 00:43:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n4G8F-0007Vc-T9
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 00:43:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641188621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DNIpUoZsXznhjtoVxL+BLzHiU/YRZ5NBMAdbInJIAf8=;
 b=KqKEGsHT+7PAQish0VrzC13eq4lhtK9ETCYiS26OWZl6vxvQSArW/UCZodRwa5ewgTLAg1
 Y+EoH5vu/GJJ4LtfQWGqErxkYoNGafJc35OqOBtG0XSrSBBx3vnAbd+Do+tN4JFrER7AK3
 rF3kgcY1XtbHc/vstdFVi4GwdpExuyQ=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-dXF59_EGPMq7tMcrM72NpA-1; Mon, 03 Jan 2022 00:43:39 -0500
X-MC-Unique: dXF59_EGPMq7tMcrM72NpA-1
Received: by mail-ua1-f70.google.com with SMTP id
 w14-20020ab055ce000000b002fedc60272fso9218254uaa.21
 for <qemu-devel@nongnu.org>; Sun, 02 Jan 2022 21:43:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DNIpUoZsXznhjtoVxL+BLzHiU/YRZ5NBMAdbInJIAf8=;
 b=CKzqVmV5K1itDarwdZ5RLkJVoeZgi48YWN5h+KnlOtf5H4aNSJVNld2maCbjQztmJA
 zvKABX7N3DASXv4AtHkB3KSeLYTtvHlVDBSrTKeUrKEv6mcrUsYwfY6XmKpGnYZc2Dt/
 kdkDDCvJJRbIvNDAB6/uSwps009Y2CS4E1/gHIUT8oikQnubeb9XPNdtB4uOBD1qsrm2
 yK8emyafH59TOQ6Gd2Cpe5/50J1K1LtQdSlwJ5uwZYIH5PCBBT1b5b5tNIgxmbHJNrjr
 vFqjyuv2Fgrfwm6gnGKIPvJJ4e/5lNaqfHj4y8LP1tVmizzHQ9EcuQvcdmUxtiFh/kBL
 wCAA==
X-Gm-Message-State: AOAM533xc6tXPU7HOUUOCiNJY/mF4WnaIRdPnt2aXmJ2sIcEpg8/rmpL
 rF/EpDkmD96GWfytspd5a7pR2CWY2fEVZrImYH5gZPz8gdo6pftdezOutK4JkG4Y26mRIu9nvSl
 AaXJ5toFNHQntZgnQKBc4XY9bEQolnBA=
X-Received: by 2002:a67:ce0b:: with SMTP id s11mr14178901vsl.38.1641188618539; 
 Sun, 02 Jan 2022 21:43:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylimGp/J6ksTytXKzH8z8aMC3gulCSWbJEy1n4mHeyRHXCzCnfxpqeonYCetmVrq1XnOP4rCiofddqZR1WxYU=
X-Received: by 2002:a67:ce0b:: with SMTP id s11mr14178896vsl.38.1641188618302; 
 Sun, 02 Jan 2022 21:43:38 -0800 (PST)
MIME-Version: 1.0
References: <d2112a58-a6bc-ebaa-ad94-60d66f4a3437@linaro.org>
 <46a6112c-bc7a-d76f-ccc1-a921df6add77@redhat.com>
In-Reply-To: <46a6112c-bc7a-d76f-ccc1-a921df6add77@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 3 Jan 2022 00:43:27 -0500
Message-ID: <CAFn=p-axOPEimW8H=TmUHwPnvGw--vFMG377Jq1Mhpu0a0Jdvw@mail.gmail.com>
Subject: Re: check-python-tox failures
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000009a887c05d4a70084"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009a887c05d4a70084
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 29, 2021 at 7:03 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
wrote:

> On 12/23/21 05:11, Richard Henderson wrote:
> > Hi John,
> >
> > This test has been failing for quite a while. While it is allowed to
> > fail, can we either fix this or disable it, to allow the ci to go prope=
r
> > green?
>
> This job not only fails on the mainstream pipelines, but also on
> all forks recently rebased. This is very annoying, I am in favor
> of disabling the job until someone figure out what is wrong.
>
> Phil.
>
>
I've been away on holiday, and will be away for another week.

Looks like a few dependencies were updated in the python ecosystem and
broke a few things. I tried to fix it in a few hurried minutes, but ... it
looks pretty broken:

 (33/33) tests/pylint.sh:  FAIL: Exited with status: '1', stdout:
"************* \nqemu/__init__.py:1:0: F0010: error while code parsing:
Unable to load file qemu/__init__.py:\n[Errno 2] No such file or directory:
'qemu/__init__.py' (parse-error)\n", stderr: "*************
\nqemu/__init_... (0.54 s)

I am not sure why on god's green earth Pylint has decided it doesn't know
how to import namespaced modules anymore. I probably won't be able to fix
this until next week, so just disable it for now and I'll fix it when I get
back.

--js.

(ps: attempted fix here https://gitlab.com/jsnow/qemu/-/pipelines/440208449
but there seems to be something very wrong with pylint in the tox
environment -- I suspect a dependency of pylint's was updated and is
breaking things. I'll have to identify which one it is and update the
package reqs to exclude it, but ATM I have no idea which it is.)

(pps, Cleber, what happened to the avocado output here? It's not showing
error logs from the failed tests anymore. Did avocado update and break
these options?)

--0000000000009a887c05d4a70084
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Wed, Dec 29, 2021 at 7:03 PM Philippe Mathieu-Daud=C3=A9 &lt;=
<a href=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On 12/23/21 05:11, Ri=
chard Henderson wrote:<br>
&gt; Hi John,<br>
&gt; <br>
&gt; This test has been failing for quite a while. While it is allowed to<b=
r>
&gt; fail, can we either fix this or disable it, to allow the ci to go prop=
er<br>
&gt; green?<br>
<br>
This job not only fails on the mainstream pipelines, but also on<br>
all forks recently rebased. This is very annoying, I am in favor<br>
of disabling the job until someone figure out what is wrong.<br>
<br>
Phil.<br>
<br></blockquote><div><br></div><div>I&#39;ve been away on holiday, and wil=
l be away for another week.</div><div><br></div><div>Looks like a few depen=
dencies were updated in the python ecosystem and broke a few things. I trie=
d to fix it in a few hurried minutes, but ... it looks pretty broken:<br></=
div><div><br></div><div>=C2=A0(33/33) tests/pylint.sh: =C2=A0FAIL: Exited w=
ith status: &#39;1&#39;, stdout: &quot;************* \nqemu/__init__.py:1:0=
: F0010: error while code parsing: Unable to load file qemu/__init__.py:\n[=
Errno 2] No such file or directory: &#39;qemu/__init__.py&#39; (parse-error=
)\n&quot;, stderr: &quot;************* \nqemu/__init_... (0.54 s)</div><div=
><br></div><div>I am not sure why on god&#39;s green earth Pylint has decid=
ed it doesn&#39;t know how to import namespaced modules anymore. I probably=
 won&#39;t be able to fix this until next week, so just disable it for now =
and I&#39;ll fix it when I get back.<br></div><div><br></div><div>--js.<br>=
<br></div><div>(ps: attempted fix here <a href=3D"https://gitlab.com/jsnow/=
qemu/-/pipelines/440208449">https://gitlab.com/jsnow/qemu/-/pipelines/44020=
8449</a> but there seems to be something very wrong with pylint in the tox =
environment -- I suspect a dependency of pylint&#39;s was updated and is br=
eaking things. I&#39;ll have to identify which one it is and update the pac=
kage reqs to exclude it, but ATM I have no idea which it is.)</div><div><br=
></div><div>(pps, Cleber, what happened to the avocado output here? It&#39;=
s not showing error logs from the failed tests anymore. Did avocado update =
and break these options?)<br></div></div></div>

--0000000000009a887c05d4a70084--


