Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA29E482EF8
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 09:22:08 +0100 (CET)
Received: from localhost ([::1]:53008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4IbX-0001FL-EI
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 03:22:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n4IZA-000843-Dd
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 03:19:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n4IZ5-0004Wc-CP
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 03:19:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641197973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mi9SxPOD7tO9UwpFq42XQk84jfWxwL/HuWw0x56EjDY=;
 b=h6X/ISfDE9MKfB+9hNxBb5Lxu5E2Yw0Vpf0WpGIhIe0kczY07fO63BUEEzT/gvOi15maT5
 RFedzRY00qLWKYPqnT304c0y5lhgzlwh/5d4ZdLCvIeZEdHowPQauxiAya82K8aQwxNvHr
 GMBqZylt/1LEkTe0g+nt06WeikEln7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-17_QnUXANRyzTgom29NvHA-1; Mon, 03 Jan 2022 03:19:30 -0500
X-MC-Unique: 17_QnUXANRyzTgom29NvHA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D20C71023F4E;
 Mon,  3 Jan 2022 08:19:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72EF116A37;
 Mon,  3 Jan 2022 08:19:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AE08B180039F; Mon,  3 Jan 2022 09:19:26 +0100 (CET)
Date: Mon, 3 Jan 2022 09:19:26 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Hongren (Zenithal) Zheng" <i@zenithal.me>
Subject: Re: [PATCH 1/6] hw/usb: Add CanoKey Implementation
Message-ID: <20220103081926.xbsjrtw24z6gvnis@sirius.home.kraxel.org>
References: <YcSt+qozrl+J8ool@Sun>
 <YcSupUSXWDXOAkas@Sun>
MIME-Version: 1.0
In-Reply-To: <YcSupUSXWDXOAkas@Sun>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, contact@canokeys.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> +#ifdef DEBUG_CANOKEY
> +#define DPRINTF(fmt, ...) \
> +do { printf("canokey: " fmt "\n", ## __VA_ARGS__); } while (0)

Better use tracepoints instead (see docs/devel/tracing.rst).

> +int canokey_emu_transmit(
> +        void *base, uint8_t ep, const uint8_t *pbuf, uint16_t size)
> +{
> +    DPRINTF("transmit ep %d size %d", ep, size);
> +    DPRINTF_DATA(pbuf, size, "transmit");

Did you know all usb devices have a pcap property for writing out usb
packet traces?  i.e. use '-device canokey,pcap=test.pcap', then look
at the traces using wireshark.

take care,
  Gerd


