Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 257E9399C41
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:07:29 +0200 (CEST)
Received: from localhost ([::1]:60422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loiNz-0007RG-N5
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1loiN8-0006b0-SS
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 04:06:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1loiN6-0005zm-DU
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 04:06:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622707591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2CJbSTh8POxmdS/TMrB99mO+3zWUE8iri6WrcVrNREA=;
 b=iHcwPlL+GaWEMIXymJU9MUeztTRyCRfSuMXtrwJQjnwzt4s95PrXuonqdUKraMw6ImJSDh
 UGbBRrMVIGhsOMyeDAHZ6a80AJVmX/1o8d8PB8hAN4XVSJ0cMYVwQgOq/wvn56YjG2csx6
 K4beQhNOmSMIoBPVtcdehfCX5cxyayc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-nDT2G7dhM4eadms4dGDbDw-1; Thu, 03 Jun 2021 04:06:29 -0400
X-MC-Unique: nDT2G7dhM4eadms4dGDbDw-1
Received: by mail-ed1-f69.google.com with SMTP id
 c12-20020aa7d60c0000b029038fccdf4390so2865625edr.9
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 01:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2CJbSTh8POxmdS/TMrB99mO+3zWUE8iri6WrcVrNREA=;
 b=Jcf5bGyHVH1S4OZNfoG0Zy07w2YaIQjcCG1umLtR1dxYjYC+zNm6uF4db/2AykgQMl
 ENgmGWGgAqDfYBwv9AAzZe7yzIsqnIq4iAWKKpIVjQguRb3xbH+3Pl9nC3IDOnFgd5mn
 Gl62fTTSgLlwR8OifiG9sWsRPkz0xRuzjTdBg5zkxXjbhMbjDlU4vX/31Uxad/myYEp6
 XeSs+MYRTHL7+bI/d8BRwkUi2TKHD4eEXJ4ieIJSPHQP7PkHmrIp3EHCOMuA3/eMVZW8
 DVHGAKOCRwkM4as3YrhhSFuJdx/YibY4HDr9yc/iRkyb7dyLyO/NgoVcrTu4zZuUtpdA
 QLNA==
X-Gm-Message-State: AOAM532jTENA7s+tYXMP7q7NWigdM89C7heMiusaQ5jPNWaG1HizRI98
 2K8YaFzGhTWEh+eeyv00uzq9KNNXa8GymbL1C7sppmg45PsoHaKZzPcpNp/pcKkbvB2l3KgM8jd
 08TWK5WViiJ680kiBU14U+8oZOtS9LTbqTA0NMUT4U3G2aOyY1w5MKOICaiadYuQCAWo=
X-Received: by 2002:a17:906:b4b:: with SMTP id
 v11mr15159036ejg.359.1622707587620; 
 Thu, 03 Jun 2021 01:06:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxchn1Rmu9mHxnsfbxpBdMd+241uBTvydT/w12oKhmpCRXWQN+U5Znovc9GGqopCHUbQAl9Xw==
X-Received: by 2002:a17:906:b4b:: with SMTP id
 v11mr15158997ejg.359.1622707587292; 
 Thu, 03 Jun 2021 01:06:27 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 v23sm1348423eds.25.2021.06.03.01.06.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 01:06:26 -0700 (PDT)
Subject: Re: [PATCH v4 01/15] python: qemu: add timer parameter for qmp.accept
 socket
To: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-2-eesposit@redhat.com>
 <dd207fcf-f31c-d580-4877-72f017846ae7@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <5b53f903-1a11-7dec-fe4c-6dc16c066056@redhat.com>
Date: Thu, 3 Jun 2021 10:06:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <dd207fcf-f31c-d580-4877-72f017846ae7@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 03/06/2021 01:23, John Snow wrote:
> On 5/20/21 3:52 AM, Emanuele Giuseppe Esposito wrote:
>> Alsp add a new _qmp_timer field to the QEMUMachine class.
>>
>> Let's change the default socket timeout to None, so that if
>> a subclass needs to add a timer, it can be done by modifying
>> this private field.
>>
>> At the same time, restore the timer to be 15 seconds in iotests.py, to
>> give an upper bound to qemu-iotests execution.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> 
> Hi Emanuele: I'm sorry, but with the recent Python PR this no longer 
> applies to origin/master -- the python files got shuffled around a bit 
> when I added the new CI tests.
> 
> May I please ask you to rebase? You don't have to re-spin just yet, just 
> pointing me to the rebase would help me out.

Hi John, no problem. I rebased here:
https://gitlab.com/eesposit/qemu/-/commits/qemu_iotests_io

Let me know if I need to do anything else.
I will re-spin later today.

Thank you,
Emanuele


