Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F17534996F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 19:24:31 +0100 (CET)
Received: from localhost ([::1]:48960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPUej-0006Zn-Rh
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 14:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lPUWO-0001Ok-9W
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 14:15:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lPUWB-0000QZ-HO
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 14:15:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616696135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XG4X4fGXZS5p7fZUpmRPMnjAq6cqJIX+vat6Yq7E44U=;
 b=LXJRUOwm6M15HO6yj8nFBCrDAYvGewJn4e6Q91Ywt2lgFGZaxuyGBUeAPhVyPlo9Y2blx1
 rhIYlfFMnkX+wOOoAnB4nh8Eufnx3t+rRfZwoUz8FEXH0Cm57HdVk0/mXwxTZN/wqvr5/q
 pwBNHNVHvbzdW/pSWOJAG0emlqJuxRA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-s66GiVFQO0yNHETAVPIDDg-1; Thu, 25 Mar 2021 14:15:31 -0400
X-MC-Unique: s66GiVFQO0yNHETAVPIDDg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13BDA1B18BC6;
 Thu, 25 Mar 2021 18:15:30 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-55.ams2.redhat.com
 [10.36.114.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 825861037E8F;
 Thu, 25 Mar 2021 18:15:28 +0000 (UTC)
Subject: Re: [PATCH v2 0/5] qemu-iotests: quality of life improvements
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210323181928.311862-1-pbonzini@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <7aeb5c5b-59a5-20b5-4aff-c622e6914d24@redhat.com>
Date: Thu, 25 Mar 2021 19:15:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210323181928.311862-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: eesposit@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.03.21 19:19, Paolo Bonzini wrote:
> This series adds a few usability improvements to qemu-iotests, in
> particular:
> 
> - arguments can be passed to Python unittests scripts, for example
>    to run only a subset of the test cases (patches 1-2)
> 
> - it is possible to do "./check -- ../../../tests/qemu-iotests/055 args..."
>    and specify arbitrary arguments to be passed to a single test script.
>    This allows to take advantage of the previous feature and ease debugging
>    of Python tests.
> 
> Paolo

I’ve applied an s/,attr/, attr/ to patch 1 (as suggested by Vladimir) 
and an s/debug: bool= False/debug: bool = False/ to patch 2.  I hope 
that’s OK for you.

With that I’ve applied the series to my block branch:

https://git.xanclic.moe/XanClic/qemu/commits/branch/block

Thanks!


