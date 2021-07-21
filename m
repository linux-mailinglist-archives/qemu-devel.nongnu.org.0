Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFC83D0CA4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 13:05:21 +0200 (CEST)
Received: from localhost ([::1]:36684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6A2R-0002nu-Ti
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 07:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m69wY-0005Jc-Q3
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:59:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m69wX-0002fS-Cw
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 06:59:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626865152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QBhIHh0+JknGf7E3HsVyQ1i9CAiXnLi0ARUkEyysw/k=;
 b=BxXCQEhznkJm1GyfhvuuhvNpVwEyMw7OJWpWRGpmbgcU1BAn8dlMswEMiEHL5386wbJnJG
 FfZZ753aDhJtnbSt7qZcdTrailD0kXYplX7AawMYTSZhmzdN15DnShmHlVqdhXO70NyFKh
 bMzdutdZbsAYXnmQRFX9hVduEFw+f+c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-RDfCVfTMOvimVuSSDa-wtw-1; Wed, 21 Jul 2021 06:59:11 -0400
X-MC-Unique: RDfCVfTMOvimVuSSDa-wtw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35B758026BB;
 Wed, 21 Jul 2021 10:59:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64A7F60FB8;
 Wed, 21 Jul 2021 10:59:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BCD0918000B2; Wed, 21 Jul 2021 12:59:06 +0200 (CEST)
Date: Wed, 21 Jul 2021 12:59:06 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Jose R. Ziviani" <jziviani@suse.de>
Subject: Re: [RFC 1/2] modules: Option to build native TCG with
 --enable-modules
Message-ID: <20210721105906.lhosqmzqbh5xdxvi@sirius.home.kraxel.org>
References: <20210629212819.24389-1-jziviani@suse.de>
 <20210629212819.24389-2-jziviani@suse.de>
MIME-Version: 1.0
In-Reply-To: <20210629212819.24389-2-jziviani@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 29, 2021 at 06:28:18PM -0300, Jose R. Ziviani wrote:
> Adds an option (--enable-tcg-builtin) to build TCG natively when
> --enable-modules argument is passed to the build system. It gives
> the opportunity to have the accelerator built-in and still take
> advantage of the new modular system.

I think we should not special-case tcg here.  Either allow setting =y
for all modules with all the consequences this has for maintainance and
testing, or leave things as-is.

See also recent discussions kicked by Claudio Fontana.

take care,
  Gerd

PS: just back from vacation, wading backwards through
    my mail backlog ...).


