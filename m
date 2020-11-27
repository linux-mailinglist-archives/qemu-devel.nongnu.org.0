Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E17CC2C5FF0
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 07:08:42 +0100 (CET)
Received: from localhost ([::1]:40996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiWvx-00050c-BD
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 01:08:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1kiWuL-0004Rs-Np
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 01:07:01 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:34303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1kiWuJ-0006Vq-1r
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 01:07:01 -0500
Received: by mail-oi1-x241.google.com with SMTP id s18so4744144oih.1
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 22:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=foP+6NpQr4e5sKYTyt7zY83VqypFnO5tOGMZ1RqcwaI=;
 b=M4LNLSP3Cht8gVQicvTd/lqUOA4T17lPcEhkaeu8uWHj9v9X19CkAS/gO9MlrYG7wt
 IJjvmoo8jinarKHyut/Xhe4WLXlFDcoM8WNfU4aYoeszbpZ+94RXiRdJWLF4yh/0jU7s
 GvmSVs8zPFpbSLWherrtuaKWZAKGIcmR1g+dluUoeD78oFt+jQglHtODw+8BLSCTGSHd
 zT4Eq84lDqWdDt/a6nzH/HVh/Vq+S4PX3khi1d71KD+h9AU0o29yWuGB3mSriY8Mslvr
 drjyb2s38Yc6inrDF3LsXIcWLoWb6KzYOj37xpn+j/R4BYI2eSlr5j2Tv7ABJYUg6WTu
 c82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=foP+6NpQr4e5sKYTyt7zY83VqypFnO5tOGMZ1RqcwaI=;
 b=Rs8ZmyLI0nvMH3n3RLbANhAGuo1Vd7oDeSYHpdxhNY2Ad3eZnQy0A8QE5xOWR/4CNL
 IuJuCYW/V8o8EBxEy8xE+MUUenBDTrBR70LzzL5zFDrZa2J2ImiuYAb7RVhAn5r+aYHH
 +/TsunHQD52pLXPe/id5RWL8L2Qi3+8iGfe/VwpnaULkYJmNZeNfpW8rVuR/J0/1cnTq
 uNDIM6oME2vsrgMau3keru2xXrHWT8Hq5k1kCdAp8TScOfb07MmP0Ba9xdDntRAG4kHV
 c0fZdrFY9UvjjqC1e6yait8/8XpyTGWHgcCmiThDKuzH9jDufKbLe8hoPvM6lvQ2LFiX
 O0vw==
X-Gm-Message-State: AOAM533exI1po2d62e3XmjBHIM/rsqiiklBn2WkHwxofgnlqHTN4G+FT
 44ofHnm6qoJrkN2c6EtcTaPIMU33rkVYfnuOWG0KOg==
X-Google-Smtp-Source: ABdhPJwTi4HZMX7h+ULEXskIJUCb8PEZpZC2Dx8gJbK8vRe6oivRAzkpz7BbIbfFlmodmmwvJZ+7ZFB4/N94ZYUepps=
X-Received: by 2002:aca:5286:: with SMTP id g128mr4310302oib.91.1606457217772; 
 Thu, 26 Nov 2020 22:06:57 -0800 (PST)
MIME-Version: 1.0
References: <20201119111305.485202-1-andrew@daynix.com>
 <b7a7d4c2-d8ef-d9fe-22c7-fd5c42aef360@redhat.com>
 <CAOEp5OeF8qZ0hbMV3KGZHS0RqTjjefGiFkLdOd2-pU37JZ54Fg@mail.gmail.com>
 <12187c50-94ce-e456-4c48-5497f2f2caee@redhat.com>
In-Reply-To: <12187c50-94ce-e456-4c48-5497f2f2caee@redhat.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Fri, 27 Nov 2020 08:06:45 +0200
Message-ID: <CAOEp5Oc=v_FPE+ik=X8UnPzOmEHBXRQGYsq1PPkUUCEeecNarA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/5] eBPF RSS support for virtio-net
To: Jason Wang <jasowang@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d0036505b51077b8"
Received-SPF: none client-ip=2607:f8b0:4864:20::241;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-oi1-x241.google.com
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

--000000000000d0036505b51077b8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2020 at 6:36 AM Jason Wang <jasowang@redhat.com> wrote:

