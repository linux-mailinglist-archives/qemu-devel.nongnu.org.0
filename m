Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560F6175467
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 08:25:16 +0100 (CET)
Received: from localhost ([::1]:55808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8fRy-0000Ma-UC
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 02:25:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57967)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1j8fRF-0008P1-1S
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 02:24:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1j8fRD-0006hn-MY
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 02:24:28 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:20447
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1j8fRD-0006hb-Ix
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 02:24:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583133866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=14cGQQihjqjEj7cGsD3tcx03hCMjLikwXVUL3fEePN8=;
 b=g+WwQcyiNg72XYhFl6YQTfLSEyBlHSOLrRtjipoiX2rxjQ2Fd6MoZNmSa9W41KZGntOEHs
 rm+Aj6GMIzitxBUhEbxlNK0JzMN8zwV7jHv1/wxrqCp2fk7otQUSezrNwKrermpduV7/r2
 75M2rd2MUynDSn/oWLOGoj8MQoBBrec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-wwS1oodUP-mlvVleSYJrXA-1; Mon, 02 Mar 2020 02:24:24 -0500
X-MC-Unique: wwS1oodUP-mlvVleSYJrXA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CD508017DF;
 Mon,  2 Mar 2020 07:24:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D193D92D1B;
 Mon,  2 Mar 2020 07:24:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B0E1617506; Mon,  2 Mar 2020 08:24:21 +0100 (CET)
Date: Mon, 2 Mar 2020 08:24:21 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Anton V. Boyarshinov" <boyarsh@altlinux.org>
Subject: Re: [PATCH v2] Arithmetic error in EDID generation fixed
Message-ID: <20200302072421.5ku4axuy3mo4h4ac@sirius.home.kraxel.org>
References: <20200226122054.366b9cda@table.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200226122054.366b9cda@table.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: shaba@altlinux.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 26, 2020 at 03:20:54PM +0300, Anton V. Boyarshinov wrote:
> To calculate screen size in centimeters we should calculate:
> pixels/dpi*2.54
> but not
> pixels*dpi/2540
>=20
> Using wrong formula we actually get 65 DPI and very small fonts.

Added to vga patch queu.

thanks,
  Gerd


