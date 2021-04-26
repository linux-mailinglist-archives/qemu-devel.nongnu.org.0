Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBA436AFB5
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 10:25:31 +0200 (CEST)
Received: from localhost ([::1]:39902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lawYc-0002yR-6w
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 04:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lawXC-0002LO-27
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 04:24:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lawX9-0001oA-SF
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 04:24:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619425437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lRhWp34Tz93XEKlqlTZ1T7Mu6twmPMbEKZwJY9RIADc=;
 b=euOqipdDhYwGIHaKIGMyG+E1ueBlOX+6KhKyJf2qDQoOUVbY3DhwoAAYW3QSpkEuEh88ME
 F/9kAJf8UazYdzXqChryMuooG4LufPL0wcltrr7ef+4hENs4Q88hzOGoYIuw9MmNNGeZS7
 BrZGNdh68C0DLbwkNdRTmgpX44nzQBE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-LK0qaR0aOGqcMPUIs0Brkg-1; Mon, 26 Apr 2021 04:23:53 -0400
X-MC-Unique: LK0qaR0aOGqcMPUIs0Brkg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A38A1006C85;
 Mon, 26 Apr 2021 08:23:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 696A969101;
 Mon, 26 Apr 2021 08:23:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A9AED180038A; Mon, 26 Apr 2021 10:23:44 +0200 (CEST)
Date: Mon, 26 Apr 2021 10:23:44 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] hw/pci-host: Do not build gpex-acpi.c if GPEX is not
 selected
Message-ID: <20210426082344.svokxrlvqjb2rgag@sirius.home.kraxel.org>
References: <20210425182124.3735214-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210425182124.3735214-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Thomas Huth <thuth@redhat.com>, Xingang Wang <wangxingang5@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jiahui Cen <cenjiahui@huawei.com>,
 qemu-devel@nongnu.org, Yubo Miao <miaoyubo@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Apr 25, 2021 at 08:21:24PM +0200, Philippe Mathieu-Daudé wrote:
> Since its introduction in commit 5b85eabe68f ("acpi: add
> acpi_dsdt_add_gpex") we build gpex-acpi.c if ACPI is selected,
> even if the GPEX_HOST device isn't build. Add the missing
> Kconfig dependency.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


