Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 097EE30C2CD
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 16:03:38 +0100 (CET)
Received: from localhost ([::1]:46800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6xDM-0002AT-W4
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 10:03:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6wsA-0000zZ-4k
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:41:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6ws5-0000wA-AG
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612276896;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tVKp+NYmZRUWUDowV6Rv75Vs8jdyFYVE2iAMtCnLEsA=;
 b=Jyl9ZAHWEC/JXJ3HvY416dPbEUmi5fZ1Z+1/4y5++yTBr/X/Xlu7hbMrRfg4mDUVgWe6/Q
 xxWDTQ4kjyGB3Asoxw5IK7E6Gw4C/k5VLPtWWKNOhugQOAxqZwohmo+TAZgSwHDoLqhu37
 As3E0AdrtFuvsJG4gM5XI1YzKHarLHk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-KWF3m6ZfMFG0PwKMWnJurA-1; Tue, 02 Feb 2021 09:41:27 -0500
X-MC-Unique: KWF3m6ZfMFG0PwKMWnJurA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A180F5708B;
 Tue,  2 Feb 2021 14:41:25 +0000 (UTC)
Received: from redhat.com (ovpn-112-202.ams2.redhat.com [10.36.112.202])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B8F75D9D5;
 Tue,  2 Feb 2021 14:41:23 +0000 (UTC)
Date: Tue, 2 Feb 2021 14:41:21 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] iotests: Revert emulator selection to old behaviour
Message-ID: <20210202144121.GL4168502@redhat.com>
References: <20210202142802.119999-1-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210202142802.119999-1-kwolf@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 02, 2021 at 03:28:02PM +0100, Kevin Wolf wrote:
> If the qemu-system-{arch} binary for the host architecture can't be
> found, the old 'check' implementation selected the alphabetically first
> system emulator binary that it could find. The new Python implementation
> just uses the first result of glob.iglob(), which has an undefined
> order.
> 
> This is a problem that breaks CI because the iotests aren't actually
> prepared to run on any emulator. They should be, so this is really a bug
> in the failing test cases that should be fixed there, but as a quick
> fix, let's revert to the old behaviour to let CI runs succeed again.

Deterministic CI is critically important.

> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  tests/qemu-iotests/testenv.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


> 
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> index b31275f518..1fbec854c1 100644
> --- a/tests/qemu-iotests/testenv.py
> +++ b/tests/qemu-iotests/testenv.py
> @@ -135,7 +135,7 @@ class TestEnv(ContextManager['TestEnv']):
>          if not os.path.exists(self.qemu_prog):
>              pattern = root('qemu-system-*')
>              try:
> -                progs = glob.iglob(pattern)
> +                progs = sorted(glob.iglob(pattern))
>                  self.qemu_prog = next(p for p in progs if isxfile(p))
>              except StopIteration:
>                  sys.exit("Not found any Qemu executable binary by pattern "
> -- 
> 2.29.2
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


