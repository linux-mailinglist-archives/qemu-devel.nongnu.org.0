Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0548939CABB
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 21:27:56 +0200 (CEST)
Received: from localhost ([::1]:34478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpbxb-0004vC-2u
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 15:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpbwr-00045R-FD; Sat, 05 Jun 2021 15:27:09 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:55803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpbwp-0006ka-Jz; Sat, 05 Jun 2021 15:27:09 -0400
Received: from [192.168.100.1] ([82.142.12.38]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MAwTn-1leMSd2293-00BKXA; Sat, 05 Jun 2021 21:26:54 +0200
Subject: Re: [PATCH] memory: Display MemoryRegion name in read/write ops trace
 events
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210307074833.143106-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <a485b223-9d6b-eb88-1c42-c47209d64b1d@vivier.eu>
Date: Sat, 5 Jun 2021 21:26:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210307074833.143106-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nGNZ/n1YkRlsvBmxQT3belgKcuqEU9ghXeXF14XR4WC/CvYWMUI
 3/7w/Qk2Wtk8lcDnvWXxwl036ViYi2J4ptL976aRDN6dgc/3vPSiTBA3q7dloQNYEUuoOo9
 ODzCJ/Ac6c9swm8wenXkifS//pLXSjRP1XBrP1+ceV728OWyw+Sl+YL3Bm3B4EGZXhED17A
 YH96KY+SqDLA2fl412meg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eOUy4Q2W/Ng=:tOeZVRI/pjOuP9g0V/gPy1
 lzOCDvICD8/XxJXLBVPRJO3mf90lQuSYWvMBglZN42TWraBvBMX2wy43+GPCcNzp4/kYigu59
 GE/BqkNMnGm75qPi5jqwymLFiiJE3zKTjDzyaIenPlD+kjPMH9VU1J5esli5gLO8mfP2pMqCr
 7NtAOk1haYT0pn3UoFYOFXTLZVbc74Aft+RP1DwbzI4nqbjdzPdfmcnpnWcbplz5zetktCQn/
 BlqDBWOdivVSPQgCjGpsSPoXcvaxRMurcATf2v2lp+po/2tViH75EMilcBus+0oBEyUXeogsK
 o19RAGh+Oxks4lj4wKxYd3N/mZTlkUrLjdBI+AS2mjsGHOJsW8pL6AFBvW0N5wB1kB+C1edV3
 h+1YNrHzgsFS6lTIpFGO0jXQnjYfKm7okMtaNNcqOEUCqk9QCWCag9xyHVvozRap2BlmMsUFa
 Oy/kJLRZu4QqnXAkQGybo3NwddaJLTTGoUCnwKZjMLMW6hWZarcCI5Wq2uJiD1rUzNChlAtuw
 HFDFIEDLUSl4Z48ngldSo4=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.59,
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 07/03/2021 à 08:48, Philippe Mathieu-Daudé a écrit :
> MemoryRegion names is cached on first call to memory_region_name(),
> so displaying the name is trace events is cheap. Add it for read /
> write ops.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  softmmu/memory.c     | 12 ++++++++----
>  softmmu/trace-events |  4 ++--
>  2 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 874a8fccdee..d4d9ab8828e 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -444,7 +444,8 @@ static MemTxResult  memory_region_read_accessor(MemoryRegion *mr,
>          trace_memory_region_subpage_read(get_cpu_index(), mr, addr, tmp, size);
>      } else if (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_READ)) {
>          hwaddr abs_addr = memory_region_to_absolute_addr(mr, addr);
> -        trace_memory_region_ops_read(get_cpu_index(), mr, abs_addr, tmp, size);
> +        trace_memory_region_ops_read(get_cpu_index(), mr, abs_addr, tmp, size,
> +                                     memory_region_name(mr));
>      }
>      memory_region_shift_read_access(value, shift, mask, tmp);
>      return MEMTX_OK;
> @@ -466,7 +467,8 @@ static MemTxResult memory_region_read_with_attrs_accessor(MemoryRegion *mr,
>          trace_memory_region_subpage_read(get_cpu_index(), mr, addr, tmp, size);
>      } else if (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_READ)) {
>          hwaddr abs_addr = memory_region_to_absolute_addr(mr, addr);
> -        trace_memory_region_ops_read(get_cpu_index(), mr, abs_addr, tmp, size);
> +        trace_memory_region_ops_read(get_cpu_index(), mr, abs_addr, tmp, size,
> +                                     memory_region_name(mr));
>      }
>      memory_region_shift_read_access(value, shift, mask, tmp);
>      return r;
> @@ -486,7 +488,8 @@ static MemTxResult memory_region_write_accessor(MemoryRegion *mr,
>          trace_memory_region_subpage_write(get_cpu_index(), mr, addr, tmp, size);
>      } else if (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_WRITE)) {
>          hwaddr abs_addr = memory_region_to_absolute_addr(mr, addr);
> -        trace_memory_region_ops_write(get_cpu_index(), mr, abs_addr, tmp, size);
> +        trace_memory_region_ops_write(get_cpu_index(), mr, abs_addr, tmp, size,
> +                                      memory_region_name(mr));
>      }
>      mr->ops->write(mr->opaque, addr, tmp, size);
>      return MEMTX_OK;
> @@ -506,7 +509,8 @@ static MemTxResult memory_region_write_with_attrs_accessor(MemoryRegion *mr,
>          trace_memory_region_subpage_write(get_cpu_index(), mr, addr, tmp, size);
>      } else if (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_WRITE)) {
>          hwaddr abs_addr = memory_region_to_absolute_addr(mr, addr);
> -        trace_memory_region_ops_write(get_cpu_index(), mr, abs_addr, tmp, size);
> +        trace_memory_region_ops_write(get_cpu_index(), mr, abs_addr, tmp, size,
> +                                      memory_region_name(mr));
>      }
>      return mr->ops->write_with_attrs(mr->opaque, addr, tmp, size, attrs);
>  }
> diff --git a/softmmu/trace-events b/softmmu/trace-events
> index b80ca042e1f..359fb37cc8d 100644
> --- a/softmmu/trace-events
> +++ b/softmmu/trace-events
> @@ -9,8 +9,8 @@ cpu_in(unsigned int addr, char size, unsigned int val) "addr 0x%x(%c) value %u"
>  cpu_out(unsigned int addr, char size, unsigned int val) "addr 0x%x(%c) value %u"
>  
>  # memory.c
> -memory_region_ops_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
> -memory_region_ops_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
> +memory_region_ops_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size, const char *name) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u name '%s'"
> +memory_region_ops_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size, const char *name) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u name '%s'"
>  memory_region_subpage_read(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
>  memory_region_subpage_write(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
>  memory_region_ram_device_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

