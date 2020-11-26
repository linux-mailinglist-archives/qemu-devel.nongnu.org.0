Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFB12C546A
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 14:05:00 +0100 (CET)
Received: from localhost ([::1]:60808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiGxG-0001RC-Uk
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 08:04:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1kiGtN-00087X-ST
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 08:00:59 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:46328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1kiGtK-0002hz-5e
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 08:00:57 -0500
Received: by mail-oi1-x242.google.com with SMTP id w15so2151324oie.13
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 05:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xPgYGqzABaRj7hEC92+KjugrLXHEaS3J84vF0EZVNoA=;
 b=qOXcS2nyXSdxwAw0xayAGk6TCLuWdraFBu7vwuKFvjdxhKNU74WFZ5dH3Ei2YpfpeX
 BEW84+EBTOBE71mEcqNC5EeZKT5eVgK00IrnjoJDRNcB1PlLx1G9LsvQCiYHwa0PGskh
 c3ApuwXtDCiH4Cs6o+c2st5C9PwyFVS8UZD2tPX45VDvh7dfTRHryGmpUHnpZSafn7eB
 QnlhuzAa3ZUu7YVuJeFJVt8K729aRK+Bt2muklCl1fKP5XBJnHPGs9cHMnBmesDpRKfQ
 QbjyIZT4F0PGRZ3w7y3y1yGPse8NZnnDUIsOA21l9CbzdsQrjQ3pvrg4FKVh8Us1s9We
 zO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xPgYGqzABaRj7hEC92+KjugrLXHEaS3J84vF0EZVNoA=;
 b=mOfMjZDNsASq58Uw3A2S2yQ/nA7ErDhzVsnIfsmZRrP8nOMmq9RnlslX8qON3aLs3w
 NivJ7iOYVAaEybTAihynjiMH3BEUAft9tCNl54Uy7KqwjfExTyEB/rz9ItJb2Gl2seP/
 L0WxuFsKpYbQD+w/VzVAPXXFxHOf9okCoK08v3gV3+z3QFUausao0VNKDCUGZigJb/0F
 /Z3DGXtI81MKvaByBERe1V7VWGtkmKTEj4EXXnKxog2OyQFULOFSJTqRQRmR6x2WE8YW
 QQTqalAa6a9bRFKAvmpPSp6VulM6l6jKuDkikDsKQbC/65KfAHcwqEUz9PiaOmu9nfxM
 mYuQ==
X-Gm-Message-State: AOAM532zgHaqOy8s3r3EjfM5jayeribNS0BSFNj42ehxHfuR3P/hZ6Hf
 fV2yJSRWc+EgS1dtfRtehCpbz7bh+u+AxXDp57ddhQ==
X-Google-Smtp-Source: ABdhPJxZotSo23ofOR3dhxypSLxwQGmjNPWMXOZXT7ztgd+AvW/KvxqbrNqY6/MMP7S4JGzyYkXm2+yReVvnSQqADQE=
X-Received: by 2002:aca:c4c4:: with SMTP id u187mr1998043oif.54.1606395652164; 
 Thu, 26 Nov 2020 05:00:52 -0800 (PST)
MIME-Version: 1.0
References: <20201119111305.485202-1-andrew@daynix.com>
 <20201119111305.485202-6-andrew@daynix.com>
 <41b81b86-225f-8d5a-3acc-0cae799c11d3@redhat.com>
In-Reply-To: <41b81b86-225f-8d5a-3acc-0cae799c11d3@redhat.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Thu, 26 Nov 2020 15:00:40 +0200
Message-ID: <CAOEp5Of2hGzfvx1UmJrp1QczsvpjaMGue6tdYWwwwjs-gwWY4w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 5/5] docs: Added eBPF documentation.
To: Jason Wang <jasowang@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000003761c805b5022280"
Received-SPF: none client-ip=2607:f8b0:4864:20::242;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-oi1-x242.google.com
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

--0000000000003761c805b5022280
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2020 at 10:55 AM Jason Wang <jasowang@redhat.com> wrote:

