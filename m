Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6659135A2B2
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:08:46 +0200 (CEST)
Received: from localhost ([::1]:56822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUtgb-0004wB-D7
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lUtZi-00072o-3a
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:01:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lUtZX-000587-H2
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:01:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617984082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DWN1/wKxQEb3rjVmIaGxyZpJ4Tk5xQzJPsWLmKqdh9s=;
 b=RFxJNmUvcfyE6MgfmJpSAVrXbigC2In6KqLUf6yozXCtvN2UmeX/80pamDuHA1PLKwWRPL
 JwLZlRa1h2/JcwdhTrIdYVWBAZwYCJGU1l6ISBgkoCB3lmAKa+v02oRQ8wktlUyq6hsg9g
 qPdpMjHUw3d71AGMnAPo4C+1el5qDPM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-9q-Z9cVbN56PL4krQS6QqA-1; Fri, 09 Apr 2021 12:01:19 -0400
X-MC-Unique: 9q-Z9cVbN56PL4krQS6QqA-1
Received: by mail-wr1-f72.google.com with SMTP id r12so1663229wrw.18
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 09:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DWN1/wKxQEb3rjVmIaGxyZpJ4Tk5xQzJPsWLmKqdh9s=;
 b=jfRpGNPK/RV79FhHzh8thAjSEntkOCISnvYYncMQWY4OXzXkQs0aejJ65GjKefh4Ym
 aMeClTkDAykPWXxM5/DWvTQbef83tAu0lwDNk/984SQXwv0lW8OGAZxgIcaWKrr4Ok0f
 cDbw7pGCaqIyV0DckDe5UXYIVGWHnY+HEc5Q5AR8ebA+ElLFNRAU9od5WY/QThuwBjMV
 9qVXOQ1/DrM4vfLZKJg4dYWXwNx/eri30YoPxPYJzR/Gp+q2jX1PE0q0382XDtSDZTiN
 /ic0BT0ObPoNU3s4Sjrjcaqz1SzCu4TdyPKgZb8GmLlqJaUak6RPjcw3fPZDN+v9e/83
 XCaA==
X-Gm-Message-State: AOAM533l7ay2mauS2qH+dfIYaTRofRx5fPT35V4w6z1GiLuvd+qM2RaD
 pBIQy//p7ZHPtcHJyMMlQYu957oxv4EiRANB7XHHRQz21+qI1UkCbIopMNs7FiC/WV8NocUzXVg
 8+ZrBZw2vLaZHujpB019LhU6a+ARug6HskmnUN53zqSZIU3Ghgwv5EMRA5ny7QAV7ehU=
X-Received: by 2002:a05:600c:ac2:: with SMTP id
 c2mr14989172wmr.23.1617984077195; 
 Fri, 09 Apr 2021 09:01:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHzBu5GKJ1s2ZxO691s5QhO6aDhVOyu3vdBQ7MeXj+yhukEqIQGvTlxCyyA29T0c7dfxMbvw==
X-Received: by 2002:a05:600c:ac2:: with SMTP id
 c2mr14989153wmr.23.1617984076981; 
 Fri, 09 Apr 2021 09:01:16 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.173])
 by smtp.gmail.com with ESMTPSA id a3sm5475862wru.40.2021.04.09.09.01.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 09:01:16 -0700 (PDT)
Subject: Re: [RFC PATCH v2 01/11] python: qemu: add timer parameter for
 qmp.accept socket
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
References: <20210407135021.48330-1-eesposit@redhat.com>
 <20210407135021.48330-2-eesposit@redhat.com>
 <008d696c-a4d4-c5e6-707d-792759b3ce5b@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <b4a5fcd4-e3dc-ad54-4670-eb9d5650cda1@redhat.com>
Date: Fri, 9 Apr 2021 18:01:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <008d696c-a4d4-c5e6-707d-792759b3ce5b@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


>> --- a/python/qemu/qtest.py
>> +++ b/python/qemu/qtest.py
>> @@ -138,9 +138,9 @@ def _pre_launch(self) -> None:
>>           super()._pre_launch()
>>           self._qtest = QEMUQtestProtocol(self._qtest_path, server=True)
>> -    def _post_launch(self) -> None:
>> +    def _post_launch(self, timer) -> None:
>>           assert self._qtest is not None
>> -        super()._post_launch()
>> +        super()._post_launch(timer)
>>           self._qtest.accept()
>>       def _post_shutdown(self) -> None:
>>
> 
> Are you forgetting to change _launch() to provide some default value for 
> what timer needs to be?
> 
> I think for the "event" callbacks here, I'd prefer configuring the 
> behavior as a property instead of passing it around as a parameter.

I agree, I changed it in a field of the QEMUMachine class called 
_qmp_timer that defaults to 15 seconds.

Emanuele


