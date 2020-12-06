Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F80D2D068A
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Dec 2020 19:46:45 +0100 (CET)
Received: from localhost ([::1]:45282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klz3T-0001ml-QE
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 13:46:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1klz17-0001Ag-3G
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 13:44:17 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1klz13-0006Tl-Uw
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 13:44:16 -0500
Received: by mail-ot1-x342.google.com with SMTP id x13so2993491oto.8
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 10:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v4yXZ0PFH9ck6ODfiNT17No4GpOTsWe7cpEuqaXIgxk=;
 b=BrDvfj/nbcdgziv/eAInVdF5te2dHDnNPwXyIwvpYJupnltVznlp9kX+aB3E71+ZZ3
 Wx6AjTnbtd4hnYzkkoy3I73ZlF1hLz3jaFRJM+LKRtGAr0eKxPlEtwKWyyHyygMGdObQ
 Nn2fKqxdtrB9VSaJqt3YZ8yZrzHWnm008cSHTZJrJBdmTw0PrTQxXsHw1erRjAJGyEF6
 z+4EBatmhqEVGGeGYwFltOkXypjlJ4A/kI5hZvdRBJa3B+2ll8HVUvqWh+1wGhKZtWMI
 97GYctw0xG32iy64PgO4DsmmShyAIhy+wWdr/SvkPex09CleItvFvyEKzybfJzok8QNd
 QTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v4yXZ0PFH9ck6ODfiNT17No4GpOTsWe7cpEuqaXIgxk=;
 b=JRvOFJ6t5xiMm1ZK2i5lPiD2Cq5+YCkli8B+iHGKJOdwIv6Bycgc/SR3a/SykuyQAo
 5woASgDSykpaljohwBtszMFO5X/36vt2aH+fCUDFZ2pnNZHeGRsWUqc+6X1M2yXgWytz
 mUloE1hOE2BPr1ga/mZfp2qxEBfzFbrgs1P4glGu+aMtVesLjoTGgt1XD1oIHDQLed3C
 3IHU397SuZCBhAsQ30q8403ABiIdLV0x5Kn5cHJX6TXWqBxEixovlXfbehVOeNuX1b+v
 oH7Qq3ANm7BJK7wQZpUm8eznetlg4oewNadi5Db5syOUmq+OCkbkjrxiXbOGDJPQ/gzR
 aYYQ==
X-Gm-Message-State: AOAM531vZukz9FQDRueBWqIrLmWltL7vGglQROEDgqSvHmcG/mst9+vW
 b5K2TiMAjemdHFAjmSV4gkeHNbiMVqRdJLaZShVLGA==
X-Google-Smtp-Source: ABdhPJxDnIBTS4lF94xFkw6tlVq19rB0uQr7i+wd0CZeP12P6dex/F/KZd8o9HD96L3M0H8MDGxVmbyyYqUbwPZdyxs=
X-Received: by 2002:a9d:4715:: with SMTP id a21mr10821791otf.220.1607280252329; 
 Sun, 06 Dec 2020 10:44:12 -0800 (PST)
MIME-Version: 1.0
References: <20201119111305.485202-1-andrew@daynix.com>
 <00e5b0a8-dfaa-2899-2501-cfe8249302ff@redhat.com>
 <87h7p4cmva.fsf@toke.dk>
 <CAOEp5Oe0AzZ40RK9EjNx0d2RVbteq_cR8zVhQH+_8Wm9x_TQgA@mail.gmail.com>
 <87im9h9933.fsf@toke.dk>
 <CAOEp5OcVPcTPFhqapEjAykhU2YzajmfmxG5MoU6Leg6Qw5TVbw@mail.gmail.com>
 <87v9dh7jy5.fsf@toke.dk>
In-Reply-To: <87v9dh7jy5.fsf@toke.dk>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Sun, 6 Dec 2020 20:44:01 +0200
Message-ID: <CAOEp5OdrZSmSHZKhzRRDAP-iQo95oycsHt2BqAn5SHBc-=100A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/5] eBPF RSS support for virtio-net
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007eb85d05b5d01877"
Received-SPF: none client-ip=2607:f8b0:4864:20::342;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-ot1-x342.google.com
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

