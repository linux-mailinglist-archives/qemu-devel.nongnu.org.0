Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5128B4B74BF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 20:41:48 +0100 (CET)
Received: from localhost ([::1]:56728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK3hq-0002Qb-3z
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 14:41:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1nK3Qo-0003tY-7w
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:24:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1nK3Qh-0005h8-4b
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:24:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644953041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JX3x6pSK/fttoMuvpC4eH2cYfK90oLgbChT+HkbjD3g=;
 b=E374Jxfbhsm4okNa4QWNzr5aFsr6cYamrgqudK/Tx8EvHEbGuWn8a9t0YCW2tbvjfj/Zvj
 F3IjgO8fCjb43aQnxhzzmqTH6jC637fuM9LLm0dD3DfS0MJx8UEIR0orh2B0Gw01ZeIbsn
 goUrHxeWkrSIn9jCEivLs36L8X8ZcPk=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-YH0GZgOaP7mt8uVk5tVVgA-1; Tue, 15 Feb 2022 14:23:55 -0500
X-MC-Unique: YH0GZgOaP7mt8uVk5tVVgA-1
Received: by mail-lj1-f198.google.com with SMTP id
 p9-20020a2ea409000000b0023ced6b0f51so7605202ljn.19
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 11:23:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JX3x6pSK/fttoMuvpC4eH2cYfK90oLgbChT+HkbjD3g=;
 b=DEu/HNhAc3tLgUOEOw4voua+qk4Xd76B9Mw9bupBMavgGsCUPiF5/UBrf8DAOMZNS1
 kv6zlbA1Q0YstxHfVI33pU2BN/NipR9XrSL0LgZgxNzjio25Koh5fz0vm/oeyiB8ZbkT
 gxK5/e9MdYL1BeLJQYV2ys7d1RZEVPsnRu6/Nmd7B2somcC+FVvu0jz4KeVy/leu88/6
 96z1vSM8WekhCq/XDgCfTlVX73oeU/eUy5NS0HiVLT+/HCWrDk4bAb6uOqEjhZ/0IyNv
 B42XrB4uNgYiRU5VvJglKErK1MEDOOvfdQlsZ8JFB9tZ4Bnj4M7IhGmv3GiC+uN0dU8I
 XwqA==
X-Gm-Message-State: AOAM530xqCxq07SxeuY5qwMJf0gcl8IzKCtldFU77/pb0K/OY0bpBqUQ
 TmnbjwW37V3rqZnZRB5FPXfEQu3CT8ngYObXW3gjt6lIo/9IQcj3+EaWhTr2NXPNXSg43mMX2FY
 9Nv8pD5Pz79Y8xJ1+25cufzrkofXuPY0=
X-Received: by 2002:a05:6512:ba6:: with SMTP id
 b38mr475223lfv.16.1644953033410; 
 Tue, 15 Feb 2022 11:23:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwo24wjnEEildLTGbEPJ3j5F8M870YM1iqTUGp+g+WujHKJwF9uNPnjBsbXL4YpQw0gRgt6lwQuMTOOyYq36nI=
X-Received: by 2002:a05:6512:ba6:: with SMTP id
 b38mr475195lfv.16.1644953033017; 
 Tue, 15 Feb 2022 11:23:53 -0800 (PST)
MIME-Version: 1.0
References: <20220215171838.2651387-1-eblake@redhat.com>
In-Reply-To: <20220215171838.2651387-1-eblake@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Tue, 15 Feb 2022 21:23:36 +0200
Message-ID: <CAMRbyyvdBWMB9bzpkUUMO+SZj6PN8Xy0kJnvqLhB2W6vw+5iWQ@mail.gmail.com>
Subject: Re: [PATCH v2] nbd/server: Allow MULTI_CONN for shared writable
 exports
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000034a60f05d81379b0"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block <qemu-block@nongnu.org>, Richard Jones <rjones@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000034a60f05d81379b0
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 15, 2022 at 7:22 PM Eric Blake <eblake@redhat.com> wrote:

> According to the NBD spec, a server advertising
> NBD_FLAG_CAN_MULTI_CONN promises that multiple client connections will
> not see any cache inconsistencies: when properly separated by a single
> flush, actions performed by one client will be visible to another
> client, regardless of which client did the flush.  We satisfy these
> conditions in qemu when our block layer is backed by the local
> filesystem (by virtue of the semantics of fdatasync(), and the fact
> that qemu itself is not buffering writes beyond flushes).  It is
> harder to state whether we satisfy these conditions for network-based
> protocols, so the safest course of action is to allow users to opt-in
> to advertising multi-conn.  We may later tweak defaults to advertise
> by default when the block layer can confirm that the underlying
> protocol driver is cache consistent between multiple writers, but for
> now, this at least allows savvy users (such as virt-v2v or nbdcopy) to
> explicitly start qemu-nbd or qemu-storage-daemon with multi-conn
> advertisement in a known-safe setup where the client end can then
> benefit from parallel clients.
>

It makes sense, and will be used by oVirt. Actually we are already using
multiple connections for writing about 2 years, based on your promise
that if every client writes to district  areas this is safe.

Note, however, that we don't want to advertise MULTI_CONN when we know
> that a second client cannot connect (for historical reasons, qemu-nbd
> defaults to a single connection while nbd-server-add and QMP commands
> default to unlimited connections; but we already have existing means
> to let either style of NBD server creation alter those defaults).  The
> harder part of this patch is setting up an iotest to demonstrate
> behavior of multiple NBD clients to a single server.  It might be
> possible with parallel qemu-io processes, but concisely managing that
> in shell is painful.  I found it easier to do by relying on the libnbd
> project's nbdsh, which means this test will be skipped on platforms
> where that is not available.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> Fixes: https://bugzilla.redhat.com/1708300
> ---
>
> v1 was in Aug 2021 [1], with further replies in Sep [2] and Oct [3].
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg04900.html
> [2] https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg00038.html
> [3] https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg06744.html
>
> Since then, I've tweaked the QAPI to mention 7.0 (instead of 6.2), and
> reworked the logic so that default behavior is unchanged for now
> (advertising multi-conn on a writable export requires opt-in during
> the command line or QMP, but remains default for a readonly export).
> I've also expanded the amount of testing done in the new iotest.
>
>  docs/interop/nbd.txt                       |   1 +
>  docs/tools/qemu-nbd.rst                    |   3 +-
>  qapi/block-export.json                     |  34 +++-
>  include/block/nbd.h                        |   3 +-
>  blockdev-nbd.c                             |   5 +
>  nbd/server.c                               |  27 ++-
>  MAINTAINERS                                |   1 +
>  tests/qemu-iotests/tests/nbd-multiconn     | 188 +++++++++++++++++++++
>  tests/qemu-iotests/tests/nbd-multiconn.out | 112 ++++++++++++
>  9 files changed, 363 insertions(+), 11 deletions(-)
>  create mode 100755 tests/qemu-iotests/tests/nbd-multiconn
>  create mode 100644 tests/qemu-iotests/tests/nbd-multiconn.out
>
> diff --git a/docs/interop/nbd.txt b/docs/interop/nbd.txt
> index bdb0f2a41aca..6c99070b99c8 100644
> --- a/docs/interop/nbd.txt
> +++ b/docs/interop/nbd.txt
> @@ -68,3 +68,4 @@ NBD_CMD_BLOCK_STATUS for "qemu:dirty-bitmap:",
> NBD_CMD_CACHE
>  * 4.2: NBD_FLAG_CAN_MULTI_CONN for shareable read-only exports,
>  NBD_CMD_FLAG_FAST_ZERO
>  * 5.2: NBD_CMD_BLOCK_STATUS for "qemu:allocation-depth"
> +* 7.0: NBD_FLAG_CAN_MULTI_CONN for shareable writable exports
> diff --git a/docs/tools/qemu-nbd.rst b/docs/tools/qemu-nbd.rst
> index 6031f9689312..1de785524c36 100644
> --- a/docs/tools/qemu-nbd.rst
> +++ b/docs/tools/qemu-nbd.rst
> @@ -139,8 +139,7 @@ driver options if ``--image-opts`` is specified.
>  .. option:: -e, --shared=NUM
>
>    Allow up to *NUM* clients to share the device (default
> -  ``1``), 0 for unlimited. Safe for readers, but for now,
> -  consistency is not guaranteed between multiple writers.
> +  ``1``), 0 for unlimited.
>

Removing the note means that now consistency is guaranteed between
multiple writers, no?

Or maybe we want to mention here that consistency depends on the protocol
and users can opt in, or refer to the section where this is discussed?

 .. option:: -t, --persistent
