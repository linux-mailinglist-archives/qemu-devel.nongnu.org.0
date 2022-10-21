Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2644F606F9F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 07:51:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olkwY-0000JA-14
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 01:51:42 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olkuf-0006v8-CJ
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 01:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1olkuJ-0006nO-Qg
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 01:49:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1olkuH-0005Ru-Fu
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 01:49:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666331360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vnJgyxJi0WUdobvp11tF9QEmwGMEfQeuu353PWho6+4=;
 b=MU0JeONIs+bD0r1BW1NrCrAhQRLgid7G9G9V9zY7Jv0w1Pps/zuxj48sJT2vKIaPHwun+Z
 2OeQNTg147M9QvN7zLXOrz7ctcYe/kE2OVtWi2EyWsaGyadvANX49kyx++OjvAZFhxJXmA
 xqnWUESjdls5bLc3dyCDV9PpZpuG3hg=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-338-gDql8YA1PPCvIFCiU_OLXA-1; Fri, 21 Oct 2022 01:49:18 -0400
X-MC-Unique: gDql8YA1PPCvIFCiU_OLXA-1
Received: by mail-oo1-f69.google.com with SMTP id
 c20-20020a4ad214000000b0048086d0c456so1130380oos.2
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 22:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vnJgyxJi0WUdobvp11tF9QEmwGMEfQeuu353PWho6+4=;
 b=c5V5gZ60RB6tDP9bMezVxV8ds7QVExoR6UE+emzZSzkVc8Jtpalh+5SeEHPGNLS3Pp
 EVBx5c0bGyvNmFIjJh7qztVdDF3SLUtubnGP8pPEeFq0lQkfSOMzq4TLm53aFVAgdZkP
 JEDUdMExNS0gZMCDVM9ABii3QwPAAciVf7Q308ic2AhsFqZOMryapEXefwzmOyxqi7Ar
 ug6qgNUWROUAPNdICmLtD2/MkyUxWlglL5QBP+aiCO4ka/KM6hVsTUtECOC2QxTYCbVA
 hMNmdFZ123Odn6MI2d4L+GtatUDyxkBqC5GaeTPR46MdXZMn2AhsRqev2LOyM+p5BNBF
 PDGA==
X-Gm-Message-State: ACrzQf1kJue5pOwRfl1qxnSC1Y0nCkXIf+n3aCu8qDHJE5J3pOI1r73c
 HYr4ZsTyqvFXwGfdiqrdh4TrHe2ev4CUXnExOAMBBPYq6NkSYoilkdPSWKO/H9xSXXWZW02JRww
 UpnpPQRuMgLs+i0sP4FT9CfsNQ0Nk0is=
X-Received: by 2002:a05:6871:54e:b0:13b:29b7:e2e8 with SMTP id
 t14-20020a056871054e00b0013b29b7e2e8mr1080451oal.35.1666331358174; 
 Thu, 20 Oct 2022 22:49:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5OxvlAr/sRYRZ4/SWbuH4Yd8f+24dXScokHZS5516ZdOe56EquuERpXrSwO5NnOuPdkC330Zx3Mu1qjw7Szcg=
X-Received: by 2002:a05:6871:54e:b0:13b:29b7:e2e8 with SMTP id
 t14-20020a056871054e00b0013b29b7e2e8mr1080435oal.35.1666331357894; Thu, 20
 Oct 2022 22:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221020162558.123284-1-lvivier@redhat.com>
In-Reply-To: <20221020162558.123284-1-lvivier@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 21 Oct 2022 13:49:05 +0800
Message-ID: <CACGkMEt9Hoo=GAuCUqMcBjqNvs94fEPA_GU9Z7TOh8c7Wam55Q@mail.gmail.com>
Subject: Re: [PATCH v13 00/17] qapi: net: add unix socket type support to
 netdev backend
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Paul Durrant <paul@xen.org>, 
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Eric Blake <eblake@redhat.com>, xen-devel@lists.xenproject.org, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Anthony Perard <anthony.perard@citrix.com>, 
 Ralph Schmieder <ralph.schmieder@gmail.com>,
 Stefano Brivio <sbrivio@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Fri, Oct 21, 2022 at 12:26 AM Laurent Vivier <lvivier@redhat.com> wrote:
