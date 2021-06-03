Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82403399B66
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 09:20:21 +0200 (CEST)
Received: from localhost ([::1]:59088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loheO-00022p-Kk
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 03:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lohdQ-0001Mh-ED
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 03:19:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lohdO-00006H-VB
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 03:19:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622704758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MufRtWOsFu0e/NLwFY7IWXMEGA/DUhM+WhtEFGwBMaU=;
 b=bUQCL8jakd1qwub6Vgh1qJv86bT22U1zcOeFakn2nMA2lY3KR6Do3FTtRGe0x4rPtfzJSN
 04F3gG+/SCXZ97hO7NxZ2oBzJ5H8eYasS2S3rH/VS/NyIbZV3R1ZNM+enyOU6VfWvgGxL+
 S5/YR2CWx1bLdUxKkVLTRyEbx4LCGUg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-kxoim4yaOHe21s_nAkxzBA-1; Thu, 03 Jun 2021 03:19:16 -0400
X-MC-Unique: kxoim4yaOHe21s_nAkxzBA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A288180FD66;
 Thu,  3 Jun 2021 07:19:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4673010013D7;
 Thu,  3 Jun 2021 07:19:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D82BB18000B4; Thu,  3 Jun 2021 09:19:13 +0200 (CEST)
Date: Thu, 3 Jun 2021 09:19:13 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Brad Smith <brad@comstyle.com>
Subject: Re: [PATCH] tests/vm: update NetBSD to 9.2
Message-ID: <20210603071913.adshtxhd5bhqmutn@sirius.home.kraxel.org>
References: <YLe+LZ/j0pxVGeBi@humpty.home.comstyle.com>
MIME-Version: 1.0
In-Reply-To: <YLe+LZ/j0pxVGeBi@humpty.home.comstyle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Philippe =?utf-8?B?PT91bmtub3duLThiaXQ/UT9NYXRoaWV1LURhdWQ9QzM9QTk/?=
 =?utf-8?Q?=3D?= <philmd@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 02, 2021 at 01:21:49PM -0400, Brad Smith wrote:
> tests/vm: update NetBSD to 9.2
> 
> Signed-off-by: Brad Smith <brad@comstyle.com>

Tested-by: Gerd Hoffmann <kraxel@redhat.com>


