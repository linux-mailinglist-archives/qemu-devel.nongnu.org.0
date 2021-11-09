Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CF744B024
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 16:14:46 +0100 (CET)
Received: from localhost ([::1]:41572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkSph-0002Me-71
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 10:14:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mkSoY-0001ge-O5
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 10:13:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mkSoW-000315-Hl
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 10:13:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636470811;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NlWr+g4OuvdvSF9bja5q//tIG3uu4B5IQrv2WW1ANCA=;
 b=eH+DggADqE7O7uaKXe/KW9uI7aaAvjPgGqHlgGXAYuuGXeG7PAqw4RS+5WZhpNEs//ZkWK
 Q4iLe0bPRT7eoHwCfpdHbCRNgELxXApUjCWE4Vp+Uu0dFcl2F/u1rE9m2AmCtnFeNe7SdO
 XzPzCONIU++74yfcoZROsGHPLsDvQ7s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-gTAdS3f_One1K-3HjXtzNA-1; Tue, 09 Nov 2021 10:13:29 -0500
X-MC-Unique: gTAdS3f_One1K-3HjXtzNA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0339C1015DA1;
 Tue,  9 Nov 2021 15:13:29 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.190])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12A1719C79;
 Tue,  9 Nov 2021 15:13:09 +0000 (UTC)
Date: Tue, 9 Nov 2021 15:13:06 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] qapi: Belatedly mark unstable QMP parts with feature
 'unstable'
Message-ID: <YYqQAvJHqlYH2bAB@redhat.com>
References: <20211109145559.2122827-1-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211109145559.2122827-1-armbru@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Cc: philmd@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 09, 2021 at 03:55:59PM +0100, Markus Armbruster wrote:
> The work in merge commit e86e00a2493 lacks special feature flag
> 'unstable', because it raced with it.  Add it where it's missing.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/machine.json | 54 +++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 45 insertions(+), 9 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


