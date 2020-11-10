Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C82E12AD0C3
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 09:02:46 +0100 (CET)
Received: from localhost ([::1]:48480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcOc1-0007Cc-TW
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 03:02:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1kcOaF-0006en-No
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 03:00:56 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:40759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1kcOa9-0005HC-4E
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 03:00:55 -0500
Received: by mail-oi1-x22b.google.com with SMTP id m143so13352980oig.7
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 00:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kxtvltsgpRl7UWAPIOo9hWqfT60JJDdOy+JW6BeGTBE=;
 b=us4Td8Ngm/f7bsKVpVe8tvpIUz/xK+Yf3z7WoLA8buEEaM9QTDROaCgKUfLfMRswTW
 hDaMlnxYs25DLFoXsYz1SVe8X8zpNZA6dcfRPS3YMVFefOaTWSLBVhyTTOlBGcV2KPVZ
 ok/gQWFFLTeAdLlLkyRCIzy0m7byvUWMAa7NsNwuHWU7RKM+6dZfXF598fmCUb4/VZL9
 RedNKFHl5spEO2Uyq5S55GHfNn8QKbry+ngUu1kf0CaHvqbL6AsegBlIvHvbGUpzyNCT
 aXyZ87e1nYgsGBfmhY8w75bqcaUltM9/kGiMN6N5OCzcO66BqzltAAqfB6tO56OjQEqt
 H0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kxtvltsgpRl7UWAPIOo9hWqfT60JJDdOy+JW6BeGTBE=;
 b=TVL+pUtMD4jeN6lwbzc7lfJufIs97ACQ4iRPiOnYtPk+TsdJrNpnsi3MHDR+QqsBAq
 /Hg8qFj808xIxnOQJyeVJqVDpRQgehjaKNp+v+YQlv2qR+z2i/99oLfq6YmmFNOu/wYD
 nwmC+F8Kq504RHR0ReAxx6PPR4KcpCV1JC03s/fgIiojjSXAceXZ82oIS4EcJ3oImN/j
 IGmlV4IppPSA7pyEDdyaBR1i88W2AvyFRl4bXAFoTWEUMYjXAeJghMbCdQzUfT86exa9
 FPWdvgKz7dsUPOhJIaV1QIidCL/FdP4pyznqUK9xu9cVOme62HEKIKEx56oFJ9uYWDei
 9BeQ==
X-Gm-Message-State: AOAM533zme2m3Q84oMBiSFaNGwZ++L/8+43UDoRUnDyZnqDB042rvUXF
 9y/lxxrdLB8DcMdBNxbDQFR0BcSbVzgv9VxhARZoug==
X-Google-Smtp-Source: ABdhPJx7xzynioh3jGRHtaw7sckC13uUG7xUmtIxQ8o98npTJRYYvFjK/OX/efcx2nJfr4eCfx1v425cDJ85yk+j6qQ=
X-Received: by 2002:aca:eac3:: with SMTP id i186mr2034315oih.54.1604995247466; 
 Tue, 10 Nov 2020 00:00:47 -0800 (PST)
MIME-Version: 1.0
References: <20201102185115.7425-1-andrew@daynix.com>
 <0164a42f-4542-6f3e-bd71-3319dfaae190@redhat.com>
 <CAOEp5Oe3btwgPcOA6v=kK9s2to=x2Hg6Qw2iCFXOOWZs49s=-Q@mail.gmail.com>
 <caa38709-88f1-bd6d-3ff9-61e64c3aa51f@redhat.com>
 <20201104093155.GB565323@redhat.com>
 <cc53c09c-9b3c-63e1-6df3-b5fc949e626c@redhat.com>
 <20201105100109.GE630142@redhat.com>
 <20201105131938.GK630142@redhat.com>
 <CAOEp5Oe-Ct-ed5D3UjLZN=iP2W81ta=rTqMjiQ-8vVajag=GfA@mail.gmail.com>
 <16bfe468-b0f8-396a-08e9-8917423909e5@redhat.com>
 <CAOEp5Ofb7zK6A+zwbubVtitCrVTe_zLtZDYc0uExvgb+F_p9Zg@mail.gmail.com>
 <c865f892-c534-8f8d-624f-6aafcea26a1b@redhat.com>
In-Reply-To: <c865f892-c534-8f8d-624f-6aafcea26a1b@redhat.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Tue, 10 Nov 2020 10:00:35 +0200
Message-ID: <CAOEp5OdW9DgGZfaNdJJmuCpbaEXu5GwzSs0gYaEzqe3dd6YG_w@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] eBPF RSS support for virtio-net
To: Jason Wang <jasowang@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000977bdf05b3bc1381"
Received-SPF: none client-ip=2607:f8b0:4864:20::22b;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-oi1-x22b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000977bdf05b3bc1381
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2020 at 4:23 AM Jason Wang <jasowang@redhat.com> wrote:

