Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE0438A8DA
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 12:53:54 +0200 (CEST)
Received: from localhost ([::1]:43444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljgJN-0002fl-R3
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 06:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ljgHx-0000iz-AU
 for qemu-devel@nongnu.org; Thu, 20 May 2021 06:52:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ljgHu-00024x-3L
 for qemu-devel@nongnu.org; Thu, 20 May 2021 06:52:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621507940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4rsMuYXwBX1DLQsGFKi5dRsbVcQ4cyrOyvtjKTOAcaw=;
 b=Mcp7cdpN5fFDhJC1AiYba9x9f91dDCGPfLKfcdauDD/owMRg9Iyt6nLFYq2ZojIEWIrMKa
 HmCTENsBf64hjG2dIqKhYTzP6NzsYgXRzboDEgZ2GzoVshUpOvl75NhY+UfhK15E28KGto
 V9fYPznw7yWTfFzznmUgOtLvb/CSXps=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-JonrXUj6MDyXMKHWQ9hBPg-1; Thu, 20 May 2021 06:52:17 -0400
X-MC-Unique: JonrXUj6MDyXMKHWQ9hBPg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95776100CA83;
 Thu, 20 May 2021 10:52:04 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-166.ams2.redhat.com
 [10.36.113.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E29F66E70E;
 Thu, 20 May 2021 10:52:02 +0000 (UTC)
Date: Thu, 20 May 2021 12:52:00 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/virtio: Have virtio_bus_get_vdev_bad_features()
 return 64-bit value
Message-ID: <20210520125200.4eec8e25.cohuck@redhat.com>
In-Reply-To: <20210520102822.2471710-1-philmd@redhat.com>
References: <20210520102822.2471710-1-philmd@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Frederic Konrad <konrad@adacore.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 20 May 2021 12:28:22 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> In commit 019a3edbb25 ("virtio: make features 64bit wide") we
> increased the 'features' field to 64-bit, but forgot to update
> the virtio_bus_get_vdev_bad_features() helper. The 'bad features'
> are truncated to 32-bit. The virtio_net_bad_features() handler
> from the virtio-net devices is potentially affected.
>=20
> Have the virtio_bus_get_vdev_bad_features() helper return the
> full 64-bit value.
>=20
> Cc: qemu-stable@nongnu.org
> Fixes: 019a3edbb25 ("virtio: make features 64bit wide")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/hw/virtio/virtio-bus.h | 2 +-
>  hw/virtio/virtio-bus.c         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


