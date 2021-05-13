Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D56237FA7B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 17:18:59 +0200 (CEST)
Received: from localhost ([::1]:56928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhD74-0005HS-A8
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 11:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lhD5W-0004ZI-Vt
 for qemu-devel@nongnu.org; Thu, 13 May 2021 11:17:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lhD5S-0001wN-Lw
 for qemu-devel@nongnu.org; Thu, 13 May 2021 11:17:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620919037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=plGZ6EYFhgfcbD6CttUJwb+KtVzvu/Hk/P8QWtV1g5I=;
 b=f9ASSWC5ejeEftfC8NnOJHrX689K82kKQz44EfpObKpNDxr2z8glT5Kl0POvWEju5PE2HQ
 j/a85qVPNtKKTgZCQix8CXoA9Wsyyzr1dGqZcZHhB9XwB1rhW1nORWy0XDxTHToNwlMXFE
 3DfIm/VMIBHAWSl5b3mGGrrHXoBqntI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-i83YhoSWOiiDSHQg0dUSMQ-1; Thu, 13 May 2021 11:17:14 -0400
X-MC-Unique: i83YhoSWOiiDSHQg0dUSMQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32D7E1007477;
 Thu, 13 May 2021 15:17:12 +0000 (UTC)
Received: from localhost (ovpn-113-21.ams2.redhat.com [10.36.113.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A21D55D6AC;
 Thu, 13 May 2021 15:17:04 +0000 (UTC)
Date: Thu, 13 May 2021 16:17:03 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
Subject: Re: [RFC PATCH 0/9] Support for Virtio-fs daemon crash reconnection
Message-ID: <YJ1C752kyBYW9ltm@stefanha-x1.localdomain>
References: <20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com>
 <CAFQAk7gH7DUi0-wDANQQBHTPgdtQxv34k+6tr9vzftPLqJt6KQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFQAk7gH7DUi0-wDANQQBHTPgdtQxv34k+6tr9vzftPLqJt6KQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QoZnNghw2jTIKK7p"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: QEMU <qemu-devel@nongnu.org>, Xie Yongji <xieyongji@bytedance.com>,
 virtio-fs-list <virtio-fs@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--QoZnNghw2jTIKK7p
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 10, 2021 at 10:38:05PM +0800, Jiachen Zhang wrote:
> Hi all,
>=20
>=20
> We are going to develop the v2 patch for virtio-fs crash reconnection. As
> suggested by Marc-Andr=E9 and Stefan, except for the inflight I/O trackin=
g
> log area, all the other internal statuses of virtiofsd will be saved to
> some places other than QEMU. Specifically, the three lo_maps (ino_map,
> dirp_map, and fd_map) could be saved to several mmapped files, and the
> opened fds could be saved to systemd. I'd like to get some feedback on ou=
r
> further thoughts before we work on the revision.
>=20
>=20
> 1. What about by default save the opened fds as file handles to host
> kernel, instead of saving them to systemd. After some internal discussion=
,
> we think introducing systemd may introduce more uncertainness to the
> system, as we need to create one service for each daemon, and all the
> daemons may suffer the single-point failure of the systemd process.

I don't think saving file handles works 100%. The difference between an
open fd and a file handle is what happens when the inode is deleted. If
an external process deletes the inode during restart and then the fd
keeps it alive while a file handle becomes stale and the inode is gone.

Regarding systemd, it's pid 1 and cannot die - otherwise the system is
broken.

But in any case I think there are multiple options here. Whether you
choose to systemd, implement the sd_notify(3) protocol in your own
parent process, or take a different approach like a parent process with
clone(2) CLONE_FILES to avoid the communication overhead for saving
every fd, I think all of those approaches would be reasonable.

> 2. Like the btree map implementation (multikey.rs) of virtiofsd-rs, what
> about splitting the flatten lo_map implementation, which supports to be
> persisted to files, from passhtrough_ll.c to a new separated source file.
> This way, maybe we can more easily wrap it with some Rust compatible
> interfaces, and enable crash recovery for virtiofsd-rs based on it.

In the past two months I've noticed the number of virtiofsd-rs merge
requests has increased and I think the trend is that new development is
focussing on virtiofsd-rs.

If it fits into your plans then focussing on virtiofsd-rs would be fine
and then there is no need to worry about Rust compatible interfaces for
C virtiofsd.

> 3. What about dropping the dirp_map, and integrate the opened directory f=
ds
> to fd_map. The virtiofsd-rs implementation only has two maps (inodes and
> handles). In the C version, dirp_map may also unnecessary.

Maybe, but carefully:

The purpose of the maps is to safely isolate the client from the
virtiofsd's internal objects. The way I remember it is that C virtiofsd
has a separate dirp map to prevent type confusion between regular open
files and directories. The client must not trick the server into calling
readdir(3) on something that's not a struct dirent because that could be
a security issue.

However, it's possible that virtiofsd-rs is able to combine the two
because it uses syscall APIs on file descriptors instead of libc
opendir(3) so there is no possibility of type confusion. The syscall
would simply fail if the file descriptor is not O_DIRECTORY.

Stefan

--QoZnNghw2jTIKK7p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCdQu8ACgkQnKSrs4Gr
c8gE1ggAx/DMD6vK7M03AhlZWlcNvheewGIcaYwtqHR0HV4fznYMD1n9TBClC2lc
uv6XzzWvWP9NYr6fryuS/lug2Zd30NrRfEOEAxY3LXlWl3u80Dp2hN+UaMk0hSbS
SpIFXyPPQVBFyO0c/yIqjteqyLBN6/2PS6ZU9fXZM5o1sP4bAdXLl0P7YhoNHvze
T4NED1LEpI+sKAyY+7SijWS6/1W5G5t6mNK8WB6A2JAwc8lNCjvvXBeg7Nc5l7uh
2kTIRRdnXvP7doqcZpNn0cXbvZmbbngppjDl2OrY6surIWRRfJkZhRxbGEP9vl2m
jP2WFcOzAEoobqa4LbeP4wGfYRXkLg==
=D/xq
-----END PGP SIGNATURE-----

--QoZnNghw2jTIKK7p--