>
> On 2020/11/9 =E4=B8=8B=E5=8D=889:33, Yuri Benditovich wrote:
> >
> >
> > On Mon, Nov 9, 2020 at 4:14 AM Jason Wang <jasowang@redhat.com
> > <mailto:jasowang@redhat.com>> wrote:
> >
> >
> >     On 2020/11/5 =E4=B8=8B=E5=8D=8811:13, Yuri Benditovich wrote:
> >     > First of all, thank you for all your feedbacks
> >     >
> >     > Please help me to summarize and let us understand better what we
> >     do in v2:
> >     > Major questions are:
> >     > 1. Building eBPF from source during qemu build vs. regenerating
> >     it on
> >     > demand and keeping in the repository
> >     > Solution 1a (~ as in v1): keep instructions or ELF in H file,
> >     generate
> >     > it out of qemu build. In general we'll need to have BE and LE
> >     binaries.
> >     > Solution 1b: build ELF or instructions during QEMU build if llvm =
+
> >     > clang exist. Then we will have only one (BE or LE, depending on
> >     > current QEMU build)
> >     > We agree with any solution - I believe you know the requirements
> >     better.
> >
> >
> >     I think we can go with 1a. (See Danial's comment)
> >
> >
> >     >
> >     > 2. Use libbpf or not
> >     > In general we do not see any advantage of using libbpf. It works
> >     with
> >     > object files (does ELF parsing at time of loading), but it does
> >     not do
> >     > any magic.
> >     > Solution 2a. Switch to libbpf, generate object files (LE and BE)
> >     from
> >     > source, keep them inside QEMU (~8k each) or aside
> >
> >
> >     Can we simply use dynamic linking here?
> >
> >
> > Can you please explain, where exactly you suggest to use dynamic linkin=
g?
>
>
> Yes. If I understand your 2a properly, you meant static linking of
> libbpf. So what I want to ask is the possibility of dynamic linking of
> libbpf here.
>
>
As Daniel explained above, QEMU is always linked dynamically vs libraries.
Also I see the libbpf package does not even contain the static library.
If the build environment contains libbpf, the libbpf.so becomes runtime
dependency, just as with other libs.


>
> >
> >     > Solution 2b. (as in v1) Use python script to parse object ->
> >     > instructions (~2k each)
> >     > We'd prefer not to use libbpf at the moment.
> >     > If due to some unknown reason we'll find it useful in future, we
> >     can
> >     > switch to it, this does not create any incompatibility. Then
> >     this will
> >     > create a dependency on libbpf.so
> >
> >
> >     I think we need to care about compatibility. E.g we need to enable
> >     BTF
> >     so I don't know how hard if we add BTF support in the current
> >     design. It
> >     would be probably OK it's not a lot of effort.
> >
> >
> > As far as we understand BTF helps in BPF debugging and libbpf supports
> > it as is.
> > Without libbpf we in v1 load the BPF instructions only.
> > If you think the BTF is mandatory (BTW, why?) I think it is better to
> > switch to libbpf and keep the entire ELF in the qemu data.
>
>
> It is used to make sure the BPF can do compile once run everywhere.
>
> This is explained in detail in here:
>
> https://facebookmicrosites.github.io/bpf/blog/2020/02/19/bpf-portability-=
and-co-re.html
> .
>
>
Thank you, then there is no question, we need to use libbpf.


> Thanks
>
>
> >
> >
> >     >
> >     > 3. Keep instructions or ELF inside QEMU or as separate external
> file
> >     > Solution 3a (~as in v1): Built-in array of instructions or ELF.
> >     If we
> >     > generate them out of QEMU build - keep 2 arrays or instructions
> >     or ELF
> >     > (BE and LE),
> >     > Solution 3b: Install them as separate files (/usr/share/qemu).
> >     > We'd prefer 3a:
> >     >  Then there is a guarantee that the eBPF is built with exactly th=
e
> >     > same config structures as QEMU (qemu creates a mapping of its
> >     > structures, eBPF uses them).
> >     >  No need to take care on scenarios like 'file not found', 'file
> >     is not
> >     > suitable' etc
> >
> >
> >     Yes, let's go 3a for upstream.
> >
> >
> >     >
> >     > 4. Is there some real request to have the eBPF for big-endian?
> >     > If no, we can enable eBPF only for LE builds
> >
> >
> >     We can go with LE first.
> >
> >     Thanks
> >
> >
> >     >
> >     > Jason, Daniel, Michael
> >     > Can you please let us know what you think and why?
> >     >
> >     > On Thu, Nov 5, 2020 at 3:19 PM Daniel P. Berrang=C3=A9
> >     <berrange@redhat.com <mailto:berrange@redhat.com>
> >     > <mailto:berrange@redhat.com <mailto:berrange@redhat.com>>> wrote:
> >     >
> >     >     On Thu, Nov 05, 2020 at 10:01:09AM +0000, Daniel P. Berrang=
=C3=A9
> >     wrote:
> >     >     > On Thu, Nov 05, 2020 at 11:46:18AM +0800, Jason Wang wrote:
> >     >     > >
> >     >     > > On 2020/11/4 =E4=B8=8B=E5=8D=885:31, Daniel P. Berrang=C3=
=A9 wrote:
> >     >     > > > On Wed, Nov 04, 2020 at 10:07:52AM +0800, Jason Wang
> >     wrote:
> >     >     > > > > On 2020/11/3 =E4=B8=8B=E5=8D=886:32, Yuri Benditovich=
 wrote:
> >     >     > > > > >
> >     >     > > > > > On Tue, Nov 3, 2020 at 11:02 AM Jason Wang
> >     >     <jasowang@redhat.com <mailto:jasowang@redhat.com>
> >     <mailto:jasowang@redhat.com <mailto:jasowang@redhat.com>>
> >     >     > > > > > <mailto:jasowang@redhat.com
> >     <mailto:jasowang@redhat.com>
> >     >     <mailto:jasowang@redhat.com <mailto:jasowang@redhat.com>>>>
> >     wrote:
> >     >     > > > > >
> >     >     > > > > >
> >     >     > > > > >      On 2020/11/3 =E4=B8=8A=E5=8D=882:51, Andrew Me=
lnychenko wrote:
> >     >     > > > > >      > Basic idea is to use eBPF to calculate and
> >     steer
> >     >     packets in TAP.
> >     >     > > > > >      > RSS(Receive Side Scaling) is used to
> distribute
> >     >     network packets
> >     >     > > > > >      to guest virtqueues
> >     >     > > > > >      > by calculating packet hash.
> >     >     > > > > >      > eBPF RSS allows us to use RSS with vhost TAP=
.
> >     >     > > > > >      >
> >     >     > > > > >      > This set of patches introduces the usage of
> >     eBPF
> >     >     for packet steering
> >     >     > > > > >      > and RSS hash calculation:
> >     >     > > > > >      > * RSS(Receive Side Scaling) is used to
> >     distribute
> >     >     network packets to
> >     >     > > > > >      > guest virtqueues by calculating packet hash
> >     >     > > > > >      > * eBPF RSS suppose to be faster than already
> >     >     existing 'software'
> >     >     > > > > >      > implementation in QEMU
> >     >     > > > > >      > * Additionally adding support for the usage =
of
> >     >     RSS with vhost
> >     >     > > > > >      >
> >     >     > > > > >      > Supported kernels: 5.8+
> >     >     > > > > >      >
> >     >     > > > > >      > Implementation notes:
> >     >     > > > > >      > Linux TAP TUNSETSTEERINGEBPF ioctl was used =
to
> >     >     set the eBPF program.
> >     >     > > > > >      > Added eBPF support to qemu directly through =
a
> >     >     system call, see the
> >     >     > > > > >      > bpf(2) for details.
> >     >     > > > > >      > The eBPF program is part of the qemu and
> >     >     presented as an array
> >     >     > > > > >      of bpf
> >     >     > > > > >      > instructions.
> >     >     > > > > >      > The program can be recompiled by provided
> >     >     Makefile.ebpf(need to
> >     >     > > > > >      adjust
> >     >     > > > > >      > 'linuxhdrs'),
> >     >     > > > > >      > although it's not required to build QEMU wit=
h
> >     >     eBPF support.
> >     >     > > > > >      > Added changes to virtio-net and vhost, prima=
ry
> >     >     eBPF RSS is used.
> >     >     > > > > >      > 'Software' RSS used in the case of hash
> >     >     population and as a
> >     >     > > > > >      fallback option.
> >     >     > > > > >      > For vhost, the hash population feature is no=
t
> >     >     reported to the guest.
> >     >     > > > > >      >
> >     >     > > > > >      > Please also see the documentation in PATCH
> 6/6.
> >     >     > > > > >      >
> >     >     > > > > >      > I am sending those patches as RFC to
> >     initiate the
> >     >     discussions
> >     >     > > > > >      and get
> >     >     > > > > >      > feedback on the following points:
> >     >     > > > > >      > * Fallback when eBPF is not supported by
> >     the kernel
> >     >     > > > > >
> >     >     > > > > >
> >     >     > > > > >      Yes, and it could also a lacking of CAP_BPF.
> >     >     > > > > >
> >     >     > > > > >
> >     >     > > > > >      > * Live migration to the kernel that doesn't
> >     have
> >     >     eBPF support
> >     >     > > > > >
> >     >     > > > > >
> >     >     > > > > >      Is there anything that we needs special
> >     treatment here?
> >     >     > > > > >
> >     >     > > > > > Possible case: rss=3Don, vhost=3Don, source system =
with
> >     >     kernel 5.8
> >     >     > > > > > (everything works) -> dest. system 5.6 (bpf does no=
t
> >     >     work), the adapter
> >     >     > > > > > functions, but all the steering does not use
> >     proper queues.
> >     >     > > > >
> >     >     > > > > Right, I think we need to disable vhost on dest.
> >     >     > > > >
> >     >     > > > >
> >     >     > > > > >
> >     >     > > > > >
> >     >     > > > > >      > * Integration with current QEMU build
> >     >     > > > > >
> >     >     > > > > >
> >     >     > > > > >      Yes, a question here:
> >     >     > > > > >
> >     >     > > > > >      1) Any reason for not using libbpf, e.g it
> >     has been
> >     >     shipped with some
> >     >     > > > > >      distros
> >     >     > > > > >
> >     >     > > > > >
> >     >     > > > > > We intentionally do not use libbpf, as it present
> only
> >     >     on some distros.
> >     >     > > > > > We can switch to libbpf, but this will disable bpf =
if
> >     >     libbpf is not
> >     >     > > > > > installed
> >     >     > > > >
> >     >     > > > > That's better I think.
> >     >     > > > >
> >     >     > > > >
> >     >     > > > > >      2) It would be better if we can avoid shipping
> >     >     bytecodes
> >     >     > > > > >
> >     >     > > > > >
> >     >     > > > > >
> >     >     > > > > > This creates new dependencies: llvm + clang + ...
> >     >     > > > > > We would prefer byte code and ability to generate
> >     it if
> >     >     prerequisites
> >     >     > > > > > are installed.
> >     >     > > > >
> >     >     > > > > It's probably ok if we treat the bytecode as a kind o=
f
> >     >     firmware.
> >     >     > > > That is explicitly *not* OK for inclusion in Fedora. Th=
ey
> >     >     require that
> >     >     > > > BPF is compiled from source, and rejected my
> >     suggestion that
> >     >     it could
> >     >     > > > be considered a kind of firmware and thus have an
> >     exception
> >     >     from building
> >     >     > > > from source.
> >     >     > >
> >     >     > >
> >     >     > > Please refer what it was done in DPDK:
> >     >     > >
> >     >     > > http://git.dpdk.org/dpdk/tree/doc/guides/nics/tap.rst#n23=
5
> >     >     > >
> >     >     > > I don't think what proposed here makes anything different=
.
> >     >     >
> >     >     > I'm not convinced that what DPDK does is acceptable to
> >     Fedora either
> >     >     > based on the responses I've received when asking about BPF
> >     handling
> >     >     > during build.  I wouldn't suprise me, however, if this was
> >     simply
> >     >     > missed by reviewers when accepting DPDK into Fedora,
> >     because it is
> >     >     > not entirely obvious unless you are looking closely.
> >     >
> >     >     FWIW, I'm pushing back against the idea that we have to
> >     compile the
> >     >     BPF code from master source, as I think it is reasonable to
> >     have the
> >     >     program embedded as a static array in the source code
> >     similar to what
> >     >     DPDK does.  It doesn't feel much different from other places
> >     where
> >     >     apps
> >     >     use generated sources, and don't build them from the
> >     original source
> >     >     every time. eg "configure" is never re-generated from
> >     >     "configure.ac <http://configure.ac> <http://configure.ac>"
> >     >     by Fedora packagers, they just use the generated "configure"
> >     script
> >     >     as-is.
> >     >
> >     >     Regards,
> >     >     Daniel
> >     >     --
> >     >     |: https://berrange.com     -o-
> >     > https://www.flickr.com/photos/dberrange :|
> >     >     |: https://libvirt.org        -o-
> >     https://fstop138.berrange.com :|
> >     >     |: https://entangle-photo.org   -o-
> >     > https://www.instagram.com/dberrange :|
> >     >
> >
>
>

