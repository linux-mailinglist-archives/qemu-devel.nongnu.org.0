Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5555C364A2F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 20:59:28 +0200 (CEST)
Received: from localhost ([::1]:58474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZ7H-0004ZX-EY
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 14:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lYZ4u-0003fY-Qr
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 14:57:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lYZ4r-0000qL-5a
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 14:56:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618858613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zMbEJlM8i4cIJ03zkGOHD1Rl1b/Jhsp9TCkwV7QXNPk=;
 b=IBwzNpvZHK1WdAN31P+jVYUQcglTe80yEbMufDn60zSFeeIEXyYsvpG953cRUCtrze3Wf/
 hHR6FfJ3IKXzk7GJUcuNr+f4/P3Hx8KdehDycrbjt/Tzls9LQfOa2JAg9MAXyMwMLFzyuK
 R0TguZD5VoCcvSBjExCVaryZhc8GPNk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-8eg3-EZCMkGli4sqefrHzQ-1; Mon, 19 Apr 2021 14:56:51 -0400
X-MC-Unique: 8eg3-EZCMkGli4sqefrHzQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A90DC79ECB;
 Mon, 19 Apr 2021 18:56:49 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-102.gru2.redhat.com
 [10.97.116.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97F1860C5F;
 Mon, 19 Apr 2021 18:56:34 +0000 (UTC)
Subject: Re: [PATCH 5/8] tests/acceptance/cpu_queries.py: use the proper
 logging channels
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210415215141.1865467-1-crosa@redhat.com>
 <20210415215141.1865467-6-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <e587f9b8-476a-a132-cfa4-f77b35ce6f05@redhat.com>
Date: Mon, 19 Apr 2021 15:56:31 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210415215141.1865467-6-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 4/15/21 6:51 PM, Cleber Rosa wrote:
> The test contains methods for the proper log of test related
> information.  Let's use that and remove the print and the unused
> logging import.
>
> Reference: https://avocado-framework.readthedocs.io/en/87.0/api/test/avocado.html#avocado.Test.log
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/acceptance/cpu_queries.py | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/tests/acceptance/cpu_queries.py b/tests/acceptance/cpu_queries.py
> index 293dccb89a..cc9e380cc7 100644
> --- a/tests/acceptance/cpu_queries.py
> +++ b/tests/acceptance/cpu_queries.py
> @@ -8,8 +8,6 @@
>   # This work is licensed under the terms of the GNU GPL, version 2 or
>   # later.  See the COPYING file in the top-level directory.
>   
> -import logging
> -
>   from avocado_qemu import Test
>   
>   class QueryCPUModelExpansion(Test):
> @@ -27,7 +25,7 @@ def test(self):
>   
>           cpus = self.vm.command('query-cpu-definitions')
>           for c in cpus:
> -            print(repr(c))
> +            self.log.info("Checking CPU: %s", c)
>               self.assertNotIn('', c['unavailable-features'], c['name'])
>   
>           for c in cpus:

While you are here, maybe merge the two `for c in cpus` loops? :D

Anyway,

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>



