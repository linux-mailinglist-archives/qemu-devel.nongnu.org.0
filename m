Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC29C6BD558
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 17:18:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcqIV-0005kV-3Z; Thu, 16 Mar 2023 12:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pcqIT-0005kN-I5
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 12:17:45 -0400
Received: from esa8.hc2706-39.iphmx.com ([216.71.140.196])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pcqIR-0005iT-9N
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 12:17:45 -0400
X-IronPort-RemoteIP: 209.85.222.197
X-IronPort-MID: 263314879
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:doSvRKlZh/XxPMQdkOINr8Do5gw5JERdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdDG2HPa2DZzDweth0aY/k9UpQu5CGzdU2SAds+SFjQi4T+ZvOCOrCEkqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tD5wJmOpingXeF/5UrJMNHTU2OByagKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0xK6aYD76vRxjnVaPpIACRYpQRw/ZwNlPjxG4
 I4lWZSYEW/FN0BX8QgXe0Aw/ypWZMWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eY84doNptXXty9
 vUjFTJUXz2Flsm46efuIgVsrpxLwMjDOYoevjR5zmicA693HtbMRKLF4dIe1zA17ixMNayGN
 oxJNHw1Nk6GOkwQUrsUIMtWcOOAj33vdTFCgFiI46c7/gA/ySQrjuO2aYaFJY3iqcN9knaio
 kvf83/CPhgQMp/G4gK81TGhv7qa9c/8cMdIfFGizdZzjViOg2AeFhASfV28p/a/lwi5Qd03F
 qAP0i8nrKx37U/yC9ekDkL+r3mDsRoRHdFXFoXW9T2w90Yd2C7BbkBsc9KLQId/7qfamRRCO
 oe1ou7U
IronPort-HdrOrdr: A9a23:9UYJiqxUgHsjsZ4nwXbEKrPxxOskLtp133Aq2lEZdPUMSL3+qy
 iv9M516faGskd2ZJhAo6HyBEDuewK+yXcY2+Qs1PKZLW3bUQiTXfNfBOnZsl/d8kTFn4Y3v5
 uIMZIObeEYZmIVsS+O2mmF+qEboeVvnprFuc7ui1NWCS16YaBp6Al0Ti6dD01NXQFDQbYpCZ
 aG4cJDhjy4PVAadN6yCHUpV/XK44SjruOTXTc2QzocrCWehzKh77D3VzCewxclSjtKhZsy7G
 TflAT9x6O799W20AXV2WP/54lf3PHh1txALsqRjdV9EESYti+YIKBaH5GStjE8p++irHwwls
 PXnhsmN8Nvr1vMY2Ccu3LWqn/d+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vet7zL
 lA0wuixtNq5FL77WzADurzJltXf3mP0DcfeCko/jBiuL4lGfRsREokjQxo+dk7bWzHAcscYZ
 BT5YnnlY5rmBWhHgfkVyBUsaeRd2V2ERGcTkcYvMuJlzBQgXBi1kMdgNcSh3Ea6fsGOul5Dk
 v/Q9tVfZx1P7ErhJhGdZY8qOeMexDwqEj3QRivyHzcZdw6B04=
Received: from mail-qk1-f197.google.com ([209.85.222.197])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Mar 2023 12:15:57 -0400
Received: by mail-qk1-f197.google.com with SMTP id
 b34-20020a05620a272200b007460c05a463so1212494qkp.1
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 09:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1678983356;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SVE1PPD7EzBGRXFR0PVepggdJMHHiFbWaf/4hjya/o4=;
 b=nKufSBHdC6/sECcvnv74gedZNkhcoVH16PiAJMCCrJgAYYRrcirYz1WFhtAN+Lwzji
 nfjv8UDBXgX/9aWyLDv5uGn3CHc5/UT1yIVxklFBX08anI2OhoI9OSJijyCBWdkVBhJZ
 acGXmKFEkGQXweRBVivQtEknpDhy3iwJA/2LlLa+xfsLBKXfojGNJSslQr6JxY3ez7QD
 gMUpuD45y0ZD1LBA+/hO/yyh9ONasejK+164FJq1R3BksNsk8U3kzvlA+k5le4x71lzO
 qfgzBWiUH06kD3il4YjOMlplbA8Hyeed4GkqKxzLgWAnVtlBf/XZKkvi2bm/sX7jahrY
 gIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678983356;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SVE1PPD7EzBGRXFR0PVepggdJMHHiFbWaf/4hjya/o4=;
 b=bgjaXP3DJsLF1yWB7T2LIcRQVU+YfDRKt4RE7/tL1lIaLAcfSCbpy1QD3z0K8B66c5
 jMDYk9NK1O/CcbpBXk7Fxw0CaQ2b8PsgJoBo5ZCRsxlNyQb694uK7s1QsxF2ZqbFG9m7
 iSCzN8tlp0gBQB9t3Q4kTTiOv5ZtqRXfYBizFqLconPsWyFkr0fGJHqbm2WBLu0KvF0h
 iZSAe8bfyUQtVFD6zh3j6MfySjSacNEXWo5Iusj6VJ0On5kU3iyXILlpysvIp2GWjtl3
 QHiELnPkPhLn48RkvtOkGYFOIj1rX61StqO87mEj8UlX7ramx97R5UU38YPsUGOveu4e
 KxCw==
