Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C9B3AD353
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 22:04:42 +0200 (CEST)
Received: from localhost ([::1]:52986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKjJ-0008BB-3b
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 16:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1luKhz-0007Mb-Oz
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 16:03:19 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:43882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1luKhw-000521-4l
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 16:03:19 -0400
Received: by mail-oi1-x232.google.com with SMTP id x196so11780452oif.10
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 13:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0XaXqYva/wHy/UtEltmeogV56guSl7cA7YcnQ/9TzXY=;
 b=g7o8yBL1N2S3tsyur9iUWHeYnww8Yv3yto5IlVH0cr4AvZ5/r66kuius6b4SEkue7m
 YzLXPWu2AZfio152yZLd4w1aPFSSxzrVQcEj4jm8yADdJ2u5t8lgnA71zfxYB9JBKyPY
 MKHcgmXBF4etasLXLJyiMIGDN6zATCqmw8DdWaNQCs50Q6N4gbQlDOUi8Angq+hXAAp2
 P1Eb6/lWvi+rZQSjxO/i+0qpZlKI/VY62U0WOgegL42lnXq00737aDov6HEPMhvn6S7f
 Zw/HKtfObvGXk5JSKCUeTeW/+AeMr3GKSV/Al7piL8aX/0M2HIl8IfXoez1GGKsOIt7U
 ZaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0XaXqYva/wHy/UtEltmeogV56guSl7cA7YcnQ/9TzXY=;
 b=DuRDvSoIGNEH4lHVOXShmYB+f/eR5wnILaVXRL0z6uqiHwI/tbkUaZAq88ttJNzkYt
 lpida3ZiRKG8JPOOlVKJqhfOjdsd0bS/+C7tDwmx4vwM/5o2XzsGNJBchensSNNMCmcY
 4EE3VPbQHizFUAhU0zuVPpNDvtS0Pu4JSbQGMMkpUeRos+d1m8TPdLifg6vNIPS3CM6R
 jQWOifgJ15O84TqmM2WiRMRj/2X1ytCHX+jVaSO1KRp0UoCfVRLSDze/YxPhZRf6PYS+
 RhUTfma/FSqscvz76voCsoADNDIBYWv5feyJs7u+oSmoibKGCbxZug62vSP7lXAzEnTl
 LSbQ==
X-Gm-Message-State: AOAM530qJYKKX11k2qwMCQNxN6qU46KH/XYl+ULndVayd3mvRXKYupFC
 2nVKfGkF0EulhgpauZoJZj2QwORut1Jdv7h8Qcl9ZA==
X-Google-Smtp-Source: ABdhPJzmXaZjJOH5a8buOe4/1seiRzErJ1wRG2vuX3a7Ul82yRQgL0BmmrLbn8YIqipX1W5GJH/uc2dPHOOhNfoIP6U=
X-Received: by 2002:aca:2215:: with SMTP id b21mr8511490oic.94.1624046593705; 
 Fri, 18 Jun 2021 13:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210609100457.142570-1-andrew@daynix.com>
 <f81de211-57f9-9319-9735-c6b964bbdc77@redhat.com>
 <CAOEp5OejzxEx6UAWK2iU28QKOAt8OqcFOUga+q4VHtjLU8GvWw@mail.gmail.com>
 <3da88930-439c-1892-29b4-4977ddbb0b0a@redhat.com>
 <CABcq3pE7Rx4r_H7qtpXAwqyiWzXCT_u1zp4X1Hc-pgMrW=9haA@mail.gmail.com>
 <d51a7c1f-0df8-342e-219d-c9b3b36a1371@redhat.com>
 <CABcq3pEec6f+ohA6SCn7iFAbromrvWgyS8Tjz6+iHZ-fa2OQxw@mail.gmail.com>
In-Reply-To: <CABcq3pEec6f+ohA6SCn7iFAbromrvWgyS8Tjz6+iHZ-fa2OQxw@mail.gmail.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Fri, 18 Jun 2021 23:03:02 +0300
Message-ID: <CABcq3pEXZGoRPGQPB1b1Tb_rDEg5aMFCB+CELAyOjDCyTS1FTQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] ebpf: Added ebpf helper for libvirtd.
To: Jason Wang <jasowang@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000511adb05c50fd05c"
Received-SPF: none client-ip=2607:f8b0:4864:20::232;
 envelope-from=andrew@daynix.com; helo=mail-oi1-x232.google.com
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Yan Vugenfirer <yan@daynix.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000511adb05c50fd05c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jason,
I've checked "kernel.unprivileged_bpf_disabled=3D0" on Fedora,  Ubuntu, and
Debian - no need permissions to update BPF maps.

