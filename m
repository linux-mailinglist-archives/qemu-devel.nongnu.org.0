Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8123BF039
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 21:24:17 +0200 (CEST)
Received: from localhost ([::1]:46460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1D9c-0000j5-86
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 15:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1D8U-0007uA-2J
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:23:06 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:46719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1D8S-00063o-0v
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:23:05 -0400
Received: from [192.168.100.1] ([82.142.13.34]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N6t3Z-1l77HX2FO3-018Gmg; Wed, 07 Jul 2021 21:22:52 +0200
Subject: Re: [PATCH v2 02/36] linux-user: Fix style problems in linuxload.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210706234932.356913-1-richard.henderson@linaro.org>
 <20210706234932.356913-3-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <51fa7410-b32f-6f3c-6a93-eb19b92cebe4@vivier.eu>
Date: Wed, 7 Jul 2021 21:22:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706234932.356913-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jV6oYyF6awoXqbiIsU6SK4GAlEGhM6cvuX3cq0xiCHP/SJDp90P
 Yu+ZMn2raW2HatvbvoRFv51FlU55Ug+EKDWVvzBhA+B3XcGfMON7vujsWPEYRDNgwuoCHEG
 /S6g5Sz8Cn2b9tXEz+SMcWs1CKWydMBKD+3e10lAjIKgajMlASHi78xSTwBCai56OPnMmW5
 6fGOf5KOI1GFzPNjcmU5A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IwBjueg00Ic=:/JoHcHjThwR4vTdbuh4wHa
 QAzt4EUc8jRW4QjacdZeIdc92HtyuITpOI/eYSdzrE8WUR9p28CQOI41H/tFdFqtRYREJ/8m3
 b+iFr3A6zBVQ8mpdiQUa9atvLz9rK+3MkziW5z8T6qOvu/2UXe/CAVd6jPLldXyPVXmpdrCCn
 HJJXq2hHqXK+aTMlX3rCCiuzyuoA9gA5zflgOLzPG5c+6LavcDGuuzp2Y9PK+BI319h/9Dooh
 +a3mFSQL7QZ+9PlQB44gK2vG2zHyt89lcZVficKORtLYzaC/jEsD79fZieQIn4n94nn8qBq14
 lqV1opdOu2doI5MF06F55KLfut0tJAE474flroXPjQRMhhKUxpJxwL6rm8PRxuCIrU4F/H3m2
 Zk1NfLsvvZ8yjs+9mLhyg1H8qA76+mTQm2185hjcqMde26ni/eCrw9uLlgvqzSumIWzMUjgHL
 5osRXokCdU2wtVXyzWEVos3mUdkkRoB0rsuE2keHni39+z3RLC5fET+zFQ9YRtxBDgTjnieop
 TCsi2Rdp7/F5mJSlli9GXDoIn0wefwkDdoEB8ZmEHcVekm5JqJY962OPXByibSX0IN3tqefTT
 68lb+afmmu8DHj9Y+CdfsxYPoqTA7UfkuJFmduquukvlr7wh1C8WQMDU4VmYrF0oSJgIQO5xK
 UAlPI+VUMxyUlRn8B+ahRcMO//1q3d9nSIHh6daS9CkU663tKVqk7DHOcX9T4+n+NBLMWUEjO
 6C8pJOZXPVSu7XeddaDZjevrWw3J7fJcEhUTytwm8373lRavUAFvJgqK65Evixw15qFTb5Ohi
 Wr2fX8m8Mj+7cU8vjlGFXdYpG4Bq40lrfSckrNvaNdvIio9bcgDp1F0oZokVhkXw3jcWX/t
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: alex.bennee@linaro.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 07/07/2021 à 01:48, Richard Henderson a écrit :
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/linuxload.c | 42 ++++++++++++++++++++----------------------
>  1 file changed, 20 insertions(+), 22 deletions(-)
> 
> diff --git a/linux-user/linuxload.c b/linux-user/linuxload.c
> index a27e1d0d8b..9d4eb5e94b 100644
> --- a/linux-user/linuxload.c
> +++ b/linux-user/linuxload.c
> @@ -1,59 +1,57 @@
>  /* Code for loading Linux executables.  Mostly linux kernel code.  */
>  
>  #include "qemu/osdep.h"
> -
>  #include "qemu.h"
>  
>  #define NGROUPS 32
>  
>  /* ??? This should really be somewhere else.  */
> -abi_long memcpy_to_target(abi_ulong dest, const void *src,
> -                          unsigned long len)
> +abi_long memcpy_to_target(abi_ulong dest, const void *src, unsigned long len)
>  {
>      void *host_ptr;
>  
>      host_ptr = lock_user(VERIFY_WRITE, dest, len, 0);
> -    if (!host_ptr)
> +    if (!host_ptr) {
>          return -TARGET_EFAULT;
> +    }
>      memcpy(host_ptr, src, len);
>      unlock_user(host_ptr, dest, 1);
>      return 0;
>  }
>  
> -static int count(char ** vec)
> +static int count(char **vec)
>  {
> -    int		i;
> +    int i;
>  
> -    for(i = 0; *vec; i++) {
> +    for (i = 0; *vec; i++) {
>          vec++;
>      }
> -
> -    return(i);
> +    return i;
>  }
>  
>  static int prepare_binprm(struct linux_binprm *bprm)
>  {
> -    struct stat		st;
> +    struct stat st;
>      int mode;
>      int retval;
>  
> -    if(fstat(bprm->fd, &st) < 0) {
> -        return(-errno);
> +    if (fstat(bprm->fd, &st) < 0) {
> +        return -errno;
>      }
>  
>      mode = st.st_mode;
> -    if(!S_ISREG(mode)) {	/* Must be regular file */
> -        return(-EACCES);
> +    if (!S_ISREG(mode)) {   /* Must be regular file */
> +        return -EACCES;
>      }
> -    if(!(mode & 0111)) {	/* Must have at least one execute bit set */
> -        return(-EACCES);
> +    if (!(mode & 0111)) {   /* Must have at least one execute bit set */
> +        return -EACCES;
>      }
>  
>      bprm->e_uid = geteuid();
>      bprm->e_gid = getegid();
>  
>      /* Set-uid? */
> -    if(mode & S_ISUID) {
> +    if (mode & S_ISUID) {
>          bprm->e_uid = st.st_uid;
>      }
>  
> @@ -125,8 +123,8 @@ abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
>  }
>  
>  int loader_exec(int fdexec, const char *filename, char **argv, char **envp,
> -             struct target_pt_regs * regs, struct image_info *infop,
> -             struct linux_binprm *bprm)
> +                struct target_pt_regs *regs, struct image_info *infop,
> +                struct linux_binprm *bprm)
>  {
>      int retval;
>  
> @@ -139,7 +137,7 @@ int loader_exec(int fdexec, const char *filename, char **argv, char **envp,
>  
>      retval = prepare_binprm(bprm);
>  
> -    if(retval>=0) {
> +    if (retval >= 0) {
>          if (bprm->buf[0] == 0x7f
>                  && bprm->buf[1] == 'E'
>                  && bprm->buf[2] == 'L'
> @@ -157,11 +155,11 @@ int loader_exec(int fdexec, const char *filename, char **argv, char **envp,
>          }
>      }
>  
> -    if(retval>=0) {
> +    if (retval >= 0) {
>          /* success.  Initialize important registers */
>          do_init_thread(regs, infop);
>          return retval;
>      }
>  
> -    return(retval);
> +    return retval;
>  }
> 

Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent


