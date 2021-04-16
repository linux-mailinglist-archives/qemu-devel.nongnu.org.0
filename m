Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19051361A4D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 09:07:10 +0200 (CEST)
Received: from localhost ([::1]:50886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXIZI-0005DK-Jw
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 03:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lXIXo-0004QM-Fz
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 03:05:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lXIXk-00015z-OS
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 03:05:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618556730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0xpY8aT8z1FqXD/dZWMpfPgvKLr8bJfiWoTJnE3ZIYQ=;
 b=LGeJiCFU8GZDZyLkgmPyv65eJ36yBb+D0IpB3xN7CmY7uwyiAYcyUqOhmNqPrjGCoXSJk1
 Ro5YBWAtmr+k1vHcp63KFTRPwB+qzV7TApwAPwmlKvvANPtkP2XBZdeJMm94kbG1SUj6jI
 DJ6PS/Gtr2m/ukU6Gc3cdM7ehpCZICk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-LBV0OMc7P-eNNY6BNv1d0w-1; Fri, 16 Apr 2021 03:05:28 -0400
X-MC-Unique: LBV0OMc7P-eNNY6BNv1d0w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 499B0107ACC7;
 Fri, 16 Apr 2021 07:05:27 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-131.ams2.redhat.com
 [10.36.113.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3B61437F;
 Fri, 16 Apr 2021 07:05:25 +0000 (UTC)
Subject: Re: about mirror cancel
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu block <qemu-block@nongnu.org>
References: <b2e5b990-ca1c-53f0-0e0c-31396156fa4a@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <5df8166f-a204-6510-e27a-1b334f0bb3f3@redhat.com>
Date: Fri, 16 Apr 2021 09:05:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <b2e5b990-ca1c-53f0-0e0c-31396156fa4a@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.04.21 20:46, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> Recently I've implemented fast-cancelling of mirror job: do 
> bdrv_cancel_in_flight() in mirror_cancel().
> 
> Now I'm in doubt: is it a correct thing? I heard, that mirror-cancel is 
> a kind of valid mirror completion..
> 
> Looking at documentation:
> 
> # Note that if you issue 'block-job-cancel' after 'drive-mirror' has 
> indicated
> # (via the event BLOCK_JOB_READY) that the source and destination are
> # synchronized, then the event triggered by this command changes to
> # BLOCK_JOB_COMPLETED, to indicate that the mirroring has ended and the
> # destination now has a point-in-time copy tied to the time of the 
> cancellation.
> 
> So, in other words, do we guarantee something to the user, if it calls 
> mirror-cancel in ready state? Does this abuse exist in libvirt?

How is it abuse it if it’s documented?  AFAIR it does exist, because 
libvirt’s blockcopy always uses mirror (with --pivot it’s allowed to 
complete, without it is cancelled).

(And the point of course is that if you want mirror to create a copy 
without pivoting, you need this behavior, because otherwise the target 
may be in an inconsistent state.)

> ====
> 
> Note, that if cancelling all in-flight requests on target is wrong on 
> mirror cancel, we still don't have real bug, as the only implementation 
> of .bdrv_cancel_in_flight is stopping reconnect waiting in nbd driver. 
> So, we'll cancel requests only if connection is already lost anyway.
> 
> But that probably means, that correct name of the handler would be 
> .bdrv_cancel_in_fligth_requests_that_will_most_probably_fail_anyway()..

It’s documentation states that it should cancel all in-flight requests, 
so it’s more likely it just isn’t implemented where it could be.

> And it also means, that abuse of mirror-cancel as valid completion is a 
> bad idea, as we can't distinguish the cases when user calls job-cancel 
> to have a kind of point-in-time copy, or just to cancel job (and being 
> not interested in the final state of target).
> 
> So, probably we need an option boolean argument for blockjob-cancel, 
> like "hard", that will cancel in-flight writes on target node..

There is @force.  See commit b76e4458b1eb3c3.

Max


