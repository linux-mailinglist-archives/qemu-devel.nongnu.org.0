Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 800F0386C10
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 23:13:08 +0200 (CEST)
Received: from localhost ([::1]:50256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1likXz-0004zF-Kt
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 17:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1likX2-0003wI-O8
 for qemu-devel@nongnu.org; Mon, 17 May 2021 17:12:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1likWz-0005T2-Fm
 for qemu-devel@nongnu.org; Mon, 17 May 2021 17:12:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621285923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s9JhlFI61fW3r2lf9bwHehiUih0nM1N7H2XZA3VdZYo=;
 b=KrmynAeDu6Ve+GccpirHsnissOj+TWBuXZ6rDjXFqH9NPkG4DmkzOSX6ikPS66ODZNhgA2
 Dj2YUeHPtS8+HZaULgbWF/mGr8HZ8kEJv3qkqO57vVvSoZbKktMJbHyAUfT35JzV1DNoVn
 2ahtON5GmmUJSiNs5wBBuHxPPZ2AgUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-n1Mh5YoWON-V8BrcuJrrhg-1; Mon, 17 May 2021 17:11:59 -0400
X-MC-Unique: n1Mh5YoWON-V8BrcuJrrhg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92B94802690;
 Mon, 17 May 2021 21:11:58 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03F8B1A868;
 Mon, 17 May 2021 21:11:57 +0000 (UTC)
Subject: Re: [PATCH v4 0/9] hw/block/fdc: Allow Kconfig-selecting ISA
 bus/SysBus floppy controllers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210517183954.1223193-1-philmd@redhat.com>
 <6ef11e42-7778-762a-f11b-d88f1b688db3@redhat.com>
 <7ce0415a-50f9-d903-d1dd-d0b0b1757045@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <b370382f-aa19-21b5-3c8a-9fac9be590d5@redhat.com>
Date: Mon, 17 May 2021 17:11:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7ce0415a-50f9-d903-d1dd-d0b0b1757045@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 4:50 PM, Philippe Mathieu-Daudé wrote:
> On 5/17/21 9:19 PM, John Snow wrote:
>> On 5/17/21 2:39 PM, Philippe Mathieu-Daudé wrote:
>>> Missing review: #1
>>>
>>> Hi,
>>>
>>> The floppy disc controllers pulls in irrelevant devices (sysbus in
>>> an ISA-only machine, ISA bus + isa devices on a sysbus-only machine).
>>>
>>> This series clean that by extracting each device in its own file,
>>> adding the corresponding Kconfig symbols: FDC_ISA and FDC_SYSBUS.
>>>
>>> Since v3:
>>> - Fix ISA_SUPERIO -> FDC Kconfig dependency (jsnow)
>>>
>>> Since v2:
>>> - rebased
>>>
>>> Since v1:
>>> - added missing "hw/block/block.h" header (jsnow)
>>> - inlined hardware specific calls (Mark)
>>> - added R-b/A-b tags
>>>
>>> Regards,
>>>
>>> Phil.
>>>
>>> Philippe Mathieu-Daudé (9):
>>>     hw/isa/Kconfig: Fix missing dependency ISA_SUPERIO -> FDC
>>>     hw/block/fdc: Replace disabled fprintf() by trace event
>>>     hw/block/fdc: Declare shared prototypes in fdc-internal.h
>>>     hw/block/fdc: Extract ISA floppy controllers to fdc-isa.c
>>>     hw/block/fdc: Extract SysBus floppy controllers to fdc-sysbus.c
>>>     hw/block/fdc: Add sysbus_fdc_init_drives() method
>>>     hw/sparc/sun4m: Inline sun4m_fdctrl_init()
>>>     hw/block/fdc-sysbus: Add 'dma-channel' property
>>>     hw/mips/jazz: Inline fdctrl_init_sysbus()
>>>
>>>    hw/block/fdc-internal.h | 156 +++++++++++
>>>    include/hw/block/fdc.h  |   7 +-
>>>    hw/block/fdc-isa.c      | 313 +++++++++++++++++++++
>>>    hw/block/fdc-sysbus.c   | 224 +++++++++++++++
>>>    hw/block/fdc.c          | 608 +---------------------------------------
>>>    hw/mips/jazz.c          |  16 ++
>>>    hw/sparc/sun4m.c        |  16 ++
>>>    MAINTAINERS             |   3 +
>>>    hw/block/Kconfig        |   8 +
>>>    hw/block/meson.build    |   2 +
>>>    hw/block/trace-events   |   3 +
>>>    hw/i386/Kconfig         |   2 +-
>>>    hw/isa/Kconfig          |   7 +-
>>>    hw/mips/Kconfig         |   2 +-
>>>    hw/sparc/Kconfig        |   2 +-
>>>    hw/sparc64/Kconfig      |   2 +-
>>>    16 files changed, 759 insertions(+), 612 deletions(-)
>>>    create mode 100644 hw/block/fdc-internal.h
>>>    create mode 100644 hw/block/fdc-isa.c
>>>    create mode 100644 hw/block/fdc-sysbus.c
>>>
>>
>> Hi, tentatively staged:
>>
>> https://gitlab.com/jsnow/qemu/-/commits/floppy/
>>
>> pending CI:
>>
>> https://gitlab.com/jsnow/qemu/-/pipelines/304308461
> 
> Not good enough:
> 
> qemu-system-sparc: ../hw/block/fdc.c:2356: fdctrl_realize_common:
> Assertion `fdctrl->dma' failed.
> 
> Forget about it for your next pull request.
> 

Yup, I see. Dropping it from the queue for now. Thanks!

--js


