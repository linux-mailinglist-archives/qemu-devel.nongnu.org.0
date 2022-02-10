Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C46A4B0E4B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 14:20:06 +0100 (CET)
Received: from localhost ([::1]:42954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI9Mj-0002I4-Dy
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 08:20:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nI8g1-0002iN-PI
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 07:35:59 -0500
Received: from [2607:f8b0:4864:20::102a] (port=33084
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nI8fp-00051G-W3
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 07:35:56 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 k60-20020a17090a4cc200b001b932781f3eso1798508pjh.0
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 04:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=sGyQknuyCzYaU87Fh/CjDkAueFdNxD1aEqzjBuVQnlw=;
 b=LYs+0eTzVwy00PuTD5/N6w+svYnFUfQvSrmcLPedlbRYDNFPnV/R3KEW4ojoRI52W7
 cN9XusFV4KZS/c1lND26+Jw6/b9B5o/oWKsH9SbQ+sVbq3ZJEsSv5PVLB8uulPz7XGb5
 eIcMCG0jeDp7OavWOoxpE8C+Clt+NC6WI5fX+oPNvnr5+vRvdjcI896aDgUtMSvDkURu
 bZdpY9DutBhf4junn/yKhYm8bJ9I5RfA/AkMvxbUcTg9P5D7sxp9IqB0Pwsq4A535eR/
 Xpx9wX2p6qFbPzBGm3ODGUNlmat/8uw3/73Af9LlgxoETZ4WG7txm77qaYgldLGqVbFK
 CpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=sGyQknuyCzYaU87Fh/CjDkAueFdNxD1aEqzjBuVQnlw=;
 b=S27ffR9rCg0Mp/FQpQ8moYVq6+0LhbasqMoFIDBPmlkcHlcvwHXsekQ2ht10Wt2b/a
 HbJCefnif7eGGwX3Kyt63mwFVdcZFJApN1BkSQ45Q+n9kNp8T/p0g/lmjIpPSHlU0YVT
 8fgD7WC8JbcwByBeGYNQSG3guH/4OFdtvkQgz/IlHQHnFI5c0eK8aJIx0RsfhB5AzI5M
 2xUTdo62JdL+BF3lST6wwiG5Byw2Y1hP8uH7aNIRX75+MxdaCZq0y1VvbbKaNe7hjqNM
 2ZNt9MHAU6OcgwKCjh0yeN3Vn6u02XjyPV4ViflCAvRFvdngNSDGjiuRW8dCkNgJOcTu
 A29g==
X-Gm-Message-State: AOAM532FrUdBpLiyaI/M5nakAncWvMWx09mk6shGr/Oz1Qprty8ihZqV
 eCgXSFB6eKIOtSggaBaT4HlPEYiOivyIuWbs
X-Google-Smtp-Source: ABdhPJxVTD7Owxlzst7mJrv4FTHwe/PANmSi/HALSjR4D6RERRWcLZHQf4bVpwFSfA9qJ1lyNVusDw==
X-Received: by 2002:a17:902:c409:: with SMTP id
 k9mr7240921plk.91.1644496498986; 
 Thu, 10 Feb 2022 04:34:58 -0800 (PST)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id l8sm25023576pfc.187.2022.02.10.04.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 04:34:58 -0800 (PST)
Date: Thu, 10 Feb 2022 21:34:56 +0900
From: Stafford Horne <shorne@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 3/4] hw/openrisc/openrisc_sim; Add support for loading a
 decice tree
Message-ID: <YgUGcFLa1rvK3g3X@antec>
References: <20220210063009.1048751-1-shorne@gmail.com>
 <20220210063009.1048751-4-shorne@gmail.com>
 <74fb88b1-8d17-b782-22d6-45bfe400bbf9@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <74fb88b1-8d17-b782-22d6-45bfe400bbf9@amsat.org>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=shorne@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: QEMU Development <qemu-devel@nongnu.org>, Jia Liu <proljc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 10, 2022 at 12:10:54PM +0100, Philippe Mathieu-Daudé wrote:
> Typo "device" in subject.

OK.

> On 10/2/22 07:30, Stafford Horne wrote:
> > Using the device tree means that qemu can now directly tell
> > the kernel what hardware is configured rather than use having
> > to maintain and update a separate device tree file.
> > 
> > This patch adds device tree support for the OpenRISC simulator.
> > A device tree is built up based on the state of the configure
> > openrisc simulator.
> > 
> > This is then dumpt to memory and the load address is passed to the
> 
> "dumped"?

Yes.

> > kernel in register r3.
> > 
> > Signed-off-by: Stafford Horne <shorne@gmail.com>
> > ---
> >   hw/openrisc/openrisc_sim.c | 158 ++++++++++++++++++++++++++++++++++++-
> >   1 file changed, 154 insertions(+), 4 deletions(-)
> > 
> > diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
> > index 5a0cc4d27e..d7c26af82c 100644
> > --- a/hw/openrisc/openrisc_sim.c
> > +++ b/hw/openrisc/openrisc_sim.c
> > @@ -29,14 +29,20 @@
> >   #include "net/net.h"
> >   #include "hw/loader.h"
> >   #include "hw/qdev-properties.h"
> > +#include "exec/address-spaces.h"
> > +#include "sysemu/device_tree.h"
> >   #include "sysemu/sysemu.h"
> >   #include "hw/sysbus.h"
> >   #include "sysemu/qtest.h"
> >   #include "sysemu/reset.h"
> >   #include "hw/core/split-irq.h"
> > +#include <libfdt.h>
> 
> Watch out, you now need to add TARGET_NEED_FDT=y
> to configs/targets/or1k-softmmu.mak.

OK, I will add it in this patch.  I missed that part.

