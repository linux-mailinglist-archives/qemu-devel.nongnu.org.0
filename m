Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C1439FB03
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 17:40:54 +0200 (CEST)
Received: from localhost ([::1]:47398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqdqX-0001HX-A0
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 11:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqdm3-0002Pg-Cg
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:36:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqdlz-0000o1-1J
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:36:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623166568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+lRB7po5tcVn4f9KYWwl4QQJ7HgFM1NIf+AFIwAvD+w=;
 b=jTmuaTvU1RiTX8q9zN67v3wWrnbMybQQlOhhBevdPAX/EUUFGkqM/cjVnoFQjjFUav4SN5
 HmR8C8Zd+uy0lh/yU3c7wRMSWGzz9PQbcV8R64UUox7mnQJ7F/xZLT5MTKUpQu3NAaO2jf
 zkHvYsK+lafOCIGbYBuSBM9TQen7kr4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-ynNat_p8N7CAl3fqjjFTMQ-1; Tue, 08 Jun 2021 11:36:04 -0400
X-MC-Unique: ynNat_p8N7CAl3fqjjFTMQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 232368015C6;
 Tue,  8 Jun 2021 15:36:02 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3780F5C1C2;
 Tue,  8 Jun 2021 15:36:01 +0000 (UTC)
Subject: Re: [PATCH v16 96/99] tests/qtest: split the cdrom-test into
 arm/aarch64
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Richard Henderson <richard.henderson@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-97-alex.bennee@linaro.org>
 <fdb8ac5d-e6c6-0e13-e8df-f1e3e022c98d@linaro.org> <87im2ol8xu.fsf@linaro.org>
 <3cef0694-0c9c-e0d8-2c30-86dc6978db4d@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <067a2f68-1520-29be-6463-9a27a12a96ce@redhat.com>
Date: Tue, 8 Jun 2021 11:36:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <3cef0694-0c9c-e0d8-2c30-86dc6978db4d@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 "open list:IDE" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/21 11:01 AM, Thomas Huth wrote:
> On 08/06/2021 16.27, Alex Bennée wrote:
>>
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>
>>> On 6/4/21 8:53 AM, Alex Bennée wrote:
>>>> The assumption that the qemu-system-aarch64 image can run all 32 bit
>>>> machines is about to be broken...
>>>
>>> Um, what?
>>
>> Really what we want is to probe the -M (machines) that a binary
>> supports rather than just barfing the test because we've built a QEMU
>> that doesn't support all the random 32 bit machines.
>>
>>> r~
>>>
>>>
>>>
>>>   and besides it's not likely this is
>>>> improving out coverage by much. Test the "virt" machine for both arm
>>>> and aarch64 as it can be used by either architecture.
>>
>> I think this point still stands though, I don't think we get much from
>> running the cdrom test with realview et all on qemu-system-aarch64.
> 
> In a lot of CI pipelines, we are either building aarch64 or arm, but not 
> both, so I think it might be good to keep the tests in here.
> 
>   Thomas
> 

I'm deferring to Thomas on this -- it has just a little bit less to do 
with the CDROM itself and more to do with machine configuration, which I 
consider outside of my wheelhouse here.

--js