--000000000000977bdf05b3bc1381
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 10, 2020 at 4:23 AM Jason=
 Wang &lt;<a href=3D"mailto:jasowang@redhat.com">jasowang@redhat.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 2020/11/9 =E4=B8=8B=E5=8D=889:33, Yuri Benditovich wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Nov 9, 2020 at 4:14 AM Jason Wang &lt;<a href=3D"mailto:jasowa=
ng@redhat.com" target=3D"_blank">jasowang@redhat.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:jasowang@redhat.com" target=3D"_blank">ja=
sowang@redhat.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On 2020/11/5 =E4=B8=8B=E5=8D=8811:13, Yuri Benditov=
ich wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; First of all, thank you for all your feedbacks=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Please help me to summarize and let us underst=
and better what we<br>
&gt;=C2=A0 =C2=A0 =C2=A0do in v2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Major questions are:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 1. Building eBPF from source during qemu build=
 vs. regenerating<br>
&gt;=C2=A0 =C2=A0 =C2=A0it on<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; demand and keeping in the repository<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Solution 1a (~ as in v1): keep instructions or=
 ELF in H file,<br>
&gt;=C2=A0 =C2=A0 =C2=A0generate<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; it out of qemu build. In general we&#39;ll nee=
d to have BE and LE<br>
&gt;=C2=A0 =C2=A0 =C2=A0binaries.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Solution 1b: build ELF or instructions during =
QEMU build if llvm=C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; clang exist. Then we will have only one (BE or=
 LE, depending on<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; current QEMU build)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; We agree with any solution - I believe you kno=