>
> On 2020/11/26 =E4=B8=8B=E5=8D=888:52, Yuri Benditovich wrote:
> >
> >
> > On Mon, Nov 23, 2020 at 8:08 AM Jason Wang <jasowang@redhat.com
> > <mailto:jasowang@redhat.com>> wrote:
> >
> >
> >     On 2020/11/19 =E4=B8=8B=E5=8D=887:13, Andrew Melnychenko wrote:
> >     > This set of patches introduces the usage of eBPF for packet
> steering
> >     > and RSS hash calculation:
> >     > * RSS(Receive Side Scaling) is used to distribute network packets
> to
> >     > guest virtqueues by calculating packet hash
> >     > * Additionally adding support for the usage of RSS with vhost
> >     >
> >     > The eBPF works on kernels 5.8+
> >     > On earlier kerneld it fails to load and the RSS feature is report=
ed
> >     > only without vhost and implemented in 'in-qemu' software.
> >     >
> >     > Implementation notes:
> >     > Linux TAP TUNSETSTEERINGEBPF ioctl was used to set the eBPF
> program.
> >     > Added libbpf dependency and eBPF support.
> >     > The eBPF program is part of the qemu and presented as an array
> >     > of BPF ELF file data.
> >     > The compilation of eBPF is not part of QEMU build and can be done
> >     > using provided Makefile.ebpf(need to adjust 'linuxhdrs').
> >     > Added changes to virtio-net and vhost, primary eBPF RSS is used.
> >     > 'in-qemu' RSS used in the case of hash population and as a
> >     fallback option.
> >     > For vhost, the hash population feature is not reported to the
> guest.
> >     >
> >     > Please also see the documentation in PATCH 5/5.
> >     >
> >     > I am sending those patches as RFC to initiate the discussions
> >     and get
> >     > feedback on the following points:
> >     > * Fallback when eBPF is not supported by the kernel
> >     > * Live migration to the kernel that doesn't have eBPF support
> >     > * Integration with current QEMU build
> >     > * Additional usage for eBPF for packet filtering
> >     >
> >     > Known issues:
> >     > * hash population not supported by eBPF RSS: 'in-qemu' RSS used
> >     > as a fallback, also, hash population feature is not reported to
> >     guests
> >     > with vhost.
> >     > * big-endian BPF support: for now, eBPF isn't supported on
> >     > big-endian systems. Can be added in future if required.
> >     > * huge .h file with eBPF binary. The size of .h file containing
> >     > eBPF binary is currently ~5K lines, because the binary is built
> >     with debug information.
> >     > The binary without debug/BTF info can't be loaded by libbpf.
> >     > We're looking for possibilities to reduce the size of the .h file=
s.
> >
> >
> >     A question here, is this because the binary file contains DWARF
> >     data? If
> >     yes, is it a building or loading dependency? If it's latter, maybe =
we
> >     can try to strip them out, anyhow it can't be recognized by kernel.
> >
> >     Thanks
> >
> >
> > After some experiments we can see that stripping of debug sections
> > reduces the size of
> > ELF from ~45K to ~20K (we tried to strip more but the libbpf fails to
> > load it, libbpf needs BTF and symbols)
> > So I suggest to reevaluate the necessity of libbpf.
> > For this specific BPF it does not present advantage and we hardly can
> > create some reusable code
> > related to libbpf, i.e. any further BPF will need its own libbpf wrappe=
r.
> > The BTF is really good feature and in case some later BPF will need an
> > access to kernel
> > structures it will use libbpf loader.
> > What you think about it?
>
>
> If we can find a way to use BTF without libbpf, it should be acceptable.
>
> But the point is that the RSS BPF does not need the BTF as it does not us=
e
any kernel structures.
When we have, for example, filter BPF that will need the BTF - we'll  use
libbpf for it.
Anyway we do not have here any infrastructural code related to libbpf,



