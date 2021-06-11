Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1A53A4707
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 18:50:47 +0200 (CEST)
Received: from localhost ([::1]:43090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrkMo-0004Ht-IF
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 12:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lrkLh-0003bo-9C
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 12:49:37 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:41537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lrkLe-0001sA-7l
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 12:49:36 -0400
Received: by mail-oi1-x229.google.com with SMTP id t40so6419404oiw.8
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 09:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vCAS1Ei6RfKX3+TUmCzlR4Akz9AaFkhQzSAAkY5V/KM=;
 b=0Q1YPzv+IUm6uii2iW/y060JDdRB7KhbL8N7SFj0mJDVpaLxgq589Jk2ZhQAssOsbL
 SH0OD1b6rTOJoPy77i/HziGLPgA7Z7gCTBGt7DVBf8l0ngzonx6/DLbjBnuDOXQkAaWK
 eExy1KvC2oF9/ai5w4dUClQe/qGldCmAxFY6DFA+sO5IdEBao2f20s8RBRk27S0246+A
 BjXLShCWBb0baSHnJOcS8X5My8ALyR345hRrGAoTZrBJt4qcIGb5DkePFjsvQYYYkSxW
 pwn14IvpheXiyAheGNoNrv0Ywx6qb9D+35AohwSokjC/he7o3inyHytdqqg9U9zoKExz
 rRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vCAS1Ei6RfKX3+TUmCzlR4Akz9AaFkhQzSAAkY5V/KM=;
 b=Yqsy7mKC7Rm/Hi15hgziy5p3sKAR2aR+eZ+Sfh5YgioaAgS2JFUvhKPG0fIdoOsj6s
 wwX+cjiKJvYH3pH6olYG4ht7ITjV2QSZNoZYEolBJfbvM0Zkay3bUF6S+gEsIuDCfp00
 Imvi/bKO74PKSxQqea3a0EOTsx9ANBJnrBRXfoQfRwR5QSuqw+P1L6GCZtTYxlYsO9eU
 0HKJC0lWCL1BkO1o+nC+g+c3cR3kP8Hj740BhZgtKCsYcQ0M6b4LLNQD+CVCfxHlkb09
 3NnbfUhKIskVxG7yLa/yCt6U8MM8+wFfyd763pDANN/yFusCY97vE9FvzvbYLcaLn+uY
 1bjQ==
X-Gm-Message-State: AOAM530VYsmuj7eqYbGgel3LLF4+dHK1TLB/7y3g//pRKLL3GIIBNv9A
 miVqr4UNbXnYzx8wc6E+C/bYz2EEExFp5/7NSbkQnQ==
X-Google-Smtp-Source: ABdhPJyjTcFoonUtGZ/KLbgNmw5OFaDKGDAgdMoYYUjV5o+UohJhdGM+AYaWRsnHA7JehPljXjzsuWCv2Zi9nQ60Kxo=
X-Received: by 2002:a54:448f:: with SMTP id v15mr8495981oiv.18.1623430172193; 
 Fri, 11 Jun 2021 09:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210609100457.142570-1-andrew@daynix.com>
 <f81de211-57f9-9319-9735-c6b964bbdc77@redhat.com>
 <CAOEp5OejzxEx6UAWK2iU28QKOAt8OqcFOUga+q4VHtjLU8GvWw@mail.gmail.com>
 <3da88930-439c-1892-29b4-4977ddbb0b0a@redhat.com>
In-Reply-To: <3da88930-439c-1892-29b4-4977ddbb0b0a@redhat.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Fri, 11 Jun 2021 19:49:21 +0300
Message-ID: <CABcq3pE7Rx4r_H7qtpXAwqyiWzXCT_u1zp4X1Hc-pgMrW=9haA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] ebpf: Added ebpf helper for libvirtd.
To: Jason Wang <jasowang@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000bb463e05c4804ac0"
Received-SPF: none client-ip=2607:f8b0:4864:20::229;
 envelope-from=andrew@daynix.com; helo=mail-oi1-x229.google.com
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

--000000000000bb463e05c4804ac0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

> So I think the series is for unprivileged_bpf disabled. If I'm not
> wrong, I guess the policy is to grant CAP_BPF but do fine grain checks
> via LSM.
>

