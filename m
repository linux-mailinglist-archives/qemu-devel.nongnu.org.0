Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A82C17743F
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 11:33:01 +0100 (CET)
Received: from localhost ([::1]:45093 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j94rE-0004Wj-5K
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 05:33:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56346)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1j94mD-0006FW-4w
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 05:27:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1j94mC-0005jD-3k
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 05:27:48 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:22143
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1j94mC-0005j8-07
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 05:27:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583231267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4kiVCprCP4FdECiPIKMuBRIRgAWl35LUuq6sgPFKORY=;
 b=Xn50JZrvTuBRvMdHrG4NysLqE6BxZRVIok/HZtdEdbXl1XyXXx99j/2El1DAM4ZfQps/Ip
 Q51Y/POc5MtMraAVGK4mFCiX8B4WTwxEyCmxXifoAziB2rJIHz2dyxf2EWpQ2LzUq/sHBY
 lZkMSSxxwexqjyl2LiGFIan9LVIqZvY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-LyE62lI5P0uWd1LwgmHZzw-1; Tue, 03 Mar 2020 05:27:43 -0500
X-MC-Unique: LyE62lI5P0uWd1LwgmHZzw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1290D107ACCC;
 Tue,  3 Mar 2020 10:27:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E01C848;
 Tue,  3 Mar 2020 10:27:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0D98F17535; Tue,  3 Mar 2020 11:27:37 +0100 (CET)
Date: Tue, 3 Mar 2020 11:27:37 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Subject: Re: [PATCH 3/3] usb/hcd-xhci: Split pci wrapper for xhci base model
Message-ID: <20200303102737.rc5dugd7emu3nnd5@sirius.home.kraxel.org>
References: <1583141724-6229-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1583141724-6229-4-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
In-Reply-To: <1583141724-6229-4-git-send-email-sai.pavan.boddu@xilinx.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Thomas Huth <thuth@redhat.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
 Anthony Liguori <anthony@codemonkey.ws>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> +typedef struct XHCIPciState {
> +    /*< private >*/
> +    PCIDevice parent_obj;
> +    /*< public >*/
> +    XHCIState *xhci;

Better embed the struct instead of storing a pointer.

>  struct XHCIState {
> -    /*< private >*/
> -    PCIDevice parent_obj;
> -    /*< public >*/
> -
> +    DeviceState parent;

Why do you need this?  XHCIState will not be used standalone, it will be
part of XHCIPciState or XHCISysbusState, which in turn has a DeviceState
already.

> +    void (*intr_update)(void *opaque, int n, bool enable);
> +    void (*intr_raise)(void *opaque, int n, bool level);

Use "struct XHCIState*" instead of "void*" please, then use container_of
to get XHCIPciState or XHCISysbusState.

cheers,
  Gerd


