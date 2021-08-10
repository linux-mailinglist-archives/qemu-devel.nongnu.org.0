Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C443E8465
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 22:32:42 +0200 (CEST)
Received: from localhost ([::1]:59390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDYQT-0007JP-Sd
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 16:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <admin@aabouzied.com>)
 id 1mDVas-0005i8-4V
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 13:31:14 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:42806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <admin@aabouzied.com>)
 id 1mDVap-00062D-Lq
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 13:31:13 -0400
Received: by mail-lf1-x132.google.com with SMTP id d4so14159509lfk.9
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 10:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aabouzied-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/nLCWXHxnTJS1loO9t7lyg5I1GLsehtAZCUXK0BzwwQ=;
 b=bmh4M8cxlpgICFEbboGNY1xIPQz+TsXCMl6QX0dD/IK9Xm8Pgr9JxKoEODCQVLSpUb
 9evkGwaBmkHdcyJ6oz897mzLbyWEpt1BoLnEoRG9EUXT4qD9C8dEpAIdWfFLv7167tVj
 DB3Tt+v8Hzl3Y9CWvsW0eWTFGmX3rCKqfrretAvluwE4hXsiPG97S49RuztNZrqonbrt
 ccRToXGjQyzYP9U8h+9Zi7rEnATlGRSsUsQGz7eRkioQRq9d/ohZ7MB89ITD1DGNhU0G
 8bb+cWivbgnPVfX+994DD9PfrgQGqxANt/qcCg0IX6c5yrIkLqu6P0jrfMlTepneZBe1
 pRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/nLCWXHxnTJS1loO9t7lyg5I1GLsehtAZCUXK0BzwwQ=;
 b=WlbBcATTjmpICAVdP5oGMUOMC1/NiQEBZim+KsZNeWjAyipsEofW6dIuMwmytlIL7L
 nE2LfT1D3rbcuY4J/C3e04OPSdqRYmMZF1waaQnhyxenN0Ibr8pLoIwCdCQEZY6DjNr0
 uaDvlakg7S7Uj2DpUKHrGMZyPgC2+y1bqfO7CTNXUMMOPbvpEbg5LjxBHS98isR3Mdm5
 p4Uvh/A6ZCUHAVw0RlOlWmPNxwaAaq5XS2IxckC//PePSW7XOPPL7hKlrR+Vlu791hva
 fMEeKJeUimvATjRQmbqG7MU40mAL67FgOCQupT71EylM85NbYjjbauhywKFDlMULMzyl
 iKvQ==
X-Gm-Message-State: AOAM531ByHwicr0521kYgjHQZkfjDK9p8KlfM3RFoP0PH+08ZoKk9iaV
 2UYuMFnnFMq7TF6wVH18RBfDnGXu37YeYzTaElgGIRkfjZxe4R+AibQ=
X-Google-Smtp-Source: ABdhPJw3Z7jl7NmIDq1XkIqtxoGRgfjM6wtNpdbrjnSlw6HvQiGTzm+P2LCoZDbEfJdMNUsBuyJKaAb5BvQeNblmzuk=
X-Received: by 2002:a05:6512:945:: with SMTP id
 u5mr10874247lft.298.1628616665314; 
 Tue, 10 Aug 2021 10:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210802222257.50946-1-email@aabouzied.com>
In-Reply-To: <20210802222257.50946-1-email@aabouzied.com>
From: Ahmed Abouzied <admin@aabouzied.com>
Date: Tue, 10 Aug 2021 19:30:54 +0200
Message-ID: <CAPm-u-to0fD_wZaScQQUencDqMYQZ0Ys5FtjJJ30b50vCtYSmw@mail.gmail.com>
Subject: Re: [PATCH] tests/acceptance: Allow overwrite smp and memory
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000cfcdf805c937dde8"
Received-SPF: none client-ip=2a00:1450:4864:20::132;
 envelope-from=admin@aabouzied.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 10 Aug 2021 16:31:31 -0400
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
Cc: philmd@redhat.com, wainersm@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000cfcdf805c937dde8
Content-Type: text/plain; charset="UTF-8"

ping

Just pinging about this little patch. Patchew link here:
https://patchew.org/QEMU/20210802222257.50946-1-email@aabouzied.com/.

Best regards,
Ahmed Abouzied

