Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BC6203DBC
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 19:22:31 +0200 (CEST)
Received: from localhost ([::1]:37444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnQ9N-0007ZL-R2
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 13:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jnQ87-0006aC-LD
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 13:21:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25091
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jnQ84-0005Q1-A3
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 13:21:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592846466;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cQ5JOGOvSs5qWcmNgXhWShSElknp+fWvzP2HprbSOOk=;
 b=RLiraeMmBPmuT1zt0jUiymqHedcCNZbXecT6QW5pOUX/n8yfgssTxrQf3hPKxbK+dH6wGQ
 LdbUJle27Gy8nPal7z5oLLOiG3bLjxDyRgXfcI1VXxXZoslGaJZ35JmGRPtKDsyxS55W3s
 KyFRedE0iA4q1rG1In6okyhpvcs2fdA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-gqVDv5ZoNW-klC0H5-TIrw-1; Mon, 22 Jun 2020 13:20:44 -0400
X-MC-Unique: gqVDv5ZoNW-klC0H5-TIrw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBA09835B42;
 Mon, 22 Jun 2020 17:20:42 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B31E35EE0E;
 Mon, 22 Jun 2020 17:20:39 +0000 (UTC)
Date: Mon, 22 Jun 2020 18:20:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v1 11/18] tests/vm: switch from optsparse to  argparse
Message-ID: <20200622172035.GM736373@redhat.com>
References: <20200622143204.12921-1-alex.bennee@linaro.org>
 <20200622143204.12921-12-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20200622143204.12921-12-alex.bennee@linaro.org>
User-Agent: Mutt/1.14.0 (2020-05-02)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 01:27:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: fam@euphon.net, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 cota@braap.org, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trivial typo in $SUBJECT  s/optsparse/optparse/

On Mon, Jun 22, 2020 at 03:31:57PM +0100, Alex Bennée wrote:
> optparse has been deprecated since version 3.2 and argparse is the
> blessed replacement. Take the opportunity to enhance our help output
> showing defaults when called.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/vm/basevm.py | 84 +++++++++++++++++++++++-----------------------
>  1 file changed, 42 insertions(+), 42 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


