Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5184187241
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 19:26:27 +0100 (CET)
Received: from localhost ([::1]:45782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDuRW-0005oC-Og
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 14:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51693)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jDuJu-0007zi-Vk
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 14:18:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jDuJt-0006Gt-S9
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 14:18:34 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:24536)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jDuJt-0006B5-K0
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 14:18:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584382713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NNW2mvQQkx2AOv4TIxOE0CGexGHdA45NiB0xl6FdDSE=;
 b=VFf7J2rz+54D4LsGa1as/IRjdzJVvpqTgSlAXraNIvzY/rB/mxUz3yxpG62AVUga9Ncx2h
 746CSv/ng4Wfq4h54uPAvJ7LOLA3wlbX4LKNr9kr824OeyOZ/MDeuj/fiZhpM1nmTHN+hq
 cUDc53f4DDL3or2T4QC/4UZyul3AidY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-uSBKaO_bPVKkQg0bCkh-Rg-1; Mon, 16 Mar 2020 14:18:31 -0400
X-MC-Unique: uSBKaO_bPVKkQg0bCkh-Rg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B44E9194FE3E;
 Mon, 16 Mar 2020 17:58:00 +0000 (UTC)
Received: from [10.3.118.63] (ovpn-118-63.phx2.redhat.com [10.3.118.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EAE019756;
 Mon, 16 Mar 2020 17:58:00 +0000 (UTC)
Subject: Re: [PATCH v3 13/34] qapi: Consistently put @features parameter right
 after @ifcond
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200315144653.22660-1-armbru@redhat.com>
 <20200315144653.22660-14-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <a3bd5f47-e7e3-ec5d-3ebb-82640b8669ae@redhat.com>
Date: Mon, 16 Mar 2020 12:57:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200315144653.22660-14-armbru@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/20 9:46 AM, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   scripts/qapi/commands.py       |  6 +++---
>   scripts/qapi/doc.py            | 10 +++++-----
>   scripts/qapi/introspect.py     | 10 +++++-----
>   scripts/qapi/schema.py         | 36 ++++++++++++++++------------------
>   scripts/qapi/types.py          |  4 ++--
>   scripts/qapi/visit.py          |  4 ++--
>   tests/qapi-schema/test-qapi.py | 10 +++++-----
>   7 files changed, 39 insertions(+), 41 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


