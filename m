Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA95589ECF
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Aug 2019 14:52:57 +0200 (CEST)
Received: from localhost ([::1]:45242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hx9on-0008LS-5F
	for lists+qemu-devel@lfdr.de; Mon, 12 Aug 2019 08:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46141)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hx9nk-0007Ob-Hl
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 08:51:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hx9nj-0003Si-DX
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 08:51:52 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54549)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hx9nj-0003SI-7G
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 08:51:51 -0400
Received: by mail-wm1-f67.google.com with SMTP id p74so12057287wme.4
 for <qemu-devel@nongnu.org>; Mon, 12 Aug 2019 05:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lhgf5NxFBl4v8NwjhJt0gymzwpuBL968LxDTJlFz2Ck=;
 b=BrYw2u8ozNFQ0E6nU4OG1mAPorNfUbvp++TM1cCYlb54SweQjcp4x5dQUHca5QKtrY
 F2YnEhCBGGFNxwzAjo3TZVYc/dxkmASxXIIvsLFvE9XzSTeZ/vBPyA6xGnw8iFPyUIPR
 kIhP7rSmHt2jJg6tWP18J38EOZ9etbBNadBrNMAbtvep9wvSckcnwaibE7EWpvHLMsrf
 1215lfXzNR/esN+90I8NNaamsWpjpGyFwWrKDsYLI3WF8iZS0b+LNOJODjAWwp8GQxYs
 2fzxjodA4RsHqSLoYDkqabLnbqa4uYoSKaIamrtxMLw6rfDcsUM64sTjAgF9qDPDD1B5
 8tig==
X-Gm-Message-State: APjAAAUbLj7mUDztVugqYDOVvg31ahhXyfRb35PhNlicjOu3C+qwiEc7
 1F9WyXNb0AsWbWkGuC4X69btiJutxOA=
X-Google-Smtp-Source: APXvYqz4odvpXeMTIYyWg99YhjixVuYzOcyExKjlaavvpx/ssl0zSA7dUIq+lCo4eJDuTp08zUdGQw==
X-Received: by 2002:a1c:dd82:: with SMTP id u124mr16081590wmg.89.1565614310117; 
 Mon, 12 Aug 2019 05:51:50 -0700 (PDT)
Received: from [192.168.1.37] (225.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.225])
 by smtp.gmail.com with ESMTPSA id r11sm6266192wrt.84.2019.08.12.05.51.49
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Aug 2019 05:51:49 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Prasad J Pandit <ppandit@redhat.com>
References: <20190812065221.20907-1-kraxel@redhat.com>
 <aec51679-b766-5773-86cb-9ebd06a8cb49@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <c4b30dfe-83d7-f1e0-d868-82791d56d6b6@redhat.com>
Date: Mon, 12 Aug 2019 14:51:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <aec51679-b766-5773-86cb-9ebd06a8cb49@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-devel] [PATCH 0/1] display/bochs: fix pcie support (qemu
 security issue)
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/12/19 2:45 PM, Paolo Bonzini wrote:
> On 12/08/19 08:52, Gerd Hoffmann wrote:
>> Just found while investigating
>>   https://bugzilla.redhat.com/show_bug.cgi?id=1707118
>>
>> Found PCIe extended config space filled with random crap due to
>> allocation being too small (conventional pci config space only).
>>

Can you amend this information to the commit description?

<...

>> PCI(e) config space is guest writable.  Writes are limited by
>> write mask (which probably is also filled with random stuff),
> 
> Yes, it is also allocated with 256 bytes only.
> 
>> so the guest can only flip enabled bits.  But I suspect it
>> still might be exploitable, so rather serious because it might
>> be a host escape for the guest.  On the other hand the device
>> is probably not yet in widespread use.

...>

>> Migitation: use "-device bochs-display" as conventional pci
>> device only.
>>
>> Note: qemu 4.1 release is planned for tomorrow.
>>
>> Gerd Hoffmann (1):
>>   display/bochs: fix pcie support
>>
>>  hw/display/bochs-display.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
> 
> Looks good to me, and no other device seems to have the same issue.  We
> could add an assertion that pci_config_size has not increased after
> calling pc->realize.
> 
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> Paolo
> 

