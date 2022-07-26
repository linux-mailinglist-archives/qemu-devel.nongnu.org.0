Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA28D5811B4
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 13:11:51 +0200 (CEST)
Received: from localhost ([::1]:46944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGITf-0005fc-1r
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 07:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oGIOv-00016K-FL
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 07:06:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oGIOt-0008Sa-1y
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 07:06:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658833614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l/lo4cqr3VYFAFNJ0jXSqlFx/dN1m4YHgrUGnwIYJts=;
 b=hZY3K2/aBmxZ/c9JjUn1wdfYe5d3C3U8/lxznMrTPiBPaRlaWFTF7GAnW4/xo+5XBGNJj+
 xNVVpT7KhV7F7VnEn0qDqNWWYbXzYxF2HGEgcpHyKJXL6suNpGcLTuKVMXBIFTjEM/+RmW
 6+fh0gIqoS8W3UCk5UqIhcqT+k/EcKI=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-TVVDLonlMhSpyJP04CbMlg-1; Tue, 26 Jul 2022 07:06:52 -0400
X-MC-Unique: TVVDLonlMhSpyJP04CbMlg-1
Received: by mail-ot1-f71.google.com with SMTP id
 l7-20020a9d7087000000b0061cf9ae6ca5so2841547otj.21
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 04:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=l/lo4cqr3VYFAFNJ0jXSqlFx/dN1m4YHgrUGnwIYJts=;
 b=jdiUNhCRUhmIFqnmY733THAGpVhxFeP9zeQ4qJwTnHz2dyJ7Ooic776HMYbNryjCRV
 UE1Cq0GayVjz1iL6KkxrBoRPQVi0Vea/t60KS1q5ZK9tUgGdyjCzCVSWwbjVEHYj8f39
 gbxq1pFZRekf2RmunTL4R8/iYWDP8De5GKjKwXzGJzcINetw5ajw28+Wb/UalGjYOiXy
 FDZcn7jW/UWycLy2QrcPEGh5UCFtyKILoJ6NwUmeLmrcFWbkhVTHqZggunK7c11UANtx
 48JpuccA0sQ/n14sP++AVtltICvCxb10ngHEaS63ZcvxeA4h8F4tRqCymAP1UFVFKgN6
 SWDg==
X-Gm-Message-State: AJIora8Y/4SYXkuKFvJzKfPh0bDz4lLZwTWSpvbH9ukWzd9d9Nm6yZ9V
 uKL4aYkI3YuX7T+9xOsSQZ6fAPLnS3566WIns4jMpEF2cG5LrV5GbXgTruo2ZovmIJmYtr8CXPh
 PX3x5SfqnDUNc2EQwlxIzehefq2zkrVo=
X-Received: by 2002:a05:6830:58:b0:61c:cf3c:14b8 with SMTP id
 d24-20020a056830005800b0061ccf3c14b8mr6145306otp.38.1658833611985; 
 Tue, 26 Jul 2022 04:06:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1thnOzSCrb+Vuj405W31RFVdaUl3g02cRn3lvYvDDN2s8Mpe1MSRRJoIgHslzvHtifexbPvKBWUkzX+ZdkyjJg=
X-Received: by 2002:a05:6830:58:b0:61c:cf3c:14b8 with SMTP id
 d24-20020a056830005800b0061ccf3c14b8mr6145297otp.38.1658833611790; Tue, 26
 Jul 2022 04:06:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-11-frankja@linux.ibm.com>
In-Reply-To: <20220726092248.128336-11-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 26 Jul 2022 15:06:41 +0400
Message-ID: <CAMxuvayCd4=byQ_citfZiv3fsJhZ7ANSfRfpgrBPm-tP=t+MOQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/17] dump: Swap segment and section header locations
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo" <pbonzini@redhat.com>,
 mhartmay@linux.ibm.com, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, imbrenda@linux.ibm.com, 
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, seiden@linux.ibm.com,
 scgl@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Jul 26, 2022 at 1:23 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:
>
> For the upcoming string table and arch section support we need to
> modify the elf layout a bit. Instead of the segments, i.e. the guest's
> memory contents, beeing the last area the section data will live at

being

> the end of the file. This will allow us to write the section data
> after all guest memory has been dumped which is important for the s390
> PV dump support.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  dump/dump.c           | 21 ++++++++++++---------
>  include/sysemu/dump.h |  1 +
>  2 files changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index a6bb7bfa21..3cf846d0a0 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -588,6 +588,9 @@ static void dump_begin(DumpState *s, Error **errp)
>       *   --------------
>       *   |  memory     |
>       *   --------------
> +     *   |  sectn data |
> +     *   --------------
> +
>       *
>       * we only know where the memory is saved after we write elf note in=
to
>       * vmcore.
> @@ -1852,18 +1855,18 @@ static void dump_init(DumpState *s, int fd, bool =
has_format,
>          }
>      }
>
> +    tmp =3D (s->phdr_num =3D=3D PN_XNUM) ? s->sh_info : s->phdr_num;
>      if (dump_is_64bit(s)) {
> -        s->phdr_offset =3D sizeof(Elf64_Ehdr);
> -        s->shdr_offset =3D s->phdr_offset + sizeof(Elf64_Phdr) * s->phdr=
_num;
> -        s->note_offset =3D s->shdr_offset + sizeof(Elf64_Shdr) * s->shdr=
_num;
> -        s->memory_offset =3D s->note_offset + s->note_size;
> +        s->shdr_offset =3D sizeof(Elf64_Ehdr);
> +        s->phdr_offset =3D s->shdr_offset + sizeof(Elf64_Shdr) * s->shdr=
_num;
> +        s->note_offset =3D s->phdr_offset + sizeof(Elf64_Phdr) * tmp;
>      } else {
> -
> -        s->phdr_offset =3D sizeof(Elf32_Ehdr);
> -        s->shdr_offset =3D s->phdr_offset + sizeof(Elf32_Phdr) * s->phdr=
_num;
> -        s->note_offset =3D s->shdr_offset + sizeof(Elf32_Shdr) * s->shdr=
_num;
> -        s->memory_offset =3D s->note_offset + s->note_size;
> +        s->shdr_offset =3D sizeof(Elf32_Ehdr);
> +        s->phdr_offset =3D s->shdr_offset + sizeof(Elf32_Shdr) * s->shdr=
_num;
> +        s->note_offset =3D s->phdr_offset + sizeof(Elf32_Phdr) * tmp;
>      }
> +    s->memory_offset =3D s->note_offset + s->note_size;
> +    s->section_offset =3D s->memory_offset + s->total_size;
>
>      return;
>
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index 3937afe0f9..696e6c67d6 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -172,6 +172,7 @@ typedef struct DumpState {
>      hwaddr shdr_offset;
>      hwaddr phdr_offset;
>      hwaddr note_offset;
> +    hwaddr section_offset;

Maybe introduce back section_offset in a different patch.

Either way,
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

>
>      void *elf_header;
>      void *elf_section_hdrs;
> --
> 2.34.1
>


