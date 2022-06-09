Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FADD544526
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 09:55:44 +0200 (CEST)
Received: from localhost ([::1]:54714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzD15-0002M2-7C
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 03:55:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1nzCwH-0000Iy-MS
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 03:50:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1nzCvy-0002SI-RS
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 03:50:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654761026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=brUwTVmCSy0mM0fxI7ugSKgMUOyvDlFLit2U2bby8AM=;
 b=Tqk5W9dj/YsZ03dEUP69J6FujRR3w3lol8ESAw7HhhzZl7f6D56eYGDa6LE1cqIHJwmTse
 ONQ4e9348IR4w79CAjspj/HgMdIikJ4wYJAsicIFwaLgqRxuyqwPA/KxuD4V5aLqOihll3
 e7mKleqEpaWaXr1t/fU10BL01hmjj8M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-tMNnuV6WM-a8N7s4ZAzCfQ-1; Thu, 09 Jun 2022 03:50:24 -0400
X-MC-Unique: tMNnuV6WM-a8N7s4ZAzCfQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3139B294EDCA;
 Thu,  9 Jun 2022 07:50:24 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB90D1121314;
 Thu,  9 Jun 2022 07:50:22 +0000 (UTC)
Subject: Re: [RFC][PATCH] docs: note exception for PCIe IO port access
From: Laszlo Ersek <lersek@redhat.com>
To: Kevin Locke <kevin@kevinlocke.name>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel@redhat.com>, Laine Stump <laine@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alex Williamson <alex.williamson@redhat.com>
References: <922cc3081ff9c986188f881ef4d1cf15bd3adf48.1654739990.git.kevin@kevinlocke.name>
 <63e991af-0dd2-3aea-2f15-7460a6fb87db@redhat.com>
Message-ID: <06171fb8-3a7e-81f3-12dd-b5332d99c1dd@redhat.com>
Date: Thu, 9 Jun 2022 09:50:21 +0200
MIME-Version: 1.0
In-Reply-To: <63e991af-0dd2-3aea-2f15-7460a6fb87db@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/09/22 09:45, Laszlo Ersek wrote:
> +Alex
> 
> On 06/09/22 04:00, Kevin Locke wrote:

> *In theory*, scenario (b) applies to "bochs-display" and
> "virtio-gpu-pci" when you plug them into a legacy PCI slot:
> 
>> Plugging a PCI Express device into a PCI slot will hide the Extended
>> Configuration Space thus is also not recommended.
> 
> But this is fine, as these device models don't have extended
> capabilities in practice. IOW, I'd imagine them (if they were physical
> cards) as PCI Express devices without any use for their extended config
> spaces. You could plug them into legacy PCI slots, but would see no
> difference in behavior (apart from speed perhaps).

Ignore the part starting with "IOW", that seems like brain fart on my
part, apologies! :/


