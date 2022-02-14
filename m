Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B752E4B4C8F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 11:44:58 +0100 (CET)
Received: from localhost ([::1]:40878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJYqn-0000QU-S7
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 05:44:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nJYjy-0003t4-EP
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 05:37:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nJYjw-0000Up-2G
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 05:37:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644835065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aiKo1tLpG1OrAMIWsITZqn9wqDM1xRp4fsqW5I00Daw=;
 b=I52ORgoN8trhY2sQ75lXWuJY4CKo1c5j1kZ1mHazHAhyxUi173lHK4W6eqNDPOGYl3Ggm5
 iiB1rRi2PZ0Rdl02GhgZ4ilvTtKLWsjkor+Ql7XB8zCey2ev9FdVuswSiO+kHtTJMh1rkE
 gsNO/Q9E9lT4QQEmS4xg7zTWOTpxQ60=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-rDS_RRDOOpWikoJFBdoLlQ-1; Mon, 14 Feb 2022 05:37:42 -0500
X-MC-Unique: rDS_RRDOOpWikoJFBdoLlQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0822384B9A4;
 Mon, 14 Feb 2022 10:37:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 41A27108646F;
 Mon, 14 Feb 2022 10:37:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F15AB1800091; Mon, 14 Feb 2022 11:37:34 +0100 (CET)
Date: Mon, 14 Feb 2022 11:37:34 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Subject: Re: [RFC PATCH 01/25] virtio-snd: Add virtio sound header file
Message-ID: <20220214103734.ghsabqeqn4qgn7i5@sirius.home.kraxel.org>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
 <20220211221319.193404-2-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220211221319.193404-2-chouhan.shreyansh2702@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Feb 12, 2022 at 03:42:55AM +0530, Shreyansh Chouhan wrote:
> Added device configuration and common definitions to the header
> file.
> 
> Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
> ---
>  include/hw/virtio/virtio-snd.h | 97 ++++++++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 include/hw/virtio/virtio-snd.h
> 
> diff --git a/include/hw/virtio/virtio-snd.h b/include/hw/virtio/virtio-snd.h
> new file mode 100644
> index 0000000000..bbbf174c51
> --- /dev/null
> +++ b/include/hw/virtio/virtio-snd.h

We already have include/standard-headers/linux/virtio_snd.h (synced from
linux kernel), you can (and should) just use that.

take care,
  Gerd


