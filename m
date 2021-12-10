Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA0047016A
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 14:19:03 +0100 (CET)
Received: from localhost ([::1]:48336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvfni-0005DL-7z
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 08:19:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mvfkp-0003jX-EF
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 08:16:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mvfkl-0006Ht-Qq
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 08:16:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639142157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KFrQxbKAvbcDcTUEo7J5lIR34LfnpFydB3joXoj6LH0=;
 b=ZKk5S2y/HSVfC3t0dYipRTUZdcOIwVf/denvunM6m1U4lNQJWcDvwQcgRU0w0ZtK0Y5lEo
 VVoQHjvfBf0p5eisbMU39yUkEdGcJvVRGPMEr13JIx7RSZUvbkbvcvCK1M18r6kkcyi4DV
 N+FuIrsbpgetfqVVUxxSqW4FSqWCyt0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-jttJWXxDMNWPvMHz0JPh0g-1; Fri, 10 Dec 2021 08:15:54 -0500
X-MC-Unique: jttJWXxDMNWPvMHz0JPh0g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A36C9192AB6D;
 Fri, 10 Dec 2021 13:15:53 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EBBDB100E125;
 Fri, 10 Dec 2021 13:15:48 +0000 (UTC)
Date: Fri, 10 Dec 2021 14:15:47 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 2/2] iotests/149: Skip on unsupported ciphers
Message-ID: <YbNTA+5QtRdqMHe3@redhat.com>
References: <20211117150159.41806-1-hreitz@redhat.com>
 <20211117150159.41806-3-hreitz@redhat.com>
 <1d499aa2-86bb-db1f-6379-88dc7d5ab356@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1d499aa2-86bb-db1f-6379-88dc7d5ab356@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.11.2021 um 16:05 hat Hanna Reitz geschrieben:
> On 17.11.21 16:01, Hanna Reitz wrote:
> > Whenever qemu-img or qemu-io report that some cipher is unsupported,
> > skip the whole test, because that is probably because qemu has been
> > configured with the gnutls crypto backend.
> > 
> > We could taylor the algorithm list to what gnutls supports, but this is
> > a test that is run rather rarely anyway (because it requires
> > password-less sudo), and so it seems better and easier to skip it.  When
> > this test is intentionally run to check LUKS compatibility, it seems
> > better not to limit the algorithms but keep the list extensive.
> > 
> > Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> > ---
> >   tests/qemu-iotests/149 | 23 ++++++++++++++++++-----
> >   1 file changed, 18 insertions(+), 5 deletions(-)
> > 
> > diff --git a/tests/qemu-iotests/149 b/tests/qemu-iotests/149
> > index 328fd05a4c..adcef86e88 100755
> > --- a/tests/qemu-iotests/149
> > +++ b/tests/qemu-iotests/149
> > @@ -230,6 +230,18 @@ def create_image(config, size_mb):
> >           fn.truncate(size_mb * 1024 * 1024)
> > +def check_cipher_support(output):
> > +    """Check the output of qemu-img or qemu-io for mention of the respective
> > +    cipher algorithm being unsupported, and if so, skip this test.
> > +    (Returns `output` for convenience.)"""
> > +
> > +    if 'Unsupported cipher algorithm' in output:
> > +        iotests.notrun('Unsupported cipher algorithm '
> > +                       f'{config.cipher}-{config.keylen}-{config.mode}; '
> 
> Oops.  Just when I sent this I realized that during refactoring (putting
> this code into its own function) I forgot to pass `config` as a parameter.
> 
> Didn’t notice that because...  It seems to work just fine despite `config`
> not being defined here?  Python will forever remain a black box for me...

This is an old thread by now, but I think that it works is just because
it's defined as a global variable ('for config in configs') before
calling this function.

Kevin


