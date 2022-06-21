Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 211BA553973
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 20:18:00 +0200 (CEST)
Received: from localhost ([::1]:39770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3iRq-0003MD-99
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 14:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o3iQH-0002eO-Dl
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 14:16:21 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:46655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1o3iQF-0000el-Jn
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 14:16:21 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MFKX3-1nt2Eb2odF-00FnVv; Tue, 21 Jun 2022 20:16:16 +0200
Message-ID: <61c5e6b6-2893-45b5-63b6-45dbe40f1944@vivier.eu>
Date: Tue, 21 Jun 2022 20:16:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] linux-user/x86_64: Fix ELF_PLATFORM
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220603213801.64738-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220603213801.64738-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Tk3HmXfCOGTMf8FApOxUKwYTwwPNP+gZCbMxJajhg87Sbr4wE+0
 8i7+mjnmWTOaFR8IhnQR+ic8MwuyZn7nNxRnentjsZupK73+vkiK22FeXAUzCGOqkNidNsn
 nu/dFb3ncJZpMKVoNDJfpDdsxKMbltfKSAF8wY6uU8SPMPHE8Fm//pIVNv+TzrMgpzonzRM
 WpUvaYRsgF2M/quyBfkfg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:woWn3ZThZsI=:+KQICNDkSKYFaK4tMPP7WQ
 HwdS5s2PR4MBeNrnpv1dVeUaZPOvUJzJtlKKJCgaViDNH5fx/ctBPVCM+yMxcqp/IPp4qXO15
 AA2qWXFtOney4cHRTcwxygABRNvUn8HMZQfeTRO8v8vi/ExTBKhltMsOsJqKBr+5GWpTimvaY
 zNqEcFKxH0mUes5jJ68yXppy9UFK3/z4OVK2+Eohr3ydw3msUi4Q06wE/e2zGeR3OlYbfRH2K
 XXqMT+EcuNQliY4igZHNm99pGBbnts/XzmvfoEMbHmtLOnMmhHsFLu5RkTPTklHqguTSskWLf
 KA6JXriaPq/1FJRvDpj/4w8sDcAwkBrh9xXItRnPADSXNITFUllahbPYIhG1NhtG+qE+cEgKw
 f8KhRkVAVsB/DecdmBXqqLpWIGJVA9HtxK/khj95PYQw+FE/JKZ/7Xyxy5WLuggsQLet/XMAu
 QpAdkbsN5rZFvpOt9pCu3fhYPmdG/zhCBW42Qmx7bMYX8aOnSQwYX8ZnXbLiDXACUwRA+psPM
 MABfKVGGV5DyI/rzLUvktsDZkiDK5CK02exqriNtcwle7SLN2JdOlXZjygoCygUmy/NsEPfAE
 d72hj7PB9dhdttWUikPu1wKIx95T/eBtwnQiRy25Te/ESVRqY9Rua4+0IXBO4KZ8aXA6UKJsQ
 0dfxDSLLyOeJbGn8iqhEKlTNLqGJlYgkB/Q2xkFhl+NKfx+tW5EqdnyYskcwdDTUP80omI7IO
 3Ep2zJMBz0OI2onJ6id0A23I9bf8jTp24+ztUQ==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 03/06/2022 à 23:38, Richard Henderson a écrit :
> We had been using the i686 platform string for x86_64.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1041
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/elfload.c | 30 +++++++++++++++++-------------
>   1 file changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index f7eae357f4..163fc8a1ee 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -130,19 +130,6 @@ typedef abi_int         target_pid_t;
>   
>   #ifdef TARGET_I386
>   
> -#define ELF_PLATFORM get_elf_platform()
> -
> -static const char *get_elf_platform(void)
> -{
> -    static char elf_platform[] = "i386";
> -    int family = object_property_get_int(OBJECT(thread_cpu), "family", NULL);
> -    if (family > 6)
> -        family = 6;
> -    if (family >= 3)
> -        elf_platform[1] = '0' + family;
> -    return elf_platform;
> -}
> -
>   #define ELF_HWCAP get_elf_hwcap()
>   
>   static uint32_t get_elf_hwcap(void)
> @@ -158,6 +145,8 @@ static uint32_t get_elf_hwcap(void)
>   #define ELF_CLASS      ELFCLASS64
>   #define ELF_ARCH       EM_X86_64
>   
> +#define ELF_PLATFORM   "x86_64"
> +
>   static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
>   {
>       regs->rax = 0;
> @@ -221,6 +210,21 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUX86State *en
>   #define ELF_CLASS       ELFCLASS32
>   #define ELF_ARCH        EM_386
>   
> +#define ELF_PLATFORM get_elf_platform()
> +
> +static const char *get_elf_platform(void)
> +{
> +    static char elf_platform[] = "i386";
> +    int family = object_property_get_int(OBJECT(thread_cpu), "family", NULL);
> +    if (family > 6) {
> +        family = 6;
> +    }
> +    if (family >= 3) {
> +        elf_platform[1] = '0' + family;
> +    }
> +    return elf_platform;
> +}
> +
>   static inline void init_thread(struct target_pt_regs *regs,
>                                  struct image_info *infop)
>   {

Applied to my linux-user-for-7.1 branch.

Thanks,
Laurent

