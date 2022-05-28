Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D25536DC8
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 18:37:19 +0200 (CEST)
Received: from localhost ([::1]:42556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuzRG-0006Bt-49
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 12:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nuzOm-0004YI-I8
 for qemu-devel@nongnu.org; Sat, 28 May 2022 12:34:44 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:53387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nuzOl-0004MH-09
 for qemu-devel@nongnu.org; Sat, 28 May 2022 12:34:44 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N7RDn-1nlTKc4ArV-017kp6; Sat, 28 May 2022 18:34:32 +0200
Message-ID: <5698d234-e887-e358-b127-d92861fa7a30@vivier.eu>
Date: Sat, 28 May 2022 18:34:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 15/17] linux-user/strace: Use is_error in
 print_syscall_err
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220527164807.135038-1-richard.henderson@linaro.org>
 <20220527164807.135038-16-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220527164807.135038-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BZ5+M7zBokytft6VAXGa47AkA+n7B5yVN2GDu0f1Xdc9iXMrgW8
 derApLfKjWtOIBusgNtJeTpMl0v476MqGbc0LOBCMd3VmQljFMRN1AVW9Mb19HLGqzwKN0j
 cCNJQQtoDDZej7LcGvgjg4LqSEFelF+v17RdsHHVTEGopWlppaNyqXiXQmI0zM3Ufx5u2h6
 eyE6KIqSuWB6D+ptAMJTA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KiLGPf6oUkQ=:b/Qf0/DE97ppJg68jkHGf2
 Ohd1Hql7i3fPch+eUpSfB6ZJe7WqbA73y6BwlOMR3Zv35Asw3mHEUUZSr/gtSGD6nT43+F2Lz
 iFnDU635m194WWsMIgR6ttCD39xem7xsgzT2DvXHB+a5YNQ7I44vtb18k166ob7+gpq/1Rxes
 zegsrfG+j2/UiB1MZU4Agjj3O1NdXUhW5Ojba3L7jUjArcmw5H+OtpTU5PIdwJpgUifd0bkXr
 MKlPKPF2HiO9kEUlE0Ib/tZ2qLafv6kcv30Pi+JGUNUIiIvVA4if0tXHjefUWcpIfMfAOz0ZF
 NFwIoS4CekuyLKWF4wiOIVwgCualrc++/dZ1RHTf8g1s5dt7Z6/2gvwTznWqNVIZEZSLLMc70
 0NLPTYWiFrJpPsj4P+DOrCD/BD1AeMyjW8GB9B9CdNdTyy56HfxQWojGiXRo53zG4R346SCAR
 mxBFlUb3Gm/wCMHUlzkA7JRLGQdH3RhweV6pj9BnqJBCjGbEzKIBKEVG3MVhFuqzC0Tdft5DK
 9Q8qCBUKUbbPsf27MiNFenIF95n7l/K1bhl9Pvl4lMiceTHjceO565kbFeJH/00CCf64nL9Mw
 EB2OneNpfkBEuFW60BRAxI/7BfhrES/Q4M8o0sSA22X1vnO1Q1n7PaI0wH1YLYKXshGdQ8P5h
 lRDWNrm6KnS6RHtfZA3P4b8FCSbd6XHLLbRCVNFsYfe+ofuGugBNsEZ5u3ih6Fbc2xbx7xEf5
 QNyb1SETkwabl7v/lgJdZXz18xERTsqb7PO6zQ==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 27/05/2022 à 18:48, Richard Henderson a écrit :
> Errors are not all negative numbers: use is_error.
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/strace.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index 9fa681dea9..7d882526da 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -689,7 +689,7 @@ print_syscall_err(abi_long ret)
>       const char *errstr;
>   
>       qemu_log(" = ");
> -    if (ret < 0) {
> +    if (is_error(ret)) {
>           errstr = target_strerror(-ret);
>           if (errstr) {
>               qemu_log("-1 errno=%d (%s)", (int)-ret, errstr);

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

