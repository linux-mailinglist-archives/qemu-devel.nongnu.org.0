Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE91FC43CF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Oct 2019 00:24:19 +0200 (CEST)
Received: from localhost ([::1]:48926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFQZ8-00085h-Aa
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 18:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60320)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iFOr1-0002bR-Hc
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 16:34:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iFOr0-0007we-BT
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 16:34:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41990)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iFOr0-0007wB-6H
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 16:34:38 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E43B93082149;
 Tue,  1 Oct 2019 20:34:36 +0000 (UTC)
Received: from [10.3.116.201] (ovpn-116-201.phx2.redhat.com [10.3.116.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8762B60167;
 Tue,  1 Oct 2019 20:34:34 +0000 (UTC)
Subject: Re: [PATCH 7/7] qapi: Clear scripts/qapi/doc.py executable bits again
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20191001191514.11208-1-armbru@redhat.com>
 <20191001191514.11208-8-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <99a8d6d3-15df-da4a-d62c-47a03f91e338@redhat.com>
Date: Tue, 1 Oct 2019 15:34:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191001191514.11208-8-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 01 Oct 2019 20:34:36 +0000 (UTC)
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
> Commit fbf09a2fa4 "qapi: add 'ifcond' to visitor methods" brought back
> the executable bits.  Fix that.  Drop the #! line for good measure.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   scripts/qapi/doc.py | 1 -
>   1 file changed, 1 deletion(-)
>   mode change 100755 => 100644 scripts/qapi/doc.py
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

> diff --git a/scripts/qapi/doc.py b/scripts/qapi/doc.py
> old mode 100755
> new mode 100644
> index 1c5125249f..dc8919bab7
> --- a/scripts/qapi/doc.py
> +++ b/scripts/qapi/doc.py
> @@ -1,4 +1,3 @@
> -#!/usr/bin/env python
>   # QAPI texi generator
>   #
>   # This work is licensed under the terms of the GNU LGPL, version 2+.
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

