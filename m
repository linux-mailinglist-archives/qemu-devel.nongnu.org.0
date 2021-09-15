Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD5340C5C8
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 14:57:24 +0200 (CEST)
Received: from localhost ([::1]:34046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQUTb-0001zS-4V
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 08:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQUR7-0000YY-KW
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 08:54:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQUR2-0007nw-UC
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 08:54:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631710483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eSSlWV7zXCWIY2EirDp0+olwFG1lDN4bjKW8Ut3k+pw=;
 b=PF2j6qN1kpMyGMHovHAHFlK7GF2nL1RIZ8rHLAF4ZmSiGEDeRUFX+gt8H72MHzmPkbrbrp
 QztFboMhN5EBPnuoJz6vGce2zjxI72T2nPcxHj5snr4yVbGFmL4GhDOBQb1UrHXAACV7kt
 iU1WBM1giZ75ouJff9O4RpyVzqrocXI=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-tjh-0gVOPJKMOch-7WzEhg-1; Wed, 15 Sep 2021 08:54:39 -0400
X-MC-Unique: tjh-0gVOPJKMOch-7WzEhg-1
Received: by mail-oi1-f199.google.com with SMTP id
 u23-20020acaab17000000b0026857819b52so1985514oie.1
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 05:54:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eSSlWV7zXCWIY2EirDp0+olwFG1lDN4bjKW8Ut3k+pw=;
 b=pMLIAeYi6lG7eUTA5nuceSGlZEGbcEWw/qq/U8ABUXVi59/uM6hWOUY+sHT0q5YDVi
 0mxRouiHHGUaqt2Yd35FVS2/le0kF9bD9/HS0nxgDw/yCFt7PXXcSS28w57y0SaT87f3
 xKMoA5a954g0dGsUw27yd4jsZNTP6BI1NYykHmHhLWcR0MuT6kB4U5uuHSOyfVKBLk5t
 tE3jxUGuQQE8gr4p8PuDp7lZSyj0Hg0vd5Yxwk5OUBAC5FaMZYRf7Jdk+0rs+bOkiGvD
 gHLGarhWo2PpnyCBIHHlyh8+7RQLWzp6zRvd/z75Il4906gOj16bJYsCHSQmczoB5BAb
 g00Q==
X-Gm-Message-State: AOAM531sZKuA1CqrSL8cn3IwETyr/aqHXKsWvG3EIKGqU2W9YyfkJobK
 nu2ezliAZ8X8SBfzpCmFrjb4/okr1ykI3/m9efLcXBwj+UudfdNJCiKa0KVQKfjVzQwC1SKhf8t
 nzIsH0zmfpd5iGj65PJTHwhfaAtIZQFs=
X-Received: by 2002:a05:6808:a01:: with SMTP id
 n1mr4877357oij.52.1631710478606; 
 Wed, 15 Sep 2021 05:54:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz573Kmu+HUXLDRrKSbbRI2M2CIQdsQXmXDrvLPHSHCS2BybSmN1ku3fl5r2bm57siCY1UnEmSSqEh+0x6EOfc=
X-Received: by 2002:a05:6808:a01:: with SMTP id
 n1mr4877340oij.52.1631710478369; 
 Wed, 15 Sep 2021 05:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210915053011.293335-1-jsnow@redhat.com>
 <YUG4iuTaFK0Krje6@redhat.com>
In-Reply-To: <YUG4iuTaFK0Krje6@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 15 Sep 2021 08:54:27 -0400
Message-ID: <CAFn=p-b9ic6CpJ3F60=j+TQ3NkhdvpR-14250h+h35q=SS_55w@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] Update check-python-tox test for pylint 2.10
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000070a01005cc083387"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: G S Niteesh Babu <niteesh.gs@gmail.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000070a01005cc083387
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 15, 2021 at 5:10 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Wed, Sep 15, 2021 at 01:30:10AM -0400, John Snow wrote:
> > V2: It's not safe to use sys.stderr.encoding to determine a "console
> > encoding", because that uses the "current" stderr and not a
> > hypothetically generic one -- and doing this causes the acceptance test=
s
> > to fail.
> >
> > Use UTF-8 instead.
> >
> > Question: What encoding do terminal programs use? Is there an inherent
> > encoding to fprintf et al, or does it just push whatever bytes you put
> > into it straight into the stdout/stderr pipe?
>
> Programs are expected to output data in the encoding that is set in
> the various env variables LC_ALL/LC_CTYPE/LANG.
>
> In traditional end user scenarios this almost always means UTF-8 charset.
>
> There's plenty of cases which end up with the C locale though, which
> would mean 7-bit ASCII on Linux, though apps are supposed to be 8-bit
> clean allow data with the high bit to pass through without interpretation=
.
> The latter is what python3 gets very wrong complaining if you output
> 8-bit high data in C locale.
>
> There is increasing support for a C.UTF-8 locale to bring it closer to
> other locales which are all UTF-8.
>
> On macOS the C locale has been UTF-8 by default indefinitely.
>
> Windows is a whole other world of fun and IIRC isn't UTF-8 by default,
> but I don't recall details.
>
>
> Regards,
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
Hm, I believe I can use `lang, encoding =3D locale.getlocale() ` in this ca=
se
-- I believe it follows LC_CTYPE. This ought to accurately match the
console output from QEMU.
I'll respin, actually. We don't test the Python packages on Windows, but I
see no reason to introduce a nasty timebomb.