>
> diff --git a/qapi/block-export.json b/qapi/block-export.json
> index f183522d0d2c..0a27e8ee84f9 100644
> --- a/qapi/block-export.json
> +++ b/qapi/block-export.json
> @@ -21,7 +21,9 @@
>  #             recreated on the fly while the NBD server is active.
>  #             If missing, it will default to denying access (since 4.0).
>  # @max-connections: The maximum number of connections to allow at the same
> -#                   time, 0 for unlimited. (since 5.2; default: 0)
> +#                   time, 0 for unlimited. Setting this to 1 also stops
> +#                   the server from advertising multiple client support
> +#                   (since 5.2; default: 0)
>  #
>  # Since: 4.2
>  ##
> @@ -50,7 +52,9 @@
>  #             recreated on the fly while the NBD server is active.
>  #             If missing, it will default to denying access (since 4.0).
>  # @max-connections: The maximum number of connections to allow at the same
> -#                   time, 0 for unlimited. (since 5.2; default: 0)
> +#                   time, 0 for unlimited. Setting this to 1 also stops
> +#                   the server from advertising multiple client support
> +#                   (since 5.2; default: 0).
>  #
>  # Returns: error if the server is already running.
>  #
> @@ -79,6 +83,26 @@
>  { 'struct': 'BlockExportOptionsNbdBase',
>    'data': { '*name': 'str', '*description': 'str' } }
>
> +##
> +# @NbdExportMultiConn:
> +#
> +# Possible settings for advertising NBD multiple client support.
> +#
> +# @off: Do not advertise multiple clients.
> +#
> +# @on: Allow multiple clients (for writable clients, this is only safe
> +#      if the underlying BDS is cache-consistent, such as when backed
> +#      by the raw file driver); ignored if the NBD server was set up
> +#      with max-connections of 1.
> +#
> +# @auto: Behaves like @off if the export is writable, and @on if the
> +#        export is read-only.
> +#
> +# Since: 7.0
> +##
> +{ 'enum': 'NbdExportMultiConn',
> +  'data': ['off', 'on', 'auto'] }
>

Are we going to have --multi-con=(on|off|auto)?


> +
>  ##
>  # @BlockExportOptionsNbd:
>  #
> @@ -95,11 +119,15 @@
>  #                    the metadata context name "qemu:allocation-depth" to
>  #                    inspect allocation details. (since 5.2)
>  #
> +# @multi-conn: Controls whether multiple client support is advertised, if
> the
> +#              server's max-connections is not 1. (default auto, since
> 7.0)
> +#
>  # Since: 5.2
>  ##
>  { 'struct': 'BlockExportOptionsNbd',
>    'base': 'BlockExportOptionsNbdBase',
> -  'data': { '*bitmaps': ['str'], '*allocation-depth': 'bool' } }
> +  'data': { '*bitmaps': ['str'], '*allocation-depth': 'bool',
> +            '*multi-conn': 'NbdExportMultiConn' } }
>
>  ##
>  # @BlockExportOptionsVhostUserBlk:
> diff --git a/include/block/nbd.h b/include/block/nbd.h
> index 78d101b77488..138b9857dbcb 100644
> --- a/include/block/nbd.h
> +++ b/include/block/nbd.h
> @@ -1,5 +1,5 @@
>  /*
> - *  Copyright (C) 2016-2020 Red Hat, Inc.
> + *  Copyright (C) 2016-2022 Red Hat, Inc.
>   *  Copyright (C) 2005  Anthony Liguori <anthony@codemonkey.ws>
>   *
>   *  Network Block Device
> @@ -346,6 +346,7 @@ void nbd_client_put(NBDClient *client);
>
>  void nbd_server_is_qemu_nbd(bool value);
>  bool nbd_server_is_running(void);
> +int nbd_server_max_connections(void);
>  void nbd_server_start(SocketAddress *addr, const char *tls_creds,
>                        const char *tls_authz, uint32_t max_connections,
>                        Error **errp);
> diff --git a/blockdev-nbd.c b/blockdev-nbd.c
> index bdfa7ed3a5a9..0df222e868d8 100644
> --- a/blockdev-nbd.c
> +++ b/blockdev-nbd.c
> @@ -44,6 +44,11 @@ bool nbd_server_is_running(void)
>      return nbd_server || is_qemu_nbd;
>  }
>
> +int nbd_server_max_connections(void)
> +{
> +    return nbd_server ? nbd_server->max_connections : -1;
> +}
>

-1 is a little bit strange for a limit, maybe 1 is a better default when
we nbd_server == NULL? When can this happen?


> +
>  static void nbd_blockdev_client_closed(NBDClient *client, bool ignored)
>  {
>      nbd_client_put(client);
> diff --git a/nbd/server.c b/nbd/server.c
> index 9fb2f264023e..f17aacc8139f 100644
> --- a/nbd/server.c
> +++ b/nbd/server.c
> @@ -1,5 +1,5 @@
>  /*
> - *  Copyright (C) 2016-2021 Red Hat, Inc.
> + *  Copyright (C) 2016-2022 Red Hat, Inc.
>   *  Copyright (C) 2005  Anthony Liguori <anthony@codemonkey.ws>
>   *
>   *  Network Block Device Server Side
> @@ -1641,7 +1641,7 @@ static int nbd_export_create(BlockExport *blk_exp,
> BlockExportOptions *exp_args,
>      int64_t size;
>      uint64_t perm, shared_perm;
>      bool readonly = !exp_args->writable;
> -    bool shared = !exp_args->writable;
> +    bool multi_conn;
>      strList *bitmaps;
>      size_t i;
>      int ret;
> @@ -1679,6 +1679,23 @@ static int nbd_export_create(BlockExport *blk_exp,
> BlockExportOptions *exp_args,
>          return size;
>      }
>
> +    /*
> +     * Determine whether to advertise multi-conn.  Default is auto,
> +     * which resolves to on for read-only and off for writable.  But
> +     * if the server has max-connections 1, that forces the flag off.
>

Looks good, this can be enabled automatically based on the driver
if we want, so users using auto will can upgrade to multi-con automatically.


> +     */
> +    if (!arg->has_multi_conn) {
> +        arg->multi_conn = NBD_EXPORT_MULTI_CONN_AUTO;
> +    }
> +    if (nbd_server_max_connections() == 1) {

+        arg->multi_conn = NBD_EXPORT_MULTI_CONN_OFF;
> +    }

+    if (arg->multi_conn == NBD_EXPORT_MULTI_CONN_AUTO) {
> +        multi_conn = readonly;
> +    } else {
> +        multi_conn = arg->multi_conn == NBD_EXPORT_MULTI_CONN_ON;
> +    }
>

This part is a little bit confusing - we do:
- initialize args->multi_con if it has not value
- set the temporary multi_con based now initialized args->multi_con

I think it will be nicer to separate arguments parsing, so there is no need
to initialize it here or have arg->has_multi_conn, but I did not check how
other arguments are handled.


