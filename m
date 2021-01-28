Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76333307A99
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 17:24:29 +0100 (CET)
Received: from localhost ([::1]:41822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5A5s-0006Bp-Gw
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 11:24:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l5A3l-0004SA-I6
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:22:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l5A3h-00049M-JS
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:22:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611850931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Wy3wGBIEQsaPAgHU9sXc9i7cQvLWYu3iqNSjigJNL8=;
 b=VhQded3Tpm+FClDVugiAdFMakLfKPxhadjj3oQFrNqUtNosiPAcSHeZL0Wd1+vApEa8xBX
 Tl/VcYua5WZK/bwylEs/U3QfCNIVV1vwIpzA99gnwxth7imh5SFkFIpWf1kcMmv/kReLme
 vhlMv2sxdFphFqjGkWR8kKQI5pzE1Ns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-pI6MRH6QPimEQ9E90iXGDw-1; Thu, 28 Jan 2021 11:22:05 -0500
X-MC-Unique: pI6MRH6QPimEQ9E90iXGDw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68EB13938E;
 Thu, 28 Jan 2021 16:22:04 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-56.ams2.redhat.com
 [10.36.114.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 537881F445;
 Thu, 28 Jan 2021 16:22:03 +0000 (UTC)
Subject: Re: [PATCH] MAINTAINERS: suggest myself as co-maintainer for Block
 Jobs
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210128144144.27617-1-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <a676b450-4118-7686-3867-438a4d30fb91@redhat.com>
Date: Thu, 28 Jan 2021 17:22:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128144144.27617-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.01.21 15:41, Vladimir Sementsov-Ogievskiy wrote:
> I'm developing Qemu backup for several years, and finally new backup
> architecture, including block-copy generic engine and backup-top filter
> landed upstream, great thanks to reviewers and especially to
> Max Reitz!
> 
> I also have plans of moving other block-jobs onto block-copy, so that
> we finally have one generic block copying path, fast and well-formed.
> 
> So, now I suggest to bring all parts of backup architecture into
> "Block Jobs" subsystem (actually, aio_task is shared with qcow2 and
> qemu-co-shared-resource can be reused somewhere else, but I'd keep an
> eye on them in context of block-jobs) and add myself as co-maintainer.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   MAINTAINERS | 9 +++++++++
>   1 file changed, 9 insertions(+)

Great! :)

Reviewed-by: Max Reitz <mreitz@redhat.com>