The main idea is to run eBPF RSS with qemu without any permission.
Libvirt should handle everything and pass proper eBPF file descriptors.
For current eBPF RSS, CAP_SYS_ADMIN(bypass some limitations)
also required, and in the future may be other permissions.

I'm not sure this is the best. We have several examples that let libvirt
> to involve. Examples:
>
> 1) create TAP device (and the TUN_SETIFF)
>
> 2) open vhost devices
>

Technically TAP/vhost not related to a particular qemu emulator. So common
TAP creation should fit any modern qemu. eBPF fds(program and maps) should
suit the interface for current qemu, g.e. some qemu builds may have
different map
structures or their count. It's necessary that the qemu got fds prepared by
the helper
that was built with the qemu.

I think we need an example on the detail steps for how libvirt is
> expected to use this.
>

The simplified workflow looks like this:

   1. Libvirt got "emulator" from domain document.
   2. Libvirt queries for qemu capabilities.
   3. One of the capabilities is "qemu-ebpf-rss-helper" path(if present).
   4. On NIC preparation Libvirt checks for virtio-net + rss configurations=
.
   5. If required, the "qemu-ebpf-rss-helper" called and fds are received
   through unix fd.
   6. Those fds are for eBPF RSS, which passed to child process - qemu.
   7. Qemu launched with virtio-net-pci property "rss" and "ebpf_rss_fds".


On Fri, Jun 11, 2021 at 8:36 AM Jason Wang <jasowang@redhat.com> wrote:

>
> =E5=9C=A8 2021/6/10 =E4=B8=8B=E5=8D=882:55, Yuri Benditovich =E5=86=99=E9=
=81=93:
> > On Thu, Jun 10, 2021 at 9:41 AM Jason Wang<jasowang@redhat.com>  wrote:
> >> =E5=9C=A8 2021/6/9 =E4=B8=8B=E5=8D=886:04, Andrew Melnychenko =E5=86=
=99=E9=81=93:
> >>> Libvirt usually launches qemu with strict permissions.
> >>> To enable eBPF RSS steering, qemu-ebpf-rss-helper was added.
> >> A silly question:
> >>
> >> Kernel had the following permission checks in bpf syscall:
> >>
> >>          if (sysctl_unprivileged_bpf_disabled && !bpf_capable())
> >>                   return -EPERM;
> >> ...
> >>
> >>           err =3D security_bpf(cmd, &attr, size);
> >>           if (err < 0)
> >>                   return err;
> >>
> >> So if I understand the code correctly, bpf syscall can only be done if=
:
> >>
> >> 1) unprivileged_bpf is enabled or
> >> 2) has the capability  and pass the LSM checks
> >>
> >> So I think the series is for unprivileged_bpf disabled. If I'm not
> >> wrong, I guess the policy is to grant CAP_BPF but do fine grain checks
> >> via LSM.
> >>
> >> If this is correct, need to describe it in the commit log.
> >>
> >>
> >>> Added property "ebpf_rss_fds" for "virtio-net" that allows to
> >>> initialize eBPF RSS context with passed program & maps fds.
> >>>
> >>> Added qemu-ebpf-rss-helper - simple helper that loads eBPF
> >>> context and passes fds through unix socket.
> >>> Libvirt should call the helper and pass fds to qemu through
> >>> "ebpf_rss_fds" property.
> >>>
> >>> Added explicit target OS check for libbpf dependency in meson.
> >>> eBPF RSS works only with Linux TAP, so there is no reason to
> >>> build eBPF loader/helper for non-Linux.
> >>>
> >>> Overall, libvirt process should not be aware of the "interface"
> >>> of eBPF RSS, it will not be aware of eBPF maps/program "type" and
> >>> their quantity.
> >> I'm not sure this is the best. We have several examples that let libvi=
rt
> >> to involve. Examples:
> >>
> >> 1) create TAP device (and the TUN_SETIFF)
> >>
> >> 2) open vhost devices
> >>
> >>
> >>>    That's why qemu and the helper should be from
> >>> the same build and be "synchronized". Technically each qemu may
> >>> have its own helper. That's why "query-helper-paths" qmp command
> >>> was added. Qemu should return the path to the helper that suits
> >>> and libvirt should use "that" helper for "that" emulator.
> >>>
> >>> qmp sample:
> >>> C: { "execute": "query-helper-paths" }
> >>> S: { "return": [
> >>>        {
> >>>          "name": "qemu-ebpf-rss-helper",
> >>>          "path": "/usr/local/libexec/qemu-ebpf-rss-helper"
> >>>        }
> >>>       ]
> >>>      }
> >> I think we need an example on the detail steps for how libvirt is
> >> expected to use this.
> > The preliminary patches for libvirt are at
> > https://github.com/daynix/libvirt/tree/RSSv1
>
>
> Will have a look but it would be better if the assumption of the
> management is detailed here to ease the reviewers.
>
> Thanks
>
>
> >
>
>

