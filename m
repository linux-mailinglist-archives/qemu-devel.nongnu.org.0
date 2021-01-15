Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C79B92F7846
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 13:04:57 +0100 (CET)
Received: from localhost ([::1]:41292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Nqa-0007Du-Tm
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 07:04:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l0Nou-0006hk-AX
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 07:03:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l0Nos-00025J-Po
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 07:03:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610712190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nQdoHogxaotb9iXlW/XcYgkF+lAKvIrWaQQCiXA13uQ=;
 b=b+FumwkD/sizZC5EjwX8If6R/fd32HcbzyE2ck9huMYjZtcvPV6tkqq9VUfjP4bHoByoEm
 fIUS9RsWfBqMwrNExS6L3IqhVBabhFxs8vlwrD6QV60s7CVEEX+qUw42JQoFZnC94vCPRg
 sjXd1kZIIvm/5BNS9wviTLaDJFDxeNo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-4Zzj92tbOZursbdgxrzJQg-1; Fri, 15 Jan 2021 07:03:06 -0500
X-MC-Unique: 4Zzj92tbOZursbdgxrzJQg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64A2E879500;
 Fri, 15 Jan 2021 12:03:05 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-144.ams2.redhat.com
 [10.36.114.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D075614F5;
 Fri, 15 Jan 2021 12:03:04 +0000 (UTC)
Subject: Re: [PATCH v3 11/10] iotests: add flake8 linter
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210114170304.87507-1-mreitz@redhat.com>
 <20210115115316.24633-1-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <461d224e-6527-851e-c995-3cb9e2545f41@redhat.com>
Date: Fri, 15 Jan 2021 13:03:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210115115316.24633-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.01.21 12:53, Vladimir Sementsov-Ogievskiy wrote:
> pylint is good, but doesn't cover the PEP8. Let's add flake8, to be
> sure that our code sutisfy PEP8. Add new linter and fix some code style
> in checked files.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 
> Hi!
> 
> Here is my small addition to Max's series, hope you like it!
> 
> Note, that this is not the first occurrence of 'flake8' in Qemu:
> 
>      # git grep flake8
>      python/qemu/.flake8:[flake8]
>      scripts/qapi/.flake8:[flake8]
>      scripts/qapi/.flake8:extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
> 
> 
>   tests/qemu-iotests/129        |  6 ++-
>   tests/qemu-iotests/254        |  2 +-
>   tests/qemu-iotests/297        | 21 ++++++---
>   tests/qemu-iotests/297.out    |  1 +
>   tests/qemu-iotests/300        |  4 +-
>   tests/qemu-iotests/iotests.py | 88 +++++++++++++++++++++++++++++++++--
>   6 files changed, 106 insertions(+), 16 deletions(-)

Looks reasonable to me, but perhaps it should just be a dedicated 
series.  I think there’s enough in here to justify that.

> diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
> index 201d9e0a0b..28e6666c1d 100755
> --- a/tests/qemu-iotests/129
> +++ b/tests/qemu-iotests/129
> @@ -21,6 +21,7 @@
>   import os
>   import iotests
>   
> +
>   class TestStopWithBlockJob(iotests.QMPTestCase):
>       test_img = os.path.join(iotests.test_dir, 'test.img')
>       target_img = os.path.join(iotests.test_dir, 'target.img')
> @@ -39,8 +40,8 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
>           source_drive = 'driver=throttle,' \
>                          'node-name=source,' \
>                          'throttle-group=tg0,' \
> -                      f'file.driver={iotests.imgfmt},' \
> -                      f'file.file.filename={self.test_img}'
> +                       f'file.driver={iotests.imgfmt},' \
> +                       f'file.file.filename={self.test_img}'

Interesting, when indenting this, I was wondering whether pylint would 
complain.  I was so glad it didn’t.  I really don’t like PEP8.

(Though I understand that style guides like PEP8 are there specifically 
so when someone like me goes “but I like this style better :(”, everyone 
else can say “but you’re objectively wrong”.  So me hating it kind of is 
its point, I guess.)

Max


