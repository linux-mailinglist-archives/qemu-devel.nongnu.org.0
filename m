Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 330C433AEE9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 10:36:19 +0100 (CET)
Received: from localhost ([::1]:56370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLje6-0007Vq-8c
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 05:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLjQY-0007yV-IO
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:22:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLjQW-0003L9-Ne
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:22:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615800133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LlYH7s5wi1t10mp1VglSAtOxhgvq7BQFgUHlTqCvGDU=;
 b=N0bf2x9duav7+qGO4gqsUZs/WBVovidynY1XxpAE8x5Y8wV9Ui6lL889LflEiyyVepP1QJ
 TcSwOnqOnfZaf1DHV1ZtCBzB1BUuXQYzDrcAYYo4IymvoRg/67pZbOLSljoWul8uUYuxYl
 gnqc9rXl7Etjl7ehmadQBgnhZmzbuxo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-cEnGUIQnPteIViqWrM7xjg-1; Mon, 15 Mar 2021 05:22:11 -0400
X-MC-Unique: cEnGUIQnPteIViqWrM7xjg-1
Received: by mail-wr1-f70.google.com with SMTP id 75so14708085wrl.3
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 02:22:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LlYH7s5wi1t10mp1VglSAtOxhgvq7BQFgUHlTqCvGDU=;
 b=jAg9f3GcnU+9Yrv6oiZB8I2ztXnqXea18aRAZgOL0mFJb0G55hn4H2v8K1YgyT5r2z
 s1rthVmWoSbcoSR+tmdBi1r4K08xWhbzTSlcgmoYkzqxlKAhNlMEiqCL3EVyO/G0dA3/
 PAj4oIWNJSZj6WZEAgMOPcvPAQ7KCzAnaFDyRHk3iewQVcatigpxqgYzyuKluF30gfN3
 58CxNrDqaPf/6kaDEChWGCrhTc3PDlblNcs2HHJs2J01RKbdtHOr71aaHFU8mlqmMEW8
 Eo2ThxSO4zxHqPG90wZ7aJBNRvbPS6xuOa1hzSLrX/Eb33UjQOLr1Bz5wpEjHTpUWK8m
 DhUw==
X-Gm-Message-State: AOAM533Gq3qNRES+42gJvpKMwe0txLzHB3cmKDt36xpamrZ+J8SK0PqX
 VZ1YB4JSGrjw0GAYAGRb3zNSGyyz/A6ZrlfZBLmc3/jGWHuou7ur6HD9mD754DBcEUaZOd64+M2
 S2rl0CQ1vmEhPGReiTQSqu5BNnd5qjpKWlSlBRNOeaYYcNBQgiY34V5GkADLISS5v
X-Received: by 2002:a5d:4d0f:: with SMTP id z15mr26639827wrt.192.1615800130506; 
 Mon, 15 Mar 2021 02:22:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCFBDg/k0UquUruXKIw6keNrJ8Ta8m8hf1IQxAUdln5Ukdq1Ig5rh/bv5Z8164/flF6cTt+g==
X-Received: by 2002:a5d:4d0f:: with SMTP id z15mr26639803wrt.192.1615800130252; 
 Mon, 15 Mar 2021 02:22:10 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id a3sm17440365wrt.68.2021.03.15.02.22.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 02:22:09 -0700 (PDT)
Subject: Re: [PATCH v2 02/13] net: Add a 'do_not_pad" to NetClientState
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210315075718.5402-1-bmeng.cn@gmail.com>
 <20210315075718.5402-3-bmeng.cn@gmail.com>
 <4093c094-ed8c-d8c4-09b7-4bad19529ec6@redhat.com>
 <2884879b-d645-324b-e90c-95fd59b66daa@redhat.com>
Message-ID: <f6f4f095-2a69-5fcd-64c4-38115a35c09b@redhat.com>
Date: Mon, 15 Mar 2021 10:22:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <2884879b-d645-324b-e90c-95fd59b66daa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

On 3/15/21 10:18 AM, Philippe Mathieu-Daudé wrote:
> On 3/15/21 10:17 AM, Philippe Mathieu-Daudé wrote:
>> On 3/15/21 8:57 AM, Bin Meng wrote:
>>> This adds a flag in NetClientState, so that a net client can tell
>>> its peer that the packets do not need to be padded to the minimum
>>> size of an Ethernet frame (60 bytes) before sending to it.
>>>
>>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>>> ---
>>>
>>>  include/net/net.h | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/include/net/net.h b/include/net/net.h
>>> index 919facaad2..6fab1f83f5 100644
>>> --- a/include/net/net.h
>>> +++ b/include/net/net.h
>>> @@ -100,6 +100,7 @@ struct NetClientState {
>>>      int vring_enable;
>>>      int vnet_hdr_len;
>>>      bool is_netdev;
>>> +    bool do_not_pad;

Maybe 'do_not_pad_to_min_eth_frame_len' to avoid
wondering what padding is it.

>>>      QTAILQ_HEAD(, NetFilterState) filters;
>>>  };
>>
>> This is a bit pointless without the next patch, why
>> not squash it there?
> 
> Ah one is SLiRP and the other is tap. OK then.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 