--000000000000bb463e05c4804ac0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div>So I think the series is for unprivileged_bpf disabled. If I&#39=
;m not <br>
wrong, I guess the policy is to grant CAP_BPF but do fine grain checks <br>
via LSM.</div></blockquote><div><br></div><div>The main idea is to run eBPF=
 RSS with qemu without any permission.</div><div>Libvirt should handle ever=
ything and pass proper eBPF file descriptors.</div><div>For current eBPF RS=
S,  CAP_SYS_ADMIN(bypass some limitations)</div><div> also required, and in=
 the future may be other permissions.</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div>I&#39;m not sure this is the best. We=
 have several examples that let libvirt <br>
to involve. Examples:<br>
<br>
1) create TAP device (and the TUN_SETIFF)<br>
<br>
2) open vhost devices<span class=3D"gmail-im"><br></span></div></blockquote=
><div><br></div><div>Technically TAP/vhost not related to a particular qemu=
 emulator. So common</div><div>TAP creation should fit any modern qemu. eBP=
F fds(program and maps) should</div><div>suit the interface for current qem=
u, g.e. some qemu builds may have different map</div><div>structures or the=
ir count. It&#39;s necessary that the qemu got fds prepared by the helper</=
div><div> that was built with the qemu.</div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex"><div>I think we need an example on the d=
etail steps for how libvirt is <br>
expected to use this.</div></blockquote><div><br></div><div>The simplified =
workflow looks like this:</div><div><ol><li>Libvirt got &quot;emulator&quot=
; from domain document.</li><li>Libvirt queries for qemu capabilities.</li>=
<li>One of the capabilities is &quot;qemu-ebpf-rss-helper&quot; path(if pre=
sent).</li><li>On NIC preparation Libvirt checks for virtio-net + rss confi=
gurations.</li><li>If required, the &quot;qemu-ebpf-rss-helper&quot; called=
 and fds are <span class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-J=
LqJ4b gmail-ChMk0b"><span>received through unix fd.</span></span></span></l=
i><li><span class=3D"gmail-VIiyi" lang=3D"en"><span class=3D"gmail-JLqJ4b g=
mail-ChMk0b"><span>Those fds are for eBPF RSS, which passed to child proces=
s - qemu.</span></span></span></li><li><span class=3D"gmail-VIiyi" lang=3D"=
en"><span class=3D"gmail-JLqJ4b gmail-ChMk0b"><span>Qemu launched with virt=
io-net-pci property &quot;rss&quot; and &quot;ebpf_rss_fds&quot;.<br></span=
></span></span></li></ol></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Fri, Jun 11, 2021 at 8:36 AM Jason Wang &=
lt;<a href=3D"mailto:jasowang@redhat.com">jasowang@redhat.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
=E5=9C=A8 2021/6/10 =E4=B8=8B=E5=8D=882:55, Yuri Benditovich =E5=86=99=E9=
=81=93:<br>
&gt; On Thu, Jun 10, 2021 at 9:41 AM Jason Wang&lt;<a href=3D"mailto:jasowa=
ng@redhat.com" target=3D"_blank">jasowang@redhat.com</a>&gt;=C2=A0 wrote:<b=
r>
&gt;&gt; =E5=9C=A8 2021/6/9 =E4=B8=8B=E5=8D=886:04, Andrew Melnychenko =E5=
=86=99=E9=81=93:<br>
&gt;&gt;&gt; Libvirt usually launches qemu with strict permissions.<br>
&gt;&gt;&gt; To enable eBPF RSS steering, qemu-ebpf-rss-helper was added.<b=
r>
&gt;&gt; A silly question:<br>
&gt;&gt;<br>
&gt;&gt; Kernel had the following permission checks in bpf syscall:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sysctl_unprivileged_bpf_disa=
bled &amp;&amp; !bpf_capable())<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return -EPERM;<br>
&gt;&gt; ...<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D security_bpf(cmd, =
&amp;attr, size);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (err &lt; 0)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return err;<br>
&gt;&gt;<br>
&gt;&gt; So if I understand the code correctly, bpf syscall can only be don=
e if:<br>
&gt;&gt;<br>
&gt;&gt; 1) unprivileged_bpf is enabled or<br>
&gt;&gt; 2) has the capability=C2=A0 and pass the LSM checks<br>
&gt;&gt;<br>
&gt;&gt; So I think the series is for unprivileged_bpf disabled. If I&#39;m=
 not<br>
