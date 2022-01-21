Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B285349655B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 20:00:48 +0100 (CET)
Received: from localhost ([::1]:47870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAz9N-0001ZO-Nv
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 14:00:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nAywe-00079e-2I
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 13:47:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nAywa-0000xn-MU
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 13:47:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642790847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pz9GlZYonsns6RGqlX+9+r8W6lrdPCQBCF+IcWKNs8E=;
 b=SDKYvBm3b+qeRuOgFdIkJjIKtKkekgDVFZpfxRtplZv47aMawe6BGau3PWWo5lXND8Yant
 IbZFbaGaq4M2H1+r9rIPOkC3dOJJQMwIl2k7HwyQLAdqDXgZHSSzCiF6I2WfHfyhzKyNb+
 TFTd5JTGlHRaWOXjqNFbz9lIOvbtWwY=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-At3c0zH9P7eyuOuADAnLDQ-1; Fri, 21 Jan 2022 13:47:23 -0500
X-MC-Unique: At3c0zH9P7eyuOuADAnLDQ-1
Received: by mail-ua1-f69.google.com with SMTP id
 v10-20020ab036ca000000b003068cf1e17bso6103078uau.4
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 10:47:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Pz9GlZYonsns6RGqlX+9+r8W6lrdPCQBCF+IcWKNs8E=;
 b=6QLGo/48W/54kJ/C5juzZOlSFikQigUvP7XhBNz7rczS9dHVUBr/lTrEOahO6jTxfE
 yY7Aok4mhfeFjw1TK2u/5vFJT6Q55U/tWvJ4fidgW3K7ICQvmw0LRBVr5dJjuVd64uYM
 k8DLvpW9tXuPvgQS8grhJHEB3oFpWO+Iuyc2PPyB/VFnYaj0BGj0i2KU+lZrNt4q10aM
 +MqrMWjzSepNZUbY/7eP9vzy9PhG+6CisGLRRNC5krtRoEFy0dLHhZGGzBtH9vMRxjNI
 fx79M+0Rk74E6V+2YTWhPp9a5upXbE/qP/UD928onpGpxANcVlVQGh2I8ysO7QDuONrt
 c1yg==
X-Gm-Message-State: AOAM530FH8p64MUwVOxhEChmYe67YzNes3rTXXEO4Xdg7w42S9LqNpbx
 DLVZqz7OjCqpy2yAP96+Gezj9mHNQI4oSA85uXtBW+AlIl6hd1Z2ZGt82G39pGNI/09ZvT2s5yx
 51kJlxi/Koo4lSwkRwHdDQxaidZbCeiY=
X-Received: by 2002:a05:6102:3714:: with SMTP id
 s20mr2433582vst.61.1642790843186; 
 Fri, 21 Jan 2022 10:47:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqD/gelOkgr2AYvBX/+pNod7CU0hwVdfmV7deAruki0hCatdULPCAS12kILOxGon2rW/Cj7VQbHoaiqHfI648=
X-Received: by 2002:a05:6102:3714:: with SMTP id
 s20mr2433574vst.61.1642790842904; 
 Fri, 21 Jan 2022 10:47:22 -0800 (PST)
MIME-Version: 1.0
References: <20220120142259.120189-1-hreitz@redhat.com>
In-Reply-To: <20220120142259.120189-1-hreitz@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 21 Jan 2022 13:47:12 -0500
Message-ID: <CAFn=p-YKMREeM4PxhiTQFfiovt=WN7cW-CdiVSVfbRbkvH+aog@mail.gmail.com>
Subject: Re: [PATCH v2] ide: Increment BB in-flight counter for TRIM BH
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 20, 2022 at 9:23 AM Hanna Reitz <hreitz@redhat.com> wrote:
>
> When we still have an AIOCB registered for DMA operations, we try to
> settle the respective operation by draining the BlockBackend associated
> with the IDE device.
>
> However, this assumes that every DMA operation is associated with an
> increment of the BlockBackend=E2=80=99s in-flight counter (e.g. through s=
ome
> ongoing I/O operation), so that draining the BB until its in-flight
> counter reaches 0 will settle all DMA operations.  That is not the case:
> For TRIM, the guest can issue a zero-length operation that will not
> result in any I/O operation forwarded to the BlockBackend, and also not
> increment the in-flight counter in any other way.  In such a case,
> blk_drain() will be a no-op if no other operations are in flight.
>
> It is clear that if blk_drain() is a no-op, the value of
> s->bus->dma->aiocb will not change between checking it in the `if`
> condition and asserting that it is NULL after blk_drain().
>
> The particular problem is that ide_issue_trim() creates a BH
> (ide_trim_bh_cb()) to settle the TRIM request: iocb->common.cb() is
> ide_dma_cb(), which will either create a new request, or find the
> transfer to be done and call ide_set_inactive(), which clears
> s->bus->dma->aiocb.  Therefore, the blk_drain() must wait for
> ide_trim_bh_cb() to run, which currently it will not always do.
>
> To fix this issue, we increment the BlockBackend's in-flight counter
> when the TRIM operation begins (in ide_issue_trim(), when the
> ide_trim_bh_cb() BH is created) and decrement it when ide_trim_bh_cb()
> is done.
>
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D2029980
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
> v1:
> https://lists.nongnu.org/archive/html/qemu-block/2022-01/msg00024.html
>
> v2:
> - Increment BB=E2=80=99s in-flight counter while the BH is active so that
>   blk_drain() will poll until the BH is done, as suggested by Paolo
>
> (No git-backport-diff, because this patch was basically completely
> rewritten, so it wouldn=E2=80=99t be worth it.)
> ---
>  hw/ide/core.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/hw/ide/core.c b/hw/ide/core.c
> index e28f8aad61..15138225be 100644
> --- a/hw/ide/core.c
> +++ b/hw/ide/core.c
> @@ -433,12 +433,16 @@ static const AIOCBInfo trim_aiocb_info =3D {
>  static void ide_trim_bh_cb(void *opaque)
>  {
>      TrimAIOCB *iocb =3D opaque;
> +    BlockBackend *blk =3D iocb->s->blk;
>
>      iocb->common.cb(iocb->common.opaque, iocb->ret);
>
>      qemu_bh_delete(iocb->bh);
>      iocb->bh =3D NULL;
>      qemu_aio_unref(iocb);
> +
> +    /* Paired with an increment in ide_issue_trim() */
> +    blk_dec_in_flight(blk);
>  }
>
>  static void ide_issue_trim_cb(void *opaque, int ret)
> @@ -508,6 +512,9 @@ BlockAIOCB *ide_issue_trim(
>      IDEState *s =3D opaque;
>      TrimAIOCB *iocb;
>
> +    /* Paired with a decrement in ide_trim_bh_cb() */
> +    blk_inc_in_flight(s->blk);
> +
>      iocb =3D blk_aio_get(&trim_aiocb_info, s->blk, cb, cb_opaque);
>      iocb->s =3D s;
>      iocb->bh =3D qemu_bh_new(ide_trim_bh_cb, iocb);
> --
> 2.34.1
>

Oh, this *wasn't* the same bug I thought it was.

There's no regression test, but I will trust you (and Paolo) that this
solves the bug you were seeing. It makes sense.

Reviewed-by: John Snow <jsnow@redhat.com>
Tested-by: John Snow <jsnow@redhat.com>


