Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FC46ABF37
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 13:12:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ9g9-0007HS-B2; Mon, 06 Mar 2023 07:10:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pZ9g0-0007Gw-M5; Mon, 06 Mar 2023 07:10:49 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pZ9fx-0007WG-Ju; Mon, 06 Mar 2023 07:10:48 -0500
Received: from [192.168.0.120] (unknown [180.165.240.213])
 by APP-05 (Coremail) with SMTP id zQCowABXX5s02AVkCtE4DA--.9143S2;
 Mon, 06 Mar 2023 20:10:29 +0800 (CST)
Message-ID: <5032e9ed-b8ef-cc0e-e122-1ec09fc00cf3@iscas.ac.cn>
Date: Mon, 6 Mar 2023 20:10:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/1] hw/riscv: Add signature dump function for spike to
 run ACT tests
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230306090314.74626-1-liweiwei@iscas.ac.cn>
 <20230306090314.74626-2-liweiwei@iscas.ac.cn>
 <6dd0199c-c3e0-a466-67b3-dab92df587d2@linux.alibaba.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <6dd0199c-c3e0-a466-67b3-dab92df587d2@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABXX5s02AVkCtE4DA--.9143S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Gr45Jr17Xw45KrW8Zr18Krg_yoW3Xw4Dpr
 1kJr1UJryUJr1kJr17Jr1UJFy5Jr1UJw1UJr1rXF1UJr4UJr1jqr1UXr1jgr1UJr48Jr1U
 Jr1UJrnrZr1UJr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
 c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
 C2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-Originating-IP: [180.165.240.213]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 2023/3/6 19:00, LIU Zhiwei wrote:
>
> On 2023/3/6 17:03, Weiwei Li wrote:
>> Add signature and signature-granularity properties in spike to 
>> specify the target
>> signatrue file and the line size for signature data.
>>
>> Recgonize the signature section between begin_signature and 
>> end_signature symbols
>> when loading elf of ACT tests. Then dump signature data in signature 
>> section just
>> before the ACT tests exit.
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   hw/char/riscv_htif.c | 39 ++++++++++++++++++++++++++++++++++++++-
>>   hw/riscv/spike.c     | 16 ++++++++++++++++
>>   2 files changed, 54 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/char/riscv_htif.c b/hw/char/riscv_htif.c
>> index 098de50e35..2a82ed8500 100644
>> --- a/hw/char/riscv_htif.c
>> +++ b/hw/char/riscv_htif.c
>> @@ -29,6 +29,8 @@
>>   #include "chardev/char-fe.h"
>>   #include "qemu/timer.h"
>>   #include "qemu/error-report.h"
>> +#include "exec/address-spaces.h"
>> +#include "sysemu/dma.h"
>>     #define RISCV_DEBUG_HTIF 0
>>   #define HTIF_DEBUG(fmt, 
>> ...)                                                   \
>> @@ -51,7 +53,10 @@
>>   /* PK system call number */
>>   #define PK_SYS_WRITE            64
>>   -static uint64_t fromhost_addr, tohost_addr;
>> +extern const char *sig_file;
>> +extern uint8_t line_size;
>> +
> Why not declare them in riscv_htif.h and include them in 
> hw/riscv/spike.c?

Do you mean the above "extern ..." declaration? It's OK to move them to 
riscv_hitf.h.

However, we can not move the definition in spike.c to riscv_htif.h. 
Otherwise, it'll trigger

multiple definition error.

