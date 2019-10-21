Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15200DE856
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 11:43:00 +0200 (CEST)
Received: from localhost ([::1]:36742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMUDK-0007jf-Vm
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 05:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37182)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iMUBA-0006Bs-PZ
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 05:40:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iMUB9-0000vd-Lc
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 05:40:44 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:57481)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1iMUB9-0000si-CE
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 05:40:43 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MK3BO-1ibFu31fmI-00LUJf; Mon, 21 Oct 2019 11:40:25 +0200
Subject: Re: [PATCH v7 2/9] linux-user/strace: Add print_timezone()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20190915213924.22223-1-f4bug@amsat.org>
 <20190915213924.22223-3-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c4650dc9-840b-5514-8758-130a1644e66b@vivier.eu>
Date: Mon, 21 Oct 2019 11:40:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190915213924.22223-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:o2Kt6crMDqVmz6hDZ9GVw8fHhb/treyGytdT7nRDvHxZC11UVty
 wS2zTy+JzLiWI8dtlcNFiWnNuKhd6iRZtno5B3bA++tQqFojq/SGkxyEse7ajFYnhY1CU6T
 nN4eV1tCRcbzcELj0Lkz4rAMInVUUhA+amHenrk+sy7FS1Ixx0ePbfRcjy63+fmwD20SBH+
 hMywlE7FsArfR9zV1KwAA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:I3LR2+BrihA=:teQpL1VOjE+OtQon6NdkIf
 AdAftj1Lzz4OQxp3l/zuY3fv3s2PUpLhDo5Efs45mziND/sPLqBBcy23Dixx58ba178Whwoso
 SUA3cCdTpz7ulchWHrRNLsYPlSn+cb7lafetmwMhiI4t4RtrFCx/YvDLD51a6nLoGvJyH+HZj
 YH1KFWOUUlDsEXamXyPM53+D6AwtHteQhdk8GNMX7xiY3qeipGwSLYAC8ZlHiGvursT6ip3PW
 L7UkpkgSBZLeLErqb3bc47GCxmfHZH63uZwwGwOWA9kVi35yh0W2Fegxq8dOKrqzDeBqqyaFe
 P8mRf73xPRW+3DEn9p7HqhHCF+O2GzKR7T15NUMHoj1lNNvK1kPbmX31B3DxapbFqx2GN+oh2
 iXT3ODaXlpl+gHAtSc8+fmrxDFdLENx0lJJtooIUFg92gnKdcm2I80cIPb9GIsFZl3vjccyYA
 PdlxRevdVPx6dxTnL3KRAj2PepQTcAC7ktckc5S5x9I6P1qPaW/ddqPvYuiJSaHzjDiR69Lc+
 4oR1gy75gZZvjqtkaMQKDEvODOmMWIf0a8a8xGy0kD2SIilHUpnB9PB9HsUt2wg7FJO8sgjZc
 vDhfLt2sOV7TjKb89fq4x7c6wdZRcoueapcGCwhCTLtOBrX1xNdq1ITSpKjvj65iHl3P+xd6x
 MaarabujcP4przCtScO9FDW2BJk2rUm57K7h79yXavDZ5OwhEglxknoMYosHk8c9Ih9ss+56u
 NRE8o+pOx9R3txpEmX8M4MCiaG/j4tLQwgd8spSkUFR9A/txD/Il1Gs9113M98SHl1mJffmwy
 nsM6aJA59VKU8IuY8jOOAKSds14mvEN349wuy9nN1hOeNonDLGTcsxq3dQCYOxZs35ILiIcel
 YRRFbPsA4zc9gP/z8Q2MJc32vhjzEXGjvI2F5PADw=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.133
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
Cc: Riku Voipio <riku.voipio@iki.fi>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 15/09/2019 à 23:39, Philippe Mathieu-Daudé a écrit :
> Suggested-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v7: tz_minuteswest and tz_dsttime are abi_int -> %d/tswap32 (lvivier)
> checkpatch error:
> ERROR: storage class should be at the beginning of the declaration
> ---
>  linux-user/strace.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index f326c357a2..2cd6687cd9 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -63,6 +63,7 @@ UNUSED static void print_string(abi_long, int);
>  UNUSED static void print_buf(abi_long addr, abi_long len, int last);
>  UNUSED static void print_raw_param(const char *, abi_long, int);
>  UNUSED static void print_timeval(abi_ulong, int);
> +UNUSED static void print_timezone(abi_ulong, int);
>  UNUSED static void print_number(abi_long, int);
>  UNUSED static void print_signal(abi_ulong, int);
>  UNUSED static void print_sockaddr(abi_ulong addr, abi_long addrlen);
> @@ -1254,6 +1255,25 @@ print_timeval(abi_ulong tv_addr, int last)
>          gemu_log("NULL%s", get_comma(last));
>  }
>  
> +static void
> +print_timezone(abi_ulong tz_addr, int last)
> +{
> +    if (tz_addr) {
> +        struct target_timezone *tz;
> +
> +        tz = lock_user(VERIFY_READ, tz_addr, sizeof(*tz), 1);
> +        if (!tz) {
> +            print_pointer(tz_addr, last);
> +            return;
> +        }
> +        gemu_log("{%d,%d}%s", tswap32(tz->tz_minuteswest),
> +                 tswap32(tz->tz_dsttime), get_comma(last));
> +        unlock_user(tz, tz_addr, 0);
> +    } else {
> +        gemu_log("NULL%s", get_comma(last));
> +    }
> +}
> +
>  #undef UNUSED
>  
>  #ifdef TARGET_NR_accept
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


