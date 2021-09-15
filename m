Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC78A40C2A9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 11:17:30 +0200 (CEST)
Received: from localhost ([::1]:57402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQR2n-0004Su-Ub
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 05:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQQwF-0006fz-SW
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 05:10:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQQwD-0001yK-DG
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 05:10:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631697040;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=SNL8vT3gmxSYSk5LDHcRfZFEnCsHh2J7DN6hG0hv0F8=;
 b=WW1mjSyRWQ19LEdE8kQvOA6b3hRBp/sn1g2yU7KecrKLyJDYE/KvSci2E8yrQ8S67c1SMz
 ZJ0F4Fn5Av/l8sXcqxaQbbMQGAwK1pX3hB8khyDTsuvNA0z7khWWU/cLl6vr+Ac8LQFooA
 m7usQFE0F7djQ1NIgjL2Dd8R+dttMKI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-h-sYY_3mNduSIIPNAmKIbg-1; Wed, 15 Sep 2021 05:10:38 -0400
X-MC-Unique: h-sYY_3mNduSIIPNAmKIbg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0446B10846A3;
 Wed, 15 Sep 2021 09:10:38 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A0081981F;
 Wed, 15 Sep 2021 09:10:36 +0000 (UTC)
Date: Wed, 15 Sep 2021 10:10:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 0/1] Update check-python-tox test for pylint 2.10
Message-ID: <YUG4iuTaFK0Krje6@redhat.com>
References: <20210915053011.293335-1-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210915053011.293335-1-jsnow@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: G S Niteesh Babu <niteesh.gs@gmail.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 15, 2021 at 01:30:10AM -0400, John Snow wrote:
> V2: It's not safe to use sys.stderr.encoding to determine a "console
> encoding", because that uses the "current" stderr and not a
> hypothetically generic one -- and doing this causes the acceptance tests
> to fail.
> 
> Use UTF-8 instead.
> 
> Question: What encoding do terminal programs use? Is there an inherent
> encoding to fprintf et al, or does it just push whatever bytes you put
> into it straight into the stdout/stderr pipe?

Programs are expected to output data in the encoding that is set in
the various env variables LC_ALL/LC_CTYPE/LANG.

In traditional end user scenarios this almost always means UTF-8 charset.

There's plenty of cases which end up with the C locale though, which
would mean 7-bit ASCII on Linux, though apps are supposed to be 8-bit
clean allow data with the high bit to pass through without interpretation.
The latter is what python3 gets very wrong complaining if you output
8-bit high data in C locale.

There is increasing support for a C.UTF-8 locale to bring it closer to
other locales which are all UTF-8.

On macOS the C locale has been UTF-8 by default indefinitely.

Windows is a whole other world of fun and IIRC isn't UTF-8 by default,
but I don't recall details.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


