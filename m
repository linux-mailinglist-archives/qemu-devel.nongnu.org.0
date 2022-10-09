Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B321A5F898A
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Oct 2022 07:54:44 +0200 (CEST)
Received: from localhost ([::1]:43066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohPGt-0000oh-Qp
	for lists+qemu-devel@lfdr.de; Sun, 09 Oct 2022 01:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ohPEm-0006Pk-QF
 for qemu-devel@nongnu.org; Sun, 09 Oct 2022 01:52:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ohPEk-0005zZ-7V
 for qemu-devel@nongnu.org; Sun, 09 Oct 2022 01:52:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665294749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sQWuzJ5zPt9Aut7HvDXn8FErHhmAAbg+Ic5q1AGsQe4=;
 b=EYIeKF/9TzNvUIZa+k7gdlvxN0QKqHd4yTFW8+GkNxJuQTYMOPDB2YfSkdI5ZS/O572eib
 qPUn5aRHjw31QitsqOXxHrmbtbXWyg4u7YY/ulyb6Pkj6AWxZT2fSZVTAAULR/qnL1optA
 Sl1Low4Et9gnb6+GgJdLjUztFfjU4nA=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-482-t8Z_3UgqN029ZZ14lBBHWA-1; Sun, 09 Oct 2022 01:52:27 -0400
X-MC-Unique: t8Z_3UgqN029ZZ14lBBHWA-1
Received: by mail-oi1-f197.google.com with SMTP id
 j186-20020aca3cc3000000b003542949670eso3615971oia.6
 for <qemu-devel@nongnu.org>; Sat, 08 Oct 2022 22:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sQWuzJ5zPt9Aut7HvDXn8FErHhmAAbg+Ic5q1AGsQe4=;
 b=ngigLE7S6eInjZlKMJW42k0O3SHqExwyhmmAVSOVxi3ylTkC3cjdP398SfVcVnKXxS
 Y1usVEn31aSPZW+89m3PpDoA4m+CqrenyBpvbXoEPf0Pu6dL4A8jmjoLeOptLpWPahmn
 K3xzQudzLuEhWomj7mbHI5E7LgYxpu8a3DxFgxvfVN221Etf+Ls0xEvqG+qeElZonvOt
 WDs65nULncHskO/EnWr+TFT/1vY7S9wu9mqwgRuPNHQ0bF70+r7XUY1EaLsWXi4oUwsg
 vXQr/w0rn/o71Ljlsk6p/aeDdmANH9m6L0GzwdyDiQQ63mE7AifVtUsaAPykQF8ZZBp1
 /gBQ==
X-Gm-Message-State: ACrzQf1WIq34zqzfOxvDC/IdxQjJdCsc3gwNJrp8A6h1CCGMjIwfS6+P
 p3TYmaktmInpAIQn4dLFHm40Xx0NACpxqNk3vLNtI+h/SXP23EVjqOO9Wqi6exRZGJEeXTiS32Q
 iJiP4O9iqJrwA25yiMgZRO/UYDWuHh10=
X-Received: by 2002:a05:6870:eca8:b0:132:df46:5c66 with SMTP id
 eo40-20020a056870eca800b00132df465c66mr6136459oab.280.1665294747124; 
 Sat, 08 Oct 2022 22:52:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7qYNsNatIFmL9P2Lg/4n7FYBHgDCZ/W5tmclL2yYbgWBe43ZRpFb5yWb9Yw8SL7D5Fnd8akwf6P6+RUdxThnM=
X-Received: by 2002:a05:6870:eca8:b0:132:df46:5c66 with SMTP id
 eo40-20020a056870eca800b00132df465c66mr6136443oab.280.1665294746916; Sat, 08
 Oct 2022 22:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20221005162051.1120041-1-lvivier@redhat.com>
 <20221006071948-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221006071948-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Sun, 9 Oct 2022 13:52:11 +0800
Message-ID: <CACGkMEutaeUPgeS1ZqhzuwoVJy3YpuQ_oZx6YkSCBvkdxAe+VA@mail.gmail.com>
Subject: Re: [PATCH v10 00/17] qapi: net: add unix socket type support to
 netdev backend
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Markus Armbruster <armbru@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Greg Kurz <groug@kaod.org>, Ralph Schmieder <ralph.schmieder@gmail.com>,
 Stefano Brivio <sbrivio@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 6, 2022 at 7:21 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Oct 05, 2022 at 06:20:34PM +0200, Laurent Vivier wrote:
> > "-netdev socket" only supports inet sockets.
> >
> > It's not a complex task to add support for unix sockets, but
> > the socket netdev parameters are not defined to manage well unix
> > socket parameters.
>
> Looks good.
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>
> Belongs in Jason's tree.

I've queued this series.

Thanks


>
> > As discussed in:
> >
> >   "socket.c added support for unix domain socket datagram transport"
> >   https://lore.kernel.org/qemu-devel/1C0E1BC5-904F-46B0-8044-68E43E67BE=
60@gmail.com/
> >
> > This series adds support of unix socket type using SocketAddress QAPI s=
tructure.
> >
> > Two new netdev backends, "stream" and "dgram" are added, that are barel=
y a copy of "socket"
> > backend but they use the SocketAddress QAPI to provide socket parameter=
s.
> > And then they also implement unix sockets (TCP and UDP).
> >
> > Some examples of CLI syntax:
> >
> >   for TCP:
> >
> >   -netdev stream,id=3Dsocket0,addr.type=3Dinet,addr.host=3Dlocalhost,ad=
dr.port=3D1234
> >   -netdev stream,id=3Dsocket0,server=3Doff,addr.type=3Dinet,addr.host=
=3Dlocalhost,addr.port=3D1234
> >
> >   -netdev dgram,id=3Dsocket0,\
> >           local.type=3Dinet,local.host=3Dlocalhost,local.port=3D1234,\
> >           remote.type=3Dinet,remote.host=3Dlocalhost,remote.port=3D1235
> >
> >   for UNIX:
> >
> >   -netdev stream,id=3Dsocket0,addr.type=3Dunix,addr.path=3D/tmp/qemu0
> >   -netdev stream,id=3Dsocket0,server=3Doff,addr.type=3Dunix,addr.path=
=3D/tmp/qemu0
> >
> >   -netdev dgram,id=3Dsocket0,\
> >           local.type=3Dunix,local.path=3D/tmp/qemu0,\
> >           remote.type=3Dunix,remote.path=3D/tmp/qemu1
> >
> >   for FD:
> >
> >   -netdev stream,id=3Dsocket0,addr.type=3Dfd,addr.str=3D4
> >   -netdev stream,id=3Dsocket0,server=3Doff,addr.type=3Dfd,addr.str=3D5
> >
> >   -netdev dgram,id=3Dsocket0,local.type=3Dfd,addr.str=3D4
> >
> > v10:
> >   - add Red Hat copyright
> >   - initialize dgram_dst to NULL in SOCKET_ADDRESS_TYPE_FD
> >   - remove redundente _stream / _dgram in functions name
> >   - move net_dgram_init() into net_init_dgram()
> >   - address Thomas' comments on qtest
> >   - add a function qemu_set_info_str() to set info string
> >   - tested stream netdev with fd type using qrap/passt and
> >     "-netdev stream,addr.type=3Dfd,server=3Doff,addr.str=3D5,id=3Dnetde=
v0"
> >
> > v9:
> >   - add events to report stream connection/disconnection
> >   - remove from net/dgram.c send_fn, listen_fd, net_dgram_accept()
> >     net_dgram_connect() and net_dgram_send() that are only
> >     needed by net/stream.c
> >   - remove from net/stream.c send_fn
> >   - add Red Hat copyright
> >   - add original net/socket.c Stefano's patch (EINVAL)
> >
> > v8:
> >   - test ipv4 and ipv6 parameters (stream inet)
> >   - test abstract parameter (stream unix)
> >   - add SocketAddressInet supported parameters in qemu-options.hx
> >     (only stream, supported by the move to QIO)
> >   - with qio_channel_writev() replace (ret =3D=3D -1 && errno =3D=3D EA=
GAIN)
> >     by (ret =3D=3D QIO_CHANNEL_ERR_BLOCK)
> >
> > v7:
> >   - add qtests
> >   - update parameters table in net.json
> >   - update socket_uri() and socket_parse()
> >
> > v6:
> >   - s/netdev option/-netdev option/ PATCH 4
> >   - s/ / /
> >   - update @NetdevStreamOptions and @NetdevDgramOptions comments
> >   - update PATCH 4 description message
> >   - add missing return in error case for unix stream socket
> >   - split socket_uri() patch: move and rename, then change content
> >
> > v5:
> >   - remove RFC prefix
> >   - put the change of net_client_parse() into its own patch (exit() in =
the
> >     function)
> >   - update comments regarding netdev_is_modern() and netdev_parse_moder=
n()
> >   - update error case in net_stream_server_init()
> >   - update qemu-options.hx with unix type
> >   - fix HMP "info network" with unix protocol/server side.
> >
> > v4:
> >   - net_client_parse() fails with exit() rather than with return.
> >   - keep "{ 'name': 'vmnet-host', 'if': 'CONFIG_VMNET' }" on its
> >     own line in qapi/net.json
> >   - add a comment in qapi/net.json about parameters usage
> >   - move netdev_is_modern() check to qemu_init()
> >   - in netdev_is_modern(), check for JSON and use qemu_opts_do_parse()
> >     to parse parameters and detect type value.
> >   - add a blank line after copyright comment
> >
> > v3:
> >   - remove support of "-net" for dgram and stream. They are only
> >     supported with "-netdev" option.
> >   - use &error_fatal directly in net_client_inits()
> >   - update qemu-options.hx
> >   - move to QIO for stream socket
> >
> > v2:
> >   - use "stream" and "dgram" rather than "socket-ng,mode=3Dstream"
> >     and ""socket-ng,mode=3Ddgram"
> >   - extract code to bypass qemu_opts_parse_noisily() to
> >     a new patch
> >   - do not ignore EINVAL (Stefano)
> >   - fix "-net" option
> >
> > CC: Ralph Schmieder <ralph.schmieder@gmail.com>
> > CC: Stefano Brivio <sbrivio@redhat.com>
> > CC: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > CC: Markus Armbruster <armbru@redhat.com>
> >
> > Laurent Vivier (15):
> >   net: introduce convert_host_port()
> >   net: remove the @errp argument of net_client_inits()
> >   net: simplify net_client_parse() error management
> >   qapi: net: introduce a way to bypass qemu_opts_parse_noisily()
> >   net: introduce qemu_set_info_str() function
> >   qapi: net: add stream and dgram netdevs
> >   net: stream: add unix socket
> >   net: dgram: make dgram_dst generic
> >   net: dgram: move mcast specific code from net_socket_fd_init_dgram()
> >   net: dgram: add unix socket
> >   qemu-sockets: move and rename SocketAddress_to_str()
> >   qemu-sockets: update socket_uri() and socket_parse()  to be consisten=
t
> >   net: stream: move to QIO to enable additional parameters
> >   tests/qtest: netdev: test stream and dgram backends
> >   net: stream: add QAPI events to report connection state
> >
> > Stefano Brivio (2):
> >   net: socket: Don't ignore EINVAL on netdev socket connection
> >   net: stream: Don't ignore EINVAL on netdev socket connection
> >
> >  hmp-commands.hx             |   2 +-
> >  include/net/net.h           |   7 +-
> >  include/qemu/sockets.h      |   4 +-
> >  monitor/hmp-cmds.c          |  23 +-
> >  net/clients.h               |   6 +
> >  net/dgram.c                 | 622 ++++++++++++++++++++++++++++++++++++
> >  net/hub.c                   |   2 +
> >  net/l2tpv3.c                |   3 +-
> >  net/meson.build             |   2 +
> >  net/net.c                   | 186 ++++++++---
> >  net/slirp.c                 |   5 +-
> >  net/socket.c                |  36 +--
> >  net/stream.c                | 382 ++++++++++++++++++++++
> >  net/tap-win32.c             |   3 +-
> >  net/tap.c                   |  13 +-
> >  net/vde.c                   |   3 +-
> >  net/vhost-user.c            |   3 +-
> >  net/vhost-vdpa.c            |   2 +-
> >  qapi/net.json               | 108 ++++++-
> >  qemu-options.hx             |  14 +
> >  softmmu/vl.c                |  16 +-
> >  tests/qtest/meson.build     |   1 +
> >  tests/qtest/netdev-socket.c | 417 ++++++++++++++++++++++++
> >  util/qemu-sockets.c         |  25 ++
> >  24 files changed, 1757 insertions(+), 128 deletions(-)
> >  create mode 100644 net/dgram.c
> >  create mode 100644 net/stream.c
> >  create mode 100644 tests/qtest/netdev-socket.c
> >
> > --
> > 2.37.3
> >
>


