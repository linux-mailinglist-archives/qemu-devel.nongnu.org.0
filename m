Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE128307CF7
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 18:50:36 +0100 (CET)
Received: from localhost ([::1]:40674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5BRD-0004Lh-SG
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 12:50:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cdupontd@redhat.com>)
 id 1l5BH4-0005sK-JE
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:40:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cdupontd@redhat.com>)
 id 1l5BH1-0007A0-72
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:40:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611855602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hejCBXBXC741KgvVjxww0wR93DpMfBTI9g/2rrzyp68=;
 b=Tc/W3dTQg7F6mP00xwSy8w+Zf1cypl0pItJ+R3uP0iuqFz0nfx+c4eod3sXN4SIg0RkOgd
 4hnwmR1t+VIUwIh2aBbkzfo8adV/I/hNSg+JYkNZqxfqk1W+KWJXlie05Sz60jOl3l3Q/X
 +oEXFde6Nl9wK3cJMmHdzhASLcwYvXw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-16G5Tf7VN2a4mXCOSYQKsg-1; Thu, 28 Jan 2021 12:38:46 -0500
X-MC-Unique: 16G5Tf7VN2a4mXCOSYQKsg-1
Received: by mail-wm1-f72.google.com with SMTP id h25so2479465wmb.6
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 09:38:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=fc0Pjd5MurVKwrtD4B9DK9otTNTs6o6j8mDhd+FwpXE=;
 b=IMif98KGmnmRGIMApBaEXzwpcwDj6pwCZT+Tuf6+RlvH53QfzN7GGzWR6MlZFhiIy2
 FOES/ACzo5wmsaA/sguVPTtfy1PGlOW7WZnv9eqvz4Ocb91geQUY2uilz6TWCT8Pgw7B
 pPVuLx9szJTtqvdKJjTMDtvu0EeIDTH84Ef35V44H4/RicWOp4B5M8HJ0MjOGkSH+UAt
 rXkvB0W+/TZnY1Za/tDrv07TYBFV3UrcsxrAlqAVYXlMKjaKaCmZxvJVFPN8f3K0vN/l
 avdL04Qab6Vz9aRf/FL6vJhmiYZ7hQIeZ9rZbp/OhMumHkympYkysp09ULgLMDgcFuE6
 iCBw==
X-Gm-Message-State: AOAM531TZPOlIa/wU9YGMoY7z4dxd6OspyIp95LMz/2iAaHON7/BlZ0E
 gR9CbhKgJmXJspoubOhtUjAN77tATpieFDv9Fml3hpQclvfy1+pe8hFldMWd2xK0PDUHOhgI1Nf
 EgBFWI5+KqrKy7mo=
X-Received: by 2002:a5d:690e:: with SMTP id t14mr253438wru.64.1611855525595;
 Thu, 28 Jan 2021 09:38:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDamtH6ZVZ8ZVcmtA1/zb+WvtoB3dqlDf8IOLsQfOgLLyq5PvRHl58BvO4io5ZDQeJ8HMz1g==
X-Received: by 2002:a5d:690e:: with SMTP id t14mr253425wru.64.1611855525354;
 Thu, 28 Jan 2021 09:38:45 -0800 (PST)
Received: from ?IPv6:2a01:e0a:466:71c0:b806:f900:b9dc:9b2b?
 ([2a01:e0a:466:71c0:b806:f900:b9dc:9b2b])
 by smtp.gmail.com with ESMTPSA id u14sm6391242wml.19.2021.01.28.09.38.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Jan 2021 09:38:44 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: vnc clipboard support
From: Christophe de Dinechin <cdupontd@redhat.com>
In-Reply-To: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
Date: Thu, 28 Jan 2021 18:38:43 +0100
Message-Id: <C26A91E6-A5AE-4258-A470-91B6B5BC7C7F@redhat.com>
References: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cdupontd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cdupontd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 28 Jan 2021, at 18:12, Gerd Hoffmann <kraxel@redhat.com> wrote:
>=20
>  Hi folks,
>=20
> I'm looking for a good way to implement cut+paste support for vnc.
>=20
> The vnc core protocol has support for text/plain cut+paste, and there
> is an extension adding support for other formats.  That'll cover one
> part of the problem, exchanging cut+paste data between vnc client and
> qemu vnc server.
>=20
> The tricky part is the second: the guest <=3D> qemu communication.
> I see basically two possible approaches here:
>=20
>  (1) Have some guest agent (spice does it that way).
>      Advantage: more flexible, allows more features.
>      Disadvantage: requires agent in the guest.

What about running the option to relay data to a VNC server in the
guest if there is one running? In other words, using an existing
VNC server as an agent, with the option of having a stripped-down,
clipboard only VNC server as a later optimization.

The benefit I see is that the work of adjusting between the VNC
clipboard protocol and the local OS clipboard is something that is
likely already done when porting VNC, so you leverage that, even
for exotic operating systems. And in many cases, VNC may already
be part of the distro / OS, or at least easy to find.

Then it's a matter of choice whether you want to talk to some
real guest network, or use a character device and route data
through some other non-network path.

>=20
>  (2) Send text as key events.
>      Advantage: no guest agent needed.
>      Disadvantage: is translated by guests keyboard map, so qemu
>      needs to know the map for proper char -> key event translation.
>      Only works for text/plain and only for chars you can easily
>      type, anything needing input methods (emoji =F0=9F=98=8A for example=
)
>      isn't going to fly.


>=20
> I think that (1) is clearly the better way.  Given that the agent
> would need to run in user wayland/xorg session context the existing
> qemu-guest-agent will not work.  Also linking against some UI library
> like gtk3 for clipboard handling is not something we want for the
> qemu-guest-agent.  So we need another one, I'll name it
> qemu-clipboard-agent for the rest of this mail.  And we need a
> communication channel.
>=20
> I'd tend to model the qemu-clipboard-agent simliar to the
> qemu-guest-agent, i.e. have some stream as communication path and run
> some stream protocol over it.
>=20
> Stream options I see are (in order of personal preference):
>=20
>  (1) New virtio-serial port.  virtio-serial likely is there anyway
>      for the qemu-guest-agent ...
>=20
>  (2) Have qemu-clipboard-agent and qemu-guest-agent share the agent
>      channel, i.e. qemu-clipboard-agent will proxy everything through
>      qemu-guest-agent (spice does it that way).
>=20
> Protocol options I see are (not sure yet which to prefer, need to have
> a closer look at the candidates):
>=20
>  (1) Add clipboard commands to QMP and use these.
>=20
>  (2) Reuse the clipboard bits of the vnc protocol (forward
>      VNC_MSG_CLIENT_CUT_TEXT messages to the guest agent)
>=20
>  (3) Reuse the clipboard bits of the spice-agent protocol.
>=20
>  (4) Reuse the clipboard bits of the wayland protocol.
>=20
> Once we have sorted the qemu <-> guest communication path it should be
> possible to also hook up other UIs (specifically gtk) without too much
> effort.  Which probably makes (2) a rather poor choice.
>=20
> Comments?
> Suggestions?
> Other ideas?
>=20
> take care,
>  Gerd
>=20
>=20