On Wed, Jun 16, 2021 at 1:18 AM Andrew Melnichenko <andrew@daynix.com>
wrote:

> Hi,
>
>> I may miss something.
>>
>> But RSS requires to update the map. This won't work if you don't grant
>> any permission to qemu.
>>
>> Thanks
>>
>
> Partly - with "kernel.unprivileged_bpf_disabled=3D0" capabilities is not
> required to update maps.
> With "kernel.unprivileged_bpf_disabled=3D1" - setting maps will fail(with=
out
> CAP_BPF) and "in-qemu" RSS will be used.
>
> On Tue, Jun 15, 2021 at 12:13 PM Jason Wang <jasowang@redhat.com> wrote:
>
>>
>> =E5=9C=A8 2021/6/12 =E4=B8=8A=E5=8D=8812:49, Andrew Melnichenko =E5=86=
=99=E9=81=93:
>> > Hi,
>> >
>> >     So I think the series is for unprivileged_bpf disabled. If I'm not
>> >     wrong, I guess the policy is to grant CAP_BPF but do fine grain
>> >     checks
>> >     via LSM.
>> >
>> >
>> > The main idea is to run eBPF RSS with qemu without any permission.
>> > Libvirt should handle everything and pass proper eBPF file descriptors=
.
>> > For current eBPF RSS, CAP_SYS_ADMIN(bypass some limitations)
>> > also required, and in the future may be other permissions.
>>
>>
>> I may miss something.
>>
>> But RSS requires to update the map. This won't work if you don't grant
>> any permission to qemu.
>>
>> Thanks
>>
>>
>> >
>> >     I'm not sure this is the best. We have several examples that let
>> >     libvirt
>> >     to involve. Examples:
>> >
>> >     1) create TAP device (and the TUN_SETIFF)
>> >
>> >     2) open vhost devices
>> >
>> >
>> > Technically TAP/vhost not related to a particular qemu emulator. So
>> common
>> > TAP creation should fit any modern qemu. eBPF fds(program and maps)
>> should
>> > suit the interface for current qemu, g.e. some qemu builds may have
>> > different map
>> > structures or their count. It's necessary that the qemu got fds
>> > prepared by the helper
>> > that was built with the qemu.
>> >
>> >     I think we need an example on the detail steps for how libvirt is
>> >     expected to use this.
>> >
>> >
>> > The simplified workflow looks like this:
>> >
>> >  1. Libvirt got "emulator" from domain document.
>> >  2. Libvirt queries for qemu capabilities.
>> >  3. One of the capabilities is "qemu-ebpf-rss-helper" path(if present)=
.
>> >  4. On NIC preparation Libvirt checks for virtio-net + rss
>> configurations.
>> >  5. If required, the "qemu-ebpf-rss-helper" called and fds are
>> >     received through unix fd.
>> >  6. Those fds are for eBPF RSS, which passed to child process - qemu.
>> >  7. Qemu launched with virtio-net-pci property "rss" and "ebpf_rss_fds=
".
>> >
>> >
>> > On Fri, Jun 11, 2021 at 8:36 AM Jason Wang <jasowang@redhat.com
>> > <mailto:jasowang@redhat.com>> wrote:
>> >
>> >
>> >     =E5=9C=A8 2021/6/10 =E4=B8=8B=E5=8D=882:55, Yuri Benditovich =E5=
=86=99=E9=81=93:
>> >     > On Thu, Jun 10, 2021 at 9:41 AM Jason Wang<jasowang@redhat.com
>> >     <mailto:jasowang@redhat.com>>  wrote:
>> >     >> =E5=9C=A8 2021/6/9 =E4=B8=8B=E5=8D=886:04, Andrew Melnychenko =
=E5=86=99=E9=81=93:
>> >     >>> Libvirt usually launches qemu with strict permissions.
>> >     >>> To enable eBPF RSS steering, qemu-ebpf-rss-helper was added.
>> >     >> A silly question:
>> >     >>
>> >     >> Kernel had the following permission checks in bpf syscall:
>> >     >>
>> >     >>          if (sysctl_unprivileged_bpf_disabled && !bpf_capable()=
)
>> >     >>                   return -EPERM;
>> >     >> ...
>> >     >>
>> >     >>           err =3D security_bpf(cmd, &attr, size);
>> >     >>           if (err < 0)
>> >     >>                   return err;
>> >     >>
>> >     >> So if I understand the code correctly, bpf syscall can only be
>> >     done if:
>> >     >>
>> >     >> 1) unprivileged_bpf is enabled or
>> >     >> 2) has the capability  and pass the LSM checks
>> >     >>
>> >     >> So I think the series is for unprivileged_bpf disabled. If I'm
>> not
>> >     >> wrong, I guess the policy is to grant CAP_BPF but do fine grain
>> >     checks
>> >     >> via LSM.
>> >     >>
>> >     >> If this is correct, need to describe it in the commit log.
>> >     >>
>> >     >>
>> >     >>> Added property "ebpf_rss_fds" for "virtio-net" that allows to
>> >     >>> initialize eBPF RSS context with passed program & maps fds.
>> >     >>>
>> >     >>> Added qemu-ebpf-rss-helper - simple helper that loads eBPF
>> >     >>> context and passes fds through unix socket.
>> >     >>> Libvirt should call the helper and pass fds to qemu through
>> >     >>> "ebpf_rss_fds" property.
>> >     >>>
>> >     >>> Added explicit target OS check for libbpf dependency in meson.
>> >     >>> eBPF RSS works only with Linux TAP, so there is no reason to
>> >     >>> build eBPF loader/helper for non-Linux.
>> >     >>>
>> >     >>> Overall, libvirt process should not be aware of the "interface=
"
>> >     >>> of eBPF RSS, it will not be aware of eBPF maps/program "type"
>> and
>> >     >>> their quantity.
>> >     >> I'm not sure this is the best. We have several examples that
>> >     let libvirt
>> >     >> to involve. Examples:
>> >     >>
>> >     >> 1) create TAP device (and the TUN_SETIFF)
>> >     >>
>> >     >> 2) open vhost devices
>> >     >>
>> >     >>
>> >     >>>    That's why qemu and the helper should be from
>> >     >>> the same build and be "synchronized". Technically each qemu ma=
y
>> >     >>> have its own helper. That's why "query-helper-paths" qmp comma=
nd
>> >     >>> was added. Qemu should return the path to the helper that suit=
s
>> >     >>> and libvirt should use "that" helper for "that" emulator.
>> >     >>>
>> >     >>> qmp sample:
>> >     >>> C: { "execute": "query-helper-paths" }
>> >     >>> S: { "return": [
>> >     >>>        {
>> >     >>>          "name": "qemu-ebpf-rss-helper",
>> >     >>>          "path": "/usr/local/libexec/qemu-ebpf-rss-helper"
>> >     >>>        }
>> >     >>>       ]
>> >     >>>      }
>> >     >> I think we need an example on the detail steps for how libvirt =
is
>> >     >> expected to use this.
>> >     > The preliminary patches for libvirt are at
>> >     > https://github.com/daynix/libvirt/tree/RSSv1
>> >     <https://github.com/daynix/libvirt/tree/RSSv1>
>> >
>> >
>> >     Will have a look but it would be better if the assumption of the
>> >     management is detailed here to ease the reviewers.
>> >
>> >     Thanks
>> >
>> >
>> >     >
>> >
>>
>>