> +
>      /* Don't allow resize while the NBD server is running, otherwise we
> don't
>       * care what happens with the node. */
>      blk_get_perm(blk, &perm, &shared_perm);
> @@ -1692,11 +1709,11 @@ static int nbd_export_create(BlockExport *blk_exp,
> BlockExportOptions *exp_args,
>      exp->description = g_strdup(arg->description);
>      exp->nbdflags = (NBD_FLAG_HAS_FLAGS | NBD_FLAG_SEND_FLUSH |
>                       NBD_FLAG_SEND_FUA | NBD_FLAG_SEND_CACHE);
> +    if (multi_conn) {
> +        exp->nbdflags |= NBD_FLAG_CAN_MULTI_CONN;
> +    }
>      if (readonly) {
>          exp->nbdflags |= NBD_FLAG_READ_ONLY;
> -        if (shared) {
> -            exp->nbdflags |= NBD_FLAG_CAN_MULTI_CONN;
> -        }
>      } else {
>          exp->nbdflags |= (NBD_FLAG_SEND_TRIM | NBD_FLAG_SEND_WRITE_ZEROES
> |
>                            NBD_FLAG_SEND_FAST_ZERO);v
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9814580975c5..24dd800ae3f8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3334,6 +3334,7 @@ F: qemu-nbd.*
>  F: blockdev-nbd.c
>  F: docs/interop/nbd.txt
>  F: docs/tools/qemu-nbd.rst
> +F: tests/qemu-iotests/tests/*nbd*
>  T: git https://repo.or.cz/qemu/ericb.git nbd
>  T: git https://src.openvz.org/scm/~vsementsov/qemu.git nbd
>
> diff --git a/tests/qemu-iotests/tests/nbd-multiconn
> b/tests/qemu-iotests/tests/nbd-multiconn
> new file mode 100755
> index 000000000000..0261552f32f2
> --- /dev/null
> +++ b/tests/qemu-iotests/tests/nbd-multiconn
> @@ -0,0 +1,188 @@
> +#!/usr/bin/env bash
> +# group: rw auto quick
> +#
> +# Test that qemu-nbd MULTI_CONN works
> +#
> +# Copyright (C) 2018-2022 Red Hat, Inc.
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
> +#
> +
> +seq="$(basename $0)"
> +echo "QA output created by $seq"
> +
> +status=1 # failure is the default!
> +
> +_cleanup()
> +{
> +    _cleanup_test_img
> +    _cleanup_qemu
> +    rm -f "$SOCK_DIR/nbd"
> +}
> +trap "_cleanup; exit \$status" 0 1 2 3 15
> +
> +# get standard environment, filters and checks
> +cd ..
> +. ./common.rc
> +. ./common.filter
> +. ./common.qemu
> +. ./common.nbd
> +
> +_supported_fmt qcow2
> +_supported_proto file
> +_supported_os Linux
> +_require_command QEMU_NBD
> +
> +# Parallel client connections are easier with libnbd than qemu-io:
> +if ! (nbdsh --version) >/dev/null 2>&1; then
> +    _notrun "nbdsh utility required, skipped this test"
> +fi
> +
> +echo
> +echo "=== Initial image setup ==="
> +echo
> +
> +_make_test_img 4M
> +$QEMU_IO -c 'w -P 1 0 2M' -c 'w -P 2 2M 2M' "$TEST_IMG" | _filter_qemu_io
> +_launch_qemu 2> >(_filter_nbd)
> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"qmp_capabilities"}' "return"
> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"blockdev-add",
> +  "arguments":{"driver":"qcow2", "node-name":"n",
> +    "file":{"driver":"file", "filename":"'"$TEST_IMG"'"}}}' "return"
> +export nbd_unix_socket
> +
> +echo
> +echo "=== Default nbd server settings ==="
> +echo
> +# Default allows for unlimited connections, readonly images advertise
> +# multi-conn, and writable images do not
> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"nbd-server-start",
> +  "arguments":{"addr":{"type":"unix",
> +    "data":{"path":"'"$nbd_unix_socket"'"}}}}' "return"
> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-add",
> +  "arguments":{"type":"nbd", "id":"r", "node-name":"n",
> +    "name":"r"}}' "return"
> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-add",
> +  "arguments":{"type":"nbd", "id":"w", "node-name":"n",
> +    "name":"w", "writable":true}}' "return"
> +nbdsh -u "nbd+unix:///r?socket=$nbd_unix_socket" -c '
> +assert h.can_multi_conn()
> +h.shutdown()
> +print("nbdsh passed")'
> +nbdsh -u "nbd+unix:///w?socket=$nbd_unix_socket" -c '
> +assert not h.can_multi_conn()
> +h.shutdown()
> +print("nbdsh passed")'
>

Mixing of shell and python is very confusing. Wouldn't it be much cleaner
to write the test in python?


> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-del",
> +  "arguments":{"id":"r"}}' "DELETED"
> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-del",
> +  "arguments":{"id":"w"}}' "DELETED"
> +
> +echo
> +echo "=== Per-export overrides of defaults ==="
> +echo
> +# Can explicitly disable multi-conn for readonly image, and explicitly
> +# enable it for writable image
> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-add",
> +  "arguments":{"type":"nbd", "id":"r", "node-name":"n",
> +    "name":"r", "multi-conn":"off"}}' "return"
> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-add",
> +  "arguments":{"type":"nbd", "id":"w", "node-name":"n",
> +    "name":"w", "multi-conn":"on", "writable":true}}' "return"
> +nbdsh -u "nbd+unix:///r?socket=$nbd_unix_socket" -c '
> +assert not h.can_multi_conn()
> +h.shutdown()
> +print("nbdsh passed")'
> +nbdsh -u "nbd+unix:///w?socket=$nbd_unix_socket" -c '
> +assert h.can_multi_conn()
> +h.shutdown()
> +print("nbdsh passed")'
> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-del",
> +  "arguments":{"id":"r"}}' "DELETED"
> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-del",
> +  "arguments":{"id":"w"}}' "DELETED"
> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"nbd-server-stop"}' "return"
> +
> +echo
> +echo "=== Limit nbd server max-connections ==="
> +echo
> +# When max-connections is 1, no images advertise multi-conn, even when
> +# explicitly requested per export
> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"nbd-server-start",
> +  "arguments":{"max-connections":1, "addr":{"type":"unix",
> +    "data":{"path":"'"$nbd_unix_socket"'"}}}}' "return"
> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-add",
> +  "arguments":{"type":"nbd", "id":"r", "node-name":"n",
> +    "name":"r", "multi-conn":"on"}}' "return"
> +nbdsh -u "nbd+unix:///r?socket=$nbd_unix_socket" -c '
> +assert not h.can_multi_conn()
> +h.shutdown()
> +print("nbdsh passed")'
> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-del",
> +  "arguments":{"id":"r"}}' "DELETED"
> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-add",
> +  "arguments":{"type":"nbd", "id":"w", "node-name":"n",
> +    "name":"w", "multi-conn":"on", "writable":true}}' "return"
> +nbdsh -u "nbd+unix:///w?socket=$nbd_unix_socket" -c '
> +assert not h.can_multi_conn()
> +h.shutdown()
> +print("nbdsh passed")'
> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-del",
> +  "arguments":{"id":"w"}}' "DELETED"
> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"nbd-server-stop"}' "return"
> +
> +echo
> +echo "=== Demonstrate parallel writers ==="
> +echo
> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"nbd-server-start",
> +  "arguments":{"addr":{"type":"unix",
> +    "data":{"path":"'"$nbd_unix_socket"'"}}}}' "return"
> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-add",
> +  "arguments":{"type":"nbd", "id":"w", "node-name":"n",
> +    "name":"", "multi-conn":"on", "writable":true}}' "return"
> +
> +nbdsh -c '
> +import os
> +sock = os.getenv("nbd_unix_socket")
> +h = []
> +
> +for i in range(3):
> +  h.append(nbd.NBD())
> +  h[i].connect_unix(sock)
> +  assert h[i].can_multi_conn()
>

This is somewhat C in python, maybe:

    handles = [nbd.NBD() for _ in range(3)]

    for h in handles:
        h.connect_unix(sock)
        assert h.can_multi_con()

Since assert will abort the test, and we don't handle
exceptions, failure will not shutdown the connections
but it should not matter for the purpose of a test.


> +
> +buf1 = h[0].pread(1024 * 1024, 0)
> +if buf1 != b"\x01" * 1024 * 1024:
> +  print("Unexpected initial read")
>

Not clear when we initialize the buffer to \x01 - is this the qemu-io above?


> +buf2 = b"\x03" * 1024 * 1024
> +h[1].pwrite(buf2, 0)
> +h[2].flush()
> +buf1 = h[0].pread(1024 * 1024, 0)
> +if buf1 == buf2:
> +  print("Flush appears to be consistent across connections")
>

buf1 was the initial content, buf2 is the new content, but now we override
but1 to check that the right was flushed. It will be be better to use
different
names like inittial_data, updated_data, current_data.

This block is the most important part of the test, showing that we can write
in one connection, flush in the second, and read the written block in the
third.
Maybe add a comment about this? I think it will help someone else trying
to understand what this part is trying to test.


> +
> +for i in range(3):
> +  h[i].shutdown()
>

for h in handles:
    h.shutdown()


> +'
> +
> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-del",
> +  "arguments":{"id":"w"}}' "DELETED"
> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"nbd-server-stop"}' "return"
> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"quit"}' "return"
> +wait=yes _cleanup_qemu
> +
> +# success, all done
> +echo '*** done'
> +rm -f $seq.full
> +status=0
> diff --git a/tests/qemu-iotests/tests/nbd-multiconn.out
> b/tests/qemu-iotests/tests/nbd-multiconn.out
> new file mode 100644
> index 000000000000..a06428e1536a
> --- /dev/null
> +++ b/tests/qemu-iotests/tests/nbd-multiconn.out
> @@ -0,0 +1,112 @@
> +QA output created by nbd-multiconn
> +
> +=== Initial image setup ===
> +
> +Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4194304
> +wrote 2097152/2097152 bytes at offset 0
> +2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +wrote 2097152/2097152 bytes at offset 2097152
> +2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> +{"execute":"qmp_capabilities"}
> +{"return": {}}
> +{"execute":"blockdev-add",
> +  "arguments":{"driver":"IMGFMT", "node-name":"n",
> +    "file":{"driver":"file", "filename":"TEST_DIR/t.IMGFMT"}}}
> +{"return": {}}
> +
> +=== Default nbd server settings ===
> +
> +{"execute":"nbd-server-start",
> +  "arguments":{"addr":{"type":"unix",
> +    "data":{"path":"SOCK_DIR/qemu-nbd.sock"}}}}
> +{"return": {}}
> +{"execute":"block-export-add",
> +  "arguments":{"type":"nbd", "id":"r", "node-name":"n",
> +    "name":"r"}}
> +{"return": {}}
> +{"execute":"block-export-add",
> +  "arguments":{"type":"nbd", "id":"w", "node-name":"n",
> +    "name":"w", "writable":true}}
> +{"return": {}}
> +nbdsh passed
> +nbdsh passed
> +{"execute":"block-export-del",
> +  "arguments":{"id":"r"}}
> +{"return": {}}
> +{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
> "event": "BLOCK_EXPORT_DELETED", "data": {"id": "r"}}
> +{"execute":"block-export-del",
> +  "arguments":{"id":"w"}}
> +{"return": {}}
> +{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
> "event": "BLOCK_EXPORT_DELETED", "data": {"id": "w"}}
> +
> +=== Per-export overrides of defaults ===
> +
> +{"execute":"block-export-add",
> +  "arguments":{"type":"nbd", "id":"r", "node-name":"n",
> +    "name":"r", "multi-conn":"off"}}
> +{"return": {}}
> +{"execute":"block-export-add",
> +  "arguments":{"type":"nbd", "id":"w", "node-name":"n",
> +    "name":"w", "multi-conn":"on", "writable":true}}
> +{"return": {}}
> +nbdsh passed
> +nbdsh passed
> +{"execute":"block-export-del",
> +  "arguments":{"id":"r"}}
> +{"return": {}}
> +{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
> "event": "BLOCK_EXPORT_DELETED", "data": {"id": "r"}}
> +{"execute":"block-export-del",
> +  "arguments":{"id":"w"}}
> +{"return": {}}
> +{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
> "event": "BLOCK_EXPORT_DELETED", "data": {"id": "w"}}
> +{"execute":"nbd-server-stop"}
> +{"return": {}}
> +
> +=== Limit nbd server max-connections ===
> +
> +{"execute":"nbd-server-start",
> +  "arguments":{"max-connections":1, "addr":{"type":"unix",
> +    "data":{"path":"SOCK_DIR/qemu-nbd.sock"}}}}
> +{"return": {}}
> +{"execute":"block-export-add",
> +  "arguments":{"type":"nbd", "id":"r", "node-name":"n",
> +    "name":"r", "multi-conn":"on"}}
> +{"return": {}}
> +nbdsh passed
> +{"execute":"block-export-del",
> +  "arguments":{"id":"r"}}
> +{"return": {}}
> +{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
> "event": "BLOCK_EXPORT_DELETED", "data": {"id": "r"}}
> +{"execute":"block-export-add",
> +  "arguments":{"type":"nbd", "id":"w", "node-name":"n",
> +    "name":"w", "multi-conn":"on", "writable":true}}
> +{"return": {}}
> +nbdsh passed
> +{"execute":"block-export-del",
> +  "arguments":{"id":"w"}}
> +{"return": {}}
> +{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
> "event": "BLOCK_EXPORT_DELETED", "data": {"id": "w"}}
> +{"execute":"nbd-server-stop"}
> +{"return": {}}
> +
> +=== Demonstrate parallel writers ===
> +
> +{"execute":"nbd-server-start",
> +  "arguments":{"addr":{"type":"unix",
> +    "data":{"path":"SOCK_DIR/qemu-nbd.sock"}}}}
> +{"return": {}}
> +{"execute":"block-export-add",
> +  "arguments":{"type":"nbd", "id":"w", "node-name":"n",
> +    "name":"", "multi-conn":"on", "writable":true}}
> +{"return": {}}
> +Flush appears to be consistent across connections
> +{"execute":"block-export-del",
> +  "arguments":{"id":"w"}}
> +{"return": {}}
> +{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
> "event": "BLOCK_EXPORT_DELETED", "data": {"id": "w"}}
> +{"execute":"nbd-server-stop"}
> +{"return": {}}
> +{"execute":"quit"}
> +{"return": {}}
> +{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
> "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
>

Nothing about the contents here says anything about the actual test
except the "Flush appears..." line.


> +*** done
> --
> 2.35.1
>

Looks good, feel free to ignore the style comments and suggestion to rewrite
the test in python.

Nir

--00000000000034a60f05d81379b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Feb 15, 2022 at 7:22 PM Eric Blak=
e &lt;<a href=3D"mailto:eblake@redhat.com">eblake@redhat.com</a>&gt; wrote:=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">According to the NBD spec, a server advertising<br>
NBD_FLAG_CAN_MULTI_CONN promises that multiple client connections will<br>
not see any cache inconsistencies: when properly separated by a single<br>
flush, actions performed by one client will be visible to another<br>
client, regardless of which client did the flush.=C2=A0 We satisfy these<br=
>
conditions in qemu when our block layer is backed by the local<br>
filesystem (by virtue of the semantics of fdatasync(), and the fact<br>
that qemu itself is not buffering writes beyond flushes).=C2=A0 It is<br>
harder to state whether we satisfy these conditions for network-based<br>
protocols, so the safest course of action is to allow users to opt-in<br>
to advertising multi-conn.=C2=A0 We may later tweak defaults to advertise<b=
r>
by default when the block layer can confirm that the underlying<br>
protocol driver is cache consistent between multiple writers, but for<br>
now, this at least allows savvy users (such as virt-v2v or nbdcopy) to<br>
explicitly start qemu-nbd or qemu-storage-daemon with multi-conn<br>
advertisement in a known-safe setup where the client end can then<br>
benefit from parallel clients.<br></blockquote><div><br></div><div>It makes=
 sense, and will be used by oVirt. Actually we are already using</div><div>=
multiple connections for writing about 2 years, based on your promise</div>=
<div>that if every client writes to district=C2=A0 areas this is safe.</div=
><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Note, however, that we don&#39;t want to advertise MULTI_CONN when we know<=
br>
that a second client cannot connect (for historical reasons, qemu-nbd<br>
defaults to a single connection while nbd-server-add and QMP commands<br>
default to unlimited connections; but we already have existing means<br>
to let either style of NBD server creation alter those defaults).=C2=A0 The=
<br>
harder part of this patch is setting up an iotest to demonstrate<br>
behavior of multiple NBD clients to a single server.=C2=A0 It might be<br>
possible with parallel qemu-io processes, but concisely managing that<br>
in shell is painful.=C2=A0 I found it easier to do by relying on the libnbd=
<br>
project&#39;s nbdsh, which means this test will be skipped on platforms<br>
where that is not available.<br>
<br>
Signed-off-by: Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com" target=
=3D"_blank">eblake@redhat.com</a>&gt;<br>
Fixes: <a href=3D"https://bugzilla.redhat.com/1708300" rel=3D"noreferrer" t=
arget=3D"_blank">https://bugzilla.redhat.com/1708300</a><br>
---<br>
<br>
v1 was in Aug 2021 [1], with further replies in Sep [2] and Oct [3].<br>
<br>
[1] <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg049=
00.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archive=
/html/qemu-devel/2021-08/msg04900.html</a><br>
[2] <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg000=
38.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archive=
/html/qemu-devel/2021-09/msg00038.html</a><br>
[3] <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg067=
44.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/archive=
/html/qemu-devel/2021-10/msg06744.html</a><br>
<br>
Since then, I&#39;ve tweaked the QAPI to mention 7.0 (instead of 6.2), and<=
br>
reworked the logic so that default behavior is unchanged for now<br>
(advertising multi-conn on a writable export requires opt-in during<br>
the command line or QMP, but remains default for a readonly export).<br>
I&#39;ve also expanded the amount of testing done in the new iotest.<br>
<br>
=C2=A0docs/interop/nbd.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0docs/tools/qemu-nbd.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0qapi/block-export.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 34 +++-<br>
=C2=A0include/block/nbd.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0blockdev-nbd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
=C2=A0nbd/server.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 27 ++-<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<b=
r>
=C2=A0tests/qemu-iotests/tests/nbd-multiconn=C2=A0 =C2=A0 =C2=A0| 188 +++++=
++++++++++++++++<br>
=C2=A0tests/qemu-iotests/tests/nbd-multiconn.out | 112 ++++++++++++<br>
=C2=A09 files changed, 363 insertions(+), 11 deletions(-)<br>
=C2=A0create mode 100755 tests/qemu-iotests/tests/nbd-multiconn<br>
=C2=A0create mode 100644 tests/qemu-iotests/tests/nbd-multiconn.out<br>
<br>
diff --git a/docs/interop/nbd.txt b/docs/interop/nbd.txt<br>
index bdb0f2a41aca..6c99070b99c8 100644<br>
--- a/docs/interop/nbd.txt<br>
+++ b/docs/interop/nbd.txt<br>
@@ -68,3 +68,4 @@ NBD_CMD_BLOCK_STATUS for &quot;qemu:dirty-bitmap:&quot;, =
NBD_CMD_CACHE<br>
=C2=A0* 4.2: NBD_FLAG_CAN_MULTI_CONN for shareable read-only exports,<br>
=C2=A0NBD_CMD_FLAG_FAST_ZERO<br>
=C2=A0* 5.2: NBD_CMD_BLOCK_STATUS for &quot;qemu:allocation-depth&quot;<br>
+* 7.0: NBD_FLAG_CAN_MULTI_CONN for shareable writable exports<br>
diff --git a/docs/tools/qemu-nbd.rst b/docs/tools/qemu-nbd.rst<br>
index 6031f9689312..1de785524c36 100644<br>
--- a/docs/tools/qemu-nbd.rst<br>
+++ b/docs/tools/qemu-nbd.rst<br>
@@ -139,8 +139,7 @@ driver options if ``--image-opts`` is specified.<br>
=C2=A0.. option:: -e, --shared=3DNUM<br>
<br>
=C2=A0 =C2=A0Allow up to *NUM* clients to share the device (default<br>
-=C2=A0 ``1``), 0 for unlimited. Safe for readers, but for now,<br>
-=C2=A0 consistency is not guaranteed between multiple writers.<br>
+=C2=A0 ``1``), 0 for unlimited.<br></blockquote><div><br></div><div>Removi=
ng the note means that now consistency is guaranteed between</div><div>mult=
iple writers, no?</div><div><br></div><div>Or maybe we want to mention here=
 that consistency depends on the protocol</div><div>and users can opt in, o=
r refer to the section where this is discussed?=C2=A0</div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0.. option:: -t, --persistent<br>
<br>
diff --git a/qapi/block-export.json b/qapi/block-export.json<br>
index f183522d0d2c..0a27e8ee84f9 100644<br>
--- a/qapi/block-export.json<br>
+++ b/qapi/block-export.json<br>
@@ -21,7 +21,9 @@<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0recreated on the fly=
 while the NBD server is active.<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If missing, it will =
default to denying access (since 4.0).<br>
=C2=A0# @max-connections: The maximum number of connections to allow at the=
 same<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0time=
, 0 for unlimited. (since 5.2; default: 0)<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0time=
, 0 for unlimited. Setting this to 1 also stops<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the =
server from advertising multiple client support<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(sin=
ce 5.2; default: 0)<br>
=C2=A0#<br>
=C2=A0# Since: 4.2<br>
=C2=A0##<br>
@@ -50,7 +52,9 @@<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0recreated on the fly=
 while the NBD server is active.<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If missing, it will =
default to denying access (since 4.0).<br>
=C2=A0# @max-connections: The maximum number of connections to allow at the=
 same<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0time=
, 0 for unlimited. (since 5.2; default: 0)<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0time=
, 0 for unlimited. Setting this to 1 also stops<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the =
server from advertising multiple client support<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(sin=
ce 5.2; default: 0).<br>
=C2=A0#<br>
=C2=A0# Returns: error if the server is already running.<br>
=C2=A0#<br>
@@ -79,6 +83,26 @@<br>
=C2=A0{ &#39;struct&#39;: &#39;BlockExportOptionsNbdBase&#39;,<br>
=C2=A0 =C2=A0&#39;data&#39;: { &#39;*name&#39;: &#39;str&#39;, &#39;*descri=
ption&#39;: &#39;str&#39; } }<br>
<br>
+##<br>
+# @NbdExportMultiConn:<br>
+#<br>
+# Possible settings for advertising NBD multiple client support.<br>
+#<br>
+# @off: Do not advertise multiple clients.<br>
+#<br>
+# @on: Allow multiple clients (for writable clients, this is only safe<br>
+#=C2=A0 =C2=A0 =C2=A0 if the underlying BDS is cache-consistent, such as w=
hen backed<br>
+#=C2=A0 =C2=A0 =C2=A0 by the raw file driver); ignored if the NBD server w=
as set up<br>
+#=C2=A0 =C2=A0 =C2=A0 with max-connections of 1.<br>
+#<br>
+# @auto: Behaves like @off if the export is writable, and @on if the<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 export is read-only.<br>
+#<br>
+# Since: 7.0<br>
+##<br>
+{ &#39;enum&#39;: &#39;NbdExportMultiConn&#39;,<br>
+=C2=A0 &#39;data&#39;: [&#39;off&#39;, &#39;on&#39;, &#39;auto&#39;] }<br>=
</blockquote><div><br></div><div>Are we going to have --multi-con=3D(on|off=
|auto)?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
+<br>
=C2=A0##<br>
=C2=A0# @BlockExportOptionsNbd:<br>
=C2=A0#<br>
@@ -95,11 +119,15 @@<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 the metadata context name &quot;qemu:allocation-depth&quot; to<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 inspect allocation details. (since 5.2)<br>
=C2=A0#<br>
+# @multi-conn: Controls whether multiple client support is advertised, if =
the<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 server&#39;s max-connect=
ions is not 1. (default auto, since 7.0)<br>
+#<br>
=C2=A0# Since: 5.2<br>
=C2=A0##<br>
=C2=A0{ &#39;struct&#39;: &#39;BlockExportOptionsNbd&#39;,<br>
=C2=A0 =C2=A0&#39;base&#39;: &#39;BlockExportOptionsNbdBase&#39;,<br>
-=C2=A0 &#39;data&#39;: { &#39;*bitmaps&#39;: [&#39;str&#39;], &#39;*alloca=
tion-depth&#39;: &#39;bool&#39; } }<br>
+=C2=A0 &#39;data&#39;: { &#39;*bitmaps&#39;: [&#39;str&#39;], &#39;*alloca=
tion-depth&#39;: &#39;bool&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*multi-conn&#39;: &#39;NbdE=
xportMultiConn&#39; } }<br>
<br>
=C2=A0##<br>
=C2=A0# @BlockExportOptionsVhostUserBlk:<br>
diff --git a/include/block/nbd.h b/include/block/nbd.h<br>
index 78d101b77488..138b9857dbcb 100644<br>
--- a/include/block/nbd.h<br>
+++ b/include/block/nbd.h<br>
@@ -1,5 +1,5 @@<br>
=C2=A0/*<br>
- *=C2=A0 Copyright (C) 2016-2020 Red Hat, Inc.<br>
+ *=C2=A0 Copyright (C) 2016-2022 Red Hat, Inc.<br>
=C2=A0 *=C2=A0 Copyright (C) 2005=C2=A0 Anthony Liguori &lt;<a href=3D"mail=
to:anthony@codemonkey.ws" target=3D"_blank">anthony@codemonkey.ws</a>&gt;<b=
r>
=C2=A0 *<br>
=C2=A0 *=C2=A0 Network Block Device<br>
@@ -346,6 +346,7 @@ void nbd_client_put(NBDClient *client);<br>
<br>
=C2=A0void nbd_server_is_qemu_nbd(bool value);<br>
=C2=A0bool nbd_server_is_running(void);<br>
+int nbd_server_max_connections(void);<br>
=C2=A0void nbd_server_start(SocketAddress *addr, const char *tls_creds,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0const char *tls_authz, uint32_t max_connections,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Error **errp);<br>
diff --git a/blockdev-nbd.c b/blockdev-nbd.c<br>
index bdfa7ed3a5a9..0df222e868d8 100644<br>
--- a/blockdev-nbd.c<br>
+++ b/blockdev-nbd.c<br>
@@ -44,6 +44,11 @@ bool nbd_server_is_running(void)<br>
=C2=A0 =C2=A0 =C2=A0return nbd_server || is_qemu_nbd;<br>
=C2=A0}<br>
<br>
+int nbd_server_max_connections(void)<br>
+{<br>
+=C2=A0 =C2=A0 return nbd_server ? nbd_server-&gt;max_connections : -1;<br>
+}<br></blockquote><div><br></div><div>-1 is a little bit strange for a lim=
it, maybe 1 is a better default when</div><div>we nbd_server =3D=3D NULL? W=
hen can this happen?</div><div>=C2=A0<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
+<br>
=C2=A0static void nbd_blockdev_client_closed(NBDClient *client, bool ignore=
d)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0nbd_client_put(client);<br>
diff --git a/nbd/server.c b/nbd/server.c<br>
index 9fb2f264023e..f17aacc8139f 100644<br>
--- a/nbd/server.c<br>
+++ b/nbd/server.c<br>
@@ -1,5 +1,5 @@<br>
=C2=A0/*<br>
- *=C2=A0 Copyright (C) 2016-2021 Red Hat, Inc.<br>
+ *=C2=A0 Copyright (C) 2016-2022 Red Hat, Inc.<br>
=C2=A0 *=C2=A0 Copyright (C) 2005=C2=A0 Anthony Liguori &lt;<a href=3D"mail=
to:anthony@codemonkey.ws" target=3D"_blank">anthony@codemonkey.ws</a>&gt;<b=
r>
=C2=A0 *<br>
=C2=A0 *=C2=A0 Network Block Device Server Side<br>
@@ -1641,7 +1641,7 @@ static int nbd_export_create(BlockExport *blk_exp, Bl=
ockExportOptions *exp_args,<br>
=C2=A0 =C2=A0 =C2=A0int64_t size;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t perm, shared_perm;<br>
=C2=A0 =C2=A0 =C2=A0bool readonly =3D !exp_args-&gt;writable;<br>
-=C2=A0 =C2=A0 bool shared =3D !exp_args-&gt;writable;<br>
+=C2=A0 =C2=A0 bool multi_conn;<br>
=C2=A0 =C2=A0 =C2=A0strList *bitmaps;<br>
=C2=A0 =C2=A0 =C2=A0size_t i;<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
@@ -1679,6 +1679,23 @@ static int nbd_export_create(BlockExport *blk_exp, B=
lockExportOptions *exp_args,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return size;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Determine whether to advertise multi-conn.=C2=A0 Def=
ault is auto,<br>
+=C2=A0 =C2=A0 =C2=A0* which resolves to on for read-only and off for writa=
ble.=C2=A0 But<br>
+=C2=A0 =C2=A0 =C2=A0* if the server has max-connections 1, that forces the=
 flag off.<br></blockquote><div><br></div><div>Looks good, this can be enab=
led automatically based on the driver</div><div>if we want, so users using =
auto will can upgrade to multi-con automatically.</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (!arg-&gt;has_multi_conn) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 arg-&gt;multi_conn =3D NBD_EXPORT_MULTI_CONN_A=
UTO;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (nbd_server_max_connections() =3D=3D 1) {</blockquote><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 arg-&gt;multi_conn =3D NBD_EXPORT_MULTI_CONN_O=
FF;<br>
+=C2=A0 =C2=A0 }</blockquote><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
+=C2=A0 =C2=A0 if (arg-&gt;multi_conn =3D=3D NBD_EXPORT_MULTI_CONN_AUTO) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 multi_conn =3D readonly;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 multi_conn =3D arg-&gt;multi_conn =3D=3D NBD_E=
XPORT_MULTI_CONN_ON;<br>
+=C2=A0 =C2=A0 }<br></blockquote><div><br></div><div>This part is a little =
bit confusing - we do:</div><div>- initialize args-&gt;multi_con if it has =
not value</div><div>- set the temporary multi_con based now initialized arg=
s-&gt;multi_con</div><div><br></div><div>I think it will be nicer to separa=
te arguments parsing, so there is no need</div><div>to initialize it here o=
r have arg-&gt;has_multi_conn, but I did not check how</div><div>other argu=
ments are handled.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
+<br>
=C2=A0 =C2=A0 =C2=A0/* Don&#39;t allow resize while the NBD server is runni=
ng, otherwise we don&#39;t<br>
=C2=A0 =C2=A0 =C2=A0 * care what happens with the node. */<br>
=C2=A0 =C2=A0 =C2=A0blk_get_perm(blk, &amp;perm, &amp;shared_perm);<br>
@@ -1692,11 +1709,11 @@ static int nbd_export_create(BlockExport *blk_exp, =
BlockExportOptions *exp_args,<br>
=C2=A0 =C2=A0 =C2=A0exp-&gt;description =3D g_strdup(arg-&gt;description);<=
br>
=C2=A0 =C2=A0 =C2=A0exp-&gt;nbdflags =3D (NBD_FLAG_HAS_FLAGS | NBD_FLAG_SEN=
D_FLUSH |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 NBD_FLAG_SEND_FUA | NBD_FLAG_SEND_CACHE);<br>
+=C2=A0 =C2=A0 if (multi_conn) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exp-&gt;nbdflags |=3D NBD_FLAG_CAN_MULTI_CONN;=
<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0if (readonly) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exp-&gt;nbdflags |=3D NBD_FLAG_READ_ONLY;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (shared) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exp-&gt;nbdflags |=3D NBD_FLAG_C=
AN_MULTI_CONN;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exp-&gt;nbdflags |=3D (NBD_FLAG_SEND_TRIM=
 | NBD_FLAG_SEND_WRITE_ZEROES |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0NBD_FLAG_SEND_FAST_ZERO);v=C2=A0<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index 9814580975c5..24dd800ae3f8 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -3334,6 +3334,7 @@ F: qemu-nbd.*<br>
=C2=A0F: blockdev-nbd.c<br>
=C2=A0F: docs/interop/nbd.txt<br>
=C2=A0F: docs/tools/qemu-nbd.rst<br>
+F: tests/qemu-iotests/tests/*nbd*<br>
=C2=A0T: git <a href=3D"https://repo.or.cz/qemu/ericb.git" rel=3D"noreferre=
r" target=3D"_blank">https://repo.or.cz/qemu/ericb.git</a> nbd<br>
=C2=A0T: git <a href=3D"https://src.openvz.org/scm/~vsementsov/qemu.git" re=
l=3D"noreferrer" target=3D"_blank">https://src.openvz.org/scm/~vsementsov/q=
emu.git</a> nbd<br>
<br>
diff --git a/tests/qemu-iotests/tests/nbd-multiconn b/tests/qemu-iotests/te=
sts/nbd-multiconn<br>
new file mode 100755<br>
index 000000000000..0261552f32f2<br>
--- /dev/null<br>
+++ b/tests/qemu-iotests/tests/nbd-multiconn<br>
@@ -0,0 +1,188 @@<br>
+#!/usr/bin/env bash<br>
+# group: rw auto quick<br>
+#<br>
+# Test that qemu-nbd MULTI_CONN works<br>
+#<br>
+# Copyright (C) 2018-2022 Red Hat, Inc.<br>
+#<br>
+# This program is free software; you can redistribute it and/or modify<br>
+# it under the terms of the GNU General Public License as published by<br>
+# the Free Software Foundation; either version 2 of the License, or<br>
+# (at your option) any later version.<br>
+#<br>
+# This program is distributed in the hope that it will be useful,<br>
+# but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the<br>
+# GNU General Public License for more details.<br>
+#<br>
+# You should have received a copy of the GNU General Public License<br>
+# along with this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gnu=
.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/lic=
enses/</a>&gt;.<br>
+#<br>
+<br>
+seq=3D&quot;$(basename $0)&quot;<br>
+echo &quot;QA output created by $seq&quot;<br>
+<br>
+status=3D1 # failure is the default!<br>
+<br>
+_cleanup()<br>
+{<br>
+=C2=A0 =C2=A0 _cleanup_test_img<br>
+=C2=A0 =C2=A0 _cleanup_qemu<br>
+=C2=A0 =C2=A0 rm -f &quot;$SOCK_DIR/nbd&quot;<br>
+}<br>
+trap &quot;_cleanup; exit \$status&quot; 0 1 2 3 15<br>
+<br>
+# get standard environment, filters and checks<br>
+cd ..<br>
+. ./common.rc<br>
+. ./common.filter<br>
+. ./common.qemu<br>
+. ./common.nbd<br>
+<br>
+_supported_fmt qcow2<br>
+_supported_proto file<br>
+_supported_os Linux<br>
+_require_command QEMU_NBD<br>
+<br>
+# Parallel client connections are easier with libnbd than qemu-io:<br>
+if ! (nbdsh --version) &gt;/dev/null 2&gt;&amp;1; then<br>
+=C2=A0 =C2=A0 _notrun &quot;nbdsh utility required, skipped this test&quot=
;<br>
+fi<br>
+<br>
+echo<br>
+echo &quot;=3D=3D=3D Initial image setup =3D=3D=3D&quot;<br>
+echo<br>
+<br>
+_make_test_img 4M<br>
+$QEMU_IO -c &#39;w -P 1 0 2M&#39; -c &#39;w -P 2 2M 2M&#39; &quot;$TEST_IM=
G&quot; | _filter_qemu_io<br>
+_launch_qemu 2&gt; &gt;(_filter_nbd)<br>
+_send_qemu_cmd $QEMU_HANDLE &#39;{&quot;execute&quot;:&quot;qmp_capabiliti=
es&quot;}&#39; &quot;return&quot;<br>
+_send_qemu_cmd $QEMU_HANDLE &#39;{&quot;execute&quot;:&quot;blockdev-add&q=
uot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;driver&quot;:&quot;qcow2&quot;, &quot;=
node-name&quot;:&quot;n&quot;,<br>
+=C2=A0 =C2=A0 &quot;file&quot;:{&quot;driver&quot;:&quot;file&quot;, &quot=
;filename&quot;:&quot;&#39;&quot;$TEST_IMG&quot;&#39;&quot;}}}&#39; &quot;r=
eturn&quot;<br>
+export nbd_unix_socket<br>
+<br>
+echo<br>
+echo &quot;=3D=3D=3D Default nbd server settings =3D=3D=3D&quot;<br>
+echo<br>
+# Default allows for unlimited connections, readonly images advertise<br>
+# multi-conn, and writable images do not<br>
+_send_qemu_cmd $QEMU_HANDLE &#39;{&quot;execute&quot;:&quot;nbd-server-sta=
rt&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;addr&quot;:{&quot;type&quot;:&quot;uni=
x&quot;,<br>
+=C2=A0 =C2=A0 &quot;data&quot;:{&quot;path&quot;:&quot;&#39;&quot;$nbd_uni=
x_socket&quot;&#39;&quot;}}}}&#39; &quot;return&quot;<br>
+_send_qemu_cmd $QEMU_HANDLE &#39;{&quot;execute&quot;:&quot;block-export-a=
dd&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;type&quot;:&quot;nbd&quot;, &quot;id&q=
uot;:&quot;r&quot;, &quot;node-name&quot;:&quot;n&quot;,<br>
+=C2=A0 =C2=A0 &quot;name&quot;:&quot;r&quot;}}&#39; &quot;return&quot;<br>
+_send_qemu_cmd $QEMU_HANDLE &#39;{&quot;execute&quot;:&quot;block-export-a=
dd&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;type&quot;:&quot;nbd&quot;, &quot;id&q=
uot;:&quot;w&quot;, &quot;node-name&quot;:&quot;n&quot;,<br>
+=C2=A0 =C2=A0 &quot;name&quot;:&quot;w&quot;, &quot;writable&quot;:true}}&=
#39; &quot;return&quot;<br>
+nbdsh -u &quot;nbd+unix:///r?socket=3D$nbd_unix_socket&quot; -c &#39;<br>
+assert h.can_multi_conn()<br>
+h.shutdown()<br>
+print(&quot;nbdsh passed&quot;)&#39;<br>
+nbdsh -u &quot;nbd+unix:///w?socket=3D$nbd_unix_socket&quot; -c &#39;<br>
+assert not h.can_multi_conn()<br>
+h.shutdown()<br>
+print(&quot;nbdsh passed&quot;)&#39;<br></blockquote><div><br></div><div>M=
ixing of shell and python is very confusing. Wouldn&#39;t it be much cleane=
r</div><div>to write the test in python?</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
+_send_qemu_cmd $QEMU_HANDLE &#39;{&quot;execute&quot;:&quot;block-export-d=
el&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;id&quot;:&quot;r&quot;}}&#39; &quot;DE=
LETED&quot;<br>
+_send_qemu_cmd $QEMU_HANDLE &#39;{&quot;execute&quot;:&quot;block-export-d=
el&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;id&quot;:&quot;w&quot;}}&#39; &quot;DE=
LETED&quot;<br>
+<br>
+echo<br>
+echo &quot;=3D=3D=3D Per-export overrides of defaults =3D=3D=3D&quot;<br>
+echo<br>
+# Can explicitly disable multi-conn for readonly image, and explicitly<br>
+# enable it for writable image<br>
+_send_qemu_cmd $QEMU_HANDLE &#39;{&quot;execute&quot;:&quot;block-export-a=
dd&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;type&quot;:&quot;nbd&quot;, &quot;id&q=
uot;:&quot;r&quot;, &quot;node-name&quot;:&quot;n&quot;,<br>
+=C2=A0 =C2=A0 &quot;name&quot;:&quot;r&quot;, &quot;multi-conn&quot;:&quot=
;off&quot;}}&#39; &quot;return&quot;<br>
+_send_qemu_cmd $QEMU_HANDLE &#39;{&quot;execute&quot;:&quot;block-export-a=
dd&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;type&quot;:&quot;nbd&quot;, &quot;id&q=
uot;:&quot;w&quot;, &quot;node-name&quot;:&quot;n&quot;,<br>
+=C2=A0 =C2=A0 &quot;name&quot;:&quot;w&quot;, &quot;multi-conn&quot;:&quot=
;on&quot;, &quot;writable&quot;:true}}&#39; &quot;return&quot;<br>
+nbdsh -u &quot;nbd+unix:///r?socket=3D$nbd_unix_socket&quot; -c &#39;<br>
+assert not h.can_multi_conn()<br>
+h.shutdown()<br>
+print(&quot;nbdsh passed&quot;)&#39;<br>
+nbdsh -u &quot;nbd+unix:///w?socket=3D$nbd_unix_socket&quot; -c &#39;<br>
+assert h.can_multi_conn()<br>
+h.shutdown()<br>
+print(&quot;nbdsh passed&quot;)&#39;<br>
+_send_qemu_cmd $QEMU_HANDLE &#39;{&quot;execute&quot;:&quot;block-export-d=
el&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;id&quot;:&quot;r&quot;}}&#39; &quot;DE=
LETED&quot;<br>
+_send_qemu_cmd $QEMU_HANDLE &#39;{&quot;execute&quot;:&quot;block-export-d=
el&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;id&quot;:&quot;w&quot;}}&#39; &quot;DE=
LETED&quot;<br>
+_send_qemu_cmd $QEMU_HANDLE &#39;{&quot;execute&quot;:&quot;nbd-server-sto=
p&quot;}&#39; &quot;return&quot;<br>
+<br>
+echo<br>
+echo &quot;=3D=3D=3D Limit nbd server max-connections =3D=3D=3D&quot;<br>
+echo<br>
+# When max-connections is 1, no images advertise multi-conn, even when<br>
+# explicitly requested per export<br>
+_send_qemu_cmd $QEMU_HANDLE &#39;{&quot;execute&quot;:&quot;nbd-server-sta=
rt&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;max-connections&quot;:1, &quot;addr&qu=
ot;:{&quot;type&quot;:&quot;unix&quot;,<br>
+=C2=A0 =C2=A0 &quot;data&quot;:{&quot;path&quot;:&quot;&#39;&quot;$nbd_uni=
x_socket&quot;&#39;&quot;}}}}&#39; &quot;return&quot;<br>
+_send_qemu_cmd $QEMU_HANDLE &#39;{&quot;execute&quot;:&quot;block-export-a=
dd&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;type&quot;:&quot;nbd&quot;, &quot;id&q=
uot;:&quot;r&quot;, &quot;node-name&quot;:&quot;n&quot;,<br>
+=C2=A0 =C2=A0 &quot;name&quot;:&quot;r&quot;, &quot;multi-conn&quot;:&quot=
;on&quot;}}&#39; &quot;return&quot;<br>
+nbdsh -u &quot;nbd+unix:///r?socket=3D$nbd_unix_socket&quot; -c &#39;<br>
+assert not h.can_multi_conn()<br>
+h.shutdown()<br>
+print(&quot;nbdsh passed&quot;)&#39;<br>
+_send_qemu_cmd $QEMU_HANDLE &#39;{&quot;execute&quot;:&quot;block-export-d=
el&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;id&quot;:&quot;r&quot;}}&#39; &quot;DE=
LETED&quot;<br>
+_send_qemu_cmd $QEMU_HANDLE &#39;{&quot;execute&quot;:&quot;block-export-a=
dd&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;type&quot;:&quot;nbd&quot;, &quot;id&q=
uot;:&quot;w&quot;, &quot;node-name&quot;:&quot;n&quot;,<br>
+=C2=A0 =C2=A0 &quot;name&quot;:&quot;w&quot;, &quot;multi-conn&quot;:&quot=
;on&quot;, &quot;writable&quot;:true}}&#39; &quot;return&quot;<br>
+nbdsh -u &quot;nbd+unix:///w?socket=3D$nbd_unix_socket&quot; -c &#39;<br>
+assert not h.can_multi_conn()<br>
+h.shutdown()<br>
+print(&quot;nbdsh passed&quot;)&#39;<br>
+_send_qemu_cmd $QEMU_HANDLE &#39;{&quot;execute&quot;:&quot;block-export-d=
el&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;id&quot;:&quot;w&quot;}}&#39; &quot;DE=
LETED&quot;<br>
+_send_qemu_cmd $QEMU_HANDLE &#39;{&quot;execute&quot;:&quot;nbd-server-sto=
p&quot;}&#39; &quot;return&quot;<br>
+<br>
+echo<br>
+echo &quot;=3D=3D=3D Demonstrate parallel writers =3D=3D=3D&quot;<br>
+echo<br>
+_send_qemu_cmd $QEMU_HANDLE &#39;{&quot;execute&quot;:&quot;nbd-server-sta=
rt&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;addr&quot;:{&quot;type&quot;:&quot;uni=
x&quot;,<br>
+=C2=A0 =C2=A0 &quot;data&quot;:{&quot;path&quot;:&quot;&#39;&quot;$nbd_uni=
x_socket&quot;&#39;&quot;}}}}&#39; &quot;return&quot;<br>
+_send_qemu_cmd $QEMU_HANDLE &#39;{&quot;execute&quot;:&quot;block-export-a=
dd&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;type&quot;:&quot;nbd&quot;, &quot;id&q=
uot;:&quot;w&quot;, &quot;node-name&quot;:&quot;n&quot;,<br>
+=C2=A0 =C2=A0 &quot;name&quot;:&quot;&quot;, &quot;multi-conn&quot;:&quot;=
on&quot;, &quot;writable&quot;:true}}&#39; &quot;return&quot;<br>
+<br>
+nbdsh -c &#39;<br>
+import os<br>
+sock =3D os.getenv(&quot;nbd_unix_socket&quot;)<br>
+h =3D []<br>
+<br>
+for i in range(3):<br>
+=C2=A0 h.append(nbd.NBD())<br>
+=C2=A0 h[i].connect_unix(sock)<br>
+=C2=A0 assert h[i].can_multi_conn()<br></blockquote><div><br></div><div>Th=
is is somewhat C in python, maybe:</div><div><br></div><div>=C2=A0 =C2=A0 h=
andles =3D [nbd.NBD() for _ in range(3)]</div><div><br></div><div>=C2=A0 =
=C2=A0 for h in handles:</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 h.connect_un=
ix(sock)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert h.can_multi_con()<br>=
</div><div><br></div><div>Since assert will abort the test, and we don&#39;=
t handle</div><div>exceptions, failure will not shutdown the connections</d=
iv><div>but it should not matter for the purpose of a test.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+buf1 =3D h[0].pread(1024 * 1024, 0)<br>
+if buf1 !=3D b&quot;\x01&quot; * 1024 * 1024:<br>
+=C2=A0 print(&quot;Unexpected initial read&quot;)<br></blockquote><div><br=
></div><div>Not clear when we initialize the buffer to \x01 - is this the q=
emu-io above?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+buf2 =3D b&quot;\x03&quot; * 1024 * 1024<br>
+h[1].pwrite(buf2, 0)<br>
+h[2].flush()<br>
+buf1 =3D h[0].pread(1024 * 1024, 0)<br>
+if buf1 =3D=3D buf2:<br>
+=C2=A0 print(&quot;Flush appears to be consistent across connections&quot;=
)<br></blockquote><div><br></div><div>buf1 was the initial content, buf2 is=
 the new content, but now we override</div><div>but1 to check that the righ=
t was flushed. It will be be better to use different</div><div>names like i=
nittial_data, updated_data, current_data.</div><div><br></div><div>This blo=
ck is the most important part of the test, showing that we can write</div><=
div>in one connection, flush in the second, and read the written block in t=
he third.</div><div>Maybe add a comment about this? I think it will help so=
meone else trying</div><div>to understand what this part is trying to test.=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+for i in range(3):<br>
+=C2=A0 h[i].shutdown()<br></blockquote><div><br></div><div>for h in handle=
s:</div><div>=C2=A0 =C2=A0 h.shutdown()</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
+&#39;<br>
+<br>
+_send_qemu_cmd $QEMU_HANDLE &#39;{&quot;execute&quot;:&quot;block-export-d=
el&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;id&quot;:&quot;w&quot;}}&#39; &quot;DE=
LETED&quot;<br>
+_send_qemu_cmd $QEMU_HANDLE &#39;{&quot;execute&quot;:&quot;nbd-server-sto=
p&quot;}&#39; &quot;return&quot;<br>
+_send_qemu_cmd $QEMU_HANDLE &#39;{&quot;execute&quot;:&quot;quit&quot;}&#3=
9; &quot;return&quot;<br>
+wait=3Dyes _cleanup_qemu<br>
+<br>
+# success, all done<br>
+echo &#39;*** done&#39;<br>
+rm -f $seq.full<br>
+status=3D0<br>
diff --git a/tests/qemu-iotests/tests/nbd-multiconn.out b/tests/qemu-iotest=
s/tests/nbd-multiconn.out<br>
new file mode 100644<br>
index 000000000000..a06428e1536a<br>
--- /dev/null<br>
+++ b/tests/qemu-iotests/tests/nbd-multiconn.out<br>
@@ -0,0 +1,112 @@<br>
+QA output created by nbd-multiconn<br>
+<br>
+=3D=3D=3D Initial image setup =3D=3D=3D<br>
+<br>
+Formatting &#39;TEST_DIR/t.IMGFMT&#39;, fmt=3DIMGFMT size=3D4194304<br>
+wrote 2097152/2097152 bytes at offset 0<br>
+2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)<br>
+wrote 2097152/2097152 bytes at offset 2097152<br>
+2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)<br>
+{&quot;execute&quot;:&quot;qmp_capabilities&quot;}<br>
+{&quot;return&quot;: {}}<br>
+{&quot;execute&quot;:&quot;blockdev-add&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;driver&quot;:&quot;IMGFMT&quot;, &quot=
;node-name&quot;:&quot;n&quot;,<br>
+=C2=A0 =C2=A0 &quot;file&quot;:{&quot;driver&quot;:&quot;file&quot;, &quot=
;filename&quot;:&quot;TEST_DIR/t.IMGFMT&quot;}}}<br>
+{&quot;return&quot;: {}}<br>
+<br>
+=3D=3D=3D Default nbd server settings =3D=3D=3D<br>
+<br>
+{&quot;execute&quot;:&quot;nbd-server-start&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;addr&quot;:{&quot;type&quot;:&quot;uni=
x&quot;,<br>
+=C2=A0 =C2=A0 &quot;data&quot;:{&quot;path&quot;:&quot;SOCK_DIR/qemu-nbd.s=
ock&quot;}}}}<br>
+{&quot;return&quot;: {}}<br>
+{&quot;execute&quot;:&quot;block-export-add&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;type&quot;:&quot;nbd&quot;, &quot;id&q=
uot;:&quot;r&quot;, &quot;node-name&quot;:&quot;n&quot;,<br>
+=C2=A0 =C2=A0 &quot;name&quot;:&quot;r&quot;}}<br>
+{&quot;return&quot;: {}}<br>
+{&quot;execute&quot;:&quot;block-export-add&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;type&quot;:&quot;nbd&quot;, &quot;id&q=
uot;:&quot;w&quot;, &quot;node-name&quot;:&quot;n&quot;,<br>
+=C2=A0 =C2=A0 &quot;name&quot;:&quot;w&quot;, &quot;writable&quot;:true}}<=
br>
+{&quot;return&quot;: {}}<br>
+nbdsh passed<br>
+nbdsh passed<br>
+{&quot;execute&quot;:&quot;block-export-del&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;id&quot;:&quot;r&quot;}}<br>
+{&quot;return&quot;: {}}<br>
+{&quot;timestamp&quot;: {&quot;seconds&quot;:=C2=A0 TIMESTAMP, &quot;micro=
seconds&quot;:=C2=A0 TIMESTAMP}, &quot;event&quot;: &quot;BLOCK_EXPORT_DELE=
TED&quot;, &quot;data&quot;: {&quot;id&quot;: &quot;r&quot;}}<br>
+{&quot;execute&quot;:&quot;block-export-del&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;id&quot;:&quot;w&quot;}}<br>
+{&quot;return&quot;: {}}<br>
+{&quot;timestamp&quot;: {&quot;seconds&quot;:=C2=A0 TIMESTAMP, &quot;micro=
seconds&quot;:=C2=A0 TIMESTAMP}, &quot;event&quot;: &quot;BLOCK_EXPORT_DELE=
TED&quot;, &quot;data&quot;: {&quot;id&quot;: &quot;w&quot;}}<br>
+<br>
+=3D=3D=3D Per-export overrides of defaults =3D=3D=3D<br>
+<br>
+{&quot;execute&quot;:&quot;block-export-add&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;type&quot;:&quot;nbd&quot;, &quot;id&q=
uot;:&quot;r&quot;, &quot;node-name&quot;:&quot;n&quot;,<br>
+=C2=A0 =C2=A0 &quot;name&quot;:&quot;r&quot;, &quot;multi-conn&quot;:&quot=
;off&quot;}}<br>
+{&quot;return&quot;: {}}<br>
+{&quot;execute&quot;:&quot;block-export-add&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;type&quot;:&quot;nbd&quot;, &quot;id&q=
uot;:&quot;w&quot;, &quot;node-name&quot;:&quot;n&quot;,<br>
+=C2=A0 =C2=A0 &quot;name&quot;:&quot;w&quot;, &quot;multi-conn&quot;:&quot=
;on&quot;, &quot;writable&quot;:true}}<br>
+{&quot;return&quot;: {}}<br>
+nbdsh passed<br>
+nbdsh passed<br>
+{&quot;execute&quot;:&quot;block-export-del&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;id&quot;:&quot;r&quot;}}<br>
+{&quot;return&quot;: {}}<br>
+{&quot;timestamp&quot;: {&quot;seconds&quot;:=C2=A0 TIMESTAMP, &quot;micro=
seconds&quot;:=C2=A0 TIMESTAMP}, &quot;event&quot;: &quot;BLOCK_EXPORT_DELE=
TED&quot;, &quot;data&quot;: {&quot;id&quot;: &quot;r&quot;}}<br>
+{&quot;execute&quot;:&quot;block-export-del&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;id&quot;:&quot;w&quot;}}<br>
+{&quot;return&quot;: {}}<br>
+{&quot;timestamp&quot;: {&quot;seconds&quot;:=C2=A0 TIMESTAMP, &quot;micro=
seconds&quot;:=C2=A0 TIMESTAMP}, &quot;event&quot;: &quot;BLOCK_EXPORT_DELE=
TED&quot;, &quot;data&quot;: {&quot;id&quot;: &quot;w&quot;}}<br>
+{&quot;execute&quot;:&quot;nbd-server-stop&quot;}<br>
+{&quot;return&quot;: {}}<br>
+<br>
+=3D=3D=3D Limit nbd server max-connections =3D=3D=3D<br>
+<br>
+{&quot;execute&quot;:&quot;nbd-server-start&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;max-connections&quot;:1, &quot;addr&qu=
ot;:{&quot;type&quot;:&quot;unix&quot;,<br>
+=C2=A0 =C2=A0 &quot;data&quot;:{&quot;path&quot;:&quot;SOCK_DIR/qemu-nbd.s=
ock&quot;}}}}<br>
+{&quot;return&quot;: {}}<br>
+{&quot;execute&quot;:&quot;block-export-add&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;type&quot;:&quot;nbd&quot;, &quot;id&q=
uot;:&quot;r&quot;, &quot;node-name&quot;:&quot;n&quot;,<br>
+=C2=A0 =C2=A0 &quot;name&quot;:&quot;r&quot;, &quot;multi-conn&quot;:&quot=
;on&quot;}}<br>
+{&quot;return&quot;: {}}<br>
+nbdsh passed<br>
+{&quot;execute&quot;:&quot;block-export-del&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;id&quot;:&quot;r&quot;}}<br>
+{&quot;return&quot;: {}}<br>
+{&quot;timestamp&quot;: {&quot;seconds&quot;:=C2=A0 TIMESTAMP, &quot;micro=
seconds&quot;:=C2=A0 TIMESTAMP}, &quot;event&quot;: &quot;BLOCK_EXPORT_DELE=
TED&quot;, &quot;data&quot;: {&quot;id&quot;: &quot;r&quot;}}<br>
+{&quot;execute&quot;:&quot;block-export-add&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;type&quot;:&quot;nbd&quot;, &quot;id&q=
uot;:&quot;w&quot;, &quot;node-name&quot;:&quot;n&quot;,<br>
+=C2=A0 =C2=A0 &quot;name&quot;:&quot;w&quot;, &quot;multi-conn&quot;:&quot=
;on&quot;, &quot;writable&quot;:true}}<br>
+{&quot;return&quot;: {}}<br>
+nbdsh passed<br>
+{&quot;execute&quot;:&quot;block-export-del&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;id&quot;:&quot;w&quot;}}<br>
+{&quot;return&quot;: {}}<br>
+{&quot;timestamp&quot;: {&quot;seconds&quot;:=C2=A0 TIMESTAMP, &quot;micro=
seconds&quot;:=C2=A0 TIMESTAMP}, &quot;event&quot;: &quot;BLOCK_EXPORT_DELE=
TED&quot;, &quot;data&quot;: {&quot;id&quot;: &quot;w&quot;}}<br>
+{&quot;execute&quot;:&quot;nbd-server-stop&quot;}<br>
+{&quot;return&quot;: {}}<br>
+<br>
+=3D=3D=3D Demonstrate parallel writers =3D=3D=3D<br>
+<br>
+{&quot;execute&quot;:&quot;nbd-server-start&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;addr&quot;:{&quot;type&quot;:&quot;uni=
x&quot;,<br>
+=C2=A0 =C2=A0 &quot;data&quot;:{&quot;path&quot;:&quot;SOCK_DIR/qemu-nbd.s=
ock&quot;}}}}<br>
+{&quot;return&quot;: {}}<br>
+{&quot;execute&quot;:&quot;block-export-add&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;type&quot;:&quot;nbd&quot;, &quot;id&q=
uot;:&quot;w&quot;, &quot;node-name&quot;:&quot;n&quot;,<br>
+=C2=A0 =C2=A0 &quot;name&quot;:&quot;&quot;, &quot;multi-conn&quot;:&quot;=
on&quot;, &quot;writable&quot;:true}}<br>
+{&quot;return&quot;: {}}<br>
+Flush appears to be consistent across connections<br>
+{&quot;execute&quot;:&quot;block-export-del&quot;,<br>
+=C2=A0 &quot;arguments&quot;:{&quot;id&quot;:&quot;w&quot;}}<br>
+{&quot;return&quot;: {}}<br>
+{&quot;timestamp&quot;: {&quot;seconds&quot;:=C2=A0 TIMESTAMP, &quot;micro=
seconds&quot;:=C2=A0 TIMESTAMP}, &quot;event&quot;: &quot;BLOCK_EXPORT_DELE=
TED&quot;, &quot;data&quot;: {&quot;id&quot;: &quot;w&quot;}}<br>
+{&quot;execute&quot;:&quot;nbd-server-stop&quot;}<br>
+{&quot;return&quot;: {}}<br>
+{&quot;execute&quot;:&quot;quit&quot;}<br>
+{&quot;return&quot;: {}}<br>
+{&quot;timestamp&quot;: {&quot;seconds&quot;:=C2=A0 TIMESTAMP, &quot;micro=
seconds&quot;:=C2=A0 TIMESTAMP}, &quot;event&quot;: &quot;SHUTDOWN&quot;, &=
quot;data&quot;: {&quot;guest&quot;: false, &quot;reason&quot;: &quot;host-=
qmp-quit&quot;}}<br></blockquote><div><br></div><div>Nothing about the cont=
ents here says anything about the actual test</div><div>except the &quot;Fl=
ush appears...&quot; line.</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
+*** done<br>
-- <br>
2.35.1<br></blockquote><div><br></div><div>Looks good, feel free to ignore =
the style comments and suggestion to rewrite</div><div>the test in python.<=
/div><div><br>Nir</div><div>=C2=A0</div></div></div>

--00000000000034a60f05d81379b0--


