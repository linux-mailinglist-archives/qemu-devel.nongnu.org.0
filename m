Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 936CA4AF5B5
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 16:47:30 +0100 (CET)
Received: from localhost ([::1]:53848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHpBp-000367-5P
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 10:47:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gmaglion@redhat.com>)
 id 1nHkBl-00055s-T5
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:27:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gmaglion@redhat.com>)
 id 1nHkBi-0002Gp-8K
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:27:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644402421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dPt50u1uEEVtUJqbJvz2Gc+Sm5lsE8uT+iaaBFTFtsk=;
 b=gHPsOMWvPKmwRjnx2q4pxbayp3dYIHGj15qxfYYWW2N8y1KyD98WSaJEFG9DVXtoz+Y7L6
 pU7Wm3xXa0Hd0/7bsaG9NLvjDJO5vHtDRbmD8jBxCWtALuVQgMpORtLmv9atUItKFlXbWs
 SRjhmzFh60hKDFo3XYa/bQEWS0QfuQQ=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-yMm9VOIaOaCWGkHgQXPMJQ-1; Wed, 09 Feb 2022 05:25:06 -0500
X-MC-Unique: yMm9VOIaOaCWGkHgQXPMJQ-1
Received: by mail-ot1-f69.google.com with SMTP id
 k3-20020a9d4b83000000b005a1871e98cbso1129904otf.10
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 02:25:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dPt50u1uEEVtUJqbJvz2Gc+Sm5lsE8uT+iaaBFTFtsk=;
 b=8G0UAyS6kS5Z/bexbAAYCnpV4PxOrMfN6pTEHjvitByxM8C1YAU34oUCKcAplowV2u
 zh5aWivQhoyLo3GoeDZZS5/t0VujU9mfQEL6BG59YEy/ZqG5JF+JH+xa9+HL3fXMrfQr
 0jQ7oo2RUQS8S9LHFOnQynGk4hWtllhmx5UIW7hPxLbVW4dHIGlxXT/OvZ6BEbq3TV3C
 CvJgww9NGy837ZffK0LA1HUFW0qe+rEkuVe+tgMiSX+CVW+/wZO9dgrNnEY6b7RIv3fj
 oIy+rP6NDCsQApM95YjRnJjD+Ayy6B32hFDWbTyIUiqJ7gnr8ymOGj+JabnHv/hfKEgM
 UQXg==
X-Gm-Message-State: AOAM533x2/vfAthTQZgW5a6847tDItClJvxUVrA/dQWSE5F5N9lLzYqp
 fYI/0ztQYGAdmAgRcDRrz0uSxf8CsLEuAK/5lgdqqsrcoP+UXOpyxoZ8KQLN61dco1GVzXMTZTX
 jIMneQ0PBWqGfdJvB/F7xXwt0mgp3y6c=
X-Received: by 2002:a05:6870:a701:: with SMTP id
 g1mr678680oam.96.1644402306130; 
 Wed, 09 Feb 2022 02:25:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxI1jRAyBW2XAcu/GrR1Lbx3d1p6zAd9tb48VY2vJH7FnFi77Tn2s/2i9d8Fgb0LDXKma5whyFMCI7bN8OmB3c=
X-Received: by 2002:a05:6870:a701:: with SMTP id
 g1mr678676oam.96.1644402305917; 
 Wed, 09 Feb 2022 02:25:05 -0800 (PST)
MIME-Version: 1.0
References: <20220202193935.268777-1-vgoyal@redhat.com>
 <YgEZDOcFr80tZGWd@redhat.com>
 <YgGM6pA2sXEAMa3a@redhat.com> <YgIw+juiHLCXEhNn@redhat.com>
In-Reply-To: <YgIw+juiHLCXEhNn@redhat.com>
From: German Maglione <gmaglione@redhat.com>
Date: Wed, 9 Feb 2022 11:24:29 +0100
Message-ID: <CAJh=p+65FWDbze_86RqBKtd=at_Cj6E2YmUz=5pE29fd--zzwA@mail.gmail.com>
Subject: Re: [Virtio-fs] [PATCH v5 0/9] virtiofsd: Add support for file
 security context at file creation
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gmaglion@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000004ffcb505d7933fd3"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gmaglion@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 09 Feb 2022 10:18:04 -0500
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
Cc: virtio-fs-list <virtio-fs@redhat.com>, qemu-devel@nongnu.org,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004ffcb505d7933fd3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 8, 2022 at 11:44 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Mon, Feb 07, 2022 at 04:19:38PM -0500, Vivek Goyal wrote:
> > On Mon, Feb 07, 2022 at 01:05:16PM +0000, Daniel P. Berrang=C3=A9 wrote=
:
> > > On Wed, Feb 02, 2022 at 02:39:26PM -0500, Vivek Goyal wrote:
> > > > Hi,
> > > >
> > > > This is V5 of the patches. I posted V4 here.
> > > >
> > > >
> https://listman.redhat.com/archives/virtio-fs/2022-January/msg00041.html
> > > >
> > > > These will allow us to support SELinux with virtiofs. This will sen=
d
> > > > SELinux context at file creation to server and server can set it on
> > > > file.
> > >
> > > I've not entirely figured it out from the code, so easier for me
> > > to ask...
> > >
> > > How is the SELinux labelled stored on the host side ? It is stored
> > > directly in the security.* xattr namespace,
> >
> > [ CC Dan Walsh ]
> >
> > I just tried to test the mode where I don't do xattr remapping and try
> > to set /proc/pid/attr/fscreate with the context I want to set. It will
> > set security.selinux xattr on host.
> >
> > But write to /proc/pid/attr/fscreate fails if host does not recognize
> > the label sent by guest. I am running virtiofsd with unconfined_t but
> > it still fails because guest is trying to create a file with
> > "test_filesystem_filetranscon_t" and host does not recognize this
> > label. Seeing following in audit logs.
> >
> > type=3DSELINUX_ERR msg=3Daudit(1644268262.666:8111): op=3Dfscreate
> invalid_context=3D"unconfined_u:object_r:test_filesystem_filetranscon_t:s=
0"
>
> Yes, that's to be expected if the host policy doesn't know about the
> label that the guest is using.
>
> IOW, non-mapping case is only useful if you have a very good match
> between host + guest OS policy. This could be useful for an app
> like Kata because their guest is not a full OS, it is something
> special purpose and tightly controlled.
>
> > So if we don't remap xattrs and host has SELinux enabled, then it
> probably
> > work in very limited circumstances where host and guest policies don't
> > conflict. I guess its like running fedora 34 guest on fedora 34 host.
> > I suspect that this will see very limited use. Though I have put the
> > code in for the sake of completeness.
>
> For general purpose guest OS virtualization remapping is going to be
> effectuively mandatory.  The non-mapped case only usable when you tightly
> control the guest OS packages from the host.
>


