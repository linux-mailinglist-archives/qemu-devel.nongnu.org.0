Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4C63877C8
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 13:34:15 +0200 (CEST)
Received: from localhost ([::1]:38056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lixzK-0003oE-44
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 07:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lixy7-000386-Bo
 for qemu-devel@nongnu.org; Tue, 18 May 2021 07:32:59 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:35653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lixy5-0007dl-JP
 for qemu-devel@nongnu.org; Tue, 18 May 2021 07:32:59 -0400
Received: from [192.168.100.1] ([82.142.31.78]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M5wc7-1lolfE17Gd-007VMO; Tue, 18 May 2021 13:32:51 +0200
Subject: Re: [PATCH v3 0/3] hw/elf_ops: clear uninitialized segment space
To: qemu-devel@nongnu.org
References: <20210429141326.69245-1-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <4b88db03-9139-dd92-2479-90d73ec09bcb@vivier.eu>
Date: Tue, 18 May 2021 13:32:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210429141326.69245-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HU4oiD6Vhf+CX1Qy6XSL+szSmId1pQUwKdgjzMMna4n/NfhLQxO
 OANskBTF8Rh9tGoofMt5uIk0XqRnWKEhvnY+piyTQ6hOZytLHtq2DFqcHZJxrVrfqBUkFy3
 kxv1BrLG7O1mA5N6TiearEcAy1B3x7GMjJrByCVqGIdEXUQWU6cKNm1LUWBVIcFWIvBTFmA
 UA+rjI6E/bpMO7eBPMBfQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OS949x6PBMk=:J9HjuHwdl15UueIIAuhCgP
 7LGtm/M6Negru04+e42la9rf8naD0lcUeTbmq04vNKYVzwcGa7t/txgKfxkOBTw0sAuYgNEwy
 F+NbkjPuKjO/yo4lcyjcQXsH+kF2Q2Wkr8kx/yY7uKe9CyKRNC49F7qLX2+nj8h4ik68LXsmZ
 aLSLrl3MclbQiU44BCPVIkq5fd7MlRhBvXZY6J4+05UgU39SYvoZNRSPO9VUXgAUZuapTzta0
 rINTbyi1+2n0pmGmJBLibGXBGG+FFbJPIsetPcJuQOYCG3MJWRkufUGWdwAZJw6dBRBA6bTzb
 SXXzo3rXtzf4v/RxSW6cLMITHlJ0y/ew6+iN6q1WikHDRPSuRTPZYi8w54mvmP2hDxpKbCKps
 4Ty/qQrVh8D5f+XwbP1ssYVaLIqXunqgR9uOgNVr4b5LfVzRkhfSseOdvdBsHm/0Eyfp+nHHk
 5R2H1p7n2mdMUhPGP1fZsslC82BvFbRlx3OxoEUqvXxOkJv+MHOg6BwQ5hjChmPCTfqINWXiZ
 gRzJvfpBRIDPm2fcakVguI=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 29/04/2021 à 16:13, Laurent Vivier a écrit :
> When the mem_size of the segment is bigger than the file_size,
> and if this space doesn't overlap another segment, it needs
> to be cleared.
> 
> When the file is loaded in RAM, it is cleared by the loader (PATCH 2),
> when the file is loaded in a ROM, the space is cleared on reset,
> when the data of the file is copied from the data buffer to
> the machine memory space (PATCH 3).
> 
> This series a new function address_space_set() to clear the memory.
> 
> v3: add a patch to clear the uninitialized space of the ROM
> v2: PMD introduces address_space_set() function
> 
> Laurent Vivier (2):
>   hw/elf_ops: clear uninitialized segment space
>   hw/core/loader: clear uninitialized ROM space
> 
> Philippe Mathieu-Daudé (1):
>   exec/memory: Extract address_space_set() from dma_memory_set()
> 
>  include/exec/memory.h | 16 ++++++++++++++++
>  include/hw/elf_ops.h  | 13 +++++++++++++
>  hw/core/loader.c      |  4 ++++
>  softmmu/dma-helpers.c | 16 +---------------
>  softmmu/physmem.c     | 19 +++++++++++++++++++
>  5 files changed, 53 insertions(+), 15 deletions(-)
> 

Anyone to merge the series?

Thanks,
Laurent

