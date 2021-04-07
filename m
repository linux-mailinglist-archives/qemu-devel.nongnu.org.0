Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50491356BC4
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 14:08:02 +0200 (CEST)
Received: from localhost ([::1]:49604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU6yW-0003CZ-Um
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 08:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lU6x8-0002Sh-Oi; Wed, 07 Apr 2021 08:06:34 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:47107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lU6x2-0006Ez-Ti; Wed, 07 Apr 2021 08:06:34 -0400
Received: from [192.168.100.1] ([82.142.14.126]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MJEtx-1lAfUE0fhz-00KgT6; Wed, 07 Apr 2021 14:06:21 +0200
To: Stefan Weil <sw@weilnetz.de>, Bin Meng <bmeng.cn@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Alistair Francis <alistair23@gmail.com>
References: <20210326062140.367861-1-bmeng.cn@gmail.com>
 <CAEUhbmW-RaG-yy_YmL_cFQ-vUS=9_Mw3CmvBCTrkTAiKi8Y2TA@mail.gmail.com>
 <ce9214bb-d68b-defe-8af1-84373727b396@weilnetz.de>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] nsis: Install *.elf images
Message-ID: <cc5220ec-f694-3302-92c4-0107fd5af500@vivier.eu>
Date: Wed, 7 Apr 2021 14:06:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ce9214bb-d68b-defe-8af1-84373727b396@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:b045qct/GSz6fSjRkn5aFyF20K3VsYGEPoIYQ4lF0hPwlXaadK3
 EY2m7VsisxWFGJy/S6FVxGlGsLeRDqwEe9gRKGpgjHuNQVqtZ2PAVpHJq7CYbT/ARh6MAoh
 pkxsoD6iUKDT2ErO16haXH3UF+pNW6efV9WUPJ52oTgJ9rPZmPN7xZ1Kiluu2bfRH6Bzj7M
 ThbALKguo+h3s98sw++1A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Zp3/Jj/BxDo=:2XtbYldoOaR08Cnhyodh6+
 zTNMCkeNOA0X2SvNpPWV/0H8v0Cq9x89GFuGcazhFqPdDenBwEmYkLHfRgAaHvqVWHzgy26Kn
 WptRivA3uOxqS39bd+Fhx6cx4BVY8KgBmYxS2wIBybIfzyY+o92yPfOcKisQ4bxvb09YUvP1P
 UTI5V6bv1618NnYcyB/UEd3R34HGNcOmS06WALoc/PGrfoBr+3MZeLnbsJkThUp4kYyVrDYWz
 axFCfGxJvYbNDg7aK6dvJf3YDFdmzsY1rMi/1AdkgWsSx2HT+AFhaEBoTCXRcEPpiSQX1WTiE
 xTyO2WQNAG1u0XeMQtsMSfnkiZ3BAn2BET0lXSuwrlfBxAe8H5eweJccBQ0h0a+WTkmB+hThW
 U8Q67JIAlurhEe89jzoKklgGoyAzoS2Lhuk+cG0pm6l+K4dnsjDS5ByYAASyGEHbEDazAPDV3
 Q808CUrGnbnMvj1heuzlvJdxZLkfn4sx65IX8kBpawN/i4BZMKV0
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
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

Le 06/04/2021 à 11:28, Stefan Weil a écrit :
> Am 06.04.21 um 11:04 schrieb Bin Meng:
> 
>> On Fri, Mar 26, 2021 at 2:22 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>> As of today, the QEMU Windows installer does not include the
>>> following two RISC-V BIOS images:
>>>
>>> - opensbi-riscv64-generic-fw_dynamic.elf
>>> - opensbi-riscv32-generic-fw_dynamic.elf
>>>
>>> Update the installer script to include them.
>>>
>>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>>>
>>> ---
>>> Based on:
>>> https://repo.or.cz/qemu/ar7.git/commit/657a6a90b69da971afdc71501c30275ba307ff6c
>>>
>>> The above commit does not land on QEMU master. I am not sure what
>>> the process is, sending it here for comments.
>>>
>>>   qemu.nsi | 2 ++
>>>   1 file changed, 2 insertions(+)
>> Ping?
> 
> 
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
> 
> This is a small uncritical fix which can be merged via QEMU trivial.

If it is merged via QEMU trivial, it will be after the 6.0 release.
If it's needed for 6.0 it's better to go via the maintainer tree (W32,W64) [1]

Thanks,
Laurent

[1] the reason is: even a trivial change can break something, I don't like to break QEMU during RC
phase, so going via the maintainer tree helps to have tests more relevant to the area that is modified.

