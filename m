Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FABB2E0CC5
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 16:32:16 +0100 (CET)
Received: from localhost ([::1]:37244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krje2-0004Eq-CV
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 10:32:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1krjcZ-0003aH-C5
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 10:30:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1krjcX-0003gD-97
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 10:30:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608651040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1wxX+mqjgE5wCW1jCRcu0gZxC+id2SBPPZt0cCAP740=;
 b=bN2rooJlUTTMCkOZA7C/Eh0AiKel3nvqkM4di7fEZbYLgbZ0BCQUTWqqSackLJbBGjarZU
 Ts7yIjktKmtlpfDrmWp66wSxpXaPVDH15w6IG0yH1wYBS+0IMepYKiQe26b70EhD5hGa+4
 JQYsRyblkezoq7FJikgm1q8TYMvxLRY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-ta9khdjJNOaLrYbrPJv6uA-1; Tue, 22 Dec 2020 10:30:38 -0500
X-MC-Unique: ta9khdjJNOaLrYbrPJv6uA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C4EF10054FF;
 Tue, 22 Dec 2020 15:30:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC40D6F988;
 Tue, 22 Dec 2020 15:30:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C69C911AB8; Tue, 22 Dec 2020 16:30:34 +0100 (CET)
Date: Tue, 22 Dec 2020 16:30:34 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Mihai Carabas <mihai.carabas@oracle.com>
Subject: Re: [PATCH 2/3] hw/misc/pvpanic: add PCI interface support
Message-ID: <20201222153034.r7lgpmrycx6k6kr4@sirius.home.kraxel.org>
References: <1608295996-8464-1-git-send-email-mihai.carabas@oracle.com>
 <1608295996-8464-3-git-send-email-mihai.carabas@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1608295996-8464-3-git-send-email-mihai.carabas@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 259f9c9..e9512ab 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -108,6 +108,7 @@ extern bool pci_available;
>  #define PCI_DEVICE_ID_REDHAT_MDPY        0x000f
>  #define PCI_DEVICE_ID_REDHAT_NVME        0x0010
>  #define PCI_DEVICE_ID_REDHAT_QXL         0x0100
> +#define PCI_DEVICE_ID_REDHAT_PVPANIC     0x0101

qxl has 0x100 for historical reasons, otherwise devices are simply
enumerated upwards.  NVME has 0x10, so PVPANIC should simply take
the next free which is 0x11.  Didn't I mention that in my last mail?

thanks,
  Gerd


