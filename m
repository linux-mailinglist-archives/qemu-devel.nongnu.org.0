Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B93C0A48
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 19:24:50 +0200 (CEST)
Received: from localhost ([::1]:54534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDtz6-0007SX-Q9
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 13:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40335)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iDsmy-000286-HM
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 12:08:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iDsmv-0004Nm-TZ
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 12:08:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44585)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iDsmv-0004La-N2
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 12:08:09 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 660FE7BDAC;
 Fri, 27 Sep 2019 16:08:08 +0000 (UTC)
Received: from [10.3.116.249] (ovpn-116-249.phx2.redhat.com [10.3.116.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 139CB5C224;
 Fri, 27 Sep 2019 16:08:02 +0000 (UTC)
Subject: Re: [PATCH v2 22/26] qapi: Improve reporting of invalid 'if' further
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20190927134639.4284-1-armbru@redhat.com>
 <20190927134639.4284-23-armbru@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <7e91d78e-8799-f5dd-e091-77d701ec1e22@redhat.com>
Date: Fri, 27 Sep 2019 11:08:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190927134639.4284-23-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Fri, 27 Sep 2019 16:08:08 +0000 (UTC)
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

On 9/27/19 8:46 AM, Markus Armbruster wrote:
> check_if()'s errors don't point to the offending part of the
> expression.  For instance:
> 
>      tests/qapi-schema/alternate-branch-if-invalid.json:2: 'if' condition ' ' makes no sense
> 
> Other check_FOO() do, with the help of a @source argument.  Make
> check_if() do that, too.  The example above improves to:
> 
>      tests/qapi-schema/alternate-branch-if-invalid.json:2: 'if' condition ' ' of 'data' member 'branch' makes no sense
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

