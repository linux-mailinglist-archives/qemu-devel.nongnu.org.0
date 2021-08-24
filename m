Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5613F59E5
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:36:33 +0200 (CEST)
Received: from localhost ([::1]:42802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIRv6-0006dh-3y
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:36:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIRu2-0004iz-8d
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 04:35:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIRtx-0004T6-NY
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 04:35:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629794119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PP29Y13EYfY3/aET1Btb5D/X3ir6rULWR58snVp5WqM=;
 b=VIl8fwaFMU+Y/LVnLkZVg0ukQdoxAMRi0lc251hYU9OH4Fbe0qsqtfaVlB1dHq9zMhNxa0
 Ipi5ozxEnK/+3mD9VVlCHU9tdonBmeXNbHLOOO2vHE084sNrsc+7uwn26IYUFWXtWrhdBT
 ryCl0lONEbgWJFyHt7iObhS7AVwDiTE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-KOHVUEvFMMe2M22SC5QRhg-1; Tue, 24 Aug 2021 04:35:18 -0400
X-MC-Unique: KOHVUEvFMMe2M22SC5QRhg-1
Received: by mail-wm1-f71.google.com with SMTP id
 201-20020a1c01d2000000b002e72ba822dcso924566wmb.6
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 01:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PP29Y13EYfY3/aET1Btb5D/X3ir6rULWR58snVp5WqM=;
 b=A0J+Z5vXyp/ZMlCwgN8ohy9j998E5a8s5mW4g3U88AWTdqNCX0OgBNQ/8yyclUCoBC
 oGvY+T5P2T7h6Cy511il8ymq3HNF7Np0kkWvhA+xymT9cwjLfIJZcK1iltUWUqVqwK3u
 tFLy16VnutqYMTTDALKA32sTa3XD6z/KWLkdCXKgSw/oodlXq65xmiPXB0mHfaJgNluV
 NMhtxBf44Z/IezCi7Wfppv9VIaY9ZxNmvW4i2tLynheOHytQ1NxqqZBFgIYG+GGxircX
 ZQGk+kFdNaws/ihUqtNwoXvenchJWhCJrwxFRa/mGKTWH+6PK7iGe5eovFROuQvPWUee
 QCWA==
X-Gm-Message-State: AOAM532J7juSL6r8rwuex5rBAZloJvBfEQCN5i/BNF5ciPYhCFIrcBCI
 xElSdqa+5tbVLZEq5NM6q2OHtVF0+7uxpGtT8ZtByxo+5NT1cxZSt3cWf+kU46XMDEVOYTXC3G1
 fPHuBgJ4FDvu1g6g=
X-Received: by 2002:a5d:6352:: with SMTP id b18mr17870086wrw.116.1629794117523; 
 Tue, 24 Aug 2021 01:35:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLC1rY8lLcar0bLEqJySiOElgpETPoCWbJa/5Dx/cFu5V8lzQwXwxBD69qiZSy15dtjECJnQ==
X-Received: by 2002:a5d:6352:: with SMTP id b18mr17870058wrw.116.1629794117300; 
 Tue, 24 Aug 2021 01:35:17 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id z17sm17210171wrr.66.2021.08.24.01.35.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 01:35:16 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] hw/usb/hcd-xhci-pci: Abort if setting link
 property failed
To: Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20210819171547.2879725-1-philmd@redhat.com>
 <20210819171547.2879725-3-philmd@redhat.com>
 <20210823183414.hmu4ly2y5zkbw3mg@habkost.net>
 <87ilzvntu1.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <eb59236e-bd14-5916-0ffc-ea0fce0db00b@redhat.com>
Date: Tue, 24 Aug 2021 10:35:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87ilzvntu1.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/21 10:13 AM, Markus Armbruster wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
>> +Markus
>>
>> On Thu, Aug 19, 2021 at 07:15:46PM +0200, Philippe Mathieu-Daudé wrote:
>>> Do not ignore eventual error if we failed at setting the 'host'
>>> property of the TYPE_XHCI model.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>>  hw/usb/hcd-xhci-pci.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
>>> index e934b1a5b1f..71f6629ccde 100644
>>> --- a/hw/usb/hcd-xhci-pci.c
>>> +++ b/hw/usb/hcd-xhci-pci.c
>>> @@ -115,7 +115,7 @@ static void usb_xhci_pci_realize(struct PCIDevice *dev, Error **errp)
>>>      dev->config[PCI_CACHE_LINE_SIZE] = 0x10;
>>>      dev->config[0x60] = 0x30; /* release number */
>>>  
>>> -    object_property_set_link(OBJECT(&s->xhci), "host", OBJECT(s), NULL);
>>> +    object_property_set_link(OBJECT(&s->xhci), "host", OBJECT(s), &error_fatal);
>>
>> If this fails, it's due to programmer error, isn't?  Shouldn't we
>> use &error_abort on that case?
> 
> I think so.
> 
> In functions with an Error **errp parameter, use of &error_fatal is
> almost always wrong.

OK, thanks!


