Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CEA39A198
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 14:54:04 +0200 (CEST)
Received: from localhost ([::1]:38696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lomrL-0003qg-I3
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 08:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lomqN-0002QM-Gl
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 08:53:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lomqG-0002in-Uy
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 08:53:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622724776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y7PuQPI8nN1y8AZoq4Dl9plPUahwL5w4DnSjtsFfKsU=;
 b=PyubOOQs4CGIJ2yehDJJ5i4IbO199sPhSmM7hFeB2nmTNLJj4GYzmluK5aR49gb4pncNFu
 7CO+A5ZtWkalLoRZkg/SH/EVgI8QNyMjb0B+qn3xS48oYRx+72gXgZBQGexvbIUS/6pSgx
 t4WkNXp5vxvzAjtlf4RF13XRMlOJSO8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-egaIdO4hNO-lWr1joF6yQg-1; Thu, 03 Jun 2021 08:52:53 -0400
X-MC-Unique: egaIdO4hNO-lWr1joF6yQg-1
Received: by mail-wr1-f69.google.com with SMTP id
 x9-20020a5d49090000b0290118d8746e06so2415876wrq.10
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 05:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y7PuQPI8nN1y8AZoq4Dl9plPUahwL5w4DnSjtsFfKsU=;
 b=o7lLQ/XzpnN9OCnmHwReFwtRMOV5Q+ACWzuxMLYlWL37GM5m/7Y7KTyIxDQLaP9Zkw
 7jGA1bp1AFC63uG5+xA2yH6Uit8ABRt2lJWPrAAidOLLLjWo1OpA0xARBssSYpqNR8NV
 qp6dMqlnVYau7tp0uQhIku6HUdLBWV17caZPZTVMETaMYvtVgdq+ZDh1hBhKBBYXSjFM
 tDlSYb2CQeA0iL6zou9wTxOX0iLaLY5nQs4q1zFVZP8mbG5wtffOPP4IekJzfAHj+vYm
 S40m2GU7pHdemwe6RQXNR78ase/E4cmOQ5lmI32WpCrzD7P+ZziuRyWJvlXiHqFdF7xZ
 r1mA==
X-Gm-Message-State: AOAM53388TV73iw0h9IF4xTPv244QC58fofFyLabfNQ0oNbcL12iEYwT
 DhYp5v4X6HqS06mDIPuhHQKBHop0NLYIyJm/5senHSQLP7v8UeTBBzKr+CYeWWy+PEu536hBUBO
 c9pkmqcWpZK2WA+w=
X-Received: by 2002:a7b:c20d:: with SMTP id x13mr7410722wmi.49.1622724772556; 
 Thu, 03 Jun 2021 05:52:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylTSWUOzozzGAlFi1Ncj3l0aZm2hUOXaekyN8ZhXWvW09b3HvSn5cj3JKL5WvTJOxV1vRkDQ==
X-Received: by 2002:a7b:c20d:: with SMTP id x13mr7410690wmi.49.1622724772297; 
 Thu, 03 Jun 2021 05:52:52 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 o6sm3748789wre.73.2021.06.03.05.52.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 05:52:51 -0700 (PDT)
Subject: Re: [PATCH v4 05/15] qemu-iotests: delay QMP socket timers
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-6-eesposit@redhat.com>
 <5bde3128-e972-3653-308b-4faa4eb52bb6@virtuozzo.com>
 <bbf2c63d-662b-541e-6a65-1419f650e066@redhat.com>
 <1570614c-7c0e-694e-b5fd-d7814da88964@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <973eca91-8b54-1655-3ed7-3513e0f6a13c@redhat.com>
Date: Thu, 3 Jun 2021 14:52:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1570614c-7c0e-694e-b5fd-d7814da88964@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 03/06/2021 14:25, Vladimir Sementsov-Ogievskiy wrote:
> 03.06.2021 14:03, Emanuele Giuseppe Esposito wrote:
>>
>>>
>>> So, you just make the class do nothing.. I'd prefer something like this:
>>>
>>> @contextmanager
>>> def NoTimeout:
>>>     yield
>>>
>>> if qemu_gdb:
>>>    Timeout = NoTimeout
>>
>> I am not sure I understand what you want to do here.
>> I have a basic understanding of @contextmanager, but can you explain 
>> more what you want to do?
> 
> With qemu_gdb you make the class do absolutely nothing. So, it's just 
> provides an interface of context manager, but does nothing.
> 
>>> @contextmanager
>>> def NoTimeout:
>>>     yield
> 
> is the same thing: it's context manager, so you can do
> 
> with NoTimeout():
>    ....
> 
> but that context manager does absolutely nothing.
> 
> 
> @contextmanager gives you a simple way to create a context manager. You 
> define a function which has yield point. So, everything before yield is  
> __enter__, everything after yield is __exit__. And you can return a 
> value by yield, it will be a return value of __enter__.
> 
> 
> So, what I meant: keep Timeout class as is and just add code that I 
> suggested after it.

Oh okay. I didn't know Timeout = NoTimeout was possible (and I didn't 
know where to put it anyways). Looks cleaner than the normal ifs, will 
apply this change and send v5.

Thank you,
Emanuele


