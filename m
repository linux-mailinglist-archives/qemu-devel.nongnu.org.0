Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 568563B3ACC
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 04:21:19 +0200 (CEST)
Received: from localhost ([::1]:32830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwbT4-0002JB-Cw
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 22:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1lwbRp-0001Xq-AH
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 22:20:01 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:33432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1lwbRm-00038j-Sh
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 22:20:01 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 o17-20020a9d76510000b02903eabfc221a9so7841668otl.0
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 19:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5qLmUFhAhnXL4O0eq3pvr0YfG2KZFpckY3NlqnFkKL0=;
 b=BqApx4R6uJRcAPmccmWi1EXkZ/9QzthFlaU7Ias12lYZZICPeaKnWzIfyCYTSfCToM
 uBy5QleNFE1ckQLFS/zdQ3fExb2UI3GY8uWaP1plEpHDVoOMuTpksPIoOQXIIaEPmvPi
 pDL/yL9lV4HAAkY06Pbabg2EznMfJCbuIUfsjFeaPURwCP9oI6yWDeoeFU0N/H9e+EUU
 D4cjsrsHKB6FPI0Dw8jKIOcaDaUTsIW5rategT/v4fTazz5fUrS6khRy8unx2egjvGh7
 hJTsoETTHOfg2kI6nvIE6STogKTaue9LyKXSDddjORL04eZjsuQNbTIb7QzmmHi6ic5p
 rxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5qLmUFhAhnXL4O0eq3pvr0YfG2KZFpckY3NlqnFkKL0=;
 b=HHMgEgvONz8iEXRMfJp77uIW/DeeXLJNdseN95NKD9Q1gMGiue6bfT1eyp1sl5aQLy
 RXGSWG3G0bRp7lTcDQ/43f3pUKf5dolTNy/efFAVKZ4HdjoejexyFCKhOfknNGQn73Nx
 S3yosFVPcnTK73VV4ezeveHvlGX20/T4/1l1hHVlUbBNXkMGbGLMkvzLJwtG+d9rmwiQ
 KTuvJyyqewtiGAVGX/BsehTTzW2Th8aEJXhywcgvWbsiEOPmwjQeIvy3hMu+fEjToz1o
 bseFwy/qqksdJRGaIRGBNWeFZjutNxww8RIqyY20Zl3A59sE4f0nW4S0o4SSDi41T6GW
 pD4g==
X-Gm-Message-State: AOAM532f1fO/KsPFtuGaQOQWOFhFpCBCdLFi1spL2tgodGxRldoDSttz
 LUshLVqH1wVKQ/4y95C2ZcZwynVq5MsSUFc6zng=
X-Google-Smtp-Source: ABdhPJzwGtI9z5CdhK7OIA5NcO0sPVdArLzUuzt11CVY8Y42wTTKfqidGJ7mqUtXQPP9f4Xw4nKpEHwRYqepKVYB+gs=
X-Received: by 2002:a9d:ecf:: with SMTP id 73mr2595621otj.5.1624587597230;
 Thu, 24 Jun 2021 19:19:57 -0700 (PDT)
MIME-Version: 1.0
References: <162441284292.15618.4627728437912000813-0@git.sr.ht>
 <CAAKa2jm_4noz=rVc-vW6-4q-HsJtLoZXUZJfoHprjpLmYgb1EA@mail.gmail.com>
 <baf2e00f-b8ed-920b-2bcb-f5aecbdd20e7@redhat.com>
In-Reply-To: <baf2e00f-b8ed-920b-2bcb-f5aecbdd20e7@redhat.com>
From: Qiang Liu <cyruscyliu@gmail.com>
Date: Fri, 25 Jun 2021 10:19:44 +0800
Message-ID: <CAAKa2jnfJ4p_9nKHvjy_fWZ0-GRS_8ed=pBLW9rLNsBFDqO+zg@mail.gmail.com>
Subject: Re: [PATCH qemu] hw/net/vmxnet3: Remove g_assert_not_reached() when
 VMXNET3_REG_ICR is written
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=cyruscyliu@gmail.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,
On Wed, Jun 23, 2021 at 11:23 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/6/23 =E4=B8=8A=E5=8D=8810:26, Qiang Liu =E5=86=99=E9=81=93=
:
> > From: cyruscyliu <cyruscyliu@gmail.com>
> >
> > A malicious guest user can write VMXNET3_REG_ICR to crash QEMU. This
> > patch remove the g_aasert_not_reached() there and make the access pass.
> >
> > Fixes: 786fd2b0f87 ("VMXNET3 device implementation")
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/309
> > Buglink: https://bugs.launchpad.net/qemu/+bug/1913923
> >
> > Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
>
>
> Do we need to warn about the unimplemented register?
If we remove the case branch, it will go to the default branch which
can warn users if
VMXNET_DEBUG_CB_ENABLED is defined, so there is no need to warn this
unimplemented register. Am I right?
```
vmxnet3_io_bar1_write(...
    default:
        VMW_CBPRN("Unknown Write to BAR1 [%" PRIx64 "] =3D %" PRIx64 ", siz=
e %d",
                  addr, val, size);
        break;
```

> Thanks
>
>
> > ---
> >   hw/net/vmxnet3.c | 7 -------
> >   1 file changed, 7 deletions(-)
> >
> > diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
> > index eff299f629..a388918479 100644
> > --- a/hw/net/vmxnet3.c
> > +++ b/hw/net/vmxnet3.c
> > @@ -1786,13 +1786,6 @@ vmxnet3_io_bar1_write(void *opaque,
> >           vmxnet3_set_variable_mac(s, val, s->temp_mac);
> >           break;
> >
> > -    /* Interrupt Cause Register */
> > -    case VMXNET3_REG_ICR:
> > -        VMW_CBPRN("Write BAR1 [VMXNET3_REG_ICR] =3D %" PRIx64 ", size =
%d",
> > -                  val, size);
> > -        g_assert_not_reached();
> > -        break;
> > -
> >       /* Event Cause Register */
> >       case VMXNET3_REG_ECR:
> >           VMW_CBPRN("Write BAR1 [VMXNET3_REG_ECR] =3D %" PRIx64 ", size=
 %d",
> > --
> > 2.30.2
> >
>

