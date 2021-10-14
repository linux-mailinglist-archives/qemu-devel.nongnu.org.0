Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D64642D6E7
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 12:24:28 +0200 (CEST)
Received: from localhost ([::1]:33730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maxuV-0002HZ-74
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 06:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1maxtA-0001c0-T2
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 06:23:04 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:21577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1maxt8-0002f7-BR
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 06:23:04 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D762B7463B7;
 Thu, 14 Oct 2021 12:22:58 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B85C7746333; Thu, 14 Oct 2021 12:22:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id B66F17462D3;
 Thu, 14 Oct 2021 12:22:58 +0200 (CEST)
Date: Thu, 14 Oct 2021 12:22:58 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3] hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI
 interrupts
In-Reply-To: <20211014091035.xlhh74aioxhkxelf@sirius.home.kraxel.org>
Message-ID: <1e91fd14-f112-b5b7-abfb-117cbb109c39@eik.bme.hu>
References: <20211013121929.9E835746333@zero.eik.bme.hu>
 <20211014091035.xlhh74aioxhkxelf@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Philippe M-D <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Oct 2021, Gerd Hoffmann wrote:
> On Wed, Oct 13, 2021 at 02:13:09PM +0200, BALATON Zoltan wrote:
>> This device is part of a superio/ISA bridge chip and IRQs from it are
>> routed to an ISA interrupt set by the Interrupt Line PCI config
>> register. Change uhci_update_irq() to allow this and implement it in
>> vt82c686-uhci-pci.
>
> Looks good.  There are some unrelated changes in though (whitespace,
> comments, ...), and the vt82c686-uhci-pci.c changes should be a
> separate patch.

So you mean split it into a series of three small patches? Should I do a 
w4 with that?

Regards,
BALATON Zoltan