Thanks!
--js

--00000000000070a01005cc083387
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 15, 2021 at 5:10 AM Danie=
l P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Wed, Sep 15, 2021 at 01:30:10AM -0400, John Snow wrote:<br>
&gt; V2: It&#39;s not safe to use sys.stderr.encoding to determine a &quot;=
console<br>
&gt; encoding&quot;, because that uses the &quot;current&quot; stderr and n=
ot a<br>
&gt; hypothetically generic one -- and doing this causes the acceptance tes=
ts<br>
&gt; to fail.<br>
&gt; <br>
&gt; Use UTF-8 instead.<br>
&gt; <br>
&gt; Question: What encoding do terminal programs use? Is there an inherent=
<br>
&gt; encoding to fprintf et al, or does it just push whatever bytes you put=
<br>
&gt; into it straight into the stdout/stderr pipe?<br>
<br>
Programs are expected to output data in the encoding that is set in<br>
the various env variables LC_ALL/LC_CTYPE/LANG.<br>
<br>
In traditional end user scenarios this almost always means UTF-8 charset.<b=
r>
<br>
There&#39;s plenty of cases which end up with the C locale though, which<br=
>
would mean 7-bit ASCII on Linux, though apps are supposed to be 8-bit<br>
clean allow data with the high bit to pass through without interpretation.<=
br>
The latter is what python3 gets very wrong complaining if you output<br>
8-bit high data in C locale.<br>
<br>
There is increasing support for a C.UTF-8 locale to bring it closer to<br>
other locales which are all UTF-8.<br>
<br>
On macOS the C locale has been UTF-8 by default indefinitely.<br>
<br>
Windows is a whole other world of fun and IIRC isn&#39;t UTF-8 by default,<=
br>
but I don&#39;t recall details.<br>
<br>
<br>
Regards,<br>
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
<br></blockquote><div><br></div><div>Hm, I believe I can use `lang, encodin=
g =3D locale.getlocale() ` in this case -- I believe it follows LC_CTYPE. T=
his ought to accurately match the console output from QEMU.</div><div>I&#39=
;ll respin, actually. We don&#39;t test the Python packages on Windows, but=
 I see no reason to introduce a nasty timebomb.</div><div><br></div><div>Th=
anks!</div><div>--js<br></div><div><br></div></div></div>

--00000000000070a01005cc083387--


