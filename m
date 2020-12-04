Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AE52CE8C4
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 08:44:56 +0100 (CET)
Received: from localhost ([::1]:53690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl5lv-0004WG-LN
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 02:44:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1kl5jm-00044v-RH
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 02:42:42 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:35662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1kl5jf-00057I-Oi
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 02:42:42 -0500
Received: by mail-oi1-x241.google.com with SMTP id t9so5241830oic.2
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 23:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=STVRotktdgR2vTGxD0TFnTNBkSq5WESGwSNMq1vtcH4=;
 b=il8oFTIdTB6R+swfJ8wMNemqMOMqSHN9ua/01aH3mGVcrxAqmi+HrZ6GFkccomyiBg
 gxwT7Ngis3tO0jzNnt7Lbust247+z0SjG4uGO5kgJ2mWAIxI2rec1YW+eU3DvPzNMxZ6
 7X/opMs5QnatM5tBSZT4Im4lSYDtBY5ebxDNxWj1LF8ke/MsQN4AFeU2Kr7ir+aVtSKf
 f6pKRHq9PI7oJq08+L98okfdNqfdfIDllxA5w3gRnFIyfaSqbiHwLwQJRtgJ/ZCEicEF
 cIz3S9COos/7fpt3znYZtQ5inHx1S+Fbw9bnNRVk0mbnau36bRTVdg7UacnKKEU2LxDh
 hZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=STVRotktdgR2vTGxD0TFnTNBkSq5WESGwSNMq1vtcH4=;
 b=euEEMapD4oCxrgkBTdYFWryq6s+lmvvpn3sSy2C5hsfupMQUAtWjSM9cid5MnrOOIv
 NEAERfPDsrU8nXLQPTpFfY0pzSsOrA2Ggy+OyAEqhdU0UC7GXXYjaQUzTP0kJ+Uo7Nt6
 2hA+ym1X900qoqwyXoJZVp2JmoLe1Kg+xQUPeckM4BQNo9QzZnbmrPyz+jmnv3gfTDE0
 8Z1C4vViFdSPb5r8AomCdP12ITJqtv0JQc0RXuzvv+N5kvNvUv4IyzT+fy/MnMT/8W1s
 eo5OlINKHCL9elCKryBqOL514UTCmWr6+najhdgajBHvkE+Q5qLyQYr++6dpPtqfUNyE
 2/rA==
X-Gm-Message-State: AOAM531Sx1cRTxFucz8+SgJl+xhLZWZuBpgMRhkKbdjTnYORwG7qmxBT
 HP0HSlGh5RHfPlMfvzS3zyJqakGH70Hh4vBo/G57lQ==
X-Google-Smtp-Source: ABdhPJyZi9ejJmcoExGC7A6gGSozk1nj0Y0m24Wb2gmgKilpF1/n1A/uvJw/tnMzNB7Cuw87m3IjglqmeEJowXx1hrw=
X-Received: by 2002:aca:5204:: with SMTP id g4mr2314753oib.91.1607067754214;
 Thu, 03 Dec 2020 23:42:34 -0800 (PST)
MIME-Version: 1.0
References: <20201119111305.485202-1-andrew@daynix.com>
 <00e5b0a8-dfaa-2899-2501-cfe8249302ff@redhat.com>
 <87h7p4cmva.fsf@toke.dk>
In-Reply-To: <87h7p4cmva.fsf@toke.dk>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Fri, 4 Dec 2020 09:42:22 +0200
Message-ID: <CAOEp5Oe0AzZ40RK9EjNx0d2RVbteq_cR8zVhQH+_8Wm9x_TQgA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/5] eBPF RSS support for virtio-net
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000009ec95205b59e9ef0"
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
Cc: qemu-devel@nongnu.org, Yan Vugenfirer <yan@daynix.com>,
 Jason Wang <jasowang@redhat.com>, Andrew Melnychenko <andrew@daynix.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009ec95205b59e9ef0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 2, 2020 at 4:18 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redha=
t.com>
wrote:

