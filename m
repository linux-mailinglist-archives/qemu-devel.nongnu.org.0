Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C96A030CD7F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 21:58:34 +0100 (CET)
Received: from localhost ([::1]:56252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l72kr-0001Jl-TB
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 15:58:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l72jb-0000nG-I4
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:57:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l72jZ-0006AC-Jg
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:57:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612299432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OLpYVshn6tdjYmaT5WE+o86zgMM2Kok0BzsLhzG7S8o=;
 b=YGIiGlnTi0HC+O+me/JwLztJlXqPyXVW3ieHqzAOcWoBS2klIZRqJRgwctWd6DtySeVtZj
 0qCluKGo5i6TIebePsifLrUsh1oCU78kVsNKDvhnt4W7kO3F7RroDpgxMaLKwqIhwI5my0
 QAdMZeiDMYYgBEgxTUeTB802xoV+H9k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-TZr1_SUTNSe_czMeOxvpZw-1; Tue, 02 Feb 2021 15:57:09 -0500
X-MC-Unique: TZr1_SUTNSe_czMeOxvpZw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 157DA809DC3;
 Tue,  2 Feb 2021 20:57:08 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60EE15D722;
 Tue,  2 Feb 2021 20:57:07 +0000 (UTC)
Subject: Re: [PATCH] iotests: Fix expected whitespace for 185
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20210202185914.614705-1-eblake@redhat.com>
 <4c0fc5aa-d7a9-728c-24a8-e0aafc5a791c@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <0d789c6b-1313-89b2-20cf-da46feb147e5@redhat.com>
Date: Tue, 2 Feb 2021 14:57:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <4c0fc5aa-d7a9-728c-24a8-e0aafc5a791c@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 2:03 PM, Vladimir Sementsov-Ogievskiy wrote:
> 02.02.2021 21:59, Eric Blake wrote:
>> Commit f93e19fb03b adjusted various iotest whitespace discrepancies,
>> but missed a test that is not part of default 'make check'.
> 
> 
> Actually, at point of f93e19fb03b there is no x-perf at all, so it's not
> a miss in f93e19fb03b...
> 
> Let me bisect it...
> 
> Hmm, seems, it's wrong since introducing this line in 61623f82153788e
> 
> Why was it wrongly added - it's a question.. Looks like something was
> merged in a meantime, that changed how qmp log looks like.. And original
> patch was made before that. But I don't want to dig more :)

Okay, I'll adjust my commit message; we definitely had a case of patches
crossing one another, reintroducing the problem.


> 
> for the patch itself:
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Thanks; I'll include it in my NBD pull request, since I found it while
using iotests for that.


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


