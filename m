Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E1AFB20D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Nov 2019 15:03:16 +0100 (CET)
Received: from localhost ([::1]:44936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUtEp-00012h-P4
	for lists+qemu-devel@lfdr.de; Wed, 13 Nov 2019 09:03:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47727)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1iUtDg-0000YG-IC
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 09:02:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1iUtDf-0003CC-DT
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 09:02:04 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59013
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1iUtDf-0003Be-9y
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 09:02:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573653722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IWgqOZpzIXNUIuj5jHlE5I+wPUPTUToEYIoLqAd+Hy0=;
 b=IJlEATv7Yo1GaXwcItDpvObQg6DnFrCGUY6fOPJfyxi63BedmEXU3yD/AF4xaHobK8GMdB
 fjKH24Dhwu7B544BUjZZ3WwsFxzSfaY5sRqUFR87hjj0drhZKMZQh7DuIWLDtV8ckXCW2V
 ZcVywNxxpPwSGqufRTIimmk4Y0ZvEtk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-CcvDs_x0OyeEtFKXelKPHw-1; Wed, 13 Nov 2019 09:01:01 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15C08800C77;
 Wed, 13 Nov 2019 14:01:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com
 [10.36.116.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D899F4D9E1;
 Wed, 13 Nov 2019 14:00:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0487511AAA; Wed, 13 Nov 2019 15:00:57 +0100 (CET)
Date: Wed, 13 Nov 2019 15:00:57 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [SeaBIOS] Re: [PATCH] ahci: zero-initialize port struct
Message-ID: <20191113140057.2ocwfa3rqqfkbg3r@sirius.home.kraxel.org>
References: <20191113091809.31365-1-kraxel@redhat.com>
 <84d3a1aa-bbb2-d831-0abc-fe1169f8a860@redhat.com>
MIME-Version: 1.0
In-Reply-To: <84d3a1aa-bbb2-d831-0abc-fe1169f8a860@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: CcvDs_x0OyeEtFKXelKPHw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>, seabios@seabios.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 13, 2019 at 10:35:03AM +0100, Laszlo Ersek wrote:
> On 11/13/19 10:18, Gerd Hoffmann wrote:
> > Specifically port->driver.lchs needs clearing, otherwise seabios will
>=20
> s/driver/drive/

> Reviewed-by: Laszlo Ersek <lersek@redhat.com>

Typo fixed & pushed.

thanks,
  Gerd


