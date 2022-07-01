Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CFE5637E7
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 18:28:49 +0200 (CEST)
Received: from localhost ([::1]:52516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7JVg-0003GE-IB
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 12:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o7JIc-0007fg-It
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 12:15:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o7JIZ-0003Vb-Gn
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 12:15:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656692113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ul0eVpeMmmTLfYTm3rWcAg4z279pNBHzgfp8kXSt2R0=;
 b=E74fJ0vHKPV3K25R5Ke/I3Z7CVEtUNjYpUCXzUcK4rdWfr7CGQOUfuY5TQ0a762NXcQbHe
 dWQX8BvJg+HBpobOETRTGaNWS/eBgrbw4Q1XCeoot+qrQv6tqIeCI/AzXOM4gv8ocWgxN3
 31P2JYxUXDY8+esvqXxELgi4PfetzEk=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-_96DJDyJP3eYuQr5zU1-hA-1; Fri, 01 Jul 2022 12:15:12 -0400
X-MC-Unique: _96DJDyJP3eYuQr5zU1-hA-1
Received: by mail-ua1-f72.google.com with SMTP id
 m12-20020ab0138c000000b003820c57eda7so916917uae.20
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 09:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ul0eVpeMmmTLfYTm3rWcAg4z279pNBHzgfp8kXSt2R0=;
 b=sG0nR7MN1H4MvJLEUw3mSiNMernkPAAOWt6IhuOaA4u9bPwOBpLm7EdAmsZSvHS0fo
 KytwWq1tqz33jx+NuJOi5zGB44CrfoWFvpyeYsjX0T2nYIdhN5MQVrL1uhIzNuV0fpkN
 8C80LSPbhLRz7kUv3lcz3e32pKAb4hnuNHKviKCzydAWcYyXt5cu9L5FO+XGjfsWyf3K
 iRbfxUxqP6SumHwIzsK5ZFRjV9f5lPDnzDUjLcPks7svrthhEY1Fx70ac5FXLHXwK9GT
 qrrA6wyo5fik0Sb1VTtzjhHb7MH80mrI2x3jvpQ8EqycZ39enM5MEIV/jt4o4w3kDOwX
 y8Cw==
X-Gm-Message-State: AJIora/mOvR4o3SoRVUs5tCKQIPHHz2R2TDqJd8QMPtC0gYuqegCUGh6
 xtubRskxzzfi1wQ33tpTgSsEKNhFXluiQP6cSK0MZr6N5tKe20gFfgDVSHsz8NLy7fXIvhl94Kv
 +1GZIE1zr07ADYhzPmvE4Sito/GFujbM=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr11275964vsa.38.1656692112075; 
 Fri, 01 Jul 2022 09:15:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1trTBULHv4A57yTqaBcrkjOCs5DP3jIail/LzBNMdFzOV3XU5a/jDd/yhuamxWzyipAIKINTmnJWpQFNWM+3y0=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr11275939vsa.38.1656692111853; Fri, 01
 Jul 2022 09:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220616142659.3184115-1-jsnow@redhat.com>
 <20220616142659.3184115-3-jsnow@redhat.com>
 <b3e95451-77e3-7e4d-bb2c-664bdbaae9c9@redhat.com>
In-Reply-To: <b3e95451-77e3-7e4d-bb2c-664bdbaae9c9@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 1 Jul 2022 12:15:01 -0400
Message-ID: <CAFn=p-Zf_RfXgtHp_DMO57ggLWWSVSaRqm62CUte0ODuesDb1w@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] tests/qemu-iotests: skip 108 when FUSE is not
 loaded
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Beraldo Leal <bleal@redhat.com>, 
 Qemu-block <qemu-block@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>, Daniel Berrange <berrange@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

On Fri, Jul 1, 2022 at 4:05 AM Hanna Reitz <hreitz@redhat.com> wrote:
>
> On 16.06.22 16:26, John Snow wrote:
> > In certain container environments we may not have FUSE at all, so skip
> > the test in this circumstance too.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/qemu-iotests/108 | 5 +++++
> >   1 file changed, 5 insertions(+)
>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>

Hanna, if you want to take just the first two, be my guest. The rest
of this series needs more work still.

--js


