Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D43C966BE92
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 14:03:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHP8g-0001H7-Lf; Mon, 16 Jan 2023 08:03:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pHP8F-0000Uf-47
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 08:02:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pHP8D-00029C-EI
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 08:02:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673874152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TBbuQMve3zNNzMHF6yJ1WlDnBWEn2VH6zDT7oUkMm1Q=;
 b=c0wfM3FDP4CrRextzjfnOCwSuBQ+c8olxacRO9SRPwckmT/lK0K3UHbaDOA4XuK3R9S3+Z
 18QnelJPSZJwrS5xScZhOWMvBtYr8/p7CoNWeQaV48O8SgWoE/Wx6Evr9RUAO0u8zTbrnA
 JN6RLF+iGXeA7B4qcXVDjMfobYs5XrU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-fsaptY7KP6ytv934HLrBrg-1; Mon, 16 Jan 2023 08:02:28 -0500
X-MC-Unique: fsaptY7KP6ytv934HLrBrg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB580104D981;
 Mon, 16 Jan 2023 13:02:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72E152026D2A;
 Mon, 16 Jan 2023 13:02:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 11FDC21E6A28; Mon, 16 Jan 2023 14:02:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  Eduardo Habkost <eduardo@habkost.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Marcel
 Apfelbaum
 <marcel.apfelbaum@gmail.com>,  "Michael S. Tsirkin" <mst@redhat.com>,  Ani
 Sinha <ani@anisinha.ca>,  Aurelien Jarno <aurelien@aurel32.net>,  Igor
 Mammedov <imammedo@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/7] hw/acpi: Add missing includes
References: <20230114222738.282478-1-shentey@gmail.com>
 <20230114222738.282478-2-shentey@gmail.com>
 <87v8l7ugc3.fsf@pond.sub.org>
 <ED034842-BBE4-4C6A-8E39-105BCBB58F6D@gmail.com>
Date: Mon, 16 Jan 2023 14:02:23 +0100
In-Reply-To: <ED034842-BBE4-4C6A-8E39-105BCBB58F6D@gmail.com> (Bernhard
 Beschow's message of "Mon, 16 Jan 2023 08:56:56 +0000")
Message-ID: <87bkmyaazk.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Bernhard Beschow <shentey@gmail.com> writes:

> Am 16. Januar 2023 06:46:36 UTC schrieb Markus Armbruster <armbru@redhat.com>:
>>Bernhard Beschow <shentey@gmail.com> writes:
>>
>>> When removing the "hw/boards.h" include from
>>> hw/acpi/acpi_dev_interface.h, these include directives must be added to make
>>> the code compile again.
>>>
>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>
>>You don't actually remove #include "hw/boards.h" from
>>hw/acpi/acpi_dev_interface.h in this series.  Accident?
>
> It gets removed in "[PATCH 3/7] hw/acpi/acpi_dev_interface: Resolve AcpiDeviceIfClass::madt_cpu", no?

Got eaten on the way to me, and I didn't notice, because git-am is still
happy.  Sorry for the noise!

The commit message could point to PATCH 3.  However, I'd reshuffle a bit
instead.  Split PATCH 3 into everything but the removal of #include
"hw/boards.h", and the removal.  Squash PATCH 1 into the latter,
resulting in a straighforward cleanup patch.


