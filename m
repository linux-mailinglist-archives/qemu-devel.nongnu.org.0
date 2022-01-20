Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B746E494A20
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 09:52:21 +0100 (CET)
Received: from localhost ([::1]:54262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nATB6-0003cn-6D
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 03:52:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nASXs-0000uI-HC
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 03:11:57 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:44479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nASXl-0006Yj-2d
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 03:11:42 -0500
Received: from [192.168.100.1] ([82.142.13.186]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MPK73-1mvvpT0eFR-00Pbz0; Thu, 20 Jan 2022 09:11:26 +0100
Message-ID: <dd699955-c242-34f0-3b09-1b032305688b@vivier.eu>
Date: Thu, 20 Jan 2022 09:11:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 0/3] m68k: virt: fix reboot
Content-Language: fr
To: qemu-devel@nongnu.org
References: <20220115203725.3834712-1-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220115203725.3834712-1-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:XTF6nzbRhbGHfDJs0cY7LMcXcVOKslE1jNsRJ4M+IR53ixCf7Su
 OlHtGDP6tPeAe/2BamrcL9s7YvmUWKuWpU8PuEXIf8F9WPAJpTrN8zNonAAuZ+/3RvVIu5N
 HKHRjl9LGcCkGL4cFgPk6lDfEz8DrpXgfB+qLC2qUhfzEGBdlpXNEp9DwqPZah9YHcgBZMj
 cuhRk2zYJI4sqcdwMc3Ew==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zfLrk17/z/E=:0N/mxg8eMcBlqnPBDX7wOR
 zZ8xNB75kZfiMSQqeT3cLEUrq7920uySuNyurRpv2qXQnqVLkQSy//HHE/kwA0EA8jBYj1trJ
 O3c3vNuHcXhv4uxRWT8ORk7wqdpRuElzNz7LBqIgzBMOUXMjBs8uXRrdWXA5wplTAVNgGRlma
 A6lcTXcxVAvnrWPty81Wp7ipGUPhMspWpDo35/uRHfExPc8515qooU8rJSEf8odxw3KKXEB8W
 iOda/hVvFph0Cv8CY4+10Ug5VfU2YNCnMj8jQr42mU2J/F4C6DRso7nn9QX4O4GJqjx4pY9xk
 b23WmfCDr9Of3TFqNO8shZjd0pUv6cLhlOxUSJwK8nPy5bsVU9yixPaa2A1lPyVZ+WqWRaEFm
 29cKzWBU8zpbcm31q/K8RQ38GdfiRA8WRm34+d5orny8jLHLP0ZbBwyBRe8wKSAcC8fTdVtCg
 eEEMcdRGN6T40Z6BwMSQbsAnXsshzqEUICyDzhhyIcotT9x30QPzB09S4wkR0NOyaLXbYkl2l
 lu/EmUyj5DO+qkn019ZykbBrwQhxui/M3XACJDP85teIyeyF2xcb47hu6645nwOs71FeF7EH2
 zl48pSb1SiKXgNMk/5ZjhEpiE+z1twsZtKeEsYiw6rvy+nsHRFgMIWwCYj54Nv+HD0TijCA9+
 OrGGPNrtif1g54kOsCK/upse/cZebI1sxPEBNVatUryFqFJpfiF9HMCL4i7r01gPF/2c=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 15/01/2022 à 21:37, Laurent Vivier a écrit :
> This series fixes the reboot of the virt-m68k machine
> by correctly initializing the start address and fixing
> the ELF kernel image.
> 
> The two first patches were already sent last year and
> never merged:
> 
> https://patchwork.kernel.org/project/qemu-devel/cover/20210429141326.69245-1-laurent@vivier.eu/
> 
> Thanks,
> Laurent
> 
> Laurent Vivier (2):
>    hw/elf_ops: clear uninitialized segment space
>    m68k: virt: correctly set the initial PC
> 
> Philippe Mathieu-Daudé (1):
>    exec/memory: Extract address_space_set() from dma_memory_set()
> 
>   include/exec/memory.h | 16 ++++++++++++++++
>   include/hw/elf_ops.h  | 13 +++++++++++++
>   hw/core/loader.c      |  4 ++++
>   hw/m68k/virt.c        | 22 +++++++++++++++++-----
>   softmmu/dma-helpers.c | 15 +--------------
>   softmmu/physmem.c     | 19 +++++++++++++++++++
>   6 files changed, 70 insertions(+), 19 deletions(-)
> 


Applied to my m68k-for-7.0 branch

Thanks,
Laurent

