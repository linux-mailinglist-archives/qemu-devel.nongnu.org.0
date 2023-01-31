Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5566838D4
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 22:43:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMyNx-0001GK-0b; Tue, 31 Jan 2023 16:41:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pMyNv-0001Fr-D2
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 16:41:47 -0500
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pMyNt-0005LW-Cs
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 16:41:47 -0500
Received: by mail-lj1-x22a.google.com with SMTP id d8so5015402ljq.9
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 13:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C804c1ylMqvxXdADLhfcM39PiApYCjtliC3aOysB3+U=;
 b=hYwXjkpF+ivOr2KN3R6xFm99sPmXuou+QauIJotJJt1uqjWisRADARwl3eFSc/jf7f
 Bxd8nb78CL5QbmZr1kQbLJEkYlhOfgSK3LxCbJi2VtSviFcM8Pu1+BvbULNzz4awLrqi
 3DcjEeO02Pg2nhTS+H6XhFvuOPPthIBKqulhyVrJX/IfvhDe2v5M6T2/u5IVM3dcbkXs
 /l//Haw9JDDESHSVvj58HyNeKvfhsfKA5/B5zQByaOFPvjvOyN6DA29cF0YrgQF7hexN
 iFVveqQSyx2EuLSbmg2TjUFoQwM6jio+OqB/LmKHP4gp6UKkjQqeFtWu8a+pBtb8yyLa
 qDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C804c1ylMqvxXdADLhfcM39PiApYCjtliC3aOysB3+U=;
 b=sKyAJUCLcMMfkpT7iHh5yckjql0AGmKFGMCBbyqE0B6AB69Z9FdgUPc4jYuUJEquJ5
 PPFiea3OSOuowF9teghCaUvUGKBTkond4eIOkCMi42XbwkwW0vaLpxk+rceEcz+kgKH+
 8LtOEJ/e8P39MmLSGpgLcaV+ne2wGVxEKlvrP0RzuazpJ4nuvAnGBfveh7ptkmCELvcw
 xtLmeZb/dlsSqrxerHxnei7l1DPWBFmQlJyuPP0sTDSyLyikACMX5MfUaE9USgXJF+0m
 oZiCN3a7IfaWWUCETbs1OQ3NpLkjACVIIsamBDCviXzu+hDyFGkiPsYbGUM7lp9aRRc6
 fwDw==
X-Gm-Message-State: AO0yUKVGgZxSJbBlIKAEBJO/Jq85AVVkKdChQS5x42n6nU65iUPBsUfc
 xjmPq/jbV04InbAEB0Mrgb43HYOyVYmB9jk9f2Y=
X-Google-Smtp-Source: AK7set9ZzTdwv7awzL5o5ZT0gvwQwHcceq6Y4SwKpt9xIiu5/ya28+xG2cojVKbRhDBYFpASNifePhHqhwmdLkD+9Kc=
X-Received: by 2002:a2e:9247:0:b0:290:4f23:f72a with SMTP id
 v7-20020a2e9247000000b002904f23f72amr1222054ljg.197.1675201303101; Tue, 31
 Jan 2023 13:41:43 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QXBKPXj2vf3wuK2QGdX+HZa_Nu3A+RT6hYnXJrUKTY4Fg@mail.gmail.com>
 <CAJSP0QWDMv2yFkORzKt+p45ykiY=AmZCbrS464nZOqEtOz-NqA@mail.gmail.com>
 <874js661lu.fsf@linaro.org>
 <CAJSP0QVN1VVHEms=7p9pwJRDDk6vM+Xvk3Wzi04w7e=+0G+F2g@mail.gmail.com>
 <CAJ+F1C+gfQRpKqG1Nr6tmcHCLjP2dfM3fq-YjKE5-HzkA832hw@mail.gmail.com>
 <CAJSP0QVa9W0v+FAqCZTz4LZYPeic7k6w2k=4Yk9TqAEwts_v7g@mail.gmail.com>
 <CAJ+F1CLEXhAyVtVFo0RzJSAerOo9MEc25=AodAs9oCwgrhX3iA@mail.gmail.com>
In-Reply-To: <CAJ+F1CLEXhAyVtVFo0RzJSAerOo9MEc25=AodAs9oCwgrhX3iA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 31 Jan 2023 16:41:29 -0500
Message-ID: <CAJSP0QV_EN697rAHO9Tkh8WWLGfhRGsScFhR_ZBoDCRiX4x=_A@mail.gmail.com>
Subject: Re: virtio-sound Google Summer of Code project?
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 chouhan.shreyansh2702@gmail.com, Gerd Hoffmann <kraxel@redhat.com>, 
 Laurent Vivier <Laurent@vivier.eu>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=stefanha@gmail.com; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 31 Jan 2023 at 16:19, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Wed, Feb 1, 2023 at 12:29 AM Stefan Hajnoczi <stefanha@gmail.com> wrot=
