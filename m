Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0112236B631
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 17:55:14 +0200 (CEST)
Received: from localhost ([::1]:45548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb3Zp-0004ZO-3R
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 11:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lb3YT-00042w-4L
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 11:53:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lb3YR-0002EC-Bl
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 11:53:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619452426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gj4OtxPORPl+eDgqUKBXvXRk9fKBvXBc0MEFYE8RXWc=;
 b=S0Xz2Sx6TVwzO+ty5Yd1w9QeS5GKLXLKBknPzbv85CxviXoLamKUTJVebNXgd8vkeF+nzz
 Rvuti+zbk5wWXGYuBQoSIFHbQk8ACPE3SoUgKu2toIkRA+4AR0fbFats12vM55Asd25fKc
 oYuGmh0ITLnx4ai8sOFWU0jWEyR8pls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-lXlpZl_vOjq3EAncrMTrAw-1; Mon, 26 Apr 2021 11:53:44 -0400
X-MC-Unique: lXlpZl_vOjq3EAncrMTrAw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7675019251A0;
 Mon, 26 Apr 2021 15:53:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F7076E400;
 Mon, 26 Apr 2021 15:53:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6F9DF1800863; Mon, 26 Apr 2021 17:53:41 +0200 (CEST)
Date: Mon, 26 Apr 2021 17:53:41 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: X on old (non-x86) Linux guests
Message-ID: <20210426155341.tcogyoc4ipobtajm@sirius.home.kraxel.org>
References: <YIaPdjz7PpvwVPP/@work-vm>
MIME-Version: 1.0
In-Reply-To: <YIaPdjz7PpvwVPP/@work-vm>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 26, 2021 at 11:01:26AM +0100, Dr. David Alan Gilbert wrote:
> Hi,
>   Over the weekend I got a Red Hat 6.x (not RHEL!) for Alpha booting
> under QEMU which was pretty neat.  But I failed to find a succesful
> combination to get X working; has anyone any suggestions?
> 
>   That distro was from around 2000; the challenge is since we don't have
> VESA on non-x86, we can't change mode that way, so generic XF86_SVGA
> doesn't want to play with any of the devices.

Well, one trick is to run the vgabios in x86emu.  This is what the xorg
vesa driver still does today on non-x86 archs (which includes x86_64).

I suspect Red Has 6.x is to old for that one though.  When was it
released exactly?  I would guess late 90-ies ...

If the vesa path fails the best bet would probably be a driver for the
cirrus.  There is a cirrusfb driver in the kernel which could be
combined with the fbdev xserver, not sure when cirrusfb was merged
and whenever redhat enabled the driver though.

Also not sure whenever there is an working xfree86 cirrus driver.

> I also tried the ati device, but the accelerated mach64 driver
> didn't recognise that ID.

The virtual ati cards are probably too new.

HTH,
  Gerd


