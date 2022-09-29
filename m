Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E105EFDFB
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 21:34:28 +0200 (CEST)
Received: from localhost ([::1]:53194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odzIh-00007C-Iq
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 15:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1odzF4-0005eq-J1; Thu, 29 Sep 2022 15:30:42 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:38923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1odzF2-0000M4-RS; Thu, 29 Sep 2022 15:30:42 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mwfj0-1pSutz40zq-00yBlX; Thu, 29 Sep 2022 21:30:14 +0200
Message-ID: <8d3d3fd5-8223-89d9-b384-c06faa0a4b01@vivier.eu>
Date: Thu, 29 Sep 2022 21:30:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] Use g_new() & friends where that makes obvious sense
Content-Language: fr
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: elena.ufimtseva@oracle.com, jag.raman@oracle.com,
 john.g.johnson@oracle.com, pizhenwei@bytedance.com, arei.gonglei@huawei.com,
 mst@redhat.com, huangy81@chinatelecom.cn, quintela@redhat.com,
 dgilbert@redhat.com, qemu-trivial@nongnu.org
References: <20220923084254.4173111-1-armbru@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220923084254.4173111-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nRzP9sTmzRfXxeF3VXrmIf0xEel0WbsDj4/EZu3h5jzPlfDEDhf
 XXTPQu+t3r5RwbWxG6BvZPOtW/pV4GxxtO6tHim7OvSD5JNvnHJsI3MlZ6gr4tECqkwX43M
 sc7Z7Lime89rWttHxSx/wQ9VCVvKtyyMUbQmIG204sRt3Rc2tY1B+NLwxJjyfwzmT+4ihy6
 1A1DfUm7aA9wuexAj/2pg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+XUcC6GFR4U=:FGn7/YG9qu4gKK4fmhjo29
 aBsHmL+JCgJo1ck75Ec05ncxEDOCZzRuojy0HHLUhjcctbyJ9MwuzmjZlAbpPwnRBhN+xBMjG
 qyLosa3gPjAc7zxrD+HRbY7A4WFUxJKuxeZqbyCJeSMM/lE/bFe7cmrbj1hR4V/jPNWe5MhmZ
 WIQsaFow7JA9yOM+BgdKLwg+kDeGRxJ5ReOO0UywoPAGqWxHoTF7N3xHQ+MT6b8PAf96bIAvx
 F0HfP0tuZJG/vl0B1rKsWfcZFNa0hFQ+N6ELMfzzmJY8KfNxj6jjHARYwVjmPdp1w5d1jJ307
 QKMQfqiGeoym+t2WuJLJ806bzLdPcYHmKkKmB3wszjPACFEIcwfXDwkNaWX7fNrNIPdgBBtAr
 l/X27doqSTF3+Ax9PpY+xtOwBzFjvCd6YemSSWu3LkvhdcVFe/JdEL+m8KOvX1x8SmMRRsygX
 k80cCU0GXCoW2V/kbYsht3OpzvIR8tkGFQxmA36L03ioQcXCzUy/WJ+ByWemuPwsAoZQOzLi2
 yn/99AkepehSpSOag5LzK2/o7HH/6+V1EzbIahxxaF7hg2X2Xvc5pkPmBXsSeqUWpBQ7AzlnW
 V1eQF3bGj95jOfXEsHHadp+amJSzOJ7Yg5agKCOa6MrPY7bjGBIg+gVXxF8uJ4QKjDOlWZzmR
 iKthp599G3vaK5XFc2q5YSrpqkRMwQQZ0C4s6I42LJvVRKNz+Ln6Lf5LZ7eNpDeRuuchYsYUq
 fccZweNOVN7BCjTz/8LIjiVdh5zJTgveXCXNhEsH0n1vJhITDy5qML8de/ofqtvTHtYnOBJB0
 zOigYmV
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.099,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Le 23/09/2022 à 10:42, Markus Armbruster a écrit :
> g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
> for two reasons.  One, it catches multiplication overflowing size_t.
> Two, it returns T * rather than void *, which lets the compiler catch
> more type errors.
> 
> This commit only touches allocations with size arguments of the form
> sizeof(T).
> 
> Patch created mechanically with:
> 
>      $ spatch --in-place --sp-file scripts/coccinelle/use-g_new-etc.cocci \
> 	     --macro-file scripts/cocci-macro-file.h FILES...
> 
> The previous iteration was commit a95942b50c.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/remote/iommu.c         | 2 +-
>   hw/virtio/virtio-crypto.c | 2 +-
>   migration/dirtyrate.c     | 4 ++--
>   softmmu/dirtylimit.c      | 4 ++--
>   4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/remote/iommu.c b/hw/remote/iommu.c
> index fd723d91f3..1391dd712c 100644
> --- a/hw/remote/iommu.c
> +++ b/hw/remote/iommu.c
> @@ -47,7 +47,7 @@ static AddressSpace *remote_iommu_find_add_as(PCIBus *pci_bus,
>       elem = g_hash_table_lookup(iommu->elem_by_devfn, INT2VOIDP(devfn));
>   
>       if (!elem) {
> -        elem = g_malloc0(sizeof(RemoteIommuElem));
> +        elem = g_new0(RemoteIommuElem, 1);
>           g_hash_table_insert(iommu->elem_by_devfn, INT2VOIDP(devfn), elem);
>       }
>   
> diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
> index c1243c3f93..df4bde210b 100644
> --- a/hw/virtio/virtio-crypto.c
> +++ b/hw/virtio/virtio-crypto.c
> @@ -710,7 +710,7 @@ virtio_crypto_handle_asym_req(VirtIOCrypto *vcrypto,
>       uint8_t *src = NULL;
>       uint8_t *dst = NULL;
>   
> -    asym_op_info = g_malloc0(sizeof(CryptoDevBackendAsymOpInfo));
> +    asym_op_info = g_new0(CryptoDevBackendAsymOpInfo, 1);
>       src_len = ldl_le_p(&req->para.src_data_len);
>       dst_len = ldl_le_p(&req->para.dst_data_len);
>   
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index 795fab5c37..d6f1e01a70 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -119,9 +119,9 @@ static DirtyPageRecord *vcpu_dirty_stat_alloc(VcpuStat *stat)
>       }
>   
>       stat->nvcpu = nvcpu;
> -    stat->rates = g_malloc0(sizeof(DirtyRateVcpu) * nvcpu);
> +    stat->rates = g_new0(DirtyRateVcpu, nvcpu);
>   
> -    records = g_malloc0(sizeof(DirtyPageRecord) * nvcpu);
> +    records = g_new0(DirtyPageRecord, nvcpu);
>   
>       return records;
>   }
> diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
> index 8d98cb7f2c..12668555f2 100644
> --- a/softmmu/dirtylimit.c
> +++ b/softmmu/dirtylimit.c
> @@ -154,7 +154,7 @@ void vcpu_dirty_rate_stat_initialize(void)
>   
>       vcpu_dirty_rate_stat->stat.nvcpu = max_cpus;
>       vcpu_dirty_rate_stat->stat.rates =
> -        g_malloc0(sizeof(DirtyRateVcpu) * max_cpus);
> +        g_new0(DirtyRateVcpu, max_cpus);
>   
>       vcpu_dirty_rate_stat->running = false;
>   }
> @@ -198,7 +198,7 @@ void dirtylimit_state_initialize(void)
>       dirtylimit_state = g_malloc0(sizeof(*dirtylimit_state));
>   
>       dirtylimit_state->states =
> -            g_malloc0(sizeof(VcpuDirtyLimitState) * max_cpus);
> +            g_new0(VcpuDirtyLimitState, max_cpus);
>   
>       for (i = 0; i < max_cpus; i++) {
>           dirtylimit_state->states[i].cpu_index = i;

Applied to my trivial-patches branch.

Thanks,
Laurent


