Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A706147F139
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 22:26:58 +0100 (CET)
Received: from localhost ([::1]:45572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0s5Z-0007sF-6g
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 16:26:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1n0s4R-00075v-Ag
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 16:25:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1n0s4N-0007ny-AR
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 16:25:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640381141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I81qnYZa4ERC4xoyxWWfU9PNq+hQnVW9a146QUPBiD4=;
 b=Vm3VDH1BgNn5L88YC6dLdkEk6GY0Vv7xZx/xzYn4NIUmUShunbbEhzF+hZSpC+JxlLJt7L
 THeSmlmYsadN1HIU/a91IMC69tkLHr5nlfhJH1vYi7TVS27fb1R7nZqqG+jw9tfQRnT/ws
 L/wHbSbj63UXXjC/eDeXyQn9uJ5qmtU=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-3DPTFyCmPLmTMox0ftyQCQ-1; Fri, 24 Dec 2021 16:25:38 -0500
X-MC-Unique: 3DPTFyCmPLmTMox0ftyQCQ-1
Received: by mail-pg1-f200.google.com with SMTP id
 n22-20020a6563d6000000b0029261ffde9bso5572661pgv.22
 for <qemu-devel@nongnu.org>; Fri, 24 Dec 2021 13:25:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I81qnYZa4ERC4xoyxWWfU9PNq+hQnVW9a146QUPBiD4=;
 b=vwaAjpcPTTZTmOADDYYuNJeDERyg2lmyGEfZYyV0L/xmmOSNF+N50qBTtriM0AshGc
 Oj2GsGwJCoKn7Ecc5JU0efIm1YzN0k+Ck4L4uCem7GJT2/zQLQdU1y7jAdJPLWeKR0wm
 E7vb19t13nNHGpHE+RzRUwuCNircXLPFbVqFuiv+LF3KVUwmNJx1IZdZzg9luz+x4Skf
 nEor3ZZ3Q+O2k9gRjQY79wabdwDH0LUjXWBrp5KgkAYmY5PL3I/pQ9RwZOLdDGi3lVew
 Nb0ZCUNabcPLO0Jq5L0lGN+ZQksV9vsCXTTzEKgQKjRronpb4Yxm9MZ2dZTZJ8PaKJC1
 Q7Ag==
X-Gm-Message-State: AOAM531k+tlzE0+41YdVFCrzGlT8h65kBoIQVTvips2jEl9qExDQkT70
 daqtmCNWWiK+w8xEcyc4Otx+PsqqvDKr+uTsOUP6wS2wWlVH2b3c40a7Vg/AjSYSsRoEvln9dpE
 0ZfZhnJ5u1ugL/rvoUnjeno8JsE5wrKk=
X-Received: by 2002:a17:90b:1a8b:: with SMTP id
 ng11mr9804371pjb.13.1640381136750; 
 Fri, 24 Dec 2021 13:25:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLFcJ3DfV0VMzv2V6ZotjjBMV+e6TWMALiMcmcChLZipHmmSa1B5GF2cwITIiAmt2GKSDw8YX/BQUrki4VVx8=
X-Received: by 2002:a17:90b:1a8b:: with SMTP id
 ng11mr9804352pjb.13.1640381136483; 
 Fri, 24 Dec 2021 13:25:36 -0800 (PST)
MIME-Version: 1.0
References: <20211224113402.6d2d54f9@orange>
In-Reply-To: <20211224113402.6d2d54f9@orange>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 24 Dec 2021 22:25:24 +0100
Message-ID: <CABgObfZWaeo2yQLvgHNhA443yqZLtcSusbms8hUafx-KuYXUaA@mail.gmail.com>
Subject: Re: QEMU CI failure of cross-i386-* targets (meson picks wrong glib
 for native target)
To: Alessandro Di Federico <ale@rev.ng>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000efca8f05d3eafe5d"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Brian Cain <bcain@quicinc.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000efca8f05d3eafe5d
Content-Type: text/plain; charset="UTF-8"

Is the configure script setting $cross_compile to yes? That will decide
whether meson getting a --cross-file or a --native-file option, and
consequently whether it treats the host and build machines as equal or
different.

Paolo

Il ven 24 dic 2021, 12:09 Alessandro Di Federico <ale@rev.ng> ha scritto:

> Hi Paolo, I'm trying to get the QEMU CI run successfully for the
> idef-parser patchset. However I'm facing an issue I haven't been able
> to work around with meson. Maybe you can help?
>
> The failing tests are cross-i386-*
>
>     https://gitlab.com/carl.cudig/qemu/-/jobs/1437392669
>     https://gitlab.com/carl.cudig/qemu/-/jobs/1437392673
>     https://gitlab.com/carl.cudig/qemu/-/jobs/1437392671
>
> I think the problem is that we're adding a new build-time dependency:
> glib. However glib is also a run-time dependency and, AFAIU, when cross
> compiling for x86 on a x86-64 machine, if you create a native
> executable, meson picks up the x86 version of glib (as opposed to the
> x86-64).
>
> I've been fiddling with this for a while, unsuccessfully.
>
> Relevant portion of the code:
>
>
> https://gitlab.com/carl.cudig/qemu/-/commit/c020958c37fa723f7e933a58b1bb1c3668ff4cff#8145a41027f26ff426d5a2c8b00c56f227943165_198_202
>
> Happy holidays!
>
> --
> Alessandro Di Federico
> rev.ng Labs Srl
>
>

--000000000000efca8f05d3eafe5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Is the configure script setting $cross_compile to yes? Th=
at will decide whether meson getting a --cross-file or a --native-file opti=
on, and consequently whether it treats the host and build machines as equal=
 or different.<br><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
Il ven 24 dic 2021, 12:09 Alessandro Di Federico &lt;<a href=3D"mailto:ale@=
rev.ng" target=3D"_blank" rel=3D"noreferrer">ale@rev.ng</a>&gt; ha scritto:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">Hi Paolo, I&#39;m trying to get th=
e QEMU CI run successfully for the<br>
idef-parser patchset. However I&#39;m facing an issue I haven&#39;t been ab=
le<br>
to work around with meson. Maybe you can help?<br>
<br>
The failing tests are cross-i386-*<br>
<br>
=C2=A0 =C2=A0 <a href=3D"https://gitlab.com/carl.cudig/qemu/-/jobs/14373926=
69" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://gitl=
ab.com/carl.cudig/qemu/-/jobs/1437392669</a><br>
=C2=A0 =C2=A0 <a href=3D"https://gitlab.com/carl.cudig/qemu/-/jobs/14373926=
73" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://gitl=
ab.com/carl.cudig/qemu/-/jobs/1437392673</a><br>
=C2=A0 =C2=A0 <a href=3D"https://gitlab.com/carl.cudig/qemu/-/jobs/14373926=
71" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://gitl=
ab.com/carl.cudig/qemu/-/jobs/1437392671</a><br>
<br>
I think the problem is that we&#39;re adding a new build-time dependency:<b=
r>
glib. However glib is also a run-time dependency and, AFAIU, when cross<br>
compiling for x86 on a x86-64 machine, if you create a native<br>
executable, meson picks up the x86 version of glib (as opposed to the<br>
x86-64).<br>
<br>
I&#39;ve been fiddling with this for a while, unsuccessfully.<br>
<br>
Relevant portion of the code:<br>
<br>
=C2=A0 =C2=A0 <a href=3D"https://gitlab.com/carl.cudig/qemu/-/commit/c02095=
8c37fa723f7e933a58b1bb1c3668ff4cff#8145a41027f26ff426d5a2c8b00c56f227943165=
_198_202" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https:=
//gitlab.com/carl.cudig/qemu/-/commit/c020958c37fa723f7e933a58b1bb1c3668ff4=
cff#8145a41027f26ff426d5a2c8b00c56f227943165_198_202</a><br>
<br>
Happy holidays!<br>
<br>
-- <br>
Alessandro Di Federico<br>
rev.ng Labs Srl<br>
<br>
</blockquote></div>

--000000000000efca8f05d3eafe5d--