--0000000000007eb85d05b5d01877
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 4, 2020 at 3:57 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redha=
t.com>
wrote:

> Yuri Benditovich <yuri.benditovich@daynix.com> writes:
>
> > On Fri, Dec 4, 2020 at 12:09 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@=
redhat.com>
> > wrote:
> >
> >> Yuri Benditovich <yuri.benditovich@daynix.com> writes:
> >>
> >> > On Wed, Dec 2, 2020 at 4:18 PM Toke H=C3=B8iland-J=C3=B8rgensen <
> toke@redhat.com>
> >> > wrote:
> >> >
> >> >> Jason Wang <jasowang@redhat.com> writes:
> >> >>
> >> >> > On 2020/11/19 =E4=B8=8B=E5=8D=887:13, Andrew Melnychenko wrote:
> >> >> >> This set of patches introduces the usage of eBPF for packet
> steering
> >> >> >> and RSS hash calculation:
> >> >> >> * RSS(Receive Side Scaling) is used to distribute network packet=
s
> to
> >> >> >> guest virtqueues by calculating packet hash
> >> >> >> * Additionally adding support for the usage of RSS with vhost
> >> >> >>
> >> >> >> The eBPF works on kernels 5.8+
> >> >> >> On earlier kerneld it fails to load and the RSS feature is
> reported
> >> >> >> only without vhost and implemented in 'in-qemu' software.
> >> >> >>
> >> >> >> Implementation notes:
> >> >> >> Linux TAP TUNSETSTEERINGEBPF ioctl was used to set the eBPF
> program.
> >> >> >> Added libbpf dependency and eBPF support.
> >> >> >> The eBPF program is part of the qemu and presented as an array
> >> >> >> of BPF ELF file data.
> >> >> >> The compilation of eBPF is not part of QEMU build and can be don=
e
> >> >> >> using provided Makefile.ebpf(need to adjust 'linuxhdrs').
> >> >> >> Added changes to virtio-net and vhost, primary eBPF RSS is used.
> >> >> >> 'in-qemu' RSS used in the case of hash population and as a
> fallback
> >> >> option.
> >> >> >> For vhost, the hash population feature is not reported to the
> guest.
> >> >> >>
> >> >> >> Please also see the documentation in PATCH 5/5.
> >> >> >>
> >> >> >> I am sending those patches as RFC to initiate the discussions an=
d
> get
> >> >> >> feedback on the following points:
> >> >> >> * Fallback when eBPF is not supported by the kernel
> >> >> >> * Live migration to the kernel that doesn't have eBPF support
> >> >> >> * Integration with current QEMU build
> >> >> >> * Additional usage for eBPF for packet filtering
> >> >> >>
> >> >> >> Known issues:
> >> >> >> * hash population not supported by eBPF RSS: 'in-qemu' RSS used
> >> >> >> as a fallback, also, hash population feature is not reported to
> >> guests
> >> >> >> with vhost.
> >> >> >> * big-endian BPF support: for now, eBPF isn't supported on
> >> >> >> big-endian systems. Can be added in future if required.
> >> >> >> * huge .h file with eBPF binary. The size of .h file containing
> >> >> >> eBPF binary is currently ~5K lines, because the binary is built
> with
> >> >> debug information.
> >> >> >> The binary without debug/BTF info can't be loaded by libbpf.
> >> >> >> We're looking for possibilities to reduce the size of the .h
> files.
> >> >> >
> >> >> >
> >> >> > Adding Toke for sharing more idea from eBPF side.
> >> >> >
> >> >> > We had some discussion on the eBPF issues:
> >> >> >
> >> >> > 1) Whether or not to use libbpf. Toke strongly suggest to use
> libbpf
> >> >> > 2) Whether or not to use BTF. Toke confirmed that if we don't
> access
> >> any
> >> >> > skb metadata, BTF is not strictly required for CO-RE. But it migh=
t
> >> still
> >> >> > useful for e.g debugging.
> >> >> > 3) About the huge (5K lines, see patch #2 Toke). Toke confirmed
> that
> >> we
> >> >> > can strip debug symbols, but Yuri found some sections can't be
> >> stripped,
> >> >> > we can keep discussing here.
> >> >>
> >> >> I just tried simply running 'strip' on a sample trivial XDP program=
,
> >> >> which brought its size down from ~5k to ~1k and preserved the BTF
> >> >> information without me having to do anything.
> >> >>
> >> >
> >> > With our eBPF code the numbers are slightly different:
> >> > The code size without BTF: 7.5K (built without '-g')
> >> > Built with '-g': 45K
> >> > Stripped: 19K
> >> > The difference between 7.5 and 19K still seems significant, especial=
ly
> >> when
> >> > we do not use any kernel structures and do not need these BTF sectio=
ns
> >>
> >> That does seem like a lot of BTF information. Did you confirm (with
> >> objdump) that it's the .BTF* sections that take up these extra 12k? Do
> >> you have some really complicated data structures in the file or
> >> something? Got a link to the source somewhere that isn't a web mailing
> >> list archive? :)
> >>
> >>
> > Looks like the extra size is related to BTF: there are 4 BTF sections
> that
> > take 12.5K
> >   [ 7] .BTF              PROGBITS        0000000000000000 00144c 00175d
> 00
> >      0   0  1
> >   [ 8] .rel.BTF          REL             0000000000000000 002bb0 000040
> 10
> >     14   7  8
> >   [ 9] .BTF.ext          PROGBITS        0000000000000000 002bf0 000cd0
> 00
> >      0   0  1
> >   [10] .rel.BTF.ext      REL             0000000000000000 0038c0 000ca0
> 10
> >     14   9  8
>
> Right, okay, that does not look completely outrageous with the amount of
> code and type information you have in that file.
>
> > All the sources are at:
> > The branch without libbpf
> > https://github.com/daynix/qemu/tree/eBPF_RFC
> > The branch with libbpf
> > https://github.com/daynix/qemu/tree/eBPF_RFCv2
> >
> > all the eBPF-related code is under qemu/ebpf directory.
>
> Ah, cool, thanks!
>
> >> In any case, while I do think it smells a little of premature
> >> optimisation, you can of course strip the BTF information until you ne=
ed
> >> it. Having it around makes debugging easier (bpftool will expand your
> >> map structures for you when dumping maps, and that sort of thing), but
> >> it's not really essential if you don't need CO-RE.
> >>
> >> > This is only reason to prefer non-libbpf option for this specific eB=
PF
> >>
> >> You can still use libbpf without BTF. It's using BTF without libbpf th=
at
> >> tends to not work so well...
> >>
> >>
> > If we build the eBPF without '-g' or strip the BTF information out of t=
he
> > object file the libbpf crashes right after issuing printout "libbpf: BT=
F
> is
> > required, but is missing or corrupted".
> > We did not investigate this too deeply but on the first glance it looks
> > like the presence of maps automatically makes the libbpf to require BTF=
.
>
> Ah, right. Well, you're using the BTF-based map definition syntax. So
> yeah, that does require BTF: The __uint() and __type() macros really
> expand to type definitions that are specifically crafted to be embedded
> as BTF in the file.
>

