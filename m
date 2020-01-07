Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6AB132490
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 12:13:04 +0100 (CET)
Received: from localhost ([::1]:46642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iomnG-0003Y9-N1
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 06:13:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57005)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iomF6-0001sh-DX
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 05:37:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iomF4-0007Rh-Ig
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 05:37:43 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:46477
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iomF4-0007RK-Ey
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 05:37:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578393461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=1WJ2Nw2yr7rj9GfDhdxH8lRmarWC/0F+bPFb42wGXFs=;
 b=UvOww9TlK86/KcRDIaPY4UEeoH9DQY1eNjGctCeCjlrDC14dkNdEzpCzB2/qju91m/r1I/
 ub1kAFzTv8gdNDEdZ4QcsryWqThpXEh19MjDwBuJb1/lOFPidVpzZeXyGW5UME5wQnsVa6
 SWl/Nh/gmce3RcbgylGEhDUljl/HwnY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-hdzdWhr8PWiRYlRzM39G-A-1; Tue, 07 Jan 2020 05:37:38 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9572B184B1E4;
 Tue,  7 Jan 2020 10:37:35 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-116.ams2.redhat.com [10.36.116.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 33DBC7FB5E;
 Tue,  7 Jan 2020 10:37:32 +0000 (UTC)
Subject: Re: [Bug 1858461] Re: Please refactor linux-user/mips/cpu_loop.c
To: Bug 1858461 <1858461@bugs.launchpad.net>, qemu-devel@nongnu.org
References: <157833123209.15024.12557979334447840996.malonedeb@wampee.canonical.com>
 <157835389078.5353.3458278280613955417.malone@gac.canonical.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <f93996e4-bddc-826c-f80c-3c7cf69bbf9d@redhat.com>
Date: Tue, 7 Jan 2020 11:37:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <157835389078.5353.3458278280613955417.malone@gac.canonical.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: hdzdWhr8PWiRYlRzM39G-A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/01/2020 00.38, puchuu wrote:
> ** Patch added: "generated_mips_syscall_table.template.patch"
>    https://bugs.launchpad.net/qemu/+bug/1858461/+attachment/5318010/+files/generated_mips_syscall_table.template.patch
> 

Please do not attach patches to the bug tracker, send them to the
qemu-devel list instead. See
https://wiki.qemu.org/Contribute/SubmitAPatch for details. Thanks.