e:
> >
> > On Tue, 31 Jan 2023 at 14:48, Marc-Andr=C3=A9 Lureau
> > <marcandre.lureau@gmail.com> wrote:
> > >
> > > Hi
> > >
> > > On Tue, Jan 31, 2023 at 10:20 PM Stefan Hajnoczi <stefanha@gmail.com>=
 wrote:
> > > >
> > > > On Tue, 31 Jan 2023 at 12:43, Alex Benn=C3=A9e <alex.bennee@linaro.=
org> wrote:
> > > > >
> > > > >
> > > > > Stefan Hajnoczi <stefanha@gmail.com> writes:
> > > > >
> > > > > > On Sun, 29 Jan 2023 at 17:10, Stefan Hajnoczi <stefanha@gmail.c=
om> wrote:
> > > > > >>
> > > > > >> Hi Shreyansh, Gerd, and Laurent,
> > > > > >> The last virtio-sound RFC was sent in February last year. It w=
as a
> > > > > >> spare time project. Understandably it's hard to complete the w=
hole
> > > > > >> thing on weekends, evenings, etc. So I wanted to suggest relau=
nching
> > > > > >> the virtio-sound effort as a Google Summer of Code project.
> > > > > >>
> > > > > >> Google Summer of Code is a 12-week full-time remote work inter=
nship.
> > > > > >> The intern would be co-mentored by some (or all) of us. The pr=
oject
> > > > > >> goal would be to merge virtio-sound with support for both play=
back and
> > > > > >> capture. Advanced features for multi-channel audio, etc can be=
 stretch
> > > > > >> goals.
> > > > > >>
> > > > > >> I haven't looked in detail at the patches from February 2022, =
so I
> > > > > >> don't know the exact state and whether there is enough work re=
maining
> > > > > >> for a 12-week internship. What do you think?
> > > > > >
> > > > > > Adding Anton.
> > > > > >
> > > > > > I have updated the old wiki page for this project idea and adde=
d it to
> > > > > > the 2023 ideas list:
> > > > > > https://wiki.qemu.org/Internships/ProjectIdeas/VirtioSound
> > > > > >
> > > > > > Please let me know if you wish to co-mentor this project!
> > > > >
> > > > > I'd be happy to help - although if someone was rust inclined I'd =
also be
> > > > > happy to mentor a rust-vmm vhost-user implementation of VirtIO so=
und.
> > > >
> > > > Maybe Gerd can tell us about the QEMU audio subsystem features that
> > > > may be lost if developing a standalone vhost-user device.
> > > >
> > > > Two things come to mind:
> > > > 1. May not run on all host OSes that QEMU supports if it supports
> > > > fewer native audio APIs than QEMU.
> > >
> > > Using GStreamer in Rust is well supported, and should give all the
> > > backends that you ever need (alternatively, there might be some Rust
> > > audio crates that I am not aware of). In all cases, I would not
> > > implement various backends the way QEMU audio/ has grown...
> > >
> > > > 2. May not support forwarding audio to remote desktop solutions tha=
t
> > > > stream audio over the network. I don't know if/how this works with
> > > > VNC/RDP/Spice, but a separate vhost-user process will need to do ex=
tra
> > > > work to send the audio over the remote desktop connection.
> > >
> > > Well, some of the goal with `-display dbus` is to move the remote
> > > desktop handling outside of QEMU. I had in mind that the protocol wil=
l
> > > have to evolve to handle multiprocess, so audio, display, input etc
> > > interfaces can be provided by external processes. In fact, it should
> > > be possible without protocol change for audio devices with the curren=
t
> > > interface (https://gitlab.com/qemu-project/qemu/-/blob/master/ui/dbus=
-display1.xml#L483).
> > >
> > > In short, I wish the project implements the device in Rust, with
> > > `gstreamer` and `dbus` as optional features. (that should be
> > > introspectable via --print-capabilities stuff)
> >
> > Cool, then let's go with a Rust vhost-user device implementation!
> >
> > Can you elaborate on how the "gstreamer" feature would be used by the
> > process launching the vhost-user back-end? Do you mean there should be
> > a standard command-line syntax for specifying the playback and capture
> > devices that maps directly to GStreamer (e.g. like gst-launch-1.0)?
>
> Roughly what comes in mind is that the backend should always offer a
> --audio-backend=3D... option, defaulting to something sensible, and
> always have `none`, I guess.
> - when the `gstreamer` feature & capability is available, can be set
> to 'gstreamer'. Additionally, options like --gst-sink=3D'pipeline'
> --gst-src=3D'pipeline' could be supported too, but it should do
> something sensible here as well, by using autoaudiosink/autoaudiosrc
> by default.
> - when the `dbus` feature & capability is available, can be set to
> 'dbus' (or qemu-dbus?). It may require some extra option too, to
> communicate back with qemu, such as `--dbus-addr=3Daddr`, or
> `--dbus-fd=3DN`.

I see. Thanks for explaining.

I have updated the project idea now. Feel free to make edits or add
yourselves as mentors:
https://wiki.qemu.org/Internships/ProjectIdeas/VirtioSound

Stefan

