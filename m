Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE5D187100
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 18:17:01 +0100 (CET)
Received: from localhost ([::1]:43440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDtMK-0007gJ-Lb
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 13:17:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51368)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jDrPZ-00007n-RZ
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 11:12:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jDrPY-0005wK-Of
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 11:12:13 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:59828)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jDrPY-0005rt-Id
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 11:12:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584371532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uIWA3mHYdWsduqEBakmGNZd3s9YlFiSpSAJaP0cYABE=;
 b=H5zw/xAIqwm8/PmSxuSb9xVAS+u4z7Z0GXCj6Bz9hExu8A/eQg/pSqNXj1uaLPAqtCMlYA
 MSLSOQjgKk/WK/SFv4ZdemHiPhXtOmFZOyP6v+V+ipcIEEIJex0uMrEhERXHi5WBgVd4lF
 swfC23BPDsCEfjVhhzycfCTEkaex2l8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-GEIfcMk9M9SkMlVO2CzgRQ-1; Mon, 16 Mar 2020 11:12:10 -0400
X-MC-Unique: GEIfcMk9M9SkMlVO2CzgRQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D372835B4E;
 Mon, 16 Mar 2020 15:12:09 +0000 (UTC)
Received: from [10.3.118.63] (ovpn-118-63.phx2.redhat.com [10.3.118.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C43692706B;
 Mon, 16 Mar 2020 15:12:08 +0000 (UTC)
Subject: Re: [PATCH v3 03/34] docs/devel/qapi-code-gen: Clarify allow-oob
 introspection
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200315144653.22660-1-armbru@redhat.com>
 <20200315144653.22660-4-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <0279449b-b6b4-6aaa-c0e3-6eb61e806fac@redhat.com>
Date: Mon, 16 Mar 2020 10:12:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200315144653.22660-4-armbru@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
> Mention SchemaInfo variant member "allow-oob" defaults to false.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   docs/devel/qapi-code-gen.txt | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.txt
> index 59d6973e1e..5906602504 100644
> --- a/docs/devel/qapi-code-gen.txt
> +++ b/docs/devel/qapi-code-gen.txt
> @@ -988,9 +988,9 @@ The SchemaInfo for a command has meta-type "command", and variant
>   members "arg-type", "ret-type" and "allow-oob".  On the wire, the
>   "arguments" member of a client's "execute" command must conform to the
>   object type named by "arg-type".  The "return" member that the server
> -passes in a success response conforms to the type named by
> -"ret-type".  When "allow-oob" is set, it means the command supports
> -out-of-band execution.
> +passes in a success response conforms to the type named by "ret-type".
> +When "allow-oob" is true, it means the command supports out-of-band
> +execution.  It defaults to false.
>   
>   If the command takes no arguments, "arg-type" names an object type
>   without members.  Likewise, if the command returns nothing, "ret-type"
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


