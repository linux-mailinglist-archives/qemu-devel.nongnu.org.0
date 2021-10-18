Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 146AB4318C8
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 14:17:50 +0200 (CEST)
Received: from localhost ([::1]:34702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcRaP-0004vw-5x
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 08:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mcRY3-00037N-K7
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 08:15:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mcRY1-0003KC-TZ
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 08:15:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634559320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6FhpIsPFldiULT4DQyfIx9FKlhXq/pmtA3MfPRJ/pl4=;
 b=ivXtKfn/4NMGK64+Mgg05FDzxzNpRST202S7RTTztr5dPUib7A1sTJaie0oYdSCD5vHvTm
 NQicrZorIR7Hqj/MhgLUHsxlqQB0Xr2F24cV5qGxLMrk2XNFdit+idz+WvpV/ms5o90Q/u
 Eiz4S4PD/MK3BjYvHlq1i0Yb70PcQfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-4q4sfupvPxua6tsKqTpjMg-1; Mon, 18 Oct 2021 08:15:17 -0400
X-MC-Unique: 4q4sfupvPxua6tsKqTpjMg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8044B1926DA2;
 Mon, 18 Oct 2021 12:15:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 432EAB8559;
 Mon, 18 Oct 2021 12:15:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9F9F1180063D; Mon, 18 Oct 2021 14:15:14 +0200 (CEST)
Date: Mon, 18 Oct 2021 14:15:14 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH] usb/uhci: Disallow user creating a vt82c686-uhci-pci
 device
Message-ID: <20211018121514.b63lqbnhilr4gkbj@sirius.home.kraxel.org>
References: <20211018113251.08F2E746399@zero.eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <20211018113251.08F2E746399@zero.eik.bme.hu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Philippe M-D <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 18, 2021 at 01:29:29PM +0200, BALATON Zoltan wrote:
> Because this device only works as part of VIA superio chips set user
> creatable to false. Since the class init method is common for UHCI
> variants introduce a flag in UHCIInfo for this.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


