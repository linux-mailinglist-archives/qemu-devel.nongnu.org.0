Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C15983B7FEB
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 11:26:12 +0200 (CEST)
Received: from localhost ([::1]:32998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyWTz-0000Gi-Ql
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 05:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lyWSm-0007xb-AK
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 05:24:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lyWSk-0005Ew-Jn
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 05:24:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625045093;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vjx/AKIGXr7eGW4aCOlFuw9sEnIOKj9yaF9OjwlDNsM=;
 b=dOPhhLmk7GWrLKVt1foNDQQsn0AKsLqaTlyXGpKuFt6lmn4oYR6cGH240bBNVp8ortFp+g
 pxWOIW9VX00CGErbRb+WaqH68oiOeXV6R6oZU0DmT2VF41qht8o0ALT/h7Lb+QQFZ1HGWm
 HT5tmFgxyDwqocXfE0CsTpNYDyEFc4g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-h9w-_5uCO3-Dr2P0RBB45w-1; Wed, 30 Jun 2021 05:24:46 -0400
X-MC-Unique: h9w-_5uCO3-Dr2P0RBB45w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EE339126B
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 09:24:45 +0000 (UTC)
Received: from redhat.com (ovpn-114-116.ams2.redhat.com [10.36.114.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 685215D6AD;
 Wed, 30 Jun 2021 09:24:37 +0000 (UTC)
Date: Wed, 30 Jun 2021 10:24:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] ui: Mark the '-no-quit' option as deprecated
Message-ID: <YNw4UoWPkNaZhCYS@redhat.com>
References: <20210630092127.374720-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210630092127.374720-1-thuth@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 30, 2021 at 11:21:27AM +0200, Thomas Huth wrote:
> It's just a cumbersome wrapper around the -display ...,window_close=off
> parameter, so we should rather tell our users to use that instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/system/deprecated.rst | 6 ++++++
>  qemu-options.hx            | 5 +++--
>  softmmu/vl.c               | 2 ++
>  3 files changed, 11 insertions(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

libvirt does not use this option


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


