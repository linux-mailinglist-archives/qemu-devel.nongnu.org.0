Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0414075BD
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 11:19:21 +0200 (CEST)
Received: from localhost ([::1]:58010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOzAO-0001l3-Vm
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 05:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1mOz90-0000Mk-UX
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 05:17:54 -0400
Received: from relay.yourmailgateway.de ([185.244.192.111]:49645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1mOz8y-0004Xa-2U
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 05:17:54 -0400
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
 by relay01-mors.netcup.net (Postfix) with ESMTPS id 4H66bJ0xSSz7wXp;
 Sat, 11 Sep 2021 11:17:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zapateado.de; s=key2;
 t=1631351868; bh=rP7w05X5TFlp9mlz1cosUpZ/avJmXISI2VgiEJeNjRQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QyKpsLF83XPyUvlJRqyVpwa/HzV5mkApy+sJbYvK88iDQxLGtgXU0PXbPZjdr6rH1
 Cg3CakUhTlrkf+Zlwi0uNhVo3R8GVr4MmwRieP8n1KJK59azC0ryV6Dactj5rpi5OQ
 wt+rbkiQQxXXjZJrJhTMvhq0S6HPqBusQarxPCN6VZPnzU52No7DCqrOTNMgEb+VrS
 vJfaNXQIIns9EqkcqVKkouvGYshfAXnP4DfvLBghtwXkQ+ko6yTmVdSGNopsQUJScx
 jXjdNOhp3irsAtKFU2guskau24ZXM0lT0v7PElkp/C6s1ruR0dtHUfdtT3HEyquXdz
 kF+kJgsbQxVnA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by relay01-mors.netcup.net (Postfix) with ESMTPS id 4H66bJ0ZNyz7tnJ;
 Sat, 11 Sep 2021 11:17:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
X-Spam-Score: -2.901
Received: from mx2f6e.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4H66bH2lqPz8sgy;
 Sat, 11 Sep 2021 11:17:47 +0200 (CEST)
Received: from [192.168.54.9] (ip-95-223-69-41.hsi16.unitymediagroup.de
 [95.223.69.41])
 by mx2f6e.netcup.net (Postfix) with ESMTPSA id AA743626A5;
 Sat, 11 Sep 2021 11:17:46 +0200 (CEST)
Authentication-Results: mx2f6e;
 spf=pass (sender IP is 95.223.69.41) smtp.mailfrom=hk@zapateado.de
 smtp.helo=[192.168.54.9]
Received-SPF: pass (mx2f6e: connection is authenticated)
Subject: Re: [qemu-web PATCH] Fix link to Windows page in Wiki
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Howard Spoelstra <hsp.cat7@gmail.com>
References: <6755edb6-f953-4ca2-a4b6-31e4566e9842@zapateado.de>
 <af33f36e-e319-e95c-36bc-9c77f4ad81b8@redhat.com>
 <e7df1647-439a-9bda-5c7b-30ab0290d587@zapateado.de>
 <CABLmASEuNT2WVocMwakuhhYDvVBB0YdFueP24ULRFQ1Z35eKPg@mail.gmail.com>
 <6ae0c8d0-4601-4c2c-c0cd-590f2a86a104@ilande.co.uk>
From: Helge Konetzka <hk@zapateado.de>
Message-ID: <43043204-cb7a-5726-ecfc-9dad504f6aa3@zapateado.de>
Date: Sat, 11 Sep 2021 11:17:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <6ae0c8d0-4601-4c2c-c0cd-590f2a86a104@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <163135186699.11608.16124786936368515276@mx2f6e.netcup.net>
X-PPP-Vhost: konetzka.de
X-NC-CID: n65HC/mIj2F6+IzMY1rFcEBPVHde2LSj3+NWUDYOnNBv
Received-SPF: pass client-ip=185.244.192.111; envelope-from=hk@zapateado.de;
 helo=relay.yourmailgateway.de
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.349,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.09.21 um 11:03 schrieb Mark Cave-Ayland:

> So the question is: what has changed? I find it hard to believe that 
> MSYS2/MingW64 is configured out-of-the-box to break a standard 
> "./configure && make" build incantation.
> 

On my last attempt to build qemu without 
--cross-prefix=x86_64-w64-mingw32- (qemu-6.1.0.tar.xz) for building 
target soft-mmu-x86_64 I received

make[1]: *** No rule to make target 'multiboot.bin', needed by 'all'.  Stop.
make: *** [Makefile:189: pc-bios/optionrom/all] Error 2
make: *** Waiting for unfinished jobs....
...
[1599/1599] Generating QAPI rST doc reference newline-sanitized with a 
custom command (wrapped by meson to capture output)
==> ERROR: A failure occurred in build().
     Aborting...

