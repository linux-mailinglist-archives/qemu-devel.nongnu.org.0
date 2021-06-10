Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B273A3036
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 18:08:28 +0200 (CEST)
Received: from localhost ([::1]:48786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrNEJ-0005wo-7b
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 12:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrN8Z-0004xn-PT
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 12:02:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrN8W-0005tC-EW
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 12:02:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623340946;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=bwpy0f3Vb7Xczc5ryAb1tLzAQupZ/4KZfe0+zgqc2AE=;
 b=D4EtIM9iVCAmbKQtMIaJwApHrtq+JHK8qCml7Vu1h4yKBsMZ2Fyp7ueEDm5vZ02KTnm4Lv
 9/3Y1akyMxTp1uLyrcoKrYQ6fNXkJvCLISUSIQdt9Nh8zhMT4Ey+/0drHzron2pNVDhc+Z
 1eiSQx8zse0yWRIx1nMFQkM+dtkWBe8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-I2DJ-8zKO4awRqu3nbPK4Q-1; Thu, 10 Jun 2021 12:02:20 -0400
X-MC-Unique: I2DJ-8zKO4awRqu3nbPK4Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0EFE9126F;
 Thu, 10 Jun 2021 16:02:18 +0000 (UTC)
Received: from redhat.com (ovpn-112-190.ams2.redhat.com [10.36.112.190])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEE7B9CA0;
 Thu, 10 Jun 2021 16:02:17 +0000 (UTC)
Date: Thu, 10 Jun 2021 17:02:10 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kostiantyn Kostiuk <konstantin@daynix.com>
Subject: Re: [PATCH v2] qga-win: Free GMatchInfo properly
Message-ID: <YMI3gundDsLZq1lw@redhat.com>
References: <20210610155811.3313927-1-konstantin@daynix.com>
MIME-Version: 1.0
In-Reply-To: <20210610155811.3313927-1-konstantin@daynix.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 06:58:11PM +0300, Kostiantyn Kostiuk wrote:
> The g_regex_match function creates match_info even if it
> returns FALSE. So we should always call g_match_info_free.
> A better solution is using g_autoptr for match_info variable.
> 
> Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
> ---
>  qga/commands-win32.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index 300b87c859..785a5cc6b2 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -2494,7 +2494,7 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error **errp)
>              continue;
>          }
>          for (j = 0; hw_ids[j] != NULL; j++) {
> -            GMatchInfo *match_info;
> +            g_autoptr(GMatchInfo) match_info;

This should be initialized to NULL otherwise...

>              GuestDeviceIdPCI *id;
>              if (!g_regex_match(device_pci_re, hw_ids[j], 0, &match_info)) {
>                  continue;

this continue will trigger freeing of unintialized memory

Essentially all g_auto* variables should be init to NULL
at all times, even if it currently looks harmless.

> @@ -2511,7 +2511,6 @@ GuestDeviceInfoList *qmp_guest_get_devices(Error **errp)
>              id->vendor_id = g_ascii_strtoull(vendor_id, NULL, 16);
>              id->device_id = g_ascii_strtoull(device_id, NULL, 16);
>  
> -            g_match_info_free(match_info);
>              break;
>          }
>          if (skip) {

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


