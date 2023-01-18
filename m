Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CFD67222C
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 16:54:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIAkT-0003e1-0G; Wed, 18 Jan 2023 10:53:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pIAkQ-0003bo-Ks
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 10:53:11 -0500
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pIAkO-00082D-V9
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 10:53:10 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id o75so38630526yba.2
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 07:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HZm6THKvvUbPSAwaouE6TcPFNJEd+7FBTRyEA/iHg/g=;
 b=gwIpEwD8ffCPq6XjxijbxiYk1D8EQboD2q+XAvhxIa7b4V3WsLCowm3VVpWCEusyl5
 g9iE1Sh0oIB2DlalEntn1Lyh6IS1d3tx0RpdK3XuW2Ul+3L8mgGdp+ek+6H/8UTS3ri1
 pWJ6FE6b/xHPmhNF+U3F7LYdDW7cIhDM4SJ+BNR5Rmr6zGaLNttFg611bMTibwfv/YBW
 uD0YFwhSJuJmeVy3IRX1SQb1KYg3AXB8KRVYfmOGkd2tikJ33jVgD7O5KP4+YUhN7hUK
 bakYlCLgpfoUaqUbR7KDUjnb+0R+ffv0xjtB0RVYxJUE+ezM5WIjGYR5o5HVciMPOn16
 rU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HZm6THKvvUbPSAwaouE6TcPFNJEd+7FBTRyEA/iHg/g=;
 b=FJuISp+bSE0pPSsUpzjlXvyVLN7S4cqAF1EfWZm5k+Bdc9aO0VlPeQJUdqSwgFwbjj
 4S9jZQ+UuYfJSpga8zj8NfGHoC676HfDuz2ycqRbEwWr6hcQgWmaEM6jfBRTg5T5SqxA
 EEX0edMxNkBZaCJmSzTJXe/u4+9fsbC/Qpf9AkLsWjE9o4jQmULTQkqK7cLMBcROBgCL
 eHVuc0C1JtaV2IRRenkAKiMV0j5lhLj78+ojUej1iCPVqUW3p0zb9TwFDaWVPsqCsfuA
 08rcDYLasVLQrc+oQFa3hXFMjxucaCTNc7z9zMCKnms8qV0L+zBmdco/d/FysHEbuTHD
 d62w==
X-Gm-Message-State: AFqh2koH3uNHNJaFtvMwJPIL5wNhg9YMt5vZQ9k77tMnfc0O446VUW2Q
 k9U/Oz7hifeVflUcKdLhAkC3JDx8napryr6siwk=
X-Google-Smtp-Source: AMrXdXs3GLhPK8rZL2aPbHdKzxue/XRvuVg1CIY8tG0C9uzvldPFfmOgnZXuY/nAGt4UpVX+uHD3tXKz0nFZ4qD98Ho=
X-Received: by 2002:a25:8251:0:b0:6ee:f3dc:b8d0 with SMTP id
 d17-20020a258251000000b006eef3dcb8d0mr953876ybn.642.1674057187774; Wed, 18
 Jan 2023 07:53:07 -0800 (PST)
