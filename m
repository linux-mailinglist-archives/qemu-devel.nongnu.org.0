Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEB3D4A1F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 23:54:56 +0200 (CEST)
Received: from localhost ([::1]:57454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJ2sB-0006k5-7v
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 17:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56657)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iJ2aQ-0003V0-6k
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 17:36:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iJ2aP-00048K-7P
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 17:36:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57746)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iJ2aM-00047l-SN; Fri, 11 Oct 2019 17:36:31 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 211FA10A8126;
 Fri, 11 Oct 2019 21:36:30 +0000 (UTC)
Received: from [10.3.116.168] (ovpn-116-168.phx2.redhat.com [10.3.116.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC8CE194BB;
 Fri, 11 Oct 2019 21:36:29 +0000 (UTC)
Subject: Re: [PATCH 2/4] qemu-io: Support help options for --object
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20191011205551.32149-1-kwolf@redhat.com>
 <20191011205551.32149-3-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <edbd7033-32c1-2152-f0cd-5d6f204c0cad@redhat.com>
Date: Fri, 11 Oct 2019 16:36:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191011205551.32149-3-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Fri, 11 Oct 2019 21:36:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/19 3:55 PM, Kevin Wolf wrote:
> Instead of parsing help options as normal object properties and
> returning an error, provide the same help functionality as the system
> emulator in qemu-io, too.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   qemu-io.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

