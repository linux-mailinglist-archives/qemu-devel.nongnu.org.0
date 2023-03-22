Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 932AB6C4C23
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 14:45:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peylj-0005yq-UI; Wed, 22 Mar 2023 09:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1peyli-0005yh-3B
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 09:44:46 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1peylf-0001Tm-RR
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 09:44:45 -0400
Received: by mail-pg1-x535.google.com with SMTP id z10so10578075pgr.8
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 06:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1679492682;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cn4WZ4/RTP3q5lpTmQoCTy2PbCwZDk0aQ5OChlW2kN8=;
 b=OzJd+PpxnGc3GUwfXHPpH2wCgApz/a6/q65BgcrTdqk91h9SS2kpre4x/1qEer/h7Q
 5VZxPhhxpP6l+LlBD88uZ1100x2gCH35S6o/wmwtXlSd7mWBHuHVTEcexhlEVgpAmWBq
 sFbS5NRnkYyOdB8GVjBE5vT8nSc6rnMkXfYMmh5QeJahurPm/sVwmZQywdJNly8t6ClA
 Gc9gxxDG0bQjOH0Fgi/QeEMSJ7oUah/5s2RD4/EaAzYK3vFpstnDhKb7PVMz0LWkvqLC
 hWswIwRzN3jiMcoJMYr8g9nU45gHzYMSwCuzYh5BW4VkeasegqAoGzbzzW1e8wC6NiDm
 9rXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679492682;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cn4WZ4/RTP3q5lpTmQoCTy2PbCwZDk0aQ5OChlW2kN8=;
 b=KYV0uDrZmo6d1SoG/hwiTxliVhVs2nHsvmNKotan7TVEOhfOKsesydTFBkyaxvXZ/a
 5DlYAzjiGRT/kcZ4S5Bkdo/2d5uOH9xwlVHhDv+6n9Uta9cHRFRKRs6aJe9QPH1xrPwR
 sA2FQC8Ja00hR+9xGk2IQPnUXN4mwsTyHvWEv+GjzRUu5CCcUmEJnvvDam0Ufc0Lqzea
 YcwIDGT9TXx3BkU5pFoXP3mg0qr2Cjj3iwjrs9jW6bWe2eueynHMbUYIO1bsrTzX6/Gq
 VwR2vA+ur/TNKkTIwV9OizCNp6q0giWZ/myvIF7lhJEpljZt1bYXxgSm+k0WLwNHVSOB
 sGhQ==
X-Gm-Message-State: AO0yUKXVXdfuzPU/4TOeEs5A7F237cU69GuOBGqCOw9S6ImMvQPs3tFf
 HqjBzgYv5tB2beXxT94S0zPiZxyeYxOepqlmBt9veQ==
X-Google-Smtp-Source: AK7set9BrQRpVQgcaTZ7cEdoshCp9gGH15nD2aNJc8EXAOh5hX47NwidfzUG1y488oKFzU2Act2dmQiqizlFkI0WnK8=
X-Received: by 2002:a65:484b:0:b0:50c:a00:c1f9 with SMTP id
 i11-20020a65484b000000b0050c0a00c1f9mr804297pgs.7.1679492682198; Wed, 22 Mar
 2023 06:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230219162100.174318-1-andrew@daynix.com>
 <20230219162100.174318-4-andrew@daynix.com>
 <Y/NCQhGmqIadlw0y@redhat.com>
 <CAOEp5Of-sC1nuz4rAZkt8YoL2ctnSPAQ9QyxoQ97XiQ17wZ1Fg@mail.gmail.com>
 <Y/5CQ5md6huqNsx4@redhat.com> <877cw1ipgg.fsf@toke.dk>
 <Y/5QHonZyB+7vzEN@redhat.com>
 <87ttz5h1mj.fsf@toke.dk> <Y/8bQjj8VZ/7qal1@redhat.com>
 <871qm8h69w.fsf@toke.dk>
 <Y/9prSBDTQoL7yn5@redhat.com> <87k000f637.fsf@toke.dk>
In-Reply-To: <87k000f637.fsf@toke.dk>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Wed, 22 Mar 2023 15:26:59 +0200
Message-ID: <CABcq3pH3SRF1Y91jh=gEZ_xO=SuS0Mm-660nWChWSzY6zByTnA@mail.gmail.com>
Subject: Re: [PATCH 3/5] qmp: Added the helper stamp check.
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Yuri Benditovich <yuri.benditovich@daynix.com>, jasowang@redhat.com,
 mst@redhat.com, 
 pbonzini@redhat.com, marcandre.lureau@redhat.com, thuth@redhat.com, 
 philmd@linaro.org, armbru@redhat.com, eblake@redhat.com, 
 qemu-devel@nongnu.org, mprivozn@redhat.com, yan@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::535;
 envelope-from=andrew@daynix.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi all,
I've researched an issue a bit. The solution with passing eBPF blob
and loading in the Libvirt looks promising.
Overall, the possible solution looks like this:
 * Libvirt checks virtio-net properties and understands that eBPF
steering may be required.
 * Libvirt requests eBPF blob through QMP.
 * Libvirt loads blob for virtio-net and passes fds from eBPF to QEMU.

