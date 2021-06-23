Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1C43B1E2F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 17:58:41 +0200 (CEST)
Received: from localhost ([::1]:41108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw5Gy-0004nw-Vb
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 11:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lw5Ef-0002gB-9f
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:56:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lw5Ec-0005b0-Rs
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:56:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624463773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z1wSyC+P3qYCcOOiRM0uRrw2/Uwnu+BvTugCTo0O7fE=;
 b=EpSMEL0OipCW24hh+m/19OD/QFwzqA1ggxaNnG8F/ite6jBlI8cSanzplbkEkNSdE8AhoV
 EmT5xFA3Ewt3Om+C72bu2FFdMO0Q1ib9fMWPKE4ywQB+HQAxntZP4hG6ucd7GhDmnYhZgH
 PlGsCdHJwsLeRMJwX1pcqkV2pDYGCO0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-IRhcbTYHMJSU6aTk35g7fg-1; Wed, 23 Jun 2021 11:56:05 -0400
X-MC-Unique: IRhcbTYHMJSU6aTk35g7fg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36AE4100CF6E
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 15:56:04 +0000 (UTC)
Received: from [10.10.118.71] (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FD0660583;
 Wed, 23 Jun 2021 15:56:03 +0000 (UTC)
Subject: Re: [PATCH v7 0/6] hw/block/fdc: Allow Kconfig-selecting ISA
 bus/SysBus floppy controllers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210614193220.2007159-1-philmd@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <599f64bd-6d47-34a7-14be-b414d65490a1@redhat.com>
Date: Wed, 23 Jun 2021 11:56:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614193220.2007159-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 3:32 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> The floppy disc controllers pulls in irrelevant devices (sysbus in
> an ISA-only machine, ISA bus + isa devices on a sysbus-only machine).
> 
> This series clean that by extracting each device in its own file,
> adding the corresponding Kconfig symbols: FDC_ISA and FDC_SYSBUS.
> 
> Since v6:
> - Rebased
> - Added A-b/R-b tags
> - Removed stub (thuth)
> 
> Since v5:
> - Added stub (thuth)
> 
> Since v4:
> - Dropped machine patches for later due to DMA jazz issue
> 
> Since v3:
> - Fix ISA_SUPERIO -> FDC Kconfig dependency (jsnow)
> 
> Since v2:
> - rebased
> 
> Since v1:
> - added missing "hw/block/block.h" header (jsnow)
> - inlined hardware specific calls (Mark)
> - added R-b/A-b tags
> 
> Regards,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (6):
>    hw/isa/Kconfig: Fix missing dependency ISA_SUPERIO -> FDC
>    hw/block/fdc: Replace disabled fprintf() by trace event
>    hw/block/fdc: Declare shared prototypes in fdc-internal.h
>    hw/block/fdc: Extract ISA floppy controllers to fdc-isa.c
>    hw/block/fdc: Extract SysBus floppy controllers to fdc-sysbus.c
>    hw/block/fdc: Add description to floppy controllers
> 
>   hw/block/fdc-internal.h | 158 ++++++++++
>   hw/block/fdc-isa.c      | 320 +++++++++++++++++++++
>   hw/block/fdc-sysbus.c   | 251 ++++++++++++++++
>   hw/block/fdc.c          | 621 +---------------------------------------
>   MAINTAINERS             |   3 +
>   hw/block/Kconfig        |  12 +-
>   hw/block/meson.build    |   2 +
>   hw/block/trace-events   |   3 +
>   hw/i386/Kconfig         |   2 +-
>   hw/isa/Kconfig          |   7 +-
>   hw/mips/Kconfig         |   2 +-
>   hw/sparc/Kconfig        |   2 +-
>   hw/sparc64/Kconfig      |   2 +-
>   13 files changed, 763 insertions(+), 622 deletions(-)
>   create mode 100644 hw/block/fdc-internal.h
>   create mode 100644 hw/block/fdc-isa.c
>   create mode 100644 hw/block/fdc-sysbus.c
> 

Staged again,

https://gitlab.com/jsnow/qemu/-/pipelines/326076557

will send PR as soon as the CI is done.

--js


