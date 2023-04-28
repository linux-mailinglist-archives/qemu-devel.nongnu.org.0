Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EA26F1E28
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 20:41:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psT1i-0006Tj-NV; Fri, 28 Apr 2023 14:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1psT1E-0006R9-KD; Fri, 28 Apr 2023 14:40:33 -0400
Received: from mout.web.de ([212.227.15.3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1psT1A-00051z-SM; Fri, 28 Apr 2023 14:40:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1682706842; i=lukasstraub2@web.de;
 bh=2bHxcMhFlVrwzVXQZ3StzGh+H6ExTaCPoYYZNzt61n8=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=ooYd+GBACr4y14o+VjHD9McKIRKTlzmwRuu43XXnCY7ScdZvrd7rVFElDel6o3Xk7
 clGVaen4J4+O66vqpOZi4d2MB9b4tRn4lNYCWny+Ssf8VREIEPcK9pSUmFv5ShUEyK
 vmDhUnzaYrwsWjVHetvESWuBJAIrNvySbLgTJAY4yg5D3OlKlvvWE1ZUx+C8HiM28h
 YYmvHzV6ser1uLZFS18Hc4ZuaCSbZloIQr1LTtvz9+Jg8k4+a3p8XQ8riDBwqprlLB
 CkZQlU77z+crcM8bF5YOKbUJBiI+a9h1YKAU4okFAGwNA7Qsik+sYA8BWM/YsB1fK4
 0ocdcnKPwDeYg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.126]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MA4bO-1pzezY1UmQ-00BYwI; Fri, 28
 Apr 2023 20:34:02 +0200
Date: Fri, 28 Apr 2023 20:33:47 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, michael.roth@amd.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, mst@redhat.com, imammedo@redhat.com,
 anisinha@redhat.com, eblake@redhat.com, kraxel@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com, arei.gonglei@huawei.com,
 pizhenwei@bytedance.com, jsnow@redhat.com, vsementsov@yandex-team.ru,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 quintela@redhat.com, peterx@redhat.com, leobras@redhat.com,
 jasowang@redhat.com, yuval.shaia.ml@gmail.com, pavel.dovgaluk@ispras.ru,
 jiri@resnulli.us, stefanb@linux.vnet.ibm.com, stefanha@redhat.com,
 kkostiuk@redhat.com, qemu-block@nongnu.org, victortoso@redhat.com
Subject: Re: [PATCH 17/17] qapi: Reformat doc comments to conform to current
 conventions
Message-ID: <20230428183347.4f93ed14@gecko.fritz.box>
In-Reply-To: <20230428105429.1687850-18-armbru@redhat.com>
References: <20230428105429.1687850-1-armbru@redhat.com>
 <20230428105429.1687850-18-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wenK8Isldd0z5VqI+qhLPOx";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:P4zLiMhjOftovkKSWQN2t5QK9mjZVi6YH35HwDgsjNMXGfWHebe
 J4OERnOFZM1Og8dhs4lNIBQyM8wYD/T8qWlrZN8r/ZlW7AetEKoZxRTKl23vcOyEkC8J/dL
 V/xSeZU+VR/vgAFB+YZW3xNxXfyOXyzdS0vqhYafm+4hM9IioffdngO3H7DPutxzjgApC7l
 gXlpEd2rNXvVnMecCY/Ow==
UI-OutboundReport: notjunk:1;M01:P0:7w0I6pSUOgg=;JFJNnG5IvqbZKjGBVLlGZ28lJ0B
 ZP2u8FhsGQXkJGatrJdxAQqWGi/CPvQV+AWwYbripTKZYZN1rqxQJeQeOmDQkegOTFAxO4IFP
 1H0UUvwwUtTj/qDI9A+YItudoikKOC8IRxOUR+HPkUpA+EaZTro37oG5V9bsNkvL7mY+juahA
 rhSMT2jEfuBYZPM5OhoqpauSj4WkObKwem2u2cGCYsWHvWTLP3bR639BOtoOguWAFT03TuN2u
 htP02WFScPxIqiNjPv4IuOVFfM96va1WnXaR+/P6BRKBA2p7IkCNMEp9/R355Sfob3MjS0HIb
 XEYYTguCaT61gcZYBenz2UOiSv6rtJ+KSyptN9f7DfXN0m/tZ4NFy2hXNQNyNAhE6QhbzQyNu
 chhAQa0alXpXedAC4yUK+rzUR3flV5De48763UieDxDKxzWF6Sxyy6TPvjvbHERIkqYrjuUr4
 +Idm48Dg+3fUkiv6H6echkSWTztZLEt8EwIwlNtpzJF75UVSld2p+OI8QDdMs7dLptNzmTaGL
 jxqJXL8YuMPQSNP3ZVYwcKqqY+Ztc13OJzTMwK5R+mewlWTapJTPpUhRSgFJjIfcI/r9nu68S
 XwTcV1flWI9qMbYfIxgoWHavlXknjun1npDa1L2EPkRglbH9LOTAwCSswVw1iZaI07eJL84JZ
 3FEmxcncMSkd1Vhz5UBHojmO7onwbJHUX09qnGPEu1TMHNymje20VWry4yFexlnsJ4QQ6f1+R
 nDBI1effuD/2+6eDROkmYqk1z/1TccEDutJKgw7TP4ILddK0tM4rPWXneq344Ik8pdlxWYgBl
 oUtCrf0/7aE46chnTybY8ZCTCWWrOzQfmwY0v01uYqgGiHoM6LcY5mS3qX5WsAPgOReCx6PxO
 SsijD9DsFKgycqaQRpInAj3ckU5L8NZVnyawprmhD6BMw2Twe0osNHRRGUiiic/myry5N6214
 6N9GJwmMlmGLGduqCEjiJx/IcHk=
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--Sig_/wenK8Isldd0z5VqI+qhLPOx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 28 Apr 2023 12:54:29 +0200
Markus Armbruster <armbru@redhat.com> wrote:

> Change
>=20
>     # @name: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
>     #        do eiusmod tempor incididunt ut labore et dolore magna aliqu=
a.
>=20
> to
>=20
>     # @name: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
>     #     do eiusmod tempor incididunt ut labore et dolore magna aliqua.
>=20
> See recent commit "qapi: Relax doc string @name: description
> indentation rules" for rationale.
>=20
> Reflow paragraphs to 70 columns width, and consistently use two spaces
> to separate sentences.
>=20
> To check the generated documentation does not change, I compared the
> generated HTML before and after this commit with "wdiff -3".  Finds no
> differences.  Comparing with diff is not useful, as the reflown
> paragraphs are visible there.
>=20
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Acked-by: Lukas Straub <lukasstraub2@web.de>

> ---
>  qapi/acpi.json           |   50 +-
>  qapi/audio.json          |   85 +-
>  qapi/authz.json          |   29 +-
>  qapi/block-core.json     | 2801 ++++++++++++++++++++------------------
>  qapi/block-export.json   |  242 ++--
>  qapi/block.json          |  214 +--
>  qapi/char.json           |  134 +-
>  qapi/common.json         |   19 +-
>  qapi/compat.json         |   13 +-
>  qapi/control.json        |   59 +-
>  qapi/crypto.json         |  261 ++--
>  qapi/cryptodev.json      |    3 +
>  qapi/cxl.json            |   74 +-
>  qapi/dump.json           |   78 +-
>  qapi/error.json          |    6 +-
>  qapi/introspect.json     |   89 +-
>  qapi/job.json            |  139 +-
>  qapi/machine-target.json |  303 +++--
>  qapi/machine.json        |  389 +++---
>  qapi/migration.json      | 1117 ++++++++-------
>  qapi/misc-target.json    |   67 +-
>  qapi/misc.json           |  180 ++-
>  qapi/net.json            |  260 ++--
>  qapi/pci.json            |   35 +-
>  qapi/qapi-schema.json    |   25 +-
>  qapi/qdev.json           |   63 +-
>  qapi/qom.json            |  404 +++---
>  qapi/rdma.json           |    1 -
>  qapi/replay.json         |   48 +-
>  qapi/rocker.json         |   20 +-
>  qapi/run-state.json      |  215 +--
>  qapi/sockets.json        |   50 +-
>  qapi/stats.json          |   83 +-
>  qapi/tpm.json            |   20 +-
>  qapi/trace.json          |   34 +-
>  qapi/transaction.json    |   87 +-
>  qapi/ui.json             |  435 +++---
>  qapi/virtio.json         |   84 +-
>  qapi/yank.json           |   42 +-
>  39 files changed, 4322 insertions(+), 3936 deletions(-)
>=20
> [...]
>=20
> diff --git a/qapi/yank.json b/qapi/yank.json
> index 1639744ada..87ec7cab96 100644
> --- a/qapi/yank.json
> +++ b/qapi/yank.json
> @@ -9,7 +9,7 @@
>  ##
>  # @YankInstanceType:
>  #
> -# An enumeration of yank instance types. See @YankInstance for more
> +# An enumeration of yank instance types.  See @YankInstance for more
>  # information.
>  #
>  # Since: 6.0
> @@ -20,8 +20,8 @@
>  ##
>  # @YankInstanceBlockNode:
>  #
> -# Specifies which block graph node to yank. See @YankInstance for more
> -# information.
> +# Specifies which block graph node to yank.  See @YankInstance for
> +# more information.
>  #
>  # @node-name: the name of the block graph node
>  #
> @@ -33,8 +33,8 @@
>  ##
>  # @YankInstanceChardev:
>  #
> -# Specifies which character device to yank. See @YankInstance for more
> -# information.
> +# Specifies which character device to yank.  See @YankInstance for
> +# more information.
>  #
>  # @id: the chardev's ID
>  #
> @@ -46,21 +46,18 @@
>  ##
>  # @YankInstance:
>  #
> -# A yank instance can be yanked with the @yank qmp command to recover fr=
om a
> -# hanging QEMU.
> +# A yank instance can be yanked with the @yank qmp command to recover
> +# from a hanging QEMU.
>  #
>  # Currently implemented yank instances:
>  #
> -# - nbd block device:
> -#   Yanking it will shut down the connection to the nbd server without
> -#   attempting to reconnect.
> -# - socket chardev:
> -#   Yanking it will shut down the connected socket.
> -# - migration:
> -#   Yanking it will shut down all migration connections. Unlike
> -#   @migrate_cancel, it will not notify the migration process, so migrat=
ion
> -#   will go into @failed state, instead of @cancelled state. @yank shoul=
d be
> -#   used to recover from hangs.
> +# - nbd block device: Yanking it will shut down the connection to the
> +#   nbd server without attempting to reconnect.
> +# - socket chardev: Yanking it will shut down the connected socket.
> +# - migration: Yanking it will shut down all migration connections.
> +#   Unlike @migrate_cancel, it will not notify the migration process,
> +#   so migration will go into @failed state, instead of @cancelled
> +#   state.  @yank should be used to recover from hangs.
>  #
>  # Since: 6.0
>  ##
> @@ -74,13 +71,14 @@
>  ##
>  # @yank:
>  #
> -# Try to recover from hanging QEMU by yanking the specified instances. S=
ee
> -# @YankInstance for more information.
> +# Try to recover from hanging QEMU by yanking the specified instances.
> +# See @YankInstance for more information.
>  #
>  # Takes a list of @YankInstance as argument.
>  #
> -# Returns: - Nothing on success
> -#          - @DeviceNotFound error, if any of the YankInstances doesn't =
exist
> +# Returns:
> +# - Nothing on success
> +# - @DeviceNotFound error, if any of the YankInstances doesn't exist
>  #
>  # Example:
>  #
> @@ -101,7 +99,7 @@
>  ##
>  # @query-yank:
>  #
> -# Query yank instances. See @YankInstance for more information.
> +# Query yank instances.  See @YankInstance for more information.
>  #
>  # Returns: list of @YankInstance
>  #



--=20


--Sig_/wenK8Isldd0z5VqI+qhLPOx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRMEYwACgkQNasLKJxd
sli6VQ/8DJlSmRViYjjT8Ygvkj07jr8N9UbxnXxC1Hv5I97AwdYX8oyK3udiIw11
AelK2MisVu/LT/809owp1G1KN/PTjVTsPvj1EM/Dfyi7+kK/kk2+61NNc8nM8A4G
c1ghbzDBNsKXFn4b26kvDKvqdO2V77nGbrMRS/Q6ByOG8nN1r/s8fOQrSiQz+Hiq
4IitX7l22VMVRAox/1VXyB6euwdwwBbFl4yoxe2scQk5MGg5FeylDuDE5BEz3AfQ
l9fdOqPjKVlFKbWUBw2L169jPCo+Cz4GB9E/BnzTqawFQ8fPogNZUc+M40AuMPsp
wwAKYPr1DM6oIYN39sxNkigZtETzCgRCXtIvF2bl9tvJ6UUQwODPN9PpTgNw9ZHl
sdoh74Hivi/wNalKBds5Q8kDBOlUuIy4Dl0n+q5rGjM8n4ragNJaKxhVDAQqgnk6
gObt1V+1luQLRZLrWx9sP+dQZuzsgZ708/8jk6o3Czv4uP0woroYCe84OlxWlTSw
iYZ4unCVJfLGrrbTElgbo36Vv/O3PvhUDBub/p1NqUTdxo/twvK84dAk24qLNjLx
w/TzWRIyatAH9HtGzuzlIPm3n/Y98wtyMkPT3qfWk0VqLxzVVCDNNRhSEaCNHNXV
uHM5Vr6sOfEiFwJ7XwgRJlXCdN6c9fHksp8RCoteYuYztrOi434=
=iy65
-----END PGP SIGNATURE-----

--Sig_/wenK8Isldd0z5VqI+qhLPOx--

