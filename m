Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D44600822
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 09:53:57 +0200 (CEST)
Received: from localhost ([::1]:60354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okKwe-0008Gu-8L
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 03:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1okKVN-000266-PS
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 03:25:45 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:46965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1okKVL-0000y5-So
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 03:25:45 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MS3vJ-1oZiIG1VOd-00TUnL; Mon, 17 Oct 2022 09:25:35 +0200
Message-ID: <fe30a5ce-f318-55f2-165f-b555e19f3160@vivier.eu>
Date: Mon, 17 Oct 2022 09:25:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PULL 0/2] M68k for 7.2 patches
Content-Language: fr
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@gmail.com>
References: <20221014072356.2075517-1-laurent@vivier.eu>
 <CAJSP0QWcxLFQnrsqJxVw4k1-bsnq1XVGFQj12FLpAi5ar397VQ@mail.gmail.com>
 <Y0zScz9aaUulC78c@zx2c4.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <Y0zScz9aaUulC78c@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:w3wfTpT7n9vzV0rZ4nLpIgdbE2EKtUYSsr1xlbr1AjFcxVC6+Gk
 2DbxCKhOcILDrLekjmtSa1ElzjVrmBh24RUl9rdtvfDSTwSKp4ptXichC2zTXQghRaaGh5H
 YyZxxYDWxRb3TvpPZc7/hu3njSBxI67+ZQnFfTglI1smfgxhqCE/gieB2UFN/BbdJIiPHCp
 5E/kMA+8jpkOlcmPolO0A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jLoOgWbx4jA=:sHjxfzgjmeqzIs0a2OUS0M
 +R8fo6sJTj9lYIHIYQUzJbnCrOoUmvAvonJQQoFd6gRcU5nia8PaQvAtqIwV18zlScO9//1oa
 0uedA+qFfsZYwCjl2Y8XX9t+6C0kqt4MD2KFINqNLKWnsbn9VRRRanLeS4DYHmBXPxI/XTfbU
 qZDzyWNCr5Hw6Dt0zEGIakMScT9FUpAdpkDjxSS7lNPs5F9nJ+Gpq1IwbKdnCRd+Rc3/mx8hl
 /eTb/rx4ydINRP6o996bp+uX9XrIFFgdonxYvXejEtd1zO2wx7Lw0Wxs87l4g/SXMELwC5wL0
 VaaE2ZZMQOG44kFS6B2HcFVcby0u1PZAQHegz0VuVbtk6aMQTp99dDCm0wAtH3whFc1uBEYIX
 cjib9rVhGL2azyXeOqspsx1r2ZovT2pwbfkWgH1vVI40HW1aUJokgkYLXMBpp6zasc9NiJxxK
 t6OOT5as30HjQgnPTkTVRAA2dwn12e4XbVVZahNgL4M9H5D8A99dCSQYBVqHKtSAGN96FrJyh
 9cXBQizu/6HdcBo48qWS9inHjTR5zir0ruUiN/M5Mehg46rU45It5Ch98sLvTm3AaePT1zIPE
 /UbGR7cAumU8aZyUr3cl66isEQ+6c80MLWkxO22eRPVd4AVKBxnDAFL8yiHdM3EHXg7gxbFBo
 u70XtWGxX+fT/7pGqYl1rW1PeXV573h2qFwelkZibLQDQBXm88czC0VpXeADBDj0HRY5jZe4E
 z/r76Dt4wTZdFHQ9Vi+qFRoWDU6MBXbyhaGCgunyR/wrrd8fHhZoP+JJvD1n/kWV06BW7WnJK
 u49XIgR
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 17/10/2022 à 05:56, Jason A. Donenfeld via a écrit :
> On Sun, Oct 16, 2022 at 03:50:54PM -0400, Stefan Hajnoczi wrote:
>> On Fri, 14 Oct 2022 at 03:26, Laurent Vivier <laurent@vivier.eu> wrote:
>>>
>>> The following changes since commit f1d33f55c47dfdaf8daacd618588ad3ae4c452d1:
>>>
>>>    Merge tag 'pull-testing-gdbstub-plugins-gitdm-061022-3' of https://github.com/stsquad/qemu into staging (2022-10-06 07:11:56 -0400)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://github.com/vivier/qemu-m68k.git tags/m68k-for-7.2-pull-request
>>>
>>> for you to fetch changes up to fa327be58280f76d2565ff0bdb9b0010ac97c3b0:
>>>
>>>    m68k: write bootinfo as rom section and re-randomize on reboot (2022-10-11 23:02:46 +0200)
>>>
>>> ----------------------------------------------------------------
>>> Pull request m68k branch 20221014
>>>
>>> Update rng seed boot parameter
>>>
>>> ----------------------------------------------------------------
>>>
>>> Jason A. Donenfeld (2):
>>>    m68k: rework BI_VIRT_RNG_SEED as BI_RNG_SEED
>>>    m68k: write bootinfo as rom section and re-randomize on reboot
>>
>> This commit breaks mingw64 due to the Windows LLP64 data model where
>> pointers don't fit into unsigned long
>> (https://en.wikipedia.org/wiki/LP64#64-bit_data_models). Please use
>> uintptr_t instead of unsigned long:
> 
> Holy smokes; I didn't realize that qemu was ever compiled this way.
> 
> Laurent - do you want me to send you a follow-up commit fixing that, a
> new commit fixing that, or do you want to adjust the current commit
> yourself? Any choice is fine with me.

Please update the current patch to fix that and resend.

Thanks,
Laurent