w the requirements<br>
&gt;=C2=A0 =C2=A0 =C2=A0better.<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I think we can go with 1a. (See Danial&#39;s commen=
t)<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 2. Use libbpf or not<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; In general we do not see any advantage of usin=
g libbpf. It works<br>
&gt;=C2=A0 =C2=A0 =C2=A0with<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; object files=C2=A0(does ELF parsing at time of=
 loading), but it does<br>
&gt;=C2=A0 =C2=A0 =C2=A0not=C2=A0do<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; any magic.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Solution 2a. Switch to libbpf, generate object=
 files (LE and BE)<br>
&gt;=C2=A0 =C2=A0 =C2=A0from<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; source, keep them inside QEMU (~8k each) or as=
ide<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Can we simply use dynamic linking here?<br>
&gt;<br>
&gt;<br>
&gt; Can you please explain, where exactly you suggest to use dynamic linki=
ng?<br>
<br>
<br>
Yes. If I understand your 2a properly, you meant static linking of <br>
libbpf. So what I want to ask is the possibility of dynamic linking of <br>
libbpf here.<br>
<br></blockquote><div><br></div><div>As Daniel explained above, QEMU is alw=
ays linked dynamically vs libraries.</div><div>Also I see the libbpf packag=
e does not even contain the static library.</div><div>If the build environm=
ent contains libbpf, the libbpf.so becomes runtime dependency, just as with=
 other libs.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Solution 2b. (as in v1) Use python script to p=
