Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A32773321EB
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 10:27:30 +0100 (CET)
Received: from localhost ([::1]:56372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJYeH-0001tV-Nb
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 04:27:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJYcT-0000t8-ER
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:25:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lJYcO-0002dd-1J
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:25:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615281930;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PQf/TJubEbbNxS7ZUk7Y2XZWhibBWtn+woWCFhso8QA=;
 b=ZAyG6CcL7gT7oj+YzOtp2luVykj0nEuHpIoa7JArPobL90Y0AEcoXHvIwaWGGCOce2J0VM
 UA1gAytpm40b/udG3u+481z8llUZKv3KzMKuruexTLEkJHTnUBxYIO3aOMTK+zJLZfJo+0
 ByyKlhHUHXiDdBI5vNt9BZtVIcSJoi8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-L4imUj7TNiqg1AR_KrDH5Q-1; Tue, 09 Mar 2021 04:25:28 -0500
X-MC-Unique: L4imUj7TNiqg1AR_KrDH5Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCD801005D4E;
 Tue,  9 Mar 2021 09:25:27 +0000 (UTC)
Received: from redhat.com (ovpn-114-154.ams2.redhat.com [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A2FC47093E;
 Tue,  9 Mar 2021 09:25:26 +0000 (UTC)
Date: Tue, 9 Mar 2021 09:25:23 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Warner Losh <imp@bsdimp.com>
Subject: Re: [PATCH v3] bsd-user: Add new maintainers
Message-ID: <YEc/Ay70qys/CIF0@redhat.com>
References: <20210308224023.75187-1-imp@bsdimp.com>
MIME-Version: 1.0
In-Reply-To: <20210308224023.75187-1-imp@bsdimp.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 08, 2021 at 03:40:23PM -0700, Warner Losh wrote:
> The FreeBSD project has a number of enhancements to bsd-user. These changes have
> evolved over the past 10 year, and aren't currently updated to the latest
> version of qemu due to fluxuations in staffing causing us to fall behind in the
> past. We're working on porting all the changes forward and contributing all the
> changes back to qemu. Add myself as maintainer and Kyle Evans as a reviewer for
> changes. In addition, add a pointer to our github repo in the interim while this
> work is ongoing.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


