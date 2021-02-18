Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D0831F094
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 20:58:01 +0100 (CET)
Received: from localhost ([::1]:33484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCpR2-0004Zd-5v
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 14:58:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lCpOn-0003ES-1W
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 14:55:41 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:40817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lCpOk-0007YC-B4
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 14:55:40 -0500
Received: by mail-oi1-x22b.google.com with SMTP id 18so3322002oiz.7
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 11:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VS1Fzmr4JmJ364sFaBNaMOqu4smECu0GM4ZlmLgj/Vg=;
 b=TKBpZiQqPDoF08TgL7G6nVTt6d5NTDIWSTPEEJDo7q7g7+Fwm/SE8vf89kOuwbyl6O
 GxgKCBfn0IvLq1Wy72Ks3wKibDZRZwf78KXq9yAzezVRC8Vhd3+mm7MRmZLNompLDeK8
 fuegOEWoQWGTLeLfA1PK1Hs79NtRQuBMqt1i6if8gTtniXL3uYOUUDwRSL07NNljOnpp
 SFlM2uW0SSLWKJGYw0Z4XhejyI9AA/11nTd5W7hqDo08AdCQZyKkELlkYxxW9QdKiAak
 FuCIKWxrSmsf6LxY/ot9eYUJHkbdJxJ8rnYzHbNunZ4UkKXyAEDJex81nQJqLTFY6suG
 rvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VS1Fzmr4JmJ364sFaBNaMOqu4smECu0GM4ZlmLgj/Vg=;
 b=Ut6YsMoA53heL+dn/j2SH56Bu061xbPMLAc/AO4ZqNNQpRTzw/wn/rvbr+vnZvexRb
 qO5b3kGu0jgGMHlDfuNUvxtEbdVOEcnm6mKwhC832qzUpeUIOcnQs4PvQ3Tukcpy1mNG
 H4F/DLHY2NKZaE24wPjHq3MXu1f4VocXhetmzTjbwB4g/xCAJZD4QJRyux+sPYK2i5CK
 2rJ6qz5d9zXNcu4RqRWwri9tR1Hc+2A9M6NHOfpsux6fUBc8ty7zTDQk2nSKWEIMzEIx
 LiJtbKgwzTRTXGHoVgJxOxgJZzwW0hsqZxS3bj/Uflr8plxzNUKT5tWQgAm6OvdPFvir
 miPg==
X-Gm-Message-State: AOAM533diajmntl5oE7w2hOqdTPbSYhtOP3rqfTPX7N8yA4Lk0kYbPqA
 gdclzE8E7cpQaGH66BfVbVLn3ZBOLBDahBIS2Clg+Q==
X-Google-Smtp-Source: ABdhPJzFoXtvrfEEJV6m2ZL0Q2Zo7HHdQ6/Xp6hkHgcjbVZvI4hAefz07ImhMtA7LeQr9AcgYMuQmkwK5/yaGXy0PR8=
X-Received: by 2002:aca:b655:: with SMTP id g82mr4009684oif.91.1613678136548; 
 Thu, 18 Feb 2021 11:55:36 -0800 (PST)
MIME-Version: 1.0
References: <20210204202915.15925-1-yuri.benditovich@daynix.com>
 <20210209093201-mutt-send-email-mst@kernel.org>
 <20210209145105.GP1166421@redhat.com>
 <20210209095553-mutt-send-email-mst@kernel.org>
 <0890bb17-9677-ff1d-bd08-c9be791e1c81@redhat.com>
 <YC4056X5BJLPCECM@redhat.com>
In-Reply-To: <YC4056X5BJLPCECM@redhat.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Thu, 18 Feb 2021 21:55:25 +0200
Message-ID: <CAOEp5Od4hkJx1J4jLGk7=o2GBkEX=PCqFNcZNeGdSMQtSDJ08Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] virtio-net: graceful drop of vhost for TAP
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000001c6a2a05bba1b839"
Received-SPF: none client-ip=2607:f8b0:4864:20::22b;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-oi1-x22b.google.com
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
Cc: Yan Vugenfirer <yan@daynix.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001c6a2a05bba1b839
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 18, 2021 at 11:35 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om>
wrote:

