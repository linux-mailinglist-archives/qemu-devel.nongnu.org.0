Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C68B20554C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 16:58:56 +0200 (CEST)
Received: from localhost ([::1]:51916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnkNy-0000j1-QU
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 10:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jnkMx-0008CN-3i
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 10:57:51 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:37589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1jnkMu-0003yM-CP
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 10:57:50 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N1M4p-1iqJLg0Gdv-012op8; Tue, 23 Jun 2020 16:57:43 +0200
Subject: Re: [RFC PATCH v2] linux-user: Use FD_32BIT_MODE fd flag for 32-bit
 guests
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20200623100101.6041-1-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <a16d1468-409b-e68f-3ebd-dc9e93cb3dab@vivier.eu>
Date: Tue, 23 Jun 2020 16:57:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200623100101.6041-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PzGi+QCNMqArAZ6FJj7wlf1EzItHgJskX31pPbmHaYj/ZM8QVoT
 p3XdEVH6hzuSpThZxRB1e8p79MUZBPAuFRfRigHgGzbbu7PkLNxlMi0R4F85JN5u+Krl0Em
 gk2agL6ovv8kgFSxS4BUZC8DgAa0r2MoITmQKFWak2ingV11kzZsX3y2FFIGYJWsLujx7c1
 J+etEEVBeZSb5Rc5pqWng==
X-UI-Out-Filterresults: notjunk:1;V03:K0:J96/OKU3fCs=:0SyaJs9Rh3iBdqlt2CKCah
 cZBpF340pUAO5D91DZovX7QdHL6rAt8BjCrMOY5CTheTREbOq9bCWEYZj81eM0H6YrYdU2RgO
 5Wfo0ok5vlC7L74c9ft/nQu0RNIIhmO7vZCci3sM3amgscLh+W7dMjPsemr+NtHI8EEokAcSC
 SuIIFrjqQB4DwUYwiHHr28lb2KlGLyqFs1bVrxWR8Zaccq0q/xuP+4PSr5c9zQbGjNFGviidR
 V9mjYNL8o9jxIvAlck94JOjYRjE3Yr3LY/Y5zYu1K69MA0ZNPqvvpBrhG0Dd5UPm4OSV2BFc3
 jWgNiqBeJhP9DxNihO5hTE9bYITSIXl0SaQM1QjbITNhztDVGjvhTCEQ+O/suTVi7/mK6VOkL
 829+2YzWdfzKdYPIUQyGahEBEEUHBMpgy1TsatBKwIojDB1d9+MM9vQVWGtiJ4YgPGcw42uP7
 JgVn9/LupV6Yuxed9r+5/wV8RYFuP++OSCERy1Dk9dYHsFv3xyowwIIteiL2db5nk/iRFxRTU
 TCMlSX+UwQPKPXp0MZWIbABJ8UPV0u/VAotSDGJcP4/8XvhhbZ2jr8CE0BA8dK2FX+pNxVnjz
 qQMyfpKl8jvLT5pb2F7FKcwlJAE+7M+XMwoH739VU4nfxJC7hgf2HqVOu6NR4tBwVHsOzi/7h
 6uFFyeAQriHrvEHNksiiSVyE3L2svkzyOkDY0ThVgixb8oTbYsoNBLMHcGQ3HT8hx8VSObgv9
 FDLdTHdR6O/FfDvSK6aBFiqhWg0Gf2Yp9DF0+6v1c6Z4HlcFdkg7WalzJOwpjDZQW2gwAK0F6
 FdhDZSdB3ISYA99yvw4mGkZObhyJbWdtMfHMHNPcEHhrktRz9o=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 10:57:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Linus Walleij <linus.walleij@linaro.org>, Riku Voipio <riku.voipio@iki.fi>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 23/06/2020 à 12:01, Peter Maydell a écrit :
> If the guest is 32 bit then there is a potential problem if the
> host gives us back a 64-bit sized value that we can't fit into
> the ABI the guest requires. This is a theoretical issue for many
> syscalls, but a real issue for directory reads where the host
> is using ext3 or ext4. There the 'offset' values retured via
> the getdents syscall are hashes, and on a 64-bit system they
> will always fill the full 64 bits.
> 
> Use the FD_32BIT_MODE fd flag to tell the kernel to stick
> to 32-bit sized hashes for fds used by the guest.
> 
> This is an RFC patch because the kernel patch that adds the
> new fd flag hasn't yet been accepted upstream. The kernel
> patch is:
>  https://patchew.org/QEMU/20200529072017.2906-1-linus.walleij@linaro.org/
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is just a minor update of the testing patch I sent out in the
> thread discussing Linus's v1 kernel patch.
> 
>  linux-user/syscall.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