--000000000000511adb05c50fd05c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Jason,</div><div> I&#39;ve checked &quot;kernel.un=
privileged_bpf_disabled=3D0&quot; on Fedora,=C2=A0 Ubuntu, and Debian - no =
need permissions to update BPF maps.</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 16, 2021 at 1:18 AM A=
ndrew Melnichenko &lt;<a href=3D"mailto:andrew@daynix.com" target=3D"_blank=
">andrew@daynix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div>Hi, <br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">I may miss something.<br>
<br>
But RSS requires to update the map. This won&#39;t work if you don&#39;t gr=
ant <br>
any permission to qemu.<br>
<br>
Thanks<span><br></span></blockquote><div><br></div><div>Partly - with &quot=
;kernel.unprivileged_bpf_disabled=3D0&quot; capabilities is not required to=
 update maps.</div><div>With &quot;kernel.unprivileged_bpf_disabled=3D1&quo=
t; - setting maps will fail(without CAP_BPF) and &quot;in-qemu&quot; RSS wi=
ll be used.<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Jun 15, 2021 at 12:13 PM Jason Wang &lt;<a hre=
f=3D"mailto:jasowang@redhat.com" target=3D"_blank">jasowang@redhat.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
=E5=9C=A8 2021/6/12 =E4=B8=8A=E5=8D=8812:49, Andrew Melnichenko =E5=86=99=
=E9=81=93:<br>
&gt; Hi,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0So I think the series is for unprivileged_bpf disab=
led. If I&#39;m not<br>
&gt;=C2=A0 =C2=A0 =C2=A0wrong, I guess the policy is to grant CAP_BPF but d=
o fine grain<br>
&gt;=C2=A0 =C2=A0 =C2=A0checks<br>
&gt;=C2=A0 =C2=A0 =C2=A0via LSM.<br>
&gt;<br>
&gt;<br>
&gt; The main idea is to run eBPF RSS with qemu without any permission.<br>
&gt; Libvirt should handle everything and pass proper eBPF file descriptors=
.<br>
&gt; For current eBPF RSS, CAP_SYS_ADMIN(bypass some limitations)<br>
&gt; also required, and in the future may be other permissions.<br>
<br>
<br>
I may miss something.<br>
<br>
But RSS requires to update the map. This won&#39;t work if you don&#39;t gr=
ant <br>
any permission to qemu.<br>
<br>
Thanks<br>
<br>
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I&#39;m not sure this is the best. We have several =
examples that let<br>
&gt;=C2=A0 =C2=A0 =C2=A0libvirt<br>
&gt;=C2=A0 =C2=A0 =C2=A0to involve. Examples:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A01) create TAP device (and the TUN_SETIFF)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A02) open vhost devices<br>
&gt;<br>
&gt;<br>
&gt; Technically TAP/vhost not related to a particular qemu emulator. So co=
mmon<br>
&gt; TAP creation should fit any modern qemu. eBPF fds(program and maps) sh=
ould<br>
&gt; suit the interface for current qemu, g.e. some qemu builds may have <b=
r>
&gt; different map<br>
&gt; structures or their count. It&#39;s necessary that the qemu got fds <b=
r>
&gt; prepared by the helper<br>
&gt; that was built with the qemu.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I think we need an example on the detail steps for =
how libvirt is<br>
&gt;=C2=A0 =C2=A0 =C2=A0expected to use this.<br>
&gt;<br>
&gt;<br>
&gt; The simplified workflow looks like this:<br>
&gt;<br>
&gt;=C2=A0 1. Libvirt got &quot;emulator&quot; from domain document.<br>
&gt;=C2=A0 2. Libvirt queries for qemu capabilities.<br>
&gt;=C2=A0 3. One of the capabilities is &quot;qemu-ebpf-rss-helper&quot; p=
ath(if present).<br>
&gt;=C2=A0 4. On NIC preparation Libvirt checks for virtio-net + rss config=
urations.<br>
&gt;=C2=A0 5. If required, the &quot;qemu-ebpf-rss-helper&quot; called and =
fds are<br>
&gt;=C2=A0 =C2=A0 =C2=A0received through unix fd.<br>
&gt;=C2=A0 6. Those fds are for eBPF RSS, which passed to child process - q=
emu.<br>
&gt;=C2=A0 7. Qemu launched with virtio-net-pci property &quot;rss&quot; an=
d &quot;ebpf_rss_fds&quot;.<br>
&gt;<br>
&gt;<br>
&gt; On Fri, Jun 11, 2021 at 8:36 AM Jason Wang &lt;<a href=3D"mailto:jasow=
ang@redhat.com" target=3D"_blank">jasowang@redhat.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:jasowang@redhat.com" target=3D"_blank">ja=
sowang@redhat.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=E5=9C=A8 2021/6/10 =E4=B8=8B=E5=8D=882:55, Yuri Be=
nditovich =E5=86=99=E9=81=93:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Thu, Jun 10, 2021 at 9:41 AM Jason Wang&lt;=
<a href=3D"mailto:jasowang@redhat.com" target=3D"_blank">jasowang@redhat.co=
m</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jasowang@redhat.com" t=
arget=3D"_blank">jasowang@redhat.com</a>&gt;&gt;=C2=A0 wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; =E5=9C=A8 2021/6/9 =E4=B8=8B=E5=8D=886:04,=
 Andrew Melnychenko =E5=86=99=E9=81=93:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; Libvirt usually launches qemu with str=
