Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 606F3683515
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 19:21:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMvF1-0001Y2-VN; Tue, 31 Jan 2023 13:20:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pMvEh-0001WH-Qb
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:20:20 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pMvEf-0004HH-Uw
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:20:03 -0500
Received: by mail-yb1-xb36.google.com with SMTP id t16so19263828ybk.2
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 10:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4C5FLp6h8ewu/aFxtbZrKvRNJ2tPZpYX5K7pJ+IXuVQ=;
 b=Isurq5JGoWD/ttiB9TR++0E3ow3irTroPjAY17w9mfVdNwKtd+4m3bk3X6AFq4Ipvt
 0iu5ZUU85oToIxDkiqa6ZJeLUBer9y6doOJIsZY9GfwyrZmp5KrCGuzqeiD5l6/Q+g9+
 +TquobrV1ou7poFB/wiaMlhlVrZy4O/hg+eoHMuoprlP3duwQ/i0Cl0e4Vk5zXy739fS
 ue7HtPcjqtjKC8WK8Vl/HKibcvB5nybFnIhSxyvdoOLlx3VlpCx9ZkMuzvPS6A+S1LbM
 SG4HTsJ/7psCwHfo5LkeNQptKaSyeC4m3YMuhcjvfAZD5ubQHRcIf0fQWk1VETVnqrXz
 bIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4C5FLp6h8ewu/aFxtbZrKvRNJ2tPZpYX5K7pJ+IXuVQ=;
 b=lg30sWIucWkiOzYAbjOZ6Z0rESnZoUpuGDwECwsbwjOmLKbQcuOBFV2dQav+Mg53yS
 1zaeVwBp64ylriqmcBcOmIHgLgfyPxDsx7MvlPXDvPMtM//eob87u6b0zBvA6BasTkAt
 W/+IhNYrPa7zQBDcdifLPBta/RurvBS733eGEaafUaEJJ94w2jMeQcA4cwBAXms9hsPZ
 0H6n0VJnf3MSJRdmMagJMyy9yEo50m5N/9/LD5ZWRidtSL3WwGkNfIK7g7W22uJOMfiW
 ts1xG6+yu895GTGf8GTw4SRQwQd6UXgMRa1bzoLGTsPkp6icETqiuGwiQ+0jhsPNxNeL
 mJbg==
X-Gm-Message-State: AFqh2kpgFPsCjzlJIkcoBUvmRYuVWxBilAkVGVM4T+l6HrGVoHuI4THQ
 WWj6Iu3cnd/eLQaXhIzJsGqwt3qNu3i2rkIfTcYdqLEY
X-Google-Smtp-Source: AMrXdXuxLtGR2WLKphDh9JkR/Y2PkT8wZwk3kos3khUg7sJR4wLoGJexfGQ8db6yZJffBdD5UC1o6dZBI/j8HyGEfPY=
X-Received: by 2002:a25:344a:0:b0:803:60ae:431c with SMTP id
 b71-20020a25344a000000b0080360ae431cmr4749629yba.642.1675189200718; Tue, 31
 Jan 2023 10:20:00 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QXBKPXj2vf3wuK2QGdX+HZa_Nu3A+RT6hYnXJrUKTY4Fg@mail.gmail.com>
 <CAJSP0QWDMv2yFkORzKt+p45ykiY=AmZCbrS464nZOqEtOz-NqA@mail.gmail.com>
 <874js661lu.fsf@linaro.org>
In-Reply-To: <874js661lu.fsf@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 31 Jan 2023 13:19:48 -0500
Message-ID: <CAJSP0QVN1VVHEms=7p9pwJRDDk6vM+Xvk3Wzi04w7e=+0G+F2g@mail.gmail.com>
Subject: Re: virtio-sound Google Summer of Code project?
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: chouhan.shreyansh2702@gmail.com, Gerd Hoffmann <kraxel@redhat.com>, 
 Laurent Vivier <Laurent@vivier.eu>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>, qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb36.google.com
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

On Tue, 31 Jan 2023 at 12:43, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Stefan Hajnoczi <stefanha@gmail.com> writes:
>
> > On Sun, 29 Jan 2023 at 17:10, Stefan Hajnoczi <stefanha@gmail.com> wrot=
e:
> >>
> >> Hi Shreyansh, Gerd, and Laurent,
> >> The last virtio-sound RFC was sent in February last year. It was a
> >> spare time project. Understandably it's hard to complete the whole
> >> thing on weekends, evenings, etc. So I wanted to suggest relaunching
> >> the virtio-sound effort as a Google Summer of Code project.
> >>
> >> Google Summer of Code is a 12-week full-time remote work internship.
> >> The intern would be co-mentored by some (or all) of us. The project
> >> goal would be to merge virtio-sound with support for both playback and
> >> capture. Advanced features for multi-channel audio, etc can be stretch
> >> goals.
> >>
> >> I haven't looked in detail at the patches from February 2022, so I
> >> don't know the exact state and whether there is enough work remaining
> >> for a 12-week internship. What do you think?
> >
> > Adding Anton.
> >
> > I have updated the old wiki page for this project idea and added it to
> > the 2023 ideas list:
> > https://wiki.qemu.org/Internships/ProjectIdeas/VirtioSound
> >
> > Please let me know if you wish to co-mentor this project!
>
> I'd be happy to help - although if someone was rust inclined I'd also be
> happy to mentor a rust-vmm vhost-user implementation of VirtIO sound.

Maybe Gerd can tell us about the QEMU audio subsystem features that
may be lost if developing a standalone vhost-user device.

Two things come to mind:
1. May not run on all host OSes that QEMU supports if it supports
fewer native audio APIs than QEMU.
2. May not support forwarding audio to remote desktop solutions that
stream audio over the network. I don't know if/how this works with
VNC/RDP/Spice, but a separate vhost-user process will need to do extra
work to send the audio over the remote desktop connection.

I have CCed Marc-Andr=C3=A9 for information on streaming audio over remote =
desktop.

Stefan

