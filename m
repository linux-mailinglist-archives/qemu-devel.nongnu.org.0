Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A2F324DC7
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 11:19:27 +0100 (CET)
Received: from localhost ([::1]:50378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFDjy-0007sN-Gb
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 05:19:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lFDe4-0001X0-7J
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:13:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lFDe1-0007yC-Dc
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 05:13:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614247996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dmfqWcBrE9Jm8uaQt1OfKDbh2I5wgohwOcvK6BwMVVY=;
 b=a2422f6AiMJPizEXra2/oJJB5JBXbrgUSlwFesxjs4q8h+E7b+W8ZR4v+k9M8ISSXNkZAl
 esKFcBhcSQ2kXJhXuWRphZjvI/xDoYtOy7uIk05yBJnhfo6x9tZ4SS794uMU7Y1aNwUtiS
 W+yy4icH4159XlsKt3TY3C26tD7RI9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-UENzUWPePGGEkdB2XBsjUQ-1; Thu, 25 Feb 2021 05:13:14 -0500
X-MC-Unique: UENzUWPePGGEkdB2XBsjUQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB1D1108C279
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 10:13:13 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-74.ams2.redhat.com
 [10.36.113.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AAFBC19D61;
 Thu, 25 Feb 2021 10:13:12 +0000 (UTC)
Subject: Re: [PATCH] libqos/qgraph: format qgraph comments for sphinx
 documentation
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210224101810.52851-1-eesposit@redhat.com>
 <ec53c449-b719-07cf-0993-352bdbd32725@redhat.com>
 <919d2c24-92f8-53e8-5598-97166add3083@redhat.com>
 <6ac6ecf9-ea88-56f5-43c5-645627ff5d9e@redhat.com>
 <fd5ba2a9-c18f-7679-f633-a4ad6a4b33de@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <824a2798-2096-b110-1dd3-dd88f41f635f@redhat.com>
Date: Thu, 25 Feb 2021 11:13:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <fd5ba2a9-c18f-7679-f633-a4ad6a4b33de@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 25/02/2021 11:05, Paolo Bonzini wrote:
> On 25/02/21 09:22, Emanuele Giuseppe Esposito wrote:
>> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
>> index 1dcce3bbed..f0038f8722 100644
>> --- a/docs/devel/index.rst
>> +++ b/docs/devel/index.rst
>> @@ -12,6 +12,7 @@ Contents:
>>
>>   .. toctree::
>>      :maxdepth: 2
>> +   :includehidden:
>>
>>      build-system
>>      kconfig
>> @@ -24,7 +25,6 @@ Contents:
>>      atomics
>>      stable-process
>>      qtest
>> -   qgraph
>>      decodetree
>>      secure-coding-practices
>>      tcg
>>
>> -------
>>
>> Allow showing the hidden toctree in the docs/devel index, so that the 
>> link is visible
>>
>> End result:
>> - no visible change in docs/index
>> - qgraph link visible in docs/devel/index
>> - qgraph linked as text link in qtree
> 
> Makes sense.  Did you also try increasing the maxdepth?

Yes, it does not change much on the qgraph side. By default, with this 
depth a simple toctree with qgraph would be already visible in both indexes.

As I see it, qgraph is a "subsection" of qtest, not a separate entry in 
docs/index, that is why I am hiding it.

I will go ahead and submit the patch for the sphinx documentation.
As you suggested, better qraph examples and explanations will follow in 
a separate serie.

Thank you,
Emanuele


