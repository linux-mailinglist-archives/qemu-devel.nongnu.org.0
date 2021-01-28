Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A7B307FD7
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 21:48:50 +0100 (CET)
Received: from localhost ([::1]:60498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5EDh-0003oj-8h
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 15:48:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l5ECB-0003IU-CQ
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 15:47:15 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:16697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l5EC7-0004c4-O3
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 15:47:14 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C0E0D74581E;
 Thu, 28 Jan 2021 21:47:06 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7CEAC7456B8; Thu, 28 Jan 2021 21:47:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7B44A7456B7;
 Thu, 28 Jan 2021 21:47:06 +0100 (CET)
Date: Thu, 28 Jan 2021 21:47:06 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@gmail.com>
Subject: Re: vnc clipboard support
In-Reply-To: <CAJ+F1CJvJM0Vjdz1nU92H+x00+NdbqfoJ9TA--9-BuQ8SNmoFg@mail.gmail.com>
Message-ID: <f6bc8d6a-9ad1-1d94-ff4a-252f92357338@eik.bme.hu>
References: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
 <CAJ+F1CJvJM0Vjdz1nU92H+x00+NdbqfoJ9TA--9-BuQ8SNmoFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-134991964-1611866826=:48218"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-134991964-1611866826=:48218
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 29 Jan 2021, Marc-André Lureau wrote:
> I also had recently some thoughts about how to implement clipboard sharing
> in a more general way for QEMU.
>
> I admit I like Christophe's suggestion ("it's somebody else problem"), but
> it falls short to me as I don't know of a common open-source remoting
> solution for various operating systems, and I don't see how it could
> integrate well with our UI and remote protocols. Or look at reusing some
> VirtualBox code perhaps?

I also thought about VirtualBox may worth a look at as that supports 
clipboard sharing and there's also Synergy 
[https://en.wikipedia.org/wiki/Synergy_(software)] that I don't know much 
but it's cross platform and may support clipboard sharing. It seems to 
have an open source fork called Barrier: 
https://github.com/debauchee/barrier

Regards,
BALATON Zoltan

> Some things I keep in mind:
> - the spice protocol had a number of iterations to fix some races. It would
> be great not to repeat the same mistakes, and I don't know if VNC have the
> same flaws or not.
> - the spice agent design isn't great: the system agent proxies messages to
> the active session. It would be nice if the new solution didn't have such a
> middle-man.
> - with wayland, clipboard sharing isn't really possible. Or not in a
> seamless way at least. Today it kinda works with some X11 compatibility
> extensions, but this will eventually go away or change behaviour.
> - the GNOME desktop is working on remoting using RDP, and they are
> implementing a DBus interface for it (
> https://gitlab.gnome.org/jadahl/mutter/-/commits/wip/remote-desktop-clipboard
> )
> - it's not just about clipboard. We would also want to have some kind of
> drag and drop (even if limited to files like Spice atm). We may want some
> windowing integration. We may also want to have access to some desktop
> services: apps, documents etc.. And what's not.
>
> That leads me to think that virtio-serial is not very well suited, as it
> doesn't allow various services / processes to come and go. I see vsock as a
> much better alternative. (I also wonder if it handles control flow any
> better btw)
>
> I think we shoud work on getting the free desktops our best-class support.
> To me, this means we need to speak the lingua franca, which is DBus. The
> great thing is that DBus is also equipped to handle services that come and
> go, handling discovery, introspection etc. Various services are already
> available. As mentioned earlier, that's what the GNOME desktop will offer
> for clipboard sharing. There are good chances other desktops will follow if
> that design works, as it should be easy for them to implement the same
> service. That means good reuse of existing desktop code. Speaking DBus on
> Windows, MacOS or Android isn't an issue. However, vsock support may be a
> bit tricky atm.
>
> Fwiw, DBus doesn't yet officially support vsock connections:
> https://gitlab.freedesktop.org/dbus/dbus/-/merge_requests/200. This a minor
> detail, as once you give it a fd for transport, it doesn't really care (I
> also took care of glib!1892 and Rust zbus)
>
> Oh and of course, since this is a new daemon, it would be really a shame
> not to write it in a modern language (hint! ;-).
>
> Hope that helps,
>
>
--3866299591-134991964-1611866826=:48218--

