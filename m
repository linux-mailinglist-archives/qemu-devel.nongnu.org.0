Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 554C418F3F2
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Mar 2020 12:56:01 +0100 (CET)
Received: from localhost ([::1]:60774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGLgW-0000VV-Cz
	for lists+qemu-devel@lfdr.de; Mon, 23 Mar 2020 07:56:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45766)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlureau@redhat.com>) id 1jGLfU-0007xp-RA
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 07:54:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlureau@redhat.com>) id 1jGLfT-0007EB-R6
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 07:54:56 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:33938)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1jGLfT-0007E5-Nl
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 07:54:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584964495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CjiKVvMPF1l+adgNfLC+OUOIxAy0feOvV+N4qaLCaGM=;
 b=bnrI6MyJEgijuViKiM/yG0Bd2kgiLWLfAP5rN7oGYDI6UN4hIWgMotu5WPBozQ1E24Z31f
 Pd+W1houZ4knKJY2ZNalf9X7ccpqhzWwnduoV8z3n21/Og/hrdxgxRsRHQzQlIXY5D0BbH
 rzbrxJ3f769MKT5ze1xes3TQ2VX4Gj0=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-X1hfQGujPMGACO-RxMOU0w-1; Mon, 23 Mar 2020 07:54:54 -0400
X-MC-Unique: X1hfQGujPMGACO-RxMOU0w-1
Received: by mail-oi1-f200.google.com with SMTP id 11so1909695oii.8
 for <qemu-devel@nongnu.org>; Mon, 23 Mar 2020 04:54:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CjiKVvMPF1l+adgNfLC+OUOIxAy0feOvV+N4qaLCaGM=;
 b=GqncvrDo5t7a81z/hPjaag6TZzJUFLiqNR78WYsVsEvhs/M+4oe9UhjTt3wyy71tfV
 nkJZIt0lwECl1vU/yOCLe8aPfdVF8wcEE8eAjonMVGHursAEuMM/AuFEW6d3adV2Qzn3
 tp2cVsV+SFRk4AQUeJqcyIQt02qmvtV6jK8oijBPl9j7zRZAPtR6TQcf6dLO/crq75by
 ptbWhzVID51s7zs+nW4sPVTNbJv1sBeOMcRu0iP5T7iIx6Oh+gW0QrcCX9jFWZqqbhSn
 ZJHhqSah2pdueK/zhm6nuJU1vL0Rm6hrQgHp6QxR1IrulAeAKh9SJ/NVjeSHG5MCprkB
 aJlg==
X-Gm-Message-State: ANhLgQ0wccD670lGzcwwtCQnxuBqgkdzC4kRd3pLPCwoQ7Ab1h7d5rLX
 +fEYhLLClsrFV2G6dfW82pZoeNWbJtyAMlLnWuS2TiJbNJY45gVLo6rocx9BRA6+lqlbkRXuQHc
 dDr37WUZjwHKjOz7VenOegvU8y2oM4XI=
X-Received: by 2002:a05:6830:1597:: with SMTP id
 i23mr16857576otr.368.1584964493132; 
 Mon, 23 Mar 2020 04:54:53 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtGZdsHCRtE9mMqXNyAp/w38JUT50zqnm/vFaKASsiZRvC2mr520d2ARSgEOd6PNbwmn9d0XGj7xn8JXVXqYCc=
X-Received: by 2002:a05:6830:1597:: with SMTP id
 i23mr16857566otr.368.1584964492923; 
 Mon, 23 Mar 2020 04:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200323112943.12010-1-philmd@redhat.com>
 <20200323112943.12010-3-philmd@redhat.com>
In-Reply-To: <20200323112943.12010-3-philmd@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 23 Mar 2020 12:54:41 +0100
Message-ID: <CAMxuvazGfXXz0tc4DJpRecW1CYdT5WGO=t7VbjS9hLqhC2rO8Q@mail.gmail.com>
Subject: Re: [PATCH-for-5.0 2/3] virtio: Document virtqueue_pop()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 23, 2020 at 12:30 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Document that virtqueue_pop() returned memory must be released
> with free().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  include/hw/virtio/virtio.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index b69d517496..c6e3bfc500 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -199,6 +199,14 @@ void virtqueue_fill(VirtQueue *vq, const VirtQueueEl=
ement *elem,
>                      unsigned int len, unsigned int idx);
>
>  void virtqueue_map(VirtIODevice *vdev, VirtQueueElement *elem);
> +/**
> + * virtqueue_pop:
> + * @vq: a VirtQueue queue
> + * @sz: the size of struct to return (must be >=3D VirtQueueElement)
> + *
> + * Returns: a VirtQueueElement filled from the queue or NULL.
> + * The returned element must be free()-d by the caller.
> + */
>  void *virtqueue_pop(VirtQueue *vq, size_t sz);
>  unsigned int virtqueue_drop_all(VirtQueue *vq);
>  void *qemu_get_virtqueue_element(VirtIODevice *vdev, QEMUFile *f, size_t=
 sz);
> --
> 2.21.1
>