> Thanks
>
>
> >
> >     >
> >     > Changes since v1:
> >     > * using libbpf instead of direct 'bpf' system call.
> >     > * added libbpf dependency to the configure/meson scripts.
> >     > * changed python script for eBPF .h file generation.
> >     > * changed eBPF program - reading L3 proto from ethernet frame.
> >     > * added TUNSETSTEERINGEBPF define for TUN.
> >     > * changed the maintainer's info.
> >     > * added license headers.
> >     > * refactored code.
> >     >
> >     > Andrew (5):
> >     >    net: Added SetSteeringEBPF method for NetClientState.
> >     >    ebpf: Added eBPF RSS program.
> >     >    ebpf: Added eBPF RSS loader.
> >     >    virtio-net: Added eBPF RSS to virtio-net.
> >     >    docs: Added eBPF RSS documentation.
> >     >
> >     >   MAINTAINERS                    |    7 +
> >     >   configure                      |   33 +
> >     >   docs/ebpf_rss.rst              |  133 +
> >     >   ebpf/EbpfElf_to_C.py           |   36 +
> >     >   ebpf/Makefile.ebpf             |   33 +
> >     >   ebpf/ebpf_rss-stub.c           |   40 +
> >     >   ebpf/ebpf_rss.c                |  186 ++
> >     >   ebpf/ebpf_rss.h                |   44 +
> >     >   ebpf/meson.build               |    1 +
> >     >   ebpf/rss.bpf.c                 |  505 +++
> >     >   ebpf/tun_rss_steering.h        | 5439
> >     ++++++++++++++++++++++++++++++++
> >     >   hw/net/vhost_net.c             |    2 +
> >     >   hw/net/virtio-net.c            |  120 +-
> >     >   include/hw/virtio/virtio-net.h |    4 +
> >     >   include/net/net.h              |    2 +
> >     >   meson.build                    |   11 +
> >     >   net/tap-bsd.c                  |    5 +
> >     >   net/tap-linux.c                |   13 +
> >     >   net/tap-linux.h                |    1 +
> >     >   net/tap-solaris.c              |    5 +
> >     >   net/tap-stub.c                 |    5 +
> >     >   net/tap.c                      |    9 +
> >     >   net/tap_int.h                  |    1 +
> >     >   net/vhost-vdpa.c               |    2 +
> >     >   24 files changed, 6633 insertions(+), 4 deletions(-)
> >     >   create mode 100644 docs/ebpf_rss.rst
> >     >   create mode 100644 ebpf/EbpfElf_to_C.py
> >     >   create mode 100755 ebpf/Makefile.ebpf
> >     >   create mode 100644 ebpf/ebpf_rss-stub.c
> >     >   create mode 100644 ebpf/ebpf_rss.c
> >     >   create mode 100644 ebpf/ebpf_rss.h
> >     >   create mode 100644 ebpf/meson.build
> >     >   create mode 100644 ebpf/rss.bpf.c
> >     >   create mode 100644 ebpf/tun_rss_steering.h
> >     >
> >
>
>

--000000000000d0036505b51077b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 27, 2020 at 6:36 AM Jason=
 Wang &lt;<a href=3D"mailto:jasowang@redhat.com">jasowang@redhat.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 2020/11/26 =E4=B8=8B=E5=8D=888:52, Yuri Benditovich wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Nov 23, 2020 at 8:08 AM Jason Wang &lt;<a href=3D"mailto:jasow=
ang@redhat.com" target=3D"_blank">jasowang@redhat.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:jasowang@redhat.com" target=3D"_blank">ja=
sowang@redhat.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On 2020/11/19 =E4=B8=8B=E5=8D=887:13, Andrew Melnyc=
henko wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; This set of patches introduces the usage of eB=
PF for packet steering<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; and RSS hash calculation:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; * RSS(Receive Side Scaling) is used to distrib=
ute network packets to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; guest virtqueues by calculating packet hash<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; * Additionally adding support for the usage of=
 RSS with vhost<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; The eBPF works on kernels 5.8+<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On earlier kerneld it fails to load and the RS=
S feature is reported<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; only without vhost and implemented in &#39;in-=
qemu&#39; software.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Implementation notes:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Linux TAP TUNSETSTEERINGEBPF ioctl was used to=
 set the eBPF program.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Added libbpf dependency and eBPF support.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; The eBPF program is part of the qemu and prese=
