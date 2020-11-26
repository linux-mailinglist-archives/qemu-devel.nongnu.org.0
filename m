Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA5A2C5446
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 13:55:42 +0100 (CET)
Received: from localhost ([::1]:49750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiGoH-0004Zz-GY
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 07:55:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1kiGlo-0002vO-0W
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:53:08 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:44020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1kiGlj-0008FD-GK
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:53:07 -0500
Received: by mail-ot1-x344.google.com with SMTP id f12so1759470oto.10
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 04:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eoGDdkXHxQerWLWnmMj9D6SmdooIDieycz94lKGvzwk=;
 b=MRVO50A4P2h11K77kco+vHhEAHW9L1T5bQ6prbGIVl0JewXBNcQNzOyiklxVRQdmSa
 OAnqturNyDFhW3igKBOMJ1Eh2ehlUHni2pVqhuqIA1x+Fh3jkeJadIsmBIbpwOet0aPW
 VIvA/BMJ12/O5LJJd4ap5srUPdQncM7A/X2OpoNzYQbt9c01OHbaNLOdOHahrweBXiKt
 3ZPBE4h/ZSECZ7I5Gp/ntkdvniwkWkHunpVAC4Yjco01BWbVimhXSSvUPOT8ZXM1jYot
 J58sme7q0dfGA3zij/q6frEpq60/T1vQ1tPg68tlKV8Vd6fkqxwH+qw4CmHhgXbZF0gC
 ZUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eoGDdkXHxQerWLWnmMj9D6SmdooIDieycz94lKGvzwk=;
 b=Ip/g/YwpO+gzTM7mtrlHfUIuJjl7wJauDGOPma5hgmXXd/kPpVRsrmSAILqnAldZha
 GubcjIUuAMxpNNxV/hE7vJWZC3DUsexQyecrW3pJEM4ibj4/e1Ah0+F66wR+GrHD0fhI
 qWuUUQ7RGO0ssKTdCvb6VuJvc7XGpRVS3OQBhX5Uj63uaHS7iOXiKTcxhce46scthkIE
 EDBeV8iSZu6DwQdax2qyJeF5F+udNJ25pNkONtQF658Bg2OmeY6NBX2ty2hlSa4wo44j
 euY4wMax0st6D0YvSGU5XQLuxsxwyO13bVKDzBGoboi/67Nv9jiLYCesE2l6f4ncNO7b
 pODA==
X-Gm-Message-State: AOAM533+iJTyHAOhkxcEdIsoFFZSNguLEzz024IAals/WTL5hbK0r/e7
 NNW93hvO84kZXcacs7z/K4a8KO/HXW5RfAQ/IzHz9w==
X-Google-Smtp-Source: ABdhPJzEu6XHqaCqSeAe9epxSu15+TAIc1T8t1OuLJQQLgZ0PLCVYg/75qDetAHkpzh6ecEBX9HWiDePDHBAl78Ekhg=
X-Received: by 2002:a9d:268:: with SMTP id 95mr2169627otb.27.1606395181907;
 Thu, 26 Nov 2020 04:53:01 -0800 (PST)
MIME-Version: 1.0
References: <20201119111305.485202-1-andrew@daynix.com>
 <b7a7d4c2-d8ef-d9fe-22c7-fd5c42aef360@redhat.com>
In-Reply-To: <b7a7d4c2-d8ef-d9fe-22c7-fd5c42aef360@redhat.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Thu, 26 Nov 2020 14:52:50 +0200
Message-ID: <CAOEp5OeF8qZ0hbMV3KGZHS0RqTjjefGiFkLdOd2-pU37JZ54Fg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/5] eBPF RSS support for virtio-net
To: Jason Wang <jasowang@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000002fd46405b50206f4"
Received-SPF: none client-ip=2607:f8b0:4864:20::344;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-ot1-x344.google.com
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
Cc: Yan Vugenfirer <yan@daynix.com>, Andrew Melnychenko <andrew@daynix.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002fd46405b50206f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2020 at 8:08 AM Jason Wang <jasowang@redhat.com> wrote:

