Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC554BFCB
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 19:37:52 +0200 (CEST)
Received: from localhost ([::1]:40776 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdeWt-0000gJ-PD
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 13:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45397)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <wainersm@redhat.com>) id 1hdeKy-0002th-Mn
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 13:25:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1hdeKt-0004CC-Kv
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 13:25:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59130)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1hdeKk-0003s3-2e
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 13:25:24 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0E6055F79B;
 Wed, 19 Jun 2019 17:24:51 +0000 (UTC)
Received: from localhost.localdomain (ovpn-122-230.rdu2.redhat.com
 [10.10.122.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BD565D71B;
 Wed, 19 Jun 2019 17:24:45 +0000 (UTC)
To: David Gibson <david@gibson.dropbear.id.au>, crosa@redhat.com,
 qemu-devel@nongnu.org, arikalo@wavecomp.com, aurelien@aurel32.net,
 ehabkost@redhat.com
References: <20190613060728.26955-1-david@gibson.dropbear.id.au>
 <20190613060728.26955-2-david@gibson.dropbear.id.au>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <b5daa781-3980-1be5-6ddd-c2db06b8cbb5@redhat.com>
Date: Wed, 19 Jun 2019 14:24:41 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20190613060728.26955-2-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Wed, 19 Jun 2019 17:24:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/3] tests/acceptance: Specify arch for
 QueryCPUModelExpansion
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 06/13/2019 03:07 AM, David Gibson wrote:
> At the moment this test runs on whatever the host arch is.  But it looks
> for 'unavailable-features' which is an x86 specific cpu property.  Tag it
> to always use qemu-system-x86_64.
>
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>   tests/acceptance/cpu_queries.py | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/tests/acceptance/cpu_queries.py b/tests/acceptance/cpu_queries.py
> index e71edec39f..af47d2795a 100644
> --- a/tests/acceptance/cpu_queries.py
> +++ b/tests/acceptance/cpu_queries.py
> @@ -18,6 +18,9 @@ class QueryCPUModelExpansion(Test):
>       """
>   
>       def test(self):
> +        """
> +        :avocado: tags=arch:x86_64
> +        """
>           self.vm.set_machine('none')
>           self.vm.add_args('-S')
>           self.vm.launch()


