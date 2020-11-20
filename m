Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8409C2BA66B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 10:42:14 +0100 (CET)
Received: from localhost ([::1]:47778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg2vl-000474-Ky
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 04:42:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kg2sR-0003GS-JP
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 04:38:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kg2sL-0001gV-Hk
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 04:38:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605865114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YlrhvA/W5TVQ6XWWRdYyu/MGNjzrO9AqFkKe9CmKV0w=;
 b=cphDgB1fiNEBegWQrayIEsNiW1uNJo+pPYSlAq070nzUzZIQUNRAxyTFRYZUD6DfcrfSzl
 9BS79OvH5tFSaNt1q9YFTXwiQR6tWH5N7wctK3fN/ztDQkieALMfc6hJoLj5r2l+bmYgiv
 LdECwhZRFuN8BxzcBXNnj6IXPDXXFBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-M3mNbjBSNb-cWFlL-6TZBw-1; Fri, 20 Nov 2020 04:38:32 -0500
X-MC-Unique: M3mNbjBSNb-cWFlL-6TZBw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B8111DDE2;
 Fri, 20 Nov 2020 09:38:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6543A60636;
 Fri, 20 Nov 2020 09:38:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A25D717535; Fri, 20 Nov 2020 10:38:30 +0100 (CET)
Date: Fri, 20 Nov 2020 10:38:30 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for-5.2] microvm: fix kconfig for non-default devices
Message-ID: <20201120093830.zgm6fn63xnvr7fxx@sirius.home.kraxel.org>
References: <20201120085524.108200-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201120085524.108200-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Bruce Rogers <brogers@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 20, 2020 at 09:55:24AM +0100, Paolo Bonzini wrote:
> PCIe and USB support can be disabled on the command line, and therefore
> should not be included if QEMU is configured --without-default-devices.

I don't think this will work.  I expect linking will fail due to
xhci_sysbus_build_aml and acpi_dsdt_add_gpex being not available.

take care,
  Gerd