>
> On 2020/11/19 =E4=B8=8B=E5=8D=887:13, Andrew Melnychenko wrote:
> > This set of patches introduces the usage of eBPF for packet steering
> > and RSS hash calculation:
> > * RSS(Receive Side Scaling) is used to distribute network packets to
> > guest virtqueues by calculating packet hash
> > * Additionally adding support for the usage of RSS with vhost
> >
> > The eBPF works on kernels 5.8+
> > On earlier kerneld it fails to load and the RSS feature is reported
> > only without vhost and implemented in 'in-qemu' software.
> >
> > Implementation notes:
> > Linux TAP TUNSETSTEERINGEBPF ioctl was used to set the eBPF program.
> > Added libbpf dependency and eBPF support.
> > The eBPF program is part of the qemu and presented as an array
> > of BPF ELF file data.
> > The compilation of eBPF is not part of QEMU build and can be done
> > using provided Makefile.ebpf(need to adjust 'linuxhdrs').
> > Added changes to virtio-net and vhost, primary eBPF RSS is used.
> > 'in-qemu' RSS used in the case of hash population and as a fallback
> option.
> > For vhost, the hash population feature is not reported to the guest.
> >
> > Please also see the documentation in PATCH 5/5.
> >
> > I am sending those patches as RFC to initiate the discussions and get
> > feedback on the following points:
> > * Fallback when eBPF is not supported by the kernel
> > * Live migration to the kernel that doesn't have eBPF support
> > * Integration with current QEMU build
> > * Additional usage for eBPF for packet filtering
> >
> > Known issues:
> > * hash population not supported by eBPF RSS: 'in-qemu' RSS used
> > as a fallback, also, hash population feature is not reported to guests
> > with vhost.
> > * big-endian BPF support: for now, eBPF isn't supported on
> > big-endian systems. Can be added in future if required.
> > * huge .h file with eBPF binary. The size of .h file containing
> > eBPF binary is currently ~5K lines, because the binary is built with
> debug information.
> > The binary without debug/BTF info can't be loaded by libbpf.
> > We're looking for possibilities to reduce the size of the .h files.
>
>
> A question here, is this because the binary file contains DWARF data? If
> yes, is it a building or loading dependency? If it's latter, maybe we
> can try to strip them out, anyhow it can't be recognized by kernel.
>
> Thanks
>
>
After some experiments we can see that stripping of debug sections reduces
the size of
ELF from ~45K to ~20K (we tried to strip more but the libbpf fails to load
it, libbpf needs BTF and symbols)
So I suggest to reevaluate the necessity of libbpf.
For this specific BPF it does not present advantage and we hardly can
create some reusable code
related to libbpf, i.e. any further BPF will need its own libbpf wrapper.
The BTF is really good feature and in case some later BPF will need an
access to kernel
structures it will use libbpf loader.
What you think about it?


>
> >
> > Changes since v1:
> > * using libbpf instead of direct 'bpf' system call.
> > * added libbpf dependency to the configure/meson scripts.
> > * changed python script for eBPF .h file generation.
> > * changed eBPF program - reading L3 proto from ethernet frame.
> > * added TUNSETSTEERINGEBPF define for TUN.
> > * changed the maintainer's info.
> > * added license headers.
> > * refactored code.
> >
> > Andrew (5):
> >    net: Added SetSteeringEBPF method for NetClientState.
> >    ebpf: Added eBPF RSS program.
> >    ebpf: Added eBPF RSS loader.
> >    virtio-net: Added eBPF RSS to virtio-net.
> >    docs: Added eBPF RSS documentation.
> >
> >   MAINTAINERS                    |    7 +
> >   configure                      |   33 +
> >   docs/ebpf_rss.rst              |  133 +
> >   ebpf/EbpfElf_to_C.py           |   36 +
> >   ebpf/Makefile.ebpf             |   33 +
> >   ebpf/ebpf_rss-stub.c           |   40 +
> >   ebpf/ebpf_rss.c                |  186 ++
> >   ebpf/ebpf_rss.h                |   44 +
> >   ebpf/meson.build               |    1 +
> >   ebpf/rss.bpf.c                 |  505 +++
> >   ebpf/tun_rss_steering.h        | 5439 +++++++++++++++++++++++++++++++=
+
> >   hw/net/vhost_net.c             |    2 +
> >   hw/net/virtio-net.c            |  120 +-
> >   include/hw/virtio/virtio-net.h |    4 +
> >   include/net/net.h              |    2 +
> >   meson.build                    |   11 +
> >   net/tap-bsd.c                  |    5 +
> >   net/tap-linux.c                |   13 +
> >   net/tap-linux.h                |    1 +
> >   net/tap-solaris.c              |    5 +
> >   net/tap-stub.c                 |    5 +
> >   net/tap.c                      |    9 +
> >   net/tap_int.h                  |    1 +
> >   net/vhost-vdpa.c               |    2 +
> >   24 files changed, 6633 insertions(+), 4 deletions(-)
> >   create mode 100644 docs/ebpf_rss.rst
> >   create mode 100644 ebpf/EbpfElf_to_C.py
> >   create mode 100755 ebpf/Makefile.ebpf
> >   create mode 100644 ebpf/ebpf_rss-stub.c
> >   create mode 100644 ebpf/ebpf_rss.c
> >   create mode 100644 ebpf/ebpf_rss.h
> >   create mode 100644 ebpf/meson.build
> >   create mode 100644 ebpf/rss.bpf.c
> >   create mode 100644 ebpf/tun_rss_steering.h
> >
>
>

