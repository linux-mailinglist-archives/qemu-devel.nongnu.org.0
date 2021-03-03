Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C30C432B94B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 17:45:46 +0100 (CET)
Received: from localhost ([::1]:35120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHUd7-0004A6-CT
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 11:45:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHUbN-0003DA-Gm
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 11:43:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHUbJ-0000I7-7N
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 11:43:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614789829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3If5i905tcLO1VVNOJ+NJ9vZL37hIIhQOp6LKISc+Co=;
 b=hjhON/itdU+Ap8EN6Rfj8aPZIyR8jj7tlxr8UI58wv/uxzDuznFG6pHyYtoRY+yC3U6Sax
 z1/w9K0uTr3egcnkwtCwWcb9Sg24UbB2IeQo+z8PqqBfGxVCIn5fd8v4rGiQvZcwxD4N+C
 6pnA2rY1Vqf9DQVNoUkrJM7jsGDsU2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-8r5mzYNbND-8Li3VnFyu8Q-1; Wed, 03 Mar 2021 11:43:47 -0500
X-MC-Unique: 8r5mzYNbND-8Li3VnFyu8Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD0921E567
 for <qemu-devel@nongnu.org>; Wed,  3 Mar 2021 16:43:46 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-115-146.ams2.redhat.com [10.36.115.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEBAE60C13;
 Wed,  3 Mar 2021 16:43:42 +0000 (UTC)
Subject: Re: [PATCH v2] libqos/qgraph: format qgraph comments for sphinx
 documentation
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
References: <20210225122228.106305-1-eesposit@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <251214bd-9676-b4fd-5592-d8efcb21a8e3@redhat.com>
Date: Wed, 3 Mar 2021 17:43:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210225122228.106305-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/02/2021 13.22, Emanuele Giuseppe Esposito wrote:
> Change documentation style and fix minor typos in tests/qtest/libqos/qgraph.h
> to automatically generate sphinx documentation in docs/devel/qgraph.rst
> 
> The mechanism explanation that once was in qgraph.h is now moved to qgraph.rst
> 
> There is no functional change intended.
> 
> v2:
> - qgraph link visible in docs/devel/index but not in docs/index, since it is
> a subsection of qtest.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   MAINTAINERS                 |   1 +
>   docs/devel/index.rst        |   1 +
>   docs/devel/qgraph.rst       | 261 ++++++++++++++++++++++++++++++
>   docs/devel/qtest.rst        |   8 +
>   tests/qtest/libqos/qgraph.h | 308 ++++++------------------------------
>   5 files changed, 320 insertions(+), 259 deletions(-)
>   create mode 100644 docs/devel/qgraph.rst

I'm getting a bunch of warnings after applying this patch:

../tests/qtest/libqos/qgraph.h:53: warning: cannot understand function 
prototype: 'struct QOSGraphEdgeOptions '
../tests/qtest/libqos/qgraph.h:93: warning: cannot understand function 
prototype: 'struct QOSGraphTestOptions '
../tests/qtest/libqos/qgraph.h:138: warning: cannot understand function 
prototype: 'struct QOSGraphObject '
../tests/qtest/libqos/qgraph.h:218: warning: Function parameter or member 
'opts' not described in 'qos_node_create_machine_args'
../tests/qtest/libqos/qgraph.h:218: warning: Excess function parameter 'pts' 
description in 'qos_node_create_machine_args'

Any chance to fix them first?

  Thomas


