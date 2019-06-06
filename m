Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE0837C2F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 20:23:48 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36511 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYx3D-0006IO-6R
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 14:23:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hYwzu-0003Vq-TI
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 14:20:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hYwzt-0000UN-WF
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 14:20:22 -0400
Received: from mail-qt1-f178.google.com ([209.85.160.178]:40392)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1hYwzt-0000TS-SY
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 14:20:21 -0400
Received: by mail-qt1-f178.google.com with SMTP id a15so3798170qtn.7
	for <qemu-devel@nongnu.org>; Thu, 06 Jun 2019 11:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=QyAcNtUFB8xdCi76myNy6Kjfjm014zJkGzxJXNm0UUI=;
	b=ZJC/gFqOinxzt43AfUwyIe5E0RQLmoEu5jgo+xKrMImy9kmWVrzZV2X4ehuTxTn9tF
	Q8x97yM5PJvhHPVIqCvVm4+2Kqgtx2QwpyGllbomtg/8xm8lEnYbq3+9hu774TUo/PXV
	0pjBEKQ3f0AHH1SeqmWHYJYfenUm+gOQEBN4hQ+QKfjarxvGUQECXIimpmRkml3sNk5g
	AiNVOt1TDoruAtnchJCAn1PspqCqVn6/2pSek6w8VVRfpAK2/I+GEJ+qsi0edHpk5z2E
	TO5Un0i1fQBNYmm0SY27izhEFu/OLOtEJC9MXuUTNQ0idhaLWUCsSBtIf34JhWupU315
	9u3w==
X-Gm-Message-State: APjAAAXw3XBq/eV8C7pXsdpC6NFu5ZjZujS71v4P61syYIKLi6rm+uGd
	qdGfBGB06SSzG2RsEy7nkMT15Q==
X-Google-Smtp-Source: APXvYqzIff5aWeFmd8zK6g1eaqndHFWovb294PDehUIDvpCDiXPc62uo+3qcc2eRwkqim76uSlz0dg==
X-Received: by 2002:aed:220e:: with SMTP id n14mr13840148qtc.388.1559845220911;
	Thu, 06 Jun 2019 11:20:20 -0700 (PDT)
Received: from redhat.com (pool-100-0-197-103.bstnma.fios.verizon.net.
	[100.0.197.103]) by smtp.gmail.com with ESMTPSA id
	n19sm1066083qkg.58.2019.06.06.11.20.19
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 06 Jun 2019 11:20:20 -0700 (PDT)
Date: Thu, 6 Jun 2019 14:20:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Kashyap Chamarthy <kchamart@redhat.com>
Message-ID: <20190606141904-mutt-send-email-mst@kernel.org>
References: <20190606161943.GA9657@paraplu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190606161943.GA9657@paraplu>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.178
Subject: Re: [Qemu-devel] PCI(e): Documentation "io-reserve" and related
 properties?
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 06, 2019 at 06:19:43PM +0200, Kashyap Chamarthy wrote:
> Hi folks,
> 
> Today I learnt about some obscure PCIe-related properties, in context of
> the adding PCIe root ports to a guest, namely:
> 
>     io-reserve
>     mem-reserve
>     bus-reserve
>     pref32-reserve
>     pref64-reserve
> 
> Unfortunately, the commit[*] that added them provided no documentation
> whatsover.
> 
> In my scenario, I was specifically wondering about what does
> "io-reserve" mean, in what context to use it, etc.  (But documentation
> about other properties is also welcome.)
> 
> Anyone more well-versed in this area care to shed some light?
> 
> 
> [*] 6755e618d0 (hw/pci: add PCI resource reserve capability to legacy
>     PCI bridge, 2018-08-21)

So normally bios would reserve just enough io space to satisfy all
devices behind a bridge. What if you intend to hotplug more devices?
These properties allow you to ask bios to reserve extra space.

> -- 
> /kashyap

