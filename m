Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2732CEE18
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 13:34:28 +0100 (CET)
Received: from localhost ([::1]:50276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klAI6-0008UG-K7
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 07:34:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1klAFh-0007wS-9f
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 07:31:57 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:43850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1klAFd-0007hA-NL
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 07:31:57 -0500
Received: by mail-ot1-x341.google.com with SMTP id f12so4961756oto.10
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 04:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bMGKxO0GTAh+hhtQxkaOzgW16TgdjtJgyJTggGMHJj8=;
 b=sUcqXK92uby01wqeKsRbsQeYh7l1yJnIMMDOBD4xg2DYuEmj8whsWGIXv47pVSuzO8
 AjfN/7+TI4J4D1hje00X9T2rwJ+PLwqRu3XvTeHa2D8YoxcOjXrBZ6G5j5tNZYMvT1mq
 W5rrShIVgyMSoet2Q1z/sX8QKa+5FTn5sEY60xpb9dBpY44OI3oRdfXDIum5OK2CBnGU
 jggxO7tSqkA/T+1WfhgUf+Fe5A8vgrmfjiospCDjjMXlhU5jnyb7IyaJAO2QtcH/bTs9
 RNhAFbD4GkDNyNxbp772Pb0oe10fylIiSbjpIyObHFzsLqTw15LLKjLH6Oys0Nnje8iZ
 rADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bMGKxO0GTAh+hhtQxkaOzgW16TgdjtJgyJTggGMHJj8=;
 b=cc0+oYMKEtXxQd7r5KqxeS7rWy8ojxY+AEarnVDjJ1SP3DCsJfeM/ezZkDDOmgQw1w
 0geNQy8i1nwPN4yeBK/AB913gk3FXb9T3CSnisoDkCEGo89uRJa5B+vuQoZZbjRtxAJ5
 efIyuSddKGOLczVD6Tv0ICMnf2vg0IYHvfkwXXndmrQSD856HQ89qPvfW+Wzokwga0Is
 aEDfrkGXvRBuVcqUp4bIw/UegxFhig6yF9v7LlisU6+OCbZb7jSXfrEOKmlrjsi/js1O
 k81dGak5mnXU8Oc5LmE3nZWsETloJewWyGmQ+Fq4h0lCCwcqjuUbYjuvks6smf+azwY1
 A7Bw==
X-Gm-Message-State: AOAM531jY1613PPhTsI00uH+W4PmWM4WffsxPZiQLdVvkKGpOnLSkKdF
 VyltYr4HaOe1a3ED21EHy0KncZ3/H3RofQkhwNx+YQ==
X-Google-Smtp-Source: ABdhPJykFbeRZWznuzc803956s4RIahGvkyWKDad5lMcCnxSPZw1smdXFGW2+ceX3bJpaF+rulr1ZhlkohBjQJeEHig=
X-Received: by 2002:a9d:67c7:: with SMTP id c7mr3470197otn.27.1607085112393;
 Fri, 04 Dec 2020 04:31:52 -0800 (PST)
MIME-Version: 1.0
References: <20201119111305.485202-1-andrew@daynix.com>
 <00e5b0a8-dfaa-2899-2501-cfe8249302ff@redhat.com>
 <87h7p4cmva.fsf@toke.dk>
 <CAOEp5Oe0AzZ40RK9EjNx0d2RVbteq_cR8zVhQH+_8Wm9x_TQgA@mail.gmail.com>
 <87im9h9933.fsf@toke.dk>
In-Reply-To: <87im9h9933.fsf@toke.dk>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Fri, 4 Dec 2020 14:31:40 +0200
Message-ID: <CAOEp5OcVPcTPFhqapEjAykhU2YzajmfmxG5MoU6Leg6Qw5TVbw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/5] eBPF RSS support for virtio-net
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000003f95c505b5a2a995"
Received-SPF: none client-ip=2607:f8b0:4864:20::341;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-ot1-x341.google.com
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
Cc: qemu-devel@nongnu.org, Yan Vugenfirer <yan@daynix.com>,
 Jason Wang <jasowang@redhat.com>, Andrew Melnychenko <andrew@daynix.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003f95c505b5a2a995
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 4, 2020 at 12:09 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redh=
at.com>
wrote:

