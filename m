Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2792AD2B0
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 10:42:28 +0100 (CET)
Received: from localhost ([::1]:49886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcQAV-0000cX-QI
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 04:42:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcQ9N-0008F7-BS
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 04:41:17 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:46483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcQ9L-0005ws-8P
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 04:41:16 -0500
Received: from [192.168.100.1] ([82.252.154.198]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mrggc-1k03370VLY-00nkwi for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020
 10:41:13 +0100
To: qemu-devel@nongnu.org
References: <20201105212314.9628-1-peter.maydell@linaro.org>
 <20201105212314.9628-2-peter.maydell@linaro.org>
 <d93ed16f-9f9d-1009-7236-1eb72b512015@vivier.eu>
 <383a44ab-23e6-c8c7-9cdc-9c65acac5caf@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH for-5.2 1/3] linux-user/sparc: Fix errors in
 target_ucontext structures
Message-ID: <07020b82-541a-48d9-4a3a-992d60d0319a@vivier.eu>
Date: Tue, 10 Nov 2020 10:41:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <383a44ab-23e6-c8c7-9cdc-9c65acac5caf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:OoikmjvA1mqnohnX0BLSpscbyLmLa72aYnGjY7nFrTwrOk/CXOd
 kCZSh5M/axStqSEW3Saa2gsBaaKcNheOUHVfGqAjPacc6YBT5WV1xmBl4sk+vK0X/piaukL
 NGSRPoUfB+kC+FZIaBgG3QoOxvG2cLq+7nPEs5pphsLvjpGw7zwiPPnpDF5bl2UgpPbgjaV
 5Y7Ms+sjZ5JESOHdOVPGQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CND7lqgYae4=:bB64Vi5RLP1BKvYHemSIpW
 gbbAEtwFpLmbKfVK4dKCy9l/0bRh3jM5EqJu+Tyg3Qtjggm6QujMpLF9x7rS7977zMzkGik/C
 v5ybGEiY9QlFlsMJcIZHUJVZyvjwqWyxVqRWoRLMhYJCipbGfyfJp8X8s04DSjk9+yO2PR5VN
 nDm+umIZL/Cw8VP8Tf5pmum/T0dHk7hdHAlNXkgguCWCztRqMmkRDA4k0tTwkI4MCnI9tkkKm
 IPC6EmQ6FHpXq1irPUGHjuwRuDRCRf/Ueqg7v7vanoOZQyRlPzDEQ1WQZp+RZq+toweEbGVwG
 uVrtB/4vMOvXJAfJ/Fun/DRvZB0Ifc0wI0O4d7cwHIz0M2DCyFOZ63PSr1hgqg1tWLQKcJPnQ
 +WHP2SDYEIZhGyQqAdcH9Y5CGvd7ElgGChXWnKgLA/HFCY8H7vsk1EkKMCqlk
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 04:41:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 10/11/2020 à 10:02, LemonBoy a écrit :
> Hello Laurent,
> you probably want to also apply my patch for stack_t definitions [1] that
> was mentioned in Peter Maydell's cover letter for the patch series.
> 
> [1] https://patchew.org/QEMU/e9d47692-ee92-009f-6007-0abc3f502b97@gmail.com/

Yes, you're right. But as it touches more architectures it needs more test.

I will send a pull request with your patch once this one will be merged.

Thanks,
Laurent


