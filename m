Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6C8700678
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 13:15:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxQis-0004Gm-PS; Fri, 12 May 2023 07:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pxQir-0004GY-FY; Fri, 12 May 2023 07:14:05 -0400
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pxQip-0000PY-9P; Fri, 12 May 2023 07:14:05 -0400
Received: from [192.168.100.30] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.184]) with ESMTPSA (Nemesis) id
 1N0o3X-1q9zJe1wjF-00wkLY; Fri, 12 May 2023 13:13:31 +0200
Message-ID: <f1df90aa-8c5a-4b37-59c2-d62e3912cef6@vivier.eu>
Date: Fri, 12 May 2023 13:13:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 1/6] linux-user/sparc: Don't use 16-bit UIDs on SPARC V9
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Titus Rwantare <titusr@google.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, qemu-block@nongnu.org,
 Gregor Riepl <onitake@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Zach van Rijn <me@zv.io>, Richard Henderson <richard.henderson@linaro.org>
References: <20230330131856.94210-1-philmd@linaro.org>
 <20230330131856.94210-2-philmd@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230330131856.94210-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:aMq7J+cBsEu/64qYbyOPg4/iH7EI8hNP64+a80Aby+fae0IyekQ
 LfKsIHqCWknaTjx/LUtJ7fkZ14Z/rt4rj9Dp08x+V3o0OrynFY6W5r/dYH9c4HlXmjLGuAC
 +nlpb7h3Q0Ru5Sbu6kCJhHClth4cL0OjEaJtSWuTPUXgrQj1uWtsl0DbMFQF7HI+qKKKA1j
 kyAmKt+mSCe/YnhMl8KTA==
UI-OutboundReport: notjunk:1;M01:P0:hXMtwTFmQn0=;4rulsfzU2Ix9Q6y2DFyTUvopsAe
 m4QVI7VmBls2RQuPr7nEEhfOYGaUUQqbVLescOUdoz5ZpkSJKvh/cEVqzWiP3dx0KIbQN3GXL
 52eIa4F4FtwiZVoH93UxAEZM7KDAcxpRSZD1vwCJPYNNgIQsHKEpA0OX5zVCIcI7sOY+hfBVh
 1Fq0ri7dkuRFgFesS3s9KbB6dV9FKveWEGBJWGJ31jLvcye2IvSK6DmFdFtNYPVAkS7HVyyee
 zmTuerIreQHyq0NEMZAL51Gh30oYX3n7RcrIs2Hoibm+SXnRYykZg9UgRcsmR99p4rf32VRFb
 8UhMf0003WZhzCY6OsgBM6b0mGP0qbmPHjWxjp3+eiHlR7FKzLJkTvO8IUvo/zBqxYvw+u7zx
 fkRtA4p4Wj2m9GVrxvtowzHntIGRRnl7NsnoBUWvEI4ziZYK47cJTdYB7eTXZ/4ZqbIu0fFSU
 0JrKzg6VJK+/JU56Mrgg5WVEK5Vk5R8+Z3gVebXUSVjXtT/+WaUujy38mfxXlNEc5MeNEcTh7
 OoSFaLOP2a9fJBxKImO1vZpUxkYU9+0WQg0NwlWRQn8YW4YVgVnK8Abb1UJ2/9DacwkgBJSIM
 svX6aAP9Ju5ARry4ANgD5a5IUUM6aQQ/0a5habvrIzXDGC4Nvh5uheb5aaOe+T4jpHcldVJr5
 9sc6oPbGioei/4V8CzzlLLKW+3J5PIyFKbbTBRwXeQ==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.845,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 3/30/23 15:18, Philippe Mathieu-Daudé wrote:
> The 64-bit SPARC V9 syscall ABI uses 32-bit UIDs. Only enable
> the 16-bit UID wrappers for 32-bit SPARC (V7 and V8).
> 
> Possibly missed in commit 992f48a036 ("Support for 32 bit
> ABI on 64 bit targets (only enabled Sparc64)").
> 
> Reported-by: Gregor Riepl <onitake@gmail.com>
> Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Tested-by: Zach van Rijn <me@zv.io>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1394
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Acked-by: Laurent Vivier <laurent@vivier.eu>
> Message-Id: <20230327131910.78564-1-philmd@linaro.org>
> ---
>   linux-user/syscall_defs.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index 614a1cbc8e..cc37054cb5 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -61,7 +61,7 @@
>   
>   #if (defined(TARGET_I386) && defined(TARGET_ABI32)) \
>       || (defined(TARGET_ARM) && defined(TARGET_ABI32)) \
> -    || defined(TARGET_SPARC) \
> +    || (defined(TARGET_SPARC) && defined(TARGET_ABI32)) \
>       || defined(TARGET_M68K) || defined(TARGET_SH4) || defined(TARGET_CRIS)
>       /* 16 bit uid wrappers emulation */
>   #define USE_UID16

This patch breaks something with LTP (20230127) test fchown05_16 on sid/sparc64:

tst_test.c:1558: TINFO: Timeout per run is 0h 00m 30s
fchown05.c:44: TPASS: fchown(3, 700, 701), change owner/group ids passed
fchown05.c:44: TPASS: fchown(3, 702, -1), change owner id only passed
fchown05.c:49: TFAIL: testfile: incorrect ownership set, expected 702 701
fchown05.c:44: TPASS: fchown(3, 703, 701), change owner id only passed
fchown05.c:44: TPASS: fchown(3, -1, 704), change group id only passed
fchown05.c:49: TFAIL: testfile: incorrect ownership set, expected 703 704
fchown05.c:44: TPASS: fchown(3, 703, 705), change group id only passed
fchown05.c:44: TPASS: fchown(3, -1, -1), no change passed
fchown05.c:49: TFAIL: testfile: incorrect ownership set, expected 703 705

expected result;

tst_test.c:1558: TINFO: Timeout per run is 0h 00m 30s
fchown05.c:44: TPASS: fchown(3, 700, 701), change owner/group ids passed
fchown05.c:44: TPASS: fchown(3, 702, -1), change owner id only passed
fchown05.c:44: TPASS: fchown(3, 703, 701), change owner id only passed
fchown05.c:44: TPASS: fchown(3, -1, 704), change group id only passed
fchown05.c:44: TPASS: fchown(3, 703, 705), change group id only passed
fchown05.c:44: TPASS: fchown(3, -1, -1), no change passed

Thanks,
Laurent

