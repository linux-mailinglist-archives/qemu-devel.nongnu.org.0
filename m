Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA5542DED0
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 18:03:29 +0200 (CEST)
Received: from localhost ([::1]:54444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb3CZ-0002Gf-Vg
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 12:03:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mb38J-0008Mh-E7
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:59:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mb38D-0007x7-0S
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:59:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634227136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YODOFrUlYL0n3rquGcNxqXXNq4fAVrRU9OEFUJA6mdg=;
 b=Lp6n7nRrApHvd18JQZMseTlpelgZMGsNFWv0zyScDWcSdE4T0mVxfEn8v19yTPxyg2lIFW
 CJ2BAbjGBciSSE9LELGlda2yOpiiLZ95BibyS/GkNPfa231LjvKaHXW5bgvV1SKFniue3V
 kz+UoRK4/KFByKsB6rr/ETi0I4ktg/4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-ipF7dnxFPnCRBoWnx_I_Gw-1; Thu, 14 Oct 2021 11:58:55 -0400
X-MC-Unique: ipF7dnxFPnCRBoWnx_I_Gw-1
Received: by mail-qt1-f199.google.com with SMTP id
 t15-20020ac8588f000000b002a777ee14d0so4804847qta.14
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 08:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YODOFrUlYL0n3rquGcNxqXXNq4fAVrRU9OEFUJA6mdg=;
 b=c1jEPERrHrLu0X3MizNqmffj2DUQQA7Me/CyBzaaDgn0yc7El/GGbmki+kbuBcXfQn
 JWJhmHmGfC4dpOLFPVGBpsE+ZAlYPK3MBI5RovSh+H+5vV4yWfb3bHCYa67exyO1scam
 PD6VF4FVyMAz1YVfitQtWRK8bysz9KncjIZC3+7zc9SVHD4/h66kuviwnu5GYI/U/x0d
 3vMg8jnUUj+L9//QaBl9EObYMpQ7Hvy0hfZjShUTWrIIgvT9b2ZAib3oaIegp/jeY9cp
 wk8An/5uiZEh2ZNrFNIpvLWI71GjGmVuScqxkGoDjzJX0Pc3973d7kEzD1ceCV+6GlKR
 Vrlw==
X-Gm-Message-State: AOAM533j03Jta+L9S7FpaJTSKzFNRSz7iay5EwR5dFK+XmjG2rBChU3M
 LJX2CYJkftNo4cnNEKH+uNTtPiackAIAkPiKgG+CNokfrEH5ZFoF45hPxik0pLxjT6w2JJ4CAaZ
 NsJ96Pxzw7g/ahe6RD4TX76jNbYHryBY=
X-Received: by 2002:a37:9c57:: with SMTP id f84mr5550528qke.16.1634227134899; 
 Thu, 14 Oct 2021 08:58:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKbnANWvh+F2pbvCn8oO21tGMx0oghkwTNJJXzIayc4gumuIh5n0NBoINwMvIzDbIEWg3ee3TqcS0tkejI18c=
X-Received: by 2002:a37:9c57:: with SMTP id f84mr5550500qke.16.1634227134668; 
 Thu, 14 Oct 2021 08:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211001070603.307037-1-eperezma@redhat.com>
 <20211001070603.307037-12-eperezma@redhat.com>
 <69c4056c-4a9b-8480-80a0-2b78c9b90ffb@redhat.com>
In-Reply-To: <69c4056c-4a9b-8480-80a0-2b78c9b90ffb@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 14 Oct 2021 17:58:18 +0200
Message-ID: <CAJaqyWcQ314RN7-U1bYqCMXb+-nyhSi3ddqWv90ofFucMbveUw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 11/20] vhost: Route host->guest notification
 through shadow virtqueue
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Parav Pandit <parav@mellanox.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-level <qemu-devel@nongnu.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Eric Blake <eblake@redhat.com>, Michael Lilja <ml@napatech.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 13, 2021 at 5:49 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/10/1 =E4=B8=8B=E5=8D=883:05, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > This will make qemu aware of the device used buffers, allowing it to
> > write the guest memory with its contents if needed.
> >
> > Since the use of vhost_virtqueue_start can unmasks and discard call
> > events, vhost_virtqueue_start should be modified in one of these ways:
> > * Split in two: One of them uses all logic to start a queue with no
> >    side effects for the guest, and another one tha actually assumes tha=
t
> >    the guest has just started the device. Vdpa should use just the
> >    former.
> > * Actually store and check if the guest notifier is masked, and do it
> >    conditionally.
> > * Left as it is, and duplicate all the logic in vhost-vdpa.
>
>
> Btw, the log looks not clear. I guess this patch goes for method 3. If
> yes, we need explain it and why.
>
> Thanks
>

Sorry about being unclear. This commit log (and code) just exposes the
problem and the solutions I came up with but does nothing to solve it.
I'm actually going for method 3 for the next series but I'm open to
doing it differently.

>
> >
> > Signed-off-by: Eugenio P=C3=A9rez<eperezma@redhat.com>
>


