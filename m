Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D49442A6E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 10:31:53 +0100 (CET)
Received: from localhost ([::1]:58812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhq92-0000N8-1p
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 05:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhq7q-000838-NH
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 05:30:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhq7o-0007Zu-BS
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 05:30:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635845435;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fF/SLwzPY1/t8LlMRbBPQ+dh8MspkcNCf743IOT+GHg=;
 b=JLoVMiMB2jJ4YeFjEArDvf+aVryD6cynUdP1RAVbQQuwWJKVX2AYgZ3tiMjncuqt1/+qbq
 ARkonAOAsYjCd9mgzrddTg7GWujJPrAQkiMyOVJwx2RuU4PlO7utJbAnUn3gSb8sG74/B8
 pzOgt+1zkGVFWnn4JG36p092PLaUp/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-Sdy49ygDNzOc8Rbw3IAbag-1; Tue, 02 Nov 2021 05:30:32 -0400
X-MC-Unique: Sdy49ygDNzOc8Rbw3IAbag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90F151006AA4;
 Tue,  2 Nov 2021 09:30:31 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8608460D30;
 Tue,  2 Nov 2021 09:30:30 +0000 (UTC)
Date: Tue, 2 Nov 2021 09:30:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v2] hmp: Add shortcut to stop command to match cont
Message-ID: <YYEFM6+vOHDeusfG@redhat.com>
References: <20211030095225.513D4748F48@zero.eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <20211030095225.513D4748F48@zero.eik.bme.hu>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
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
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Oct 30, 2021 at 11:49:37AM +0200, BALATON Zoltan wrote:
> Some commands such as quit or cont have one letter alternatives but
> stop is missing that. Add stop|s to match cont|c for consistency and
> convenience.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
> c2: Fixed typo in commit title
> 
>  hmp-commands.hx | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


