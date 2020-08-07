Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A6923EAB0
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 11:45:28 +0200 (CEST)
Received: from localhost ([::1]:52858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3ywI-0001u5-Rl
	for lists+qemu-devel@lfdr.de; Fri, 07 Aug 2020 05:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1k3yvA-0000w1-WE
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 05:44:17 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:49455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1k3yv9-0004PK-A8
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 05:44:16 -0400
Received: from [192.168.100.1] ([82.252.135.186]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MLhsE-1kLeIP03HM-00HgVk; Fri, 07 Aug 2020 11:44:13 +0200
Subject: Re: [PATCH 2/2] linux-user: Adjust guest page protection for the host
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20200519185645.3915-1-richard.henderson@linaro.org>
 <20200519185645.3915-3-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <fca0f4c8-8018-e765-d997-27869f68c843@vivier.eu>
Date: Fri, 7 Aug 2020 11:44:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200519185645.3915-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PpLHzCyW9mYmyk5hbwQimPbeuaciUgqgY3ztXhOZxrNxTc4ZNF6
 QJadxS4iDrK5OodozSEE0e3y6w4xB4NNiTp8rYWBaq1DXjI7IxhOhpJIy6vuIQ3Dgp0UnQX
 r9O+QOG4UFf19rRXFLhLjCk2zdnTNIbUApSzvy6rTAUmoQOYdMaFAHunA8KvzWSUO/f3dLE
 ECsgibUICE2AGBvvkcgjg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ynwrj4Ms0+E=:X1vc7rNDSJ0kuPbjI8A4NV
 e9ca7OQjIbCgaO2suv0n81i9KzQIsJikP7Yw2+m0u87RSJGZFH+mLJ9+jPjOHlCpE9gvQZiGg
 fvB79s25nWZ5YeCsgps2D8fJ23ebrKxAEuyO5m48Hp2B3+RgV9813CdUhjFqwDuwO1jDPct3j
 iUXxDmROXMgj5vf2Z6zAyBzGuUpHCJQteUFK7H1UWdL0I0raDkaVieLCmx58juADG5ObFPp4j
 2VFwQ2zDP86Mh1G0uMx1eW4d5y1SOf1rNS/iNxqxaZlrowZEwIyLGeVlanirXdl/zVQk6LVEV
 2LG8D20spYVyYy7O/Fr/DvtVjuACHrFaON4eLAEz32KkNl/TBF0VOhwFfeKwwvojeH7KvfOmF
 m5Ntd21sW6ZOWUxGR6cKTN3DcxKLCx8/MMW+VvuDq61tuYAYGV0UwRhFsd4hIg8ZtQMXp2JM7
 y4cP5po0VC3CGVDRnmMnN3YxQfaIw9rMjIvdrN0cmXvBbh20W1rkO9QHGW3N1MVK7f77n3/sR
 +KLjQHJ5twZNykiwH5jG7IsD4P9QcezfE+DzH04q3ZuzjudX/nNOsY98U3MX0XQQxNqbZLltM
 +oOCWJpO56eMgQbd/nT2slSIvSnFKR8LoL5QRVeFX7T3u+HrysNxF/z1hpvzQQiKhWZ8PXfku
 BDPKG7uLe9w5QEv1cfPSwCr25epCzaqeyG+GE6E2ibA8t6fZdoEQ6YHRtzdndJcXZh+15/EaI
 lFVsh9iO8PZZ0v5obrRT1ih4l9WDrfteswHKGIQzCVJPm4Dzn2xpERdiGq0LjRf6hGFRT3IQ4
 1nKzPVDerHTopy3yLkz0rULgBkPGZSayC52YBNcqJw/LXrrD/A7/1Odju748oj/uZdSzg42
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/07 05:44:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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

Le 19/05/2020 à 20:56, Richard Henderson a écrit :
> Executable guest pages are never directly executed by
> the host, but do need to be readable for translation.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/mmap.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index 36fd1e2250..84662c3311 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -76,8 +76,12 @@ static int validate_prot_to_pageflags(int *host_prot, int prot)
>       * don't bother transforming guest bit to host bit.  Any other
>       * target-specific prot bits will not be understood by the host
>       * and will need to be encoded into page_flags for qemu emulation.
> +     *
> +     * Pages that are executable by the guest will never be executed
> +     * by the host, but the host will need to be able to read them.
>       */
> -    *host_prot = prot & (PROT_READ | PROT_WRITE | PROT_EXEC);
> +    *host_prot = (prot & (PROT_READ | PROT_WRITE))
> +               | (prot & PROT_EXEC ? PROT_READ : 0);
>  
>      return prot & ~valid ? 0 : page_flags;
>  }
> 

Applied to my linux-user-for-5.2 branch.

Thanks,
Laurent