Yes, now the EBPF built without '-g' also can be loaded via libbpf and we
can enable/disable BTF as we need.
Again, thank you very much!



>
> You could use the old-style map definitions that don't use BTF[0], but
> BTF is really where things are going in BPF-land so I think longer term
> you'll probably end up needing it anyway. So going to this much trouble
> just to save 10k on binary size seems to me like it's a decision you'll
> end up regretting :)
>
> [0]
> https://github.com/xdp-project/xdp-tutorial/blob/master/basic03-map-count=
er/xdp_prog_kern.c#L11
>
> -Toke
>
>

--0000000000007eb85d05b5d01877
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 4, 2020 at 3:57 PM Toke H=
=C3=B8iland-J=C3=B8rgensen &lt;<a href=3D"mailto:toke@redhat.com">toke@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Yuri Benditovich &lt;<a href=3D"mailto:yuri.benditovich@daynix.com" t=
arget=3D"_blank">yuri.benditovich@daynix.com</a>&gt; writes:<br>
<br>
&gt; On Fri, Dec 4, 2020 at 12:09 PM Toke H=C3=B8iland-J=C3=B8rgensen &lt;<=
a href=3D"mailto:toke@redhat.com" target=3D"_blank">toke@redhat.com</a>&gt;=
<br>
&gt; wrote:<br>
&gt;<br>
&gt;&gt; Yuri Benditovich &lt;<a href=3D"mailto:yuri.benditovich@daynix.com=
" target=3D"_blank">yuri.benditovich@daynix.com</a>&gt; writes:<br>
&gt;&gt;<br>
&gt;&gt; &gt; On Wed, Dec 2, 2020 at 4:18 PM Toke H=C3=B8iland-J=C3=B8rgens=
en &lt;<a href=3D"mailto:toke@redhat.com" target=3D"_blank">toke@redhat.com=
</a>&gt;<br>
&gt;&gt; &gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com" tar=
get=3D"_blank">jasowang@redhat.com</a>&gt; writes:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; On 2020/11/19 =E4=B8=8B=E5=8D=887:13, Andrew Melnych=
enko wrote:<br>
&gt;&gt; &gt;&gt; &gt;&gt; This set of patches introduces the usage of eBPF=
 for packet steering<br>
