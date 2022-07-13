Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FA7573AFD
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 18:17:32 +0200 (CEST)
Received: from localhost ([::1]:33250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBf3K-0002Gs-QN
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 12:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oBepD-0002fO-47
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 12:02:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oBep5-0003PS-OL
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 12:02:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657728167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sZcJIXWUqPV0PV1ZM8E6mPZxLR+z5J+Xdv40q/sUFAA=;
 b=RB9QluVrL+Erm5jpxu/K0aizpecS/1bpp2lCao8mPI2jaEHYx4N1p2Ay0aC8tpFC1lX79a
 7CkReoaXhW+DJh89aJ1fSv+75+ThfRwPp15xy1ijl5EuakVd9/+d0wkTzGG5BPeAXvtc7D
 kvgp6ytzldpkyY35ma4UK5a0VTKlxzc=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-nQZ0DspZPaO4eo5pTZ1YoQ-1; Wed, 13 Jul 2022 12:02:45 -0400
X-MC-Unique: nQZ0DspZPaO4eo5pTZ1YoQ-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-10c4f6fd1b6so6147424fac.22
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 09:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sZcJIXWUqPV0PV1ZM8E6mPZxLR+z5J+Xdv40q/sUFAA=;
 b=GRUks0DC3MXvgbxv8Q4XkoTpPaqwjm26kMelkfnvCed5qUvQKACBV7i1kgCmrYdSJh
 HgJR9iayJzx1i6GlYIlW8WbB4pRk3aDI2lgsqmVBVRDKME7BvXKrvr72gu/9qt1A4RXg
 WA1oQb+IW6TegvSq56MYFWMzKFWWaVEImx7mHhFFFrHyUet6+ACnmfRciS+eo5Nm9VVq
 T6P/OndgajC+uyP+nV24ZEBac3BprowaohoiKWZPeYnP7AfjvLUZ6RXO/0IR4nJtQm9Q
 ieA5urdf/ogPMyRefd/9tmzPy/O8qXngXlCVdvPp8Wcv6ovX3iXKFLa1JHxV9K8dFxuQ
 s2SA==
X-Gm-Message-State: AJIora8YaZn5dBHGJ03Rb28Ny8nE2DsRUZnLXwc+LYEdziNpge/NCpbT
 wd1dJypHVG1jt42Uo9yifs15C5gJfHSNLsYu4cEc7swyET4Da5ZW0Y7lggiw5hyqW7AAxs6rjbR
 Cz6OLRWFcP/8O9yKeJkcA4Whr8u7Dvp0=
X-Received: by 2002:a05:6870:f627:b0:10c:9be9:5306 with SMTP id
 ek39-20020a056870f62700b0010c9be95306mr5039505oab.205.1657728164995; 
 Wed, 13 Jul 2022 09:02:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uhTDOXNXtpy24ByLbF29c6Blvj3tfZ/u/e3K2MqD/fxoAVPDbsSPTrUpJUDT0of6S5ehXmJLsGCVCsn9MmJew=
X-Received: by 2002:a05:6870:f627:b0:10c:9be9:5306 with SMTP id
 ek39-20020a056870f62700b0010c9be95306mr5039486oab.205.1657728164742; Wed, 13
 Jul 2022 09:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220713130322.25517-1-frankja@linux.ibm.com>
 <20220713130322.25517-7-frankja@linux.ibm.com>
In-Reply-To: <20220713130322.25517-7-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 13 Jul 2022 20:02:34 +0400
Message-ID: <CAMxuvax9qSs96hq=RGCR2wxdJ7-Nj2nd748pbSj3fq3KTZA4Kw@mail.gmail.com>
Subject: Re: [PATCH v2 06/11] dump/dump: Add arch section support
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo" <pbonzini@redhat.com>,
 mhartmay@linux.ibm.com, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, imbrenda@linux.ibm.com, 
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, "Henderson,
 Richard" <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Hi

On Wed, Jul 13, 2022 at 5:07 PM Janosch Frank <frankja@linux.ibm.com> wrote:
>
> Add hooks which architectures can use to add arbitrary data to custom
> sections.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  dump/dump.c                | 21 ++++++++++++++++++---
>  include/sysemu/dump-arch.h | 27 +++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+), 3 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 31e2a85372..02de00b6de 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -400,6 +400,7 @@ static void prepare_elf_section_hdrs(DumpState *s)
>      /*
>       * Section ordering:
>       * - HDR zero (if needed)
> +     * - Arch section hdrs
>       * - String table hdr
>       */
>      sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
> @@ -417,6 +418,9 @@ static void prepare_elf_section_hdrs(DumpState *s)
>          return;
>      }
>
> +    size = dump_arch_sections_write_hdr(&s->dump_info, s, buff_hdr);
> +    buff_hdr += size;
> +
>      /*
>       * String table needs to be last section since strings are added
>       * via arch_sections_write_hdr().
> @@ -567,14 +571,23 @@ static void get_offset_range(hwaddr phys_addr,
>      }
>  }
>
> -static void write_elf_loads(DumpState *s, Error **errp)
> +static void write_elf_phdr_loads(DumpState *s, Error **errp)
>  {
>      ERRP_GUARD();
>      hwaddr offset, filesz;
>      MemoryMapping *memory_mapping;
>      uint32_t phdr_index = 1;
> +    hwaddr min = 0, max = 0;
>
>      QTAILQ_FOREACH(memory_mapping, &s->list.head, next) {
> +        if (memory_mapping->phys_addr < min) {
> +            min = memory_mapping->phys_addr;
> +        }
> +        if (memory_mapping->phys_addr + memory_mapping->length > max) {
> +            max = memory_mapping->phys_addr + memory_mapping->length;
> +        }
> +
> +

Extra line & this belongs to a different patch.

>          get_offset_range(memory_mapping->phys_addr,
>                           memory_mapping->length,
>                           s, &offset, &filesz);
> @@ -682,8 +695,8 @@ static void dump_begin(DumpState *s, Error **errp)
>          return;
>      }
>
> -    /* write all PT_LOAD to vmcore */
> -    write_elf_loads(s, errp);
> +    /* write all PT_LOADs to vmcore */
> +    write_elf_phdr_loads(s, errp);
>      if (*errp) {
>          return;
>      }
> @@ -723,6 +736,7 @@ static void dump_end(DumpState *s, Error **errp)
>          return;
>      }
>      s->elf_section_data = g_malloc0(s->elf_section_data_size);
> +    dump_arch_sections_write(&s->dump_info, s, s->elf_section_data);
>
>      /* write sections to vmcore */
>      write_elf_sections(s, errp);
> @@ -1894,6 +1908,7 @@ static void dump_init(DumpState *s, int fd, bool has_format,
>       * If phdr_num overflowed we have at least one section header
>       * More sections/hdrs can be added by the architectures
>       */
> +    dump_arch_sections_add(&s->dump_info, (void *)s);
>      if (s->shdr_num > 1) {
>          /* Reserve the string table */
>          s->shdr_num += 1;
> diff --git a/include/sysemu/dump-arch.h b/include/sysemu/dump-arch.h
> index e25b02e990..de77908424 100644
> --- a/include/sysemu/dump-arch.h
> +++ b/include/sysemu/dump-arch.h
> @@ -21,6 +21,9 @@ typedef struct ArchDumpInfo {
>      uint32_t page_size;      /* The target's page size. If it's variable and
>                                * unknown, then this should be the maximum. */
>      uint64_t phys_base;      /* The target's physmem base. */
> +    void (*arch_sections_add_fn)(void *opaque);
> +    uint64_t (*arch_sections_write_hdr_fn)(void *opaque, uint8_t *buff);
> +    void (*arch_sections_write_fn)(void *opaque, uint8_t *buff);
>  } ArchDumpInfo;
>
>  struct GuestPhysBlockList; /* memory_mapping.h */
> @@ -28,4 +31,28 @@ int cpu_get_dump_info(ArchDumpInfo *info,
>                        const struct GuestPhysBlockList *guest_phys_blocks);
>  ssize_t cpu_get_note_size(int class, int machine, int nr_cpus);
>
> +static inline void dump_arch_sections_add(ArchDumpInfo *info, void *opaque)
> +{
> +    if (info->arch_sections_add_fn) {
> +        info->arch_sections_add_fn(opaque);
> +    }
> +}
> +
> +static inline uint64_t dump_arch_sections_write_hdr(ArchDumpInfo *info,
> +                                                void *opaque, uint8_t *buff)
> +{
> +    if (info->arch_sections_write_hdr_fn) {
> +        return info->arch_sections_write_hdr_fn(opaque, buff);
> +    }
> +    return 0;
> +}
> +
> +static inline void dump_arch_sections_write(ArchDumpInfo *info, void *opaque,
> +                                            uint8_t *buff)
> +{
> +    if (info->arch_sections_write_fn) {
> +        info->arch_sections_write_fn(opaque, buff);
> +    }
> +}
> +
>  #endif
> --
> 2.34.1
>

otherwise, seems ok to me


