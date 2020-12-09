Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4296B2D4ACA
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:46:42 +0100 (CET)
Received: from localhost ([::1]:49292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn5Q8-0003hM-MX
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:46:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kn4WP-00052U-99
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:49:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kn4WN-00045H-6j
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:49:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607539742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ZdtDVnVSLorYMf0VwrM99dH6Rak2Bc4C+97zOEHdxY=;
 b=OnNniVY8/pADg5bhmkfgdzo8Xlg04yazL6ma77dje9HHqASpIpN6eYPK9x8quFaH/XJjtF
 4BNHKdUZ73ChYmE8XJ4c3nG90Q+/SdaV7g8Vcczm/WlC1tVDDGK8eKVWWov5s4MtoGLtZa
 x7RhJ+tfXIv4Fz+LRXVoCHav0zI1Ikg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-EHvYAAiSMYmUNNsVxHIp8A-1; Wed, 09 Dec 2020 13:49:00 -0500
X-MC-Unique: EHvYAAiSMYmUNNsVxHIp8A-1
Received: by mail-qt1-f200.google.com with SMTP id f17so1924002qtl.15
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:49:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2ZdtDVnVSLorYMf0VwrM99dH6Rak2Bc4C+97zOEHdxY=;
 b=sH5JPGcZmmyP51xgApX3h3JCax23/sRnwjc7wG/ZAtsnA+/tBkRLD9dlJxb5cjf499
 N0nE29CMDDV2V1IjznGPnVpwRhCKN9QqCY5oy3VTyQdQkjVZ/Qdm7TO/Y0PoYNHb7YSx
 mq2WbuOTuM5ykv3CLZk1/+pRazQVbK5vXCG9MVtLgR/1kUwYG7ZpwguYp6NdJPQVdtYP
 mDsvtzC3gb2MKtDHl9RD+JKMBJ5yjHsDci9JwPg4xj2dbOwPa5izGotoXVdoI9EVUuP9
 sWj2dXsZbAWretekpcN/ANF5hWzkAc8TqjGjOMJMHxAv1jIgWF8CUTwvVkBwTeaS0hWR
 OE0Q==
X-Gm-Message-State: AOAM533ihcc6HDWUYebilCY/cILJHl6nAsMgXIBhWdR/9eOju5RlsXUs
 HpnT7cNPfLs0QQXK+T6XWQnlA+oVM9yPbS8Qh64Eg5e7gepuhd3OaNCrube5j5yRp5xMI/9eJ15
 PGo88/1o/meervb+Mc4PyQzdZpFxvWPg=
X-Received: by 2002:ac8:e06:: with SMTP id a6mr4783870qti.384.1607539740288;
 Wed, 09 Dec 2020 10:49:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUDRcl0vkOdfin0XBAKi1xojbc8ggj/scgMp3QAm6uN/Gb1T8m4oXNBcerz4NAW0ctj6nhIRule5lH9IWXXNI=
X-Received: by 2002:ac8:e06:: with SMTP id a6mr4783839qti.384.1607539740115;
 Wed, 09 Dec 2020 10:49:00 -0800 (PST)
MIME-Version: 1.0
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-19-eperezma@redhat.com>
 <20201208084158.GU203660@stefanha-x1.localdomain>
In-Reply-To: <20201208084158.GU203660@stefanha-x1.localdomain>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 9 Dec 2020 19:48:24 +0100
Message-ID: <CAJaqyWeMp=k_1CmWoywE+EiAC5ZYZyX=ieYZgqxFui-Z1Q-+Nw@mail.gmail.com>
Subject: Re: [RFC PATCH 18/27] vhost: add vhost_vring_poll_rcu
To: Stefan Hajnoczi <stefanha@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kvm list <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Daniel Daly <dandaly0@gmail.com>, virtualization@lists.linux-foundation.org,
 Liran Alon <liralon@gmail.com>, Eli Cohen <eli@mellanox.com>,
 Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Alex Barba <alex.barba@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lee Ballard <ballle98@gmail.com>, Lars Ganrot <lars.ganrot@gmail.com>,
 Rob Miller <rob.miller@broadcom.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Howard Cai <howard.cai@gmail.com>, Parav Pandit <parav@mellanox.com>,
 vm <vmireyno@marvell.com>, Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 8, 2020 at 9:42 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Fri, Nov 20, 2020 at 07:50:56PM +0100, Eugenio P=C3=A9rez wrote:
> > @@ -83,6 +89,18 @@ void vhost_vring_set_notification_rcu(VhostShadowVir=
tqueue *vq, bool enable)
> >      smp_mb();
> >  }
> >
> > +bool vhost_vring_poll_rcu(VhostShadowVirtqueue *vq)
>
> A name like "more_used" is clearer than "poll".

I agree, I will rename.

Thanks!


