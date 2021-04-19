Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128213642B9
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 15:12:13 +0200 (CEST)
Received: from localhost ([::1]:52514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYThD-0003V7-So
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 09:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lYTg3-0002jY-Tj
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 09:11:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lYTg0-0001EL-Et
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 09:10:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618837855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FsUOY1RP2tWzVVH7yKC8RsisDY0W2sVCkziyB/AOtHU=;
 b=OeJUSXU1vpMaDpQWz6TR0aNM7DTsz+gqckfkmpfPwHkx6b0AZ83y6JNqtIGqKCR0Vd3E5c
 EX1bCQ8Hj/z5ePR2T80VjnwrfycQa3qInbrk94NU4TqCDou8lxhi+ggbgq8/9TOqShEMSc
 dFy2yXRQXBM9D0YqwVC9VTINhJ1ovQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-8n6Ab4QgNxmEZMJqUWOrPQ-1; Mon, 19 Apr 2021 09:10:53 -0400
X-MC-Unique: 8n6Ab4QgNxmEZMJqUWOrPQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 547DBCF987;
 Mon, 19 Apr 2021 13:10:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-178.ams2.redhat.com
 [10.36.112.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EF0859469;
 Mon, 19 Apr 2021 13:10:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 935541800383; Mon, 19 Apr 2021 15:10:50 +0200 (CEST)
Date: Mon, 19 Apr 2021 15:10:50 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Subject: Re: Fwd: VirtioSound device emulation implementation
Message-ID: <20210419131050.bltknubbkd4du6ti@sirius.home.kraxel.org>
References: <CAAQ-SiNRykBeMFRvjumJ1hbcT3vjuL2bcGU=RBLpksNJNGYm+Q@mail.gmail.com>
 <20210128112541.qjpve3qbjy46ofkk@sirius.home.kraxel.org>
 <CAAQ-SiOYkxRMw=OjnPb5tFD0aNb+ZQykLVfAjOGmwFa2Lzc26w@mail.gmail.com>
 <20210128163001.jjptft2t5fbdlvyn@sirius.home.kraxel.org>
 <CAAQ-SiOU5vkcVODOvBEf=PXzRDQbhzJC6ZU3wLpnRzhD58cuGg@mail.gmail.com>
 <CAAQ-SiMpZZ3yVCRjapCuResP38HFmtykFuLvpwH_23kEPg6v_w@mail.gmail.com>
 <20210215143934.sz6tdtoaaffkvla7@sirius.home.kraxel.org>
 <CAAQ-SiO_cTe3bQKDQ-tyeUU-DqTSf=1kRUcc+a=tktZb0ZhVog@mail.gmail.com>
 <20210416113252.km4w72vnruv6s2oi@sirius.home.kraxel.org>
 <CAAQ-SiOSw9u=yFrakjjjTvozpAW3nxhC+QeW7wswMSzSeZ_AVg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQ-SiOSw9u=yFrakjjjTvozpAW3nxhC+QeW7wswMSzSeZ_AVg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > AUD_write returns the number of bytes actually accepted.
> >
> > In case the audio backend consumed the complete buffer you can go ahead
> > as described.  Otherwise stop here and resume (try AUD_write() the
> > remaining data) when the callback is called again.
> >
> The callback that is supposed to write the buffers to HWVoiceOut has to
> do it such that it only writes the buffers for the streams that it was
> called by. The tx
> virtqueue is going to have buffers for all the streams. How do I handle
> this situation?

Well, maybe splitting the streams is a good job for the tx handler, i.e.
take the queue element out of the queue, check stream, stick into a
stream-specific buffer list.

The have the AUD_write callback check the stream buffer list.
instead of the virt queue.

Make sure you only complete the virtqueue elements after the buffers
have been passed to the qemu audiodev completely.

Yes, it is perfectly fine to process multiple virtqueue elements at the
same time, and out-of-order completion is fine too.

HTH,
  Gerd


