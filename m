Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F3832043C
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 07:40:58 +0100 (CET)
Received: from localhost ([::1]:49838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDLwm-0007d0-Ow
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 01:40:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lDLvf-0006ts-Mq
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 01:39:47 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:42007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lDLvc-0005mF-Lj
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 01:39:47 -0500
Received: by mail-oi1-x22d.google.com with SMTP id 6so8362968ois.9
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 22:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eNR4qff0YIT/ZZTUh8HT4sj9AMm9AWp3CnqJbnKlAlU=;
 b=Epk3A9/fVJ+bup/0iiafjQmCj9y/nh7jdZygDSz4rErYAtOrgBHBGI69PkUgPnJXq4
 jImq1WZQRKaWq+AX5rMZjlFIlfEBz1skAb8YErKezZDraII4yrrmw+g1zhc5mwwL/nwq
 +fIYsrmfxgxA1GhYv4ET6ADL7P3DSU4ROsVmGx+BVwNS3tnPE03HPcBaUR6hdhu8Te20
 k/DsBjFoDPzYEwFaxmZdakTRhoFuFGsADaBVHOweU8F80zG7CQ8t300jfdV4SFrI7s3/
 IRWidQXVC5jSyK7rZKYIPVQ0sHphYcIZe8DW8ZPSYcd0O8cNE+GavdqQUN/QXKqtp9N8
 TqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eNR4qff0YIT/ZZTUh8HT4sj9AMm9AWp3CnqJbnKlAlU=;
 b=q147sz7wOVGsHBS6fjWrRK40Qa9B1Rw3QVZqz1j+8k/vxI7e99g0k4idzcAZLhvzEH
 L9HzplsmbTVSm66/fyrxAfBzMrY/5HYLyUvcgAAqrS81cL+yPJIl5uqwhyxJXhoWcupP
 t4T9EH9v4gsRqwcoag69DaAfPVIX0HWyYwK9cxY7MMrOIDWt9qVNKwkTcTy/4I2t0CxN
 ln+ovXUQH1ixHe5akiVbf0hy61HwJ6Bz1IE9YPFH7hqxbXik21iUOQwkQmwLEV1IFB16
 6YRG2dnZOaV42s7HeSb0bvUku4sO4Yi9hjzPdIT8hFvf7dZnZeIHA9K6PAC8DBV1KjvB
 76Vw==
X-Gm-Message-State: AOAM533cP5D7Sm+6z5LSBIA20PcToUamaIXp/IEBLDBjDvkW8Sq6ezXB
 QH96Bh9hHieXuE73q34J39lSDhbIeMsUiiCECpI=
X-Google-Smtp-Source: ABdhPJyFeK1/qCX0AAntCrJUR3fpXBHeFjFUwdncvgqFrH712E8gu2eANg18AhvLToJdiXyBT4KEic813JuJ3A2JF2w=
X-Received: by 2002:a05:6808:14ce:: with SMTP id
 f14mr8982467oiw.59.1613803182718; 
 Fri, 19 Feb 2021 22:39:42 -0800 (PST)
MIME-Version: 1.0
References: <20210218134947.1860-1-phillip.ennen@gmail.com>
In-Reply-To: <20210218134947.1860-1-phillip.ennen@gmail.com>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Sat, 20 Feb 2021 07:39:31 +0100
Message-ID: <CABLmASG8=A0SQeEtjg_s9-aj6uupe_eYgAupGxYSx+n6=kVeeA@mail.gmail.com>
Subject: Re: [PATCH v4] net/macos: implement vmnet-based netdev
To: phillip.ennen@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=hsp.cat7@gmail.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 jasowang@redhat.com, qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, phillip@axleos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 18, 2021 at 2:49 PM <phillip.ennen@gmail.com> wrote:
>
> From: Phillip Tennen <phillip@axleos.com>
>
> This patch implements a new netdev device, reachable via -netdev
> vmnet-macos, that=E2=80=99s backed by macOS=E2=80=99s vmnet framework.
>
> The vmnet framework provides native bridging support, and its usage in
> this patch is intended as a replacement for attempts to use a tap device
> via the tuntaposx kernel extension. Notably, the tap/tuntaposx approach
> never would have worked in the first place, as QEMU interacts with the
> tap device via poll(), and macOS does not support polling device files.
>
> vmnet requires either a special entitlement, granted via a provisioning
> profile, or root access. Otherwise attempts to create the virtual
> interface will fail with a =E2=80=9Cgeneric error=E2=80=9D status code. Q=
EMU may not
> currently be signed with an entitlement granted in a provisioning
> profile, as this would necessitate pre-signed binary build distribution,
> rather than source-code distribution. As such, using this netdev
> currently requires that qemu be run with root access. I=E2=80=99ve opened=
 a
> feedback report with Apple to allow the use of the relevant entitlement
> with this use case:
> https://openradar.appspot.com/radar?id=3D5007417364447232
>
> vmnet offers three operating modes, all of which are supported by this
> patch via the =E2=80=9Cmode=3Dhost|shared|bridge=E2=80=9D option:
>
> * "Host" mode: Allows the vmnet interface to communicate with other
> * vmnet
> interfaces that are in host mode and also with the native host.
> * "Shared" mode: Allows traffic originating from the vmnet interface to
> reach the Internet through a NAT. The vmnet interface can also
> communicate with the native host.
> * "Bridged" mode: Bridges the vmnet interface with a physical network
> interface.
>
> Each of these modes also provide some extra configuration that=E2=80=99s
> supported by this patch:
>
> * "Bridged" mode: The user may specify the physical interface to bridge
> with. Defaults to en0.
> * "Host" mode / "Shared" mode: The user may specify the DHCP range and
> subnet. Allocated by vmnet if not provided.
>
> vmnet also offers some extra configuration options that are not
> supported by this patch:
>
> * Enable isolation from other VMs using vmnet
> * Port forwarding rules
> * Enabling TCP segmentation offload
> * Only applicable in "shared" mode: specifying the NAT IPv6 prefix
> * Only available in "host" mode: specifying the IP address for the VM
> within an isolated network
>
> Note that this patch requires macOS 10.15 as a minimum, as this is when
> bridging support was implemented in vmnet.framework.
>
> Signed-off-by: Phillip Tennen <phillip@axleos.com>

Hi Phillip,

Thanks for the updated patch.
I have a small problem applying it with either git am or patch. I have
to manually fix configure. This has been the case from v1 up to now:

hsp@hsps-Catalina-VB
qemu-master % patch -p1 <
../patches/qemu/v4-net-macos-implement-vmnet-based-netdev.patch
patching file configure
Hunk #1 FAILED at 778.
1 out of 1 hunk FAILED -- saving rejects to file configure.rej
patching file net/clients.h
patching file net/meson.build
patching file net/net.c
patching file net/vmnet-macos.c
patching file qapi/net.json
patching file qemu-options.hx
Hunk #1 succeeded at 2507 (offset 24 lines).

Best,
Howard

