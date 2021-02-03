Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6A830D90E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 12:45:02 +0100 (CET)
Received: from localhost ([::1]:38012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Gaj-000725-5S
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 06:45:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7GUj-00087B-Kl
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 06:38:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7GUi-0007Oa-9I
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 06:38:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612352327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YzE+OBNHHlibT/RrpUXnXBdbpBmbZJJw03Dy753XRac=;
 b=HKwyGY1go519QbnwJUEBMoO6mQVai8pqiWPGg0nqBjrhTfqL8XdcswlU03/AXn0l9H8iJu
 /mLzBzcBDDpx5q1S+ujfl49BY2ymKkpWMFhMXuhkul0PI7qrQKuZ6lEaV0z4KUmCjUIDil
 dVHDkN1qKXt7Mjei5ZKx9I19cdA2sdg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-7E-111ZtPeqi9VWdtwi7pw-1; Wed, 03 Feb 2021 06:38:45 -0500
X-MC-Unique: 7E-111ZtPeqi9VWdtwi7pw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6E21801817
 for <qemu-devel@nongnu.org>; Wed,  3 Feb 2021 11:38:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CAA5710016F5;
 Wed,  3 Feb 2021 11:38:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2E2BA180063E; Wed,  3 Feb 2021 12:38:40 +0100 (CET)
Date: Wed, 3 Feb 2021 12:38:40 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 20/20] RFC: tests: add some virtio-gpu & vhost-user-gpu
 acceptance test
Message-ID: <20210203113840.5d5hwphdyicomel2@sirius.home.kraxel.org>
References: <20210202142625.609070-1-marcandre.lureau@redhat.com>
 <20210202142625.609070-21-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210202142625.609070-21-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 02, 2021 at 06:26:25PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> This will check virtio/vhost-user-vga & virgl are correctly initialized
> by the Linux kernel on an egl-headless display.
> 
> There are many other things that could be checked, but that's a start. I
> also don't know yet how to nicely skip on incompatible host &
> configurations.

You can annotate tests like this:

       @avocado.skipUnless(os.path.exists(pick_default_vug_bin()), "no vhost-user-gpu")
> +    def test_vhost_user_vga_virgl(self):

[ queued whole series + some other pending ui/vga bits, kicked CI, lets
  see how it is going.  I suspect I'll have to drop this patch though. ]

HTH,
  Gerd


