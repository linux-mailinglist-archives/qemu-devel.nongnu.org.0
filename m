Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3085E586685
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 10:44:21 +0200 (CEST)
Received: from localhost ([::1]:46100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIR2C-0001wg-1e
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 04:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIQx0-0005Ku-Mt
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 04:39:02 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:45050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIQwy-0002to-SC
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 04:38:58 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-31f661b3f89so101632137b3.11
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 01:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=csFAyM9lQpj9+Kd/tlS5/UVMlPxlAQnp4AlOQvXnlCk=;
 b=sQrlhg+xa38aPWt1AUv++aovecndlZa09aGN0v3wc4odgkghy2K0uG9w4RyCbzvREX
 KAJgCjKQbSKuGnsm47nks1BEP7lp0RFwrumpY1DpdxUSCddK+uP7n+xyC/LqEpGiZYsz
 hhfWUUr710CUlRHhbwgLFmDnklZ/BKqFVM/NKW9PG8Ar5NZEunwA91UkQ48F6UlCah2w
 ypsu1mZPJqpVBIzDpie6v8kTAm4fIKawBySlyrIgS+j0fQ0jePcSgPN/ZMXc0vLNZJtK
 5/Zs2Jvjv3C6K/dwmf1MdGQAlDFAt+dITpgUiAKV9bAN08qmnAVa45WnBp5iBTFIaM80
 4f1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=csFAyM9lQpj9+Kd/tlS5/UVMlPxlAQnp4AlOQvXnlCk=;
 b=tFky5uRG6b0tZ5WQ7Fo12oEdxRvTdhdtYbp60xRbZVQ/zvqNEmWGgTadQ1ks+joizI
 VRnVJ9MqAEewFrZ89s/xrtEYKdPfjmStqUHErgiXc0BJZ6tlMUCkm/uF6fhlwOUNNTis
 A6agYN2Q0T0SC0o44UbOg1X6GgV6sbFzo6yirzJHcc035gxheWvShx/iV2MYA2OmMfRO
 OgAF5TQI6Fcp4ORgJas7qHpIchgCLTdPmq0YdnLWsGbyTG2iMY+7tW5KJo3Zdp+Iie2Q
 xr1/VJ9iNS6CSY+nDkS4RK5rmrGjHVFVB1FuPQuJN/ghLtzyXl9KUwJGuCqXYePCup8v
 p3uA==
X-Gm-Message-State: ACgBeo1GKciB9KgrRyIFN0ZzccYOt43sjt6rHK6Bf/0dI/cXbIpQ9U/A
 TCGBh+MWpXoH1YcFAu+lAiDKQ30Wt2n0nZe0npmQwQ==
X-Google-Smtp-Source: AA6agR4QuaEdwLzudg/Oo6SOKKnlM/TVUFPuTevHNoWBrOUD0SnIWfzjwIEjubjxC+wx99pJhGohRBs0JA9TGqBI92Q=
X-Received: by 2002:a81:63c6:0:b0:324:928:c672 with SMTP id
 x189-20020a8163c6000000b003240928c672mr11264585ywb.329.1659343134047; Mon, 01
 Aug 2022 01:38:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220729140252.66572-1-milica.lazarevic@syrmia.com>
 <CAFEAcA-N-GPKqLeQtOWVMHvB-Di4inKK8Cy9XFjT62PMeiyBRA@mail.gmail.com>
 <TY0PR03MB6797A66CB742211212CD1B2BE29A9@TY0PR03MB6797.apcprd03.prod.outlook.com>
In-Reply-To: <TY0PR03MB6797A66CB742211212CD1B2BE29A9@TY0PR03MB6797.apcprd03.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Aug 2022 09:38:13 +0100
Message-ID: <CAFEAcA-DGq89==Mh9p5rPzjK8evp8vPnnEgdpdiyWj3VwxJsMg@mail.gmail.com>
Subject: Re: [PATCH] disas/nanomips: Convert nanoMIPS disassembler to C
To: Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
Cc: Milica Lazarevic <milica.lazarevic@syrmia.com>,
 "thuth@redhat.com" <thuth@redhat.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "cfontana@suse.de" <cfontana@suse.de>, 
 "berrange@redhat.com" <berrange@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, 
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>, 
 "djordje.todorovic@syrmia.com" <djordje.todorovic@syrmia.com>,
 "mips32r2@gmail.com" <mips32r2@gmail.com>, 
 "dragan.mladjenovic@syrmia.com" <dragan.mladjenovic@syrmia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 1 Aug 2022 at 04:18, Vince Del Vecchio
<Vince.DelVecchio@mediatek.com> wrote:
>
> On Fri, 29 Jul 2022 at 10:18, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
> > ...
> > Is it possible to break this down into smaller pieces so it isn't one s=
ingle enormous 5000 line patch ?
> >
> > I guess partial conversion is likely to run into compilation difficulti=
es mid-series; if so we could do "disable the disassembler; convert it; ree=
nable it".
> >
> > The rationale here is code review -- reviewing a single huge patch is e=
ssentially impossible, so it needs to be broken down into coherent smaller =
pieces to be reviewable.

> Something like 90% of the patch is purely mechanical transformations of w=
hich I've excerpted two examples below.  (There are 3-4 chunks of mechanica=
l transformations, of which I've shown the most complicated type that accou=
nts for ~60% of the changed lines.)  Did you intend to review this by havin=
g a human inspect all of these?

If they're mechanical transformations then:
 * the commit message should say what the mechanical transformation is
   (ie quote the sed script or other mechanism used to create the commit)
 * where sensible, different transformations should be in different
   commits
 * the hand-implemented parts should be separate

And yes, review means human inspection. You need to make that
human inspection easy by separating out the stuff that is
"just change std::string to const char *" so that the human can
do a 30-second skim over that patch, and spend the time on
the patch containing the stuff that's more complicated.

-- PMM

