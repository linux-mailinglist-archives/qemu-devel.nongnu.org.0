Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD206E1E17
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 16:27:09 +0200 (CEST)
Received: from localhost ([::1]:37554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNHbQ-0003r2-QA
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 10:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55691)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iNHXX-0001VG-Ik
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 10:23:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iNHXW-00056M-3f
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 10:23:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58626
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1iNHXV-00055l-VN
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 10:23:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571840585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JjcpAdFhDrF6Bie0KOSE6QoN1Q0xTVhWGDzTO/YDo9Y=;
 b=F07NcUvkzGZAUEWR5p+dgfOL3ZSBAaZp2VHfTiDZ1JgLEMnD1MfLsBj6xyaSQYWjsj9soZ
 8tLBJQqS0/uunxKdpG3MCAqODQFIwyj79MlDyVCorG5Uc2vBW5VvmS9giBuoVkTzZaNyKE
 gh57lnt1Hz6CGspNVYDsq5TCelGmc1U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-62JxMkcRNwukLHhy15Y9SQ-1; Wed, 23 Oct 2019 10:23:01 -0400
X-MC-Unique: 62JxMkcRNwukLHhy15Y9SQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FBBF5E4;
 Wed, 23 Oct 2019 14:23:00 +0000 (UTC)
Received: from localhost (unknown [10.36.118.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C32B619C78;
 Wed, 23 Oct 2019 14:22:59 +0000 (UTC)
Date: Wed, 23 Oct 2019 15:22:58 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Dietmar Maurer <dietmar@proxmox.com>
Subject: Re: [PATCH v3] yield_until_fd_readable: make it work with any
 AioContect
Message-ID: <20191023142258.GE9574@stefanha-x1.localdomain>
References: <20191021085055.30852-1-dietmar@proxmox.com>
MIME-Version: 1.0
In-Reply-To: <20191021085055.30852-1-dietmar@proxmox.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0QFb0wBpEddLcDHQ"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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

--0QFb0wBpEddLcDHQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 21, 2019 at 10:50:55AM +0200, Dietmar Maurer wrote:
> -static void fd_coroutine_enter(void *opaque)
> -{
> -    FDYieldUntilData *data = opaque;
> -    qemu_set_fd_handler(data->fd, NULL, NULL, NULL);
> -    qemu_coroutine_enter(data->co);
> -}
> -
>  void coroutine_fn yield_until_fd_readable(int fd)
>  {
> -    FDYieldUntilData data;
> -
>      assert(qemu_in_coroutine());
> -    data.co = qemu_coroutine_self();
> -    data.fd = fd;
> -    qemu_set_fd_handler(fd, fd_coroutine_enter, NULL, &data);
> +    AioContext *ctx = qemu_get_current_aio_context();
> +    aio_set_fd_handler(ctx, fd, false, (IOHandler *)qemu_coroutine_enter,
> +                       NULL, NULL, qemu_coroutine_self());

This cast is unsafe.  If qemu_coroutine_enter()'s prototype is changed
there will be no compiler warning that the prototypes are now
incompatible.

Please keep fd_coroutine_enter() so the code is type-safe.

--0QFb0wBpEddLcDHQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl2wYkIACgkQnKSrs4Gr
c8gTxggAtYwgQFZlJbejWLBzqXi3QbeEpg2clli8JR/wfdDHa+MUIlLW7WAy45Bg
t77YlG3G/gUIC1IAEP/IVeMg3yj6k34UG9s8TGdCKMi0epvGfapBaG1ZjbmpRrA6
gZw6xAZwWf7Eb84HmTicDmTHsNqSC+N1FymiYDvA6XO4hsD33YUMhnRPHT7BeGxY
OHIGbFMjJmykg2XXE+YzddVGQ+5YQMWhCSFrznr77dof37RHxLlQOJHMXKglpM8h
T+kuxSueVO2MrPGX+l2GgUH5E7uKs9k9md0VEmZnelRKUw+lBmMcfy2x4aXXTcSc
ur44kFzMsOlOwOHKC3KVsTpI3wIxvA==
=UAOu
-----END PGP SIGNATURE-----

--0QFb0wBpEddLcDHQ--


