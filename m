Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D0C389ED1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 09:21:03 +0200 (CEST)
Received: from localhost ([::1]:49158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljczO-0005zQ-50
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 03:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ljcuu-0001Y8-5z
 for qemu-devel@nongnu.org; Thu, 20 May 2021 03:16:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ljcuq-00044z-8Q
 for qemu-devel@nongnu.org; Thu, 20 May 2021 03:16:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621494979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i+PyPZQeGb7J63QfmoeVYJJXpjLjHB6COx+Y1KWcP0c=;
 b=WI1kiq5kV/29a1fOWyiLW/JgNr5EkkBWR1tyLm+N5uNX0DJSgb0G4yd0KV7nahQ0YV/HaF
 oZFNRke1kNB04mT7/fAr/nA4JNebSLv6eRSY34P4wfwvlD9l9pz669bRXX4fdbpND5YkFM
 BHCxYVlJlDAn1ncF1FrIs/c1Qx6WBDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-H0lqQllJNSONT0rx4atn9Q-1; Thu, 20 May 2021 03:16:17 -0400
X-MC-Unique: H0lqQllJNSONT0rx4atn9Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AB9E805EE1
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 07:16:16 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-71.ams2.redhat.com [10.36.112.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57B3A9808;
 Thu, 20 May 2021 07:16:15 +0000 (UTC)
Subject: Re: [PATCH v5 1/6] hw/isa/Kconfig: Fix missing dependency ISA_SUPERIO
 -> FDC
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>
References: <20210518193239.1725624-1-philmd@redhat.com>
 <20210518193239.1725624-2-philmd@redhat.com>
 <977f921f-7dfe-707b-51d4-85e6c7aba164@redhat.com>
 <1888fae1-5546-490c-b564-68be17904fca@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <736efc80-3f55-80e7-9f15-f4a6c619c7d1@redhat.com>
Date: Thu, 20 May 2021 09:16:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <1888fae1-5546-490c-b564-68be17904fca@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/05/2021 13.05, Philippe Mathieu-Daudé wrote:
> On 5/19/21 10:23 AM, Thomas Huth wrote:
>> On 18/05/2021 21.32, Philippe Mathieu-Daudé wrote:
>>> isa_superio_realize() calls isa_fdc_init_drives(), which is defined
>>> in hw/block/fdc.c, so ISA_SUPERIO needs to select the FDC symbol.
>>
>> If I get that right, not all superio chipsets provide a floppy drive
>> (there's this "k->floppy.is_enabled" check in there) ... but for boards
>> that don't need the FDC, this would currently require a stub for that
>> function
> 
> Good point. I'll try to get it right.

As discussed in v6, all superio chips currently have a way to use an FDC, so 
this version of the patch is fine:

Reviewed-by: Thomas Huth <thuth@redhat.com>


