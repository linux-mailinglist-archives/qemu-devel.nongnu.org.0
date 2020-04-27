Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 365CB1BA76A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Apr 2020 17:10:30 +0200 (CEST)
Received: from localhost ([::1]:50082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jT5Ou-0000sj-OD
	for lists+qemu-devel@lfdr.de; Mon, 27 Apr 2020 11:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34274)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alexander.duyck@gmail.com>) id 1jT5NY-0007DE-NN
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 11:09:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alexander.duyck@gmail.com>) id 1jT5NY-0000h6-93
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 11:09:04 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:43005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexander.duyck@gmail.com>)
 id 1jT5NX-0000gb-Sr
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 11:09:03 -0400
Received: by mail-io1-xd42.google.com with SMTP id e9so19162817iok.9
 for <qemu-devel@nongnu.org>; Mon, 27 Apr 2020 08:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pEGq9PrL7zbSXkhH6KswIJDAa4K0ZLmP28/6kqX8Rl8=;
 b=ZwYAEa1CZmtXOrzTiXeqUjDBjSoAIvUCRzY2z6WFw/+3i4FhfHyWRyLM0rv+R8gBAV
 f+ZhArWmddrDLEGwO959KDKXS/tw9FgzQTJ8td/XJpVlxlg9tR/kuIKU0NZONeNp6uXJ
 YEnv+grplVjq7afpoULvryt/2UF80/D3kfJCCgIDkfrCz1Pdcup8fEfD57g1BSmMhWCw
 RI3l/ICY4TkU4xZ0DFw2RPHJGJ4Q+gnvXE9lI0T+giWP1tDdSrcJ00xkuJccYnjvM9y1
 662eq7ZAgtu1LHheunsn3leeK6ELkwBVgabLvwFbsWSqxRH34SPB03zn2OZ67Hw+V4vp
 76nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pEGq9PrL7zbSXkhH6KswIJDAa4K0ZLmP28/6kqX8Rl8=;
 b=r4qvggQB0hHFEdIoqHW2mQluHGHawHF8nAvpYPuxoMuNDKNcSf5Ud+8xnFhw3bu3Ht
 1muFVHq7PobAGOEaZZbqOGVkLN2NKWqEJHavQ4Oz/ZblAqCWqiSv0sdd9fSqFcaDMFLJ
 POkjg4BEEyP+NGvljBVI08cEyLEht0DWZIApJgyMs0kSAC4+laUeQNrPls2IMhqfEtxO
 SlxDJs3gvDyA1cz3hNC00NkDinRSa4wA7v62yNORckttLHOdV6pN25Q1SRtoTJedmq4J
 BqtsH91HprXQ3aDI+SPRoUvF8B9QycsWmHNDotTjAs0fdrILt4SHUImGQ19teUMYXgVD
 L/mQ==
X-Gm-Message-State: AGi0PubfKKTh3L2rOliSrcLiobc3IsxLbZsnSGZWoIBpEkYXorIK3zmU
 l/s0Vu7SmhjzbIWplnjOjfjtOgKcrU0bk3iNMz4=
X-Google-Smtp-Source: APiQypLzAFa5zF3d2yfgxqOK3wSkkvc0Hku0Pq8UbpgbbhPDH2606QnnNlRC0xpBYS5kKNdpnCqSrXE0GiGIMNTSM6I=
X-Received: by 2002:a6b:8dc2:: with SMTP id
 p185mr21621429iod.138.1588000142317; 
 Mon, 27 Apr 2020 08:09:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200424164239.10723.58352.stgit@localhost.localdomain>
 <20200424165021.10723.14111.stgit@localhost.localdomain>
 <7ce2bcde-7466-2764-7248-36f67bb9b573@redhat.com>
In-Reply-To: <7ce2bcde-7466-2764-7248-36f67bb9b573@redhat.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Mon, 27 Apr 2020 08:08:51 -0700
Message-ID: <CAKgT0Uckr4uN=WCvGtp5GtXRZjfR+x1BR7L5b=RvnT7CHwtsMw@mail.gmail.com>
Subject: Re: [PATCH v22 QEMU 3/5] virtio-balloon: Replace free page hinting
 references to 'report' with 'hint'
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alexander.duyck@gmail.com; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::d42
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
Cc: virtio-dev@lists.oasis-open.org, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 27, 2020 at 1:15 AM David Hildenbrand <david@redhat.com> wrote:
>
> There is only one wrong comment remaining I think. Something like
>
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index a1d6fb52c8..1b2127c04c 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -554,8 +554,8 @@ static void virtio_balloon_free_page_stop(VirtIOBalloon *s)
>           */
>          qemu_mutex_lock(&s->free_page_lock);
>          /*
> -         * The guest hasn't done the reporting, so host sends a notification
> -         * to the guest to actively stop the reporting.
> +         * The guest isn't done with hinting, so the host sends a notification
> +         * to the guest to actively stop the hinting.

I'll probably tweak it slightly and drop the "with". So the comment will read:
        /*
         * The guest isn't done hinting, so host sends a notification
         * to the guest to actively stop the hinting.
         */

There is one other spot left which is support for migration. The name
for the VMStateDescription is
"virtio-balloon-device/free-page-report". I am assuming I cannot
rename that. Otherwise all other references to report on the balloon
interface refer to reporting errors from what I can tell.

