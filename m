Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D90CE31CC64
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 15:50:55 +0100 (CET)
Received: from localhost ([::1]:35286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC1gk-0004rB-V2
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 09:50:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lC1er-00045A-SZ
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:48:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lC1eq-0004TV-EM
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:48:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613486934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kuQbVoFhAOysGmJQj8Y2P1cRxyqP+ywlJ14Hv+jWEMY=;
 b=a3Of5sUGr9rDfNYdOrtWT9bjTZvkcLoW4QVN5HjY+lE3iOXH8cJG7+V4JjaKwVjl5LkEC+
 oW6YWXXLv71JmBW+l80jW+zNhHRMFRb15zbef+uPp2uAD1k8O8rbOmk52jZH1kpyFvCiJX
 BAP76hnSwxmb20oqXkwW2m5xtlbOdnk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-2OCTvyuyPfWI2VIX_AhjUg-1; Tue, 16 Feb 2021 09:48:51 -0500
X-MC-Unique: 2OCTvyuyPfWI2VIX_AhjUg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 157DC1086326;
 Tue, 16 Feb 2021 14:48:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA81F779D6;
 Tue, 16 Feb 2021 14:48:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 33BB4180009A; Tue, 16 Feb 2021 15:48:31 +0100 (CET)
Date: Tue, 16 Feb 2021 15:48:31 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Howard Spoelstra <hsp.cat7@gmail.com>
Subject: Re: USB pass through into Mac OS 9.x with qemu-system-ppc
Message-ID: <20210216144831.cqefndfuvlju2yli@sirius.home.kraxel.org>
References: <CABLmASF7YP3qfcuhAQsm8J28e8omZstBf7E5Eir=8MyqnvPLRQ@mail.gmail.com>
 <20210209151221.dxiiydxgxsqu3gmu@sirius.home.kraxel.org>
 <CABLmASEG3FiJ--7bQzZVJ1DtdFJSZ=a41yAf1QgEBf8BoGZk_w@mail.gmail.com>
 <CABLmASGwcpbDe3Gaj5TV5zFmFEaDaeL1-M1AmvfehzD9U=_3iw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABLmASGwcpbDe3Gaj5TV5zFmFEaDaeL1-M1AmvfehzD9U=_3iw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Please find another pcap file attached. This one stems from an attempt
> to pass through a midi device when running qemu-system-ppc with Mac OS
> 9.2 in macOS host.

Ah, yes, I remember now.  Problem is that the usb stick is plugged into
a high-speed port (usb2) on the host but passed as full-speed device
(usb1) to the guest.  That works in some cases, but is not guaranteed
to work.  usb_host_speed_compat() tries to catch some of the
incompatible cases.  The usb-storage incompatibility slips through
because the incompatibility is specific to the mass storage protocol.
Specifically the wMaxPacketSize is 64 for usb1 and 512 for usb2.

Seems fedora deals better with the situation ...

take care,
  Gerd


