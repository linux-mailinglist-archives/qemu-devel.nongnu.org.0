Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E68B333C97
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 13:25:51 +0100 (CET)
Received: from localhost ([::1]:39076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJxuQ-0004PL-7O
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 07:25:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJxsH-00038X-D0
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 07:23:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJxsF-0002Vc-Pe
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 07:23:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615379015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nDWaXVXmwoAVDZg8d6MGZ2X2ozS6QDS1VRXnhr1Vpjg=;
 b=MoQmquocFlEnsi8Ff327pa5uQFjQmcakdiAOoVhkXfABhAGkJBRkJ/P/Ha4G0WGz5Ih4xK
 zSBHYGK6UXjwLxdb9AY1ejVnMZlpFCqzYztHZjZxXqI5RrfBDi4bknFuWKbRDX0ewDQ9EM
 fyfOPxjnplJoMV66jS0Khd2QmkYvTkw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-QDbXz-WbOQWeZz3_HRTVEw-1; Wed, 10 Mar 2021 07:23:33 -0500
X-MC-Unique: QDbXz-WbOQWeZz3_HRTVEw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FE3980416E;
 Wed, 10 Mar 2021 12:23:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B4EF60C9C;
 Wed, 10 Mar 2021 12:23:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 844D018000AC; Wed, 10 Mar 2021 13:23:30 +0100 (CET)
Date: Wed, 10 Mar 2021 13:23:30 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH 1/2] ui/cocoa: Show QEMU icon in the about window
Message-ID: <20210310122330.efvcygvr7zshwsux@sirius.home.kraxel.org>
References: <20210309122226.23117-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210309122226.23117-1-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 09, 2021 at 09:22:25PM +0900, Akihiko Odaki wrote:
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>

Patch added to ui queue.

thanks,
  Gerd


