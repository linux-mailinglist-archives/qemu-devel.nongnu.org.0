Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E25F5EBF3C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:07:17 +0200 (CEST)
Received: from localhost ([::1]:48950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od7Ug-0006VV-St
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od6uS-00078T-4M
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:29:49 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:35059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od6uP-0003lW-SP
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:29:47 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MNfgZ-1osBqG36xH-00P7fJ; Tue, 27 Sep 2022 11:29:35 +0200
Message-ID: <8007f9bc-3cfb-f29b-b7bb-82ff88d404ed@vivier.eu>
Date: Tue, 27 Sep 2022 11:29:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 2/2] linux-user: Set ELF_BASE_PLATFORM for MIPS
Content-Language: fr
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: f4bug@amsat.org, qemu-devel@nongnu.org
References: <20220803103009.95972-1-jiaxun.yang@flygoat.com>
 <20220803103009.95972-3-jiaxun.yang@flygoat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220803103009.95972-3-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Xt1uFq0ov2JWk7xQOssx/51HU0aR7z4XYjWEl/lxdDrBFfS6YMR
 cvAHIXT200qCoAcW1Kyu1EfCtLfaN1E9AsT23yYLkIoDr6mkB5ueUo6cQxbPDlWpwUWiADI
 qPfq+nmsaZPiUk7OpIGORpUzeOrx31uznmH0PT2OI+Vq2vSHXLG/pkbp2eIRwFGPbJcpbA1
 ei4r4hTgI6bYSZLYNffcA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:arTIbbNRzvU=:3EvZ8gYE0wpkUe+lS9qDUS
 FLqS3u2fTfqePVOTfN1Go/sEnXMvxBBK2l3Qa0joPp7NtasUli0hZdFzUNm70IjcFFD3QURhA
 w1BNmunCbeaUZA7YKz7A3fSSJv57XYnpf2Rsx9z1ozYXTXgGPXb6UWFm2B06NV5WYb2nOV7b5
 6eI3mDr9ck5tytnFjpzHKW/NDRGd4IGnGDb56fLxqRsHH4w7+Y2qDnimNplpsT7FXftfQVjL0
 Eu8SMmaM8i1uoIMvjqV7J1NhndaIk5GUx6KFxiCICH+xl3LWL7WB12FT8dqQ9ZrkR6zznXkpO
 fPf5et3yfzntQSRIOvwFr1bEb/2vfups5jvSlMambl2KGSjI9Vt/XdPaoM5YrithnK7AQeXQi
 Tp919EEiNG9F+YT3sVFLDKarQkHseASoljtSBuYcwX+W8dBIEC4lO9PhJZP6B6Mw7h3238Afs
 rx7CblHDZ2aZr59lmc6LsKyLlAXI+RFhd+KL20GiRiq1MaLBNayrGBQYT915aADG08de18jqx
 HTFEygq1S2UQGyTkSCF2v0VI3PcjqFGRg2a/MyovOqKS2TvvoqGhSnZZTF4YObPdT+sg5L+bO
 qe6QHt9IDLulkNrmUHJO83IPhIAmObaXqLCCeEaVekw65Biiooxog6tB3lLGROLTILgZvSgwq
 SxfOGoQtOVI4jyxBZDdGTaaiEnrdQzUJ4NiMv0+6KLAhfD2RShq8VGZT1ArGMtHnJQwrrDTEZ
 /XNf/8VVTsgZEweXDrXlHrQenQSJArEVONVmA/KvX5Ck+RgWVuzLEmhKy5cewg+9bfAYSSqnu
 YJ6und7
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Le 03/08/2022 à 12:30, Jiaxun Yang a écrit :
> Match most appropriate base platform string based on insn_flags.
> Logic is aligned with aligned with set_isa() from
> arch/mips/kernel/cpu-probe.c in Linux kernel.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   linux-user/elfload.c | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)

Applied to my linux-user-for-7.2 branch.

Thanks,
Laurent



