Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6819D37B52D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 06:54:45 +0200 (CEST)
Received: from localhost ([::1]:43150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lggtQ-0000qQ-GB
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 00:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lggsE-0007xT-CS
 for qemu-devel@nongnu.org; Wed, 12 May 2021 00:53:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lggsC-00047g-4r
 for qemu-devel@nongnu.org; Wed, 12 May 2021 00:53:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620795207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rlL/K/itK4CyGRdXHSN5pxpzzaH2h+JpravII6bkTOU=;
 b=gVAawJxdrCfb1gMDE3ck7pH/4ORfokfvMmnC9jQzkIt4WBVvJ1ZPpFfemJO3ejvcvraDTw
 2VDfrl68Ah83OhiOxjZnrsEyzSyhHtHqhYw5XkI7e6KgmNCWItGGYkdvJSrko31NG7YJIT
 bv3R7dwj3aQavwSSE7CKcCHVD7T5bmk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-twATIBTtOQOoVPgoLnPXZg-1; Wed, 12 May 2021 00:53:25 -0400
X-MC-Unique: twATIBTtOQOoVPgoLnPXZg-1
Received: by mail-wr1-f72.google.com with SMTP id
 i102-20020adf90ef0000b029010dfcfc46c0so9654086wri.1
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 21:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rlL/K/itK4CyGRdXHSN5pxpzzaH2h+JpravII6bkTOU=;
 b=pOJsI/AAZPN2+xNoD5o4DAJO951hj/k66sfIANwtcYVBVBKEXyielAlL+AZZ4eBw7A
 esWP0K0etOIWhlVWwWg6pmqq8B4vbaAJMJLAiQ5hkRywZvxgE5M8sKmj4jN3HmJEFxik
 OufU8kcKMQIDptbLF41sSnl50QW3QvsngpW4jfK3mjJvyWJByLgkTIEzDxhf17po3LZp
 YR53l7kMiC+ldLzuj4i74mpphjUsbG6nREfPSuRg1tR9ONGG2UyKRsDwXlXpUK6rHMLM
 7VJmq7cHo71otObwGYQltWZ1NrAvoBaNGjeaw0poPZsZ3MQieUK5Rcc61FyHtKL7mQ9w
 /EKw==
X-Gm-Message-State: AOAM532M/tkEZQ26qqGeDsFp7Bob5P5wCE0adBnNgBY65SA5+0NADmC0
 rjdg8OPX0bMR2vvPPmP9iDCaHcZy2uMAiKHiyOFCH6Db4CeJm4D0tJZVM/nVzaGzzK0pFK2j0LH
 zFxsrZCTAA2oyxEk=
X-Received: by 2002:a05:600c:1994:: with SMTP id
 t20mr36470290wmq.177.1620795204584; 
 Tue, 11 May 2021 21:53:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLKnW8bWbofBF8K/IFo7GAMMrPXvlMEJ6JLJKtqw9pMels46f5SEp2owW/WrbZT6Xw+lC11Q==
X-Received: by 2002:a05:600c:1994:: with SMTP id
 t20mr36470266wmq.177.1620795204379; 
 Tue, 11 May 2021 21:53:24 -0700 (PDT)
Received: from thuth.remote.csb (pd9e835ac.dip0.t-ipconnect.de.
 [217.232.53.172])
 by smtp.gmail.com with ESMTPSA id i3sm33711527wrb.46.2021.05.11.21.53.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 21:53:23 -0700 (PDT)
Subject: Re: [RFC PATCH 1/5] hw/mem/nvdimm: Use Kconfig 'imply' instead of
 'depends on'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210511155354.3069141-1-philmd@redhat.com>
 <20210511155354.3069141-2-philmd@redhat.com> <YJs8anLs1zL3nPdS@yekko>
 <21e0a306-ccfb-a627-1496-14f831fe80a7@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <dba0c284-b279-5e5b-74c9-2da719a8ce2e@redhat.com>
Date: Wed, 12 May 2021 06:53:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <21e0a306-ccfb-a627-1496-14f831fe80a7@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Igor Mammedov <imammedo@redhat.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/05/2021 05.57, Philippe Mathieu-Daudé wrote:
> On 5/12/21 4:24 AM, David Gibson wrote:
>> On Tue, May 11, 2021 at 05:53:50PM +0200, Philippe Mathieu-Daudé wrote:
>>> Per the kconfig.rst:
>>>
>>>    A device should be listed [...] ``imply`` if (depending on
>>>    the QEMU command line) the board may or  may not be started
>>>    without it.
>>>
>>> This is the case with the NVDIMM device, so use the 'imply'
>>> weak reverse dependency to select the symbol.
>>
>> Uh.. It should definitely be possible to start a pseries machine
>> without NVDIMM.  I would have guessed the same for PC.
> 
> Yes, this is what this patch does. With it we can build with:
> CONFIG_NVDIMM=n

But with "imply" you could end up with a PSERIES that does not have NVDIMM 
when also using --without-default-devices, couldn't you? Why don't you use 
"select" instead of "imply" ?

  Thomas


