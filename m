Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B773317A0C6
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 09:03:58 +0100 (CET)
Received: from localhost ([::1]:44606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9lU5-00053T-6v
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 03:03:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42728)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1j9lSt-0004TF-Lw
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 03:02:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1j9lSs-0004vO-OO
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 03:02:43 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50260
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1j9lSs-0004uH-Hq
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 03:02:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583395361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pDbNmzevc5jkzEX6aGlnOJAjzyZUx69rGl0/8eRLR1c=;
 b=DAGYBgx6ounrKvtd2MC2uqAiDnymzqeiQy5DkKEJREUh3nCSzsxkf8CxWxIPYwTTGKkP9+
 rVY3wLH5P3etsf8eT1WEo6j/dA1h6FnKMe2/zvBPhQoB28M4az0yq0Yavt+TiHQ/wPiJty
 CcR4ODj1QlHuNGvghYLnbkqelcER+Jw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-TQ1kSj4pP7-6hsc_yRrcWA-1; Thu, 05 Mar 2020 03:02:39 -0500
X-MC-Unique: TQ1kSj4pP7-6hsc_yRrcWA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C23211005512;
 Thu,  5 Mar 2020 08:02:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60ED87A411;
 Thu,  5 Mar 2020 08:02:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 89B1A17449; Thu,  5 Mar 2020 09:02:37 +0100 (CET)
Date: Thu, 5 Mar 2020 09:02:37 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 3/6] hw/usb/quirks: Use smaller types to reduce .rodata
 by 10KiB
Message-ID: <20200305080237.j2a7waokxominirn@sirius.home.kraxel.org>
References: <20200304221807.25212-1-philmd@redhat.com>
 <20200304221807.25212-4-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200304221807.25212-4-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>  struct usb_device_id {
> -    int vendor_id;
> -    int product_id;
> -    int interface_class;
> -    int interface_subclass;
> -    int interface_protocol;
> +    int16_t vendor_id;
> +    int16_t product_id;
> +    int8_t interface_class;
> +    int8_t interface_subclass;
> +    int8_t interface_protocol;

I guess we should better use the uint variants here ...

cheers,
  Gerd