I think that it's a good idea to pass only eBPF blob without
additional metainformation. Most metainfo that we need could be
retrieved from eBPF blob, and the only question is to pass fds
sequence to QEMU.
I propose to pass them as they appear in the blob itself, like
"virtio-net-pci,ebpf_rss_fds=3D<prog>,<map1>,<map2>,<map3>...".
Also, I think it's a good idea to make a "general" QMP request for
eBPF blobs. Something like "request_ebpf <arg>"(g.e "request_ebpf
virtio-net-rss").

I'll prepare new RFC patches if you have questions or something to
discuss, please let me know.

On Thu, Mar 2, 2023 at 12:40=E2=80=AFAM Toke H=C3=B8iland-J=C3=B8rgensen <t=
oke@redhat.com> wrote:
>
> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>
> > On Wed, Mar 01, 2023 at 03:53:47PM +0100, Toke H=C3=B8iland-J=C3=B8rgen=
sen wrote:
> >> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
> >>
> >> > On Tue, Feb 28, 2023 at 11:21:56PM +0100, Toke H=C3=B8iland-J=C3=B8r=
gensen wrote:
> >> >> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
> >> >>
> >> >> > On Tue, Feb 28, 2023 at 08:01:51PM +0100, Toke H=C3=B8iland-J=C3=
=B8rgensen wrote:
> >> >> >> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
> >> >> >>
> >> >> >> Just to interject a note on this here: the skeleton code is most=
ly a
> >> >> >> convenience feature used to embed BPF programs into the calling =
binary.
> >> >> >> It is perfectly possible to just have the BPF object file itself=
 reside
> >> >> >> directly in the file system and just use the regular libbpf APIs=
 to load
> >> >> >> it. Some things get a bit more cumbersome (mostly setting values=
 of
> >> >> >> global variables, if the BPF program uses those).
> >> >> >>
> >> >> >> So the JSON example above could just be a regular compiled-from-=
clang
> >> >> >> BPF object file, and the management program can load that, inspe=
ct its
> >> >> >> contents using the libbpf APIs and pass the file descriptors on =
to Qemu.
> >> >> >> It's even possible to embed version information into this so tha=
t Qemu
> >> >> >> can check if it understands the format and bail out if it doesn'=
t - just
> >> >> >> stick a version field in the configuration map as the first entr=
y :)
> >> >> >
> >> >> > If all you have is the BPF object file is it possible to interrog=
ate
> >> >> > it to get a list of all the maps, and get FDs associated for them=
 ?
> >> >> > I had a look at the libbpf API and wasn't sure about that, it see=
med
> >> >> > like you had to know the required maps upfront ?  If it is possib=
le
> >> >> > to auto-discover everything you need, soley from the BPF object f=
ile
> >> >> > as input, then just dealing with that in isolation would feel sim=
pler.
> >> >>
> >> >> It is. You load the object file, and bpf_object__for_each_map() let=
s you
> >> >> discover which maps it contains, with the different bpf_map__*() AP=
Is
> >> >> telling you the properties of that map (and you can modify them too
> >> >> before loading the object if needed).
> >> >>
> >> >> The only thing that's not in the object file is any initial data yo=
u
> >> >> want to put into the map(s). But except for read-only maps that can=
 be
> >> >> added by userspace after loading the maps, so you could just let Qe=
mu do
> >> >> that...
> >> >>
> >> >> > It occurrs to me that exposing the BPF program as data rather tha=
n
> >> >> > via binary will make more practical to integrate this into KubeVi=
rt's
> >> >> > architecture. In their deployment setup both QEMU and libvirt are
> >> >> > running unprivileged inside a container. For any advanced nmetwor=
king
> >> >> > a completely separate component creates the TAP device and passes=
 it
> >> >> > into the container running QEMU. I don't think that the separate
> >> >> > precisely matched helper binary would be something they can use, =
but
> >> >> > it might be possible to expose a data file providing the BPF prog=
ram
> >> >> > blob and describing its maps.
> >> >>
> >> >> Well, "a data file providing the BPF program blob and describing it=
s
> >> >> maps" is basically what a BPF .o file is. It just happens to be enc=
oded
> >> >> in ELF format :)
> >> >>
> >> >> You can embed it into some other data structure and have libbpf loa=
d it
> >> >> from a blob in memory as well as from the filesystem, though; that =
is
> >> >> basically what the skeleton file does (notice the big character str=
ing
> >> >> at the end, that's just the original .o file contents).
> >> >
> >> > Ok, in that case I'm really wondering why any of this helper program
> >> > stuff was proposed. I recall the rationale was that it was impossibl=
e
> >> > for an external program to load the BPF object on behalf of QEMU,
> >> > because it would not know how todo that without QEMU specific
> >> > knowledge.
> >>
> >> I'm not sure either. Was there some bits that initially needed to be s=
et
> >> before the program was loaded (read-only maps or something)? Also,
> >> upstream does encourage the use of skeletons for embedding into
> >> applications, so it's not an unreasonable thing to start with if you
> >> don't have the kind of deployment constraints that Qemu does in this
> >> case.
> >>
> >> > It looks like we can simply expose the BPF object blob to mgmt apps
> >> > directly and get rid of this helper program entirely.
> >>
> >> I believe so, yes. You'd still need to be sure that the BPF object fil=
e
> >> itself comes from a trusted place, but hopefully it should be enough t=
o
> >> load it from a known filesystem path? (Sorry if this is a stupid
> >> question, I only have a fuzzy idea of how all the pieces fit together
> >> here).
> >
> > It could be from a well known location on the filesystem, but might
> > be better to make it possible to query it from QMP, which is mostly
> > safe *provided* you've not yet started guest CPUs running. It could
> > be queried at startup and then cached for future use.
>
> Right, I don't have a strong opinion about the exact mechanism, just
> wanted to convey a general "loading an untrusted BPF program is bad"
> kind of vibe ;)
>
> -Toke
>