> On Wed, Feb 10, 2021 at 02:19:59PM +0800, Jason Wang wrote:
> >
> > On 2021/2/9 =E4=B8=8B=E5=8D=8811:04, Michael S. Tsirkin wrote:
> > > On Tue, Feb 09, 2021 at 02:51:05PM +0000, Daniel P. Berrang=C3=A9 wro=
te:
> > > > On Tue, Feb 09, 2021 at 09:34:20AM -0500, Michael S. Tsirkin wrote:
> > > > > On Thu, Feb 04, 2021 at 10:29:12PM +0200, Yuri Benditovich wrote:
> > > > > > This set of patches introduces graceful switch from tap-vhost t=
o
> > > > > > tap-no-vhost depending on guest features. Before that the
> features
> > > > > > that vhost does not support were silently cleared in
> get_features.
> > > > > > This creates potential problem of migration from the machine
> where
> > > > > > some of virtio-net features are supported by the vhost kernel t=
o
> the
> > > > > > machine where they are not supported (packed ring as an example=
).
> > > > > I still worry that adding new features will silently disable vhos=
t
> for people.
> > > > > Can we limit the change to when a VM is migrated in?
> > > > Some management applications expect bi-directional live migration t=
o
> > > > work, so taking specific actions on incoming migration only feels
> > > > dangerous.
> > > Could you be more specific?
> > >
> > > Bi-directional migration is currently broken
> > > when migrating new kernel->old kernel.
> > >
> > > This seems to be the motivation for this patch, though I wish
> > > it was spelled out more explicitly.
> > >
> > > People don't complain much, but I'm fine with fixing that
> > > with a userspace fallback.
> > >
> > >
> > > I'd rather not force the fallback on others though: vhost is generall=
y
> > > specified explicitly by user while features are generally set
> > > automatically, so this patch will make us override what user specifie=
d,
> > > not nice.
> > >
> > >
> > > > IMHO if the features we're adding cannot be expected to exist in
> > > > host kernels in general, then the feature should defualt to off
> > > > and require explicit user config to enable.
> > > > Downstream distros which can guarantee newer kernels can flip the
> > > > default in their custom machine types if they desire.
> > > >
> > > > Regards,
> > > > Daniel
> > > Unfortunately that will basically mean we are stuck with no new
> features
> > > for years. We did what this patch is trying to change for years now, =
in
> > > particular KVM also seems to happily disable CPU features not support=
ed
> > > by kernel so I wonder why we can't keep doing it, with tweaks for som=
e
> > > corner cases.
> >
> >
> > It's probably not the corner case.
> >
> > So my understanding is when a feature is turned on via command line, it
> > should not be cleared silently otherwise we may break migration for sur=
e.
> >
> > E.g when packed=3Don is specified, we should disable vhost instead of
> clear it
> > from the device.
>
> If something is explicitly turned on by the user, they expect that featur=
e
> to be honoured, or an error to be raised.
>
> If something is not explicitly turned on by the user, the behaviour wrt t=
he
> default should be stable for any given machine type version.
>
> IOW, if you disable vhost by default when packed=3Don is set, then you ca=
n't
> later switch to letting vhost be enabled with packed=3Don, unless you tie
> that change to a new machine type.
>
> If the user has explicitly said  packed=3Don *and* vhost=3Don, then shoul=
d
> must honour that, or raise an error if the combination is unsupportable.
> Silently disabling vhost, then vhost=3Don is not ok.
>

If I'm not mistaken:
Inside qemu there is no possibility to determine whether the user
explicitly turned vhost on.
For qemu the vhost is off by default but libvirt creates a new profile with
vhost on.


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

--0000000000001c6a2a05bba1b839
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 18, 2021 at 11:35 AM Dani=
el P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Wed, Feb 10, 2021 at 02:19:59PM +0800, Jason Wang wrote:<br>
&gt; <br>
&gt; On 2021/2/9 =E4=B8=8B=E5=8D=8811:04, Michael S. Tsirkin wrote:<br>
&gt; &gt; On Tue, Feb 09, 2021 at 02:51:05PM +0000, Daniel P. Berrang=C3=A9=
 wrote:<br>
&gt; &gt; &gt; On Tue, Feb 09, 2021 at 09:34:20AM -0500, Michael S. Tsirkin=
 wrote:<br>
