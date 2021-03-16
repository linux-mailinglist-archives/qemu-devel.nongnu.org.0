Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7172233D9C4
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 17:48:49 +0100 (CET)
Received: from localhost ([::1]:49084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMCsB-0007yr-L7
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 12:48:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@diablo.13thmonkey.org>)
 id 1lMCYw-0000bV-IU
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:28:55 -0400
Received: from 13thmonkey.org ([80.100.255.32]:58579
 helo=diablo.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@diablo.13thmonkey.org>) id 1lMCYv-0006Fx-2N
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:28:54 -0400
Received: by diablo.13thmonkey.org (Postfix, from userid 103)
 id 708F1C13ADD; Tue, 16 Mar 2021 17:28:52 +0100 (CET)
Date: Tue, 16 Mar 2021 17:28:52 +0100
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: Windows 10 won't run on default x86_64 machine anymore
Message-ID: <YFDcxAK8/XokMJoi@diablo.13thmonkey.org>
References: <YE+SHIG8qQFMsEJl@diablo.13thmonkey.org>
 <20210315185302.29b0d90d@redhat.com>
 <YE/fUQRiFBfrWi5W@dropje.13thmonkey.org>
 <20210316135301.4fd08476@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316135301.4fd08476@redhat.com>
Received-SPF: none client-ip=80.100.255.32;
 envelope-from=reinoud@diablo.13thmonkey.org; helo=diablo.13thmonkey.org
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 16, 2021 at 01:53:01PM +0100, Igor Mammedov wrote:
> > The image file was downloaded pre-installed from Microsoft for Edge browser
> > evaluation. I used it first on Qemu 5.1 IIRC and it kept working in Qemu 5.2.
> 
> issue looks similar to:
> 0a343a5add7 i386/acpi: restore device paths for pre-5.1 vms
> 
> I think that's the problem, the old Windows image (installed on old QEMU),
> may fail to boot if started on newest machine type of a newer QEMU.
> User should use versioned machine type (the same version it was installed on)
> to keep it working the same way otherwise there is no promise that machine ABI
> won't change.

The machine setup doesn't mind changing the machine to the Q35 type; its only
the older machine thats failing to work.

Reinoud


