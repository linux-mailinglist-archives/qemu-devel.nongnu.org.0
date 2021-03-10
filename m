Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EA3334515
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:26:11 +0100 (CET)
Received: from localhost ([::1]:51258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2b4-0000E0-GO
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:26:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lK27i-00068a-0V
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:55:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lK27g-0005T2-BU
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:55:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615395347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aoByqnP3fJbDmFDuqBz8tlkD/jByHpQoaua62ahfERQ=;
 b=D/Pcpz0+3Rq+oLGrApV8JKo+1Ag9G8lQDYgSGvwCtnPoKW54oNfmj1b/pWqUJ7lzSC52AY
 9/8VglWJ7oZj0lVcxeMm4az9d971ThIvZqFtzUk6F8hF7lvX+OqB7q/+4bjuE5/9sNjIqq
 cvRSkCDbPI2oLrOIeEKk8Hu/AmvA+8k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-NYVBV1pQO6KX-zl0imsxkw-1; Wed, 10 Mar 2021 11:55:45 -0500
X-MC-Unique: NYVBV1pQO6KX-zl0imsxkw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C92884BA42
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 16:55:45 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-19.ams2.redhat.com [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3804F1A8F2;
 Wed, 10 Mar 2021 16:55:44 +0000 (UTC)
Subject: Re: [PATCH] tests: remove "make check-speed" in favor of "make bench"
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210310164612.285362-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4f436e3e-d9a5-4d8f-7a2a-a26a3ede236a@redhat.com>
Date: Wed, 10 Mar 2021 17:55:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210310164612.285362-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: wrampazz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/03/2021 17.46, Paolo Bonzini wrote:
> "make check-speed" has been broken since the removal of ninja2make
> last October.  It was just a backwards-compatibility alias for
> "make bench-speed", which in turn is in principle a subset of
> "make bench".  Advertise the latter and drop "make check-speed"
> completely since no one has noticed.
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Supersedes: <20210310094936.1318317-1-thuth@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   tests/Makefile.include | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