arse object -&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; instructions (~2k each)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; We&#39;d prefer not to use libbpf at the momen=
t.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; If due to some unknown reason we&#39;ll find i=
t useful in future, we<br>
&gt;=C2=A0 =C2=A0 =C2=A0can<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; switch to it, this does not create any incompa=
tibility. Then<br>
&gt;=C2=A0 =C2=A0 =C2=A0this will<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; create a dependency on libbpf.so<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I think we need to care about compatibility. E.g we=
 need to enable<br>
&gt;=C2=A0 =C2=A0 =C2=A0BTF<br>
&gt;=C2=A0 =C2=A0 =C2=A0so I don&#39;t know how hard if we add BTF support =
in the current<br>
&gt;=C2=A0 =C2=A0 =C2=A0design. It<br>
&gt;=C2=A0 =C2=A0 =C2=A0would be probably OK it&#39;s not a lot of effort.<=
br>
&gt;<br>
&gt;<br>
&gt; As far as we understand BTF helps in BPF debugging and libbpf supports=
 <br>
&gt; it as is.<br>
&gt; Without libbpf we in v1 load the BPF instructions only.<br>
&gt; If you think the BTF is mandatory (BTW, why?) I think it is better to =
<br>
&gt; switch to libbpf and keep the entire ELF in the qemu data.<br>
<br>
<br>
It is used to make sure the BPF can do compile once run everywhere.<br>
<br>
This is explained in detail in here: <br>
<a href=3D"https://facebookmicrosites.github.io/bpf/blog/2020/02/19/bpf-por=
tability-and-co-re.html" rel=3D"noreferrer" target=3D"_blank">https://faceb=
ookmicrosites.github.io/bpf/blog/2020/02/19/bpf-portability-and-co-re.html<=
/a>.<br>
<br>
</blockquote><div><br></div><div>Thank you, then there is no question, we n=
eed to use libbpf.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Thanks<br>
<br>
<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 3. Keep instructions or ELF inside QEMU or as =
separate external file<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Solution 3a (~as in v1): Built-in array of ins=
tructions or ELF.<br>
&gt;=C2=A0 =C2=A0 =C2=A0If we<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; generate them out of QEMU build - keep 2 array=
s or instructions<br>
&gt;=C2=A0 =C2=A0 =C2=A0or ELF<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; (BE and LE),<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Solution 3b: Install them as separate files (/=
usr/share/qemu).<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; We&#39;d prefer 3a:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0Then there is a guarantee that the eBPF =
is built with exactly the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; same config structures as QEMU (qemu creates a=
 mapping of its<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; structures, eBPF uses them).<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0No need to take care on scenarios like &=