>> +static uint64_t fromhost_addr, tohost_addr, sig_addr, sig_len;
>>     void htif_symbol_callback(const char *st_name, int st_info, 
>> uint64_t st_value,
>>                             uint64_t st_size)
>> @@ -68,6 +73,10 @@ void htif_symbol_callback(const char *st_name, int 
>> st_info, uint64_t st_value,
>>               error_report("HTIF tohost must be 8 bytes");
>>               exit(1);
>>           }
>> +    } else if (strcmp("begin_signature", st_name) == 0) {
>> +        sig_addr = st_value;
>> +    } else if (strcmp("end_signature", st_name) == 0) {
>> +        sig_len = st_value - sig_addr;
>>       }
>>   }
>>   @@ -161,6 +170,34 @@ static void htif_handle_tohost_write(HTIFState 
>> *s, uint64_t val_written)
>>           /* frontend syscall handler, shutdown and exit code support */
>>           if (cmd == HTIF_SYSTEM_CMD_SYSCALL) {
>>               if (payload & 0x1) {
>> +                /* Dump signature data to sig_file if specified */
>> +                if (sig_file) {
>> +                    char *sig_data = g_malloc(sig_len);
>> +                    dma_memory_read(&address_space_memory, sig_addr, 
>> sig_data,
>> +                                    sig_len, MEMTXATTRS_UNSPECIFIED);
>> +                    FILE *signature = fopen(sig_file, "w");
>> +                    if (signature == NULL) {
>> +                        error_report("open %s: %s", sig_file,
>> +                                     strerror(errno));
>> +                        exit(1);
>> +                    }
>> +
>> +                    for (int i = 0; i < sig_len; i += line_size) {
>> +                        for (int j = line_size; j > 0; j--) {
>> +                            if (i + j <= sig_len) {
>> +                                fprintf(signature, "%02x",
>> +                                        sig_data[i + j - 1] & 0xff);
>
> Not sure about the order. Otherwise, 

It will put the higher data(at higher address) before the lower data in 
the same line,

just as the htif logic in riscv-isa-sim(spike).

Regards,

Weiwei Li

>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>
> Zhiwei
>
>> +                            } else {
>> +                                fprintf(signature, "%02x", 0);
>> +                            }
>> +                        }
>> +                        fprintf(signature, "\n");
>> +                    }
>> +
>> +                    fclose(signature);
>> +                    g_free(sig_data);
>> +                }
>> +
>>                   /* exit code */
>>                   int exit_code = payload >> 1;
>>                   exit(exit_code);
>> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
>> index a584d5b3a2..eaa7f54fd6 100644
>> --- a/hw/riscv/spike.c
>> +++ b/hw/riscv/spike.c
>> @@ -41,6 +41,9 @@
>>     #include <libfdt.h>
>>   +const char *sig_file;
>> +uint8_t line_size = 16;
>> +
>>   static const MemMapEntry spike_memmap[] = {
>>       [SPIKE_MROM] =     {     0x1000,     0xf000 },
>>       [SPIKE_HTIF] =     {  0x1000000,     0x1000 },
>> @@ -332,6 +335,11 @@ static void spike_board_init(MachineState *machine)
>>                    htif_custom_base);
>>   }
>>   +static void spike_set_signature(Object *obj, const char *val, 
>> Error **errp)
>> +{
>> +    sig_file = g_strdup(val);
>> +}
>> +
>>   static void spike_machine_instance_init(Object *obj)
>>   {
>>   }
>> @@ -350,6 +358,14 @@ static void spike_machine_class_init(ObjectClass 
>> *oc, void *data)
>>       mc->get_default_cpu_node_id = riscv_numa_get_default_cpu_node_id;
>>       mc->numa_mem_supported = true;
>>       mc->default_ram_id = "riscv.spike.ram";
>> +    object_class_property_add_str(oc, "signature", NULL, 
>> spike_set_signature);
>> +    object_class_property_set_description(oc, "signature",
>> +                                          "File to write ACT test 
>> signature");
>> +    object_class_property_add_uint8_ptr(oc, "signature-granularity",
>> +                                        &line_size, 
>> OBJ_PROP_FLAG_WRITE);
>> +    object_class_property_set_description(oc, "signature-granularity",
>> +                                          "Size of each line in ACT 
>> signature "
>> +                                          "file");
>>   }
>>     static const TypeInfo spike_machine_typeinfo = {


