Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C7B572796
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 22:45:34 +0200 (CEST)
Received: from localhost ([::1]:35926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBMlB-0004g6-9w
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 16:45:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oBMXe-0001EU-2a; Tue, 12 Jul 2022 16:31:34 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d]:35664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oBMXc-000632-FX; Tue, 12 Jul 2022 16:31:33 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-10be0d7476aso11750446fac.2; 
 Tue, 12 Jul 2022 13:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:references:cc:in-reply-to:content-transfer-encoding;
 bh=hgv5n5YUjoPNLB8rLxuyPbBQNavwZeulTCKwV++C5tU=;
 b=VX0yYwNnccJHj0hJpD0LPjgdilC7lxoMppoXdsLDiQRXSerlD7cW09a4F1wpW9lN8R
 Ekf+y9czBUShWq1gr5SqU35Kqg1N0Lzq+mFmj3mGL4QF7eIvR7Yj0iAuvkPHEwxaQXa8
 GNiYZubU7/7HSNwaxtaDnO08X2uF1qr0thBTY/02+OLhs9yKBIfJXXeRC5oYBaNlGgzm
 p21gFFRj+vlow2aONBrW4mhzBOKA5yKSWk0iNmgC/eyUa9RsMcvveqiGF6aJijfntXem
 lYQguENPF/d2amFKvEqkDbLbDi6mIHAlqifVRfqpDKNkO6PnKUrzIAL7AgPAJLSQUycB
 5J6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:cc:in-reply-to
 :content-transfer-encoding;
 bh=hgv5n5YUjoPNLB8rLxuyPbBQNavwZeulTCKwV++C5tU=;
 b=m1NT88Vfcq9WNyrNtM/1bnZhvgmyMkPP7DZch7g1sJjxMSCPyUhURmlN2V1IokK4Pq
 jriyFEPHllN0aOB2m1KFumISduR6CTIk4XEDI2CGF4b9GuMjy0IaD7fN5v8B8oECyPVR
 z3MDVpy074Yx2tCbZ+EowSleaDxVs/T+dCMRzWkj1ZQTjD0r+mbD+SNjCk0AEpa6/mg+
 YnsJJEc4/iBYjQi3T+kV580TjyKiluXd7xuaUkasKq8EVIDWKGX45TKhNObD0QY31viR
 ivuM6/91IYiD3J8Jyb9gFNw0JOlzljB1KJBGSNC62eOVEY1tTPQvbngaR9LEZJIBzzPX
 6M8w==
X-Gm-Message-State: AJIora9Gxpeb2XeAdd2jXpTeGU+nsa1Otr2ahtSPpI0krISHn08dPPTR
 Jn3dCptjeQ5KFb2S/o78okkRQmxAxok=
X-Google-Smtp-Source: AGRyM1sfyqTm6u7yivcYa28bVqL1gvFITTHWwYIwbC16EA7b4BZVw7cg7AeWKMq3hs6iM/eS6CyLnw==
X-Received: by 2002:a05:6870:4214:b0:10b:be93:47 with SMTP id
 u20-20020a056870421400b0010bbe930047mr2915999oac.276.1657657889847; 
 Tue, 12 Jul 2022 13:31:29 -0700 (PDT)
Received: from [192.168.10.102] (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 u17-20020a056870305100b000f325409614sm5067601oau.13.2022.07.12.13.31.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 13:31:29 -0700 (PDT)
Message-ID: <af9db769-ad98-9dc4-ebd7-fc792a1c5e82@gmail.com>
Date: Tue, 12 Jul 2022 17:31:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] hw/ppc: pass random seed to fdt
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-devel@nongnu.org
References: <20220712135114.289855-1-Jason@zx2c4.com>
 <7310087f-443e-ebdb-f345-a18358a874e4@gmail.com>
Cc: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Cedric Le Goater <clg@kaod.org>
In-Reply-To: <7310087f-443e-ebdb-f345-a18358a874e4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

CCing qemu-ppc and Cedric for awareness since I forgot to do so in
my reply (⌒_⌒;)



