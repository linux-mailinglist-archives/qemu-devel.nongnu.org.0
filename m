Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D549A3FEF42
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 16:16:37 +0200 (CEST)
Received: from localhost ([::1]:38166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLnW8-0003Y1-Vz
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 10:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mLnSb-00065g-HZ
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 10:12:58 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:37597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mLnSX-000593-Ee
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 10:12:57 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id r4so4155718ybp.4
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 07:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a2NPpg1JYXhirpicU8FjlsHd40InWkTo2JgrICTWvpM=;
 b=H3KMY+uR/+bBVYrUXRHWTDZNl85DHoL5oBJT1ZnLMXWEtPAQaP9FhSKeF5bsAhsVS0
 LtNBq9Xob/5QchUev0Oc/GmM5LvE85xsVxw1xegaysOQ2pDE7tgazP4NvScIN+ELQQue
 JvjIibQqqXmRypY41xxFxVTKyX9K2shxFbbdZotHFqiM+7Gj4G5Ydj+e/gIuNtTYOOXd
 vt8xa0MTg+Y7KkhNTiWP8aVcPRFkZkQ20oBhbn23B4yBdVkKlnttdONQCQdIMa15B9wT
 UxizC/5yzrBcJPAWERO9Ct01OCWzItH2rL9sjjHLGqXRbL9xGoEGPjUQ1UYFFNS2lqUS
 dMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a2NPpg1JYXhirpicU8FjlsHd40InWkTo2JgrICTWvpM=;
 b=dSDHiNfZytNuukSsyrI31J7HDApGgGqnKEv1oYRNO3czdt/zvlHO148nujMqOKzDIq
 BtE+7E/ZU7lc8wL0I8or4260IWtU3atKLDhx0TMt5Cwb3X65sbPcr0nhKwORjmTYevRM
 t0Xwcu6xk2GhWztPa8HcCN0P7kv5FW6fvf1nyhnBPzxJmsKk8UTPJIx9HTHm/Q72TVD0
 2QQqwKRSjYeNF23NNF2pcAQbcqA21Q7+6qGNVq9B4yVsmC/2w/DwFn3RX0GScPmMh8aF
 2UoAowe1QU5E6QNeLOEYymsLPGF8sAZZSJ9Cmx5vXPO0z29TGLjG23sBWe9dEEuoMnnH
 4/TA==
X-Gm-Message-State: AOAM530qUwARt/Hl9tKxrmmEUvR0q6+nluNa/lHJnMS0MK6DigGvUI3R
 sY7z+Bgz/CfYXExjtXxyRzOiZdApQomlBnPrhhfx+A==
X-Google-Smtp-Source: ABdhPJw8UbnwWvmavhqglN01/GJOaBGlHmlfQ9xYU1QbLH9St9A1wEAzrzETMxt/zSq6Qje1Gsn52cj5o7TNn9kWTEo=
X-Received: by 2002:a25:31d7:: with SMTP id x206mr4783596ybx.297.1630591972405; 
 Thu, 02 Sep 2021 07:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ28CFSFEatxgfvUE3gvnFBVX7GrqMwk0+t1foFfNzDu7bwv3A@mail.gmail.com>
 <YTDTc9NC9k7hJjpx@redhat.com> <20210902135509.GU26415@redhat.com>
In-Reply-To: <20210902135509.GU26415@redhat.com>
From: Konstantin Kostiuk <konstantin@daynix.com>
Date: Thu, 2 Sep 2021 17:12:41 +0300
Message-ID: <CAJ28CFQgKDjSeF8vDCVefKtQkRPoZ5EbJz=n8CXZZtX1SnAzyQ@mail.gmail.com>
Subject: Re: Guest Agent issue with 'guest-get-osinfo' command on Windows
To: "Richard W.M. Jones" <rjones@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000004a01a505cb03c764"
Received-SPF: none client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=konstantin@daynix.com; helo=mail-yb1-xb2e.google.com
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Developers <qemu-devel@nongnu.org>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Tomas Golembiovsky <tgolembi@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004a01a505cb03c764
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I tried to use glib to get OS info. Glib provide 3 values with version
about Windows:
g_get_os_info(G_OS_INFO_KEY_PRETTY_NAME)
g_get_os_info(G_OS_INFO_KEY_VERSION)
g_get_os_info(G_OS_INFO_KEY_VERSION_ID)

Output for Windows Server 2019:
PRETTY_NAME =3D Windows 10 Server 1809
VERSION =3D 10 Server 1809
VERSION_ID =3D 10_server_1809

Output for Windows Server 2022:
PRETTY_NAME =3D Windows 10 Server 2009
VERSION =3D 10 Server 2009
VERSION_ID =3D 10_server_2009

So, for now, we can't use glib directly.

On Thu, Sep 2, 2021 at 4:55 PM Richard W.M. Jones <rjones@redhat.com> wrote=
:

> On Thu, Sep 02, 2021 at 02:36:51PM +0100, Daniel P. Berrang=C3=A9 wrote:
> > On Thu, Sep 02, 2021 at 03:36:01PM +0300, Konstantin Kostiuk wrote:
> > > Hi Team,
> > >
> > > We have several bugs related to 'guest-get-osinfo' command in Windows
> Guest
> > > Agent:
> > > https://bugzilla.redhat.com/show_bug.cgi?id=3D1998919
> > > https://bugzilla.redhat.com/show_bug.cgi?id=3D1972070
> > >
> > > This command returns the following data:
> > > {
> > > "name": "Microsoft Windows",
> > > "kernel-release": "20344",
> > > "version": "N/A",
> > > "variant": "server",
> > > "pretty-name": "Windows Server 2022 Datacenter",
> > > "version-id": "N/A",
> > > "variant-id": "server",
> > > "kernel-version": "10.0",
> > > "machine": "x86_64",
> > > "id": "mswindows"
> > > }
> > >
> > > The problem is with "version" and "pretty-name". Windows Server
> > > 2016/2019/2022 and Windows 11 have the same MajorVersion
> ("kernel-version")
> >
> > Yes, this is a long standing issue with version mapping Windows
> > guests, to which no one has ever come up with a nice solution
> > that I know of.
> >
> > In libosinfo database, we just report the kernel version as the
> > OS version, and accept the fact that there's a clash in version
> > between various Windows products.
> >
> >
> https://gitlab.com/libosinfo/osinfo-db/-/blob/master/data/os/microsoft.co=
m/win-2k19.xml.in
> >
> >
> https://gitlab.com/libosinfo/osinfo-db/-/blob/master/data/os/microsoft.co=
m/win-10.xml.in
> >
> > Apps that need to distinguish simply have to look at the
> > product name, even if this causes localization pain.
> >
> > Similarly in libguestfs, the virt-inspector tool just reports
> > the kernel version, and product name from the registry:
> >
> > # virt-inspector -d win2k8r2
> > <?xml version=3D"1.0"?>
> > <operatingsystems>
> >   <operatingsystem>
> >     <root>/dev/sda2</root>
> >     <name>windows</name>
> >     <arch>x86_64</arch>
> >     <distro>windows</distro>
> >     <product_name>Windows Server 2008 R2 Standard</product_name>
> >     <product_variant>Server</product_variant>
> >     <major_version>6</major_version>
> >     <minor_version>1</minor_version>
> >
> >
> > # virt-inspector -d win10x64
> > <?xml version=3D"1.0"?>
> > <operatingsystems>
> >   <operatingsystem>
> >     <root>/dev/sda2</root>
> >     <name>windows</name>
> >     <arch>x86_64</arch>
> >     <distro>windows</distro>
> >     <product_name>Windows 10 Pro</product_name>
> >     <product_variant>Client</product_variant>
> >     <major_version>10</major_version>
> >     <minor_version>0</minor_version>
> >     <windows_systemroot>/Windows</windows_systemroot>
> >
>  <windows_current_control_set>ControlSet001</windows_current_control_set>
> >     <hostname>DESKTOP-GR8HTR3</hostname>
> >     <osinfo>win10</osinfo>
>
> We actually try to turn it into a libosinfo compatible short string as
> you can see from Dan's second example above and this code:
>
>
> https://github.com/libguestfs/libguestfs/blob/master/lib/inspect-osinfo.c
>
> Which is I think what every tool should return.  libosinfo is the only
> project that attempts to classify a broad range of OSes and is
> constantly being updated.
>
> > > This solution has several problems: need to update the conversion
> matrix
> > > for each Windows build, one Windows name can have different build
> numbers.
> > > For example, Windows Server 2022 (preview) build number is 20344,
> Windows
> > > Server 2022 build number is 20348.
> > >
> > > There are two possible solutions:
> > > 1. Use build number range instead of one number. Known implementation
> > > issue: Microsoft provides a table (
> > >
> https://docs.microsoft.com/en-Us/windows-server/get-started/windows-serve=
r-release-info
> )
> > > only with stable build numbers. So, we exactly don't know the build
> number
> > > range.
> >
> > Yep, this looks troublesome when considering non-GA releases.
> >
> > > 2. We can read this string from the registry
> > > (HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion).
> Known
> > > implementation issues: ProductName value is localized (in a Russian
> version
> > > of Windows, the word "Microsoft' is translated), so we should ignore
> it.
> > > ReleaseId value does not equal to Windows Server version (for Windows
> > > Server 2019, ReleaseId is 1809)
> >
> > This reg key is what libguestfs reports IIUC
> >
> >
> https://github.com/libguestfs/libguestfs/blob/master/daemon/inspect_fs_wi=
ndows.ml#L227
> >
> > > In conclusion, I have the next questions:
> > > What solution we should implement to get the Windows release name?
> > > Does someone know how end-users use this information? Should it be
> English
> > > only or it can be localized? Should we have exactly the same output a=
s
> now?
> > > What should we do with the 'Standard' server edition? Currently, the
> guest
> > > agent always returns 'Datacenter'.
> >
> > This is equiv ot libguestfs' "product variant" data,w hich it gets
> > from InstallationType registry key
> >
> >
> https://github.com/libguestfs/libguestfs/blob/master/daemon/inspect_fs_wi=
ndows.ml#L259
> >
> > Personally I think there's value in having consistent treatment of this
> > info across qemu guest agent and libguestfs / libosinfo.
>
> Agree.
>
> Rich.
>
> --
> Richard Jones, Virtualization Group, Red Hat
> http://people.redhat.com/~rjones
> Read my programming and virtualization blog: http://rwmj.wordpress.com
> virt-builder quickly builds VMs from scratch
> http://libguestfs.org/virt-builder.1.html
>
>

--0000000000004a01a505cb03c764
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I tried to use glib to get OS info. Glib provide 3 values =
with version about Windows:<br>g_get_os_info(G_OS_INFO_KEY_PRETTY_NAME)<br>=
g_get_os_info(G_OS_INFO_KEY_VERSION)<br><div>g_get_os_info(G_OS_INFO_KEY_VE=
RSION_ID)</div><div><br></div><div>Output for Windows Server 2019:</div><di=
v>PRETTY_NAME =3D Windows 10 Server 1809</div><div>VERSION =3D 10 Server 18=
09</div><div>VERSION_ID =3D 10_server_1809</div><div><br></div><div><div>Ou=
tput for Windows Server 2022:</div><div>PRETTY_NAME =3D Windows 10 Server 2=
009</div><div>VERSION =3D 10 Server 2009</div><div>VERSION_ID =3D 10_server=
_2009</div></div><div><br></div><div>So, for now, we can&#39;t use glib dir=
ectly.<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Sep 2, 2021 at 4:55 PM Richard W.M. Jones &lt;<a hr=
ef=3D"mailto:rjones@redhat.com">rjones@redhat.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Sep 02, 2021 at 02=
:36:51PM +0100, Daniel P. Berrang=C3=A9 wrote:<br>
&gt; On Thu, Sep 02, 2021 at 03:36:01PM +0300, Konstantin Kostiuk wrote:<br=
>
&gt; &gt; Hi Team,<br>
&gt; &gt; <br>
&gt; &gt; We have several bugs related to &#39;guest-get-osinfo&#39; comman=
d in Windows Guest<br>
&gt; &gt; Agent:<br>
&gt; &gt; <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1998919"=
 rel=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.=
cgi?id=3D1998919</a><br>
&gt; &gt; <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1972070"=
 rel=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.=
cgi?id=3D1972070</a><br>
&gt; &gt; <br>
&gt; &gt; This command returns the following data:<br>
&gt; &gt; {<br>
&gt; &gt; &quot;name&quot;: &quot;Microsoft Windows&quot;,<br>
&gt; &gt; &quot;kernel-release&quot;: &quot;20344&quot;,<br>
&gt; &gt; &quot;version&quot;: &quot;N/A&quot;,<br>
&gt; &gt; &quot;variant&quot;: &quot;server&quot;,<br>
&gt; &gt; &quot;pretty-name&quot;: &quot;Windows Server 2022 Datacenter&quo=
t;,<br>
&gt; &gt; &quot;version-id&quot;: &quot;N/A&quot;,<br>
&gt; &gt; &quot;variant-id&quot;: &quot;server&quot;,<br>
&gt; &gt; &quot;kernel-version&quot;: &quot;10.0&quot;,<br>
&gt; &gt; &quot;machine&quot;: &quot;x86_64&quot;,<br>
&gt; &gt; &quot;id&quot;: &quot;mswindows&quot;<br>
&gt; &gt; }<br>
&gt; &gt; <br>
&gt; &gt; The problem is with &quot;version&quot; and &quot;pretty-name&quo=
t;. Windows Server<br>
&gt; &gt; 2016/2019/2022 and Windows 11 have the same MajorVersion (&quot;k=
ernel-version&quot;)<br>
&gt; <br>
&gt; Yes, this is a long standing issue with version mapping Windows<br>
&gt; guests, to which no one has ever come up with a nice solution<br>
&gt; that I know of.<br>
&gt; <br>
&gt; In libosinfo database, we just report the kernel version as the<br>
&gt; OS version, and accept the fact that there&#39;s a clash in version<br=
>
&gt; between various Windows products.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/libosinfo/osinfo-db/-/blob/m=
aster/data/os/microsoft.com/win-2k19.xml.in" rel=3D"noreferrer" target=3D"_=
blank">https://gitlab.com/libosinfo/osinfo-db/-/blob/master/data/os/microso=
ft.com/win-2k19.xml.in</a><br>
&gt; <br>
&gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/libosinfo/osinfo-db/-/blob/m=
aster/data/os/microsoft.com/win-10.xml.in" rel=3D"noreferrer" target=3D"_bl=
ank">https://gitlab.com/libosinfo/osinfo-db/-/blob/master/data/os/microsoft=
.com/win-10.xml.in</a><br>
&gt; <br>
&gt; Apps that need to distinguish simply have to look at the<br>
&gt; product name, even if this causes localization pain.<br>
&gt; <br>
&gt; Similarly in libguestfs, the virt-inspector tool just reports<br>
&gt; the kernel version, and product name from the registry:<br>
&gt; <br>
&gt; # virt-inspector -d win2k8r2<br>
&gt; &lt;?xml version=3D&quot;1.0&quot;?&gt;<br>
&gt; &lt;operatingsystems&gt;<br>
&gt;=C2=A0 =C2=A0&lt;operatingsystem&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;root&gt;/dev/sda2&lt;/root&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;name&gt;windows&lt;/name&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;arch&gt;x86_64&lt;/arch&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;distro&gt;windows&lt;/distro&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;product_name&gt;Windows Server 2008 R2 Standard=
&lt;/product_name&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;product_variant&gt;Server&lt;/product_variant&g=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;major_version&gt;6&lt;/major_version&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;minor_version&gt;1&lt;/minor_version&gt;<br>
&gt; <br>
&gt; <br>
&gt; # virt-inspector -d win10x64<br>
&gt; &lt;?xml version=3D&quot;1.0&quot;?&gt;<br>
&gt; &lt;operatingsystems&gt;<br>
&gt;=C2=A0 =C2=A0&lt;operatingsystem&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;root&gt;/dev/sda2&lt;/root&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;name&gt;windows&lt;/name&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;arch&gt;x86_64&lt;/arch&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;distro&gt;windows&lt;/distro&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;product_name&gt;Windows 10 Pro&lt;/product_name=
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;product_variant&gt;Client&lt;/product_variant&g=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;major_version&gt;10&lt;/major_version&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;minor_version&gt;0&lt;/minor_version&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;windows_systemroot&gt;/Windows&lt;/windows_syst=
emroot&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;windows_current_control_set&gt;ControlSet001&lt=
;/windows_current_control_set&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;hostname&gt;DESKTOP-GR8HTR3&lt;/hostname&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;osinfo&gt;win10&lt;/osinfo&gt;<br>
<br>
We actually try to turn it into a libosinfo compatible short string as<br>
you can see from Dan&#39;s second example above and this code:<br>
<br>
=C2=A0 <a href=3D"https://github.com/libguestfs/libguestfs/blob/master/lib/=
inspect-osinfo.c" rel=3D"noreferrer" target=3D"_blank">https://github.com/l=
ibguestfs/libguestfs/blob/master/lib/inspect-osinfo.c</a><br>
<br>
Which is I think what every tool should return.=C2=A0 libosinfo is the only=
<br>
project that attempts to classify a broad range of OSes and is<br>
constantly being updated.<br>
<br>
&gt; &gt; This solution has several problems: need to update the conversion=
 matrix<br>
&gt; &gt; for each Windows build, one Windows name can have different build=
 numbers.<br>
&gt; &gt; For example, Windows Server 2022 (preview) build number is 20344,=
 Windows<br>
&gt; &gt; Server 2022 build number is 20348.<br>
&gt; &gt; <br>
&gt; &gt; There are two possible solutions:<br>
&gt; &gt; 1. Use build number range instead of one number. Known implementa=
tion<br>
&gt; &gt; issue: Microsoft provides a table (<br>
&gt; &gt; <a href=3D"https://docs.microsoft.com/en-Us/windows-server/get-st=
arted/windows-server-release-info" rel=3D"noreferrer" target=3D"_blank">htt=
ps://docs.microsoft.com/en-Us/windows-server/get-started/windows-server-rel=
ease-info</a>)<br>
&gt; &gt; only with stable build numbers. So, we exactly don&#39;t know the=
 build number<br>
&gt; &gt; range.<br>
&gt; <br>
&gt; Yep, this looks troublesome when considering non-GA releases.<br>
&gt; <br>
&gt; &gt; 2. We can read this string from the registry<br>
&gt; &gt; (HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion)=
. Known<br>
&gt; &gt; implementation issues: ProductName value is localized (in a Russi=
an version<br>
&gt; &gt; of Windows, the word &quot;Microsoft&#39; is translated), so we s=
hould ignore it.<br>
&gt; &gt; ReleaseId value does not equal to Windows Server version (for Win=
dows<br>
&gt; &gt; Server 2019, ReleaseId is 1809)<br>
&gt; <br>
&gt; This reg key is what libguestfs reports IIUC<br>
&gt; <br>
&gt; <a href=3D"https://github.com/libguestfs/libguestfs/blob/master/daemon=
/inspect_fs_windows.ml#L227" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/libguestfs/libguestfs/blob/master/daemon/inspect_fs_windows.ml#L2=
27</a><br>
&gt; <br>
&gt; &gt; In conclusion, I have the next questions:<br>
&gt; &gt; What solution we should implement to get the Windows release name=
?<br>
&gt; &gt; Does someone know how end-users use this information? Should it b=
e English<br>
&gt; &gt; only or it can be localized? Should we have exactly the same outp=
ut as now?<br>
&gt; &gt; What should we do with the &#39;Standard&#39; server edition? Cur=
rently, the guest<br>
&gt; &gt; agent always returns &#39;Datacenter&#39;.<br>
&gt; <br>
&gt; This is equiv ot libguestfs&#39; &quot;product variant&quot; data,w hi=
ch it gets<br>
&gt; from InstallationType registry key<br>
&gt; <br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/libguestfs/libguestfs/blob/m=
aster/daemon/inspect_fs_windows.ml#L259" rel=3D"noreferrer" target=3D"_blan=
k">https://github.com/libguestfs/libguestfs/blob/master/daemon/inspect_fs_w=
indows.ml#L259</a><br>
&gt; <br>
&gt; Personally I think there&#39;s value in having consistent treatment of=
 this<br>
&gt; info across qemu guest agent and libguestfs / libosinfo.<br>
<br>
Agree.<br>
<br>
Rich.<br>
<br>
-- <br>
Richard Jones, Virtualization Group, Red Hat <a href=3D"http://people.redha=
t.com/~rjones" rel=3D"noreferrer" target=3D"_blank">http://people.redhat.co=
m/~rjones</a><br>
Read my programming and virtualization blog: <a href=3D"http://rwmj.wordpre=
ss.com" rel=3D"noreferrer" target=3D"_blank">http://rwmj.wordpress.com</a><=
br>
virt-builder quickly builds VMs from scratch<br>
<a href=3D"http://libguestfs.org/virt-builder.1.html" rel=3D"noreferrer" ta=
rget=3D"_blank">http://libguestfs.org/virt-builder.1.html</a><br>
<br>
</blockquote></div>

--0000000000004a01a505cb03c764--

