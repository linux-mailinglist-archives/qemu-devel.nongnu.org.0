Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2C347A13F
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 17:07:29 +0100 (CET)
Received: from localhost ([::1]:44156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myyie-00065x-R1
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 11:07:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1myyg7-0005Li-8e
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 11:04:51 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:51281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1myyg5-0005hY-DE
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 11:04:51 -0500
Received: from [192.168.100.1] ([82.142.30.186]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mv2tK-1mhRr81xei-00r2y3; Sun, 19 Dec 2021 17:04:34 +0100
Message-ID: <8b30a46e-7b1d-ee0f-02ef-f49dd844ed69@vivier.eu>
Date: Sun, 19 Dec 2021 17:04:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] linux-user/hexagon: Use generic target_stat64 structure
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211116210919.2823206-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211116210919.2823206-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:YeH5bKNU2mhI7ctfWdTuwK/ti9d0LtdAvSOnx0wq7lpwS2UqRt0
 YhoHAuBWtfC+ajgH3Xje/MqET30qbwSLmIfQthfGvLOGj6UNPXIycT7NGOvjkGdLyzmeQQH
 q3Eudw2X2fzGsqHJv7UPGf/dREvhZAwYiK/L61ugysyXdgdtSpLEd5E0EMFk2GMt54dhi/0
 uXrxsSzF4zFz64N1VCCjg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iztRUS2IHKQ=:nqATXBepcSSPFLpSan8dob
 pGnREOmIY9kckgmTFMt7qvyhAIBzigvIQUl9IMMZLtJ9wXELuuNf2HPOPSAXz1ivHhXyajHlp
 bVKy9kwRaU3PBbZ/d4dY2621yyPuAA6b6nIrjr0/HpsE8HbJCpnf3InlFN/PmspywDAeHPi6S
 6PJHFVC7iWF56HAYdDC6/3ScYvRgzgQwKB6WdsiH8d3mfyHDDTFWBQYIUJ62rm5Xxaj37RITp
 ysTTApcZSPvOdSuXO8BpCTbHO6J4N6VtaK/ja1AY2nbYhQN9a3oSC4l+FaG1dJ/Zog/IqqRc8
 TKoFJEcZ8cP2pw8QGm/T12gsoOR/uMM5ig4dKZS1iUDu2dzRJ6RD+Km4X/IILo2LGH7WWEbc0
 RdU2xPrPf5S7tXDVHr8MUyXKKpbtrQQ0C2Yr780sjrsmgqD0TgrvHSoQiH/j8zYvkYFFdIoEg
 JEqxkqSnQyv7+6jnH3/NGntxzndPFHr3tCR7SICl1YL4bhe2JUX70TGI+4wjffT/o+LtAFS0S
 jxw2lm1AeroUTQH/QwWisRcq7TRXdy7CKJ9zVFHNiVF5GNN0hMmvp3L4gXtsDVnwDSLhucKpV
 LD3KNyS3bPxp3ed/etZqxpMzydp+m0oZn+31QHj1TyM/1Pyowk1Y2itvywcQD2G2Ix5dwx83z
 Ng30ufHdDyt1NhPe+2PVFBYJ9dsbuFssZPBHCyxXoLPx0dHLczMdhwBGlRebFzfTikuM=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.563,
 RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 16/11/2021 à 22:09, Philippe Mathieu-Daudé a écrit :
> Linux Hexagon port doesn't define a specific 'struct stat'
> but uses the generic one (see Linux commit 6103ec56c65c [*]
> "asm-generic: add generic ABI headers" which predates the
> introduction of the Hexagon port).
> 
> Remove the target specific target_stat (which in fact is the
> target_stat64 structure but uses incorrect target_long and
> ABI unsafe long long types) and use the generic target_stat64
> instead.
> 
> [*] https://github.com/torvalds/linux/commit/6103ec56c65c3#diff-5f59b07b38273b7d6a74193bc81a8cd18928c688276eae20cb10c569de3253ee
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   linux-user/syscall_defs.h | 28 ++--------------------------
>   1 file changed, 2 insertions(+), 26 deletions(-)
> 
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index a5ce487dcc3..7ab612d163b 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -2129,7 +2129,8 @@ struct target_stat64  {
>       abi_ulong __unused5;
>   };
>   
> -#elif defined(TARGET_OPENRISC) || defined(TARGET_NIOS2) || defined(TARGET_RISCV)
> +#elif defined(TARGET_OPENRISC) || defined(TARGET_NIOS2) \
> +        || defined(TARGET_RISCV) || defined(TARGET_HEXAGON)
>   
>   /* These are the asm-generic versions of the stat and stat64 structures */
>   
> @@ -2240,31 +2241,6 @@ struct target_stat64 {
>       uint64_t   st_ino;
>   };
>   
> -#elif defined(TARGET_HEXAGON)
> -
> -struct target_stat {
> -    unsigned long long st_dev;
> -    unsigned long long st_ino;
> -    unsigned int st_mode;
> -    unsigned int st_nlink;
> -    unsigned int st_uid;
> -    unsigned int st_gid;
> -    unsigned long long st_rdev;
> -    target_ulong __pad1;
> -    long long st_size;
> -    target_long st_blksize;
> -    int __pad2;
> -    long long st_blocks;
> -
> -    target_long target_st_atime;
> -    target_long target_st_atime_nsec;
> -    target_long target_st_mtime;
> -    target_long target_st_mtime_nsec;
> -    target_long target_st_ctime;
> -    target_long target_st_ctime_nsec;
> -    int __unused[2];
> -};
> -
>   #else
>   #error unsupported CPU
>   #endif
> 

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent

