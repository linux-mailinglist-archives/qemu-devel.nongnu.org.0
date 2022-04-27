Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A981151133C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 10:07:38 +0200 (CEST)
Received: from localhost ([::1]:53032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njci0-0005Dk-Qk
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 04:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1njcaK-0003gZ-HE
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 03:59:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1njcaH-0001E4-Bb
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 03:59:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651046376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zQS3lbzJoulN+rgXMI5IvKaYBn0Bc6nX3Plg/ltX2qc=;
 b=hF9NCTZn6W4IzrsIQGHmcuCmR09KY9eGiPYA9zkBV4a2YWx8q89cXQfLjJwnMGXGGG1DU9
 f3BRsQ1TJR/o3S/v00LrAD6iKUhhzH78o7xvpADX1Ka4/RU/SCqBrTqp5hdhd4oWmaQSF5
 mZFnCe1h0YtYFFOyIpCYQKMVL1SapVM=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-bVyGQ7BOP_6CsQ0A5pUnEA-1; Wed, 27 Apr 2022 03:59:35 -0400
X-MC-Unique: bVyGQ7BOP_6CsQ0A5pUnEA-1
Received: by mail-yb1-f199.google.com with SMTP id
 b6-20020a5b0b46000000b006457d921729so1024569ybr.23
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 00:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zQS3lbzJoulN+rgXMI5IvKaYBn0Bc6nX3Plg/ltX2qc=;
 b=Z1rUJxzDT2Ey+7BIc42tt4LpvYTOHo9l2vgVZUAJNeK83ZVQ9faXzirsBbOhaOp2P9
 Mulb+WeogiKFio5sOSlN2OeshvsMKllK3IfpU1pEzi/T/jANBaCnWycK5+GreOD8TSxu
 y7UNFc4R953fJfMxrtXv4sm1Hm1ii1nh5GzVeAHqEOzctuLDJWkORr6bFmzO8SeR2we8
 1sQCLHtb6bKtEORhbHwS2p/3V+YSQ7UWX9mjx92fPv52uKf30QzxL23qoeQFKGLj6kKP
 Napr/xqw/OvgObRSz4Kcq31S7BThzz/sDKbBwgwbP+Y7k57KWTBsw5umGnlpQEkdjqtU
 SuDA==
X-Gm-Message-State: AOAM530UNlk5jaUHm4ppLxgUnR9iTRfAeYZqSpZVTXN6IaiVTXh/kGXg
 JjEwYuz7Xk7Lm5GumvNNfOZvrQ/vQa6mt6nTRliZciRp+CP7TjghmkSqpsAPXzJ04S+4U3v1fun
 281qb46sF57kynkaX/I/cDSF8qWos4TE=
X-Received: by 2002:a81:2517:0:b0:2ed:e0f4:83bb with SMTP id
 l23-20020a812517000000b002ede0f483bbmr25039171ywl.15.1651046373994; 
 Wed, 27 Apr 2022 00:59:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwG2CGPicxMlHcKp4nPz4grk0484BTEMeKBRF/7pJH9Ul6L0eeEi+uzOFwQdvc0DVUE+6kVEsn+tEtMHqj62jo=
X-Received: by 2002:a81:2517:0:b0:2ed:e0f4:83bb with SMTP id
 l23-20020a812517000000b002ede0f483bbmr25039167ywl.15.1651046373792; Wed, 27
 Apr 2022 00:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
 <20220426092715.3931705-2-marcandre.lureau@redhat.com>
 <161cf025-a591-dc16-2f17-a09d0aec766d@linaro.org>
In-Reply-To: <161cf025-a591-dc16-2f17-a09d0aec766d@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 27 Apr 2022 11:59:23 +0400
Message-ID: <CAMxuvawV399p17QhGLeN4GejFFfgM+xBLMs98hGuakyNzqXC1A@mail.gmail.com>
Subject: Re: [PATCH v2 01/26] Use QEMU_SANITIZE_THREAD
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Wed, Apr 27, 2022 at 12:43 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/26/22 02:26, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > ---
> >   include/qemu/atomic.h                        | 8 +++++---
> >   subprojects/libvhost-user/include/compiler.h | 1 +
> >   2 files changed, 6 insertions(+), 3 deletions(-)
> >   create mode 120000 subprojects/libvhost-user/include/compiler.h
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> > +++ b/subprojects/libvhost-user/include/compiler.h
> > @@ -0,0 +1 @@
> > +../../../include/qemu/compiler.h
> > \ No newline at end of file
>
> Fix the missing newline.

This is just the way symlinks are represented, I don't think I can change t=
hat.

thanks!


