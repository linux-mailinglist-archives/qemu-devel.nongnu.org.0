Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E5C3B1A4A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 14:35:31 +0200 (CEST)
Received: from localhost ([::1]:38766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw26M-0000am-Qp
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 08:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lw24t-0007Kl-E6
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:33:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lw24r-0000ih-Ty
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:33:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624451637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AbTuVoCGRRDQGXtp95iBqCOTpjsOJB9JaPopdnCtA9I=;
 b=gX/vXMRcDwSb6jY85JL5ms3EVIj6ixrrnG8fj6/EFhJs5lNKB7VEDLnOxAfFRpT63jROi0
 zNI2fncklKjreSQW5bj2JT3x4GCjVGOKSd/MSV2qWWmmuE63oKjtiSxlvvKugqsyWsHmLu
 hj7wubDduJN/OEIBzVtUnGBaXoGus+8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-gMvy83S7MaOASyX3kEMYAw-1; Wed, 23 Jun 2021 08:33:54 -0400
X-MC-Unique: gMvy83S7MaOASyX3kEMYAw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEB8B9F92A;
 Wed, 23 Jun 2021 12:33:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A35C25D9C6;
 Wed, 23 Jun 2021 12:33:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 21F57180060E; Wed, 23 Jun 2021 14:33:51 +0200 (CEST)
Date: Wed, 23 Jun 2021 14:33:51 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Khor, Swee Aun" <swee.aun.khor@intel.com>
Subject: Re: [PATCH v3] ui/gtk: New -display gtk option
 'full-screen-on-monitor'.
Message-ID: <20210623123351.irmwdawwktbvkdsb@sirius.home.kraxel.org>
References: <20210623082744.24421-1-swee.aun.khor@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210623082744.24421-1-swee.aun.khor@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
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
Cc: khairul.anuar.romli@intel.com, Hazwan.Arif.Mazlan@intel.com,
 vivek.kasireddy@intel.com, Khor@sirius.home.kraxel.org, qemu-devel@nongnu.org,
 eblake@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23, 2021 at 04:27:44PM +0800, Khor, Swee Aun wrote:
> This lets user select monitor number to display QEMU in full screen
> with -display gtk,full-screen-on-monitor=<value>.

../../ui/gtk.c: In function 'gtk_display_init':
../../ui/gtk.c:2300:25: error: format '%ld' expects argument of type 'long int', but argument 2 has type 'int64_t' {aka 'long long int'} [-Werror=format=]
 2300 |             warn_report("Failed to enable full screen on monitor %ld. "
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
......
 2303 |                         opts->u.gtk.full_screen_on_monitor, monitor_n);
      |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                    |
      |                                    int64_t {aka long long int}

take care,
  Gerd