>
> On 2020/11/19 =E4=B8=8B=E5=8D=887:13, Andrew Melnychenko wrote:
> > From: Andrew <andrew@daynix.com>
> >
> > Also, added maintainers information.
> >
> > Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> > Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> > ---
> >   MAINTAINERS       |   7 +++
> >   docs/ebpf_rss.rst | 133 +++++++++++++++++++++++++++++++++++++++++++++=
+
> >   2 files changed, 140 insertions(+)
> >   create mode 100644 docs/ebpf_rss.rst
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 2c22bbca5a..d93c85b867 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3111,6 +3111,13 @@ S: Maintained
> >   F: hw/semihosting/
> >   F: include/hw/semihosting/
> >
> > +EBPF:
> > +M: Jason Wang <jasowang@redhat.com>
> > +R: Andrew Melnychenko <andrew@daynix.com>
> > +R: Yuri Benditovich <yuri.benditovich@daynix.com>
> > +S: Maintained
> > +F: ebpf/*
> > +
> >   Build and test automation
> >   -------------------------
> >   Build and test automation
> > diff --git a/docs/ebpf_rss.rst b/docs/ebpf_rss.rst
> > new file mode 100644
> > index 0000000000..f832defdf4
> > --- /dev/null
> > +++ b/docs/ebpf_rss.rst
> > @@ -0,0 +1,133 @@
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > +eBPF RSS virtio-net support
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > +
> > +RSS(Receive Side Scaling) is used to distribute network packets to
> guest virtqueues
> > +by calculating packet hash. Usually every queue is processed then by a
> specific guest CPU core.
> > +
> > +For now there are 2 RSS implementations in qemu:
> > +- 'in-qemu' RSS (functions if qemu receives network packets, i.e.
> vhost=3Doff)
> > +- eBPF RSS (can function with also with vhost=3Don)
> > +
> > +eBPF support (CONFIG_EBPF) is enabled by 'configure' script.
> > +To enable eBPF RSS support use './configure --enable-bpf'.
> > +
> > +If steering BPF is not set for kernel's TUN module, the TUN uses
> automatic selection
> > +of rx virtqueue based on lookup table built according to calculated
> symmetric hash
> > +of transmitted packets.
> > +If steering BPF is set for TUN the BPF code calculates the hash of
> packet header and
> > +returns the virtqueue number to place the packet to.
> > +
> > +Simplified decision formula:
> > +
> > +.. code:: C
> > +
> > +    queue_index =3D indirection_table[hash(<packet
> data>)%<indirection_table size>]
> > +
> > +
> > +Not for all packets, the hash can/should be calculated.
> > +
> > +Note: currently, eBPF RSS does not support hash reporting.
> > +
> > +eBPF RSS turned on by different combinations of vhost-net, vitrio-net
> and tap configurations:
> > +
> > +- eBPF is used:
> > +
> > +        tap,vhost=3Doff & virtio-net-pci,rss=3Don,hash=3Doff
> > +
> > +- eBPF is used:
> > +
> > +        tap,vhost=3Don & virtio-net-pci,rss=3Don,hash=3Doff
> > +
> > +- 'in-qemu' RSS is used:
> > +
> > +        tap,vhost=3Doff & virtio-net-pci,rss=3Don,hash=3Don
> > +
> > +- eBPF is used, hash population feature is not reported to the guest:
> > +
> > +        tap,vhost=3Don & virtio-net-pci,rss=3Don,hash=3Don
> > +
> > +If CONFIG_EBPF is not set then only 'in-qemu' RSS is supported.
> > +Also 'in-qemu' RSS, as a fallback, is used if the eBPF program failed
> to load or set to TUN.
> > +
> > +RSS eBPF program
> > +----------------
> > +
> > +RSS program located in ebpf/tun_rss_steering.h as an array of 'struct
> bpf_insn'.
> > +So the program is part of the qemu binary.
> > +Initially, the eBPF program was compiled by clang and source code
> located at ebpf/rss.bpf.c.
> > +Prerequisites to recompile the eBPF program (regenerate
> ebpf/tun_rss_steering.h):
> > +
> > +        llvm, clang, kernel source tree, python3 + (pip3 pyelftools)
> > +        Adjust 'linuxhdrs' in Makefile.ebpf to reflect the location of
> the kernel source tree
> > +
> > +        $ cd ebpf
> > +        $ make -f Makefile.ebpf
> > +
> > +Note the python script for convertation from eBPF ELF object to '.h'
> file - Ebpf_to_C.py:
> > +
> > +        $ python EbpfElf_to_C.py rss.bpf.o tun_rss_steering
> > +
> > +The first argument of the script is ELF object, second - section name
> where the eBPF program located.
> > +The script would generate <section name>.h file with eBPF instructions
> and 'relocate array'.
> > +'relocate array' is an array of 'struct fixup_mapfd_t' with the name o=
f
> the eBPF map and instruction offset where the file descriptor of the map
> should be placed.
> > +
> > +Current eBPF RSS implementation uses 'bounded loops' with 'backward
> jump instructions' which present in the last kernels.
> > +Overall eBPF RSS works on kernels 5.8+.
>
>
> This reminds me that we probably need to probe this ability via
> configure script.
>
>
I'm not sure. One can boot with an older kernel, build qemu and run it with
a newer kernel, correct?



> Thanks
>
>
> > +
> > +eBPF RSS implementation
> > +-----------------------
> > +
> > +eBPF RSS loading functionality located in ebpf/ebpf_rss.c and
> ebpf/ebpf_rss.h.
> > +
> > +The `struct EBPFRSSContext` structure that holds 4 file descriptors:
> > +
> > +- ctx - pointer of the libbpf context.
> > +- program_fd - file descriptor of the eBPF RSS program.
> > +- map_configuration - file descriptor of the 'configuration' map. This
> map contains one element of 'struct EBPFRSSConfig'. This configuration
> determines eBPF program behavior.
> > +- map_toeplitz_key - file descriptor of the 'Toeplitz key' map. One
> element of the 40byte key prepared for the hashing algorithm.
> > +- map_indirections_table - 128 elements of queue indexes.
> > +
> > +`struct EBPFRSSConfig` fields:
> > +
> > +- redirect - "boolean" value, should the hash be calculated, on false
> - `default_queue` would be used as the final decision.
> > +- populate_hash - for now, not used. eBPF RSS doesn't support hash
> reporting.
> > +- hash_types - binary mask of different hash types. See
> `VIRTIO_NET_RSS_HASH_TYPE_*` defines. If for packet hash should not be
> calculated - `default_queue` would be used.
> > +- indirections_len - length of the indirections table, maximum 128.
> > +- default_queue - the queue index that used for packet that shouldn't
> be hashed. For some packets, the hash can't be calculated(g.e ARP).
> > +
> > +Functions:
> > +
> > +- `ebpf_rss_init()` - sets ctx to NULL, which indicates that
> EBPFRSSContext is not loaded.
> > +- `ebpf_rss_load()` - creates 3 maps and loads eBPF program from
> tun_rss_steering.h. Returns 'true' on success. After that, program_fd can
> be used to set steering for TAP.
> > +- `ebpf_rss_set_all()` - sets values for eBPF maps.
> `indirections_table` length is in EBPFRSSConfig. `toeplitz_key` is
> VIRTIO_NET_RSS_MAX_KEY_SIZE aka 40 bytes array.
> > +- `ebpf_rss_unload()` - close all file descriptors and set ctx to NULL=
.
> > +
> > +Simplified eBPF RSS workflow:
> > +
> > +.. code:: C
> > +
> > +    struct EBPFRSSConfig config;
> > +    config.redirect =3D 1;
> > +    config.hash_types =3D VIRTIO_NET_RSS_HASH_TYPE_UDPv4 |
> VIRTIO_NET_RSS_HASH_TYPE_TCPv4;
> > +    config.indirections_len =3D VIRTIO_NET_RSS_MAX_TABLE_LEN;
> > +    config.default_queue =3D 0;
> > +
> > +    uint16_t table[VIRTIO_NET_RSS_MAX_TABLE_LEN] =3D {...};
> > +    uint8_t key[VIRTIO_NET_RSS_MAX_KEY_SIZE] =3D {...};
> > +
> > +    struct EBPFRSSContext ctx;
> > +    ebpf_rss_init(&ctx);
> > +    ebpf_rss_load(&ctx);
> > +    ebpf_rss_set_all(&ctx, &config, table, key);
> > +    if (net_client->info->set_steering_ebpf !=3D NULL) {
> > +        net_client->info->set_steering_ebpf(net_client,
> ctx->program_fd);
> > +    }
> > +    ...
> > +    ebpf_unload(&ctx);
> > +
> > +
> > +NetClientState SetSteeringEBPF()
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +For now, `set_steering_ebpf()` method supported by Linux TAP
> NetClientState. The method requires an eBPF program file descriptor as an
> argument.
>
>

--0000000000003761c805b5022280
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 24, 2020 at 10:55 AM Jaso=
n Wang &lt;<a href=3D"mailto:jasowang@redhat.com">jasowang@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 2020/11/19 =E4=B8=8B=E5=8D=887:13, Andrew Melnychenko wrote:<br>
&gt; From: Andrew &lt;<a href=3D"mailto:andrew@daynix.com" target=3D"_blank=
">andrew@daynix.com</a>&gt;<br>
&gt;<br>
&gt; Also, added maintainers information.<br>
&gt;<br>
&gt; Signed-off-by: Yuri Benditovich &lt;<a href=3D"mailto:yuri.benditovich=
@daynix.com" target=3D"_blank">yuri.benditovich@daynix.com</a>&gt;<br>
&gt; Signed-off-by: Andrew Melnychenko &lt;<a href=3D"mailto:andrew@daynix.=
com" target=3D"_blank">andrew@daynix.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A07 +++<=
br>
&gt;=C2=A0 =C2=A0docs/ebpf_rss.rst | 133 ++++++++++++++++++++++++++++++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A02 files changed, 140 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 docs/ebpf_rss.rst<br>
&gt;<br>
&gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>
&gt; index 2c22bbca5a..d93c85b867 100644<br>
&gt; --- a/MAINTAINERS<br>
&gt; +++ b/MAINTAINERS<br>
&gt; @@ -3111,6 +3111,13 @@ S: Maintained<br>
&gt;=C2=A0 =C2=A0F: hw/semihosting/<br>
&gt;=C2=A0 =C2=A0F: include/hw/semihosting/<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +EBPF:<br>
&gt; +M: Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com" target=3D"_b=
lank">jasowang@redhat.com</a>&gt;<br>
&gt; +R: Andrew Melnychenko &lt;<a href=3D"mailto:andrew@daynix.com" target=
=3D"_blank">andrew@daynix.com</a>&gt;<br>
&gt; +R: Yuri Benditovich &lt;<a href=3D"mailto:yuri.benditovich@daynix.com=
" target=3D"_blank">yuri.benditovich@daynix.com</a>&gt;<br>
&gt; +S: Maintained<br>
&gt; +F: ebpf/*<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0Build and test automation<br>
&gt;=C2=A0 =C2=A0-------------------------<br>
&gt;=C2=A0 =C2=A0Build and test automation<br>
&gt; diff --git a/docs/ebpf_rss.rst b/docs/ebpf_rss.rst<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..f832defdf4<br>
&gt; --- /dev/null<br>
&gt; +++ b/docs/ebpf_rss.rst<br>
&gt; @@ -0,0 +1,133 @@<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D<br>
&gt; +eBPF RSS virtio-net support<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D<br>
&gt; +<br>
&gt; +RSS(Receive Side Scaling) is used to distribute network packets to gu=
est virtqueues<br>
&gt; +by calculating packet hash. Usually every queue is processed then by =
a specific guest CPU core.<br>
&gt; +<br>
&gt; +For now there are 2 RSS implementations in qemu:<br>
&gt; +- &#39;in-qemu&#39; RSS (functions if qemu receives network packets, =
i.e. vhost=3Doff)<br>
&gt; +- eBPF RSS (can function with also with vhost=3Don)<br>
&gt; +<br>
&gt; +eBPF support (CONFIG_EBPF) is enabled by &#39;configure&#39; script.<=
br>
&gt; +To enable eBPF RSS support use &#39;./configure --enable-bpf&#39;.<br=
>
&gt; +<br>
&gt; +If steering BPF is not set for kernel&#39;s TUN module, the TUN uses =
automatic selection<br>
&gt; +of rx virtqueue based on lookup table built according to calculated s=
ymmetric hash<br>
&gt; +of transmitted packets.<br>
&gt; +If steering BPF is set for TUN the BPF code calculates the hash of pa=
cket header and<br>
&gt; +returns the virtqueue number to place the packet to.<br>
&gt; +<br>
&gt; +Simplified decision formula:<br>
&gt; +<br>
&gt; +.. code:: C<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 queue_index =3D indirection_table[hash(&lt;packet data&=
gt;)%&lt;indirection_table size&gt;]<br>
&gt; +<br>
&gt; +<br>
&gt; +Not for all packets, the hash can/should be calculated.<br>
&gt; +<br>
&gt; +Note: currently, eBPF RSS does not support hash reporting.<br>
&gt; +<br>
&gt; +eBPF RSS turned on by different combinations of vhost-net, vitrio-net=
 and tap configurations:<br>
&gt; +<br>
&gt; +- eBPF is used:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tap,vhost=3Doff &amp; virtio-net-pci,rss=
=3Don,hash=3Doff<br>
&gt; +<br>
&gt; +- eBPF is used:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tap,vhost=3Don &amp; virtio-net-pci,rss=
=3Don,hash=3Doff<br>
&gt; +<br>
&gt; +- &#39;in-qemu&#39; RSS is used:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tap,vhost=3Doff &amp; virtio-net-pci,rss=
=3Don,hash=3Don<br>
&gt; +<br>
&gt; +- eBPF is used, hash population feature is not reported to the guest:=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tap,vhost=3Don &amp; virtio-net-pci,rss=
=3Don,hash=3Don<br>
&gt; +<br>
&gt; +If CONFIG_EBPF is not set then only &#39;in-qemu&#39; RSS is supporte=
d.<br>
&gt; +Also &#39;in-qemu&#39; RSS, as a fallback, is used if the eBPF progra=
m failed to load or set to TUN.<br>
&gt; +<br>
&gt; +RSS eBPF program<br>
&gt; +----------------<br>
&gt; +<br>
&gt; +RSS program located in ebpf/tun_rss_steering.h as an array of &#39;st=
ruct bpf_insn&#39;.<br>
&gt; +So the program is part of the qemu binary.<br>
&gt; +Initially, the eBPF program was compiled by clang and source code loc=
ated at ebpf/rss.bpf.c.<br>
&gt; +Prerequisites to recompile the eBPF program (regenerate ebpf/tun_rss_=
steering.h):<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 llvm, clang, kernel source tree, python3 =
+ (pip3 pyelftools)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Adjust &#39;linuxhdrs&#39; in Makefile.eb=
pf to reflect the location of the kernel source tree<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 $ cd ebpf<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 $ make -f Makefile.ebpf<br>
&gt; +<br>
&gt; +Note the python script for convertation from eBPF ELF object to &#39;=
.h&#39; file - Ebpf_to_C.py:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 $ python EbpfElf_to_C.py rss.bpf.o tun_rs=
s_steering<br>
&gt; +<br>
&gt; +The first argument of the script is ELF object, second - section name=
 where the eBPF program located.<br>
&gt; +The script would generate &lt;section name&gt;.h file with eBPF instr=
uctions and &#39;relocate array&#39;.<br>
&gt; +&#39;relocate array&#39; is an array of &#39;struct fixup_mapfd_t&#39=
; with the name of the eBPF map and instruction offset where the file descr=
iptor of the map should be placed.<br>
&gt; +<br>
&gt; +Current eBPF RSS implementation uses &#39;bounded loops&#39; with &#3=
9;backward jump instructions&#39; which present in the last kernels.<br>
&gt; +Overall eBPF RSS works on kernels 5.8+.<br>
<br>
<br>
This reminds me that we probably need to probe this ability via <br>
configure script.<br>
<br></blockquote><div><br></div><div>I&#39;m not sure. One can boot with an=
 older kernel, build qemu and run it with a newer kernel, correct?</div><di=
v>=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
Thanks<br>
<br>
<br>
&gt; +<br>
&gt; +eBPF RSS implementation<br>
&gt; +-----------------------<br>
&gt; +<br>
&gt; +eBPF RSS loading functionality located in ebpf/ebpf_rss.c and ebpf/eb=
pf_rss.h.<br>
&gt; +<br>
&gt; +The `struct EBPFRSSContext` structure that holds 4 file descriptors:<=
br>
&gt; +<br>
&gt; +- ctx - pointer of the libbpf context.<br>
&gt; +- program_fd - file descriptor of the eBPF RSS program.<br>
&gt; +- map_configuration - file descriptor of the &#39;configuration&#39; =
map. This map contains one element of &#39;struct EBPFRSSConfig&#39;. This =
configuration determines eBPF program behavior.<br>
&gt; +- map_toeplitz_key - file descriptor of the &#39;Toeplitz key&#39; ma=
p. One element of the 40byte key prepared for the hashing algorithm.<br>
&gt; +- map_indirections_table - 128 elements of queue indexes.<br>
&gt; +<br>
&gt; +`struct EBPFRSSConfig` fields:<br>
&gt; +<br>
&gt; +- redirect - &quot;boolean&quot; value, should the hash be calculated=
, on false=C2=A0 - `default_queue` would be used as the final decision.<br>
&gt; +- populate_hash - for now, not used. eBPF RSS doesn&#39;t support has=
h reporting.<br>
&gt; +- hash_types - binary mask of different hash types. See `VIRTIO_NET_R=
SS_HASH_TYPE_*` defines. If for packet hash should not be calculated - `def=
ault_queue` would be used.<br>
&gt; +- indirections_len - length of the indirections table, maximum 128.<b=
r>
&gt; +- default_queue - the queue index that used for packet that shouldn&#=
39;t be hashed. For some packets, the hash can&#39;t be calculated(g.e ARP)=
.<br>
&gt; +<br>
&gt; +Functions:<br>
&gt; +<br>
&gt; +- `ebpf_rss_init()` - sets ctx to NULL, which indicates that EBPFRSSC=
ontext is not loaded.<br>
&gt; +- `ebpf_rss_load()` - creates 3 maps and loads eBPF program from tun_=
rss_steering.h. Returns &#39;true&#39; on success. After that, program_fd c=
an be used to set steering for TAP.<br>
&gt; +- `ebpf_rss_set_all()` - sets values for eBPF maps. `indirections_tab=
le` length is in EBPFRSSConfig. `toeplitz_key` is VIRTIO_NET_RSS_MAX_KEY_SI=
ZE aka 40 bytes array.<br>
&gt; +- `ebpf_rss_unload()` - close all file descriptors and set ctx to NUL=
L.<br>
&gt; +<br>
&gt; +Simplified eBPF RSS workflow:<br>
&gt; +<br>
&gt; +.. code:: C<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 struct EBPFRSSConfig config;<br>
&gt; +=C2=A0 =C2=A0 config.redirect =3D 1;<br>
&gt; +=C2=A0 =C2=A0 config.hash_types =3D VIRTIO_NET_RSS_HASH_TYPE_UDPv4 | =
VIRTIO_NET_RSS_HASH_TYPE_TCPv4;<br>
&gt; +=C2=A0 =C2=A0 config.indirections_len =3D VIRTIO_NET_RSS_MAX_TABLE_LE=
N;<br>
&gt; +=C2=A0 =C2=A0 config.default_queue =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 uint16_t table[VIRTIO_NET_RSS_MAX_TABLE_LEN] =3D {...};=
<br>
&gt; +=C2=A0 =C2=A0 uint8_t key[VIRTIO_NET_RSS_MAX_KEY_SIZE] =3D {...};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 struct EBPFRSSContext ctx;<br>
&gt; +=C2=A0 =C2=A0 ebpf_rss_init(&amp;ctx);<br>
&gt; +=C2=A0 =C2=A0 ebpf_rss_load(&amp;ctx);<br>
&gt; +=C2=A0 =C2=A0 ebpf_rss_set_all(&amp;ctx, &amp;config, table, key);<br=
>
&gt; +=C2=A0 =C2=A0 if (net_client-&gt;info-&gt;set_steering_ebpf !=3D NULL=
) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 net_client-&gt;info-&gt;set_steering_ebpf=
(net_client, ctx-&gt;program_fd);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 ...<br>
&gt; +=C2=A0 =C2=A0 ebpf_unload(&amp;ctx);<br>
&gt; +<br>
&gt; +<br>
&gt; +NetClientState SetSteeringEBPF()<br>
&gt; +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
&gt; +<br>
&gt; +For now, `set_steering_ebpf()` method supported by Linux TAP NetClien=
tState. The method requires an eBPF program file descriptor as an argument.=
<br>
<br>
</blockquote></div></div>

--0000000000003761c805b5022280--

