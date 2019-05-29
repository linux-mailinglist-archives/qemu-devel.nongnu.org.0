Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C037B2D51E
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 07:38:12 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47548 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVrHv-0005Qa-HV
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 01:38:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60618)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>) id 1hVrGq-0004zt-8e
	for qemu-devel@nongnu.org; Wed, 29 May 2019 01:37:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel.apfelbaum@gmail.com>) id 1hVrGp-0001Ur-Cb
	for qemu-devel@nongnu.org; Wed, 29 May 2019 01:37:04 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:41697)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcel.apfelbaum@gmail.com>)
	id 1hVqsR-0001yg-In
	for qemu-devel@nongnu.org; Wed, 29 May 2019 01:11:51 -0400
Received: by mail-wr1-x442.google.com with SMTP id c2so640039wrm.8
	for <qemu-devel@nongnu.org>; Tue, 28 May 2019 22:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=YQ1xqtLZLWliwP7boBDEU6TpsqPaCpy6byNYhOdb2C4=;
	b=C4C0DC66zbqFpcUQlBc5YjPXXPtAnIyTQdNY6+aiN7kIBLhH6z5EbTV7iRVf5zWH1g
	xwL2/e+QLn7AOZkDhP9PC/GM10F04W/7kPQ8twB5G9YJ4d7NlQXy3AahDh1dNPK8KpXp
	u2+Fb4P2WhSQOzcNFu2SA3vH0VVK2zUvfZyu/+Mx+gQSS1f3HjdXQlc0bt7nrAvqyB3+
	fupLb+puKY0tylSVjtGQGrrNPL2QAnpe3AKaDV3T9vX+HPr5T3QI0361pK1O8vP4I04w
	sHZC2Wc9Y5kdaSuv+OL7BwCj1qo2fQz24Z2bOAyvMtbusZoCEo/F2pcgb7sM15zPHcd9
	wDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=YQ1xqtLZLWliwP7boBDEU6TpsqPaCpy6byNYhOdb2C4=;
	b=myBsbYXpVG1kMR0HXZCXVnjNiRxYr1PQnnOnrAoFEJ61DsOaWeP3fUSFHW/wwRUE2t
	EIQb1wR5fmYBajk6O2oYWUnsIVP4OZP0uDwmfglUbebkhjlzukwwIg+bevo/9hBr7kyZ
	HyS+U2Epcvane2kAtCLh5QkRQNMYxQtlycriSdl3S/JpG86/AGUxPHGKfUpB8ukm21Zr
	bNsrFXnuwIC5zLBtmXqGEtxnCr63vfx07H55tWtAlGW9lZbiy6bpudtem2X962VaqkaW
	HtWBhq9qzhVT6DG2F6NNaoSCvg94sqTRI6jyvYMRhXcflv/sgTw+8d9+mlf8SpT8G/cs
	s/7g==
X-Gm-Message-State: APjAAAW5K3scKbir9yi3m98o9RrCOFFPCjLRN+FcFdoc5QFsMIsfHWxR
	gHa1EXiQjybhrxokqa+x0y0=
X-Google-Smtp-Source: APXvYqwmeC85rd4jOv7WEsQPzP2f3P7214UFSu7k/fHLdKjn5jbnPLsd3cle4G+PyO5/qZ8O8Jt8Yw==
X-Received: by 2002:a5d:6207:: with SMTP id y7mr58368955wru.265.1559106698898; 
	Tue, 28 May 2019 22:11:38 -0700 (PDT)
Received: from localhost.localdomain ([37.142.144.27])
	by smtp.gmail.com with ESMTPSA id
	u19sm12434321wmu.41.2019.05.28.22.11.37
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 May 2019 22:11:38 -0700 (PDT)
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20190528204331.5280-1-kraxel@redhat.com>
	<016bde36-9476-91c3-0a06-5cd13d317083@gmail.com>
	<20190529050123.dblwhfffwa5emhjf@sirius.home.kraxel.org>
From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-ID: <f82b1632-083b-8520-4f46-b9d89de9583c@gmail.com>
Date: Wed, 29 May 2019 08:11:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190529050123.dblwhfffwa5emhjf@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
	That's all we know.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-devel] [PATCH] q35: fix mmconfig and PCI0._CRS
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?B?TMOhc3psw7Mgw4lyc2Vr?= <lersek@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gerd,

On 5/29/19 8:01 AM, Gerd Hoffmann wrote:
> On Wed, May 29, 2019 at 07:48:03AM +0300, Marcel Apfelbaum wrote:
>> Hi Gerd,
>>
>> On 5/28/19 11:43 PM, Gerd Hoffmann wrote:
>>> This patch changes the handling of the mmconfig area.  Thanks to the
>>> pci(e) expander devices we already have the logic to exclude address
>>> ranges from PCI0._CRS.  We can simply add the mmconfig address range
>>> to the list get it excluded as well.
>>>
>>> With that in place we can go with a fixed pci hole which covers the
>>> whole area from the end of (low) ram to the ioapic.
>>>
>>> This will make the whole logic alot less fragile.  No matter where the
>>> firmware places the mmconfig xbar, things should work correctly.  The
>>> guest also gets a bit more PCI address space (seabios boot):
>>>
>>>       # cat /proc/iomem
>>>       [ ... ]
>>>       7ffdd000-7fffffff : reserved
>>>       80000000-afffffff : PCI Bus 0000:00            <<-- this is new
>>>       b0000000-bfffffff : PCI MMCONFIG 0000 [bus 00-ff]
>>>         b0000000-bfffffff : reserved
>>>       c0000000-febfffff : PCI Bus 0000:00
>>>         f8000000-fbffffff : 0000:00:01.0
>>>       [ ... ]
>>>
>>> So this is a guest visible change.
>> Looks good to me, but shouldn't we use some compat
>> property to not affect previous machine versions?
> acpi table changes are typically not versioned, and IIRC the acpi tables
> are part of the live migration data stream so the tables will not change
> under the feet of the running guest even when it is migrated to another
> qemu version.

I wasn't "worried" only about migration, but also about the visible 
change in
the guests keeping the same machine type and upgrading QEMU.

I am not saying is a "big" issue since it will probably not affect the 
guests at all.
Upgrading QEMU will look like a firmware update or something.

Thanks,
Marcel

> cheers,
>    Gerd
>


