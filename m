Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 711453F5A5F
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 11:02:37 +0200 (CEST)
Received: from localhost ([::1]:44398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISKK-0006UT-25
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 05:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIS4k-00026P-Ef
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 04:46:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIS4h-0003Xv-C4
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 04:46:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629794785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=45BePwngXZYErL6CRubm7YDG3Rf1bEEBpDuelAhtexo=;
 b=T/RJVeALZpYEBvkBP0stUTcxo6/350mnKRwxkuvQNbssl1qg5i9t/O8P/H6vDWoG/uv5Ou
 32HmsnqwOb+jniYzhyOQ/Jx4aWq5GVTH4Is9DkVxSZAnP/6FCmsyLNJRY6hSTISXYYHaoM
 li719OIAgtXS1Haz3U5i7lnJmWT6Bws=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-33DiVJW-PJKSqrONkYS0Zg-1; Tue, 24 Aug 2021 04:46:24 -0400
X-MC-Unique: 33DiVJW-PJKSqrONkYS0Zg-1
Received: by mail-wr1-f72.google.com with SMTP id
 d12-20020a056000186cb02901548bff164dso5549131wri.18
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 01:46:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=45BePwngXZYErL6CRubm7YDG3Rf1bEEBpDuelAhtexo=;
 b=aN1fRiVrSL/tEaRVaD2B6yjQcroutus/PDQcdBqkd7nlxGMdIX2yKUlRFjke4lsvju
 VQRrP762R1RQvCvW/LvFo63OELYGtTvH9XFxagwAyFxqyrcAsNpjsfiBHpYRReshDJR1
 UaCidmx+S92Thn2nCLVJRjTXaMIQPj7bS96Ezq0Tl2/dbeWv1VrxDi8Y/enIkRa1mcIf
 1/gCFmjIicR0UJcJNqkVFmZ5kyQAqc+MiHcuLhpexJENzZDJUj4/bdN9RuFOVBmfK7YC
 icOFeG7R7eZ/BVQAtfadeovvMJ5S2kh/kNwGALfVOIQr5hq1FTJZLOjMGfb1nIY54AsM
 gNgA==
X-Gm-Message-State: AOAM531laN7BbGJptap2f5d26MENvUH/UMQ7dUkPLK8hncZcVEvhZbzM
 giAkBJ4ruXcs2DTVp2RuXbRPP/oCNZHocSV3uiRao3/YzNbaixbWbKZZjB8U8zwj7J5utjLj8WY
 JLPojm4YOxRN0Kx4=
X-Received: by 2002:a5d:500d:: with SMTP id e13mr13040429wrt.413.1629794783163; 
 Tue, 24 Aug 2021 01:46:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwXQ0PaiudQZr2de2GZZBb49h5HGM/Waoj88pUZpFHQYbZ1dFN6TULjc/XhLoNrftQdQxIkg==
X-Received: by 2002:a5d:500d:: with SMTP id e13mr13040403wrt.413.1629794782930; 
 Tue, 24 Aug 2021 01:46:22 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id v1sm16949275wrt.93.2021.08.24.01.46.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 01:46:22 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] hw/usb/hcd-xhci-pci: Abort if setting link
 property failed
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20210819171547.2879725-1-philmd@redhat.com>
 <20210819171547.2879725-3-philmd@redhat.com>
 <20210823183414.hmu4ly2y5zkbw3mg@habkost.net>
 <87ilzvntu1.fsf@dusky.pond.sub.org>
 <eb59236e-bd14-5916-0ffc-ea0fce0db00b@redhat.com>
Message-ID: <04d64e04-b1cc-0035-c9f4-13b843826c93@redhat.com>
Date: Tue, 24 Aug 2021 10:46:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <eb59236e-bd14-5916-0ffc-ea0fce0db00b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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

On 8/24/21 10:35 AM, Philippe Mathieu-Daudé wrote:
> On 8/24/21 10:13 AM, Markus Armbruster wrote:
>> Eduardo Habkost <ehabkost@redhat.com> writes:
>>
>>> +Markus
>>>
>>> On Thu, Aug 19, 2021 at 07:15:46PM +0200, Philippe Mathieu-Daudé wrote:
>>>> Do not ignore eventual error if we failed at setting the 'host'
>>>> property of the TYPE_XHCI model.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> ---
>>>>  hw/usb/hcd-xhci-pci.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
>>>> index e934b1a5b1f..71f6629ccde 100644
>>>> --- a/hw/usb/hcd-xhci-pci.c
>>>> +++ b/hw/usb/hcd-xhci-pci.c
>>>> @@ -115,7 +115,7 @@ static void usb_xhci_pci_realize(struct PCIDevice *dev, Error **errp)
>>>>      dev->config[PCI_CACHE_LINE_SIZE] = 0x10;
>>>>      dev->config[0x60] = 0x30; /* release number */
>>>>  
>>>> -    object_property_set_link(OBJECT(&s->xhci), "host", OBJECT(s), NULL);
>>>> +    object_property_set_link(OBJECT(&s->xhci), "host", OBJECT(s), &error_fatal);
>>>
>>> If this fails, it's due to programmer error, isn't?  Shouldn't we
>>> use &error_abort on that case?
>>
>> I think so.
>>
>> In functions with an Error **errp parameter, use of &error_fatal is
>> almost always wrong.

Having used 'abort' in the subject, no clue why I used &error_fatal
then...


