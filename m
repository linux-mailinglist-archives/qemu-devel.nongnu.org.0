Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E231F3B48C7
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 20:28:58 +0200 (CEST)
Received: from localhost ([::1]:46798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwqZV-0002VQ-VM
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 14:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwqXi-0008EK-FJ
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:27:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwqXg-0001F1-0m
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:27:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624645623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H1NnpCfJmYy59Sm/Rs/6HZ9OLsnX8EHsZfs9haOwlq0=;
 b=SxxcyMonW4/l5SY3OUGBTD/1kwFraqqjVfp3tvoQVebgJhIoSeCFz9xpd2TuvvnrfQRuxi
 boGrJnvTc/KAj7G+fRK9skJCC/lhG7NvkThlU5J/zdLrHHXThIgqqsDklMY/j98/7909Ul
 Ia+Qe0idADn6gpv6zWJ+v4TfG9kgiqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-pNxtGWN6M_-fIjaXGUKUzw-1; Fri, 25 Jun 2021 14:27:02 -0400
X-MC-Unique: pNxtGWN6M_-fIjaXGUKUzw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 137BF100C68C;
 Fri, 25 Jun 2021 18:27:01 +0000 (UTC)
Received: from [10.10.118.71] (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E917F5D9F0;
 Fri, 25 Jun 2021 18:26:55 +0000 (UTC)
Subject: Re: [PATCH 04/11] python: README.rst touchups
To: Willian Rampazzo <wrampazz@redhat.com>
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-5-jsnow@redhat.com>
 <CAKJDGDYX1t+yTGNYj0JJpJkyfYUsXLUJjovzj--mLO05Re9PyQ@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <eaa99259-61f8-a6e9-f536-87e68066fbc6@redhat.com>
Date: Fri, 25 Jun 2021 14:26:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAKJDGDYX1t+yTGNYj0JJpJkyfYUsXLUJjovzj--mLO05Re9PyQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/25/21 2:23 PM, Willian Rampazzo wrote:
> On Fri, Jun 25, 2021 at 12:46 PM John Snow <jsnow@redhat.com> wrote:
>>
>> Clarifying a few points; removing the reference to 'setuptools' because
>> it referenced anywhere else in this document and doesn't really provide
      ^ isn't

Noticed the typo when adding your RB.

>> any useful information to a Python newcomer.
>>
>> Adjusting the language elsewhere to be less ambiguous and have fewer
>> run-on sentences.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   python/README.rst | 17 +++++++++--------
>>   1 file changed, 9 insertions(+), 8 deletions(-)
>>
> 
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> 

Thanks! I hope the new packaging has been (or will be?) helpful to 
avocado folks.

--js


