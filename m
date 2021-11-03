Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 145C54444AB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:32:05 +0100 (CET)
Received: from localhost ([::1]:36422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miIFA-0007eD-4b
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:32:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1miICa-00047d-SQ
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:29:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1miICX-00035D-2d
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:29:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635953359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mSEGZbg0Bg5w5D6seFtfvpLkYnT761ehnixqAmcV3+Y=;
 b=dxRqDd1UXnJt2tr18OkzRNFKHAIiNfMiNOIqvn+IQD4F5dgS45ScEPpQsAi7QdHCOpR0fu
 GTBrq4hNw7Xi6UDqOwRZVrfdN0ZIBalsuGlM7Pn0aCqjCIMIwymRiqOq1ISS5x44Pl5TtC
 hpijbZcH3aMzOTz/ZBRcFJ56yMlZfB4=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-2A_MAB7LMfWEdArrHf1Bmw-1; Wed, 03 Nov 2021 11:29:17 -0400
X-MC-Unique: 2A_MAB7LMfWEdArrHf1Bmw-1
Received: by mail-ua1-f69.google.com with SMTP id
 63-20020a9f2345000000b002cbbc79fb71so1383596uae.0
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mSEGZbg0Bg5w5D6seFtfvpLkYnT761ehnixqAmcV3+Y=;
 b=5yrP19niLlFOEu5GlrXgRcIwT0VtO5+i9eWsPyT2WpMNG9fEGAyIfnMpl2RBpv34TJ
 t3HcDw5wI6qwM9v/BKifu+ktlIz0SP7cu195Fk+0j38JT25UOi1/a2vdYSOt+DhLtIR2
 d205j9c7PmfgkgK148H9r8bTzNGOjhY80CfEvR2jtZe4HM8PN1SdkVCqqAUZJ4Ag1bLq
 S1L9kjvU+d333h3Hf732wlhGINKZcwmrp6jrnSRYhVi329h9EJX7FCj9j3DJZC8ZgcHV
 PTUiZ7FxT9ZsiR/v9tvln7deTukpIaUu2zpJBg+M8tpRb+VfRyxOAvzuVdK8eWWDMVYg
 0Ntg==
X-Gm-Message-State: AOAM531rK/Ml2h9SlwEoDq7+puSXVEoiiLBiTi+RkhvxlQmMPSVIS/TB
 J6TT9rbitOxIBvOpdioHk9v3auhvbmFnNrQlTLEeSHePmaNn7PSIF3bODZL/8EQtuTKLpAppMYd
 JVIaIFTiiAl7pRNwkHtxSsitNJjc8zVU=
X-Received: by 2002:a05:6102:e0d:: with SMTP id
 o13mr35093472vst.13.1635953356728; 
 Wed, 03 Nov 2021 08:29:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziGzRmTMLWNtnMAozYD93Wz8jvqQTWEb/V6Yr5B7Ll3XOpxFS5x89Qd7RooDv/4Mf4FYt3CU4yf5d7tWH2nms=
X-Received: by 2002:a05:6102:e0d:: with SMTP id
 o13mr35093444vst.13.1635953356592; 
 Wed, 03 Nov 2021 08:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211103150407.3459877-1-philmd@redhat.com>
In-Reply-To: <20211103150407.3459877-1-philmd@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 3 Nov 2021 11:29:06 -0400
Message-ID: <CAFn=p-ZgWbX+Q9fXmkMJsoEXn1AybQ=+p0PiM6cdBQsiBf=K4w@mail.gmail.com>
Subject: Re: [PATCH] scripts/coverity-scan: Use Fedora project Docker
 container registry
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b06ae705cfe412fc"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b06ae705cfe412fc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 3, 2021 at 11:04 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
wrote:

> Similarly to commit 102cd5c294d ("tests/docker: use project
> specific container registries"), use the Fedora registry to
> reduce pull rate limits enforced by Docker Hub.
>
> Inspired-by: John Snow <jsnow@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  scripts/coverity-scan/coverity-scan.docker | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/coverity-scan/coverity-scan.docker
> b/scripts/coverity-scan/coverity-scan.docker
> index ecff6ac5b4b..529c0a28566 100644
> --- a/scripts/coverity-scan/coverity-scan.docker
> +++ b/scripts/coverity-scan/coverity-scan.docker
> @@ -15,7 +15,7 @@
>  # The work of actually doing the build is handled by the
>  # run-coverity-scan script.
>
> -FROM fedora:30
> +FROM registry.fedoraproject.org/fedora:30


Should we bump to F34? F30 is EOL. Switching to an LTS distro is also an
option.


>
>  ENV PACKAGES \
>      alsa-lib-devel \
>      bc \
> --
> 2.31.1
>
>

--000000000000b06ae705cfe412fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 3, 2021 at 11:04 AM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Similarly to commit 102cd5c294d (&quot;tests/docker: use project<br>
specific container registries&quot;), use the Fedora registry to<br>
reduce pull rate limits enforced by Docker Hub.<br>
<br>
Inspired-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_b=
lank">jsnow@redhat.com</a>&gt;<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
---<br>
=C2=A0scripts/coverity-scan/coverity-scan.docker | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/coverity-scan/coverity-scan.docker b/scripts/coverity-=
scan/coverity-scan.docker<br>
index ecff6ac5b4b..529c0a28566 100644<br>
--- a/scripts/coverity-scan/coverity-scan.docker<br>
+++ b/scripts/coverity-scan/coverity-scan.docker<br>
@@ -15,7 +15,7 @@<br>
=C2=A0# The work of actually doing the build is handled by the<br>
=C2=A0# run-coverity-scan script.<br>
<br>
-FROM fedora:30<br>
+FROM <a href=3D"http://registry.fedoraproject.org/fedora:30" rel=3D"norefe=
rrer" target=3D"_blank">registry.fedoraproject.org/fedora:30</a></blockquot=
e><div><br></div><div>Should we bump to F34? F30 is EOL. Switching to an LT=
S distro is also an option.<br></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><br>
=C2=A0ENV PACKAGES \<br>
=C2=A0 =C2=A0 =C2=A0alsa-lib-devel \<br>
=C2=A0 =C2=A0 =C2=A0bc \<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000b06ae705cfe412fc--