ict permissions.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; To enable eBPF RSS steering, qemu-ebpf=
-rss-helper was added.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; A silly question:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; Kernel had the following permission checks=
 in bpf syscall:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sysc=
tl_unprivileged_bpf_disabled &amp;&amp; !bpf_capable())<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0return -EPERM;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; ...<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0er=
r =3D security_bpf(cmd, &amp;attr, size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if=
 (err &lt; 0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0return err;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; So if I understand the code correctly, bpf=
 syscall can only be<br>
&gt;=C2=A0 =C2=A0 =C2=A0done if:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; 1) unprivileged_bpf is enabled or<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; 2) has the capability=C2=A0 and pass the L=
SM checks<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; So I think the series is for unprivileged_=
bpf disabled. If I&#39;m not<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; wrong, I guess the policy is to grant CAP_=
BPF but do fine grain<br>
&gt;=C2=A0 =C2=A0 =C2=A0checks<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; via LSM.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; If this is correct, need to describe it in=
 the commit log.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; Added property &quot;ebpf_rss_fds&quot=
; for &quot;virtio-net&quot; that allows to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; initialize eBPF RSS context with passe=
d program &amp; maps fds.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; Added qemu-ebpf-rss-helper - simple he=
lper that loads eBPF<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; context and passes fds through unix so=
cket.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; Libvirt should call the helper and pas=
s fds to qemu through<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; &quot;ebpf_rss_fds&quot; property.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; Added explicit target OS check for lib=
bpf dependency in meson.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; eBPF RSS works only with Linux TAP, so=
 there is no reason to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; build eBPF loader/helper for non-Linux=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; Overall, libvirt process should not be=
 aware of the &quot;interface&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; of eBPF RSS, it will not be aware of e=