#39;file not found&#39;, &#39;file<br>
&gt;=C2=A0 =C2=A0 =C2=A0is not<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; suitable&#39; etc<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Yes, let&#39;s go 3a for upstream.<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 4. Is there some real request to have the eBPF=
 for big-endian?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; If no, we can enable eBPF only for LE builds<b=
r>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0We can go with LE first.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Jason, Daniel, Michael<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Can you please let us know what you think and =
why?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Thu, Nov 5, 2020 at 3:19 PM Daniel P. Berra=
ng=C3=A9<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:berrange@redhat.com" target=
=3D"_blank">berrange@redhat.com</a> &lt;mailto:<a href=3D"mailto:berrange@r=
edhat.com" target=3D"_blank">berrange@redhat.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;mailto:<a href=3D"mailto:berrange@redhat.c=
om" target=3D"_blank">berrange@redhat.com</a> &lt;mailto:<a href=3D"mailto:=
berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&gt;&gt;&gt; =
wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0On Thu, Nov 05, 2020 at 10:=
01:09AM +0000, Daniel P. Berrang=C3=A9<br>
&gt;=C2=A0 =C2=A0 =C2=A0wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Thu, Nov 05, 2020 a=
t 11:46:18AM +0800, Jason Wang wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; On 2020/11/4 =E4=
=B8=8B=E5=8D=885:31, Daniel P. Berrang=C3=A9 wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; On Wed, Nov =
04, 2020 at 10:07:52AM +0800, Jason Wang<br>
&gt;=C2=A0 =C2=A0 =C2=A0wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; On 2020=
/11/3 =E4=B8=8B=E5=8D=886:32, Yuri Benditovich wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt; On=
 Tue, Nov 3, 2020 at 11:02 AM Jason Wang<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:jasow=
