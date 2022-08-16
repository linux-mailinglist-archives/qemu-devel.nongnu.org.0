Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CFF5954E6
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 10:22:19 +0200 (CEST)
Received: from localhost ([::1]:54220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNrq6-0002Ar-92
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 04:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oNro2-0000TH-CO
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 04:20:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oNrnz-0002my-Fl
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 04:20:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660638006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pTHkSm11hSzUwjMiQILNKsU64TvseEbGX3eMx5Vv8WA=;
 b=HBsBL+CCacitMK5EmBom/TzzDh4EGcu6rCsY/AofsoLv2xhHX6DzItgKSP00XraicyaWiB
 gC/6b/J4BG9VQjO3nd+VYClvTESmvXRAAelDVxonM6+ez8hNx6JRK/kBM41aNkaMqQjFDY
 y3LjdxQwWUkolDzfnqGe2xb3VbHctjU=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-625-uDx7hXKaPNGngZAnEgvKGA-1; Tue, 16 Aug 2022 04:20:03 -0400
X-MC-Unique: uDx7hXKaPNGngZAnEgvKGA-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-116c235fda1so2305964fac.4
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 01:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=pTHkSm11hSzUwjMiQILNKsU64TvseEbGX3eMx5Vv8WA=;
 b=hKA/TEtW6k3W++v331a42gFXdK8uBLQYDXDkm0088oDaFwPnFacT9ijJeLh1Kl6ztr
 7Qdm2T/WM8Ghr4MDlR+5zWYDcQGXXlEx9NvHELgEKuZ6XdMGJNeU6FpkZH6gON2iGjqz
 6+raPEYdgV7mSSmTMqtUGDQh5/7jw0PHdFfbXqtsiKlG6Mi8YR/qb5UhxE0ORPq3fGFP
 7CU+RwiQ0z5H9Q8/xtZoZhfRq48VJKxOV1oJWTRZ9FKv7ls7zqKFieYP5LhZLl89lsEu
 XXbwu5U8xH1HJVbf3/LXU1Z0bnhgwGQVWK9CSCmiriUTw8i8tXSRtAzkeaUEmcP+NI2t
 j3qQ==
X-Gm-Message-State: ACgBeo32gqWnbXQ9u4wn1C+5ZMzqvkrL8iNEshea7cthNRb87d3hXKAS
 oqnljHbeRlk2/fjeBj2ozph/Z4mNGZoLfjouZjp+8A6so7gB6PPYMccGNG12hFJMufHUN15CYvk
 SrG22yOD8QSqfdq4NfQVwY50ZDbW539w=
X-Received: by 2002:a05:6870:65a7:b0:10e:d8ab:dd79 with SMTP id
 fp39-20020a05687065a700b0010ed8abdd79mr8705611oab.53.1660638002642; 
 Tue, 16 Aug 2022 01:20:02 -0700 (PDT)
X-Google-Smtp-Source: AA6agR45ovD5hsYXQQsrQ8lpdzLI0p5FFKfon0rNH7ebQGQJH5x/0HrPstKvGn+nVVkFf5cD2SIMifTt5MPPxLqeCXg=
X-Received: by 2002:a05:6870:65a7:b0:10e:d8ab:dd79 with SMTP id
 fp39-20020a05687065a700b0010ed8abdd79mr8705595oab.53.1660638002389; Tue, 16
 Aug 2022 01:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220811121111.9878-1-frankja@linux.ibm.com>
 <20220811121111.9878-6-frankja@linux.ibm.com>
In-Reply-To: <20220811121111.9878-6-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 16 Aug 2022 12:19:51 +0400
Message-ID: <CAMxuvazNvJpFQmswn0AK7jPWa0C8-7j_NOR0Nw+wK9dFGFMh-Q@mail.gmail.com>
Subject: Re: [PATCH v5 05/18] dump: Rework filter area variables
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

Hi

On Thu, Aug 11, 2022 at 4:12 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:
>
> While the DumpState begin and length variables directly mirror the API
> variable names they are not very descriptive. So let's add a
> "filter_area_" prefix and make has_filter a function checking length > 0.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  dump/dump.c           | 53 +++++++++++++++++++++++++------------------
>  include/sysemu/dump.h | 13 ++++++++---
>  2 files changed, 41 insertions(+), 25 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index e204912a89..b043337bc7 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -59,6 +59,11 @@ static inline bool dump_is_64bit(DumpState *s)
>      return s->dump_info.d_class =3D=3D ELFCLASS64;
>  }
>
> +static inline bool dump_has_filter(DumpState *s)

I'd drop the inline, and let the compiler decide.


