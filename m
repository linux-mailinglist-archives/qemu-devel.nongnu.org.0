Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC3F3AAB04
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 07:22:55 +0200 (CEST)
Received: from localhost ([::1]:46524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltkUQ-0007QF-Pl
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 01:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltkSi-00064n-SV
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 01:21:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltkSh-0006ba-7Q
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 01:21:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623907266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F5yTWpvidz6vB/Xybhrne4ihufyWc6LcbM9fZNsYT2A=;
 b=LJ+qBzPWErBpbwXIBD1zu+q2LN6nlku11Um3RuzJHf7ZIGuPKcl1k+uj5HMRveTTnQoVvS
 EtzwN1kWqkJ8uCVNKHFk4lOl0lMDJANudPnKwkVn8QMirXbfLs4yRuN1Aq39DAWK8RoIGL
 vccSdMVCIS7tjcv8j39fOep+4pXATs4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-0BXa-khRN5SZL0NPokthnA-1; Thu, 17 Jun 2021 01:21:03 -0400
X-MC-Unique: 0BXa-khRN5SZL0NPokthnA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B2411846101;
 Thu, 17 Jun 2021 05:21:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F046E1A866;
 Thu, 17 Jun 2021 05:21:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5CBC318000B2; Thu, 17 Jun 2021 07:21:00 +0200 (CEST)
Date: Thu, 17 Jun 2021 07:21:00 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 23/23] hw/i386/Kconfig: Add missing Kconfig dependency
 (runtime error)
Message-ID: <20210617052100.pnpxugkkzqeywxih@sirius.home.kraxel.org>
References: <20210616204328.2611406-1-philmd@redhat.com>
 <20210616204328.2611406-24-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210616204328.2611406-24-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laszlo Ersek <lersek@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 16, 2021 at 10:43:28PM +0200, Philippe Mathieu-Daudé wrote:
> When building the 'microvm' machine stand-alone we get:
> 
>   $ qemu-system-x86_64 -M microvm
>   **
>   ERROR:qom/object.c:714:object_new_with_type: assertion failed: (type != NULL)
>   Bail out! ERROR:qom/object.c:714:object_new_with_type: assertion failed: (type != NULL)
>   Aborted (core dumped)
> 
> Looking at the backtrace:
> 
>   (gdb) bt
>   #3  0x00007ff2330492ff in g_assertion_message_expr () at /lib64/libglib-2.0.so.0
>   #4  0x000055a878c18341 in object_new_with_type (type=<optimized out>) at qom/object.c:714
>   #5  0x000055a878c18399 in object_new (typename=typename@entry=0x55a878dec36a "isa-pit") at qom/object.c:747
>   #6  0x000055a878cc8146 in qdev_new (name=name@entry=0x55a878dec36a "isa-pit") at hw/core/qdev.c:153
>   #7  0x000055a878a8b439 in isa_new (name=name@entry=0x55a878dec36a "isa-pit") at hw/isa/isa-bus.c:160
>   #8  0x000055a878adb782 in i8254_pit_init (base=64, isa_irq=0, alt_irq=0x0, bus=0x55a87ab38760) at include/hw/timer/i8254.h:54
>   #9  microvm_devices_init (mms=0x55a87ac36800) at hw/i386/microvm.c:263
>   #10 microvm_machine_state_init (machine=<optimized out>) at hw/i386/microvm.c:471
>   #11 0x000055a878a944ab in machine_run_board_init (machine=machine@entry=0x55a87ac36800) at hw/core/machine.c:1239
> 
> The "isa-pit" type (TYPE_I8254) is missing. Add it.
> 
> Fixes: 0ebf007ddac ("hw/i386: Introduce the microvm machine type")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