&gt;&gt; &gt;&gt; &gt;&gt; and RSS hash calculation:<br>
&gt;&gt; &gt;&gt; &gt;&gt; * RSS(Receive Side Scaling) is used to distribut=
e network packets to<br>
&gt;&gt; &gt;&gt; &gt;&gt; guest virtqueues by calculating packet hash<br>
&gt;&gt; &gt;&gt; &gt;&gt; * Additionally adding support for the usage of R=
SS with vhost<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; The eBPF works on kernels 5.8+<br>
&gt;&gt; &gt;&gt; &gt;&gt; On earlier kerneld it fails to load and the RSS =
feature is reported<br>
&gt;&gt; &gt;&gt; &gt;&gt; only without vhost and implemented in &#39;in-qe=
mu&#39; software.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; Implementation notes:<br>
&gt;&gt; &gt;&gt; &gt;&gt; Linux TAP TUNSETSTEERINGEBPF ioctl was used to s=
et the eBPF program.<br>
&gt;&gt; &gt;&gt; &gt;&gt; Added libbpf dependency and eBPF support.<br>
&gt;&gt; &gt;&gt; &gt;&gt; The eBPF program is part of the qemu and present=
ed as an array<br>
&gt;&gt; &gt;&gt; &gt;&gt; of BPF ELF file data.<br>
&gt;&gt; &gt;&gt; &gt;&gt; The compilation of eBPF is not part of QEMU buil=
d and can be done<br>
&gt;&gt; &gt;&gt; &gt;&gt; using provided Makefile.ebpf(need to adjust &#39=
;linuxhdrs&#39;).<br>
&gt;&gt; &gt;&gt; &gt;&gt; Added changes to virtio-net and vhost, primary e=
BPF RSS is used.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &#39;in-qemu&#39; RSS used in the case of hash p=
opulation and as a fallback<br>
&gt;&gt; &gt;&gt; option.<br>
&gt;&gt; &gt;&gt; &gt;&gt; For vhost, the hash population feature is not re=
ported to the guest.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; Please also see the documentation in PATCH 5/5.<=
br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; I am sending those patches as RFC to initiate th=
e discussions and get<br>
&gt;&gt; &gt;&gt; &gt;&gt; feedback on the following points:<br>
&gt;&gt; &gt;&gt; &gt;&gt; * Fallback when eBPF is not supported by the ker=
nel<br>
&gt;&gt; &gt;&gt; &gt;&gt; * Live migration to the kernel that doesn&#39;t =
have eBPF support<br>
&gt;&gt; &gt;&gt; &gt;&gt; * Integration with current QEMU build<br>
&gt;&gt; &gt;&gt; &gt;&gt; * Additional usage for eBPF for packet filtering=
<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; Known issues:<br>
&gt;&gt; &gt;&gt; &gt;&gt; * hash population not supported by eBPF RSS: &#3=
9;in-qemu&#39; RSS used<br>
&gt;&gt; &gt;&gt; &gt;&gt; as a fallback, also, hash population feature is =
not reported to<br>
&gt;&gt; guests<br>
&gt;&gt; &gt;&gt; &gt;&gt; with vhost.<br>
&gt;&gt; &gt;&gt; &gt;&gt; * big-endian BPF support: for now, eBPF isn&#39;=
t supported on<br>
&gt;&gt; &gt;&gt; &gt;&gt; big-endian systems. Can be added in future if re=
quired.<br>
&gt;&gt; &gt;&gt; &gt;&gt; * huge .h file with eBPF binary. The size of .h =
file containing<br>
&gt;&gt; &gt;&gt; &gt;&gt; eBPF binary is currently ~5K lines, because the =
binary is built with<br>
&gt;&gt; &gt;&gt; debug information.<br>
&gt;&gt; &gt;&gt; &gt;&gt; The binary without debug/BTF info can&#39;t be l=
oaded by libbpf.<br>
&gt;&gt; &gt;&gt; &gt;&gt; We&#39;re looking for possibilities to reduce th=
e size of the .h files.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Adding Toke for sharing more idea from eBPF side.<br=
>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; We had some discussion on the eBPF issues:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; 1) Whether or not to use libbpf. Toke strongly sugge=
st to use libbpf<br>
&gt;&gt; &gt;&gt; &gt; 2) Whether or not to use BTF. Toke confirmed that if=
 we don&#39;t access<br>
