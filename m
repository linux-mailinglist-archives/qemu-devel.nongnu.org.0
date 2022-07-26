Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AFB58123F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 13:42:28 +0200 (CEST)
Received: from localhost ([::1]:54948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGIxH-0006ih-68
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 07:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oGIrW-0002UU-OF
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 07:36:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oGIrV-0007zS-6T
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 07:36:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658835388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H4VwSF+fW0FAEBHgeYOSxRJzCbIoQMWNGl2pxJDVPjQ=;
 b=TC3M1vm7I5jeU6uISo+bS3Rnxr3tG/Dq37O1d4UE1arFVYbrxha4/5uH4WNAqwd/s6FRgE
 rRclzVZC8Ey88v0nv9Ez05dcxAWTuAevetdnx2ZHhHncgyM48h+9tDLg1euyIX0mijUjf2
 +bb3By9SyEOJzfOsc9uRbXRvmVny7qM=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-CR8ivCccOXiDthkOIfrH2Q-1; Tue, 26 Jul 2022 07:36:27 -0400
X-MC-Unique: CR8ivCccOXiDthkOIfrH2Q-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-106a48f2df7so7586034fac.16
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 04:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=H4VwSF+fW0FAEBHgeYOSxRJzCbIoQMWNGl2pxJDVPjQ=;
 b=xGZP+MEooxrGmFNka5ygDSb2lktCJBNCWf2/JqBEhMjML8rLMzQB/u+RRPlcWrM0Ee
 Hrg39NhLRFYZ1kVsaxjDpJoOkvfmuMSEu0qc3bk25l+k0O25S4l04rM2U0+z8UPp+63P
 oirxrAZY0/ACyWy94jSIdQ72J9B3mRZGn9XNlZlYTmY3r+dVywsJbsGQTdMEr1bKArFW
 a3h1/i+odGUbpLSrK6kZzcMgeyLgYJ5zeKCKP491nRC4j9VkkEeI6gNUzUe+LdLC49wc
 aioBYlTu6ZKRNdDo4ZogQEJjDSclx91iJTh8HzrrXOZgIzY+V4sdAC4JOmrKz86SWkAu
 ZaSQ==
X-Gm-Message-State: AJIora8EevJi0o3lC5R2AbsBWg0PPVvJ4VfLaP+b/VdWff+1sX0eIch7
 d6modF1beBNEm/qLPrztq2YLbdyCLsH6jjfLYFpzn0mI+iRisQPG/y5/8fnIeRo0TeXG0SK12Rp
 SGFFxoW/2KRr16vfwMwN9Gu9CrCTm/oE=
X-Received: by 2002:a05:6870:c1c1:b0:ee:5c83:7be7 with SMTP id
 i1-20020a056870c1c100b000ee5c837be7mr8693587oad.53.1658835386119; 
 Tue, 26 Jul 2022 04:36:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1szxuDlLAI6fRwUURAnsKEAqLOBfHCLFgITqUAmndEOWuLYrX1dwYU+jTm+HPeSBNQ/2o1i1GlR/iViDuLvyRM=
X-Received: by 2002:a05:6870:c1c1:b0:ee:5c83:7be7 with SMTP id
 i1-20020a056870c1c100b000ee5c837be7mr8693546oad.53.1658835384911; Tue, 26 Jul
 2022 04:36:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-7-frankja@linux.ibm.com>
In-Reply-To: <20220726092248.128336-7-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 26 Jul 2022 15:36:14 +0400
Message-ID: <CAMxuvayq-aVBOUrO=QTM067eaMb6U8dSt+ycZH6fVYSBSvk1dA@mail.gmail.com>
Subject: Re: [PATCH v4 06/17] dump: Rework dump_calculate_size function
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

On Tue, Jul 26, 2022 at 1:23 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:
>
> dump_calculate_size() sums up all the sizes of the guest memory
> blocks. Since we already have a function that calculates the size of a
> single memory block (dump_get_memblock_size()) we can simply iterate
> over the blocks and use the function instead of calculating the size
> ourselves.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  dump/dump.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index b59faf9941..57558a4d4b 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -1540,25 +1540,17 @@ bool qemu_system_dump_in_progress(void)
>      return (qatomic_read(&state->status) =3D=3D DUMP_STATUS_ACTIVE);
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
> -    int64_t size =3D 0, total =3D 0, left =3D 0, right =3D 0;
> +    int64_t total =3D 0;
>
>      QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
> -        if (s->has_filter) {
> -            /* calculate the overlapped region. */
> -            left =3D MAX(s->begin, block->target_start);
> -            right =3D MIN(s->begin + s->length, block->target_end);
> -            size =3D right - left;
> -            size =3D size > 0 ? size : 0;
> -        } else {
> -            /* count the whole region in */
> -            size =3D (block->target_end - block->target_start);
> -        }
> -        total +=3D size;
> +        total +=3D dump_get_memblock_size(block, s->begin, s->length);
>      }
>
>      return total;
> --
> 2.34.1
>


