Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEE33B2AB7
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 10:49:49 +0200 (CEST)
Received: from localhost ([::1]:55468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwL3U-0000sn-AG
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 04:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwL2V-0000Am-5U
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:48:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwL2S-0005px-SP
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:48:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624524523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lKASuV0VzY/bH0DeTNS0tceT3RA7LVTpwTHBsxX2S/s=;
 b=SOIsM6U49yq/mURtoacIEAFX8dda377vwTDCKHAnAuJGVnIOlEHSU1LJ+A7hRMqzYrakW9
 nx9ewjyl7dywVnyfqEmcCpnrW+woHlfK+uO5Ebas64vpvLv+CTQK8pI7LNlUIqnITnOJI9
 02/HviB68a2x6gpfod7nAa/Ixnqq/o4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-l9vm7Vh9MveRPenhBoupCw-1; Thu, 24 Jun 2021 04:48:39 -0400
X-MC-Unique: l9vm7Vh9MveRPenhBoupCw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88ED9804141;
 Thu, 24 Jun 2021 08:48:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F1F760C05;
 Thu, 24 Jun 2021 08:48:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B2D32180060E; Thu, 24 Jun 2021 10:48:36 +0200 (CEST)
Date: Thu, 24 Jun 2021 10:48:36 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Khor, Swee Aun" <swee.aun.khor@intel.com>
Subject: Re: [PATCH v3] ui/gtk: New -display gtk option
 'full-screen-on-monitor'.
Message-ID: <20210624084836.4hwtq7i2p2cwcg7z@sirius.home.kraxel.org>
References: <20210623082744.24421-1-swee.aun.khor@intel.com>
 <20210623123351.irmwdawwktbvkdsb@sirius.home.kraxel.org>
 <DM8PR11MB571751EF8FB44E601757843AAF079@DM8PR11MB5717.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM8PR11MB571751EF8FB44E601757843AAF079@DM8PR11MB5717.namprd11.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: "Romli, Khairul Anuar" <khairul.anuar.romli@intel.com>, "Mazlan,
 Hazwan Arif" <hazwan.arif.mazlan@intel.com>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 24, 2021 at 12:56:28AM +0000, Khor, Swee Aun wrote:
> Hi Gerd,
> I am able to compile the code without error with my v3 patch. I don't see my patch showing up in https://patchew.org/QEMU/ , is it due to this compilation error?
> 
> I tried to change from %ld -> %lld but I encountered compilation error this time. 
> 
> ../ui/gtk.c: In function 'gtk_display_init':
> ../ui/gtk.c:2300:25: error: format '%lld' expects argument of type 'long long int', but argument 2 has type 'int64_t' {aka 'long int'} [-Werror=format=]
>  2300 |             warn_report("Failed to enable full screen on monitor %lld. "
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ......
>  2303 |                         opts->u.gtk.full_screen_on_monitor, monitor_n);
>       |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                                    |
>       |                                    int64_t {aka long int}
> cc1: all warnings being treated as errors

stdint.h also has #defines for printing integers (PRI{x,d}{8,16,32,64}),
they make sure the correct format string is used.

PRId64 would be the one for int64_t

take care,
  Gerd