ang@redhat.com" target=3D"_blank">jasowang@redhat.com</a> &lt;mailto:<a hre=
f=3D"mailto:jasowang@redhat.com" target=3D"_blank">jasowang@redhat.com</a>&=
gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jasowang@redhat.com" t=
arget=3D"_blank">jasowang@redhat.com</a> &lt;mailto:<a href=3D"mailto:jasow=
ang@redhat.com" target=3D"_blank">jasowang@redhat.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt; &l=
t;mailto:<a href=3D"mailto:jasowang@redhat.com" target=3D"_blank">jasowang@=
redhat.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jasowang@redhat.com" t=
arget=3D"_blank">jasowang@redhat.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailt=
o:jasowang@redhat.com" target=3D"_blank">jasowang@redhat.com</a> &lt;mailto=
:<a href=3D"mailto:jasowang@redhat.com" target=3D"_blank">jasowang@redhat.c=
om</a>&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 On 2020/11/3 =E4=B8=8A=E5=8D=882:51, Andrew Melnychenko w=
rote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; Basic idea is to use eBPF to calculate and<br>
&gt;=C2=A0 =C2=A0 =C2=A0steer<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0packets in TAP.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; RSS(Receive Side Scaling) is used to distribute<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0network packets<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 to guest virtqueues<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; by calculating packet hash.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; eBPF RSS allows us to use RSS with vhost TAP.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; This set of patches introduces the usage of<br>
&gt;=C2=A0 =C2=A0 =C2=A0eBPF<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0for packet steering<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; and RSS hash calculation:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; * RSS(Receive Side Scaling) is used to<br>
&gt;=C2=A0 =C2=A0 =C2=A0distribute<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0network packets to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; guest virtqueues by calculating packet hash<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; * eBPF RSS suppose to be faster than already<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0existing &#39;software&#39;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; implementation in QEMU<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; * Additionally adding support for the usage of<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0RSS with vhost<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; Supported kernels: 5.8+<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; Implementation notes:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; Linux TAP TUNSETSTEERINGEBPF ioctl was used to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0set the eBPF program.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; Added eBPF support to qemu directly through a<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0system call, see the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; bpf(2) for details.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; The eBPF program is part of the qemu and<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0presented as an array<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 of bpf<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; instructions.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; The program can be recompiled by provided<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Makefile.ebpf(need to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 adjust<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; &#39;linuxhdrs&#39;),<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; although it&#39;s not required to build QEMU with<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0eBPF support.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; Added changes to virtio-net and vhost, primary<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0eBPF RSS is used.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; &#39;Software&#39; RSS used in the case of hash<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0population and as a<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 fallback option.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; For vhost, the hash population feature is not<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0reported to the guest.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; Please also see the documentation in PATCH 6/6.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; I am sending those patches as RFC to<br>
&gt;=C2=A0 =C2=A0 =C2=A0initiate the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0discussions<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 and get<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; feedback on the following points:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; * Fallback when eBPF is not supported by<br>
&gt;=C2=A0 =C2=A0 =C2=A0the kernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 Yes, and it could also a lacking of CAP_BPF.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; * Live migration to the kernel that doesn&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0have<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0eBPF support<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 Is there anything that we needs special<br>
&gt;=C2=A0 =C2=A0 =C2=A0treatment here?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt; Po=
ssible case: rss=3Don, vhost=3Don, source system with<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0kernel 5.8<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt; (e=
verything works) -&gt; dest. system 5.6 (bpf does not<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0work), the adapter<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt; fu=
nctions, but all the steering does not use<br>
&gt;=C2=A0 =C2=A0 =C2=A0proper queues.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; Right, =
I think we need to disable vhost on dest.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 &gt; * Integration with current QEMU build<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 Yes, a question here:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 1) Any reason for not using libbpf, e.g it<br>
&gt;=C2=A0 =C2=A0 =C2=A0has been<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0shipped with some<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 distros<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt; We=
 intentionally do not use libbpf, as it present only<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0on some distros.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt; We=
 can switch to libbpf, but this will disable bpf if<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0libbpf is not<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt; in=
