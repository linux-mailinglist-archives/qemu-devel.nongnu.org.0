Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 409E6C4393
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Oct 2019 00:14:06 +0200 (CEST)
Received: from localhost ([::1]:48820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFQPE-0001JA-JU
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 18:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56869)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iFOL2-0000FR-BT
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 16:01:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iFOL0-0006JF-5p
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 16:01:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42428)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iFOKy-0006IW-S2
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 16:01:33 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0BE163D955;
 Tue,  1 Oct 2019 20:01:32 +0000 (UTC)
Received: from [10.3.116.201] (ovpn-116-201.phx2.redhat.com [10.3.116.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ADE145D6D0;
 Tue,  1 Oct 2019 20:01:29 +0000 (UTC)
Subject: Re: [PATCH 2/7] qapi: Store pragma state in QAPISourceInfo, not
 global state
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20191001191514.11208-1-armbru@redhat.com>
 <20191001191514.11208-3-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <f9972ef4-e128-19a6-b861-2faee991c71a@redhat.com>
Date: Tue, 1 Oct 2019 15:01:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191001191514.11208-3-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Tue, 01 Oct 2019 20:01:32 +0000 (UTC)
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
Cc: marcandre.lureau@redhat.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/1/19 2:15 PM, Markus Armbruster wrote:
> The frontend can't be run more than once due to its global state.
> A future commit will want to do that.
> 
> Recent commit "qapi: Move context-sensitive checking to the proper
> place" got rid of many global variables already, but pragma state is
> still stored in global variables (that's why a pragma directive's
> scope is the complete schema).
> 
> Move the pragma state to QAPISourceInfo.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   scripts/qapi/common.py | 36 +++++++++++++++++++-----------------
>   1 file changed, 19 insertions(+), 17 deletions(-)
> 
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

