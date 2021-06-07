Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4B639DF09
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 16:45:45 +0200 (CEST)
Received: from localhost ([::1]:57224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqGVc-0000dv-F7
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 10:45:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqGUP-0008IK-JD
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:44:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqGUM-0007gP-O7
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:44:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623077064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1JCLHEhfZMJ27Sq1eDpPwdEGvIhK/+mlOtg8KvR8guo=;
 b=Q98Fy4teOr0jGMfZTY8GbLdJPoXWIvDRofrhLjS6VuxE+BQWOpI1jnxntvQT1QLzqXM6tG
 LP2rJehmyxT9dvmIKFpKeC9xq7yqQKpK03OXdL1LWZbfYq1ME5VH3405FHCq0poPY5lhOu
 7JrTRCS/GThbqNvdlKpWiUSPI0j+Aec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-VkezN-ITOIq-cZJWYr4ORg-1; Mon, 07 Jun 2021 10:44:22 -0400
X-MC-Unique: VkezN-ITOIq-cZJWYr4ORg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2409106BB2D;
 Mon,  7 Jun 2021 14:44:20 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F12045D6D3;
 Mon,  7 Jun 2021 14:44:19 +0000 (UTC)
Date: Mon, 7 Jun 2021 09:44:18 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] iotests/check: move general long options to double dash
Message-ID: <20210607144418.4si73px4t4i4by7w@redhat.com>
References: <20210526181659.365531-1-vsementsov@virtuozzo.com>
 <3d086c41-80c0-a970-367d-00e19ce55817@redhat.com>
 <ebfba20f-badc-422b-f71d-28b9280f65cb@virtuozzo.com>
 <2ed9f244-722f-83ed-dd53-205e1833dc27@redhat.com>
 <955ce8e3-eafe-79ab-ad4e-f81ecf08d20f@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <955ce8e3-eafe-79ab-ad4e-f81ecf08d20f@virtuozzo.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, eesposit@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 04, 2021 at 11:25:16AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> So, there are some ways to improve the situation:

My personal preference (although I'm fine with any of your listed
options, if others speak up in favor of a different one):

> 2. Take this patch and also convert protocol and format options
> 
> Pros: everything is consistent and use two dashes, so we can safely use combining short options syntax
> Cons: more pain for developers to write --qcow2 instead of -qcow2 every time. What actually stopped me of posting that patch (converting protocol and format options), I imagined the heavy extra load on all block-layer developers right pinky to push '-' one time more :))

I don't mind typing an extra - for './check --qcow2'.  I agree it will
cause some temporary learning curve when I type the short way and it
fails, but as long as the error message is good, I don't see a problem
in changing the interface since this is a developer-only tool.

> So, I'm OK with either way and can make patches. But I don't want to be the only person who makes a decision. So, let's wait for opinions, and if nobody really interested, go the default way [3].

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


