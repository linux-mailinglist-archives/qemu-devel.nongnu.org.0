Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FD13DEF44
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 15:48:34 +0200 (CEST)
Received: from localhost ([::1]:57278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAumX-0005TD-AB
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 09:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mAulD-0004Pl-QR
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 09:47:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mAulC-0007z2-9N
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 09:47:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627998429;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pjnEbf8Q1dO0K5mqMdWOYQTFlU7UQBS2voiLYIe7zyw=;
 b=YWIqWgWSZiHkta7aIjzr7dXo9cTBN5SSXDyO/F0+eYfX90CtrvwBbWVJnfhTBZO8F7wjKz
 5M8D1R6DEs94I3MOzI72fEM+mc6gkZhd/ndQp8I9CUJ6V7wjRB3MM3L+CKH7b3ANx0iQRS
 so3BVD5UfqhUZw4RNsBTcVk9SRB4rZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-uEEN_J3KNvm2umkKHiB18Q-1; Tue, 03 Aug 2021 09:47:07 -0400
X-MC-Unique: uEEN_J3KNvm2umkKHiB18Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4456187D546;
 Tue,  3 Aug 2021 13:47:06 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A6815D6A8;
 Tue,  3 Aug 2021 13:47:05 +0000 (UTC)
Date: Tue, 3 Aug 2021 14:47:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>
Subject: Re: Status of stable release effort ?
Message-ID: <YQlI1AEFR2YkIThk@redhat.com>
References: <YP6K1a/ay16KeiAT@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YP6K1a/ay16KeiAT@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping, anyone ?

On Mon, Jul 26, 2021 at 11:13:41AM +0100, Daniel P. Berrangé wrote:
> We are currently in the final lead up to shipping the 6.1.0 release
> 
> AFAICT from git tags, the latest stable release was 5.0.1 in Sep 2020
> 
>    https://gitlab.com/qemu-project/qemu/-/tags
> 
> There have been many patches sent to qemu-stable each month e.g.
> 
>   https://lists.nongnu.org/archive/html/qemu-stable/2021-06/threads.html
> 
> but no 5.1.1, 5.2.1 or 6.0.1 releases IIUC
> 
> Is QEMU stable still an active effort that we need to CC patches to ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


