Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 385F03DEA0D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 11:52:48 +0200 (CEST)
Received: from localhost ([::1]:49526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAr6N-0005bb-8N
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 05:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mAr5Q-0004fd-9w
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 05:51:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mAr5N-0004qu-En
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 05:51:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627984303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4NEoIVJPP9n93IRkrc+FS25uGFV/wHybkCwy4d4Qt7g=;
 b=f0Yk+oOddxQJhCXd0zJhL4yBj2AS83SoEK1svjV0/QxHwjS3+Amg3paAjOXhgO4jy0qYnh
 DN8xM/X15TX4ugX9kHHdFSWaVr3YUCffp3OzCaiEkvtOdxckMoW3TXtvcDaZbHCxIAigR3
 aykD7Io5nAhVy7h6wyCbgxUcClENqEQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-hw8i_TK1MVWniIln9F5WUA-1; Tue, 03 Aug 2021 05:51:42 -0400
X-MC-Unique: hw8i_TK1MVWniIln9F5WUA-1
Received: by mail-wr1-f71.google.com with SMTP id
 s22-20020adf97960000b02901535eae4100so7385746wrb.14
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 02:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4NEoIVJPP9n93IRkrc+FS25uGFV/wHybkCwy4d4Qt7g=;
 b=pc5xQa0MyryLASFzxCl42NmOx/6BhBX9gofj9sWjaME5DkTjCCXZ3FT30C/ePzI+N+
 nWnQ/L63z5D88ngHewbIYd4XbI5FpoBvMuq/qc3QzPyl+jCDWIBT/7HpJzwZHblxO8D9
 HyEDPdN5t1AOwwY/WujP8tEObKbM4Ilj+kCAWVblFyC4iO1Dx7NpsLaseG1gRLwK8AD2
 ywHQRhhixntjlsnU9qqzV6MEw8K8dxEuhKnz8FhXyhJdn9tb180X15yjFUM/rPIVKnUr
 Z0bJEZFZadwCYS9rk8SzvG3df+pJ46JkZXq43brMkoupfWjd9JoM1b6tfS31VYLlOZhg
 wJsQ==
X-Gm-Message-State: AOAM533YRhFsG0prXP26HZq86pHq4bMO+aMpSIv3Vxb3TNddyS+QF7it
 8/5KpXQBddzzIfeGicUXwhwUQixjNvGReTL3BDyzh4ffkqvnDN9IUseohzuWPB5mVxJd+JgErB+
 w8N5luXUQjyjZMzQ=
X-Received: by 2002:a1c:9851:: with SMTP id a78mr3366927wme.123.1627984301132; 
 Tue, 03 Aug 2021 02:51:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNTYwo39J8/wnZxuwS/Tt+MUGA+S/b6TLxUfrQKtoaFTTihW6L3nHcxwSci/vl0Oc3exep7g==
X-Received: by 2002:a1c:9851:: with SMTP id a78mr3366905wme.123.1627984300866; 
 Tue, 03 Aug 2021 02:51:40 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id u2sm12467729wmc.42.2021.08.03.02.51.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 02:51:40 -0700 (PDT)
Subject: Re: [PATCH] hw/net: Discard overly fragmented packets
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>
References: <20210705084011.814175-1-philmd@redhat.com>
 <adb810ea-a4f3-3ff9-3f4b-9973c3e1f518@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <40744707-c9ab-a7c2-c509-6d0275a69114@redhat.com>
Date: Tue, 3 Aug 2021 11:51:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <adb810ea-a4f3-3ff9-3f4b-9973c3e1f518@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-stable@nongnu.org,
 Li Qiang <liq3ea@gmail.com>, Andrew Melnychenko <andrew@daynix.com>,
 Prasad J Pandit <ppandit@redhat.com>, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/3/21 11:33 AM, Thomas Huth wrote:
> On 05/07/2021 10.40, Philippe Mathieu-Daudé wrote:
>> Our infrastructure can handle fragmented packets up to
>> NET_MAX_FRAG_SG_LIST (64) pieces. This hard limit has
>> been proven enough in production for years. If it is
>> reached, it is likely an evil crafted packet. Discard it.
>>
>> Include the qtest reproducer provided by Alexander Bulekov:
>>
>>    $ make check-qtest-i386
>>    ...
>>    Running test qtest-i386/fuzz-vmxnet3-test
>>    qemu-system-i386: net/eth.c:334: void
>> eth_setup_ip4_fragmentation(const void *, size_t, void *, size_t,
>> size_t, size_t, _Bool):
>>    Assertion `frag_offset % IP_FRAG_UNIT_SIZE == 0' failed.
>>
>> Cc: qemu-stable@nongnu.org
>> Reported-by: OSS-Fuzz (Issue 35799)
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/460
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   hw/net/net_tx_pkt.c             |   8 ++
>>   tests/qtest/fuzz-vmxnet3-test.c | 195 ++++++++++++++++++++++++++++++++
>>   MAINTAINERS                     |   1 +
>>   tests/qtest/meson.build         |   1 +
>>   4 files changed, 205 insertions(+)
>>   create mode 100644 tests/qtest/fuzz-vmxnet3-test.c
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> Jason, I think this would even still qualify for QEMU v6.1 ?

Yes, easy one for 6.1.


