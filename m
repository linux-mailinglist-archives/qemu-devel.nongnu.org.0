Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B968A166487
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 18:24:55 +0100 (CET)
Received: from localhost ([::1]:46762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4pZG-0006EN-QP
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 12:24:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40449)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1j4pYL-0005YA-9z
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 12:23:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1j4pYK-0004vZ-Bo
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 12:23:57 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38234
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1j4pYK-0004vH-78
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 12:23:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582219435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Gxfx+gYz0vmq+C6APRhnDjsXwl8Izg0NhX7szxLeMs=;
 b=MHBM2xLQ+zXLhXniwmys6bMErNnqSNM8Q5emlT1TVxHX2LG3fS7W9Jtiw9o6TLxYV0TkPT
 Aq0EdHnzqaAUG54MUeXDpk9xbfvCbj0qRY8KDXBDg8V8gXU+zkusLrHN23WSuX4DVC9EgV
 ZN6BvofDGW2e+kiLCVAgF7ahCFGVaHQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-WYm2rk5KNgGo-HFj0SZ9XQ-1; Thu, 20 Feb 2020 12:23:53 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 077B2107ACC5
 for <qemu-devel@nongnu.org>; Thu, 20 Feb 2020 17:23:53 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-92.gru2.redhat.com
 [10.97.116.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 691445DA84;
 Thu, 20 Feb 2020 17:23:49 +0000 (UTC)
Subject: Re: [PATCH v1 2/4] Acceptance test: EXEC migration
To: Oksana Vohchana <ovoshcha@redhat.com>, qemu-devel@nongnu.org
References: <20200214145235.4378-1-ovoshcha@redhat.com>
 <20200214145235.4378-3-ovoshcha@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <36ed23e1-a9e0-e5f0-5256-aa4e7d7717e7@redhat.com>
Date: Thu, 20 Feb 2020 14:23:47 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200214145235.4378-3-ovoshcha@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: WYm2rk5KNgGo-HFj0SZ9XQ-1
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
Cc: philmd@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/14/20 12:52 PM, Oksana Vohchana wrote:
> Improves EXEC migration to run whole test stage
>
> Signed-off-by: Oksana Vohchana <ovoshcha@redhat.com>
> ---
>   tests/acceptance/migration.py | 2 ++
>   1 file changed, 2 insertions(+)

Indeed, with this changes the migration is triggered.

Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/tests/acceptance/migration.py b/tests/acceptance/migration.py
> index e4c39b85a1..8209dcf71d 100644
> --- a/tests/acceptance/migration.py
> +++ b/tests/acceptance/migration.py
> @@ -75,3 +75,5 @@ class Migration(Test):
>           """
>           free_port = self._get_free_port()
>           dest_uri = 'exec:nc -l localhost %u' % free_port
> +        src_uri = 'exec:nc localhost %u' % free_port
> +        self.do_migrate(dest_uri, src_uri)


