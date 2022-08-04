Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BCA5897BA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 08:28:46 +0200 (CEST)
Received: from localhost ([::1]:36776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJULd-0004m0-2K
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 02:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJUF5-0000Fv-TD
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 02:22:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJUF1-0001am-Nn
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 02:21:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659594114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Wfq0EITa+6E5eMlOqzcUMGZunLADgQdpbQ9fzZeOsI=;
 b=Zl7/Tqdqa8k4o+flhTZeF/K2fBWsIRgGTDgkzypppg7rvu6+BV4JWrWrE9BRwFVdHXls66
 lpefIUHhdoRpKCPRrBsIPWdMeSQoQ+99DIBpGNfqI9coA2sTfadaXh8jfi07hfs3gYT643
 4PT9mGLMhXxiCKM0S8YWKC/5TuN+8Ck=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-q2j46S5TNg6tUnIhZYNaAg-1; Thu, 04 Aug 2022 02:21:52 -0400
X-MC-Unique: q2j46S5TNg6tUnIhZYNaAg-1
Received: by mail-qv1-f69.google.com with SMTP id
 np4-20020a056214370400b00476809b9caeso6225707qvb.0
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 23:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4Wfq0EITa+6E5eMlOqzcUMGZunLADgQdpbQ9fzZeOsI=;
 b=fs3l/Egkuo7+cM/rxvPkZ4anAMjxYcehIpJVOdLEOVAZPOj4lvvA0Pw0oPzfKXjF3e
 v/Uoz78ApUmMiQRDV+xKbSF+//DjfFdKolQnPbhDhsNtZt6N3mzKmIi6DdQhfpOVaCJ4
 jySeMc2vPMdqLquSzmwew7TEpfBe+ptF3PdC+BJ566kkFTxjuRJvL8kzqZZpHsGU4GAj
 /v5jpjFls2vHooqgh6whasJPH0d4CynFsd2/JV8vkHgceWJPKGT9AC93Mc1gUgK7p4Qo
 2kdxlZU4P54ucIavft8WHdTt8TxVjTQafzrSUAk+M/T2KyiSSi9hpXU/FEdsrW9yvitk
 7IYQ==
X-Gm-Message-State: ACgBeo2xRT+c2Jj8Pp+KPLJFPJMIRwH4ukk0TplIk2sREt74W8IzDGEQ
 vCRJcoH75pLhyS++wpPrfQNHPTcIgE6BuvsfvlcdbFmy1eJNsR+LfHWnB18ONyEuOQGhsU94LTU
 wpG5ro3jZSbviRyXfEJfMRf3sAfK5/jM=
X-Received: by 2002:a05:622a:451:b0:31f:4257:4eb2 with SMTP id
 o17-20020a05622a045100b0031f42574eb2mr280701qtx.370.1659594111761; 
 Wed, 03 Aug 2022 23:21:51 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7wo5n/mFD2392nZw6kePG9eMLMDg2xdFXvbUONGQ5pCVJNOewYFzX73COITOZJuWQqivOvUTy6NxJVKIN7W6I=
X-Received: by 2002:a05:622a:451:b0:31f:4257:4eb2 with SMTP id
 o17-20020a05622a045100b0031f42574eb2mr280675qtx.370.1659594111522; Wed, 03
 Aug 2022 23:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220802175731.312115-1-eperezma@redhat.com>
 <20220802175731.312115-4-eperezma@redhat.com>
 <308c14f4-90c5-9256-3a87-801dbd9eda05@redhat.com>
In-Reply-To: <308c14f4-90c5-9256-3a87-801dbd9eda05@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 4 Aug 2022 08:21:15 +0200
Message-ID: <CAJaqyWeHVM7RV0aDzM2LVLQDoFEEnwzJGjgAB-wSVqJEq1LzTw@mail.gmail.com>
Subject: Re: [PATCH v5 03/10] vhost: Do not depend on !NULL VirtQueueElement
 on vhost_svq_flush
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Eli Cohen <eli@mellanox.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 4, 2022 at 5:14 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/8/3 01:57, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > Since QEMU will be able to inject new elements on CVQ to restore the
> > state, we need not to depend on a VirtQueueElement to know if a new
> > element has been used by the device or not. Instead of check that, chec=
k
> > if there are new elements only using used idx on vhost_svq_flush.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.c | 18 +++++++++---------
> >   1 file changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index e6eebd0e8d..fdb550c31b 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -491,7 +491,7 @@ static void vhost_svq_flush(VhostShadowVirtqueue *s=
vq,
> >   /**
> >    * Poll the SVQ for one device used buffer.
> >    *
> > - * This function race with main event loop SVQ polling, so extra
> > + * This function races with main event loop SVQ polling, so extra
> >    * synchronization is needed.
> >    *
> >    * Return the length written by the device.
> > @@ -499,20 +499,20 @@ static void vhost_svq_flush(VhostShadowVirtqueue =
*svq,
> >   size_t vhost_svq_poll(VhostShadowVirtqueue *svq)
> >   {
> >       int64_t start_us =3D g_get_monotonic_time();
> > -    do {
> > +    while (true) {
> >           uint32_t len;
> > -        VirtQueueElement *elem =3D vhost_svq_get_buf(svq, &len);
> > -        if (elem) {
> > -            return len;
> > -        }
> >
> >           if (unlikely(g_get_monotonic_time() - start_us > 10e6)) {
> >               return 0;
> >           }
> >
> > -        /* Make sure we read new used_idx */
> > -        smp_rmb();
> > -    } while (true);
> > +        if (!vhost_svq_more_used(svq)) {
> > +            continue;
> > +        }
> > +
> > +        vhost_svq_get_buf(svq, &len);
>
>
> I wonder if this means we won't worry about the infinite wait?
>

vhost_svq_get_buf call doesn't block, and the check for the timeout is
immediately above the check for new descriptors. Am I missing
something?

> Thanks
>
>
> > +        return len;
> > +    }
> >   }
> >
> >   /**
>


