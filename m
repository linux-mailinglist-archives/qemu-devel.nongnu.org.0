Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9812B6A7D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 17:42:26 +0100 (CET)
Received: from localhost ([::1]:57964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf43l-0004GL-AS
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 11:42:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kf40o-0001Pl-3s
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:39:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kf40f-0002Ar-By
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:39:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605631150;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/QIBJE/hAe6+T7Ga5kxYI5JswgWPAtAcoyhbfbcKZ20=;
 b=DI1To9izn0BVKpUlLttGzF2VF6KhRrB4c5encnQi1RmWLpx6p4XlRTaqbwbmaHFF7xDtZe
 wq9Uf4B8PbGO20YXwk97QLEL4dCjyyk8RTrXTQsW/EaCWbt3rCnomBWw5L4KzulMJSY3ZI
 nuLTFSaop6A5ybD0Le/M7ZI4QDMDKPI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-uIZ0j_KBO7OWHoGDi4MqKw-1; Tue, 17 Nov 2020 11:39:04 -0500
X-MC-Unique: uIZ0j_KBO7OWHoGDi4MqKw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA43410866C6
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 16:38:48 +0000 (UTC)
Received: from redhat.com (ovpn-115-10.ams2.redhat.com [10.36.115.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7CD05C1CF;
 Tue, 17 Nov 2020 16:38:47 +0000 (UTC)
Date: Tue, 17 Nov 2020 16:38:45 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH for-5.2? 2/2] authz-simple: Check that 'identity'
 property is set
Message-ID: <20201117163845.GI135624@redhat.com>
References: <20201117163045.307451-1-kwolf@redhat.com>
 <20201117163045.307451-3-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201117163045.307451-3-kwolf@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 17, 2020 at 05:30:45PM +0100, Kevin Wolf wrote:
> If the 'identify' property is not set, we'll pass a NULL pointer to
> g_str_equal() and crash. Catch the error condition during the creation
> of the object.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  authz/simple.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


