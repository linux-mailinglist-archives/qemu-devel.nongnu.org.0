Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9740130E36F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:42:37 +0100 (CET)
Received: from localhost ([::1]:52900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7O2u-0000ec-LQ
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:42:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l7NcJ-0001Xl-DM
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:15:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l7NcD-00075Z-KR
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:15:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612379696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5jVI1J/4A6FVTlYSgA+1HKQLgH+R/7FYqf0mbzJjhSQ=;
 b=LaXOtWSd3U/l4DaiqlHwLmVcuLrhSYEtAW35/XlPdn9/WsFoj2Xh51JGVO7k7gT1Qq6Si0
 HaBmdfj8uTl2T+UnG006eMrmAxEpSIGjBf3ETkV96/VnboRCB1NtJNt7CUETt4F3pBm2My
 UaGJz5xMYaboQRTUKdnCGSE5BG2oW34=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-B5tGNliVOBS1om6ay6QEIQ-1; Wed, 03 Feb 2021 14:14:54 -0500
X-MC-Unique: B5tGNliVOBS1om6ay6QEIQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3617CCC628;
 Wed,  3 Feb 2021 19:14:53 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-32.ams2.redhat.com
 [10.36.113.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D0A75D9E8;
 Wed,  3 Feb 2021 19:14:41 +0000 (UTC)
Subject: Re: [PATCH v3 2/2] pci: add romsize property
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210203131828.156467-1-pbonzini@redhat.com>
 <20210203131828.156467-3-pbonzini@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <2982e16b-7a92-6dd7-ae34-4dcb5291c7f0@redhat.com>
Date: Wed, 3 Feb 2021 20:14:40 +0100
MIME-Version: 1.0
In-Reply-To: <20210203131828.156467-3-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: mst@redhat.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 peterx@redhat.com, dme@dme.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/03/21 14:18, Paolo Bonzini wrote:
> This property can be useful for distros to set up known-good ROM sizes for
> migration purposes.  The VM will fail to start if the ROM is too large,
> and migration compatibility will not be broken if the ROM is too small.
> 
> Note that even though romsize is a uint32_t, it has to be between 1
> (because empty ROM files are not accepted, and romsize must be greater
> than the file) and 2^31 (because values above are not powers of two and
> are rejected).
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Message-Id: <20201218182736.1634344-1-pbonzini@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/pci/pci.c             | 19 +++++++++++++++++--
>  hw/xen/xen_pt_load_rom.c | 14 ++++++++++++--
>  include/hw/pci/pci.h     |  1 +
>  3 files changed, 30 insertions(+), 4 deletions(-)

Acked-by: Laszlo Ersek <lersek@redhat.com>


