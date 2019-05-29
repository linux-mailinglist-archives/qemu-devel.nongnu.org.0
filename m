Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF3C2D338
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 03:22:29 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45251 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVnIS-0001Ob-Ds
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 21:22:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47686)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hVnHY-00016p-Rk
	for qemu-devel@nongnu.org; Tue, 28 May 2019 21:21:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hVnHX-0001Xe-1H
	for qemu-devel@nongnu.org; Tue, 28 May 2019 21:21:32 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40167)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hVnHS-0001S1-5J
	for qemu-devel@nongnu.org; Tue, 28 May 2019 21:21:28 -0400
Received: by mail-wm1-f65.google.com with SMTP id 15so359312wmg.5
	for <qemu-devel@nongnu.org>; Tue, 28 May 2019 18:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ycYOtGiWthinXl/Acj8a7yeW0iGtvdSx5stpHQ0pLsk=;
	b=g2urJD0uiBBLxtfj97r3VOZTkvy5yHdF8hByvnQQe996F0DXJBg3fsJI68Er+pIkIM
	dEIEQpp+UfnUWhEF4BjsREjmluEVboCiMtMD89Oh9u77GDwOld32F6+3oHXvK6R/bGJE
	DWVGyvy5cBlMaxeSAvtjZE7lUFXkaoZ3DT3GHiqTcze+Gy3E/V45lyENnEDc8CUsGXfg
	rsxh+s4jr9N90g9vAtx6tbknK9IthjlY9WVknDWo/GMLslMJnZBIj8EZnhrIb+oHl/OL
	Gu8Z63t5g/HKRlyE8vlwtdYptnKGSX+4F7VdCvXoIcSheNv+ToVDmsFRW+ULLm/FwUGG
	pFKw==
X-Gm-Message-State: APjAAAWmgW7MXOZY7EAIo+EA65h4a3hMwOTXLZdbFu3OdqwMJV61CImc
	ChFR5fJYRmNPXdErsFHlQ/QRYw==
X-Google-Smtp-Source: APXvYqwzL8tm/m5Os0a/FasPn2DjbMILphwdxDuTsMvVG3iX5GScFGcVa/5u90NmQuX0n2aicBUsPg==
X-Received: by 2002:a1c:7c07:: with SMTP id x7mr4595427wmc.60.1559092878354;
	Tue, 28 May 2019 18:21:18 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.166.5])
	by smtp.gmail.com with ESMTPSA id z5sm4216771wma.36.2019.05.28.18.21.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 May 2019 18:21:17 -0700 (PDT)
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20190528204838.21568-1-kraxel@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bf45adf2-1594-89b4-6a4d-9af6d9e8ac6e@redhat.com>
Date: Wed, 29 May 2019 03:21:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528204838.21568-1-kraxel@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-devel] [PATCH] q35: split memory at 2G
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
Cc: Richard Henderson <rth@twiddle.net>,
	=?UTF-8?B?TMOhc3psw7Mgw4lyc2Vr?= <lersek@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/05/19 22:48, Gerd Hoffmann wrote:
> Original q35 behavior was to split memory 2.75 GB, leaving space for the
> mmconfig bar at 0xb000000 and pci I/O window starting at 0xc0000000.
> 
> Note: Those machine types have been removed from the qemu codebase
> meanwhile because they could not be live-migrated so there was little
> value in keeping them around.
> 
> With the effort to allow for gigabyte-alignment of guest memory that
> behavior was changed:  The split was moved to 2G, but only in case the
> memory didn't fit below 2.75 GB.
> 
> So today the address space between 2G and 2,75G is not used for guest
> memory in typical use cases, where the guest memory sized at a power of
> two or a gigabyte number.  But if you configure your guest with some odd
> amout of memory (such as 2.5G) the address space is used.

Wasn't it done to ensure pre-PAE OSes could use as much memory as
possible?  (If you run pre-PAE OSes with more RAM than can fit below 4G,
you can just reduce the amount of memory and get all the 2.75G).

Paolo

