Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EA7401DBF
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 17:48:08 +0200 (CEST)
Received: from localhost ([::1]:56454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNGqt-000286-6m
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 11:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mNGoJ-00008r-PT
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:45:28 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:33287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1mNGoE-0004zB-1Y
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 11:45:27 -0400
Received: by mail-yb1-xb32.google.com with SMTP id e133so14399100ybh.0
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 08:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JIG9yolu0IeYcyEQcfUCuyML8ZjDq91Nahmz2pn8+VY=;
 b=lcmLPXSccUSPdZHequuv/rOZxMC3TQ4pWmNaH5Mtur+OXJm862R0YqZDGLk4rUe9WL
 k/wAOkwNQOwNQ+fng5UnbO5R9UASXYxQqa86/MwvOuEhuh886DquxB2FcLYUwwZXPpnG
 P9mnS0UJCA0NvsVCdt/63sNCa3nkfODwhu4lAOz5HA0NKX8T9jI70OLzfH1uoReCJa56
 4vtZ3qgpMi3EbY7VIwVH05QoEvq96kNKRLJpo43OZUl5ceyZQTUk4WkzgDlvCG4hZlyk
 0L3eUnWQTRUL386IYihO7pA4Yp173IMVCi9ei8NgH9zn63l1vqVt1wZRyV6KATAMS37J
 2FgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JIG9yolu0IeYcyEQcfUCuyML8ZjDq91Nahmz2pn8+VY=;
 b=EfFwPjQETmOkkhMqcZPtXxxgU/o5ubCjLXPNBlU5xPt0FzFzdHs6PqEgjgfVvhfb1B
 JUv2VS67twNK2X7dB9wYAkKsqijUJbUUTTzH+4nWjDZMLqPr/C3G2XC+H1IbJBrvTAjc
 a2lopqyPF1bLJeFDoNX8CkHSf+IW10ASh7iaCwyqz4VFQoK9arj3NxQlxfN69IbLMIP+
 dZnx1nDBXTf+R4xJMKfiOL6vJbP+1oTZbrudzfYsmsg+AsbBoDW043lUl25ckBsRjNWa
 E+OG7IsPpp6PzmjEvXA8oO2ws12g0YOwI9sGkxPV/6pFVDzxIt50p64cwncoiovhW8SU
 k3oQ==
X-Gm-Message-State: AOAM530tfGrwbUNp4k3Uucb3CGxdTSBghelcL6BD8jB9QiS46QkGCF/G
 5on93ea0LUcaI34Hs4PRv2ZAu2n976zAadckDfoBtA==
X-Google-Smtp-Source: ABdhPJw0eABdYH17e7ZmO16tDeIj9j0cY5rsXqRLk48I3QwKydkr5rul0NOG8Gd3lfBBYxsTV1R3v9QbZj+B1ev3zIM=
X-Received: by 2002:a25:ef04:: with SMTP id g4mr16534306ybd.287.1630943120123; 
 Mon, 06 Sep 2021 08:45:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ28CFSFEatxgfvUE3gvnFBVX7GrqMwk0+t1foFfNzDu7bwv3A@mail.gmail.com>
 <YTDTc9NC9k7hJjpx@redhat.com> <20210902135509.GU26415@redhat.com>
 <CAJ28CFQgKDjSeF8vDCVefKtQkRPoZ5EbJz=n8CXZZtX1SnAzyQ@mail.gmail.com>
 <CAJ+F1CLJhN6hx7Z6KOYRqEkctf0-xQx4nyvsZMOazgZEbo3d6g@mail.gmail.com>
In-Reply-To: <CAJ+F1CLJhN6hx7Z6KOYRqEkctf0-xQx4nyvsZMOazgZEbo3d6g@mail.gmail.com>
From: Konstantin Kostiuk <konstantin@daynix.com>
Date: Mon, 6 Sep 2021 18:45:08 +0300
Message-ID: <CAJ28CFQKbmbPk-+X882zraNp+ToT+BKJC5hV-c+i1Fe2VzTWaA@mail.gmail.com>
Subject: Re: Guest Agent issue with 'guest-get-osinfo' command on Windows
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000005303ca05cb558943"
Received-SPF: none client-ip=2607:f8b0:4864:20::b32;
 envelope-from=konstantin@daynix.com; helo=mail-yb1-xb32.google.com
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
 Michael Roth <michael.roth@amd.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 Developers <qemu-devel@nongnu.org>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Tomas Golembiovsky <tgolembi@redhat.com>, Yan Vugenfirer <yan@daynix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005303ca05cb558943
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

I reviewed glib, libguestfs, and libosinfo tools. All tools read the
registry to get information about Windows but read different registry
values. All information is returned in a localized form.
Related key: HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion
We can get 'pretty-name' from 'ProductName' value (all tools use it).
About 'version' there is three variant:
1. Set 'version' equals to 'kernel-version'. libguestfs and libosinfo have
this behavior.
2. Read 'version' from 'ReleaseId' value. glib has this behavior. In the
case of Windows Server 2022, 'ReleaseId' equals 2009.
3. Read 'version' from 'DisplayVersion' value. In the case of Windows
Server 2022, 'DisplayVersion' equals 21H2.

What do you think about this solution instead of using a conversion matrix?
What version we should use in this case?

Best wishes,
Kostiantyn Kostiuk


On Thu, Sep 2, 2021 at 5:54 PM Marc-Andr=C3=A9 Lureau <marcandre.lureau@gma=
il.com>
wrote:

> Hi
>
> On Thu, Sep 2, 2021 at 6:16 PM Konstantin Kostiuk <konstantin@daynix.com>
> wrote:
>
>> I tried to use glib to get OS info. Glib provide 3 values with version
>> about Windows:
>> g_get_os_info(G_OS_INFO_KEY_PRETTY_NAME)
>> g_get_os_info(G_OS_INFO_KEY_VERSION)
>> g_get_os_info(G_OS_INFO_KEY_VERSION_ID)
>>
>> Output for Windows Server 2019:
>> PRETTY_NAME =3D Windows 10 Server 1809
>> VERSION =3D 10 Server 1809
>> VERSION_ID =3D 10_server_1809
>>
>> Output for Windows Server 2022:
>> PRETTY_NAME =3D Windows 10 Server 2009
>> VERSION =3D 10 Server 2009
>> VERSION_ID =3D 10_server_2009
>>
>> So, for now, we can't use glib directly.
>>
>
> Ah apparently there is a bug about it:
> https://gitlab.gnome.org/GNOME/glib/-/issues/2443
>
> (we should aim for reusing glib functions, imho)
>
>
>> On Thu, Sep 2, 2021 at 4:55 PM Richard W.M. Jones <rjones@redhat.com>
>> wrote:
>>
>>> On Thu, Sep 02, 2021 at 02:36:51PM +0100, Daniel P. Berrang=C3=A9 wrote=
:
>>> > On Thu, Sep 02, 2021 at 03:36:01PM +0300, Konstantin Kostiuk wrote:
>>> > > Hi Team,
>>> > >
>>> > > We have several bugs related to 'guest-get-osinfo' command in
>>> Windows Guest
>>> > > Agent:
>>> > > https://bugzilla.redhat.com/show_bug.cgi?id=3D1998919
>>> > > https://bugzilla.redhat.com/show_bug.cgi?id=3D1972070
>>> > >
>>> > > This command returns the following data:
>>> > > {
>>> > > "name": "Microsoft Windows",
>>> > > "kernel-release": "20344",
>>> > > "version": "N/A",
>>> > > "variant": "server",
>>> > > "pretty-name": "Windows Server 2022 Datacenter",
>>> > > "version-id": "N/A",
>>> > > "variant-id": "server",
>>> > > "kernel-version": "10.0",
>>> > > "machine": "x86_64",
>>> > > "id": "mswindows"
>>> > > }
>>> > >
>>> > > The problem is with "version" and "pretty-name". Windows Server
>>> > > 2016/2019/2022 and Windows 11 have the same MajorVersion
>>> ("kernel-version")
>>> >
>>> > Yes, this is a long standing issue with version mapping Windows
>>> > guests, to which no one has ever come up with a nice solution
>>> > that I know of.
>>> >
>>> > In libosinfo database, we just report the kernel version as the
>>> > OS version, and accept the fact that there's a clash in version
>>> > between various Windows products.
>>> >
>>> >
>>> https://gitlab.com/libosinfo/osinfo-db/-/blob/master/data/os/microsoft.=
com/win-2k19.xml.in
>>> >
>>> >
>>> https://gitlab.com/libosinfo/osinfo-db/-/blob/master/data/os/microsoft.=
com/win-10.xml.in
>>> >
>>> > Apps that need to distinguish simply have to look at the
>>> > product name, even if this causes localization pain.
>>> >
>>> > Similarly in libguestfs, the virt-inspector tool just reports
>>> > the kernel version, and product name from the registry:
>>> >
>>> > # virt-inspector -d win2k8r2
>>> > <?xml version=3D"1.0"?>
>>> > <operatingsystems>
>>> >   <operatingsystem>
>>> >     <root>/dev/sda2</root>
>>> >     <name>windows</name>
>>> >     <arch>x86_64</arch>
>>> >     <distro>windows</distro>
>>> >     <product_name>Windows Server 2008 R2 Standard</product_name>
>>> >     <product_variant>Server</product_variant>
>>> >     <major_version>6</major_version>
>>> >     <minor_version>1</minor_version>
>>> >
>>> >
>>> > # virt-inspector -d win10x64
>>> > <?xml version=3D"1.0"?>
>>> > <operatingsystems>
>>> >   <operatingsystem>
>>> >     <root>/dev/sda2</root>
>>> >     <name>windows</name>
>>> >     <arch>x86_64</arch>
>>> >     <distro>windows</distro>
>>> >     <product_name>Windows 10 Pro</product_name>
>>> >     <product_variant>Client</product_variant>
>>> >     <major_version>10</major_version>
>>> >     <minor_version>0</minor_version>
>>> >     <windows_systemroot>/Windows</windows_systemroot>
>>> >
>>>  <windows_current_control_set>ControlSet001</windows_current_control_se=
t>
>>> >     <hostname>DESKTOP-GR8HTR3</hostname>
>>> >     <osinfo>win10</osinfo>
>>>
>>> We actually try to turn it into a libosinfo compatible short string as
>>> you can see from Dan's second example above and this code:
>>>
>>>
>>> https://github.com/libguestfs/libguestfs/blob/master/lib/inspect-osinfo=
.c
>>>
>>> Which is I think what every tool should return.  libosinfo is the only
>>> project that attempts to classify a broad range of OSes and is
>>> constantly being updated.
>>>
>>> > > This solution has several problems: need to update the conversion
>>> matrix
>>> > > for each Windows build, one Windows name can have different build
>>> numbers.
>>> > > For example, Windows Server 2022 (preview) build number is 20344,
>>> Windows
>>> > > Server 2022 build number is 20348.
>>> > >
>>> > > There are two possible solutions:
>>> > > 1. Use build number range instead of one number. Known implementati=
on
>>> > > issue: Microsoft provides a table (
>>> > >
>>> https://docs.microsoft.com/en-Us/windows-server/get-started/windows-ser=
ver-release-info
>>> )
>>> > > only with stable build numbers. So, we exactly don't know the build
>>> number
>>> > > range.
>>> >
>>> > Yep, this looks troublesome when considering non-GA releases.
>>> >
>>> > > 2. We can read this string from the registry
>>> > > (HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion).
>>> Known
>>> > > implementation issues: ProductName value is localized (in a Russian
>>> version
>>> > > of Windows, the word "Microsoft' is translated), so we should ignor=
e
>>> it.
>>> > > ReleaseId value does not equal to Windows Server version (for Windo=
ws
>>> > > Server 2019, ReleaseId is 1809)
>>> >
>>> > This reg key is what libguestfs reports IIUC
>>> >
>>> >
>>> https://github.com/libguestfs/libguestfs/blob/master/daemon/inspect_fs_=
windows.ml#L227
>>> >
>>> > > In conclusion, I have the next questions:
>>> > > What solution we should implement to get the Windows release name?
>>> > > Does someone know how end-users use this information? Should it be
>>> English
>>> > > only or it can be localized? Should we have exactly the same output
>>> as now?
>>> > > What should we do with the 'Standard' server edition? Currently, th=
e
>>> guest
>>> > > agent always returns 'Datacenter'.
>>> >
>>> > This is equiv ot libguestfs' "product variant" data,w hich it gets
>>> > from InstallationType registry key
>>> >
>>> >
>>> https://github.com/libguestfs/libguestfs/blob/master/daemon/inspect_fs_=
windows.ml#L259
>>> >
>>> > Personally I think there's value in having consistent treatment of th=
is
>>> > info across qemu guest agent and libguestfs / libosinfo.
>>>
>>> Agree.
>>>
>>> Rich.
>>>
>>> --
>>> Richard Jones, Virtualization Group, Red Hat
>>> http://people.redhat.com/~rjones
>>> Read my programming and virtualization blog: http://rwmj.wordpress.com
>>> virt-builder quickly builds VMs from scratch
>>> http://libguestfs.org/virt-builder.1.html
>>>
>>>
>
> --
> Marc-Andr=C3=A9 Lureau
>

--0000000000005303ca05cb558943
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi All,</div><div><br></div><div>I reviewed glib, lib=
guestfs, and libosinfo tools. All tools read the registry to get informatio=
n about Windows but read different registry values. <span class=3D"gmail-VI=
iyi" lang=3D"en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span>All inform=
ation is returned in a localized form.</span></span></span> </div><div>Rela=
ted key: HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion</div><div>We can=
 get &#39;pretty-name&#39; from &#39;ProductName&#39; value (all tools use =
it).</div><div></div><div>About &#39;version&#39; there is three variant: <=
br></div><div>1. Set &#39;version&#39; equals to &#39;kernel-version&#39;. =
libguestfs and libosinfo have this behavior.</div><div>2. Read &#39;version=
&#39; from &#39;ReleaseId&#39; value. glib has this behavior. In the case o=
f Windows Server 2022, &#39;ReleaseId&#39; equals 2009.<br></div><div>3. Re=
ad &#39;version&#39; from &#39;DisplayVersion&#39; value. In the case of Wi=
ndows Server 2022, &#39;DisplayVersion&#39; equals 21H2.</div><div dir=3D"l=
tr"></div><div><br></div><div>What do you think about this solution instead=
 of using a=20
conversion matrix?</div><div>What version we should use in this case? <br><=
/div><div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmai=
l_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Best =
wishes,</div><div>Kostiantyn Kostiuk</div></div></div></div><br></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep=
 2, 2021 at 5:54 PM Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@gmail.com">marcandre.lureau@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"lt=
r">Hi<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Thu, Sep 2, 2021 at 6:16 PM Konstantin Kostiuk &lt;<a href=3D"m=
ailto:konstantin@daynix.com" target=3D"_blank">konstantin@daynix.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr">I tried to use glib to get OS info. Glib provide 3 values with ve=
rsion about Windows:<br>g_get_os_info(G_OS_INFO_KEY_PRETTY_NAME)<br>g_get_o=
s_info(G_OS_INFO_KEY_VERSION)<br><div>g_get_os_info(G_OS_INFO_KEY_VERSION_I=
D)</div><div><br></div><div>Output for Windows Server 2019:</div><div>PRETT=
Y_NAME =3D Windows 10 Server 1809</div><div>VERSION =3D 10 Server 1809</div=
><div>VERSION_ID =3D 10_server_1809</div><div><br></div><div><div>Output fo=
r Windows Server 2022:</div><div>PRETTY_NAME =3D Windows 10 Server 2009</di=
v><div>VERSION =3D 10 Server 2009</div><div>VERSION_ID =3D 10_server_2009</=
div></div><div><br></div><div>So, for now, we can&#39;t use glib directly.<=
br></div></div></blockquote><div><br></div><div>Ah apparently there is a bu=
g about it:</div><div><a href=3D"https://gitlab.gnome.org/GNOME/glib/-/issu=
es/2443" target=3D"_blank">https://gitlab.gnome.org/GNOME/glib/-/issues/244=
3</a></div><div><br></div><div>(we should aim for reusing glib functions, i=
mho)<br></div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr"><div></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 2, 2021 at 4:55 PM Richard W.M=
. Jones &lt;<a href=3D"mailto:rjones@redhat.com" target=3D"_blank">rjones@r=
edhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Thu, Sep 02, 2021 at 02:36:51PM +0100, Daniel P. Berrang=C3=
=A9 wrote:<br>
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>
</blockquote></div></div>

--0000000000005303ca05cb558943--