Daniel

On 7/12/22 17:26, Daniel Henrique Barboza wrote:
> 
> 
> On 7/12/22 10:51, Jason A. Donenfeld wrote:
>> If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
>> initialize early. Set this using the usual guest random number
>> generation function. This is confirmed to successfully initialize the
>> RNG on Linux 5.19-rc6. The rng-seed node is part of the DT spec. Set
>> this on the paravirt platforms, spapr and e500, just as is done on other
>> architectures with paravirt hardware.
>>
>> Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>> ---
> 
> With current QEMU master, running a fedora 36 ppc64le guest with a
> 5.19.0-rc2-00054-g12ede8ffb103 kernel :
> 
> [root@fedora ~]# dmesg | grep -i rng
> [    5.130623] random: crng init done
> [root@fedora ~]#
> 
> 
> After applying this patch:
> 
> 
> [root@fedora ~]# dmesg | grep -i rng
> [    0.000000] random: crng init done
> [root@fedora ~]#
> 
> 
> 
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
> 
> 
> 
>>   hw/ppc/e500.c  | 5 +++++
>>   hw/ppc/spapr.c | 5 +++++
>>   2 files changed, 10 insertions(+)
>>
>> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
>> index 7f7f5b3452..2f86eb490e 100644
>> --- a/hw/ppc/e500.c
>> +++ b/hw/ppc/e500.c
>> @@ -17,6 +17,7 @@
>>   #include "qemu/osdep.h"
>>   #include "qemu/datadir.h"
>>   #include "qemu/units.h"
>> +#include "qemu/guest-random.h"
>>   #include "qapi/error.h"
>>   #include "e500.h"
>>   #include "e500-ccsr.h"
>> @@ -346,6 +347,7 @@ static int ppce500_load_device_tree(PPCE500MachineState *pms,
>>           };
>>       const char *dtb_file = machine->dtb;
>>       const char *toplevel_compat = machine->dt_compatible;
>> +    uint8_t rng_seed[32];
>>       if (dtb_file) {
>>           char *filename;
>> @@ -403,6 +405,9 @@ static int ppce500_load_device_tree(PPCE500MachineState *pms,
>>       if (ret < 0)
>>           fprintf(stderr, "couldn't set /chosen/bootargs\n");
>> +    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
>> +    qemu_fdt_setprop(fdt, "/chosen", "rng-seed", rng_seed, sizeof(rng_seed));
>> +
>>       if (kvm_enabled()) {
>>           /* Read out host's frequencies */
>>           clock_freq = kvmppc_get_clockfreq();
>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>> index 9a5382d527..3a5112899e 100644
>> --- a/hw/ppc/spapr.c
>> +++ b/hw/ppc/spapr.c
>> @@ -27,6 +27,7 @@
>>   #include "qemu/osdep.h"
>>   #include "qemu/datadir.h"
>>   #include "qemu/memalign.h"
>> +#include "qemu/guest-random.h"
>>   #include "qapi/error.h"
>>   #include "qapi/qapi-events-machine.h"
>>   #include "qapi/qapi-events-qdev.h"
>> @@ -1014,6 +1015,7 @@ static void spapr_dt_chosen(SpaprMachineState *spapr, void *fdt, bool reset)
>>   {
>>       MachineState *machine = MACHINE(spapr);
>>       SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(machine);
>> +    uint8_t rng_seed[32];
>>       int chosen;
>>       _FDT(chosen = fdt_add_subnode(fdt, 0, "chosen"));
>> @@ -1091,6 +1093,9 @@ static void spapr_dt_chosen(SpaprMachineState *spapr, void *fdt, bool reset)
>>           spapr_dt_ov5_platform_support(spapr, fdt, chosen);
>>       }
>> +    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
>> +    _FDT(fdt_setprop(fdt, chosen, "rng-seed", rng_seed, sizeof(rng_seed)));
>> +
>>       _FDT(spapr_dt_ovec(fdt, chosen, spapr->ov5_cas, "ibm,architecture-vec-5"));
>>   }

