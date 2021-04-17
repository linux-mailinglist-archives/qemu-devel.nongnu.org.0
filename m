Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC463630EB
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 17:38:01 +0200 (CEST)
Received: from localhost ([::1]:43564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXn1D-0005NT-To
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 11:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lXn0L-0004ue-74
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 11:37:05 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:56341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lXn0J-00016N-FQ
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 11:37:04 -0400
Received: from [192.168.100.1] ([82.142.18.94]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MJmX3-1lDnJB0Sr3-00K54C; Sat, 17 Apr 2021 17:36:56 +0200
Subject: Re: [PATCH v2 2/2] hw/elf_ops: clear uninitialized segment space
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org
References: <20210415100409.3977971-1-philmd@redhat.com>
 <20210415100409.3977971-3-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <60cdb1d4-225e-b61b-8e58-19933e03d4fb@vivier.eu>
Date: Sat, 17 Apr 2021 17:36:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415100409.3977971-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:a/fTdk7X89SH5FF89oTaVA4193L5yYKwR/Thaknkcl1ZE+Mi56V
 Mqx0fcEkNkvSNK3kKbDF0+ILO71QbpGT8gDS+R0GxlE0W90Swz3Svn4w1Bi5UmCzelRp+Yp
 xj3Sce6R2JQqE4aqOPJ7W87TEPTsDc5fktqSp74UEn4P0NyqlcmeR3Gqu0nGDmTJmmCqZQb
 bVzAPauYoEw8pzDyUd22A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BcaGt+sWKps=:rGNF6H/GlpntzPXaAWlO2B
 pAQ7PdnXdJXB6zNPCONCzva1Qk9XWpoo1DbqVOH9mwP9NU53hHpyf2d3OsmV7rCxragYzH6Fe
 GteN615SjuHW0RY8V9T7vtqWxKUwQX6hdGcMDYIAzN10x8sl0Rr4jZ5EJewzYfQyZ3ihssaRi
 YYY/8ou0AEsxEAnjMRMz2XMDV5OcADry0yhnZiuSSDlWGTbVII5TOqZ1jjH3YKFGiA4xZTQOK
 7KyF8hkmulH6i99zc8sQd5zyEhHmhr2N3MuJoPj54IoBHlSWL6b4rP2VLV6+WxlpHPVyHHU2V
 B0yMvvzUnGSiIgD181v6yseNMFUZKy9JFi0pIEjI89lLN7CChm2Y1Ij6HzIf3MeFrJTUsAnwV
 +uHWt6GZZQM6OpPVnXkBlgaFIXU9P7eB9vzC+xlMH2ZHUtg7Q/6LbG37N5WWNEf0PnoyYp1vY
 WeTklu2D5a0qGHWde8fEsJUHkW9mXfNbhWzTQRp38aCkdTf+2bGhIICHIOl/XDftKMmH7azaD
 RmkS/gWJqJAU1IaT4eRM3I=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
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
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 15/04/2021 à 12:04, Philippe Mathieu-Daudé a écrit :
> From: Laurent Vivier <laurent@vivier.eu>
> 
> When the mem_size of the segment is bigger than the file_size,
> and if this space doesn't overlap another segment, it needs
> to be cleared.
> 
> This bug is very similar to the one we had for linux-user,
> 22d113b52f41 ("linux-user: Fix loading of BSS segments"),
> where .bss section is encoded as an extension of the the data
> one by setting the segment p_memsz > p_filesz.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> Message-Id: <20210414105838.205019-1-laurent@vivier.eu>
> [PMD: Use recently added address_space_set()]
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/hw/elf_ops.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
> index 6ee458e7bc3..29f4c43e231 100644
> --- a/include/hw/elf_ops.h
> +++ b/include/hw/elf_ops.h
> @@ -562,6 +562,19 @@ static int glue(load_elf, SZ)(const char *name, int fd,
>                      if (res != MEMTX_OK) {
>                          goto fail;
>                      }
> +                    /*
> +                     * We need to zero'ify the space that is not copied
> +                     * from file
> +                     */
> +                    if (file_size < mem_size) {
> +                        res = address_space_set(as ? as : &address_space_memory,
> +                                                addr + file_size, 0,
> +                                                mem_size - file_size,
> +                                                MEMTXATTRS_UNSPECIFIED);
> +                        if (res != MEMTX_OK) {
> +                            goto fail;
> +                        }
> +                    }
>                  }
>              }
>  
> 

It seems we need also the same kind of operation with the other branch of the if
(rom_add_elf_program()), but I'm not sure where to do it:

diff --git a/hw/core/loader.c b/hw/core/loader.c
index d3e5f3b423f6..8146fdcbb7a0 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1146,9 +1146,13 @@ static void rom_reset(void *unused)
         if (rom->mr) {
             void *host = memory_region_get_ram_ptr(rom->mr);
             memcpy(host, rom->data, rom->datasize);
+            memset(host + rom->datasize, 0, rom->romsize - rom->datasize);
         } else {
             address_space_write_rom(rom->as, rom->addr, MEMTXATTRS_UNSPECIFIED,
                                     rom->data, rom->datasize);
+            address_space_set(rom->as, rom->addr + rom->datasize, 0,
+                              rom->romsize - rom->datasize,
+                              MEMTXATTRS_UNSPECIFIED);
         }
         if (rom->isrom) {
             /* rom needs to be written only once */

Thanks,
Laurent

