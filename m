Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DE03516E1
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 18:54:47 +0200 (CEST)
Received: from localhost ([::1]:42180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS0ak-0001NS-5N
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 12:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lS0Yv-0000X3-0a
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 12:52:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lS0Ys-0000dq-LC
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 12:52:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617295969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=omcAlKD+fPsIredQtVnnSnUsrP3FOZTZ+PGb0nvgnxw=;
 b=IzRH8fhD1qAAUJzHi5Dvbvse/ASk3pXcKFCmzzKE7wbFsuwhozwOyWVs9y1tqRJGxrDwqp
 JNRhSrJyEJeQpfCqEtiogR2SxILNNH2WCZMt0mJ/MRyfFMw5DHhlAHH0NyKUNYQI2CjB6u
 NLVtUwXg3hw4MoIKdJW1BH/+AkUns4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-QJ0F3_wNNCKJQ8gcbqeDhg-1; Thu, 01 Apr 2021 12:52:47 -0400
X-MC-Unique: QJ0F3_wNNCKJQ8gcbqeDhg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 524385B365;
 Thu,  1 Apr 2021 16:52:46 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-60.ams2.redhat.com
 [10.36.114.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 23C9C5D9CC;
 Thu,  1 Apr 2021 16:52:41 +0000 (UTC)
Subject: Re: [PATCH 1/2] iotests/231: Update expected deprecation message
To: Connor Kuehl <ckuehl@redhat.com>, qemu-block@nongnu.org
References: <20210401155211.2093139-1-ckuehl@redhat.com>
 <20210401155211.2093139-2-ckuehl@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <b4276364-0eee-f244-1146-ee8ac1a01a59@redhat.com>
Date: Thu, 1 Apr 2021 18:52:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210401155211.2093139-2-ckuehl@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, dillaman@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.04.21 17:52, Connor Kuehl wrote:
> The deprecation message changed slightly at some point in the past but
> the expected output wasn't updated along with it; causing it to fail.
> Fix it, so it passes.
> 
> Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
> ---
>   tests/qemu-iotests/231.out | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Uh, well, you know what, I can’t find any version where there was any 
other output.  Even back in 66e6a735e97450ac50fcaf40f78600c688534cae, 
where this test was introduced, I get this diff.

What’s going on there?

Max