> Yuri Benditovich <yuri.benditovich@daynix.com> writes:
>
> > On Wed, Dec 2, 2020 at 4:18 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@r=
edhat.com>
> > wrote:
> >
> >> Jason Wang <jasowang@redhat.com> writes:
> >>
> >> > On 2020/11/19 =E4=B8=8B=E5=8D=887:13, Andrew Melnychenko wrote:
> >> >> This set of patches introduces the usage of eBPF for packet steerin=
g
> >> >> and RSS hash calculation:
> >> >> * RSS(Receive Side Scaling) is used to distribute network packets t=
o
> >> >> guest virtqueues by calculating packet hash
> >> >> * Additionally adding support for the usage of RSS with vhost
> >> >>
> >> >> The eBPF works on kernels 5.8+
> >> >> On earlier kerneld it fails to load and the RSS feature is reported
> >> >> only without vhost and implemented in 'in-qemu' software.
> >> >>
> >> >> Implementation notes:
> >> >> Linux TAP TUNSETSTEERINGEBPF ioctl was used to set the eBPF program=
.
> >> >> Added libbpf dependency and eBPF support.
> >> >> The eBPF program is part of the qemu and presented as an array
> >> >> of BPF ELF file data.
> >> >> The compilation of eBPF is not part of QEMU build and can be done
> >> >> using provided Makefile.ebpf(need to adjust 'linuxhdrs').
> >> >> Added changes to virtio-net and vhost, primary eBPF RSS is used.
> >> >> 'in-qemu' RSS used in the case of hash population and as a fallback
> >> option.
> >> >> For vhost, the hash population feature is not reported to the guest=
.
> >> >>
> >> >> Please also see the documentation in PATCH 5/5.
> >> >>
> >> >> I am sending those patches as RFC to initiate the discussions and g=
et
> >> >> feedback on the following points:
> >> >> * Fallback when eBPF is not supported by the kernel
> >> >> * Live migration to the kernel that doesn't have eBPF support
> >> >> * Integration with current QEMU build
> >> >> * Additional usage for eBPF for packet filtering
> >> >>
> >> >> Known issues:
> >> >> * hash population not supported by eBPF RSS: 'in-qemu' RSS used
> >> >> as a fallback, also, hash population feature is not reported to
> guests
> >> >> with vhost.
> >> >> * big-endian BPF support: for now, eBPF isn't supported on
> >> >> big-endian systems. Can be added in future if required.
> >> >> * huge .h file with eBPF binary. The size of .h file containing
> >> >> eBPF binary is currently ~5K lines, because the binary is built wit=
h
> >> debug information.
> >> >> The binary without debug/BTF info can't be loaded by libbpf.
> >> >> We're looking for possibilities to reduce the size of the .h files.
> >> >
> >> >
> >> > Adding Toke for sharing more idea from eBPF side.
> >> >
> >> > We had some discussion on the eBPF issues:
> >> >
> >> > 1) Whether or not to use libbpf. Toke strongly suggest to use libbpf
> >> > 2) Whether or not to use BTF. Toke confirmed that if we don't access
> any
> >> > skb metadata, BTF is not strictly required for CO-RE. But it might
> still
> >> > useful for e.g debugging.
> >> > 3) About the huge (5K lines, see patch #2 Toke). Toke confirmed that
> we
> >> > can strip debug symbols, but Yuri found some sections can't be
> stripped,
> >> > we can keep discussing here.
> >>
> >> I just tried simply running 'strip' on a sample trivial XDP program,
> >> which brought its size down from ~5k to ~1k and preserved the BTF
> >> information without me having to do anything.
> >>
> >
> > With our eBPF code the numbers are slightly different:
> > The code size without BTF: 7.5K (built without '-g')
> > Built with '-g': 45K
> > Stripped: 19K
> > The difference between 7.5 and 19K still seems significant, especially
> when
> > we do not use any kernel structures and do not need these BTF sections
>
> That does seem like a lot of BTF information. Did you confirm (with
> objdump) that it's the .BTF* sections that take up these extra 12k? Do
> you have some really complicated data structures in the file or
> something? Got a link to the source somewhere that isn't a web mailing
> list archive? :)
>
>
Looks like the extra size is related to BTF: there are 4 BTF sections that
take 12.5K
  [ 7] .BTF              PROGBITS        0000000000000000 00144c 00175d 00
     0   0  1
  [ 8] .rel.BTF          REL             0000000000000000 002bb0 000040 10
    14   7  8
  [ 9] .BTF.ext          PROGBITS        0000000000000000 002bf0 000cd0 00
     0   0  1
  [10] .rel.BTF.ext      REL             0000000000000000 0038c0 000ca0 10
    14   9  8