> Jason Wang <jasowang@redhat.com> writes:
>
> > On 2020/11/19 =E4=B8=8B=E5=8D=887:13, Andrew Melnychenko wrote:
> >> This set of patches introduces the usage of eBPF for packet steering
> >> and RSS hash calculation:
> >> * RSS(Receive Side Scaling) is used to distribute network packets to
> >> guest virtqueues by calculating packet hash
> >> * Additionally adding support for the usage of RSS with vhost
> >>
> >> The eBPF works on kernels 5.8+
> >> On earlier kerneld it fails to load and the RSS feature is reported
> >> only without vhost and implemented in 'in-qemu' software.
> >>
> >> Implementation notes:
> >> Linux TAP TUNSETSTEERINGEBPF ioctl was used to set the eBPF program.
> >> Added libbpf dependency and eBPF support.
> >> The eBPF program is part of the qemu and presented as an array
> >> of BPF ELF file data.
> >> The compilation of eBPF is not part of QEMU build and can be done
> >> using provided Makefile.ebpf(need to adjust 'linuxhdrs').
> >> Added changes to virtio-net and vhost, primary eBPF RSS is used.
> >> 'in-qemu' RSS used in the case of hash population and as a fallback
> option.
> >> For vhost, the hash population feature is not reported to the guest.
> >>
> >> Please also see the documentation in PATCH 5/5.
> >>
> >> I am sending those patches as RFC to initiate the discussions and get
> >> feedback on the following points:
> >> * Fallback when eBPF is not supported by the kernel
> >> * Live migration to the kernel that doesn't have eBPF support
> >> * Integration with current QEMU build
> >> * Additional usage for eBPF for packet filtering
> >>
> >> Known issues:
> >> * hash population not supported by eBPF RSS: 'in-qemu' RSS used
> >> as a fallback, also, hash population feature is not reported to guests
> >> with vhost.
> >> * big-endian BPF support: for now, eBPF isn't supported on
> >> big-endian systems. Can be added in future if required.
> >> * huge .h file with eBPF binary. The size of .h file containing
> >> eBPF binary is currently ~5K lines, because the binary is built with
> debug information.
> >> The binary without debug/BTF info can't be loaded by libbpf.
> >> We're looking for possibilities to reduce the size of the .h files.
> >
> >
> > Adding Toke for sharing more idea from eBPF side.
> >
> > We had some discussion on the eBPF issues:
> >
> > 1) Whether or not to use libbpf. Toke strongly suggest to use libbpf
> > 2) Whether or not to use BTF. Toke confirmed that if we don't access an=
y
> > skb metadata, BTF is not strictly required for CO-RE. But it might stil=
l
> > useful for e.g debugging.
> > 3) About the huge (5K lines, see patch #2 Toke). Toke confirmed that we
> > can strip debug symbols, but Yuri found some sections can't be stripped=
,
> > we can keep discussing here.
>
> I just tried simply running 'strip' on a sample trivial XDP program,
> which brought its size down from ~5k to ~1k and preserved the BTF
> information without me having to do anything.
>

With our eBPF code the numbers are slightly different:
The code size without BTF: 7.5K (built without '-g')
Built with '-g': 45K
Stripped: 19K
The difference between 7.5 and 19K still seems significant, especially when
we do not use any kernel structures and do not need these BTF sections
This is only reason to prefer non-libbpf option for this specific eBPF



>
> As a side note, though, instead of embedding the BPF program into a .h,
> you could simply ship it as a .o and load it from the file system. We do
> that with xdp-tools and install the bpf object files into /usr/$LIB/bpf/.
>

Yes, we've discussed this option and decided to go with embedding the BPF
https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg02157.html


> -Toke
>
>

--0000000000009ec95205b59e9ef0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 2, 2020 at 4:18 PM Toke H=
=C3=B8iland-J=C3=B8rgensen &lt;<a href=3D"mailto:toke@redhat.com">toke@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com" target=3D"_blan=
k">jasowang@redhat.com</a>&gt; writes:<br>
<br>
&gt; On 2020/11/19 =E4=B8=8B=E5=8D=887:13, Andrew Melnychenko wrote:<br>
&gt;&gt; This set of patches introduces the usage of eBPF for packet steeri=
ng<br>
&gt;&gt; and RSS hash calculation:<br>
&gt;&gt; * RSS(Receive Side Scaling) is used to distribute network packets =
to<br>
&gt;&gt; guest virtqueues by calculating packet hash<br>
&gt;&gt; * Additionally adding support for the usage of RSS with vhost<br>
&gt;&gt;<br>
&gt;&gt; The eBPF works on kernels 5.8+<br>
&gt;&gt; On earlier kerneld it fails to load and the RSS feature is reporte=
d<br>
&gt;&gt; only without vhost and implemented in &#39;in-qemu&#39; software.<=
br>
&gt;&gt;<br>
&gt;&gt; Implementation notes:<br>
&gt;&gt; Linux TAP TUNSETSTEERINGEBPF ioctl was used to set the eBPF progra=
m.<br>
&gt;&gt; Added libbpf dependency and eBPF support.<br>
&gt;&gt; The eBPF program is part of the qemu and presented as an array<br>
&gt;&gt; of BPF ELF file data.<br>
&gt;&gt; The compilation of eBPF is not part of QEMU build and can be done<=
br>
&gt;&gt; using provided Makefile.ebpf(need to adjust &#39;linuxhdrs&#39;).<=
br>
&gt;&gt; Added changes to virtio-net and vhost, primary eBPF RSS is used.<b=
r>
&gt;&gt; &#39;in-qemu&#39; RSS used in the case of hash population and as a=
 fallback option.<br>
&gt;&gt; For vhost, the hash population feature is not reported to the gues=
t.<br>
&gt;&gt;<br>
&gt;&gt; Please also see the documentation in PATCH 5/5.<br>
&gt;&gt;<br>
&gt;&gt; I am sending those patches as RFC to initiate the discussions and =
get<br>
&gt;&gt; feedback on the following points:<br>
&gt;&gt; * Fallback when eBPF is not supported by the kernel<br>
&gt;&gt; * Live migration to the kernel that doesn&#39;t have eBPF support<=
br>
&gt;&gt; * Integration with current QEMU build<br>
&gt;&gt; * Additional usage for eBPF for packet filtering<br>
&gt;&gt;<br>
&gt;&gt; Known issues:<br>
&gt;&gt; * hash population not supported by eBPF RSS: &#39;in-qemu&#39; RSS=
 used<br>
&gt;&gt; as a fallback, also, hash population feature is not reported to gu=
ests<br>
&gt;&gt; with vhost.<br>
&gt;&gt; * big-endian BPF support: for now, eBPF isn&#39;t supported on<br>
&gt;&gt; big-endian systems. Can be added in future if required.<br>
&gt;&gt; * huge .h file with eBPF binary. The size of .h file containing<br=
>
&gt;&gt; eBPF binary is currently ~5K lines, because the binary is built wi=
th debug information.<br>
&gt;&gt; The binary without debug/BTF info can&#39;t be loaded by libbpf.<b=
r>
&gt;&gt; We&#39;re looking for possibilities to reduce the size of the .h f=
iles.<br>
&gt;<br>
&gt;<br>
&gt; Adding Toke for sharing more idea from eBPF side.<br>
&gt;<br>
&gt; We had some discussion on the eBPF issues:<br>
&gt;<br>
&gt; 1) Whether or not to use libbpf. Toke strongly suggest to use libbpf<b=
r>
&gt; 2) Whether or not to use BTF. Toke confirmed that if we don&#39;t acce=
ss any <br>
&gt; skb metadata, BTF is not strictly required for CO-RE. But it might sti=
ll <br>
&gt; useful for e.g debugging.<br>
&gt; 3) About the huge (5K lines, see patch #2 Toke). Toke confirmed that w=
e <br>
&gt; can strip debug symbols, but Yuri found some sections can&#39;t be str=
ipped, <br>
&gt; we can keep discussing here.<br>
<br>
I just tried simply running &#39;strip&#39; on a sample trivial XDP program=
,<br>
which brought its size down from ~5k to ~1k and preserved the BTF<br>
information without me having to do anything.<br></blockquote><div><br></di=
v><div>With our eBPF code the numbers are slightly different:</div><div>The=
 code size without BTF: 7.5K (built without &#39;-g&#39;)</div><div>Built w=
ith &#39;-g&#39;: 45K</div><div>Stripped: 19K</div><div>The difference betw=
een 7.5 and 19K still seems significant, especially when we do not use any =
kernel structures and do not need these BTF sections</div><div>This is only=
 reason to prefer non-libbpf option for this specific eBPF</div><div><br></=
div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
As a side note, though, instead of embedding the BPF program into a .h,<br>
you could simply ship it as a .o and load it from the file system. We do<br=
>
that with xdp-tools and install the bpf object files into /usr/$LIB/bpf/.<b=
r></blockquote><div><br></div><div>Yes, we&#39;ve discussed this option and=
 decided to go with embedding the BPF</div><div><a href=3D"https://lists.gn=
u.org/archive/html/qemu-devel/2020-11/msg02157.html">https://lists.gnu.org/=
archive/html/qemu-devel/2020-11/msg02157.html</a><br></div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-Toke<br>
<br>
</blockquote></div></div>

--0000000000009ec95205b59e9ef0--