MIME-Version: 1.0
References: <20230115170903.3416105-1-antonkuchin@yandex-team.ru>
In-Reply-To: <20230115170903.3416105-1-antonkuchin@yandex-team.ru>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 18 Jan 2023 10:52:55 -0500
Message-ID: <CAJSP0QVKUKgkBMw1PiN8-L8Ykhq=gfvNTTs4sf1tuzoqHu+GXw@mail.gmail.com>
Subject: Re: [PATCH] vhost-user-fs: add capability to allow migration
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com, 
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, yc-core@yandex-team.ru, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 15 Jan 2023 at 12:21, Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
>
> Now any vhost-user-fs device makes VM unmigratable, that also prevents
> qemu update without stopping the VM. In most cases that makes sense
> because qemu has no way to transfer FUSE session state.
>
> But we can give an option to orchestrator to override this if it can
> guarantee that state will be preserved (e.g. it uses migration to
> update qemu and dst will run on the same host as src and use the same
> socket endpoints).
>
> This patch keeps default behavior that prevents migration with such devices
> but adds migration capability 'vhost-user-fs' to explicitly allow migration.
>
> Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>
> ---
>  hw/virtio/vhost-user-fs.c | 25 ++++++++++++++++++++++++-
>  qapi/migration.json       |  7 ++++++-
>  2 files changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index f5049735ac..13d920423e 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -24,6 +24,7 @@
>  #include "hw/virtio/vhost-user-fs.h"
>  #include "monitor/monitor.h"
>  #include "sysemu/sysemu.h"
> +#include "migration/migration.h"
>
>  static const int user_feature_bits[] = {
>      VIRTIO_F_VERSION_1,
> @@ -298,9 +299,31 @@ static struct vhost_dev *vuf_get_vhost(VirtIODevice *vdev)
>      return &fs->vhost_dev;
>  }
>
> +static int vhost_user_fs_pre_save(void *opaque)
> +{
> +    MigrationState *s = migrate_get_current();
> +
> +    if (!s->enabled_capabilities[MIGRATION_CAPABILITY_VHOST_USER_FS]) {
> +        error_report("Migration of vhost-user-fs devices requires internal FUSE "
> +                     "state of backend to be preserved. If orchestrator can "
> +                     "guarantee this (e.g. dst connects to the same backend "
> +                     "instance or backend state is migrated) set 'vhost-user-fs' "
> +                     "migration capability to true to enable migration.");
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
>  static const VMStateDescription vuf_vmstate = {
>      .name = "vhost-user-fs",
> -    .unmigratable = 1,
> +    .minimum_version_id = 0,
> +    .version_id = 0,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_VIRTIO_DEVICE,
> +        VMSTATE_END_OF_LIST()
> +    },
> +   .pre_save = vhost_user_fs_pre_save,
>  };

Will it be possible to extend this vmstate when virtiofsd adds support
for stateful migration without breaking migration compatibility?

If not, then I think a marker field should be added to the vmstate:
0 - stateless/reconnect migration (the approach you're adding in this patch)
1 - stateful migration (future virtiofsd feature)

When the field is 0 there are no further vmstate fields and we trust
that the destination vhost-user-fs server already has the necessary
state.

When the field is 1 there are additional vmstate fields that contain
the virtiofsd state.

The goal is for QEMU to support 3 migration modes, depending on the
vhost-user-fs server:
1. No migration support.
2. Stateless migration.
3. Stateful migration.

>
>  static Property vuf_properties[] = {
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 88ecf86ac8..9a229ea884 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -477,6 +477,11 @@
>  #                    will be handled faster.  This is a performance feature and
>  #                    should not affect the correctness of postcopy migration.
>  #                    (since 7.1)
> +# @vhost-user-fs: If enabled, the migration process will allow migration of
> +#                 vhost-user-fs devices, this should be enabled only when
> +#                 backend can preserve local FUSE state e.g. for qemu update
> +#                 when dst reconects to the same endpoints after migration.
> +#                 (since 8.0)

This is global but a guest can have multiple vhost-user-fs devices
connected to different servers.

I would add a qdev property to the device instead of introducing a
migration capability. The property would enable "stateless migration".
When the property is not set, migration would be prohibited.

>  #
>  # Features:
>  # @unstable: Members @x-colo and @x-ignore-shared are experimental.
> @@ -492,7 +497,7 @@
>             'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
>             { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
>             'validate-uuid', 'background-snapshot',
> -           'zero-copy-send', 'postcopy-preempt'] }
> +           'zero-copy-send', 'postcopy-preempt', 'vhost-user-fs'] }
>
>  ##
>  # @MigrationCapabilityStatus:
> --
> 2.34.1
>
>