All the sources are at:
The branch without libbpf
https://github.com/daynix/qemu/tree/eBPF_RFC
The branch with libbpf
https://github.com/daynix/qemu/tree/eBPF_RFCv2

all the eBPF-related code is under qemu/ebpf directory.


> In any case, while I do think it smells a little of premature
> optimisation, you can of course strip the BTF information until you need
> it. Having it around makes debugging easier (bpftool will expand your
> map structures for you when dumping maps, and that sort of thing), but
> it's not really essential if you don't need CO-RE.
>
> > This is only reason to prefer non-libbpf option for this specific eBPF
>
> You can still use libbpf without BTF. It's using BTF without libbpf that
> tends to not work so well...
>
>
If we build the eBPF without '-g' or strip the BTF information out of the
object file the libbpf crashes right after issuing printout "libbpf: BTF is
required, but is missing or corrupted".
We did not investigate this too deeply but on the first glance it looks
like the presence of maps automatically makes the libbpf to require BTF.


> >> As a side note, though, instead of embedding the BPF program into a .h=
,
> >> you could simply ship it as a .o and load it from the file system. We =
do
> >> that with xdp-tools and install the bpf object files into
> /usr/$LIB/bpf/.
> >>
> >
> > Yes, we've discussed this option and decided to go with embedding the B=
PF
> > https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg02157.html
>
> Right, okay. I'll note, though, that if your concern is that the BPF
> code should always match the rest of the code base, omitting the
> compilation if there's no Clang present seems like it could lead to
> problems :)
>
> Also, if you do go the embedded-bytecode route, you may want to have a
> look at the upstream 'skeleton' concept. It takes a BPF object file and
> automatically generates a header file that gives you direct access to
> maps, programs and global data in C. There are some examples in
> selftests/bpf on how to use it, but you basically just run
> 'bpftool gen skeleton mybpf.o'.
>
>
Indeed looks very interesting. We've missed this feature.
Thank you very much!


> -Toke
>
>

--0000000000003f95c505b5a2a995
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 4, 2020 at 12:09 PM Toke =
H=C3=B8iland-J=C3=B8rgensen &lt;<a href=3D"mailto:toke@redhat.com">toke@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Yuri Benditovich &lt;<a href=3D"mailto:yuri.benditovich@daynix.com" =
target=3D"_blank">yuri.benditovich@daynix.com</a>&gt; writes:<br>
<br>
&gt; On Wed, Dec 2, 2020 at 4:18 PM Toke H=C3=B8iland-J=C3=B8rgensen &lt;<a=
 href=3D"mailto:toke@redhat.com" target=3D"_blank">toke@redhat.com</a>&gt;<=
br>
&gt; wrote:<br>
&gt;<br>
&gt;&gt; Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com" target=3D"_b=
lank">jasowang@redhat.com</a>&gt; writes:<br>
&gt;&gt;<br>
&gt;&gt; &gt; On 2020/11/19 =E4=B8=8B=E5=8D=887:13, Andrew Melnychenko wrot=
e:<br>
&gt;&gt; &gt;&gt; This set of patches introduces the usage of eBPF for pack=
et steering<br>
&gt;&gt; &gt;&gt; and RSS hash calculation:<br>
&gt;&gt; &gt;&gt; * RSS(Receive Side Scaling) is used to distribute network=
 packets to<br>
&gt;&gt; &gt;&gt; guest virtqueues by calculating packet hash<br>
&gt;&gt; &gt;&gt; * Additionally adding support for the usage of RSS with v=
host<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; The eBPF works on kernels 5.8+<br>
&gt;&gt; &gt;&gt; On earlier kerneld it fails to load and the RSS feature i=
s reported<br>
&gt;&gt; &gt;&gt; only without vhost and implemented in &#39;in-qemu&#39; s=
oftware.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Implementation notes:<br>
&gt;&gt; &gt;&gt; Linux TAP TUNSETSTEERINGEBPF ioctl was used to set the eB=
PF program.<br>
&gt;&gt; &gt;&gt; Added libbpf dependency and eBPF support.<br>
&gt;&gt; &gt;&gt; The eBPF program is part of the qemu and presented as an =
array<br>
&gt;&gt; &gt;&gt; of BPF ELF file data.<br>
&gt;&gt; &gt;&gt; The compilation of eBPF is not part of QEMU build and can=
 be done<br>
