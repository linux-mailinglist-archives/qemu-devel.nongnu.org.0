Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D082D5503
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 09:03:00 +0100 (CET)
Received: from localhost ([::1]:34388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knGuh-000061-VY
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 03:03:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knGsf-0007nX-0j
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 03:00:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knGsd-0005G5-6q
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 03:00:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607587249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QVub0RJ7wXcM82CwqhhMjJ/8FVcK7k0QkupyLh1WwtA=;
 b=Zq+IhUYTzOvam7GLRQsNQPuKgY3kXbui0A35j78AEBTDU+8zB++VR51+Rm/t0h7pm3m5jL
 nh3kYom2F0maQ4MpoiY7SoYux8B+WZtaWmBQS40l8anOOUuydcQg2sNMov9jQN1t1Whn1b
 BChFNylTzqVma7byRNEATEXGD1uf1Ag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-bvN80gNfPR2C3DoF-BqgFQ-1; Thu, 10 Dec 2020 03:00:46 -0500
X-MC-Unique: bvN80gNfPR2C3DoF-BqgFQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6403410054FF;
 Thu, 10 Dec 2020 08:00:44 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-62.ams2.redhat.com [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6AD25D6AC;
 Thu, 10 Dec 2020 08:00:42 +0000 (UTC)
Subject: Re: [Bug 1907427] [NEW] Build on sparc64 fails with "undefined
 reference to `fdt_check_full'"
To: Bug 1907427 <1907427@bugs.launchpad.net>, qemu-devel@nongnu.org
References: <160750521215.10480.16469807239042219779.malonedeb@wampee.canonical.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8b7b0f87-c0ae-1fe7-b4d3-16111ed3d956@redhat.com>
Date: Thu, 10 Dec 2020 09:00:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <160750521215.10480.16469807239042219779.malonedeb@wampee.canonical.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/12/2020 10.13, John Paul Adrian Glaubitz wrote:
> Public bug reported:
> 
> Trying to build QEMU on sparc64 fails with:
[...]
> /usr/bin/ld: libqemu-ppc64-softmmu.fa.p/hw_ppc_spapr_hcall.c.o: in function `h_update_dt':
> ./b/qemu/../../hw/ppc/spapr_hcall.c:1966: undefined reference to `fdt_check_full'
> collect2: error: ld returned 1 exit status
> 
> Full build log available at:
> https://buildd.debian.org/status/fetch.php?pkg=qemu&arch=sparc64&ver=1%3A5.2%2Bdfsg-1&stamp=1607502300&raw=0

Looking at the build log, it seems like your system libfdt is version 1.4.6.
However, that fdt_check_full function is only properly available with
version >= 1.5.1, if I get that right.

As a workaround, you could try to run the configure script with
--enable-fdt=git (or of course update your system version to 1.5.1 if
somehow possible).

But anyway, this also means that the check in the QEMU build system is
likely wrong. But it's weird, I can see that we explicitely test for
fdt_check_full() in the meson.build script, so no clue what's going wrong
here. David, do you have an idea?

 Thomas


