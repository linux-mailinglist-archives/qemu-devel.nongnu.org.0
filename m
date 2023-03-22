Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DDB6C578A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 21:28:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf53q-0004TK-BF; Wed, 22 Mar 2023 16:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pf53n-0004G3-A0; Wed, 22 Mar 2023 16:27:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pf53l-0005EX-Fc; Wed, 22 Mar 2023 16:27:51 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id AA48440158;
 Wed, 22 Mar 2023 23:27:47 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 354FB92;
 Wed, 22 Mar 2023 23:27:46 +0300 (MSK)
Message-ID: <b1179d37-bd37-1263-705c-c3dabad7b59a@msgid.tls.msk.ru>
Date: Wed, 22 Mar 2023 23:27:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 00/47] Patch Round-up for stable 7.2.1
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
 <4e3a1b70-5b84-9d78-bfe2-644f50b77f5c@redhat.com>
Content-Language: en-US
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <4e3a1b70-5b84-9d78-bfe2-644f50b77f5c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

22.03.2023 12:09, Thomas Huth пишет:
...> Maybe pick also these patches that mention "CVE" in the description:
> 
>   qga/win32: Remove change action from MSI installer
>   qga/win32: Use rundll for VSS installation

Yes, that one is a good idea.

>   hw/net/vmxnet3: allow VMXNET3_MAX_MTU itself as a value

Simple, picked up.

>   hw/pvrdma: Protect against buggy or malicious guest driver

This one has been in debian for quite a long time, it is finally
applied upstream, which is very good.

>  From my s390x perspective, I'd like to suggest the following
> patches (if they can be applied cleanly):
> 
>   target/s390x/arch_dump: Fix memory corruption in s390x_write_elf64_notes()
>   target/s390x: Fix emulation of C(G)HRL

Ok.

>   target/s390x: Fix R[NOX]SBG with T=1

9701596d821 says, in the commit message:

     Exposed by commit e2e641fa3d5 ("tcg: Change default temp lifetime to
     TEMP_TB").

Without this commit (e2e641fa3d5), commit 9701596d821 makes little sense
I think. Also, commit 9701596d821 applies after dd161de75f3
"target/s390x: Remove g_out, g_out2, g_in1, g_in2 from DisasContext".

>   target/s390x: Fix EXECUTE of relative long instructions

This one needs "target/s390x: Split out gen_ri2" first, it looks
like it's harmless to have.

Thank you very much for the suggestions, Thomas!

/mjt