If remap is recommended, why not make it mandatory or automatic?,
for instance, '-o security_label' either requires '-o xattrmap=3D' or
automatically makes
the mapping with the 'trusted' prefix, while  '-o security_label=3Dnomap'
doesn't, so you
can choose whatever you want.

(I'm not suggesting the 'nomap' name, I'm terrible choosing names)

--=20
German

--0000000000004ffcb505d7933fd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 8, 2022 at 11:44 PM Danie=
l P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com" target=3D"_bl=
ank">berrange@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Mon, Feb 07, 2022 at 04:19:38PM -0500, Vivek Goy=
al wrote:<br>
&gt; On Mon, Feb 07, 2022 at 01:05:16PM +0000, Daniel P. Berrang=C3=A9 wrot=
e:<br>
&gt; &gt; On Wed, Feb 02, 2022 at 02:39:26PM -0500, Vivek Goyal wrote:<br>
&gt; &gt; &gt; Hi,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; This is V5 of the patches. I posted V4 here.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <a href=3D"https://listman.redhat.com/archives/virtio-fs/202=
2-January/msg00041.html" rel=3D"noreferrer" target=3D"_blank">https://listm=
an.redhat.com/archives/virtio-fs/2022-January/msg00041.html</a><br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; These will allow us to support SELinux with virtiofs. This w=
ill send<br>
&gt; &gt; &gt; SELinux context at file creation to server and server can se=
t it on<br>
&gt; &gt; &gt; file.<br>
&gt; &gt; <br>
&gt; &gt; I&#39;ve not entirely figured it out from the code, so easier for=
 me<br>
&gt; &gt; to ask...<br>
&gt; &gt; <br>
&gt; &gt; How is the SELinux labelled stored on the host side ? It is store=
d<br>
&gt; &gt; directly in the security.* xattr namespace,<br>
&gt; <br>
&gt; [ CC Dan Walsh ]<br>
&gt; <br>
&gt; I just tried to test the mode where I don&#39;t do xattr remapping and=
 try<br>
&gt; to set /proc/pid/attr/fscreate with the context I want to set. It will=
<br>
&gt; set security.selinux xattr on host.<br>
&gt; <br>
&gt; But write to /proc/pid/attr/fscreate fails if host does not recognize<=
br>
&gt; the label sent by guest. I am running virtiofsd with unconfined_t but<=
br>
&gt; it still fails because guest is trying to create a file with<br>
&gt; &quot;test_filesystem_filetranscon_t&quot; and host does not recognize=
 this<br>
&gt; label. Seeing following in audit logs.<br>
&gt; <br>
&gt; type=3DSELINUX_ERR msg=3Daudit(1644268262.666:8111): op=3Dfscreate inv=
alid_context=3D&quot;unconfined_u:object_r:test_filesystem_filetranscon_t:s=
0&quot;<br>
<br>
Yes, that&#39;s to be expected if the host policy doesn&#39;t know about th=
e<br>
label that the guest is using.<br>
<br>
IOW, non-mapping case is only useful if you have a very good match<br>
between host + guest OS policy. This could be useful for an app<br>
like Kata because their guest is not a full OS, it is something<br>
special purpose and tightly controlled.<br>
<br>
&gt; So if we don&#39;t remap xattrs and host has SELinux enabled, then it =
probably<br>
&gt; work in very limited circumstances where host and guest policies don&#=
39;t<br>
&gt; conflict. I guess its like running fedora 34 guest on fedora 34 host. =
<br>
&gt; I suspect that this will see very limited use. Though I have put the<b=
r>
&gt; code in for the sake of completeness.<br>
<br>
For general purpose guest OS virtualization remapping is going to be<br>
effectuively mandatory.=C2=A0 The non-mapped case only usable when you tigh=
tly<br>
control the guest OS packages from the host.<br clear=3D"all"></blockquote>=
</div><div><br></div><div><br></div><div>If remap is recommended, why not m=
ake it mandatory or automatic?,</div><div>for instance, &#39;-o security_la=
bel&#39; either requires &#39;-o xattrmap=3D&#39; or automatically makes</d=
iv><div> the mapping with the &#39;trusted&#39; prefix, while=C2=A0 &#39;-o=
 security_label=3Dnomap&#39; doesn&#39;t, so you</div><div> can choose what=
ever you want.<br></div><div><br></div><div>(I&#39;m not suggesting the &#3=
9;nomap&#39; name, I&#39;m terrible choosing names)<br></div><div><br></div=
>-- <br><div dir=3D"ltr"><div dir=3D"ltr">German<br></div></div></div>

--0000000000004ffcb505d7933fd3--