On Tue, Aug 3, 2021 at 12:24 AM Ahmed Abouzied <email@aabouzied.com> wrote:

> Removes the hard-coded values in setUp(). Class inheriting from
> avocado_qemu.LinuxTest can overwrite the default smp and memory instead.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/453
> Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py
> b/tests/acceptance/avocado_qemu/__init__.py
> index 2c4fef3e14..2639b89c84 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -441,6 +441,8 @@ class LinuxTest(Test, LinuxSSHMixIn):
>      distro = None
>      username = 'root'
>      password = 'password'
> +    smp = '2'
> +    memory = '1024'
>
>      def _set_distro(self):
>          distro_name = self.params.get(
> @@ -471,8 +473,8 @@ def _set_distro(self):
>      def setUp(self, ssh_pubkey=None, network_device_type='virtio-net'):
>          super(LinuxTest, self).setUp()
>          self._set_distro()
> -        self.vm.add_args('-smp', '2')
> -        self.vm.add_args('-m', '1024')
> +        self.vm.add_args('-smp', self.smp)
> +        self.vm.add_args('-m', self.memory)
>          # The following network device allows for SSH connections
>          self.vm.add_args('-netdev', 'user,id=vnet,hostfwd=:127.0.0.1:0
> -:22',
>                           '-device', '%s,netdev=vnet' %
> network_device_type)
> --
> 2.25.1
>
>

--000000000000cfcdf805c937dde8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>ping</div><div><br></div><div>Just pinging about this=
 little patch. Patchew link here: <a href=3D"https://patchew.org/QEMU/20210=
802222257.50946-1-email@aabouzied.com/">https://patchew.org/QEMU/2021080222=
2257.50946-1-email@aabouzied.com/</a>.</div><div><br></div><div>Best regard=
s,</div><div>Ahmed Abouzied<br></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 3, 2021 at 12:24 AM Ahmed =
Abouzied &lt;<a href=3D"mailto:email@aabouzied.com">email@aabouzied.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Remo=
ves the hard-coded values in setUp(). Class inheriting from<br>
avocado_qemu.LinuxTest can overwrite the default smp and memory instead.<br=
>
<br>
Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/453" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/is=
sues/453</a><br>
Signed-off-by: Ahmed Abouzied &lt;<a href=3D"mailto:email@aabouzied.com" ta=
rget=3D"_blank">email@aabouzied.com</a>&gt;<br>
---<br>
=C2=A0tests/acceptance/avocado_qemu/__init__.py | 6 ++++--<br>
=C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/a=
vocado_qemu/__init__.py<br>
index 2c4fef3e14..2639b89c84 100644<br>
--- a/tests/acceptance/avocado_qemu/__init__.py<br>
+++ b/tests/acceptance/avocado_qemu/__init__.py<br>
@@ -441,6 +441,8 @@ class LinuxTest(Test, LinuxSSHMixIn):<br>
=C2=A0 =C2=A0 =C2=A0distro =3D None<br>
=C2=A0 =C2=A0 =C2=A0username =3D &#39;root&#39;<br>
=C2=A0 =C2=A0 =C2=A0password =3D &#39;password&#39;<br>
+=C2=A0 =C2=A0 smp =3D &#39;2&#39;<br>
+=C2=A0 =C2=A0 memory =3D &#39;1024&#39;<br>
<br>
=C2=A0 =C2=A0 =C2=A0def _set_distro(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0distro_name =3D self.params.get(<br>
@@ -471,8 +473,8 @@ def _set_distro(self):<br>
=C2=A0 =C2=A0 =C2=A0def setUp(self, ssh_pubkey=3DNone, network_device_type=
=3D&#39;virtio-net&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0super(LinuxTest, self).setUp()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._set_distro()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-smp&#39;, &#39;2&#39;)<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-m&#39;, &#39;1024&#39;)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-smp&#39;, self.smp)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-m&#39;, self.memory)<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# The following network device allows for=
 SSH connections<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.vm.add_args(&#39;-netdev&#39;, &#39;=
user,id=3Dvnet,hostfwd=3D:127.0.0.1:0-:22&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;-device&#39;, &#39;%s,netdev=3Dvnet&#39; % network_d=
evice_type)<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--000000000000cfcdf805c937dde8--

