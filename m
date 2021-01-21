Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 718712FDEB4
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 02:20:18 +0100 (CET)
Received: from localhost ([::1]:38070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Ody-0006Ud-U2
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 20:20:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2ObM-0005hW-2G
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 20:17:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2ObH-0002oh-N9
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 20:17:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611191846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aME5E7veD1KAICLmyUVkbuqQVhhTlzCT8GJcLIPVQ5I=;
 b=UXOyrRBDbx94lWVzkaTul+8pUH33K30LjlVABwMbvKY0+C1QFzPFVodnDa39qQKKAijfPd
 J3hz8/p1ktJt/a6gT1wpVZUzdKDXJc/jLqdJYkbKYM0Jbm3v95J8Df82a/rM2NgCtUPwX5
 Zj/rXVcqXA2x/HGaNmOsIFRICZ3MPR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-0BrzilH3PPmkwig3N5hobA-1; Wed, 20 Jan 2021 20:17:24 -0500
X-MC-Unique: 0BrzilH3PPmkwig3N5hobA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E46A3806663;
 Thu, 21 Jan 2021 01:17:22 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66C3910016F5;
 Thu, 21 Jan 2021 01:17:19 +0000 (UTC)
Subject: Re: [PATCH 07/11] iotests/264: move to python unittest
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201118180433.11931-1-vsementsov@virtuozzo.com>
 <20201118180433.11931-8-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <bf712fde-61ed-f0b8-c895-13a4486d82cb@redhat.com>
Date: Wed, 20 Jan 2021 19:17:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201118180433.11931-8-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 12:04 PM, Vladimir Sementsov-Ogievskiy wrote:
> We are going to add more test cases, so use the library supporting test
> cases.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  tests/qemu-iotests/264     | 93 ++++++++++++++++++++++----------------
>  tests/qemu-iotests/264.out | 20 ++------
>  2 files changed, 58 insertions(+), 55 deletions(-)
> 

> +++ b/tests/qemu-iotests/264.out
> @@ -1,15 +1,5 @@
> -Start NBD server
> -{"execute": "blockdev-add", "arguments": {"driver": "raw", "file": {"driver": "nbd", "reconnect-delay": 10, "server": {"path": "TEST_DIR/PID-nbd-sock", "type": "unix"}}, "node-name": "backup0"}}
> -{"return": {}}
> -{"execute": "blockdev-backup", "arguments": {"device": "drive0", "speed": 1048576, "sync": "full", "target": "backup0"}}
> -{"return": {}}
> -Backup job is started
> -Kill NBD server
> -Backup job is still in progress
> -{"execute": "block-job-set-speed", "arguments": {"device": "drive0", "speed": 0}}
> -{"return": {}}
> -Start NBD server
> -Backup completed: 5242880
> -{"execute": "blockdev-del", "arguments": {"node-name": "backup0"}}
> -{"return": {}}
> -Kill NBD server
> +.
> +----------------------------------------------------------------------
> +Ran 1 tests
> +
> +OK

I find it a shame that the expected output no longer shows what was
executed.  But the test still passes, and if it makes it easier for you
to extend the test in a later patch, I won't stand in the way (this is
more an indication that by stripping the useful output, I'm no longer in
as decent a position to help debug if the test starts failing).

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


