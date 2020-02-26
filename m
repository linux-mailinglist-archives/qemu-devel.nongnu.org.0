Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA173170231
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 16:20:07 +0100 (CET)
Received: from localhost ([::1]:45694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6yTm-00026M-Tg
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 10:20:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45184)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <coiby.xu@gmail.com>) id 1j6yT2-0001d7-H2
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 10:19:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <coiby.xu@gmail.com>) id 1j6yT1-0003ep-HZ
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 10:19:20 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:37749)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <coiby.xu@gmail.com>) id 1j6yT1-0003e5-9y
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 10:19:19 -0500
Received: by mail-lj1-x243.google.com with SMTP id q23so3532748ljm.4
 for <qemu-devel@nongnu.org>; Wed, 26 Feb 2020 07:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TzRP+HoGYOApoZ6S1feAXqiCT+/Rj30YCdvMPSNUjzk=;
 b=GfPGtQkA5FX78qsk2dxHDDnFSpnTztiyzyykIGdZkVXQJf4i+z1b4Nm0Gt4oc/wNwl
 dcBP07oqduEkKmb+yPVMd2ZcjyNg0qzWDhfe9yEPS4p1mkbRPKyCa57KZoOlWUykluv9
 iV94rjh0B/PAW3C45D8EL7so3p79mRZkjr2UXEzHdthJOrZqfOxL50pP7P1FfNUv4+R+
 q4nT1S0E5Ws0F38w4DLQEJJecptA3GVWAWhAUAW+RYFC8nQapKovXim4A8FGu4i4ZUEz
 OVHIlZ4jMHi+eKlFw9XSY3KisaZPx+/iFlc8syTUbKFQSo8Cb8NjX+nHJRzDzT/GDDu3
 njUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TzRP+HoGYOApoZ6S1feAXqiCT+/Rj30YCdvMPSNUjzk=;
 b=JshgdIlSay4NaJJW3g8MOofBKc7KK+arK0MfnHCQpxHfQNrACyD3x08Ika4T7eSzmB
 WpHfTfuSyDtzkQdk6t+1AOfEikCCU58ZRn1DG6SSjzNDzN1L7JxULonKmwmpcNsWph5a
 r6M4mayiA/ZMncLqYr/SExsCJrqUzCbb3OAVBcEc2ejoTxuIHEv9fSgC90nZjZB24mJ7
 8H3p2ND60a0ymRvd0NWF85E+O9xuxLlJ8feCNvVNLJvfbI1XDKO0RXipO4W1tSHYp8p/
 o0gJXh6xDcrYOlR7ALNa+ymPz+/G3yeq/rcAX9vbswz2LsY4X6jUVv7+6a7RYZF04bA/
 kLCA==
X-Gm-Message-State: APjAAAUUNkfEw9xijr+vI7vq4WlKeVNG19EBlfP7biHbhvm7iL7moNY3
 eI1LSdmHB9O/5HfIeWlsLwNpr9x8a+mI+2zl4T8=
X-Google-Smtp-Source: APXvYqzuec76IkvsmPwIBecuqmtoJU/NCTR0z+tl+6ctwumK0SzNCUKbRYz06SC3Ip68g3Slv0JjzIrF7RYyI8tcV9g=
X-Received: by 2002:a2e:7816:: with SMTP id t22mr3272132ljc.161.1582730357303; 
 Wed, 26 Feb 2020 07:19:17 -0800 (PST)
MIME-Version: 1.0
References: <20200218050711.8133-1-coiby.xu@gmail.com>
 <20200219163815.GD1085125@stefanha-x1.localdomain>
In-Reply-To: <20200219163815.GD1085125@stefanha-x1.localdomain>
From: Coiby Xu <coiby.xu@gmail.com>
Date: Wed, 26 Feb 2020 23:18:41 +0800
Message-ID: <CAJAkqrXaqmT2pR4K1x06AeQZHvUWp-fcqnbKZq_45czO96v5PA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] vhost-user block device backend implementation
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
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
Cc: kwolf@redhat.com, bharatlkmlkvm@gmail.com, qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

Thank you for reviewing my code!

I tried to reach you on IRC. But somehow either you missed my message
or I missed your reply. So I will reply by email instead.

If we use qio_channel_set_aio_fd_handler to monitor G_IO_IN event,
i.e. use vu_dispatch as the read handler, then we can re-use
vu_message_read. And "removing the blocking recv from libvhost-user"
isn't necessary because "the operation of poll() and ppoll() is not
affected by the O_NONBLOCK flag" despite that we use
qio_channel_set_blocking before calling qio_channel_set_aio_fd_handler
to make recv non-blocking.

Previously I needed to run customized vu_kick_cb as coroutines to call
blk_co_readv/blk_co_writev directly. After taking Kevin's feedback on
v4 into consideration, now I use aio_set_fd_handler to set a read
handler for kick_fd and  this read handler will then call vu_kick_cb.


On Thu, Feb 20, 2020 at 1:58 AM Stefan Hajnoczi <stefanha@redhat.com> wrote=
:
>
> On Tue, Feb 18, 2020 at 01:07:06PM +0800, Coiby Xu wrote:
> > v4:
> >  * add object properties in class_init
> >  * relocate vhost-user-blk-test
> >  * other changes including using SocketAddress, coding style, etc.
>
> Thanks!  I think the vhost-user server code can be simplified if
> libvhost-user uses the event loop for asynchronous socket I/O.  Then
> it's no longer necessary to duplicate vu_message_read() and
> vu_kick_cb().  I've replied to Patch 1 and we can discuss on IRC if you
> want to chat about it.
>
> I've also CCed Marc-Andr=C3=A9 to see what he thinks about removing the
> blocking recv from libvhost-user and instead using the event loop (just
> like for eventfds).
>
> Stefan



--=20
Best regards,
Coiby

