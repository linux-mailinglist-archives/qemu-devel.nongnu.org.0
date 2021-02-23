Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF1B3231F5
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 21:20:55 +0100 (CET)
Received: from localhost ([::1]:51478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEeAv-0003At-Ry
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 15:20:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lEe9X-0002fC-Hh
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 15:19:27 -0500
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36]:40607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lEe9U-0007WI-OY
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 15:19:27 -0500
Received: by mail-vs1-xe36.google.com with SMTP id u142so6727600vsu.7
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 12:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XTBiAHIAudDg58wq7hpJeDngTiw5nbYbMT2SvYDK0GY=;
 b=KYYcNGgSNZa2db9/k6hPC4wgmVGypVX8ZG9vmTYkBAjoO4TG82hgiKQn45IhsZF+pX
 qpl0aaqmnry4+KsXoQj2D93x/VwkZv3tBk0nIlbgQ7EnOxdWCE4zR+Cy9uOOtEKSoPtL
 IQCzMPvMOBgnjOvAKEJjTORJ/JoypV/+U02XDOri2XVLC9/x9b00m2TKkg1GpUeu1n1S
 IWbB3qPoQfZWJbKYnfqyGn7eTmufW3GClvHSkdMjipV0fmzoUNDYMayFsRn+s6/LTCi5
 tvAgQnU+SHh59G6F/Z3Y+MH1LlzwHAR/a5c9YbjFRQmfcdlEWkEnU79NwXJuTQRFafO4
 GHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XTBiAHIAudDg58wq7hpJeDngTiw5nbYbMT2SvYDK0GY=;
 b=XTiNeVxDQeuz8We01vvrQeyyvlEiGqNdYNdLWNfmc3IAfdabsSo0R6oS5pL0I+CiI/
 ds4OTJwl6itbkfufDWwRVr+VS2ppZq0Vys+cBHu31unqYIHjxKfa+yFnBP62FJUKmQyz
 EeSsDHRxuLX9TcBlAZzrrLeWCMtlZ5XrGn9z1rtllG6QXlHMO+vJM9jhdB+lVdcjk4j3
 eUxng0PaHEb+mWBOVO+Dn7u5Qrlg6VpXi7Qm9vnPlT/mF6Mj8kQLcF/bxt9ccS2r6Ppy
 xrYUXV376/kO2Dz+j1RFbONJ+bUaWXTfZUFW22nkbprJAMA91hVaUfWXFgGBvibASEZ1
 7ewQ==
X-Gm-Message-State: AOAM533mQsc37UBFMDXy1YY50iSXCgA+K2YQizEBtILaPtkos7X6qG74
 e94F9nxMtCIpghTrSH00o+bgEGv+5IxR+SYChnwEcg==
X-Google-Smtp-Source: ABdhPJxjun7QpRJ4XRoHxEeyoRXDHGOPfrhKl3kaHgUDWPRrufcv8C0EcZNICvRkc5Zvg49Tw95CaF6/ocJEcadS/88=
X-Received: by 2002:a67:1481:: with SMTP id 123mr2817473vsu.52.1614111563155; 
 Tue, 23 Feb 2021 12:19:23 -0800 (PST)
MIME-Version: 1.0
References: <20210220001322.1311139-1-dje@google.com>
 <20210220001322.1311139-2-dje@google.com>
 <858a59f8-a97e-3d9b-3e19-16b73f93ca4c@redhat.com>
In-Reply-To: <858a59f8-a97e-3d9b-3e19-16b73f93ca4c@redhat.com>
From: Doug Evans <dje@google.com>
Date: Tue, 23 Feb 2021 12:18:45 -0800
Message-ID: <CADPb22SOSK=PV0fypfB72jUgWG01D80XhJ5LJLCqgo9ozqaDXA@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] slirp: Advance libslirp submodule to add ipv6
 host-forward support
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000005b6dd705bc06a29f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=dje@google.com; helo=mail-vs1-xe36.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005b6dd705bc06a29f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 19, 2021 at 4:20 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
wrote:

> Hi Doug,
>
> On 2/20/21 1:13 AM, Doug Evans via wrote:
>
> When updating submodules, the commit description is a good
> good place to include the output of:
>
>   $ git shortlog 8f43a99..26ae658
>
> See for example QEMU commit f350d78f102 ("Update SLOF").
>
> Anyhow up to the maintainer merging your patch.
>


Thanks, that helps a little.
The issue here is that qemu is using branch 4.2 of libslirp, whereas the
patch is currently just on libslirp's master branch.
Part of the problem is the commit description, which you've helped with.
But what about the functional part of the patch?
I can only get git format-patch to include a commit id, and the only commit
id available is on the libslirp master branch.

Is there an additional step I need to do like submit libslirp changes in
three parts?
Step 1: Submit patch to libslirp's repo (not qemu's copy, but the
libslirp master repo)
Step 2: Submit a patch to libslirp's repo to add the patch to its 4.2 branc=
h
Step 2b: Wait for qemu's copy of libslirp's 4.2 branch to appear in
qemu's libslirp repo
Step 3: Submit patch to advance qemu's libslirp submodule

I've done steps 1,3, it's just effecting the equivalent of step2 that I'm
fuzzy on.


