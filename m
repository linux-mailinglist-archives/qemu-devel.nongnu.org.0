Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 592753C9375
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 23:58:56 +0200 (CEST)
Received: from localhost ([::1]:60970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3mu7-00057g-FW
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 17:58:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m3msJ-0003Ha-VJ
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 17:57:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m3msI-0005jP-Hb
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 17:57:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626299822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VvvVi5feRUJ4gAbQJNNil4jAkpPKQYzdFqpJXDu4Lhg=;
 b=EiG5/xNs9RchvOuYxIHlayhIrEmX0Jb6vA3x9TWvigPSsX3jHy1z4D6hmBPJPLw/Hi/R88
 uo3Deli0NheFIBqWZIdSIuRUj35T4f+2f0ExVO0PtrEm48ABpAA/6O+aMouLuSgJW5fV/M
 wbmRXj6T/LhMjEeugl85IMas/Nc0h7Y=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-V24Gcm65N5WAtTaw895H5Q-1; Wed, 14 Jul 2021 17:57:00 -0400
X-MC-Unique: V24Gcm65N5WAtTaw895H5Q-1
Received: by mail-ua1-f70.google.com with SMTP id
 u20-20020ab021d40000b02902a181c33654so749513uan.17
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 14:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VvvVi5feRUJ4gAbQJNNil4jAkpPKQYzdFqpJXDu4Lhg=;
 b=ak4jlekKxtpQQlvK1GxFVNnMjuAcKWQikw9aeBsgLZc9v5nYZuI9lVLtgk0MzWBVit
 2vdmvO43XDuo58HXk+/t2gpDkDmm6AfCdLbCQ6BovdHeLUdSVU4JEpAIUYHp5HJ0n76k
 YrOkkulUtF5wGeeMVnnVmyJ/EBzVUmHXsz0YBR1PMH+Q2vJEC8IVo7iCjf3O0n9i6qPZ
 8eKXdQNrlQq1uGKTHdS/rNg9xVTD4KMMdxw1A9hoBDS48IGspmu0/ogRcH7O3BuZ0qPY
 wKf1MFo0PVxHbD5SzSt1h7ArwOZFsqHYbQbELXka7HtkqOBslQo6x3x/r96DNjB1etiI
 XYmA==
X-Gm-Message-State: AOAM532VAExD6O15sSPQgsjUnjKzsIwSN+CJvGyp8MAwyitRDYx6qe8A
 YOwPxQJUYG8HXNEfMr/fKvhR+l3LmXfYb2BSZTY/YPeo0WYWnqgK0yPm8Uskf6lK4UBdtgXAk0p
 NvM+grL/jJa/9csCdgmB5omhF+eAZ/nw=
X-Received: by 2002:a1f:ae4e:: with SMTP id x75mr574643vke.2.1626299820277;
 Wed, 14 Jul 2021 14:57:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOqFvPGsNBmBfehCQ/pBpVEhy5qeu/28tUxcl2QV9ZPou1oOIKEwTF3yCRaDlpm0n1iwJWGtoq08nXA3Q4TBo=
X-Received: by 2002:a1f:ae4e:: with SMTP id x75mr574635vke.2.1626299820112;
 Wed, 14 Jul 2021 14:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210714174051.28164-1-crosa@redhat.com>
 <20210714174051.28164-7-crosa@redhat.com>
In-Reply-To: <20210714174051.28164-7-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 14 Jul 2021 18:56:34 -0300
Message-ID: <CAKJDGDY_ra7eZbOWEqWbEjL1gJEg8sBqYf4rUOKt=6wWWHXF4A@mail.gmail.com>
Subject: Re: [PATCH 6/6] tests/acceptance/virtio-gpu.py: provide kernel and
 initrd hashes
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 14, 2021 at 2:41 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> By providing kernel and initrd hashes, the test guarantees the
> integrity of the images used and avoids the warnings set by
> fetch_asset() when hashes are lacking.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/virtio-gpu.py | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