&gt; &gt; &gt; &gt; On Thu, Feb 04, 2021 at 10:29:12PM +0200, Yuri Benditov=
ich wrote:<br>
&gt; &gt; &gt; &gt; &gt; This set of patches introduces graceful switch fro=
m tap-vhost to<br>
&gt; &gt; &gt; &gt; &gt; tap-no-vhost depending on guest features. Before t=
hat the features<br>
&gt; &gt; &gt; &gt; &gt; that vhost does not support were silently cleared =
in get_features.<br>
&gt; &gt; &gt; &gt; &gt; This creates potential problem of migration from t=
he machine where<br>
&gt; &gt; &gt; &gt; &gt; some of virtio-net features are supported by the v=
host kernel to the<br>
&gt; &gt; &gt; &gt; &gt; machine where they are not supported (packed ring =
as an example).<br>
&gt; &gt; &gt; &gt; I still worry that adding new features will silently di=
sable vhost for people.<br>
&gt; &gt; &gt; &gt; Can we limit the change to when a VM is migrated in?<br=
>
&gt; &gt; &gt; Some management applications expect bi-directional live migr=
ation to<br>
&gt; &gt; &gt; work, so taking specific actions on incoming migration only =
feels<br>
&gt; &gt; &gt; dangerous.<br>
&gt; &gt; Could you be more specific?<br>
&gt; &gt; <br>
&gt; &gt; Bi-directional migration is currently broken<br>
&gt; &gt; when migrating new kernel-&gt;old kernel.<br>
&gt; &gt; <br>
&gt; &gt; This seems to be the motivation for this patch, though I wish<br>
&gt; &gt; it was spelled out more explicitly.<br>
&gt; &gt; <br>
&gt; &gt; People don&#39;t complain much, but I&#39;m fine with fixing that=
<br>
&gt; &gt; with a userspace fallback.<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; I&#39;d rather not force the fallback on others though: vhost is =
generally<br>
&gt; &gt; specified explicitly by user while features are generally set<br>
&gt; &gt; automatically, so this patch will make us override what user spec=
ified,<br>
&gt; &gt; not nice.<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; &gt; IMHO if the features we&#39;re adding cannot be expected to =
exist in<br>
&gt; &gt; &gt; host kernels in general, then the feature should defualt to =
off<br>
&gt; &gt; &gt; and require explicit user config to enable.<br>
&gt; &gt; &gt; Downstream distros which can guarantee newer kernels can fli=
p the<br>
&gt; &gt; &gt; default in their custom machine types if they desire.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Regards,<br>
&gt; &gt; &gt; Daniel<br>
&gt; &gt; Unfortunately that will basically mean we are stuck with no new f=
eatures<br>
&gt; &gt; for years. We did what this patch is trying to change for years n=
ow, in<br>
&gt; &gt; particular KVM also seems to happily disable CPU features not sup=
ported<br>
&gt; &gt; by kernel so I wonder why we can&#39;t keep doing it, with tweaks=
 for some<br>
&gt; &gt; corner cases.<br>
&gt; <br>
&gt; <br>
&gt; It&#39;s probably not the corner case.<br>
&gt; <br>
&gt; So my understanding is when a feature is turned on via command line, i=
t<br>
&gt; should not be cleared silently otherwise we may break migration for su=
re.<br>
&gt; <br>
&gt; E.g when packed=3Don is specified, we should disable vhost instead of =
clear it<br>
&gt; from the device.<br>
<br>
If something is explicitly turned on by the user, they expect that feature<=
br>
to be honoured, or an error to be raised.<br>
<br>
If something is not explicitly turned on by the user, the behaviour wrt the=
<br>
default should be stable for any given machine type version.<br>
<br>
IOW, if you disable vhost by default when packed=3Don is set, then you can&=
#39;t<br>
later switch to letting vhost be enabled with packed=3Don, unless you tie<b=
r>
that change to a new machine type.<br>
<br>
If the user has explicitly said=C2=A0 packed=3Don *and* vhost=3Don, then sh=
ould<br>
must honour that, or raise an error if the combination is unsupportable.<br=
>
Silently disabling vhost, then vhost=3Don is not ok.<br></blockquote><div><=
br></div><div>If I&#39;m not mistaken:</div><div>Inside qemu there is no po=
ssibility to determine whether the user explicitly turned vhost on.</div><d=
iv>For qemu the vhost is off by default but libvirt creates a new profile w=
ith vhost on.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
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
<br>
</blockquote></div></div>

--0000000000001c6a2a05bba1b839--