> > Signed-off-by: Doug Evans <dje@google.com>
> > ---
> >
> > Changes from v4:
> > NOTE TO REVIEWERS: I need some hand-holding to know what The Right
> > way to submit this particular patch is.
> >
> > - no change
> >
> > Changes from v3:
> > - pick up latest libslirp patch to reject ipv6 addr-any for guest addre=
ss
> >   - libslirp currently only provides a stateless DHCPv6 server, which
> means
> >     it can't know in advance what the guest's IP address is, and thus
> >     cannot do the "addr-any -> guest ip address" translation that is do=
ne
> >     for ipv4
> >
> > Changes from v2:
> > - this patch is new in v3, split out from v2
> >
> >  slirp | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/slirp b/slirp
> > index 8f43a99191..26ae658a83 160000
> > --- a/slirp
> > +++ b/slirp
> > @@ -1 +1 @@
> > -Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
> > +Subproject commit 26ae658a83eeca16780cf5615c8247cbb151c3fa
> >
>
>

--0000000000005b6dd705bc06a29f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Fri, Feb 19, 2021 at 4:20 PM Philippe Mathieu-Daud=C3=A9 &=
lt;<a href=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br=
></div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Hi Doug,<br>
<br>
On 2/20/21 1:13 AM, Doug Evans via wrote:<br>
<br>
When updating submodules, the commit description is a good<br>
good place to include the output of:<br>
<br>
=C2=A0 $ git shortlog 8f43a99..26ae658<br>
<br>
See for example QEMU commit f350d78f102 (&quot;Update SLOF&quot;).<br>
<br>
Anyhow up to the maintainer merging your patch.<br></blockquote><div><br></=
div><div><br></div><div class=3D"gmail_default" style=3D"font-size:small">T=
hanks, that helps a little.</div><div class=3D"gmail_default" style=3D"font=
-size:small">The issue here is that qemu is using branch 4.2 of libslirp, w=
hereas the patch is currently just on libslirp&#39;s master branch.</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">Part of the problem is=
 the commit description, which you&#39;ve helped with.</div><div class=3D"g=
mail_default" style=3D"font-size:small">But what about the functional part =
of the patch?</div><div class=3D"gmail_default" style=3D"font-size:small">I=
 can only get git format-patch to include a commit id, and the only commit =
id available is on the libslirp=C2=A0master branch.</div><div class=3D"gmai=
l_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default"=
 style=3D"font-size:small">Is there an additional step I need to do like su=
bmit libslirp=C2=A0changes in three parts?</div><div class=3D"gmail_default=
" style=3D"font-size:small">Step 1: Submit patch to libslirp&#39;s=C2=A0rep=
o (not qemu&#39;s copy, but the libslirp=C2=A0master repo)</div><div class=
=3D"gmail_default" style=3D"font-size:small">Step 2: Submit a patch to libs=
lirp&#39;s=C2=A0repo to add the patch to its 4.2 branch</div><div class=3D"=
gmail_default" style=3D"font-size:small">Step 2b: Wait for qemu&#39;s=C2=A0=
copy of libslirp&#39;s=C2=A04.2 branch to appear in qemu&#39;s=C2=A0libslir=
p repo</div><div class=3D"gmail_default" style=3D"font-size:small">Step 3: =
Submit patch to advance qemu&#39;s libslirp=C2=A0submodule</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">I&#39;ve done steps 1,3, it&#39;s just e=
ffecting the equivalent of step2 that I&#39;m fuzzy on.</div><div class=3D"=
gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
&gt; Signed-off-by: Doug Evans &lt;<a href=3D"mailto:dje@google.com" target=
=3D"_blank">dje@google.com</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; Changes from v4:<br>
&gt; NOTE TO REVIEWERS: I need some hand-holding to know what The Right<br>
&gt; way to submit this particular patch is.<br>
&gt; <br>
&gt; - no change<br>
&gt; <br>
&gt; Changes from v3:<br>
&gt; - pick up latest libslirp patch to reject ipv6 addr-any for guest addr=
ess<br>
&gt;=C2=A0 =C2=A0- libslirp currently only provides a stateless DHCPv6 serv=
er, which means<br>
&gt;=C2=A0 =C2=A0 =C2=A0it can&#39;t know in advance what the guest&#39;s I=
P address is, and thus<br>
&gt;=C2=A0 =C2=A0 =C2=A0cannot do the &quot;addr-any -&gt; guest ip address=
&quot; translation that is done<br>
&gt;=C2=A0 =C2=A0 =C2=A0for ipv4<br>
&gt; <br>
&gt; Changes from v2:<br>
&gt; - this patch is new in v3, split out from v2<br>
&gt; <br>
&gt;=C2=A0 slirp | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/slirp b/slirp<br>
&gt; index 8f43a99191..26ae658a83 160000<br>
&gt; --- a/slirp<br>
&gt; +++ b/slirp<br>
&gt; @@ -1 +1 @@<br>
&gt; -Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece<br>
&gt; +Subproject commit 26ae658a83eeca16780cf5615c8247cbb151c3fa<br>
&gt; <br>
<br>
</blockquote></div></div>

--0000000000005b6dd705bc06a29f--

