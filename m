Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D692E17A4DA
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 13:04:50 +0100 (CET)
Received: from localhost ([::1]:47770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9pFB-0000X0-VP
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 07:04:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33949)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j9pDt-0007RC-NO
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 07:03:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j9pDs-0008Ht-FO
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 07:03:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51492
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j9pDs-0008HD-CD
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 07:03:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583409808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jy5m06Y1gfVleTehqDJPHx/Z3tuSrj2h9J7pHbqABfs=;
 b=PqXHw8igJOQsRbh+whL6REU7YapSqiq0YpjxUzgI3bGEzLAGTaubrYrAY/GpJrjjSbCTOQ
 tbDJy9ZN2nQeb2Z62RVLxVK/FgW4ZJn/DtwQnHRUJnxscaRbX+iVGg42PWMvCyb39eHdno
 vLnzUAqtvGz/7MU4mxiVrRY6QHYVgY4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-1xhqVD7RMcOqWdQpop5M7A-1; Thu, 05 Mar 2020 07:03:10 -0500
X-MC-Unique: 1xhqVD7RMcOqWdQpop5M7A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BA62184C801;
 Thu,  5 Mar 2020 12:03:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24FBF5C1D8;
 Thu,  5 Mar 2020 12:02:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9952511386A6; Thu,  5 Mar 2020 13:02:55 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Alexey Kirillov <lekiravi@yandex-team.ru>
Subject: Re: [PATCH v2 1/4] qapi: net: Add query-netdevs command
References: <20200304130656.16859-1-lekiravi@yandex-team.ru>
 <20200304130656.16859-2-lekiravi@yandex-team.ru>
Date: Thu, 05 Mar 2020 13:02:55 +0100
In-Reply-To: <20200304130656.16859-2-lekiravi@yandex-team.ru> (Alexey
 Kirillov's message of "Wed, 4 Mar 2020 16:06:53 +0300")
Message-ID: <87y2sff1qo.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Vincenzo Maffione <v.maffione@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Sven Schnelle <svens@stackframe.org>, Rob Herring <robh@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Laurent Vivier <lvivier@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Stefan Weil <sw@weilnetz.de>, Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 xen-devel@lists.xenproject.org, Giuseppe Lettieri <g.lettieri@iet.unipi.it>,
 Luigi Rizzo <rizzo@iet.unipi.it>, David Gibson <david@gibson.dropbear.id.au>,
 Thomas Huth <huth@tuxfamily.org>, Andrew Jeffery <andrew@aj.id.au>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org, yc-core@yandex-team.ru,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alexey Kirillov <lekiravi@yandex-team.ru> writes:

> Add a qmp command that provides information about currently attached
> network devices and their configuration.

Closes a gap in QMP; appreciated!

> Signed-off-by: Alexey Kirillov <lekiravi@yandex-team.ru>
[...]
> diff --git a/qapi/net.json b/qapi/net.json
> index 1cb9a7d782..4f329a1de0 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -750,3 +750,92 @@
>  ##
>  { 'event': 'FAILOVER_NEGOTIATED',
>    'data': {'device-id': 'str'} }
> +
> +##
> +# @NetdevInfo:
> +#
> +# Configuration of a network device.
> +#
> +# @id: Device identifier.
> +#
> +# @type: Specify the driver used for interpreting remaining arguments.
> +#
> +# @peer: Connected network device.

@peer is optional.  I assume its present when the device is connected
(frontend to backend or vice versa).  Correct?

> +#
> +# @queues-count: Number of queues.

We use plain @queues elsewhere in the schema.

> +#
> +# @hub: hubid of hub, if connected to.

How @hub is related to @peer is not quite obvious to me.  Can you give
an example where @hub is present?

> +#
> +# @perm-mac: Original MAC address.

What does "perm-" mean?

It's optional.  When exactly is it present?

> +#
> +# Since: 5.0
> +##
> +{ 'union': 'NetdevInfo',
> +  'base': { 'id': 'str',
> +            'type': 'NetClientDriver',
> +            '*peer': 'str',
> +            'queues-count': 'int',
> +            '*hub': 'int',
> +            '*perm-mac': 'str' },
> +  'discriminator': 'type',
> +  'data': {
> +      'nic':        'NetLegacyNicOptions',
> +      'user':       'NetdevUserOptions',
> +      'tap':        'NetdevTapOptions',
> +      'l2tpv3':     'NetdevL2TPv3Options',
> +      'socket':     'NetdevSocketOptions',
> +      'vde':        'NetdevVdeOptions',
> +      'bridge':     'NetdevBridgeOptions',
> +      'hubport':    'NetdevHubPortOptions',
> +      'netmap':     'NetdevNetmapOptions',
> +      'vhost-user': 'NetdevVhostUserOptions' } }

This is a copy of union 'Netdev' with a few additional common members
(@peer, @queues-count, @hub, @perm-mac).  I can't see how to avoid the
duplication without adding nesting on the wire.

> +
> +##
> +# @query-netdevs:
> +#
> +# Get a list of @NetdevInfo for all virtual network devices.
> +#
> +# Returns: a list of @NetdevInfo describing each virtual network device.
> +#
> +# Since: 5.0
> +#
> +# Example:
> +#
> +# -> { "execute": "query-netdevs" }
> +# <- { "return": [
> +#          {
> +#              "peer": "netdev0",
> +#              "netdev": "netdev0",
> +#              "perm-mac": "52:54:00:12:34:56"
> +#              "model": "virtio-net-pci",
> +#              "macaddr": "52:54:00:12:34:56",
> +#              "queues-count": 1,
> +#              "type": "nic",
> +#              "id": "net0"
> +#          },
> +#          {
> +#              "peer": "net0",
> +#              "ipv6": true,
> +#              "ipv4": true,
> +#              "host": "10.0.2.2",
> +#              "queues-count": 1,
> +#              "ipv6-dns": "fec0::3",
> +#              "ipv6-prefix": "fec0::",
> +#              "net": "10.0.2.0/255.255.255.0",
> +#              "ipv6-host": "fec0::2",
> +#              "type": "user",
> +#              "dns": "10.0.2.3",
> +#              "hostfwd": [
> +#                  {
> +#                      "str": "tcp::20004-:22"
> +#                  }
> +#              ],
> +#              "ipv6-prefixlen": 64,
> +#              "id": "netdev0",
> +#              "restrict": false
> +#          }
> +#      ]
> +#    }
> +#
> +##
> +{ 'command': 'query-netdevs', 'returns': ['NetdevInfo'] }

Like HMP "info network" and -net, this mixes frontends ("type": "nic")
and backends.  Unlike query-chardev and query-block.  Hmm.

A long time ago, all we had was -net: "-net nic" for configuring
frontends, "-net none" for suppressing a default frontend + backend, and
"-net anything-else" for configuring backends.  "info network" showed
the stuff set up with -net.

In v0.12, we got -device for configuring frontends, and -netdev for
backends.  -netdev is like -net less "none", "nic", and the hub
weirdness.  "info network" was extended to also show all this.

In v2.12, we got -nic, replacing -net nic.

Unless I'm missing something, -net is just for backward compatibility
now.

What's the use case for query-networks reporting frontends?