&gt;&gt; any<br>
&gt;&gt; &gt;&gt; &gt; skb metadata, BTF is not strictly required for CO-RE=
. But it might<br>
&gt;&gt; still<br>
&gt;&gt; &gt;&gt; &gt; useful for e.g debugging.<br>
&gt;&gt; &gt;&gt; &gt; 3) About the huge (5K lines, see patch #2 Toke). Tok=
e confirmed that<br>
&gt;&gt; we<br>
&gt;&gt; &gt;&gt; &gt; can strip debug symbols, but Yuri found some section=
s can&#39;t be<br>
&gt;&gt; stripped,<br>
&gt;&gt; &gt;&gt; &gt; we can keep discussing here.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I just tried simply running &#39;strip&#39; on a sample t=
rivial XDP program,<br>
&gt;&gt; &gt;&gt; which brought its size down from ~5k to ~1k and preserved=
 the BTF<br>
&gt;&gt; &gt;&gt; information without me having to do anything.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; With our eBPF code the numbers are slightly different:<br>
&gt;&gt; &gt; The code size without BTF: 7.5K (built without &#39;-g&#39;)<=
br>
&gt;&gt; &gt; Built with &#39;-g&#39;: 45K<br>
&gt;&gt; &gt; Stripped: 19K<br>
&gt;&gt; &gt; The difference between 7.5 and 19K still seems significant, e=
specially<br>
&gt;&gt; when<br>
&gt;&gt; &gt; we do not use any kernel structures and do not need these BTF=
 sections<br>
&gt;&gt;<br>
&gt;&gt; That does seem like a lot of BTF information. Did you confirm (wit=
h<br>
&gt;&gt; objdump) that it&#39;s the .BTF* sections that take up these extra=
 12k? Do<br>
&gt;&gt; you have some really complicated data structures in the file or<br=
>
&gt;&gt; something? Got a link to the source somewhere that isn&#39;t a web=
 mailing<br>
&gt;&gt; list archive? :)<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; Looks like the extra size is related to BTF: there are 4 BTF sections =
that<br>
&gt; take 12.5K<br>
&gt;=C2=A0 =C2=A0[ 7] .BTF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
PROGBITS=C2=A0 =C2=A0 =C2=A0 =C2=A0 0000000000000000 00144c 00175d 00<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A00=C2=A0 1<br>
&gt;=C2=A0 =C2=A0[ 8] .rel.BTF=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 REL=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00000000000000000 002bb0 000040 10<=
br>
&gt;=C2=A0 =C2=A0 =C2=A014=C2=A0 =C2=A07=C2=A0 8<br>
&gt;=C2=A0 =C2=A0[ 9] .BTF.ext=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PROGBITS=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0000000000000000 002bf0 000cd0 00<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A00=C2=A0 1<br>
&gt;=C2=A0 =C2=A0[10] .rel.BTF.ext=C2=A0 =C2=A0 =C2=A0 REL=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00000000000000000 0038c0 000ca0 10<br>
&gt;=C2=A0 =C2=A0 =C2=A014=C2=A0 =C2=A09=C2=A0 8<br>
<br>
Right, okay, that does not look completely outrageous with the amount of<br=
>
code and type information you have in that file.<br>
<br>
&gt; All the sources are at:<br>
&gt; The branch without libbpf<br>
&gt; <a href=3D"https://github.com/daynix/qemu/tree/eBPF_RFC" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/daynix/qemu/tree/eBPF_RFC</a><br=
>
&gt; The branch with libbpf<br>
&gt; <a href=3D"https://github.com/daynix/qemu/tree/eBPF_RFCv2" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/daynix/qemu/tree/eBPF_RFCv2</a=
><br>
&gt;<br>
&gt; all the eBPF-related code is under qemu/ebpf directory.<br>
<br>
Ah, cool, thanks!<br>
<br>
&gt;&gt; In any case, while I do think it smells a little of premature<br>
&gt;&gt; optimisation, you can of course strip the BTF information until yo=
u need<br>
&gt;&gt; it. Having it around makes debugging easier (bpftool will expand y=
our<br>
&gt;&gt; map structures for you when dumping maps, and that sort of thing),=
 but<br>
&gt;&gt; it&#39;s not really essential if you don&#39;t need CO-RE.<br>
&gt;&gt;<br>
&gt;&gt; &gt; This is only reason to prefer non-libbpf option for this spec=
ific eBPF<br>
&gt;&gt;<br>
&gt;&gt; You can still use libbpf without BTF. It&#39;s using BTF without l=
ibbpf that<br>
&gt;&gt; tends to not work so well...<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; If we build the eBPF without &#39;-g&#39; or strip the BTF information=
 out of the<br>
&gt; object file the libbpf crashes right after issuing printout &quot;libb=
pf: BTF is<br>
&gt; required, but is missing or corrupted&quot;.<br>
&gt; We did not investigate this too deeply but on the first glance it look=
s<br>
&gt; like the presence of maps automatically makes the libbpf to require BT=
F.<br>
<br>
Ah, right. Well, you&#39;re using the BTF-based map definition syntax. So<b=
r>
yeah, that does require BTF: The __uint() and __type() macros really<br>
expand to type definitions that are specifically crafted to be embedded<br>
as BTF in the file.<br></blockquote><div><br></div><div>Yes, now the EBPF b=
uilt without &#39;-g&#39; also can be loaded via libbpf and we can enable/d=
isable BTF as we need.=C2=A0</div><div></div><div>Again, thank you very muc=
h!</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
You could use the old-style map definitions that don&#39;t use BTF[0], but<=
br>
BTF is really where things are going in BPF-land so I think longer term<br>
you&#39;ll probably end up needing it anyway. So going to this much trouble=
<br>
just to save 10k on binary size seems to me like it&#39;s a decision you&#3=
9;ll<br>
end up regretting :)<br>
<br>
[0] <a href=3D"https://github.com/xdp-project/xdp-tutorial/blob/master/basi=
c03-map-counter/xdp_prog_kern.c#L11" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/xdp-project/xdp-tutorial/blob/master/basic03-map-counter/=
xdp_prog_kern.c#L11</a><br>
<br>
-Toke<br>
<br>
</blockquote></div></div>

--0000000000007eb85d05b5d01877--

