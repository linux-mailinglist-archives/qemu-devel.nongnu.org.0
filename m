Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2C2573A81
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 17:49:18 +0200 (CEST)
Received: from localhost ([::1]:56390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBec1-0003Nn-RI
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 11:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oBeZX-0001L5-Lk
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 11:46:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oBeZL-0005HJ-Ho
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 11:46:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657727190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pQND7eI4ykdGnNHkBKjBzIqwG1h476qM+3MM9fBYbgs=;
 b=DqUyg/NZKx3fMhmvCFvbIYlEYpiarbLswsc7mHlWRREecym6PwpZFlABGLEafI39FODriK
 mboWil6qYc9jFGj7Gc+9f7PRnPkL5ASdGSMXU/Kdxwh9PhBXN8v1vsf9t3omcoiDUQI3aC
 Vqj5n30WQYHf4FzUAKWPt5V6yXprUd8=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-lMtrPCCvMnaIuZ92Mija1A-1; Wed, 13 Jul 2022 11:46:29 -0400
X-MC-Unique: lMtrPCCvMnaIuZ92Mija1A-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-f15a7ca913so6003046fac.8
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 08:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pQND7eI4ykdGnNHkBKjBzIqwG1h476qM+3MM9fBYbgs=;
 b=bm3bTgLqrd8FcUCvITivKG62KdgmEDspIoSV/QZUuAmyzYCy8ck2tdLd9zGym0gSmK
 SuDX5pHQDW61AAxRxRUde6bXl8M6l6/KG86xSzdKE8u50n+h4U6k0VeQG1PqkQe3Wd+O
 cSxy6CDOMOxJaZ8QC9lwWDRjYS9GowMH8BO5vx8Q59uxk3ClhbG/GObO+BEtnf39gSk1
 RBFmtfCYeLKxcbSKWIb6qfAjbNED+RaPfhsGxBDOqIkyzv5C1LVUag3rLFIdapEJ4HbN
 amNTD5+PPWiNOGOeGBcJpdTp5GzC+BzwlJlIcqgq2jM1nBEZnavr611H0tjbrFM258S7
 WmIw==
X-Gm-Message-State: AJIora+lTvcY5BBn7fmbJNEHQT1YaMkoYv/fn+i30Y2ps0AH4F0U85Ff
 BKZKtTl1VQKGqmk5J1e7/q5w7UZX5StezlJRfReqPs55mBpanU1wZdjLHAdWCULZFUuL7qonHO3
 GoINa1piKn+vTXUUHxQbsvGQDu10JvwQ=
X-Received: by 2002:a05:6870:f627:b0:10c:9be9:5306 with SMTP id
 ek39-20020a056870f62700b0010c9be95306mr4996541oab.205.1657727188702; 
 Wed, 13 Jul 2022 08:46:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vnC+1MqKzWXZOQ7iD0z6G8m+7KevKd2O6YAah/tzG7xnEUJtkESDCQb6yODHjDdSfjHmtwkePyoHPkFi4JFRw=
X-Received: by 2002:a05:6870:f627:b0:10c:9be9:5306 with SMTP id
 ek39-20020a056870f62700b0010c9be95306mr4996529oab.205.1657727188509; Wed, 13
 Jul 2022 08:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220713130322.25517-1-frankja@linux.ibm.com>
 <20220713130322.25517-5-frankja@linux.ibm.com>
In-Reply-To: <20220713130322.25517-5-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 13 Jul 2022 19:46:17 +0400
Message-ID: <CAMxuvawFxNv9pdeaLuTVb1fg5qx_VmSy+zjYxJXKJKCBPh3-BA@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] dump: Reorder struct DumpState
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo" <pbonzini@redhat.com>,
 mhartmay@linux.ibm.com, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, imbrenda@linux.ibm.com, 
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, "Henderson,
 Richard" <richard.henderson@linaro.org>
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

On Wed, Jul 13, 2022 at 5:07 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:
>
> Let's move ELF related members into one block and guest memory related
> ones into another to improve readability.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  include/sysemu/dump.h | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index bd49532232..8379e29ef6 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -154,15 +154,8 @@ typedef struct DumpState {
>      GuestPhysBlockList guest_phys_blocks;
>      ArchDumpInfo dump_info;
>      MemoryMappingList list;
> -    uint32_t phdr_num;
> -    uint32_t shdr_num;
>      bool resume;
>      bool detached;
> -    ssize_t note_size;
> -    hwaddr shdr_offset;
> -    hwaddr phdr_offset;
> -    hwaddr section_offset;
> -    hwaddr note_offset;
>      hwaddr memory_offset;
>      int fd;
>
> @@ -171,6 +164,16 @@ typedef struct DumpState {
>      int64_t begin;             /* Start address of the chunk we want to =
dump */
>      int64_t length;            /* Length of the dump we want to dump */
>
> +    /* Elf dump related data */
> +    uint32_t phdr_num;
> +    uint32_t shdr_num;
> +    uint32_t sh_info;
> +    ssize_t note_size;
> +    hwaddr shdr_offset;
> +    hwaddr phdr_offset;
> +    hwaddr note_offset;
> +    hwaddr section_offset;
> +
>      void *elf_header;
>      void *elf_section_hdrs;
>      uint64_t elf_section_data_size;
> --
> 2.34.1
>


