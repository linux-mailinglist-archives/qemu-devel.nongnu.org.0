Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E24B3A144B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 14:26:14 +0200 (CEST)
Received: from localhost ([::1]:49168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqxHh-0003eG-4v
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 08:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqxGf-0002wH-P2
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:25:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lqxGc-00059d-HK
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:25:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623241505;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xWV+7SMuOSv+d+ywb8tfbW9IWtcAh78V4ArkCEhZsUE=;
 b=EEyWZDl/Vg8XNA1D9oPLkjBykOAFDw6jpDIIbn+ZqrtrTNVi2UDZkMJ8K09i+QuqfCdiUP
 I37+309evn/DyhXdy0vRzomKxVRdkr5ysDbajyrxdI2RNprDXuc6vSdfRebdt1Hv0KnY2T
 /6uhSbGPeM3pKPPiuRhgFEmi+YSyU28=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-VaPm-XvUPn621ThBsA4-cg-1; Wed, 09 Jun 2021 08:25:04 -0400
X-MC-Unique: VaPm-XvUPn621ThBsA4-cg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BEF5802575;
 Wed,  9 Jun 2021 12:25:03 +0000 (UTC)
Received: from redhat.com (ovpn-115-127.ams2.redhat.com [10.36.115.127])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EDFC197F9;
 Wed,  9 Jun 2021 12:25:02 +0000 (UTC)
Date: Wed, 9 Jun 2021 13:24:59 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] vnc: avoid deprecation warnings for SASL on OS X
Message-ID: <YMCzG1J8QMrc+DC8@redhat.com>
References: <20210604120915.286195-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210604120915.286195-1-pbonzini@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 04, 2021 at 02:09:15PM +0200, Paolo Bonzini wrote:
> Apple has deprecated sasl.h functions in OS X 10.11.  Therefore,
> all files that use SASL API need to disable -Wdeprecated-declarations.
> Remove the only use that is outside vnc-auth-sasl.c and add the
> relevant #pragma GCC diagnostic there.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  ui/vnc-auth-sasl.c | 20 ++++++++++++++++++++
>  ui/vnc-auth-sasl.h |  1 +
>  ui/vnc.c           | 10 ++--------
>  3 files changed, 23 insertions(+), 8 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

This matches what I did in libvirt a while ago to keep it quiet on macOS


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


