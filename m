Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4029868388B
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 22:20:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMy1z-0007w5-OJ; Tue, 31 Jan 2023 16:19:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pMy1x-0007vj-HR
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 16:19:05 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pMy1v-0005xE-4n
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 16:19:04 -0500
Received: by mail-lf1-x135.google.com with SMTP id bp15so26214725lfb.13
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 13:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dp9HTM+/MmG628Trq4COBSKpMbbNh3KJPdDrVNHcxlI=;
 b=ahN5v6ZV7J6kBL41xDCylJVE57Ade1OIrdM1lDWT7ddq3OJ273bcIc2TDBoUzh2vNR
 0k5ReyXSmZxUx7xId1nwOkShB80KMJR5+xE/VwAwS0FYfAUcBCIDiowoKsmmkhkOgbGn
 04e992EnUp4TR+QusOHf79yJaxjTOkUCYVSyP7TxfnOWtNvBnbWAIaTiEUWYFr9IofKh
 1K9P//GgxQMId9ijh1o87GY+QkexM1N69cdqL1iwjDnorGRZE3SEucI9vZRAcqN/xCgI
 p71kkjm6qJvS4MGg1bXJXLSvhC2vgP1xXx1U0I8O8hV724nnTNizrrABoAGEwvjbtJr5
 7B5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dp9HTM+/MmG628Trq4COBSKpMbbNh3KJPdDrVNHcxlI=;
 b=4H2gSEBOyZvyjiC5KhXkwNHNMlgb4he0UGpoGrb5u//5P6C7Q0CJHqI8SeaB1qcecm
 90yXbcCgiG2uzGvL8ukrs5BZCPR7GeagrUKhyskgNbn1rZ5v2eu1b+BTzfzY9iarafXw
 p1g2/0Ur51EPMNC1LvSAI76i9AEX5KO7/0nZYpYeShVk8YjwCxiNAxCeOxmRzVHKz2Ex
 HWJYrAqKZEC9h4YUy+Ijj38IqjP1yp1CgQ2E84rZw/oBI0EL7HKhn7T6Lgb4Q5nkH6Zz
 5Dk9spyY56o6TWDE5obKoG3ZBB2lVQax+WPskC9bIJFxqKOyavIt3pD8BFa6hLYoU8n3
 brmQ==
X-Gm-Message-State: AFqh2krw8DW3kwTP1wtikFL3r7BponMHlYhhmU0Rkf5u+hv0e91SmmYR
 5qceRH+MkPStnYH7RAVzPkDDfu5rt95TD+ZNkic=
X-Google-Smtp-Source: AMrXdXuqp9m615+DjSHdoUnPZrvUCSJhn0O9mRSZuW9DFy4S1yQmQ776jT2aRut/cx8EcrnnvMCeSlN5b1vUIvtFeuQ=
X-Received: by 2002:a19:7016:0:b0:4d5:82bb:7d39 with SMTP id
 h22-20020a197016000000b004d582bb7d39mr4110443lfc.129.1675199941003; Tue, 31
 Jan 2023 13:19:01 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QXBKPXj2vf3wuK2QGdX+HZa_Nu3A+RT6hYnXJrUKTY4Fg@mail.gmail.com>
 <CAJSP0QWDMv2yFkORzKt+p45ykiY=AmZCbrS464nZOqEtOz-NqA@mail.gmail.com>
 <874js661lu.fsf@linaro.org>
 <CAJSP0QVN1VVHEms=7p9pwJRDDk6vM+Xvk3Wzi04w7e=+0G+F2g@mail.gmail.com>
 <CAJ+F1C+gfQRpKqG1Nr6tmcHCLjP2dfM3fq-YjKE5-HzkA832hw@mail.gmail.com>
 <CAJSP0QVa9W0v+FAqCZTz4LZYPeic7k6w2k=4Yk9TqAEwts_v7g@mail.gmail.com>
In-Reply-To: <CAJSP0QVa9W0v+FAqCZTz4LZYPeic7k6w2k=4Yk9TqAEwts_v7g@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 1 Feb 2023 01:18:49 +0400
Message-ID: <CAJ+F1CLEXhAyVtVFo0RzJSAerOo9MEc25=AodAs9oCwgrhX3iA@mail.gmail.com>
Subject: Re: virtio-sound Google Summer of Code project?
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 chouhan.shreyansh2702@gmail.com, Gerd Hoffmann <kraxel@redhat.com>, 
 Laurent Vivier <Laurent@vivier.eu>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x135.google.com
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

Hi

