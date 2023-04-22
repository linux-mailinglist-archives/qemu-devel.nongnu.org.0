Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BCA6EB98F
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 16:08:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqDtJ-0000rh-RS; Sat, 22 Apr 2023 10:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pqDtI-0000rR-0b
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 10:07:04 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pqDtG-0002zW-5H
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 10:07:03 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-555d2810415so40113277b3.0
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 07:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682172421; x=1684764421;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pc3aK+ahUbMg+iWJZOoqQRSG3ibM9CCnGKVsHKIQJfQ=;
 b=XuvDOl7PHLINep1NSOtMaYdr9ymocPCzFFotgZBo8FVHxXuFTlBKCN6+kOZElqmQa/
 +9p9AKxZRtXAsykzWYWHV711JV5dRkoyctLtmCCL6MUwnJWlU1723t25DdwHYl81sUXL
 mPSiPLlzUpowa+QacSroHDdxnPXSoO61D/eUdWiVRRBnSzprr7LBtzlkgdIHjGhy+iqW
 rDI6pOzj4KvJP91VxHCDXWiB7Vq4QWCeNWdskELw6lfCnEom8WyJ+FMWv0azmBTApMli
 nObUp3f+CSlf1XEQbLrh5g0c2DtK+qgzkbEdfPrpR5Z22/vdLTSEXhxQdz2PtYCp9syw
 /4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682172421; x=1684764421;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pc3aK+ahUbMg+iWJZOoqQRSG3ibM9CCnGKVsHKIQJfQ=;
 b=SMf2fuu2q6fp+IxyzHOhxwdILA8rqSZ3Rli0CDcjPo1fow0NF29K2KBLlH5UcHXSD1
 6Dr0XdnS9EaVlkZwdoeHM3kSEYsWgU9AcJ7FLGY7QhbHbq6SxzG/0aPAYCwgj+DWDKv2
 wAAYW8I6sAEE3SNcmNL7U8h3QmVuKp7kwsVc6XT9I4RY2u8zUPmmGj4CMTPrRMB003o5
 tpfDlRQSjGNIRMOaexOeELa7OJr2Evj9zUQAZPktDEEzkKpGySHDfIh9kQumnQg3E7jQ
 PFTK0zYiI1pX8xSBm3OiZUa1pBUOvekvjdUTmUmM9Rvy44jshgAFDbdsQYExKdwbmtPa
 LYNA==
X-Gm-Message-State: AAQBX9ejAuM9WI2X3yaLWWGXZ6XJSC/Q7SIFcCz2yNJv+FQpUU6hQs1q
 TE2jYk/rxj0cyuQp/+uZWyzP5MdGHDJ1yovQvto=
X-Google-Smtp-Source: AKy350Z1xi/IbUeCyTt9vb0qV1Eyer78vl18aVU69ZVkuzVcWRJ74qMEKoTpQA7iIC2J2J9giOFncAm4p/Zejl5oXcY=
X-Received: by 2002:a81:52cf:0:b0:552:a63e:18e4 with SMTP id
 g198-20020a8152cf000000b00552a63e18e4mr4454102ywb.32.1682172420858; Sat, 22
 Apr 2023 07:07:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230420202939.1982044-1-clg@kaod.org>
In-Reply-To: <20230420202939.1982044-1-clg@kaod.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sat, 22 Apr 2023 10:06:46 -0400
Message-ID: <CAJSP0QUzYSV4OpR4VGF3OgW_xR_07thfF48vTsn18qQYoWbGKA@mail.gmail.com>
Subject: Re: [PATCH] async: Suppress GCC13 false positive in aio_bh_poll()
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 20 Apr 2023 at 16:31, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> From: C=C3=A9dric Le Goater <clg@redhat.com>
>
> GCC13 reports an error :
>
> ../util/async.c: In function =E2=80=98aio_bh_poll=E2=80=99:
> include/qemu/queue.h:303:22: error: storing the address of local variable=
 =E2=80=98slice=E2=80=99 in =E2=80=98*ctx.bh_slice_list.sqh_last=E2=80=99 [=
-Werror=3Ddangling-pointer=3D]
>   303 |     (head)->sqh_last =3D &(elm)->field.sqe_next;                 =
         \
>       |     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
> ../util/async.c:169:5: note: in expansion of macro =E2=80=98QSIMPLEQ_INSE=
RT_TAIL=E2=80=99
>   169 |     QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
>       |     ^~~~~~~~~~~~~~~~~~~~
> ../util/async.c:161:17: note: =E2=80=98slice=E2=80=99 declared here
>   161 |     BHListSlice slice;
>       |                 ^~~~~
> ../util/async.c:161:17: note: =E2=80=98ctx=E2=80=99 declared here
>
> But the local variable 'slice' is removed from the global context list
> in following loop of the same routine. Add a pragma to silent GCC.
>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@redhat.com>
> ---
>  util/async.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/util/async.c b/util/async.c
> index 21016a1ac7..856e1a8a33 100644
> --- a/util/async.c
> +++ b/util/async.c
> @@ -164,7 +164,21 @@ int aio_bh_poll(AioContext *ctx)
>
>      /* Synchronizes with QSLIST_INSERT_HEAD_ATOMIC in aio_bh_enqueue(). =
 */
>      QSLIST_MOVE_ATOMIC(&slice.bh_list, &ctx->bh_list);
> +
> +    /*
> +     * GCC13 [-Werror=3Ddangling-pointer=3D] complains that the local va=
riable
> +     * 'slice' is being stored in the global 'ctx->bh_slice_list' but th=
e
> +     * list is emptied before this function returns.
> +     */
> +#if !defined(__clang__)
> +#pragma GCC diagnostic push
> +#pragma GCC diagnostic ignored "-Wpragmas"
> +#pragma GCC diagnostic ignored "-Wdangling-pointer=3D"
> +#endif
>      QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
> +#if !defined(__clang__)
> +#pragma GCC diagnostic pop
> +#endif

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