X-Gm-Message-State: AO0yUKXL+hmGE5+v2wFQtg0LNA2kkPmM3FclD5wnPtRs+EhC0eWLbLLT
 uPi9p9t5/sWcvrh+jvVrY6FHGQ6wOZYyavv0qFiWpQ5mc6dpINxHyo2eb4qu4X+3VsG5c9IlbQe
 guazxH0+c+2vhvf3qD24ZgaHFHnjrAw==
X-Received: by 2002:a05:622a:4cd:b0:3bf:b973:3078 with SMTP id
 q13-20020a05622a04cd00b003bfb9733078mr6711867qtx.13.1678983356647; 
 Thu, 16 Mar 2023 09:15:56 -0700 (PDT)
X-Google-Smtp-Source: AK7set/nbG7hHYCF/2IziRwbURpRPzpO8w/e6dIp4d/jW4AfOct5zawy62PsjZ3ypSIx5ljAwRsHuw==
X-Received: by 2002:a05:622a:4cd:b0:3bf:b973:3078 with SMTP id
 q13-20020a05622a04cd00b003bfb9733078mr6711824qtx.13.1678983356307; 
 Thu, 16 Mar 2023 09:15:56 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a05622a100400b003b9bc00c2f1sm6020184qte.94.2023.03.16.09.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:15:55 -0700 (PDT)
Date: Thu, 16 Mar 2023 12:15:51 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH for 8.0 v2] memory: Prevent recursive memory access
Message-ID: <20230316161551.syvpnl5czkn4nbv2@mozz.bu.edu>
References: <20230316122430.10529-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316122430.10529-1-akihiko.odaki@daynix.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.196; envelope-from=alxndr@bu.edu;
 helo=esa8.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 230316 2124, Akihiko Odaki wrote:
> A guest may request ask a memory-mapped device to perform DMA. If the
> address specified for DMA is the device performing DMA, it will create
> recursion. It is very unlikely that device implementations are prepared
> for such an abnormal access, which can result in unpredictable behavior.
> 
> In particular, such a recursion breaks e1000e, a network device. If
> the device is configured to write the received packet to the register
> to trigger receiving, it triggers re-entry to the Rx logic of e1000e.
> This causes use-after-free since the Rx logic is not re-entrant.
> 
> As there should be no valid reason to perform recursive memory access,
> check for recursion before accessing memory-mapped device.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1543
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Hi Akihiko,
I think the spirit of this is similar to the fix I proposed here:
https://lore.kernel.org/qemu-devel/20230313082417.827484-1-alxndr@bu.edu/

My version also addresses the following case, which we have found
instances of:
Device Foo Bottom Half -> DMA write to Device Foo Memory Region

That said, the patch is held up on some corner cases and it seems it
will not make it into 8.0. I guess we can add #1543 to the list of
issues in https://gitlab.com/qemu-project/qemu/-/issues/556

Thanks
-Alex

