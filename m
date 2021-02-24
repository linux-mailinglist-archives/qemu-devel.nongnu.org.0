Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE34323BA4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 12:57:16 +0100 (CET)
Received: from localhost ([::1]:48286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEsn5-0005mK-Ni
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 06:57:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lEsls-0005HU-6n
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:56:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lEslm-0005I2-IW
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:55:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614167753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3BLgY0gHt0NoYLG0SGjikFDkSs7T3Q8E6/9Pb45nPeg=;
 b=UtKMAd44YTc1EMS0CAJ8Na9szgyjC6XbzZ8s960uU2XcGghMpeZkXOhLaC8KABIWo9XOHm
 BTgf4+4KZI/M6D5Lw00YKm227sgYZbHMGMdpyxpZO4nzLiDFPjDBCJDCadUX9aj1n4kwwu
 V9nJ7J2aMWFIfafgOZmRiTGhHiNXyII=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-zKuI3ZJxOZCcioxQ6DP5Bw-1; Wed, 24 Feb 2021 06:55:51 -0500
X-MC-Unique: zKuI3ZJxOZCcioxQ6DP5Bw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BCBB107ACC7;
 Wed, 24 Feb 2021 11:55:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-4.ams2.redhat.com
 [10.36.114.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0695460C5F;
 Wed, 24 Feb 2021 11:55:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 86B8D18000AE; Wed, 24 Feb 2021 12:55:48 +0100 (CET)
Date: Wed, 24 Feb 2021 12:55:48 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH] ui/cocoa: Do not rely on the first argument
Message-ID: <20210224115548.srqw45gmpkbgcvji@sirius.home.kraxel.org>
References: <20210223110640.73974-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210223110640.73974-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 23, 2021 at 08:06:40PM +0900, Akihiko Odaki wrote:
> The first argument of the executable was used to get its path, but it is
> not reliable because the executer can specify any arbitrary string. Use the
> interfaces provided by QEMU and the platform to get those paths.
> 
> This change also changes the icon shown in the "about" window to QEMU's
> cute one.

Looks good to me, but I'd like to have an additional macos review for
this one.

thanks,
  Gerd


