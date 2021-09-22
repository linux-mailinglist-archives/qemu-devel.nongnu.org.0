Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361C7414974
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 14:47:13 +0200 (CEST)
Received: from localhost ([::1]:46808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT1ea-00059s-6q
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 08:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mT1cs-0004Ck-9e
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:45:27 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mT1cp-0001t7-Gp
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:45:26 -0400
Received: by mail-wr1-x434.google.com with SMTP id q11so6346334wrr.9
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 05:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MipNfkz7Nf1NrUuqmrUvxfk/BhvFLDdy9e8n769BM4s=;
 b=jAykGCXOXSZlzrxIWWA/UYwi8cIvmdZ2tzs5v5nFSQdSuITubhPJnilD2E1flp22Z8
 q352j2MyOHhnJKAdrLYsXQ+QFLzf/RZi5MbWiOaTBxZN5If97Ko+N9gPEt1Z59x9ycrm
 s/h5Igt9aCYUQk/leL8mfycAR4C4B9Aedo165DAFoQyZvYOGEejNUkFjMx4q4Ej29zp3
 n0UFGb0QvhM9Had01SamW/I3tq7TjUZlAWDS1puD/c0BgCUw61eJzclFBGGrsW1Hjm2c
 2jfmwwgi/bZv1Vfp5uCuuqeXrd1ALbZPUxLKKub3ty97BEi/gw/mkXSOYDx5RceUWqTH
 tXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MipNfkz7Nf1NrUuqmrUvxfk/BhvFLDdy9e8n769BM4s=;
 b=ZCoDJ5Or5mVKGioNjpCoASgEP/sV4WGexdyhXvS2YYEn7vWIMFUkLhXxlZNqXjONZ0
 QvwH3Ih/Z8k3thfjSav8ZFG9iyRoIKofuFpb5jsz//Qh8LCCmSavkAlliQuBOIuXdTCe
 SGMhkEHvrM42jGJ2+sIkJtiuh/+s1MY/Kk6jv6dtDcJgbxnqCOeYrbvhTn10Aq0pdvEu
 27e4ksJ2YeAH/BzfUYWJUHZV8RMLftbsf2NMlm2dJNa35ET9I0vgirb3T+xBcIEYsB/f
 6KHZV9jSOL0f3fCzo9KuOa7mHwdPh9Z6LMsMWlyi0RYolTHibKDquqJXZ4gd+wKMkn3d
 MgsQ==
X-Gm-Message-State: AOAM5315qzHUvg9vwH7pe5ZCXukz63z/KYqdXYW6bGJh0ZOlvd741MAw
 FOG+dh/TVIQhPdKjHfR4TeP7PyTYBLmz6c9eGDJsUg==
X-Google-Smtp-Source: ABdhPJzbolRcqeqwH3ApyA5lF2VHTQSjX0D6T5XmcXRiXSqugGCSxspaD6jg2qae+qfBg1NPO+yySI83Tiaz0RGKtNA=
X-Received: by 2002:a05:600c:4848:: with SMTP id
 j8mr10366151wmo.21.1632314719411; 
 Wed, 22 Sep 2021 05:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-7-agraf@csgraf.de>
 <CAFEAcA9JZZ4nb8WAvKVYpwqxb_E5NFOVW9rKF3u7GhFqfNZgOQ@mail.gmail.com>
 <8e219cb0-8b65-faf8-f636-5c1d24471f84@csgraf.de>
 <CAFEAcA8xs3x5WCqT+FnPYip=nbQx6=UEH90Dkjq48YLboV9qAw@mail.gmail.com>
 <CAMj1kXEEN+J4k_Kib8gRHcy8v1vVRwk7c847yT_Kuv+jnLf9ww@mail.gmail.com>
 <CAFEAcA8yd6m-S90Uq1G=HTYFAerp6cZdJk9B=CFrHMn5tEMZ5w@mail.gmail.com>
 <CAMj1kXGXbjrG4XanWr=-H=f5wsUk6YVu-oTA9A_np3F8ELNcxw@mail.gmail.com>
In-Reply-To: <CAMj1kXGXbjrG4XanWr=-H=f5wsUk6YVu-oTA9A_np3F8ELNcxw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 22 Sep 2021 13:44:27 +0100
Message-ID: <CAFEAcA_fxW0yKwxqBuDi8+ux-jtVKeJxNhDV1=ROb+VamLiZRQ@mail.gmail.com>
Subject: Re: [PATCH v11 06/10] hvf: arm: Implement -cpu host
To: Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Sept 2021 at 12:41, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Thu, 16 Sept 2021 at 18:17, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Thu, 16 Sept 2021 at 17:05, Ard Biesheuvel <ardb@kernel.org> wrote:
> > > I'd argue that compliance with the architecture means that the
> > > software should not clear RES1 bits
> >
> > Architecturally, RES1 means that "software
> >  * Must not rely on the bit reading as 1.
> >  * Must use an SBOP policy to write to the bit."
> > (SBOP=="should be 1 or preserved", ie you can preserve the existing value,
> > as in "read register, change some bits, write back", or you can write a 1.)
> >
>
> OVMF preserves the bit, and does not reason or care about its value.
> So in this sense, it is compliant.

Hmm. Alex, can you give more details about what fails here ?

> > > but I don't think we can blame it
> > > for not touching bits that were in in invalid state upon entry.
> >
> > SCTLR_EL1.SPAN == 0 is perfectly valid for a CPU that supports the
> > PAN feature. It's just not the value OVMF wants, so OVMF should
> > be setting it to what it does want. Also, as the first thing to
> > run after reset (ie firmware) OVMF absolutely is responsible for
> > dealing with system registers which have UNKNOWN values out of
> > reset.
> >
>
> Fair enough. But I'd still suggest fixing this at both ends.

Yes, the version of this code that we committed sets SPAN to 1.
(This argument is mostly about what the comment justifying that
value should say :-))

-- PMM