BPF maps/program &quot;type&quot; and<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; their quantity.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; I&#39;m not sure this is the best. We have=
 several examples that<br>
&gt;=C2=A0 =C2=A0 =C2=A0let libvirt<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; to involve. Examples:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; 1) create TAP device (and the TUN_SETIFF)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; 2) open vhost devices<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;=C2=A0 =C2=A0 That&#39;s why qemu and t=
he helper should be from<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; the same build and be &quot;synchroniz=
ed&quot;. Technically each qemu may<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; have its own helper. That&#39;s why &q=
uot;query-helper-paths&quot; qmp command<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; was added. Qemu should return the path=
 to the helper that suits<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; and libvirt should use &quot;that&quot=
; helper for &quot;that&quot; emulator.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; qmp sample:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; C: { &quot;execute&quot;: &quot;query-=
helper-paths&quot; }<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt; S: { &quot;return&quot;: [<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;name&quot;: &quot;qemu-ebpf-rss-helper&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;path&quot;: &quot;/usr/local/libexec/qemu-ebpf-rss-helper&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; I think we need an example on the detail s=
teps for how libvirt is<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;&gt; expected to use this.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; The preliminary patches for libvirt are at<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"https://github.com/daynix/libvirt/t=
ree/RSSv1" rel=3D"noreferrer" target=3D"_blank">https://github.com/daynix/l=
ibvirt/tree/RSSv1</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/daynix/libvirt/tr=
ee/RSSv1" rel=3D"noreferrer" target=3D"_blank">https://github.com/daynix/li=
bvirt/tree/RSSv1</a>&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Will have a look but it would be better if the assu=
mption of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0management is detailed here to ease the reviewers.<=
br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;<br>
<br>
</blockquote></div>
</blockquote></div>

--000000000000511adb05c50fd05c--

