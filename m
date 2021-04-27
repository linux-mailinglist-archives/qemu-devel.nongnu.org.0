Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE6A36CADA
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 20:05:37 +0200 (CEST)
Received: from localhost ([::1]:53968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbS5Y-00089x-9l
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 14:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbRfl-0005pS-Vm
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:38:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbRfT-0005BE-3b
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 13:38:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619545110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VWwyLNrHeNDyqqeJRaUJmJxN5Ey99he395kgM2xsE3A=;
 b=SJJ/7sYICqG6gJoU6tNve6RAsuyxMAy74J+l5YPVXmNbmG86WwohsyR9TN0AOtMIpd5kCA
 TW/Dyrr/dA82yVKVkuYmQ6hyyfknV5WW/5F+x4tmPvSTdI0ESMfUcx7VxxoyZG1GPSW5Ye
 ChM56tUEJpIsPEALUbs80yCQ7rPHLNI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-me6GCDvzNDGLdRtHPRBc2Q-1; Tue, 27 Apr 2021 13:38:26 -0400
X-MC-Unique: me6GCDvzNDGLdRtHPRBc2Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E113107ACCA;
 Tue, 27 Apr 2021 17:38:25 +0000 (UTC)
Received: from [10.10.112.236] (ovpn-112-236.rdu2.redhat.com [10.10.112.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C78275C3F8;
 Tue, 27 Apr 2021 17:38:19 +0000 (UTC)
Subject: Re: [PATCH 0/4] hw/block/fdc: Allow Kconfig-selecting ISA bus/SysBus
 floppy controllers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210415102321.3987935-1-philmd@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <b3cda9c1-e1e8-3b67-4d23-f6b86c6f1394@redhat.com>
Date: Tue, 27 Apr 2021 13:38:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415102321.3987935-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 6:23 AM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> The floppy disc controllers pulls in irrelevant devices (sysbus in
> an ISA-only machine, ISA bus + isa devices on a sysbus-only machine).
> 
> This series clean that by extracting each device in its own file,
> adding the corresponding Kconfig symbols: FDC_ISA and FDC_SYSBUS.
> 
> Regards,
> 
> Phil.
> 

Lightly reviewed and I'm fine with it overall; but want a quick ~5min 
up-or-down by Hervé and/or Mark (To make sure this doesn't break any 
non-x86 system they may care about), and a quick nod from Paolo for 
KConfig changes would be nice.

I'll be waiting on a reply to my question on patch 01 before staging.

--js

> Philippe Mathieu-Daudé (4):
>    hw/block/fdc: Replace disabled fprintf() by trace event
>    hw/block/fdc: Declare shared prototypes in fdc-internal.h
>    hw/block/fdc: Extract ISA floppy controllers to fdc-isa.c
>    hw/block/fdc: Extract SysBus floppy controllers to fdc-sysbus.c
> 
>   hw/block/fdc-internal.h | 155 ++++++++++
>   hw/block/fdc-isa.c      | 313 +++++++++++++++++++++
>   hw/block/fdc-sysbus.c   | 252 +++++++++++++++++
>   hw/block/fdc.c          | 608 +---------------------------------------
>   MAINTAINERS             |   3 +
>   hw/block/Kconfig        |   8 +
>   hw/block/meson.build    |   2 +
>   hw/block/trace-events   |   3 +
>   hw/i386/Kconfig         |   2 +-
>   hw/isa/Kconfig          |   6 +-
>   hw/mips/Kconfig         |   2 +-
>   hw/sparc/Kconfig        |   2 +-
>   hw/sparc64/Kconfig      |   2 +-
>   13 files changed, 751 insertions(+), 607 deletions(-)
>   create mode 100644 hw/block/fdc-internal.h
>   create mode 100644 hw/block/fdc-isa.c
>   create mode 100644 hw/block/fdc-sysbus.c
> 


