Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C928747BA00
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 07:22:46 +0100 (CET)
Received: from localhost ([::1]:53780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzYXt-0005dp-Ti
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 01:22:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mzXy2-0005SS-5N
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 00:45:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mzXxy-0002Pp-Jz
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 00:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640065534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L1p5NSUlfAjvjbWbEeYM0l0N5bVEuKpaWZQAjiil054=;
 b=Uw9BE23j3DDQeBsnFqAWSCbxeYFOl4CYj0IjLVgpkUmocfkzh/VgvfGDhIClLGCerWPrqH
 pRXeTvOAXRspryOhviOXs6pu5sscJze4qztljnmM9CUBJghqwaPiORAJbjVYcASsiTInAF
 TqMLsA4a2lbZstrN4fKsO3S1AMEK88w=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-_rX3H7mSObGuvV0ksuThzw-1; Tue, 21 Dec 2021 00:45:32 -0500
X-MC-Unique: _rX3H7mSObGuvV0ksuThzw-1
Received: by mail-lf1-f71.google.com with SMTP id
 b4-20020a056512304400b00425cf422539so2583574lfb.2
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 21:45:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L1p5NSUlfAjvjbWbEeYM0l0N5bVEuKpaWZQAjiil054=;
 b=j36R8h5cOuNo9FtlAeoW//O+sDv7596+nxN4XreHUcXy3PpkFrcGNZW8EnYHQ8cX0t
 XLn+Xiu4337W4lhUdtVH3wRnWHyeTpU5uvNjsoLasHT6Ue9r1TeMNojlKnbxmdxqlDjm
 TMAxn7D0lx/ybvUywXyu2J1KZDjgfFuFd7TsZPhdjbo7QF2Ic+z5q2p/C0tDGsovrNIU
 X34Erq+ZhffH1UiMl6k8fiCHT+d05z78+akc8F7ElguVSEBtH9cgSBV4GiZfx43vxsJb
 dZLXuIQfgx23mOYetMJwgrFNgdxwhswPY8iQYgbpYbqmFhdcrFHITKZiD1TWXb7zvMU5
 jsyg==
X-Gm-Message-State: AOAM531ve6LroNYwVAci8eLfaNU4V/f4JdmbqbcqTdskHJuMrRN7lXYa
 aogxMCMjHRS6dR1qzY4ENpbIHRkr2IdRg9/1d3BEOA4sTlxfGLlPdgRfEHuPBMbrcLJrUWqxqYM
 FtmZCWT2e6TxCR0N21yI8MN5vpo7AUGA=
X-Received: by 2002:a2e:b88d:: with SMTP id r13mr1367066ljp.362.1640065531403; 
 Mon, 20 Dec 2021 21:45:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwuKkbPXiQjfYudZ5dKkN1Te9NirWpPKSUlZKWnY+7nIiURlLgLKSl1VwI0WUXegt6RVb0Io6x2BioMYtRF1pg=
X-Received: by 2002:a2e:b88d:: with SMTP id r13mr1367046ljp.362.1640065531112; 
 Mon, 20 Dec 2021 21:45:31 -0800 (PST)
MIME-Version: 1.0
References: <20211220145314.390697-1-lvivier@redhat.com>
In-Reply-To: <20211220145314.390697-1-lvivier@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 21 Dec 2021 13:45:19 +0800
Message-ID: <CACGkMEujUZEwyoa_K18bb9fD4uvaxTLbPP2Gjzs=_h+TsQwfpg@mail.gmail.com>
Subject: Re: [PATCH] failover: Silence warning messages during qtest
To: Laurent Vivier <lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 20, 2021 at 10:53 PM Laurent Vivier <lvivier@redhat.com> wrote:
>
> virtio-net-failover test tries several device combinations that produces
> some expected warnings.
> These warning can be confusing, so we disable them during the qtest
> sequence.
>
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---

Acked-by: Jason Wang <jasowang@redhat.com>

>  hw/net/virtio-net.c   | 3 ++-
>  migration/migration.c | 4 +++-
>  2 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index f2014d5ea0b3..c64a6b9d1745 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -44,6 +44,7 @@
>  #include "hw/pci/pci.h"
>  #include "net_rx_pkt.h"
>  #include "hw/virtio/vhost.h"
> +#include "sysemu/qtest.h"
>
>  #define VIRTIO_NET_VM_VERSION    11
>
> @@ -925,7 +926,7 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
>          qapi_event_send_failover_negotiated(n->netclient_name);
>          qatomic_set(&n->failover_primary_hidden, false);
>          failover_add_primary(n, &err);
> -        if (err) {
> +        if (err && !qtest_enabled()) {
>              warn_report_err(err);
>          }
>      }
> diff --git a/migration/migration.c b/migration/migration.c
> index 3de11ae921e0..065216561063 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -60,6 +60,7 @@
>  #include "qemu/yank.h"
>  #include "sysemu/cpus.h"
>  #include "yank_functions.h"
> +#include "sysemu/qtest.h"
>
>  #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
>
> @@ -3766,7 +3767,8 @@ static void qemu_savevm_wait_unplug(MigrationState *s, int old_state,
>              while (timeout-- && qemu_savevm_state_guest_unplug_pending()) {
>                  qemu_sem_timedwait(&s->wait_unplug_sem, 250);
>              }
> -            if (qemu_savevm_state_guest_unplug_pending()) {
> +            if (qemu_savevm_state_guest_unplug_pending() &&
> +                !qtest_enabled()) {
>                  warn_report("migration: partially unplugged device on "
>                              "failure");
>              }
> --
> 2.33.1
>