--0000000000002fd46405b50206f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 23, 2020 at 8:08 AM Jason=
 Wang &lt;<a href=3D"mailto:jasowang@redhat.com">jasowang@redhat.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 2020/11/19 =E4=B8=8B=E5=8D=887:13, Andrew Melnychenko wrote:<br>
&gt; This set of patches introduces the usage of eBPF for packet steering<b=
r>
&gt; and RSS hash calculation:<br>
&gt; * RSS(Receive Side Scaling) is used to distribute network packets to<b=
r>
&gt; guest virtqueues by calculating packet hash<br>
&gt; * Additionally adding support for the usage of RSS with vhost<br>
&gt;<br>
&gt; The eBPF works on kernels 5.8+<br>
&gt; On earlier kerneld it fails to load and the RSS feature is reported<br=
>
&gt; only without vhost and implemented in &#39;in-qemu&#39; software.<br>
&gt;<br>
&gt; Implementation notes:<br>
&gt; Linux TAP TUNSETSTEERINGEBPF ioctl was used to set the eBPF program.<b=
r>
&gt; Added libbpf dependency and eBPF support.<br>
&gt; The eBPF program is part of the qemu and presented as an array<br>
&gt; of BPF ELF file data.<br>
&gt; The compilation of eBPF is not part of QEMU build and can be done<br>
&gt; using provided Makefile.ebpf(need to adjust &#39;linuxhdrs&#39;).<br>
&gt; Added changes to virtio-net and vhost, primary eBPF RSS is used.<br>
&gt; &#39;in-qemu&#39; RSS used in the case of hash population and as a fal=
lback option.<br>
&gt; For vhost, the hash population feature is not reported to the guest.<b=
r>
&gt;<br>
&gt; Please also see the documentation in PATCH 5/5.<br>
&gt;<br>
&gt; I am sending those patches as RFC to initiate the discussions and get<=
br>
&gt; feedback on the following points:<br>
&gt; * Fallback when eBPF is not supported by the kernel<br>
&gt; * Live migration to the kernel that doesn&#39;t have eBPF support<br>
&gt; * Integration with current QEMU build<br>
&gt; * Additional usage for eBPF for packet filtering<br>
&gt;<br>
&gt; Known issues:<br>
&gt; * hash population not supported by eBPF RSS: &#39;in-qemu&#39; RSS use=
d<br>
&gt; as a fallback, also, hash population feature is not reported to guests=
<br>
&gt; with vhost.<br>
&gt; * big-endian BPF support: for now, eBPF isn&#39;t supported on<br>
&gt; big-endian systems. Can be added in future if required.<br>
&gt; * huge .h file with eBPF binary. The size of .h file containing<br>
&gt; eBPF binary is currently ~5K lines, because the binary is built with d=
ebug information.<br>
&gt; The binary without debug/BTF info can&#39;t be loaded by libbpf.<br>
&gt; We&#39;re looking for possibilities to reduce the size of the .h files=
.<br>
<br>
<br>
A question here, is this because the binary file contains DWARF data? If <b=
r>
yes, is it a building or loading dependency? If it&#39;s latter, maybe we <=
br>
can try to strip them out, anyhow it can&#39;t be recognized by kernel.<br>
<br>
Thanks<br>
<br></blockquote><div><br></div><div>After some experiments we can see that=
 stripping of debug sections reduces the size of</div><div>ELF from ~45K to=
 ~20K (we tried to strip more but the libbpf fails to load it, libbpf needs=
 BTF and symbols)</div><div>So I suggest to reevaluate the necessity of lib=
bpf.</div><div>For this specific BPF it does not present=C2=A0advantage and=
 we hardly can create some reusable code</div><div>related to libbpf, i.e. =
any further BPF will need its own libbpf wrapper.</div><div>The BTF is real=
ly good feature=C2=A0and in case some later BPF will need an access to kern=
el</div><div>structures it will use libbpf loader.</div><div>What you think=
 about it?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>
&gt;<br>
&gt; Changes since v1:<br>
&gt; * using libbpf instead of direct &#39;bpf&#39; system call.<br>
&gt; * added libbpf dependency to the configure/meson scripts.<br>
&gt; * changed python script for eBPF .h file generation.<br>
&gt; * changed eBPF program - reading L3 proto from ethernet frame.<br>
&gt; * added TUNSETSTEERINGEBPF define for TUN.<br>
&gt; * changed the maintainer&#39;s info.<br>
&gt; * added license headers.<br>
&gt; * refactored code.<br>
&gt;<br>
&gt; Andrew (5):<br>
&gt;=C2=A0 =C2=A0 net: Added SetSteeringEBPF method for NetClientState.<br>
&gt;=C2=A0 =C2=A0 ebpf: Added eBPF RSS program.<br>
&gt;=C2=A0 =C2=A0 ebpf: Added eBPF RSS loader.<br>
&gt;=C2=A0 =C2=A0 virtio-net: Added eBPF RSS to virtio-net.<br>
&gt;=C2=A0 =C2=A0 docs: Added eBPF RSS documentation.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 7 +<br>
&gt;=C2=A0 =C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A033 +<br>
&gt;=C2=A0 =C2=A0docs/ebpf_rss.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 133 +<br>
&gt;=C2=A0 =C2=A0ebpf/EbpfElf_to_C.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A036 +<br>
&gt;=C2=A0 =C2=A0ebpf/Makefile.ebpf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A033 +<br>
&gt;=C2=A0 =C2=A0ebpf/ebpf_rss-stub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A040 +<br>
&gt;=C2=A0 =C2=A0ebpf/ebpf_rss.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 186 ++<br>
&gt;=C2=A0 =C2=A0ebpf/ebpf_rss.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A044 +<br>
&gt;=C2=A0 =C2=A0ebpf/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0ebpf/rss.bpf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 505 +++<br>
&gt;=C2=A0 =C2=A0ebpf/tun_rss_steering.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5439 =
++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0hw/net/vhost_net.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
&gt;=C2=A0 =C2=A0hw/net/virtio-net.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 120 +-<br>
&gt;=C2=A0 =C2=A0include/hw/virtio/virtio-net.h |=C2=A0 =C2=A0 4 +<br>
&gt;=C2=A0 =C2=A0include/net/net.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
&gt;=C2=A0 =C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A011 +<br>
&gt;=C2=A0 =C2=A0net/tap-bsd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 5 +<br>
&gt;=C2=A0 =C2=A0net/tap-linux.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A013 +<br>
&gt;=C2=A0 =C2=A0net/tap-linux.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0net/tap-solaris.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A0 5 +<br>
&gt;=C2=A0 =C2=A0net/tap-stub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 5 +<br>
&gt;=C2=A0 =C2=A0net/tap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 9 +<br>
&gt;=C2=A0 =C2=A0net/tap_int.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0net/vhost-vdpa.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
&gt;=C2=A0 =C2=A024 files changed, 6633 insertions(+), 4 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 docs/ebpf_rss.rst<br>
&gt;=C2=A0 =C2=A0create mode 100644 ebpf/EbpfElf_to_C.py<br>
&gt;=C2=A0 =C2=A0create mode 100755 ebpf/Makefile.ebpf<br>
&gt;=C2=A0 =C2=A0create mode 100644 ebpf/ebpf_rss-stub.c<br>
&gt;=C2=A0 =C2=A0create mode 100644 ebpf/ebpf_rss.c<br>
&gt;=C2=A0 =C2=A0create mode 100644 ebpf/ebpf_rss.h<br>
&gt;=C2=A0 =C2=A0create mode 100644 ebpf/meson.build<br>
&gt;=C2=A0 =C2=A0create mode 100644 ebpf/rss.bpf.c<br>
&gt;=C2=A0 =C2=A0create mode 100644 ebpf/tun_rss_steering.h<br>
&gt;<br>
<br>
</blockquote></div></div>

--0000000000002fd46405b50206f4--

