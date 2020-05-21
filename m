Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FCC1DCF96
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 16:23:08 +0200 (CEST)
Received: from localhost ([::1]:33394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbm6F-0002iD-Ip
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 10:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbm4k-0001Xh-Df
 for qemu-devel@nongnu.org; Thu, 21 May 2020 10:21:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51766
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbm4j-0006Dt-DK
 for qemu-devel@nongnu.org; Thu, 21 May 2020 10:21:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590070892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xg3bKzC4by8jf2C0O9TYTrZkk9SIrF8VIiDgmcnMufQ=;
 b=e+sJx1m1otnib5QfqDhRz8hvGjc+AKmfEx5Saz9RVA51oVk381MWh8/o+w6USrhvRtlhgG
 +cCFpLbGzQAqSOrS+PGwAQ5N3eCLV3fEYlQW34D/sYIfjnejAo+umjyN6FtcRzGjE8K/ow
 hZow0Amuth7XnK3uKcZAMzHu2W2Vpe8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-k6lD_XV3P_eG_j0QcmT0Rw-1; Thu, 21 May 2020 10:21:30 -0400
X-MC-Unique: k6lD_XV3P_eG_j0QcmT0Rw-1
Received: by mail-wr1-f69.google.com with SMTP id d16so2969993wrv.18
 for <qemu-devel@nongnu.org>; Thu, 21 May 2020 07:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xk3PN1V81+WyaTVGKsiFpvv3947Bx6sjeseiShYqzcU=;
 b=L5bsUFSI54a+Udy9TdMM5V3ASNM3jPhcA2ECxJwtIcu4rfu1CQYIpB0lpaKwapjTCe
 oxXahevRkPuSUL3FiUgL0h6Zote6X9y+lcOxJGOnnS/g6MluyZHTiFKaG4LaxqUR24OJ
 NQdnXT6Km1h8Xbtp0c2VtTfMmwL2S2bbp9cdpWCQ/eNBFk/ESZm3qHWg8Usr2gh5gLUb
 OboBXnf1g7iwrvBbs5A6/wvEP4nED7AMdW6hbG32fwWsW+C4udjhXRGD9NItvFiZzce0
 WcX2GbEy174/h9nwHnDAwiEywXiXTpjj+pDRebZ6bjy/vrBuamYYuKeetuQ8QxTefhJj
 I6XQ==
X-Gm-Message-State: AOAM532cTQ8FOGnH+T4slnOncq5+H9eaECOsue4Mmx9jaYXXbLVRzWf+
 tJjwQ2DeLfZWUxI0ksYxOA+RN5GU2jCd/09ms6GoofC2V6zamijLVlEl1Zf0WLreUEnOzDj6VTI
 BsOcpID/A3KA9s+c=
X-Received: by 2002:a5d:6803:: with SMTP id w3mr8693020wru.151.1590070889106; 
 Thu, 21 May 2020 07:21:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOOgG9tLjRr8HKIPebkxk9AFVomeEwtFKnfdEiqR5u+xubzPBWnAa6j28oUjvKjM6lKJqQFQ==
X-Received: by 2002:a5d:6803:: with SMTP id w3mr8692999wru.151.1590070888853; 
 Thu, 21 May 2020 07:21:28 -0700 (PDT)
Received: from [192.168.1.40] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id f8sm6389879wrm.8.2020.05.21.07.21.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 07:21:28 -0700 (PDT)
Subject: Re: [PATCH 0/4] memory: Add memory_region_msync() & make NVMe
 emulated device generic
To: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>
References: <20200508062456.23344-1-philmd@redhat.com>
 <20200521123245.GG251811@stefanha-x1.localdomain>
 <5514da71-8d9e-e784-bfad-5939bd7ac99f@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <770d4c73-440c-5579-582f-7dea5de2c051@redhat.com>
Date: Thu, 21 May 2020 16:21:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5514da71-8d9e-e784-bfad-5939bd7ac99f@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 01:44:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beata Michalska <beata.michalska@linaro.org>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/21/20 2:46 PM, Paolo Bonzini wrote:
> On 21/05/20 14:32, Stefan Hajnoczi wrote:
>> On Fri, May 08, 2020 at 08:24:52AM +0200, Philippe Mathieu-Daudé wrote:
>>> Let the NVMe emulated device be target-agnostic.
>>>
>>> It is not clear if dccvap_writefn() really needs
>>> memory_region_writeback() or could use memory_region_msync().
>>>
>>> Philippe Mathieu-Daudé (4):
>>>    memory: Rename memory_region_do_writeback -> memory_region_writeback
>>>    memory: Extract memory_region_msync() from memory_region_writeback()
>>>    hw/block: Let the NVMe emulated device be target-agnostic
>>>    exec: Rename qemu_ram_writeback() as qemu_ram_msync()
>>>
>>>   include/exec/memory.h   | 15 +++++++++++++--
>>>   include/exec/ram_addr.h |  4 ++--
>>>   exec.c                  |  2 +-
>>>   hw/block/nvme.c         |  6 ++----
>>>   memory.c                | 12 +++++++++---
>>>   target/arm/helper.c     |  2 +-
>>>   hw/block/Makefile.objs  |  2 +-
>>>   7 files changed, 29 insertions(+), 14 deletions(-)
>>>
>>> -- 
>>> 2.21.3
>>>
>>>
>>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>
> 
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> 

Thanks both.

Stefan, do you mind taking the series via your block tree?

Thanks,

Phil.


