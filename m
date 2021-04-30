Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0E336F9B3
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:01:23 +0200 (CEST)
Received: from localhost ([::1]:49458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRph-0000HF-W7
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:01:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcQpR-0000hF-0J
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:57:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcQpP-0004s0-9B
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:57:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619780218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hbhCUiDwVWC6nGjLVYOP+rkOerjYQNS1kEYi7+OI09A=;
 b=KJn9CL4uYcmMh/BQusYk8nHPlsx/f9DXjMKPAr+hXma1nL/ApUoRi/9mB9F4gcA+Ug3Hxa
 TqGgipSN2DUK6ztPHErFy7jJHgg6Z8meZD86gK12Zbp9fBx1ZXQRnnnDA8DhRJi/e9mBj0
 FA4gIG0dEwwxlBt4klnz6SPLD9zVSFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-zByWYXPpNaK9zz0wPK79mg-1; Fri, 30 Apr 2021 06:56:57 -0400
X-MC-Unique: zByWYXPpNaK9zz0wPK79mg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D302818B9ECC;
 Fri, 30 Apr 2021 10:56:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 53F715F707;
 Fri, 30 Apr 2021 10:56:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B0B051800380; Fri, 30 Apr 2021 12:56:50 +0200 (CEST)
Date: Fri, 30 Apr 2021 12:56:50 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Subject: Re: [RFC PATCH 00/27] Virtio sound card implementation
Message-ID: <20210430105650.k67lebhrtofm5vz2@sirius.home.kraxel.org>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

>     - The output from the sound card is accompanied by periodic
>       white noise. I do not know why this is happening. I tried
>       debugging it by writing the buffers to a new wav file and
>       sure enough the contents of the file were different at
>       some places, but I couldn't find what must be causing it.
>       (Relevant patches: #19, #20, #21 and #25.) What steps should
>       I take for debugging this?

Hmm, I'd try to simplify the code.  The two helper functions
virtio_snd_pcm_get_buf() + virtio_snd_pcm_handle_buf_written() look
rather complex to me.  I'd suggest to make them handle a single
virtqueue element only.  That should make the logic simpler.
The loop in virtio_snd_output_cb() will need to take a few more rounds
then, and virtio_snd_pcm_get_buf() would probably have to return the
number of bytes it actually placed in the buffer so you can pass on that
value to AUD_write().

For actual debugging I typically use trace points or temporary debug
printfs or a combination of both.  I'd suggest logging the buffer
handling, filling them from virt queue, writing to AUD, also log the
offset, maybe something goes wrong with partial writes.

>     - What is the suggested way of waiting? When the driver issues
>       the VIRTIO_SND_PCM_STOP ctrl command I want to wait for the
>       buffers existing in tx vq to be consumed before closing the
>       stream.

Store a pointer to the virtqueue element, then complete it when
virtio_snd_output_cb() processed all pending buffers.

take care,
  Gerd