>
> "-netdev socket" only supports inet sockets.
>
> It's not a complex task to add support for unix sockets, but
> the socket netdev parameters are not defined to manage well unix
> socket parameters.
>
> As discussed in:
>
>   "socket.c added support for unix domain socket datagram transport"
>   https://lore.kernel.org/qemu-devel/1C0E1BC5-904F-46B0-8044-68E43E67BE60=
@gmail.com/
>
> This series adds support of unix socket type using SocketAddress QAPI str=
ucture.
>
> Two new netdev backends, "stream" and "dgram" are added, that are barely =
a copy of "socket"
> backend but they use the SocketAddress QAPI to provide socket parameters.
> And then they also implement unix sockets (TCP and UDP).
>
> Some examples of CLI syntax:
>
>   for TCP:
>
>   -netdev stream,id=3Dsocket0,addr.type=3Dinet,addr.host=3Dlocalhost,addr=
.port=3D1234
>   -netdev stream,id=3Dsocket0,server=3Doff,addr.type=3Dinet,addr.host=3Dl=
ocalhost,addr.port=3D1234
>
>   -netdev dgram,id=3Dsocket0,\
>           local.type=3Dinet,local.host=3Dlocalhost,local.port=3D1234,\
>           remote.type=3Dinet,remote.host=3Dlocalhost,remote.port=3D1235
>
>   for UNIX:
>
>   -netdev stream,id=3Dsocket0,addr.type=3Dunix,addr.path=3D/tmp/qemu0
>   -netdev stream,id=3Dsocket0,server=3Doff,addr.type=3Dunix,addr.path=3D/=
tmp/qemu0
>
>   -netdev dgram,id=3Dsocket0,\
>           local.type=3Dunix,local.path=3D/tmp/qemu0,\
>           remote.type=3Dunix,remote.path=3D/tmp/qemu1
>
>   for FD:
>
>   -netdev stream,id=3Dsocket0,addr.type=3Dfd,addr.str=3D4
>   -netdev stream,id=3Dsocket0,server=3Doff,addr.type=3Dfd,addr.str=3D5
>
>   -netdev dgram,id=3Dsocket0,local.type=3Dfd,addr.str=3D4
>
> v13:
>   - fix server default in qtest
>   - use SocketAddress in event
>   - remove unwanted meson update
>   - update error message in net_init_dgram()

I've queued this version and will send pull requests shortly.

Any future comment we can do patches on top.

Thanks