&gt;&gt; wrong, I guess the policy is to grant CAP_BPF but do fine grain ch=
ecks<br>
&gt;&gt; via LSM.<br>
&gt;&gt;<br>
&gt;&gt; If this is correct, need to describe it in the commit log.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; Added property &quot;ebpf_rss_fds&quot; for &quot;virtio-net&q=
uot; that allows to<br>
&gt;&gt;&gt; initialize eBPF RSS context with passed program &amp; maps fds=
.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Added qemu-ebpf-rss-helper - simple helper that loads eBPF<br>
&gt;&gt;&gt; context and passes fds through unix socket.<br>
&gt;&gt;&gt; Libvirt should call the helper and pass fds to qemu through<br=
>
&gt;&gt;&gt; &quot;ebpf_rss_fds&quot; property.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Added explicit target OS check for libbpf dependency in meson.=
<br>
&gt;&gt;&gt; eBPF RSS works only with Linux TAP, so there is no reason to<b=
r>
&gt;&gt;&gt; build eBPF loader/helper for non-Linux.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Overall, libvirt process should not be aware of the &quot;inte=
rface&quot;<br>
&gt;&gt;&gt; of eBPF RSS, it will not be aware of eBPF maps/program &quot;t=
ype&quot; and<br>
&gt;&gt;&gt; their quantity.<br>
&gt;&gt; I&#39;m not sure this is the best. We have several examples that l=
et libvirt<br>
&gt;&gt; to involve. Examples:<br>
&gt;&gt;<br>
&gt;&gt; 1) create TAP device (and the TUN_SETIFF)<br>
&gt;&gt;<br>
&gt;&gt; 2) open vhost devices<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 That&#39;s why qemu and the helper should be from=
<br>
&gt;&gt;&gt; the same build and be &quot;synchronized&quot;. Technically ea=
ch qemu may<br>
&gt;&gt;&gt; have its own helper. That&#39;s why &quot;query-helper-paths&q=
uot; qmp command<br>
&gt;&gt;&gt; was added. Qemu should return the path to the helper that suit=
s<br>
&gt;&gt;&gt; and libvirt should use &quot;that&quot; helper for &quot;that&=
quot; emulator.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; qmp sample:<br>
&gt;&gt;&gt; C: { &quot;execute&quot;: &quot;query-helper-paths&quot; }<br>
&gt;&gt;&gt; S: { &quot;return&quot;: [<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;name&quot;: &quot;qemu=
-ebpf-rss-helper&quot;,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;path&quot;: &quot;/usr=
/local/libexec/qemu-ebpf-rss-helper&quot;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0]<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; I think we need an example on the detail steps for how libvirt is<=
br>
&gt;&gt; expected to use this.<br>
&gt; The preliminary patches for libvirt are at<br>
&gt; <a href=3D"https://github.com/daynix/libvirt/tree/RSSv1" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/daynix/libvirt/tree/RSSv1</a><br=
>
<br>
<br>
Will have a look but it would be better if the assumption of the <br>
management is detailed here to ease the reviewers.<br>
<br>
Thanks<br>
<br>
<br>
&gt;<br>
<br>
</blockquote></div>

--000000000000bb463e05c4804ac0--