&gt;&gt; &gt;&gt; using provided Makefile.ebpf(need to adjust &#39;linuxhdr=
s&#39;).<br>
&gt;&gt; &gt;&gt; Added changes to virtio-net and vhost, primary eBPF RSS i=
s used.<br>
&gt;&gt; &gt;&gt; &#39;in-qemu&#39; RSS used in the case of hash population=
 and as a fallback<br>
&gt;&gt; option.<br>
&gt;&gt; &gt;&gt; For vhost, the hash population feature is not reported to=
 the guest.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Please also see the documentation in PATCH 5/5.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I am sending those patches as RFC to initiate the discuss=
ions and get<br>
&gt;&gt; &gt;&gt; feedback on the following points:<br>
&gt;&gt; &gt;&gt; * Fallback when eBPF is not supported by the kernel<br>
&gt;&gt; &gt;&gt; * Live migration to the kernel that doesn&#39;t have eBPF=
 support<br>
&gt;&gt; &gt;&gt; * Integration with current QEMU build<br>
&gt;&gt; &gt;&gt; * Additional usage for eBPF for packet filtering<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Known issues:<br>
&gt;&gt; &gt;&gt; * hash population not supported by eBPF RSS: &#39;in-qemu=
&#39; RSS used<br>
&gt;&gt; &gt;&gt; as a fallback, also, hash population feature is not repor=
ted to guests<br>
&gt;&gt; &gt;&gt; with vhost.<br>
&gt;&gt; &gt;&gt; * big-endian BPF support: for now, eBPF isn&#39;t support=
ed on<br>
&gt;&gt; &gt;&gt; big-endian systems. Can be added in future if required.<b=
r>
&gt;&gt; &gt;&gt; * huge .h file with eBPF binary. The size of .h file cont=
aining<br>
&gt;&gt; &gt;&gt; eBPF binary is currently ~5K lines, because the binary is=
 built with<br>
&gt;&gt; debug information.<br>
&gt;&gt; &gt;&gt; The binary without debug/BTF info can&#39;t be loaded by =
libbpf.<br>
&gt;&gt; &gt;&gt; We&#39;re looking for possibilities to reduce the size of=
 the .h files.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Adding Toke for sharing more idea from eBPF side.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; We had some discussion on the eBPF issues:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; 1) Whether or not to use libbpf. Toke strongly suggest to use=
 libbpf<br>
