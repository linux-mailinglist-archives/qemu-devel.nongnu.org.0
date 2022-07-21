Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FA457CDD2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 16:38:11 +0200 (CEST)
Received: from localhost ([::1]:32890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEXJZ-0007U0-Ku
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 10:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oEXII-0004wY-N5
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 10:36:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oEXIF-0002B5-MG
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 10:36:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658414206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zUDTZPSV54VbaX6QFQZ4yO5D7e2Ao8riOjtpPh4WGvo=;
 b=HRHLaAPlKC7rNIuiNW1+mepw3ZnHwwnxGca44bh4Rso1Xodsa6w0XQOyYbqYc7NyXPIH4j
 M5BSrlYKUeRlKvI/pMp8KenpUvEbaZxw7ZgGy0ICK5lOEukIWpuCRskQTyXC6I0rMT4bDR
 PDeh/VJsmC4F0MH6rvLNsEFOrJVKQjM=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-JkDOLzOaNRCZ5EquVsl6wQ-1; Thu, 21 Jul 2022 10:36:45 -0400
X-MC-Unique: JkDOLzOaNRCZ5EquVsl6wQ-1
Received: by mail-ot1-f69.google.com with SMTP id
 bh7-20020a056830380700b00618fa36228fso861432otb.7
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 07:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zUDTZPSV54VbaX6QFQZ4yO5D7e2Ao8riOjtpPh4WGvo=;
 b=SGyRlwlfNTJ1ifWxtztKLn1mywbHA5h6LgjbB1Lc71dbD91wRAfU7HkDVgp5Q1wnWk
 l6GzeiSo8q/KSPO7VmDQOkTOG7kqwWHsgIyw9SaL6qiczl+0gSl18kQkJy21wAySaBUy
 q+3a6Dx7dRMsgmLN8KL+b38CAU77ue22iBlfiOiM5gshO1mzSdT4o7q0a04Q16GoA2yG
 JJSEGCOBEpM9u6GNtZyALrsH87NAneiK9J1+X5nGWl+xHscZocK2OFFZu4AO5QZIcNom
 NlwlFlSU7fPwdpajyMQmChU+2vNzaGn4w2VWteY3L8RkvKfPIGFYwNlpsw2SbSWV0hPG
 /v7A==
X-Gm-Message-State: AJIora9fwEYMfGQsnwyX49ghXom3wNwecwUqtZGqIIR92Y1gBmOP91KA
 ITkrDkTlxWXKl5WwyLaSSw51TAtTItRWglFhn8U+5hyciJJ7EYkDE/V7Tg5p3uV75Lu0UIVBBXu
 C2A2EJ/5tHpA2hfBbbQY4z5yadsA23jY=
X-Received: by 2002:a05:6808:23d4:b0:337:e764:90eb with SMTP id
 bq20-20020a05680823d400b00337e76490ebmr4931398oib.205.1658414204331; 
 Thu, 21 Jul 2022 07:36:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s771jy5L62U2/T+GNA3RcfH1JgVKd29Omz3LqesnlqFnTcPp3lHq5GdGawKolAAovLsZ+OVtkvsjj/npOv1JE=
X-Received: by 2002:a05:6808:23d4:b0:337:e764:90eb with SMTP id
 bq20-20020a05680823d400b00337e76490ebmr4931384oib.205.1658414204067; Thu, 21
 Jul 2022 07:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220721132256.2171-1-frankja@linux.ibm.com>
 <20220721132256.2171-4-frankja@linux.ibm.com>
In-Reply-To: <20220721132256.2171-4-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 21 Jul 2022 18:36:32 +0400
Message-ID: <CAMxuvaya0AiW1yvSab_jynHNn+=w2LZhGdgnm6OY6UwSf24YZA@mail.gmail.com>
Subject: Re: [PATCH v3 03/14] dump: Convert GuestPhysBlock iterators and use
 the filter functions
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo" <pbonzini@redhat.com>,
 mhartmay@linux.ibm.com, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, imbrenda@linux.ibm.com, 
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, seiden@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Jul 21, 2022 at 5:23 PM Janosch Frank <frankja@linux.ibm.com> wrote:
>
> The iteration over the memblocks is hard to understand so it's about
> time to clean it up. Instead of manually grabbing the next memblock we
> can use QTAILQ_FOREACH to iterate over all memblocks.
>
> Additionally we move the calculation of the offset and length out by
> using the dump_get_memblock_*() functions.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  dump/dump.c           | 91 +++++++++++--------------------------------
>  include/sysemu/dump.h |  9 ++---
>  2 files changed, 27 insertions(+), 73 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 0ed7cf9c7b..5c9ed25c5a 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -591,56 +591,27 @@ static void dump_begin(DumpState *s, Error **errp)
>      write_elf_notes(s, errp);
>  }
>
> -static int get_next_block(DumpState *s, GuestPhysBlock *block)
> -{
> -    while (1) {
> -        block = QTAILQ_NEXT(block, next);
> -        if (!block) {
> -            /* no more block */
> -            return 1;
> -        }
> -
> -        s->start = 0;
> -        s->next_block = block;
> -        if (s->has_filter) {
> -            if (block->target_start >= s->begin + s->length ||
> -                block->target_end <= s->begin) {
> -                /* This block is out of the range */
> -                continue;
> -            }
> -
> -            if (s->begin > block->target_start) {
> -                s->start = s->begin - block->target_start;
> -            }
> -        }
> -
> -        return 0;
> -    }
> -}
> -
>  /* write all memory to vmcore */
>  static void dump_iterate(DumpState *s, Error **errp)
>  {
>      ERRP_GUARD();
>      GuestPhysBlock *block;
> -    int64_t size;
> +    int64_t memblock_size, memblock_start;
>
> -    do {
> -        block = s->next_block;
> -
> -        size = block->target_end - block->target_start;
> -        if (s->has_filter) {
> -            size -= s->start;
> -            if (s->begin + s->length < block->target_end) {
> -                size -= block->target_end - (s->begin + s->length);
> -            }
> +    QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
> +        memblock_start = dump_get_memblock_start(block, s->begin, s->length);
> +        if (memblock_start == -1) {
> +            continue;
>          }
> -        write_memory(s, block, s->start, size, errp);
> +
> +        memblock_size = dump_get_memblock_size(block, s->begin, s->length);
> +
> +        /* Write the memory to file */
> +        write_memory(s, block, memblock_start, memblock_size, errp);
>          if (*errp) {
>              return;
>          }
> -
> -    } while (!get_next_block(s, block));
> +    }
>  }
>
>  static void create_vmcore(DumpState *s, Error **errp)
> @@ -1490,30 +1461,22 @@ static void create_kdump_vmcore(DumpState *s, Error **errp)
>      }
>  }
>
> -static ram_addr_t get_start_block(DumpState *s)
> +static int validate_start_block(DumpState *s)
>  {
>      GuestPhysBlock *block;
>
>      if (!s->has_filter) {
> -        s->next_block = QTAILQ_FIRST(&s->guest_phys_blocks.head);
>          return 0;
>      }
>
>      QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
> +        /* This block is out of the range */
>          if (block->target_start >= s->begin + s->length ||
>              block->target_end <= s->begin) {
> -            /* This block is out of the range */
>              continue;
>          }
> -
> -        s->next_block = block;
> -        if (s->begin > block->target_start) {
> -            s->start = s->begin - block->target_start;
> -        } else {
> -            s->start = 0;
> -        }
> -        return s->start;
> -    }
> +        return 0;
> +   }
>
>      return -1;
>  }
> @@ -1540,25 +1503,17 @@ bool qemu_system_dump_in_progress(void)
>      return (qatomic_read(&state->status) == DUMP_STATUS_ACTIVE);
>  }
>
> -/* calculate total size of memory to be dumped (taking filter into
> - * acoount.) */
> +/*
> + * calculate total size of memory to be dumped (taking filter into
> + * account.)
> + */
>  static int64_t dump_calculate_size(DumpState *s)
>  {
>      GuestPhysBlock *block;
> -    int64_t size = 0, total = 0, left = 0, right = 0;
> +    int64_t total = 0;
>
>      QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
> -        if (s->has_filter) {
> -            /* calculate the overlapped region. */
> -            left = MAX(s->begin, block->target_start);
> -            right = MIN(s->begin + s->length, block->target_end);
> -            size = right - left;
> -            size = size > 0 ? size : 0;
> -        } else {
> -            /* count the whole region in */
> -            size = (block->target_end - block->target_start);
> -        }
> -        total += size;
> +        total += dump_get_memblock_size(block, s->begin, s->length);
>      }
>
>      return total;
> @@ -1660,8 +1615,8 @@ static void dump_init(DumpState *s, int fd, bool has_format,
>          goto cleanup;
>      }
>
> -    s->start = get_start_block(s);
> -    if (s->start == -1) {
> +    /* Is the filter filtering everything? */
> +    if (validate_start_block(s) == -1) {
>          error_setg(errp, QERR_INVALID_PARAMETER, "begin");
>          goto cleanup;
>      }
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index 2b39abeeae..7025e50682 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -166,11 +166,10 @@ typedef struct DumpState {
>      hwaddr memory_offset;
>      int fd;
>
> -    GuestPhysBlock *next_block;
> -    ram_addr_t start;
> -    bool has_filter;
> -    int64_t begin;
> -    int64_t length;
> +    /* Guest memory related data */
> +    bool has_filter;           /* Are we dumping parts of the memory? */
> +    int64_t begin;             /* Start address of the chunk we want to dump */
> +    int64_t length;            /* Length of the dump we want to dump */
>
>      uint8_t *note_buf;          /* buffer for notes */
>      size_t note_buf_offset;     /* the writing place in note_buf */
> --
> 2.34.1
>

My suggestion in v2 review was to introduce each function &
refactoring independently, if possible. And it looks like the
validate_start_block() change could be a 3rd patch too.