>
> v12:
>   - replace NETDEV_STREAM_EOC by NETDEV_STREAM_DISCONNECTED
>   - set server=3Doff by default
>
> v11:
>   - use qemu_set_info_str() in hw/net/xen_nic.c
>   - fix link_down state in stream client mode
>   - cleanup error case in net_stream_receive()
>   - update qapi version to 7.2
>
> v10:
>   - add Red Hat copyright
>   - initialize dgram_dst to NULL in SOCKET_ADDRESS_TYPE_FD
>   - remove redundente _stream / _dgram in functions name
>   - move net_dgram_init() into net_init_dgram()
>   - address Thomas' comments on qtest
>   - add a function qemu_set_info_str() to set info string
>   - tested stream netdev with fd type using qrap/passt and
>     "-netdev stream,addr.type=3Dfd,server=3Doff,addr.str=3D5,id=3Dnetdev0=
"
>
> v9:
>   - add events to report stream connection/disconnection
>   - remove from net/dgram.c send_fn, listen_fd, net_dgram_accept()
>     net_dgram_connect() and net_dgram_send() that are only
>     needed by net/stream.c
>   - remove from net/stream.c send_fn
>   - add Red Hat copyright
>   - add original net/socket.c Stefano's patch (EINVAL)
>
> v8:
>   - test ipv4 and ipv6 parameters (stream inet)
>   - test abstract parameter (stream unix)
>   - add SocketAddressInet supported parameters in qemu-options.hx
>     (only stream, supported by the move to QIO)
>   - with qio_channel_writev() replace (ret =3D=3D -1 && errno =3D=3D EAGA=
IN)
>     by (ret =3D=3D QIO_CHANNEL_ERR_BLOCK)
>
> v7:
>   - add qtests
>   - update parameters table in net.json
>   - update socket_uri() and socket_parse()
>
> v6:
>   - s/netdev option/-netdev option/ PATCH 4
>   - s/ / /
>   - update @NetdevStreamOptions and @NetdevDgramOptions comments
>   - update PATCH 4 description message
>   - add missing return in error case for unix stream socket
>   - split socket_uri() patch: move and rename, then change content
>
> v5:
>   - remove RFC prefix
>   - put the change of net_client_parse() into its own patch (exit() in th=
e
>     function)
>   - update comments regarding netdev_is_modern() and netdev_parse_modern(=
)
>   - update error case in net_stream_server_init()
>   - update qemu-options.hx with unix type
>   - fix HMP "info network" with unix protocol/server side.
>
> v4:
>   - net_client_parse() fails with exit() rather than with return.
>   - keep "{ 'name': 'vmnet-host', 'if': 'CONFIG_VMNET' }" on its
>     own line in qapi/net.json
>   - add a comment in qapi/net.json about parameters usage
>   - move netdev_is_modern() check to qemu_init()
>   - in netdev_is_modern(), check for JSON and use qemu_opts_do_parse()
>     to parse parameters and detect type value.
>   - add a blank line after copyright comment
>
> v3:
>   - remove support of "-net" for dgram and stream. They are only
>     supported with "-netdev" option.
>   - use &error_fatal directly in net_client_inits()
>   - update qemu-options.hx
>   - move to QIO for stream socket
>
> v2:
>   - use "stream" and "dgram" rather than "socket-ng,mode=3Dstream"
>     and ""socket-ng,mode=3Ddgram"
>   - extract code to bypass qemu_opts_parse_noisily() to
>     a new patch
>   - do not ignore EINVAL (Stefano)
>   - fix "-net" option
>
> CC: Ralph Schmieder <ralph.schmieder@gmail.com>
> CC: Stefano Brivio <sbrivio@redhat.com>
> CC: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> CC: Markus Armbruster <armbru@redhat.com>
>
> Laurent Vivier (15):
>   net: introduce convert_host_port()
>   net: remove the @errp argument of net_client_inits()
>   net: simplify net_client_parse() error management
>   qapi: net: introduce a way to bypass qemu_opts_parse_noisily()
>   net: introduce qemu_set_info_str() function
>   qapi: net: add stream and dgram netdevs
>   net: stream: add unix socket
>   net: dgram: make dgram_dst generic
>   net: dgram: move mcast specific code from net_socket_fd_init_dgram()
>   net: dgram: add unix socket
>   qemu-sockets: move and rename SocketAddress_to_str()
>   qemu-sockets: update socket_uri() and socket_parse()  to be consistent
>   net: stream: move to QIO to enable additional parameters
>   tests/qtest: netdev: test stream and dgram backends
>   net: stream: add QAPI events to report connection state
>
> Stefano Brivio (2):
>   net: socket: Don't ignore EINVAL on netdev socket connection
>   net: stream: Don't ignore EINVAL on netdev socket connection
>
>  hmp-commands.hx             |   2 +-
>  hw/net/xen_nic.c            |   5 +-
>  include/net/net.h           |   7 +-
>  include/qemu/sockets.h      |   4 +-
>  monitor/hmp-cmds.c          |  23 +-
>  net/clients.h               |   6 +
>  net/dgram.c                 | 623 ++++++++++++++++++++++++++++++++++++
>  net/hub.c                   |   2 +
>  net/l2tpv3.c                |   3 +-
>  net/meson.build             |   2 +
>  net/net.c                   | 186 ++++++++---
>  net/slirp.c                 |   5 +-
>  net/socket.c                |  36 +--
>  net/stream.c                | 387 ++++++++++++++++++++++
>  net/tap-win32.c             |   3 +-
>  net/tap.c                   |  13 +-
>  net/vde.c                   |   3 +-
>  net/vhost-user.c            |   3 +-
>  net/vhost-vdpa.c            |   2 +-
>  qapi/net.json               | 115 ++++++-
>  qemu-options.hx             |  14 +
>  softmmu/vl.c                |  16 +-
>  tests/qtest/meson.build     |   1 +
>  tests/qtest/netdev-socket.c | 420 ++++++++++++++++++++++++
>  util/qemu-sockets.c         |  25 ++
>  25 files changed, 1775 insertions(+), 131 deletions(-)
>  create mode 100644 net/dgram.c
>  create mode 100644 net/stream.c
>  create mode 100644 tests/qtest/netdev-socket.c
>
> --
> 2.37.3
>
>


