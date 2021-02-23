Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F27322F57
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 18:09:43 +0100 (CET)
Received: from localhost ([::1]:47872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEbBt-00020v-H1
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 12:09:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEbAf-0001RW-BI
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 12:08:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEbAc-0007BW-Fc
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 12:08:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614100100;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z9FF4iuZW1kd4y8kNDZHCrjOmMIHax4GzgZr5ULOZJY=;
 b=ABOF0DEPHO3iA1rHC4Y4mP8opZQatXTwiGc2UOaefAEj6Ehoex3zGd/XzFVX0owQ+YPtck
 ShpHfb/Cysi52KVkIsJaiAFtziD7k3StpkDycgqBzyRv0rQ87z+EoZ2hSzua2JOBkk2Cn0
 H6bM8NP8SPze4OH43jupL5Hx8SS42Is=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-YqB4fyPWMya7UKGXok8fiQ-1; Tue, 23 Feb 2021 12:08:07 -0500
X-MC-Unique: YqB4fyPWMya7UKGXok8fiQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE64618BE166;
 Tue, 23 Feb 2021 17:08:05 +0000 (UTC)
Received: from redhat.com (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CC625D9D7;
 Tue, 23 Feb 2021 17:08:02 +0000 (UTC)
Date: Tue, 23 Feb 2021 17:07:59 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 1/4] utils: Enhance testsuite for do_strtosz()
Message-ID: <YDU2b9P0DQsbAOM7@redhat.com>
References: <20210211204438.1184395-1-eblake@redhat.com>
 <20210211204438.1184395-2-eblake@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210211204438.1184395-2-eblake@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: vsementsov@virtuozzo.com, qemu-block@nongnu.org, rjones@redhat.com,
 tao3.xu@intel.com, armbru@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 02:44:35PM -0600, Eric Blake wrote:
> Enhance our testsuite coverage of do_strtosz() to cover some things we
> know that existing users want to continue working (hex bytes), as well
> as some things that accidentally work but shouldn't (hex fractions) or
> accidentally fail but that users want to work (64-bit precision on
> byte values).  This includes fixing a typo in the comment regarding
> our parsing near 2^64.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  tests/test-cutils.c | 154 ++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 143 insertions(+), 11 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


