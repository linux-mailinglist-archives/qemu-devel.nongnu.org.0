Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6434CDBC1
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 19:05:15 +0100 (CET)
Received: from localhost ([::1]:58728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQCIl-0000eA-1n
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 13:05:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQC3J-0000Cs-Hx
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 12:49:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQC3G-00076B-Oi
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 12:49:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646416154;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IIR+EHUfjlJ3CewHHYFTZ4EXsj5knicnfIp15VRf/8w=;
 b=Ih1dG26yCOvn2eFx6AX9Y93jAAd1tZdcXFCKgrsgbLAx2cSHdyQZfkZMcIEaxadzlH9sxq
 hD9tkwq18L9dLgCFf4STNlgLKxzUylLZCU4wgzoRvt7KTPFQoD/4Z/UmZHyghosNaunoYL
 C9F5Wqm2zDJi/yfwS9mMw/UP2R9yQuc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-cA07z0vXO3GQ257w7OvcLQ-1; Fri, 04 Mar 2022 12:49:08 -0500
X-MC-Unique: cA07z0vXO3GQ257w7OvcLQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14C241800D50;
 Fri,  4 Mar 2022 17:49:07 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 53B571037F23;
 Fri,  4 Mar 2022 17:49:00 +0000 (UTC)
Date: Fri, 4 Mar 2022 17:48:57 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 02/10] python/aqmp: rename 'accept()' to
 'start_server_and_accept()'
Message-ID: <YiJRCfec7jRXBekv@redhat.com>
References: <20220225205948.3693480-1-jsnow@redhat.com>
 <20220225205948.3693480-3-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220225205948.3693480-3-jsnow@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 03:59:40PM -0500, John Snow wrote:
> Previously, I had a method named "accept()" that under-the-hood calls
> bind(2), listen(2) *and* accept(2). I meant this as a simplification and
> counterpart to the one-shot "connect()" method.
> 
> This is confusing to readers who expect accept() to mean *just*
> accept(2). Since I need to split apart the "accept()" method into
> multiple methods anyway (one of which strongly resembling accept(2)), it
> feels pertinent to rename this method *now*.
> 
> Rename this all-in-one method "start_server_and_accept()" instead.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/aqmp/legacy.py   |  2 +-
>  python/qemu/aqmp/protocol.py |  6 ++++--
>  python/tests/protocol.py     | 24 ++++++++++++------------
>  3 files changed, 17 insertions(+), 15 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