&gt;&gt; &gt; 2) Whether or not to use BTF. Toke confirmed that if we don&#=
39;t access any<br>
&gt;&gt; &gt; skb metadata, BTF is not strictly required for CO-RE. But it =
might still<br>
&gt;&gt; &gt; useful for e.g debugging.<br>
&gt;&gt; &gt; 3) About the huge (5K lines, see patch #2 Toke). Toke confirm=
ed that we<br>
&gt;&gt; &gt; can strip debug symbols, but Yuri found some sections can&#39=
;t be stripped,<br>
&gt;&gt; &gt; we can keep discussing here.<br>
&gt;&gt;<br>
&gt;&gt; I just tried simply running &#39;strip&#39; on a sample trivial XD=
P program,<br>
&gt;&gt; which brought its size down from ~5k to ~1k and preserved the BTF<=
br>
&gt;&gt; information without me having to do anything.<br>
&gt;&gt;<br>
&gt;<br>
&gt; With our eBPF code the numbers are slightly different:<br>
&gt; The code size without BTF: 7.5K (built without &#39;-g&#39;)<br>
&gt; Built with &#39;-g&#39;: 45K<br>
&gt; Stripped: 19K<br>
&gt; The difference between 7.5 and 19K still seems significant, especially=
 when<br>
&gt; we do not use any kernel structures and do not need these BTF sections=
<br>
<br>
That does seem like a lot of BTF information. Did you confirm (with<br>
objdump) that it&#39;s the .BTF* sections that take up these extra 12k? Do<=
br>
you have some really complicated data structures in the file or<br>
something? Got a link to the source somewhere that isn&#39;t a web mailing<=
br>
list archive? :)<br>
<br></blockquote><div><br></div><div>Looks like the extra size is related t=
o BTF: there are 4 BTF sections that take 12.5K</div><div>=C2=A0 [ 7] .BTF =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PROGBITS =C2=A0 =C2=A0 =C2=
=A0 =C2=A00000000000000000 00144c 00175d 00 =C2=A0 =C2=A0 =C2=A00 =C2=A0 0 =
=C2=A01<br>=C2=A0 [ 8] .rel.BTF =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0REL =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0000000000000000 002bb0 000040 10 =
=C2=A0 =C2=A0 14 =C2=A0 7 =C2=A08<br>=C2=A0 [ 9] .BTF.ext =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0PROGBITS =C2=A0 =C2=A0 =C2=A0 =C2=A00000000000000000 002bf=
0 000cd0 00 =C2=A0 =C2=A0 =C2=A00 =C2=A0 0 =C2=A01<br>=C2=A0 [10] .rel.BTF.=
ext =C2=A0 =C2=A0 =C2=A0REL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 00000=
00000000000 0038c0 000ca0 10 =C2=A0 =C2=A0 14 =C2=A0 9 =C2=A08<br></div><di=
v><br></div><div>All the sources are at:</div><div>The branch without libbp=
f</div><div><a href=3D"https://github.com/daynix/qemu/tree/eBPF_RFC">https:=
//github.com/daynix/qemu/tree/eBPF_RFC</a><br></div><div>The branch with li=
bbpf</div><div><a href=3D"https://github.com/daynix/qemu/tree/eBPF_RFCv2">h=
ttps://github.com/daynix/qemu/tree/eBPF_RFCv2</a><br></div><div><br></div><=
div>all the eBPF-related code is under=20

qemu/ebpf directory.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
In any case, while I do think it smells a little of premature<br>
optimisation, you can of course strip the BTF information until you need<br=
>
it. Having it around makes debugging easier (bpftool will expand your<br>
map structures for you when dumping maps, and that sort of thing), but<br>
it&#39;s not really essential if you don&#39;t need CO-RE.<br>
<br>
&gt; This is only reason to prefer non-libbpf option for this specific eBPF=
<br>
<br>
You can still use libbpf without BTF. It&#39;s using BTF without libbpf tha=
t<br>
tends to not work so well...<br>
<br></blockquote><div><div><br></div><div>If we build the eBPF without &#39=
;-g&#39; or strip the BTF information out of the object file the libbpf cra=
shes right after issuing printout &quot;libbpf: BTF is required, but is mis=
sing or corrupted&quot;.<br></div></div><div>We did not investigate this to=
o deeply but on the first glance it looks like the presence of maps automat=
ically makes the libbpf to require BTF.</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
&gt;&gt; As a side note, though, instead of embedding the BPF program into =
a .h,<br>
&gt;&gt; you could simply ship it as a .o and load it from the file system.=
 We do<br>
&gt;&gt; that with xdp-tools and install the bpf object files into /usr/$LI=
B/bpf/.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Yes, we&#39;ve discussed this option and decided to go with embedding =
the BPF<br>
&gt; <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg02=
157.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archiv=
e/html/qemu-devel/2020-11/msg02157.html</a><br>
<br>
Right, okay. I&#39;ll note, though, that if your concern is that the BPF<br=
>
code should always match the rest of the code base, omitting the<br>
compilation if there&#39;s no Clang present seems like it could lead to<br>
problems :)<br>
<br>
Also, if you do go the embedded-bytecode route, you may want to have a<br>
look at the upstream &#39;skeleton&#39; concept. It takes a BPF object file=
 and<br>
automatically generates a header file that gives you direct access to<br>
maps, programs and global data in C. There are some examples in<br>
selftests/bpf on how to use it, but you basically just run<br>
&#39;bpftool gen skeleton mybpf.o&#39;.<br>
<br></blockquote><div><br></div><div>Indeed looks very interesting. We&#39;=
ve missed this feature.</div><div>Thank you very much!</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
-Toke<br>
<br>
</blockquote></div></div>

--0000000000003f95c505b5a2a995--

