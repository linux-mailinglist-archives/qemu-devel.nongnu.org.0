Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3301E3DF1
	for <lists+qemu-devel@lfdr.de>; Wed, 27 May 2020 11:48:08 +0200 (CEST)
Received: from localhost ([::1]:55428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdsfP-0007gr-Ro
	for lists+qemu-devel@lfdr.de; Wed, 27 May 2020 05:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jdse6-0006ov-Vl
 for qemu-devel@nongnu.org; Wed, 27 May 2020 05:46:46 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45136
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jdse6-0003MU-4n
 for qemu-devel@nongnu.org; Wed, 27 May 2020 05:46:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590572805;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aS3a3lLhZzb4rIJMlp0ZNEL+UgYEaQbyZcwv3XJn0LE=;
 b=DJHldZLbyXhs++wpWepIuNKjoweFpkj7ONzsULGdoJ4qmNhh9fL07R9bkdax9lgwy3Y4dv
 gEVq08qnsaqGCkAMXrIkDNEcBFBCmBqmRVRr0bINIc5twulpE7gTG45jvdrgEI1nm54+5h
 IWvwk1JIFoosVRuQBSAvSwHTE7OB08Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-awIoQ05FN_S_YxXmOMLIPA-1; Wed, 27 May 2020 05:46:43 -0400
X-MC-Unique: awIoQ05FN_S_YxXmOMLIPA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E9E2460;
 Wed, 27 May 2020 09:46:42 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2197974E86;
 Wed, 27 May 2020 09:46:40 +0000 (UTC)
Date: Wed, 27 May 2020 10:46:38 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alexey Krasikov <alex-krasikov@yandex-team.ru>
Subject: Re: [PATCH v4 3/3] test-crypto-secret: add 'secret_keyring' object
 tests.
Message-ID: <20200527094638.GG2665520@redhat.com>
References: <20200525111913.4274-1-alex-krasikov@yandex-team.ru>
 <20200525111913.4274-2-alex-krasikov@yandex-team.ru>
MIME-Version: 1.0
In-Reply-To: <20200525111913.4274-2-alex-krasikov@yandex-team.ru>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/27 01:25:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_EXCESS_BASE64=0.979, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org, yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 25, 2020 at 02:19:13PM +0300, Alexey Krasikov wrote:
> Add tests:
>   test_secret_keyring_good;
>   test_secret_keyring_revoked_key;
>   test_secret_keyring_expired_key;
>   test_secret_keyring_bad_serial_key;
>   test_secret_keyring_bad_key_access_right;
> 
> Added tests require libkeyutils. The absence of this library is not
> critical, because these tests will be skipped in this case.
> 
> Signed-off-by: Alexey Krasikov <alex-krasikov@yandex-team.ru>
> ---
>  configure                  |  24 ++++++
>  tests/Makefile.include     |   4 +
>  tests/test-crypto-secret.c | 158 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 186 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