nted as an array<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; of BPF ELF file data.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; The compilation of eBPF is not part of QEMU bu=
ild and can be done<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; using provided Makefile.ebpf(need to adjust &#=
39;linuxhdrs&#39;).<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Added changes to virtio-net and vhost, primary=
 eBPF RSS is used.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &#39;in-qemu&#39; RSS used in the case of hash=
 population and as a<br>
&gt;=C2=A0 =C2=A0 =C2=A0fallback option.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; For vhost, the hash population feature is not =
reported to the guest.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Please also see the documentation in PATCH 5/5=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I am sending those patches as RFC to initiate =
the discussions<br>
&gt;=C2=A0 =C2=A0 =C2=A0and get<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; feedback on the following points:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; * Fallback when eBPF is not supported by the k=
ernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; * Live migration to the kernel that doesn&#39;=
t have eBPF support<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; * Integration with current QEMU build<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; * Additional usage for eBPF for packet filteri=
ng<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Known issues:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; * hash population not supported by eBPF RSS: &=
#39;in-qemu&#39; RSS used<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; as a fallback, also, hash population feature i=
s not reported to<br>
&gt;=C2=A0 =C2=A0 =C2=A0guests<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; with vhost.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; * big-endian BPF support: for now, eBPF isn&#3=
9;t supported on<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; big-endian systems. Can be added in future if =
required.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; * huge .h file with eBPF binary. The size of .=
h file containing<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; eBPF binary is currently ~5K lines, because th=
e binary is built<br>
&gt;=C2=A0 =C2=A0 =C2=A0with debug information.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; The binary without debug/BTF info can&#39;t be=
 loaded by libbpf.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; We&#39;re looking for possibilities to reduce =
the size of the .h files.<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0A question here, is this because the binary file co=
ntains DWARF<br>
&gt;=C2=A0 =C2=A0 =C2=A0data? If<br>
&gt;=C2=A0 =C2=A0 =C2=A0yes, is it a building or loading dependency? If it&=
#39;s latter, maybe we<br>
&gt;=C2=A0 =C2=A0 =C2=A0can try to strip them out, anyhow it can&#39;t be r=
ecognized by kernel.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks<br>
&gt;<br>
&gt;<br>
&gt; After some experiments we can see that stripping of debug sections <br=
>
&gt; reduces the size of<br>
&gt; ELF from ~45K to ~20K (we tried to strip more but the libbpf fails to =
<br>
&gt; load it, libbpf needs BTF and symbols)<br>
&gt; So I suggest to reevaluate the necessity of libbpf.<br>
&gt; For this specific BPF it does not present=C2=A0advantage and we hardly=
 can <br>
&gt; create some reusable code<br>
&gt; related to libbpf, i.e. any further BPF will need its own libbpf wrapp=
er.<br>
&gt; The BTF is really good feature=C2=A0and in case some later BPF will ne=
ed an <br>
&gt; access to kernel<br>
&gt; structures it will use libbpf loader.<br>
&gt; What you think about it?<br>
<br>
<br>
If we can find a way to use BTF without libbpf, it should be acceptable.<br=
>
<br></blockquote><div>But the point is that the RSS BPF does not need the B=
TF as it does not use any kernel structures.</div><div>When we have, for ex=
ample, filter BPF that will need the BTF - we&#39;ll=C2=A0 use libbpf for i=
t.</div><div>Anyway we do not have here any infrastructural code related to=
 libbpf,</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
Thanks<br>
<br>
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Changes since v1:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; * using libbpf instead of direct &#39;bpf&#39;=
 system call.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; * added libbpf dependency to the configure/mes=
on scripts.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; * changed python script for eBPF .h file gener=
ation.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; * changed eBPF program - reading L3 proto from=
 ethernet frame.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; * added TUNSETSTEERINGEBPF define for TUN.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; * changed the maintainer&#39;s info.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; * added license headers.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; * refactored code.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Andrew (5):<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 net: Added SetSteeringEBPF method=
 for NetClientState.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 ebpf: Added eBPF RSS program.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 ebpf: Added eBPF RSS loader.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 virtio-net: Added eBPF RSS to vir=
tio-net.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 docs: Added eBPF RSS documentatio=
n.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 7 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A033 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0docs/ebpf_rss.rst=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 133 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0ebpf/EbpfElf_to_C.py=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A036 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0ebpf/Makefile.ebpf=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A033 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0ebpf/ebpf_rss-stub.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A040 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0ebpf/ebpf_rss.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 186 ++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0ebpf/ebpf_rss.h=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A044 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0ebpf/meson.build=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0ebpf/rss.bpf.c=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 505 +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0ebpf/tun_rss_steering.h=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 5439<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0hw/net/vhost_net.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0hw/net/virtio-net.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 120 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0include/hw/virtio/virtio-net.h |=
=C2=A0 =C2=A0 4 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0include/net/net.h=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A011 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0net/tap-bsd.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 5 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0net/tap-linux.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A013 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0net/tap-linux.h=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0net/tap-solaris.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 5 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0net/tap-stub.c=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 5 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0net/tap.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 9 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0net/tap_int.h=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0net/vhost-vdpa.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A024 files changed, 6633 insertions(=
+), 4 deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0create mode 100644 docs/ebpf_rss.r=
st<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0create mode 100644 ebpf/EbpfElf_to=
_C.py<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0create mode 100755 ebpf/Makefile.e=
bpf<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0create mode 100644 ebpf/ebpf_rss-s=
tub.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0create mode 100644 ebpf/ebpf_rss.c=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0create mode 100644 ebpf/ebpf_rss.h=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0create mode 100644 ebpf/meson.buil=
d<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0create mode 100644 ebpf/rss.bpf.c<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0create mode 100644 ebpf/tun_rss_st=
eering.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;<br>
<br>
</blockquote></div></div>

--000000000000d0036505b51077b8--

