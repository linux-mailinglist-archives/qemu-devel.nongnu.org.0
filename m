Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE7357CD9E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 16:28:34 +0200 (CEST)
Received: from localhost ([::1]:52662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEXAG-0001IJ-VS
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 10:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oEX8S-0007SS-OJ
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 10:26:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oEX8P-0000NS-W8
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 10:26:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658413597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=akWlm6VyQckl8jGdzyRZWm4tL20ynHltVQaKvg/N8b0=;
 b=BEG/GmLoVE3do8jMhbQl91fX6R+MtYukFHXgyil22CcAslInr8IVFvLJt6OJhm2ko3Cp9U
 u4pWCp7T3c55FofN8jKR9qw1x0hOhVBYiLuzfFB5Gmr0BVGmnSc2roTOl7V7asPXY/1VOE
 +olX7+VcaHcbL7C3+gegW5c/CP0y4GI=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-91xxyGrvPR22ao0zsAq3sA-1; Thu, 21 Jul 2022 10:26:36 -0400
X-MC-Unique: 91xxyGrvPR22ao0zsAq3sA-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-fdc4b531bfso963710fac.13
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 07:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=akWlm6VyQckl8jGdzyRZWm4tL20ynHltVQaKvg/N8b0=;
 b=jqxWs2OMQVXZS5kIvetJtzsg2E7Wh6mflQXD4Fh1uN1N21h475trApB628t2BS3RnO
 DZFDgyyTcju4cI+u1g3+HHITbly9O9ad7ECu5pD63A89gOQEzYtBxZtv7NjuGOPZDKQm
 fWzdvJoeLqq0A2dsmEHdBG1EROEgxH/IlA0E04EgAWZbyqRAzSFZspz6nkd71CtQAbqt
 NGPjOX/Sk9fMkaOCeurpByUisnL4SypN3ICVGZ+EnHM6OjGIkx/FNBdwa4iY2R9jiBSX
 31gScAV3Rfimii/kD+YQAo9S/llTcHtFV9ihTslKUgfHmk7fR1qzrBAvAqrKqWuN6yvb
 5ogw==
X-Gm-Message-State: AJIora+iRNpIswSNHO7t5OsGXRTiQ3BVD4CNUdd4LRInDIVpkHUC8g1z
 crN4XdhQbLlf0fnMb9kZxDndRYZzbmRwLnOOMKybHqA33d7ZXmZ33T/yQPdZtmyqpgK0xiWvyQW
 KOwLSZpFIZ0f3CNb1NOshw9v+H1gem8E=
X-Received: by 2002:a05:6870:f627:b0:10c:9be9:5306 with SMTP id
 ek39-20020a056870f62700b0010c9be95306mr5398345oab.205.1658413595491; 
 Thu, 21 Jul 2022 07:26:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sVpr6NcRadoE8V3gBknPcSNsAmC+byMDyra04fWySpnXcNEfKTrAe+FmDHM7DnL0afFFKye2KyFIL8C5xwacs=
X-Received: by 2002:a05:6870:f627:b0:10c:9be9:5306 with SMTP id
 ek39-20020a056870f62700b0010c9be95306mr5398307oab.205.1658413594966; Thu, 21
 Jul 2022 07:26:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220721132256.2171-1-frankja@linux.ibm.com>
 <20220721132256.2171-3-frankja@linux.ibm.com>
In-Reply-To: <20220721132256.2171-3-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 21 Jul 2022 18:26:24 +0400
Message-ID: <CAMxuvaz+eDTnhhTSj7wLyctrysRr0zhcUn_C-eDi4p655fPR5A@mail.gmail.com>
Subject: Re: [PATCH v3 02/14] dump: Rename write_elf_loads to
 write_elf_phdr_loads
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo" <pbonzini@redhat.com>,
 mhartmay@linux.ibm.com, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, imbrenda@linux.ibm.com, 
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, seiden@linux.ibm.com
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

On Thu, Jul 21, 2022 at 5:24 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:
>
> Let's make it a bit clearer that we write the program headers of the
> PT_LOAD type.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  dump/dump.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 4d9658ffa2..0ed7cf9c7b 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -490,7 +490,7 @@ static void get_offset_range(hwaddr phys_addr,
>      }
>  }
>
> -static void write_elf_loads(DumpState *s, Error **errp)
> +static void write_elf_phdr_loads(DumpState *s, Error **errp)
>  {
>      ERRP_GUARD();
>      hwaddr offset, filesz;
> @@ -573,8 +573,8 @@ static void dump_begin(DumpState *s, Error **errp)
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
> --
> 2.34.1
>