On Wed, Feb 1, 2023 at 12:29 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Tue, 31 Jan 2023 at 14:48, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> >
> > Hi
> >
> > On Tue, Jan 31, 2023 at 10:20 PM Stefan Hajnoczi <stefanha@gmail.com> w=
rote:
> > >
> > > On Tue, 31 Jan 2023 at 12:43, Alex Benn=C3=A9e <alex.bennee@linaro.or=
g> wrote:
> > > >
> > > >
> > > > Stefan Hajnoczi <stefanha@gmail.com> writes:
> > > >
> > > > > On Sun, 29 Jan 2023 at 17:10, Stefan Hajnoczi <stefanha@gmail.com=
> wrote:
> > > > >>
> > > > >> Hi Shreyansh, Gerd, and Laurent,
> > > > >> The last virtio-sound RFC was sent in February last year. It was=
 a
> > > > >> spare time project. Understandably it's hard to complete the who=
le
> > > > >> thing on weekends, evenings, etc. So I wanted to suggest relaunc=
hing
> > > > >> the virtio-sound effort as a Google Summer of Code project.
> > > > >>
> > > > >> Google Summer of Code is a 12-week full-time remote work interns=
hip.
> > > > >> The intern would be co-mentored by some (or all) of us. The proj=
ect
> > > > >> goal would be to merge virtio-sound with support for both playba=
ck and
> > > > >> capture. Advanced features for multi-channel audio, etc can be s=
tretch
> > > > >> goals.
> > > > >>
> > > > >> I haven't looked in detail at the patches from February 2022, so=
 I
> > > > >> don't know the exact state and whether there is enough work rema=
ining
> > > > >> for a 12-week internship. What do you think?
> > > > >
> > > > > Adding Anton.
> > > > >
> > > > > I have updated the old wiki page for this project idea and added =
it to
> > > > > the 2023 ideas list:
> > > > > https://wiki.qemu.org/Internships/ProjectIdeas/VirtioSound
> > > > >
> > > > > Please let me know if you wish to co-mentor this project!
> > > >
> > > > I'd be happy to help - although if someone was rust inclined I'd al=
so be
> > > > happy to mentor a rust-vmm vhost-user implementation of VirtIO soun=
d.
> > >
> > > Maybe Gerd can tell us about the QEMU audio subsystem features that
> > > may be lost if developing a standalone vhost-user device.
> > >
> > > Two things come to mind:
> > > 1. May not run on all host OSes that QEMU supports if it supports
> > > fewer native audio APIs than QEMU.
> >
> > Using GStreamer in Rust is well supported, and should give all the
> > backends that you ever need (alternatively, there might be some Rust
> > audio crates that I am not aware of). In all cases, I would not
> > implement various backends the way QEMU audio/ has grown...
> >
> > > 2. May not support forwarding audio to remote desktop solutions that
> > > stream audio over the network. I don't know if/how this works with
> > > VNC/RDP/Spice, but a separate vhost-user process will need to do extr=
a
> > > work to send the audio over the remote desktop connection.
> >
> > Well, some of the goal with `-display dbus` is to move the remote
> > desktop handling outside of QEMU. I had in mind that the protocol will
> > have to evolve to handle multiprocess, so audio, display, input etc
> > interfaces can be provided by external processes. In fact, it should
> > be possible without protocol change for audio devices with the current
> > interface (https://gitlab.com/qemu-project/qemu/-/blob/master/ui/dbus-d=
isplay1.xml#L483).
> >
> > In short, I wish the project implements the device in Rust, with
> > `gstreamer` and `dbus` as optional features. (that should be
> > introspectable via --print-capabilities stuff)
>
> Cool, then let's go with a Rust vhost-user device implementation!
>
> Can you elaborate on how the "gstreamer" feature would be used by the
> process launching the vhost-user back-end? Do you mean there should be
> a standard command-line syntax for specifying the playback and capture
> devices that maps directly to GStreamer (e.g. like gst-launch-1.0)?

Roughly what comes in mind is that the backend should always offer a
--audio-backend=3D... option, defaulting to something sensible, and
always have `none`, I guess.
- when the `gstreamer` feature & capability is available, can be set
to 'gstreamer'. Additionally, options like --gst-sink=3D'pipeline'
--gst-src=3D'pipeline' could be supported too, but it should do
something sensible here as well, by using autoaudiosink/autoaudiosrc
by default.
- when the `dbus` feature & capability is available, can be set to
'dbus' (or qemu-dbus?). It may require some extra option too, to
communicate back with qemu, such as `--dbus-addr=3Daddr`, or
`--dbus-fd=3DN`.


--=20
Marc-Andr=C3=A9 Lureau