> ---
>  softmmu/memory.c | 79 +++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 62 insertions(+), 17 deletions(-)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 4699ba55ec..19c60ee1f0 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -50,6 +50,10 @@ static QTAILQ_HEAD(, AddressSpace) address_spaces
>  
>  static GHashTable *flat_views;
>  
> +static const Object **accessed_region_owners;
> +static size_t accessed_region_owners_capacity;
> +static size_t accessed_region_owners_num;
> +
>  typedef struct AddrRange AddrRange;
>  
>  /*
> @@ -1394,6 +1398,16 @@ bool memory_region_access_valid(MemoryRegion *mr,
>          return false;
>      }
>  
> +    for (size_t i = 0; i < accessed_region_owners_num; i++) {
> +        if (accessed_region_owners[i] == mr->owner) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "Invalid %s at addr 0x%" HWADDR_PRIX
> +                          ", size %u, region '%s', reason: recursive access\n",
> +                          is_write ? "write" : "read",
> +                          addr, size, memory_region_name(mr));
> +            return false;
> +        }
> +    }
> +
>      /* Treat zero as compatibility all valid */
>      if (!mr->ops->valid.max_access_size) {
>          return true;
> @@ -1413,6 +1427,34 @@ bool memory_region_access_valid(MemoryRegion *mr,
>      return true;
>  }
>  
> +static bool memory_region_access_start(MemoryRegion *mr,
> +                                       hwaddr addr,
> +                                       unsigned size,
> +                                       bool is_write,
> +                                       MemTxAttrs attrs)
> +{
> +    if (!memory_region_access_valid(mr, addr, size, is_write, attrs)) {
> +        return false;
> +    }
> +
> +    accessed_region_owners_num++;
> +    if (accessed_region_owners_num > accessed_region_owners_capacity) {
> +        accessed_region_owners_capacity = accessed_region_owners_num;
> +        accessed_region_owners = g_realloc_n(accessed_region_owners,
> +                                             accessed_region_owners_capacity,
> +                                             sizeof(*accessed_region_owners));
> +    }
> +
> +    accessed_region_owners[accessed_region_owners_num - 1] = mr->owner;
> +
> +    return true;
> +}
> +
> +static void memory_region_access_end(void)
> +{
> +    accessed_region_owners_num--;
> +}
> +
>  static MemTxResult memory_region_dispatch_read1(MemoryRegion *mr,
>                                                  hwaddr addr,
>                                                  uint64_t *pval,
> @@ -1450,12 +1492,13 @@ MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
>                                             mr->alias_offset + addr,
>                                             pval, op, attrs);
>      }
> -    if (!memory_region_access_valid(mr, addr, size, false, attrs)) {
> +    if (!memory_region_access_start(mr, addr, size, false, attrs)) {
>          *pval = unassigned_mem_read(mr, addr, size);
>          return MEMTX_DECODE_ERROR;
>      }
>  
>      r = memory_region_dispatch_read1(mr, addr, pval, size, attrs);
> +    memory_region_access_end();
>      adjust_endianness(mr, pval, op);
>      return r;
>  }
> @@ -1493,13 +1536,14 @@ MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
>                                           MemTxAttrs attrs)
>  {
>      unsigned size = memop_size(op);
> +    MemTxResult result;
>  
>      if (mr->alias) {
>          return memory_region_dispatch_write(mr->alias,
>                                              mr->alias_offset + addr,
>                                              data, op, attrs);
>      }
> -    if (!memory_region_access_valid(mr, addr, size, true, attrs)) {
> +    if (!memory_region_access_start(mr, addr, size, true, attrs)) {
>          unassigned_mem_write(mr, addr, data, size);
>          return MEMTX_DECODE_ERROR;
>      }
> @@ -1508,23 +1552,24 @@ MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
>  
>      if ((!kvm_eventfds_enabled()) &&
>          memory_region_dispatch_write_eventfds(mr, addr, data, size, attrs)) {
> -        return MEMTX_OK;
> -    }
> -
> -    if (mr->ops->write) {
> -        return access_with_adjusted_size(addr, &data, size,
> -                                         mr->ops->impl.min_access_size,
> -                                         mr->ops->impl.max_access_size,
> -                                         memory_region_write_accessor, mr,
> -                                         attrs);
> +        result = MEMTX_OK;
> +    } else if (mr->ops->write) {
> +        result = access_with_adjusted_size(addr, &data, size,
> +                                           mr->ops->impl.min_access_size,
> +                                           mr->ops->impl.max_access_size,
> +                                           memory_region_write_accessor, mr,
> +                                           attrs);
>      } else {
> -        return
> -            access_with_adjusted_size(addr, &data, size,
> -                                      mr->ops->impl.min_access_size,
> -                                      mr->ops->impl.max_access_size,
> -                                      memory_region_write_with_attrs_accessor,
> -                                      mr, attrs);
> +        result = access_with_adjusted_size(addr, &data, size,
> +                                           mr->ops->impl.min_access_size,
> +                                           mr->ops->impl.max_access_size,
> +                                           memory_region_write_with_attrs_accessor,
> +                                           mr, attrs);
>      }
> +
> +    memory_region_access_end();
> +
> +    return result;
>  }
>  
>  void memory_region_init_io(MemoryRegion *mr,
> -- 
> 2.39.2
> 