Otherwise:
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> +{
> +    return s->filter_area_length > 0;
> +}
> +
>  uint16_t cpu_to_dump16(DumpState *s, uint16_t val)
>  {
>      if (s->dump_info.d_endian =3D=3D ELFDATA2LSB) {
> @@ -443,29 +448,30 @@ static void get_offset_range(hwaddr phys_addr,
>      *p_offset =3D -1;
>      *p_filesz =3D 0;
>
> -    if (s->has_filter) {
> -        if (phys_addr < s->begin || phys_addr >=3D s->begin + s->length)=
 {
> +    if (dump_has_filter(s)) {
> +        if (phys_addr < s->filter_area_begin ||
> +            phys_addr >=3D s->filter_area_begin + s->filter_area_length)=
 {
>              return;
>          }
>      }
>
>      QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
> -        if (s->has_filter) {
> -            if (block->target_start >=3D s->begin + s->length ||
> -                block->target_end <=3D s->begin) {
> +        if (dump_has_filter(s)) {
> +            if (block->target_start >=3D s->filter_area_begin + s->filte=
r_area_length ||
> +                block->target_end <=3D s->filter_area_begin) {
>                  /* This block is out of the range */
>                  continue;
>              }
>
> -            if (s->begin <=3D block->target_start) {
> +            if (s->filter_area_begin <=3D block->target_start) {
>                  start =3D block->target_start;
>              } else {
> -                start =3D s->begin;
> +                start =3D s->filter_area_begin;
>              }
>
>              size_in_block =3D block->target_end - start;
> -            if (s->begin + s->length < block->target_end) {
> -                size_in_block -=3D block->target_end - (s->begin + s->le=
ngth);
> +            if (s->filter_area_begin + s->filter_area_length < block->ta=
rget_end) {
> +                size_in_block -=3D block->target_end - (s->filter_area_b=
egin + s->filter_area_length);
>              }
>          } else {
>              start =3D block->target_start;
> @@ -638,12 +644,12 @@ static void dump_iterate(DumpState *s, Error **errp=
)
>      int64_t memblock_size, memblock_start;
>
>      QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
> -        memblock_start =3D dump_filtered_memblock_start(block, s->begin,=
 s->length);
> +        memblock_start =3D dump_filtered_memblock_start(block, s->filter=
_area_begin, s->filter_area_length);
>          if (memblock_start =3D=3D -1) {
>              continue;
>          }
>
> -        memblock_size =3D dump_filtered_memblock_size(block, s->begin, s=
->length);
> +        memblock_size =3D dump_filtered_memblock_size(block, s->filter_a=
rea_begin, s->filter_area_length);
>
>          /* Write the memory to file */
>          write_memory(s, block, memblock_start, memblock_size, errp);
> @@ -1504,14 +1510,14 @@ static int validate_start_block(DumpState *s)
>  {
>      GuestPhysBlock *block;
>
> -    if (!s->has_filter) {
> +    if (!dump_has_filter(s)) {
>          return 0;
>      }
>
>      QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
>          /* This block is out of the range */
> -        if (block->target_start >=3D s->begin + s->length ||
> -            block->target_end <=3D s->begin) {
> +        if (block->target_start >=3D s->filter_area_begin + s->filter_ar=
ea_length ||
> +            block->target_end <=3D s->filter_area_begin) {
>              continue;
>          }
>          return 0;
> @@ -1550,10 +1556,10 @@ static int64_t dump_calculate_size(DumpState *s)
>      int64_t size =3D 0, total =3D 0, left =3D 0, right =3D 0;
>
>      QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
> -        if (s->has_filter) {
> +        if (dump_has_filter(s)) {
>              /* calculate the overlapped region. */
> -            left =3D MAX(s->begin, block->target_start);
> -            right =3D MIN(s->begin + s->length, block->target_end);
> +            left =3D MAX(s->filter_area_begin, block->target_start);
> +            right =3D MIN(s->filter_area_begin + s->filter_area_length, =
block->target_end);
>              size =3D right - left;
>              size =3D size > 0 ? size : 0;
>          } else {
> @@ -1643,9 +1649,12 @@ static void dump_init(DumpState *s, int fd, bool h=
as_format,
>      }
>
>      s->fd =3D fd;
> -    s->has_filter =3D has_filter;
> -    s->begin =3D begin;
> -    s->length =3D length;
> +    if (has_filter && !length) {
> +        error_setg(errp, QERR_INVALID_PARAMETER, "length");
> +        goto cleanup;
> +    }
> +    s->filter_area_begin =3D begin;
> +    s->filter_area_length =3D length;
>
>      memory_mapping_list_init(&s->list);
>
> @@ -1778,8 +1787,8 @@ static void dump_init(DumpState *s, int fd, bool ha=
s_format,
>          return;
>      }
>
> -    if (s->has_filter) {
> -        memory_mapping_filter(&s->list, s->begin, s->length);
> +    if (dump_has_filter(s)) {
> +        memory_mapping_filter(&s->list, s->filter_area_begin, s->filter_=
area_length);
>      }
>
>      /*
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index 7fce1d4af6..b62513d87d 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -166,9 +166,16 @@ typedef struct DumpState {
>      hwaddr memory_offset;
>      int fd;
>
> -    bool has_filter;
> -    int64_t begin;
> -    int64_t length;
> +    /*
> +     * Dump filter area variables
> +     *
> +     * A filtered dump only contains the guest memory designated by
> +     * the start address and length variables defined below.
> +     *
> +     * If length is 0, no filtering is applied.
> +     */
> +    int64_t filter_area_begin;  /* Start address of partial guest memory=
 area */
> +    int64_t filter_area_length; /* Length of partial guest memory area *=
/
>
>      uint8_t *note_buf;          /* buffer for notes */
>      size_t note_buf_offset;     /* the writing place in note_buf */
> --
> 2.34.1
>


