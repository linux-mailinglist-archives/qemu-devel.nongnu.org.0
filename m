Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 191951AA0FE
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 14:36:46 +0200 (CEST)
Received: from localhost ([::1]:49132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOhHZ-0000io-6Y
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 08:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58386)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jOhGJ-0007p1-AK
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 08:35:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jOhGI-0000yB-8b
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 08:35:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:39612
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jOhGI-0000y3-4E
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 08:35:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586954125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sUn6QdQB3dzXEoCWDs5oBs+IxSBgNHlxYZDPAZPiWcY=;
 b=PbXh9a3YK8KJ1EfPPpKz+yLKfhNnJaR1suOSa/2h72jlUIptwfcGgHzOfDhljFgSlgZIAO
 aVzDZ96+VLQwrQcy3ZmxS9j8jthdV+74Q07/uVLc+5/Z82VFbdZAps2vHorRUZIMMdoHNE
 Y1dEyV7KKjJUVBaSI0ECppFccbfiYSo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-mjG-v081OSqLWVwq_Z9Aig-1; Wed, 15 Apr 2020 08:35:23 -0400
X-MC-Unique: mjG-v081OSqLWVwq_Z9Aig-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0F68107ACCC;
 Wed, 15 Apr 2020 12:35:22 +0000 (UTC)
Received: from [10.3.115.59] (ovpn-115-59.phx2.redhat.com [10.3.115.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 589A35C3FA;
 Wed, 15 Apr 2020 12:35:22 +0000 (UTC)
Subject: Re: [PATCH for-5.1 5/5] qemu-option: Clean up after the previous
 commit
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200415083048.14339-1-armbru@redhat.com>
 <20200415083048.14339-6-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <38cd80b7-f007-0f7f-3a1e-782d90cb8642@redhat.com>
Date: Wed, 15 Apr 2020 07:35:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200415083048.14339-6-armbru@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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

On 4/15/20 3:30 AM, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   util/qemu-option.c | 43 +++++++++++++++----------------------------
>   1 file changed, 15 insertions(+), 28 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


