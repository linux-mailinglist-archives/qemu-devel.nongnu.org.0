Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBED1A08A3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 09:50:19 +0200 (CEST)
Received: from localhost ([::1]:42726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLizy-0006VG-NS
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 03:50:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44722)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <xadimgnik@gmail.com>) id 1jLiz0-000645-AA
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 03:49:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <xadimgnik@gmail.com>) id 1jLiyz-0003u1-9V
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 03:49:18 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:35633)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <xadimgnik@gmail.com>) id 1jLiyz-0003ta-3J
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 03:49:17 -0400
Received: by mail-ed1-x531.google.com with SMTP id c7so2864945edl.2
 for <qemu-devel@nongnu.org>; Tue, 07 Apr 2020 00:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=hCFsI0tRly3fEAw6eHDpGPEY0YQTFBswp1wCtUkIPBs=;
 b=cUgtZKNA5LYPJBw2MJhfpTYRO/TMI1qF+fuQW9RDCzgom2SyX1t06R4D9TPP5/Z5r6
 2O1XqwMe4pHK10JGHzroASnVAyJ+8PTem7dVxpWnRrthaerkAjIpQG10gNBkamoXCUdt
 t6cvNP7N9hzZkvK+jnQFh/yxGDpvqQWm5b25P3+7Asuf9EStF8/qBMEhAfdwLVgGltMY
 yWnOleMjbdveCpelnoJaxpwK//uPZ58j3Bd/b8B9/RszpRmDyTiaQrAXwxCAumfeBx0W
 6Lhxfj6Vi/6aLHFD0zakmJksrm8DEfoafWeqdTCC0CENldkF8pYs2BIAG6D4gE2vRr/F
 sDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=hCFsI0tRly3fEAw6eHDpGPEY0YQTFBswp1wCtUkIPBs=;
 b=shr0O7i0i9TvGQtm4X31Dpi5Il2PsRMjK3fqk3/BIi4jgsQD/U+xETUThwBEPMffVS
 qEhsJpKCMnGAE6Ag2qvYh5JkAc8tEp6+HKNyK3bZPBFiWpTghAxZoSQJaJ1OsBVmNkkB
 3ZjIkILFMJ0yHHrBVkQ3dRSiF0SKTCr5MiDm1bOFQPfKtJlVOpSmAv2/qHUmc6sm1GQf
 zGskAwRg2leDZ91C4c9auD855Cn5iZqU4vlcJCrRkacfORKyzkn+UDfu9iY6Z3BaON+S
 BtqbbYoO3Qf6SBjt/2o+1QMJJLM1ft64xngZlZeCA8lyh7SW3H9hlmQIG2qlr42GL/A3
 QLwg==
X-Gm-Message-State: AGi0PuYrLprZg2Y26bdXmFaqicfTApyj1Cob63qFcBXWo/ajaqIkAAQh
 y5+L9dScp+SVjjL6NunR1pE=
X-Google-Smtp-Source: APiQypKbTaeNkoAD8ySkbrAIYlJrIbO/xMstZc3tplqLIRq/tsD/VuWdz2TvnJWAThRHAlfRkbsbow==
X-Received: by 2002:aa7:c809:: with SMTP id a9mr785551edt.180.1586245755976;
 Tue, 07 Apr 2020 00:49:15 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id qu11sm236286ejb.12.2020.04.07.00.49.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Apr 2020 00:49:15 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Anthony PERARD'" <anthony.perard@citrix.com>,
	<qemu-devel@nongnu.org>
References: <20200406165043.1447837-1-anthony.perard@citrix.com>
In-Reply-To: <20200406165043.1447837-1-anthony.perard@citrix.com>
Subject: RE: [PATCH] MAINTAINERS: Add xen-usb.c to Xen section
Date: Tue, 7 Apr 2020 08:49:14 +0100
Message-ID: <001601d60cb1$08f29a70$1ad7cf50$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJR3BKp9rfA1CQSVnqrrhzVGH+NL6d1qc9A
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::531
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
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> -----Original Message-----
> From: Anthony PERARD <anthony.perard@citrix.com>
> Sent: 06 April 2020 17:51
> To: qemu-devel@nongnu.org
> Cc: Stefano Stabellini <sstabellini@kernel.org>; Paul Durrant <paul@xen.org>; Anthony PERARD
> <anthony.perard@citrix.com>
> Subject: [PATCH] MAINTAINERS: Add xen-usb.c to Xen section
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Paul Durrant <paul@xen.org>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9d156d73b31e..839959f7e4ac 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -440,6 +440,7 @@ F: hw/9pfs/xen-9p*
>  F: hw/char/xen_console.c
>  F: hw/display/xenfb.c
>  F: hw/net/xen_nic.c
> +F: hw/usb/xen-usb.c
>  F: hw/block/xen*
>  F: hw/block/dataplane/xen*
>  F: hw/xen/
> --
> Anthony PERARD



