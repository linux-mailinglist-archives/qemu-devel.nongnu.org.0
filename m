Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9421B1F19EC
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jun 2020 15:24:02 +0200 (CEST)
Received: from localhost ([::1]:47682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiHkv-0006jd-DF
	for lists+qemu-devel@lfdr.de; Mon, 08 Jun 2020 09:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jiHk1-0006E9-Vb
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 09:23:05 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:25162
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jiHk1-0004EF-9L
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 09:23:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591622584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kapm4msbExxH3SMOaHLSN5cnNY68w7MeOhD8BzR/gZs=;
 b=UT7TWCxXW7lgyGBsecmpZObOWKdcG9rYIJ4wQzNelPUn/9G493kOyqlSP8YpEtdDo7MCs+
 JNlELF0pCVHeE8HnxA5fn+fVzrIAXuQT7Gafl3MmRyQtkaqniN/cmtnp0Bgv39hTkQNIsF
 UOCrOCLKEo2rGoZS1QbxQ45P1qBFIRk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-ROpTCIYON6mrM88hVb8IaQ-1; Mon, 08 Jun 2020 09:23:00 -0400
X-MC-Unique: ROpTCIYON6mrM88hVb8IaQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 004271854C66;
 Mon,  8 Jun 2020 13:22:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 781442C24D;
 Mon,  8 Jun 2020 13:22:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6833016E16; Mon,  8 Jun 2020 15:22:45 +0200 (CEST)
Date: Mon, 8 Jun 2020 15:22:45 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v6 00/16] acpi: i386 tweaks
Message-ID: <20200608132245.3ttg6srmyhzbjrbt@sirius.home.kraxel.org>
References: <20200515150421.25479-1-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200515150421.25479-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 01:20:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 15, 2020 at 05:04:05PM +0200, Gerd Hoffmann wrote:
> First batch of microvm patches, some generic acpi stuff.
> Split the acpi-build.c monster, specifically split the
> pc and q35 and pci bits into a separate file which we
> can skip building at some point in the future.
> 
> v2 changes: leave acpi-build.c largely as-is, move useful
> bits to other places to allow them being reused, specifically:
> 
>  * move isa device generator functions to individual isa devices.
>  * move fw_cfg generator function to fw_cfg.c
> 
> v3 changes: fix rtc, support multiple lpt devices.
> 
> v4 changes:
>  * drop merged patches.
>  * split rtc crs change to separata patch.
>  * added two cleanup patches.
>  * picked up ack & review tags.
> 
> v5 changes:
>  * add comment for rtc crs update.
>  * add even more cleanup patches.
>  * picked up ack & review tags.
> 
> v6 changes:
>  * floppy: move cmos_get_fd_drive_type.
>  * picked up ack & review tags.

Ping.  What is the status here?

take care,
  Gerd


