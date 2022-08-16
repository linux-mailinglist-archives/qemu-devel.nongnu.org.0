Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 956C75954CE
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 10:17:04 +0200 (CEST)
Received: from localhost ([::1]:38654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNrl1-00009k-3N
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 04:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oNrhD-0005rN-S7
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 04:13:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oNrhA-0001fh-0r
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 04:13:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660637582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EItjSoXk8C4Ntc086gI2M7/Kl3Lu2E9HRf4yWIaPPGs=;
 b=Gw5zJOPOAiEtBXQwk7RmdHxNDRB0jOg/qJ5kr4BfXY2soUMn66ei7ZbWUwVCfGyomhzk8+
 PvMEA/TZqsOvpiZIjQ2FhR1gccutXW7w0GkK8X6AtBBxB5s4RxLTY1L+wlvSr5ef+9n2Qm
 g5IFUWhAlcZ5RnrYle/tp6UmH6Lud+8=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-453-hRzTYGkUN76-BnmR2W5Nzg-1; Tue, 16 Aug 2022 04:13:01 -0400
X-MC-Unique: hRzTYGkUN76-BnmR2W5Nzg-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-117b96393f3so2298254fac.9
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 01:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=EItjSoXk8C4Ntc086gI2M7/Kl3Lu2E9HRf4yWIaPPGs=;
 b=jGpoGWKKJkzNpyt3c2kWNjIWPOm6ntt0Hw+z2faZvM1UG/5e0a+ZwB2ZZw4pIV4Snn
 GK+vLSYIj9aQkizLIPsgb6Rvy+JxIb7Ua2HGSzVTATSGs+dwFF6ZSGEf9lGiW3azaUrl
 HpxIyHQgUrGM0EuEz9WEJq6DyypNAvDqmux62vlwjbgrlm1M1o5TT4su2FTEjEZp8u6A
 GXsZB9bEcIPisYVk5oTHu2EFG14aUBP+65WRsx3ZCPfoO3yBWGILm8B8+lItUHiKipy3
 8ykRXbZCAk+78bQdbGQiMIcKXExBOt2IN31mMZd6Q5qdVGnhNq553ZkgQIf7F216oLlf
 yfvA==
X-Gm-Message-State: ACgBeo3MQYLRoHvlKEJrfyWk2r1ZiRoqp4YX9NX6NeL531H7Tg72V/2Y
 qWXN2mx5vfgpTPn4WuO/r1slTDMoWOqz2kBQadteAHLr181pl+tmbQt+TuGkn7FxzuVwRE+cq+G
 aJEWNH0AYVPahGa8TFd7hMGWfzwbcmPo=
X-Received: by 2002:a05:6808:219a:b0:344:e94a:ec43 with SMTP id
 be26-20020a056808219a00b00344e94aec43mr259713oib.205.1660637579939; 
 Tue, 16 Aug 2022 01:12:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7SJhGcFNvrKU8Pq0DdubmVUFOcfvKgGkKZ62+mMtUTFFr4kjwEvwIoA+M24a0zj73zuaJGtQllRaH35ydSKSQ=
X-Received: by 2002:a05:6808:219a:b0:344:e94a:ec43 with SMTP id
 be26-20020a056808219a00b00344e94aec43mr259704oib.205.1660637579710; Tue, 16
 Aug 2022 01:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220811121111.9878-1-frankja@linux.ibm.com>
 <20220811121111.9878-4-frankja@linux.ibm.com>
In-Reply-To: <20220811121111.9878-4-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 16 Aug 2022 12:12:48 +0400
Message-ID: <CAMxuvaxwEJS51on9+SvgyQAsC6chdiYSDLZy2qcL5xF18Vgxzg@mail.gmail.com>
Subject: Re: [PATCH v5 03/18] dump: Refactor dump_iterate and introduce
 dump_filter_memblock_*()
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com, 
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org, 
 seiden@linux.ibm.com, scgl@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, Aug 11, 2022 at 4:12 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:
>
> The iteration over the memblocks in dump_iterate() is hard to
> understand so it's about time to clean it up. Instead of manually
> grabbing the next memblock we can use QTAILQ_FOREACH to iterate over
> all memblocks.
>
> Additionally we move the calculation of the offset and length out by
> introducing and using the dump_filter_memblock_*() functions. These
> functions will later be used to cleanup other parts of dump.c.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  dump/dump.c | 80 ++++++++++++++++++++++++++++++-----------------------
>  1 file changed, 45 insertions(+), 35 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 0ed7cf9c7b..340de5a1e7 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -591,31 +591,43 @@ static void dump_begin(DumpState *s, Error **errp)
>      write_elf_notes(s, errp);
>  }
>
> -static int get_next_block(DumpState *s, GuestPhysBlock *block)
> +static int64_t dump_filtered_memblock_size(GuestPhysBlock *block,
> +                                           int64_t filter_area_start,
> +                                           int64_t filter_area_length)
>  {
> -    while (1) {
> -        block =3D QTAILQ_NEXT(block, next);
> -        if (!block) {
> -            /* no more block */
> -            return 1;
> -        }
> +    int64_t size, left, right;
>
> -        s->start =3D 0;
> -        s->next_block =3D block;
> -        if (s->has_filter) {
> -            if (block->target_start >=3D s->begin + s->length ||
> -                block->target_end <=3D s->begin) {
> -                /* This block is out of the range */
> -                continue;
> -            }
> -
> -            if (s->begin > block->target_start) {
> -                s->start =3D s->begin - block->target_start;
> -            }
> -        }
> -
> -        return 0;
> +    /* No filter, return full size */
> +    if (!filter_area_length) {
> +        return block->target_end - block->target_start;
>      }
> +
> +    /* calculate the overlapped region. */
> +    left =3D MAX(filter_area_start, block->target_start);
> +    right =3D MIN(filter_area_start + filter_area_length, block->target_=
end);
> +    size =3D right - left;
> +    size =3D size > 0 ? size : 0;
> +
> +    return size;
> +}
> +
> +static int64_t dump_filtered_memblock_start(GuestPhysBlock *block,
> +                                            int64_t filter_area_start,
> +                                            int64_t filter_area_length)
> +{
> +    if (filter_area_length) {
> +        /* return -1 if the block is not within filter area */
> +        if (block->target_start >=3D filter_area_start + filter_area_len=
gth ||
> +            block->target_end <=3D filter_area_start) {
> +            return -1;
> +        }
> +
> +        if (filter_area_start > block->target_start) {
> +            return filter_area_start - block->target_start;
> +        }
> +    }
> +
> +    return 0;
>  }
>
>  /* write all memory to vmcore */
> @@ -623,24 +635,22 @@ static void dump_iterate(DumpState *s, Error **errp=
)
>  {
>      ERRP_GUARD();
>      GuestPhysBlock *block;
> -    int64_t size;
> +    int64_t memblock_size, memblock_start;
>
> -    do {
> -        block =3D s->next_block;
> -
> -        size =3D block->target_end - block->target_start;
> -        if (s->has_filter) {
> -            size -=3D s->start;
> -            if (s->begin + s->length < block->target_end) {
> -                size -=3D block->target_end - (s->begin + s->length);
> -            }
> +    QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
> +        memblock_start =3D dump_filtered_memblock_start(block, s->begin,=
 s->length);
> +        if (memblock_start =3D=3D -1) {
> +            continue;
>          }
> -        write_memory(s, block, s->start, size, errp);
> +
> +        memblock_size =3D dump_filtered_memblock_size(block, s->begin, s=
->length);
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
> --
> 2.34.1
>


