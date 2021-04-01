Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 706863511D1
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 11:20:43 +0200 (CEST)
Received: from localhost ([::1]:34630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRtVK-00057c-Hq
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 05:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRtTk-0004TD-9k
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 05:19:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRtTg-0004Zs-Fp
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 05:19:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617268739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pJe+4weyqNrEWoATUfV9Wd7iGjwVMuQqwxR8NVD9a5E=;
 b=eKlpR0h3KBqhndcDa6CHXt4KU/0SUTzsx+8GKzrBcNoQC5RZChHciOg9d7Eo4rTkuliDMu
 g0kAHC3jLqPtx8245AnaVh8NUopzo5xEIQEFww2u4IcsQ6DnYidTYSW+ODVDFKrj2IFsFu
 CBmnhO11rHz2C7LWCBnBuhhS48ey7WI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-4eaRKN7TPUizuyaatMHmVA-1; Thu, 01 Apr 2021 05:18:56 -0400
X-MC-Unique: 4eaRKN7TPUizuyaatMHmVA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 690CE107ACCD;
 Thu,  1 Apr 2021 09:18:55 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-53.ams2.redhat.com [10.36.112.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD70110016DB;
 Thu,  1 Apr 2021 09:18:50 +0000 (UTC)
Subject: Re: [PATCH] MAINTAINERS: replace Huawei's email to personal one
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, "mst@redhat.com" <mst@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1615462144-10864-1-git-send-email-gengdongjiu1@gmail.com>
 <F8970EB7-4D0F-43B1-AACD-B161F505C6EC@gmail.com>
 <8db12aca-e7c4-0c76-743d-1297eedb71a1@redhat.com>
 <d62a1ffe-4329-f6a8-d334-42afe5b9daf8@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8cc0affe-5ded-f25a-50e2-1592d0a8949e@redhat.com>
Date: Thu, 1 Apr 2021 11:18:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <d62a1ffe-4329-f6a8-d334-42afe5b9daf8@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/04/2021 09.58, Philippe Mathieu-Daudé wrote:
> On 4/1/21 8:34 AM, Thomas Huth wrote:
>> On 23/03/2021 05.04, Dongjiu Geng wrote:
>>> ping...
>>>
>>> sorry for the noise.
>>> On 3/11/2021 19:29，Dongjiu Geng<gengdongjiu1@gmail.com>
>>> <mailto:gengdongjiu1@gmail.com> wrote：
>>>
>>>      In order to conveniently receive email, replace the Huawei
>>>      email address with my personal one.
>>>
>>>      Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
>>>      ---
>>>      MAINTAINERS | 2 +-
>>>      1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>>      diff --git a/MAINTAINERS b/MAINTAINERS
>>>      index e04ae21..823b98b 100644
>>>      --- a/MAINTAINERS
>>>      +++ b/MAINTAINERS
>>>      @@ -1711,7 +1711,7 @@ F: tests/qtest/acpi-utils.[hc]
>>>      F: tests/data/acpi/
>>>
>>>      ACPI/HEST/GHES
>>>      -R: Dongjiu Geng <gengdongjiu@huawei.com>
>>>      +R: Dongjiu Geng <gengdongjiu1@gmail.com>
> 
> We prefer the mail to be sent/signed by the listed address,
> and acked by the updated address. But we should have tell
> you that earlier, when you still had access to your mail.

I've put the gengdongjiu@huawei.com on CC:, just to make sure, but it was 
bouncing already.

>>>      R: Xiang Zheng <zhengxiang9@huawei.com>
>>>      L: qemu-arm@nongnu.org
>>>      S: Maintained
>>
>> I'm currently assembling a pull-request that contains some other updates
>> to MAINTAINERS, too. I'll add your patch there.
> 
> A pair of candidates:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg790977.html

Yes, I've queued them.

  Thomas


