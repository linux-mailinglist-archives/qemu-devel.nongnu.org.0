Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD08BF13B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 13:24:26 +0200 (CEST)
Received: from localhost ([::1]:34144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDRsn-0000kc-Hc
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 07:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53004)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bigeasy@linutronix.de>) id 1iDRrP-0007vq-2H
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 07:23:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bigeasy@linutronix.de>) id 1iDRrN-0006Ed-RY
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 07:22:58 -0400
Received: from galois.linutronix.de ([193.142.43.55]:44919)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bigeasy@linutronix.de>)
 id 1iDRrN-0006DR-Lv
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 07:22:57 -0400
Received: from bigeasy by Galois.linutronix.de with local (Exim 4.80)
 (envelope-from <bigeasy@linutronix.de>)
 id 1iDRqI-00055u-EF; Thu, 26 Sep 2019 13:21:50 +0200
Date: Thu, 26 Sep 2019 13:21:50 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] i386: Add CPUID bit for CLZERO and XSAVEERPTR
Message-ID: <20190926112150.mrzprupzivzbkt6o@linutronix.de>
References: <20190925214948.22212-1-bigeasy@linutronix.de>
 <ae0c4623-5b1f-ae6b-2062-12b13ecc7a77@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ae0c4623-5b1f-ae6b-2062-12b13ecc7a77@redhat.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.142.43.55
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
Cc: qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2019-09-26 13:06:34 [+0200], Paolo Bonzini wrote:
> On 25/09/19 23:49, Sebastian Andrzej Siewior wrote:
> >  #define CPUID_7_0_EDX_SPEC_CTRL_SSBD  (1U << 31) /* Speculative Store Bypass Disable */
> >  
> > +#define CPUD_800_008_EBX_CLZERO		(1U << 0) /* CLZERO instruction */
> > +#define CPUD_800_008_EBX_XSAVEERPTR	(1U << 2) /* Always save/restore FP error pointers */
> >  #define CPUID_8000_0008_EBX_WBNOINVD  (1U << 9)  /* Write back and
> 
> Well, there are obvious typos here but I can fix them for you.

Sorry for the missing I.

> Which processors have these?

There are mention in AMD document [0]. I *think* there were introduced
in Zen, see them on a Ryzen and Epyc.

[0] https://www.amd.com/system/files/TechDocs/24594.pdf

> Paolo

Sebastian

