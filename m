Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B5A14F2B8
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 20:25:09 +0100 (CET)
Received: from localhost ([::1]:58410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixbue-0006Ql-SS
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 14:25:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51390)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1ixbtY-0005Z4-Ah
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 14:24:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1ixbtW-0002pw-Up
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 14:24:00 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:27486
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1ixbtW-0002pa-RJ
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 14:23:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580498638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VifTzv8rpYtYh2pAVgedL1Kt4aCvBXnX5pFbmiAwwbE=;
 b=M+NgLJ9/rL7sdHVzFC/GC6S7Fx0zvgelrwWDueHAGJiCsY8LVSLV/gfcbqbqwEzkNIljLT
 gO/6pcMBz5olofK98zoQKARioNM7V6aqp7Qi+sg6iD2XmKP5FdOfIihU6KhSlH3ngdKUOi
 2wRP5QiqI9UWpCp3NBuTO8IG1PYcXnc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-vQTzO5DAOaW5TOCaMtP2sw-1; Fri, 31 Jan 2020 14:23:51 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB7F5477;
 Fri, 31 Jan 2020 19:23:49 +0000 (UTC)
Received: from [10.3.116.181] (ovpn-116-181.phx2.redhat.com [10.3.116.181])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B584C5DAAC;
 Fri, 31 Jan 2020 19:23:45 +0000 (UTC)
Subject: Re: [PATCH v2 1/5] block: Mark commit and mirror as filter drivers
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20191219085106.22309-1-vsementsov@virtuozzo.com>
 <20191219085106.22309-2-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <87b5063b-73f2-e89c-5d28-8aaf59ed6fc9@redhat.com>
Date: Fri, 31 Jan 2020 13:23:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20191219085106.22309-2-vsementsov@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: vQTzO5DAOaW5TOCaMtP2sw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: fam@euphon.net, kwolf@redhat.com, quintela@redhat.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com, stefanha@redhat.com,
 den@openvz.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/19/19 2:51 AM, Vladimir Sementsov-Ogievskiy wrote:
> From: Max Reitz <mreitz@redhat.com>
> 
> The commit and mirror block nodes are filters, so they should be marked
> as such.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>     [squash comment fix from another Max's patch and adjust commit msg]
> ---
>   include/block/block_int.h | 8 +++++---
>   block/commit.c            | 2 ++
>   block/mirror.c            | 2 ++
>   3 files changed, 9 insertions(+), 3 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


