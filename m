Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C526F35AC
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 18:26:34 +0100 (CET)
Received: from localhost ([::1]:46388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSlYG-0003qa-Fa
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 12:26:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51611)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cminyard@mvista.com>) id 1iSlXP-0003HF-Iz
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 12:25:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cminyard@mvista.com>) id 1iSlXN-0005Be-Vg
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 12:25:39 -0500
Received: from mail-yw1-xc42.google.com ([2607:f8b0:4864:20::c42]:39692)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <cminyard@mvista.com>) id 1iSlXN-0005B9-J2
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 12:25:37 -0500
Received: by mail-yw1-xc42.google.com with SMTP id d80so451123ywa.6
 for <qemu-devel@nongnu.org>; Thu, 07 Nov 2019 09:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=tK+EsN6zs3aDhv77AhMla1lU5UKC/kwH41zcMLcyUrg=;
 b=LAPBIfkFQ+emPFn0vBAQFUbaCYklfPSnKfJbCjamnzM7ts1k9TZxxLd0wVdTFLaOAX
 jg9iHSjPY70rOz93BDJIOIoIOIiwkokjqGa0D7OTO/L1EoCN2NbCBgM0/xDEKjahc9TQ
 kXAb4GkA+rWa/rQ2Ny9Tn/g1nXwea/Db5P/S5dN7yOOxlNHLnP8Y6tvc2A9qwCPP/ANm
 was/L15xtRqeLBIt5UdpWHEGdNSA43Z2hI8zU944VdfJHGQFK7jqSqC+5z1snshWMxIv
 rRpwtYD8bJksOipeU3ojW2hXuF/0YvEyKKHAqhx9MvZhRqPHxIjFcsLcIR4zQGmHdDSb
 YyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=tK+EsN6zs3aDhv77AhMla1lU5UKC/kwH41zcMLcyUrg=;
 b=U6n+R8KyU+ONcM1WoLqQfjc2u+3R8qtQ3m0sAJojYFp84xi96ZfpmPFXvZ0GaGkITj
 DwEwIhQ7wrfoXvm3knhrv1LnJ0EL4B6n28uuZyBOUJ4CSTGh7ToOZxIcv0UQbLrZBBWm
 0IRE8cePAh/OYFYAdXpBdxbf4ZZjJLxtn//M+xxfla5gg+W2MbvIk7SJRTysOxdtf/Cg
 did06PHAaAKLX/KrBpAkHY0+pIMWPKzLHDyHoELve0T87qt+uVLFfU0QfDR8toCHVJOg
 vt865tG9cYiGzx8CcEN/x9OLNL07VCdw2FesqVF1etC1aGS6Xtjn2pS9Pvblyfyr2LIu
 AAZw==
X-Gm-Message-State: APjAAAWKoWu64fN7DBPR6Cn5Y+JbO34ALWqVRcAwNO4yetaRxH/qtBiP
 BEtgyrCysz5LRAFahZWsqByt7iGT6rDcKg==
X-Google-Smtp-Source: APXvYqz2AOSqQ13YoCf1LGE1ymYNztB3t1hUPGVlZax5ARKfwh73OXV46mNhygr4qswNEtP1iBY2yA==
X-Received: by 2002:a05:6830:1f4b:: with SMTP id
 u11mr2041670oth.60.1573147534822; 
 Thu, 07 Nov 2019 09:25:34 -0800 (PST)
Received: from minyard.net ([47.184.136.59])
 by smtp.gmail.com with ESMTPSA id u204sm879897oig.35.2019.11.07.09.25.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 07 Nov 2019 09:25:34 -0800 (PST)
Date: Thu, 7 Nov 2019 11:25:32 -0600
From: Corey Minyard <cminyard@mvista.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 2/5] ipmi: Add support to customize OEM functions
Message-ID: <20191107172532.GH10313@minyard.net>
References: <20191021131215.3693-1-clg@kaod.org>
 <20191021131215.3693-3-clg@kaod.org> <20191021143017.GH25427@t560>
 <20191027174739.GN3552@umbus.metropole.lan>
 <20191027183347.GC2461@minyard.net>
 <20191107170025.GD2461@umbus.Home>
 <156e5bd5-726c-2db5-4b24-394d5ec0f268@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <156e5bd5-726c-2db5-4b24-394d5ec0f268@kaod.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c42
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
Reply-To: cminyard@mvista.com
Cc: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Joel Stanley <joel@jms.id.au>, "Marty E . Plummer" <hanetzer@startmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 07, 2019 at 06:14:58PM +0100, Cédric Le Goater wrote:
> >>> What's the plan for merging this, once it's ready?  Is there an IPMI
> >>> tree for it to be staged in?  If not I could take it through the ppc
> >>> tree, but I'd need some Acked-bys in that case.
> >>
> >> I have an IPMI tree for this.  I was assuming it was going in to the PPC
> >> tree, but it's not big deal.
> > 
> > I'd be more comfortable if the generic ipmi changes went through the
> > ipmi tree.  
> 
> Here is the patch :
> 
> 	http://patchwork.ozlabs.org/patch/1185187/

Ok, I have this in my tree.

I assume there is nothing like the linux-next tree for qemu, right?

-corey

> 
> 
> > Note that I've moved the initial ppc specific patch from
> > my ppc-for-4.2 tree to my ppc-for-4.3 tree, since it missed my
> > previous pull request and it's not really post-freeze material.
> 
> OK. I was wondering where it had gone.
> 
> Thanks,
> 
> C.

