Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD5D3A68C4
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 16:13:59 +0200 (CEST)
Received: from localhost ([::1]:44610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsnLi-0000b3-4q
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 10:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lsnJS-0006if-BE
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:11:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lsnJQ-0005a5-RG
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:11:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623679896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=axlVjU8pY4ahInBDLrh7WiivmAp9sgip+qAdojmSJ+U=;
 b=IsJassmr1omsec1/j17MsYsvJiNJ+3V+hoF9dYvEo46W4U21KXJttjO3/2OqBchPaJZTSh
 H0pPRcuJDglL1S5KRY8Bz2fVejbAkMSzzBe/2HgYM5rOIxHl2RcMYoSM8nY4kYJvWnjiGE
 7cZdRO4IkfuZcy+AA9ZzYPAGX9ylqKA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-GXq1XVpiNLqEQad4FjD4oA-1; Mon, 14 Jun 2021 10:11:32 -0400
X-MC-Unique: GXq1XVpiNLqEQad4FjD4oA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4977805F0B;
 Mon, 14 Jun 2021 14:11:31 +0000 (UTC)
Received: from redhat.com (ovpn-113-14.phx2.redhat.com [10.3.113.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2046A60C0F;
 Mon, 14 Jun 2021 14:11:31 +0000 (UTC)
Date: Mon, 14 Jun 2021 09:11:29 -0500
From: Eric Blake <eblake@redhat.com>
To: sweeaun <swee.aun.khor@intel.com>
Subject: Re: [PATCH] ui/gtk: Allow user to select monitor number to display
 qemu in full screen through new gtk display option
Message-ID: <20210614141129.plffhclmdczft3g6@redhat.com>
References: <20210614080542.5905-1-swee.aun.khor@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210614080542.5905-1-swee.aun.khor@intel.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: khairul.anuar.romli@intel.com, qemu-devel@nongnu.org,
 vivek.kasireddy@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 14, 2021 at 04:05:42PM +0800, sweeaun wrote:
>  -display gtk,monitor-num=<value>
> 
> Signed-off-by: sweeaun <swee.aun.khor@intel.com>
> ---
>  qapi/ui.json    |  3 ++-
>  qemu-options.hx |  2 +-
>  ui/gtk.c        | 15 +++++++++++++++
>  3 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 1052ca9c38..c3363c7ad5 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1041,7 +1041,8 @@
>  ##
>  { 'struct'  : 'DisplayGTK',
>    'data'    : { '*grab-on-hover' : 'bool',
> -                '*zoom-to-fit'   : 'bool'  } }
> +                '*zoom-to-fit'   : 'bool',
> +		'*monitor-num' : 'int' } }

Missing documentation of the new member.  Also, get rid of the tab damage.


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


