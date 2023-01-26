Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7855067D7B4
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 22:28:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL9lx-0008L6-TM; Thu, 26 Jan 2023 16:27:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pL9lw-0008Kg-46
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 16:27:04 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pL9lu-0003gu-BR
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 16:27:03 -0500
Received: by mail-wm1-x336.google.com with SMTP id fl24so2127518wmb.1
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 13:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:to:from:date:from:to:cc:subject:date:message-id
 :reply-to; bh=sJ6Mfr0BAuDTuaNEu397fFLI8asfpDDww1agUQinN58=;
 b=PBHLcd1L1pmOgPNUoXVndhD79Id7lHPIcsGq/ci0SieSVVOXle8XlMr4eyopO71mDz
 nHLbBox6iQFg2wHaSOQMrB753nYeJXwYztvQJSflH75cDFei6DXtRdHRAcJ+b0iiBl/u
 gkr7+NQJ55UsouhOUefuPKqEhOEqRVwpW7K1lHCaznQETnRwXQoqrcTRtGq2GmZsZb0a
 j5zq7KkO3rRWoux1m7AKWORISN1xPFQSYoJClWA60kvF5IjQSxBzd9I3QEhsqlrPfoYK
 rLDLDwS0M+H/Y/SgqC6hIludoNY50nHxnWQZYPnWaL/ri3KbQIismoylIO2BxzPywBH8
 wkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sJ6Mfr0BAuDTuaNEu397fFLI8asfpDDww1agUQinN58=;
 b=xgrPDjl0I+cgV+LYRw8Zn2HDdJk5i2fXUCO0dzo2kKv+gp26NjR8ge3stqah+Ai51S
 0ix4nECM3AjGDvQmupqT6vVXVANZam5oz4DA7plKIoFaX2TrJaPC9C8Npl1jQC6BcsRR
 +PEeAZM4ToOuh1S3llw4egVlM3bEoCldWMPc1bTorFnKWJ9rrt6iPqPILLnp3NmRRJwO
 3fw/4GDp82aaonim8fYzQTKjGkxEpEampp9A5P97pjeHvtcIYqg7CaX90FyuAerhGT8A
 T4tr3vyI4u9FcOIT8qzl0G4ltO9tdYb3pvrgOSTvfWO7V1917eS5kUgjbLCsGZA88D1Y
 l8yw==
X-Gm-Message-State: AFqh2kpdbyrsrRczWrMBh4RGQ4HzO0v0qxRLXKExRVKst7ZQjiIAoCF2
 LzYHd//yAupH3d/1iBK59FI=
X-Google-Smtp-Source: AMrXdXvrA85488ToBimagoGsNFqp53vyasOT1zKm8Nt4Y/+khBKYrG5KwXpR/IxHQSWHgzso/d4CXA==
X-Received: by 2002:a05:600c:1c02:b0:3d2:3b8d:21e5 with SMTP id
 j2-20020a05600c1c0200b003d23b8d21e5mr37065077wms.14.1674768420495; 
 Thu, 26 Jan 2023 13:27:00 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb2004c1ba1824932b7f6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:4c1b:a182:4932:b7f6])
 by smtp.gmail.com with ESMTPSA id
 ay6-20020a05600c1e0600b003db00747fdesm5786477wmb.15.2023.01.26.13.26.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 13:27:00 -0800 (PST)
Date: Thu, 26 Jan 2023 21:26:53 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: quintela@redhat.com, Juan Quintela <quintela@redhat.com>,
 kvm-devel <kvm@vger.kernel.org>, qemu-devel@nongnu.org
Subject: Re: Fortnightly KVM call minutes for 2023-01-24
In-Reply-To: <87zga8f0c0.fsf@secure.mitica>
References: <87zga8f0c0.fsf@secure.mitica>
Message-ID: <09D128C9-6633-4315-B312-827C875C20DB@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 24=2E Januar 2023 14:56:15 UTC schrieb Juan Quintela <quintela@redhat=
=2Ecom>:
>
>
>
>
>First part stolen from: https://etherpad=2Eopendev=2Eorg/p/qemu-emulation=
-bof%402023-01-24
>      thanks Phillippe
>
>Single QEMU-system binary and Dynamic Machine Models
>
>Meeting link: https://meet=2Ejit=2Esi/kvmcallmeeting
>Just want to dial in on your phone? Dial-in: +1=2E512=2E647=2E1431 PIN: 1=
518845548#
>Click this link to see the dial in phone numbers for this meeting https:/=
/meet=2Ejit=2Esi/static/dialInInfo=2Ehtml?room=3Dkvmcallmeeting
>
>What needs to be done?
>
>    TCG
>
>    How to use different page sizes
>
>    -> convert to page-vary (already used by ARM/MIPS)
>
>    ref: https://lore=2Ekernel=2Eorg/qemu-devel/20221228171617=2E059750c3=
@orange/
>
>
>    HW models / machine
>
>
>    How to create/realize 2 QOM objects which depend on each other?
>
>    what (properties) need to be wired? IRQ, reset lines, MR?
>
>
>    Sysbus: Demote it to plain qdev?
>
>    con:
>
>    sysbus helpful to remove qdev boilerplace/verbose code
>
>    sysbus tree does the resets [currently blocking qdev conversion]
>
>    pro:
>
>    sysbus IRQ API
>
>    too abstract, not very helpful, "named gpios" API is clearer
>
>    sysbus MMIO API
>
>    also kinda abstract, MRs indexed=2E No qdev equivalent
>
>    sysbus IO API:
>
>    not very used=2E first we need to get rid of ISA bus singleton

I've just submitted v2 of my patch series removing the ISA bus singleton: =
https://lore=2Ekernel=2Eorg/qemu-devel/20230126211740=2E66874-1-shentey@gma=
il=2Ecom

Best regards,
Bernhard

>
>
>    Single 32/64 *targets* binary
>
>    Which 32-bit hosts are still used? OK to deprecate them?
>
>    Some targets need special care i=2Ee=2E KVM 32-bit ARM vCPU on 64-bit=
 Aarch64 host
>
>
>Previous notes:
>    https://etherpad=2Eopendev=2Eorg/p/qemu-emulation-bof%402022-12-13
>    https://etherpad=2Eopendev=2Eorg/p/qemu-emulation-bof%402022-11-29
>
>
>Do we care about this?
>
>64 bits guests on 32 bits hosts: OK to deprecate
>32 bits hosts: still in (some) use
>
>Creating and realizing two objects than need to be linked together=2E
>
>We can't do it with realize, perhaps we need an intermediate state to
>do the link, and then realize=2E
>
>Can we get Peter or Markus or Paolo for the next call?
>waiting to get some patches into the list for discussing=2E
>
>Problem for Phillipe is that he has to do changes to the API's and
>want to be sure that they are agreed before he changes all
>devices/targets, a multi month task=2E
>
>For removing sysbus, we need to wait for reset rework from Peter?
>
>Expose the memory API to external processes=2E
>
>Under what circumstances you should be able to create/destroy a memory
>region?
>
>
>
>Later, Juan=2E
>
>

