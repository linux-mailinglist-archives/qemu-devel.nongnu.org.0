Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D01B47B28C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 19:05:10 +0100 (CET)
Received: from localhost ([::1]:39278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzN25-000487-F6
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 13:05:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mzKmj-0006Bt-F6
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:41:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mzKmX-0008ER-5f
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:41:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640014852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ozb+XWYZZIKS1oBEOnuNnnE0LxArOZmGxy9FrCvCT5g=;
 b=PUP0Dc18qoiDaVeNgr3R/V9JFfeoDIqZukSNp9HDL2nl3C9jKZlGI+6jMvInmuLxXbWeeb
 l5c023ch+TluvdRUy6zXKqKHuVEABGqPdt7OlF24PcRNMg5QpHRGUMxDQahIWhIgsYkp6t
 4eA7tQE0KofngNXQt/z0R3KZ1WvWcko=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-wJyHoVsENm62zNfpy_NyxA-1; Mon, 20 Dec 2021 07:18:21 -0500
X-MC-Unique: wJyHoVsENm62zNfpy_NyxA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B75E081CCC4;
 Mon, 20 Dec 2021 12:18:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BBA994BA2;
 Mon, 20 Dec 2021 12:18:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 03E9F180063A; Mon, 20 Dec 2021 13:18:14 +0100 (CET)
Date: Mon, 20 Dec 2021 13:18:14 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Pratik Parvati <pratikp@vayavyalabs.com>
Subject: Re: Virtio-GPU Xres and Yres seettings
Message-ID: <20211220121814.rkg7z7rki22qpzhj@sirius.home.kraxel.org>
References: <CA+aXn+EZQ=S+P=8fyfCxYikEMLLdqAEeQgi580Tqtsuot-r2dw@mail.gmail.com>
 <aedfa17d-6d31-6d5d-b367-cf84e77d27ed@redhat.com>
 <20211220103548.lpgtad57woenpshi@sirius.home.kraxel.org>
 <CA+aXn+F1tPYMahODkE1qi_OM65zJ4ubHqcOi1drJWvC+PopiZQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+aXn+F1tPYMahODkE1qi_OM65zJ4ubHqcOi1drJWvC+PopiZQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Is it possible that EDID bytes are sent wrong to the driver (as a response
> to VIRTIO_GPU_CMD_GET_EDID command)?? - I am configuring these bytes the
> same way Qemu does.

EDID is optional, so you can try disable the EDID feature bit and see
what happens.

You can also check /sys/class/drm/card0-${output}/edid inside the
guest.

take care,
  Gerd


