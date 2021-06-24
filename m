Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF38C3B2A55
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 10:29:15 +0200 (CEST)
Received: from localhost ([::1]:47708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwKja-0001Wx-CY
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 04:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwKip-0000sd-5i
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:28:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwKim-0005W6-78
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:28:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624523302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BC2ffQhKm7yOBHegSJa9aoWXacIKMaNnj5IVcm9fdnM=;
 b=emH3qsehilFlQg1JtKXtsaS0bSOJGo/5WazTVgBmrqwOVILCpOrCMCpbtrff1MstohErol
 2kn4PrhHO8Uw0nBagxg5k8vLc3yfoN81To+z20An2bl+Q77hG5jcse1SNlQ0zIa8eHOR5T
 2MfsTJArzUs1e1W3dd64iutKG/KO7Cs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-gLpqQlGmPc2AR77Swilwhg-1; Thu, 24 Jun 2021 04:28:18 -0400
X-MC-Unique: gLpqQlGmPc2AR77Swilwhg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81351C7401;
 Thu, 24 Jun 2021 08:28:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD5EF60C05;
 Thu, 24 Jun 2021 08:28:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3CF07180060E; Thu, 24 Jun 2021 10:28:12 +0200 (CEST)
Date: Thu, 24 Jun 2021 10:28:12 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [RFC v1 0/1] ui: Add a Wayland backend for Qemu UI
Message-ID: <20210624082812.kxgxdzayfnwr5q7q@sirius.home.kraxel.org>
References: <20210624041040.1250631-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210624041040.1250631-1-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Tina Zhang <tina.zhang@intel.com>, qemu-devel@nongnu.org,
 Dongwon Kim <dongwon.kim@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23, 2021 at 09:10:39PM -0700, Vivek Kasireddy wrote:
> Why does Qemu need a new Wayland UI backend?
> The main reason why there needs to be a plain and simple Wayland backend
> for Qemu UI is to eliminate the Blit (aka GPU copy) that happens if using
> a toolkit like GTK or SDL (because they use EGL). The Blit can be eliminated
> by sharing the dmabuf fd -- associated with the Guest scanout buffer --
> directly with the Host compositor via the linux-dmabuf (unstable) protocol.

Hmm, that probably means no window decorations (and other UI elements),
right?  Also the code seems to not (yet?) handle mouse and kbd input.

> The patch(es) are still WIP and the only reason why I am sending them now
> is to get feedback and see if anyone thinks this work is interesting. And,
> even after this work is complete, it is not meant to be merged and can be
> used for performance testing purposes. Given Qemu UI's new direction, the
> proper way to add new backends is to create a separate UI/display module
> that is part of the dbus/pipewire infrastructure that Marc-Andre is
> working on:
> https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg04331.html

Separating emulation and UI has the big advantage that the guest
lifecycle is decoupled from the desktop session lifecycle, i.e.
the guest can continue to run when the desktop session ends.

Works today with spice (when using unix socket to connect it can pass
dma-buf handles from qemu to spice client).

Using dbus instead certainly makes sense.  Whenever we'll just go send
dma-buf handles over dbus or integrate with pipewire for display/sound
not clear yet.  Marc-André thinks using pipewire doesn't bring benefits
and I havn't found the time yet to learn more about pipewire ...

take care,
  Gerd