stalled<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; That&#3=
9;s better I think.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 2) It would be better if we can avoid shipping<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0bytecodes<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt; Th=
is creates new dependencies: llvm=C2=A0+ clang=C2=A0+ ...<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt; We=
 would prefer byte code and ability to generate<br>
&gt;=C2=A0 =C2=A0 =C2=A0it if<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0prerequisites<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; &gt; ar=
e installed.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; &gt; It&#39;=
s probably ok if we treat the bytecode as a kind of<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0firmware.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; That is expl=
icitly *not* OK for inclusion in Fedora. They<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0require that<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; BPF is compi=
led from source, and rejected my<br>
&gt;=C2=A0 =C2=A0 =C2=A0suggestion that<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0it could<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; be considere=
d a kind of firmware and thus have an<br>
&gt;=C2=A0 =C2=A0 =C2=A0exception<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0from building<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; &gt; from source.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; Please refer what=
 it was done in DPDK:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; <a href=3D"http:/=
/git.dpdk.org/dpdk/tree/doc/guides/nics/tap.rst#n235" rel=3D"noreferrer" ta=
rget=3D"_blank">http://git.dpdk.org/dpdk/tree/doc/guides/nics/tap.rst#n235<=
/a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; &gt; I don&#39;t think=
 what proposed here makes anything different.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; I&#39;m not convinced =
that what DPDK does is acceptable to<br>
&gt;=C2=A0 =C2=A0 =C2=A0Fedora either<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; based on the responses=
 I&#39;ve received when asking about BPF<br>
&gt;=C2=A0 =C2=A0 =C2=A0handling<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; during build.=C2=A0 I =
wouldn&#39;t suprise me, however, if this was<br>
&gt;=C2=A0 =C2=A0 =C2=A0simply<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; missed by reviewers wh=
en accepting DPDK into Fedora,<br>
&gt;=C2=A0 =C2=A0 =C2=A0because it is<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&gt; not entirely obvious u=
nless you are looking closely.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0FWIW, I&#39;m pushing back =
against the idea that we have to<br>
&gt;=C2=A0 =C2=A0 =C2=A0compile the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0BPF code from master source=
, as I think it is reasonable to<br>
&gt;=C2=A0 =C2=A0 =C2=A0have the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0program embedded as a stati=
c array in the source code<br>
&gt;=C2=A0 =C2=A0 =C2=A0similar to what<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0DPDK does.=C2=A0 It doesn&#=
39;t feel much different from other places<br>
&gt;=C2=A0 =C2=A0 =C2=A0where<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0apps<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0use generated sources, and =
don&#39;t build them from the<br>
&gt;=C2=A0 =C2=A0 =C2=A0original source<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0every time. eg &quot;config=
ure&quot; is never re-generated from<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"http://con=
figure.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a> &lt;<a hre=
f=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">http://confi=
gure.ac</a>&gt; &lt;<a href=3D"http://configure.ac" rel=3D"noreferrer" targ=
et=3D"_blank">http://configure.ac</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0by Fedora packagers, they j=
ust use the generated &quot;configure&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0script<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0as-is.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Daniel<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0|: <a href=3D"https://berra=
nge.com" rel=3D"noreferrer" target=3D"_blank">https://berrange.com</a> =C2=
=A0 =C2=A0 -o-<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"https://www.flickr.com/photos/dberr=
ange" rel=3D"noreferrer" target=3D"_blank">https://www.flickr.com/photos/db=
errange</a> :|<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0|: <a href=3D"https://libvi=
rt.org" rel=3D"noreferrer" target=3D"_blank">https://libvirt.org</a> =C2=A0=
 =C2=A0 =C2=A0 =C2=A0-o-<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://fstop138.berrange.com" rel=3D"no=
referrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0|: <a href=3D"https://entan=
gle-photo.org" rel=3D"noreferrer" target=3D"_blank">https://entangle-photo.=
org</a> =C2=A0 -o-<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"https://www.instagram.com/dberrange=
" rel=3D"noreferrer" target=3D"_blank">https://www.instagram.com/dberrange<=
/a> :|<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;<br>
<br>
</blockquote></div></div>

--000000000000977bdf05b3bc1381--

