Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F224E17E889
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 20:34:29 +0100 (CET)
Received: from localhost ([::1]:48596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBOAX-0004vr-2h
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 15:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51731)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jBO74-00022F-Vu
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 15:30:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jBO73-0006bH-Vp
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 15:30:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51125
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jBO73-0006aB-RX
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 15:30:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583782253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uc0A3/BATRnbO0y8Q1gsveAKaKe1sD34dRDSwZ6xKs8=;
 b=cI2kIEYilYFfDhDBvL0qgJ3o14+P00UCwZy8pOwv9UvvanJByaax1aU+0QeUqlXeG6OU+l
 N8w6aeINFQY8aBjqroTUOVWzlO5bdVrKKPO0REUnn2MaIaQSDLoQWd7z/d0cHdbdkk/QAU
 zsvV59zlW4phu6TCmofDmc71WoxDsS8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-gF6jq96kO-Sr4Oh7yzt_JA-1; Mon, 09 Mar 2020 15:30:48 -0400
X-MC-Unique: gF6jq96kO-Sr4Oh7yzt_JA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5867A1005509;
 Mon,  9 Mar 2020 19:30:47 +0000 (UTC)
Received: from [10.3.116.177] (ovpn-116-177.phx2.redhat.com [10.3.116.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D40655D9C5;
 Mon,  9 Mar 2020 19:30:46 +0000 (UTC)
Subject: Re: [PATCH v10 01/10] qemu-binfmt-conf.sh: enforce style consistency
To: Unai Martinez-Corral <unai.martinezcorral@ehu.eus>, qemu-devel@nongnu.org
References: <20200309191200.GA60@669c1c222ef4>
 <20200309191846.GA65@669c1c222ef4>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <9f03379d-f4fa-2ac4-409f-123222233cf4@redhat.com>
Date: Mon, 9 Mar 2020 14:30:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200309191846.GA65@669c1c222ef4>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: riku.voipio@iki.fi, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/20 2:18 PM, Unai Martinez-Corral wrote:
> Spaces are removed before '; then', for consistency with other scripts
> in the project.
> 
> Signed-off-by: Unai Martinez-Corral <unai.martinezcorral@ehu.eus>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Technically, since this change is different than what Laurent previously 
reviewed, it might have been better to drop the R-b to make sure 
everything is still okay.  But I'll let Laurent chime in, no need to 
respin just yet.

> ---
>   scripts/qemu-binfmt-conf.sh | 34 +++++++++++++++++-----------------
>   1 file changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


