Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A71F542A32A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:24:37 +0200 (CEST)
Received: from localhost ([::1]:51886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maFtc-00036f-JA
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1maFdX-0008TJ-MR
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:08:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1maFdT-0004ip-1g
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 07:07:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634036874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Or5Q8qE+bOHHzfwa+m49sI1yu4yoI4FG8A9qSf5CW1g=;
 b=EvsfSGqlMG/njUtTmTGlrO1RqUhHT209AEKAFUP0BmjeUyWDgMFhIgBV5bjoey0qjJyzxa
 jDyN+R/pUPbbjzeahGuNbN8+cS25SzWshICn7M6gkkbrrKq29CTKaKeZtEaR0zM1j8FjcA
 dWjHdKl4d38jFuhGOg0qMPUovaAvpBY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-S1X2ZGcaOkW4Hn8GzgfEkg-1; Tue, 12 Oct 2021 07:07:53 -0400
X-MC-Unique: S1X2ZGcaOkW4Hn8GzgfEkg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4110F1927803;
 Tue, 12 Oct 2021 11:07:52 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.219])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C4760707B6;
 Tue, 12 Oct 2021 11:07:50 +0000 (UTC)
Date: Tue, 12 Oct 2021 13:07:49 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] qapi: Improve input_type_enum()'s error message
Message-ID: <YWVsheOBwyx+3QOM@redhat.com>
References: <20211011131558.3273255-1-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211011131558.3273255-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, michael.roth@amd.com,
 qemu-devel@nongnu.org, hreitz@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.10.2021 um 15:15 hat Markus Armbruster geschrieben:
> The error message claims the parameter is invalid:
> 
>     $ qemu-system-x86_64 -object qom-type=nonexistent
>     qemu-system-x86_64: -object qom-type=nonexistent: Invalid parameter 'nonexistent'
> 
> What's wrong is actually the *value* 'nonexistent'.  Improve the
> message to
> 
>     qemu-system-x86_64: -object qom-type=nonexistent: Parameter 'qom-type' does not accept value 'nonexistent'
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/qapi-visit-core.c          | 3 ++-
>  tests/unit/check-qom-proplist.c | 2 +-
>  tests/qemu-iotests/049.out      | 6 +++---
>  tests/qemu-iotests/206.out      | 2 +-
>  tests/qemu-iotests/237.out      | 6 +++---
>  tests/qemu-iotests/245          | 2 +-

Good that you remembered to update iotests cases. I'm afraid there are
two more that need an update.

287 contains these lines:

    output=$(_make_test_img -o 'compression_type=zstd' 64M; _cleanup_test_img)
    if echo "$output" | grep -q "Invalid parameter 'zstd'"; then
        _notrun "ZSTD is disabled"
    fi

Instead of skipping the test case when zstd support is not compiled in,
this test fails now.

308 contains a similar check for FUSE support and fails now when FUSE
support is disabled.

Kevin


