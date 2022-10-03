Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C2C5F2E56
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 11:44:07 +0200 (CEST)
Received: from localhost ([::1]:57110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofHza-0001p5-It
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 05:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofHiL-0006EQ-BT
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 05:26:19 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:46651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofHiJ-0000WW-Mb
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 05:26:16 -0400
Received: by mail-ej1-x630.google.com with SMTP id bj12so20769124ejb.13
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 02:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=ukl2c7HOPkVUpYIiTqdUUWuOkd/WXNo63GyYxNUz75c=;
 b=oig42PM3SUstDClwOA/ataFD5nTKKI2OXv2Bw/8NQF6eag6WyuenQvNR1eQjPsUK/v
 Cj48FEtA+HwRmZ5oUdpXB/UWdr4K7555Ed8TnWdCpmokK8lAaDcdEFrm+UEUVC8iQhtp
 rP+0e3+bsJUtHgxrnDj2mM25A7xX8JL8bFLalebDsdSs27cX+6uE5kiKtmY+IXW0fNfI
 wbQ7qB3ZqIeQ93F7fN8MNwn0P8h3Twh9BlWMfT199c7wC7xCrWzH4h8Dtcgf3eOOX3hc
 qWbfvwIYYZGE9VPtkDBLKwao5yqxhZNVtx4SU7nErdEfA4Ql+h6s8YXMqVRgy5ean17J
 +6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ukl2c7HOPkVUpYIiTqdUUWuOkd/WXNo63GyYxNUz75c=;
 b=Baz6PIjVIwTjeOkzll3iZiolenn2h9pwo+GkMAPyhRgyJrab/d8zPRQP3xDNXhFryw
 7JKGvfROEuk78OrsLf4c5eAew0PIVipz+lmEbE4IqKRxvlUNvt7W4vbTAPt9axWmAV4M
 LmrDVTO1teZ6hxqnE82fAFkYU7axMbXBdpa2L6AR7HX+940hpP2T6wEZrp/2lLwpAuzl
 bC7YXwz/SvdQeOOJZ41hDsBN/9Q9KCIJf5TP92wT4ilBIOrlNiBGEEK6gisOTp57gaxM
 6h8uL5Z4U892q9JwfFbvCTnXkaX5dz2WSzImErhlAv5vzSeDdIupL/DjMx+1h0qzkcAE
 nAiw==
X-Gm-Message-State: ACrzQf366DgcuGx8mBHr0fx/Fvj/0ssDTkYQ91r7Ak+oRiqs4ZUTrRhm
 ard2LeWI8OZ7DAeoFt0u2nheH+nED430hpu4h7M3LQ==
X-Google-Smtp-Source: AMsMyM6CX3NhF/ajs+B/SIYW5+JT6B29CalRAXK6F/D+IDQblMu9KJaWyc1O/5ts72HBieYgiyCvjHgoPhbrnq6MaFo=
X-Received: by 2002:a17:907:2bd5:b0:76f:591c:466b with SMTP id
 gv21-20020a1709072bd500b0076f591c466bmr13853190ejc.504.1664789173927; Mon, 03
 Oct 2022 02:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <a7da7e40-6f7b-79a4-709b-da0e71def650@redhat.com>
 <93033078-221d-23d2-23e7-13eab59cd439@amsat.org>
 <CACGkMEsQSn_GOBcs64JEDUHt3T7XOBL3LLM7yvqwwR5xvvD2dg@mail.gmail.com>
 <a25c238b-dabd-bf20-9aee-7cda4e422536@redhat.com> <87o7utnuzp.fsf@linaro.org>
In-Reply-To: <87o7utnuzp.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Oct 2022 10:26:02 +0100
Message-ID: <CAFEAcA9YyN802x43+K27Hv1-rvkBbxE2r5sfxxahwmJtFAEP=Q@mail.gmail.com>
Subject: Re: If your networking is failing after updating to the latest git
 version of QEMU...
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-discuss@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 3 Oct 2022 at 10:09, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Thomas Huth <thuth@redhat.com> writes:
>
> > On 29/09/2022 04.32, Jason Wang wrote:
> >> On Thu, Sep 29, 2022 at 1:06 AM Philippe Mathieu-Daud=C3=A9 <f4bug@ams=
at.org> wrote:
> >>> Jason, Marc-Andr=C3=A9, could we improve the buildsys check or displa=
y
> >>> a more helpful information from the code instead?
> >> It looks to me we need to improve the build.
> >
> > I'm not sure there is anything to improve in the build system -
> > configure/meson.build are just doing what they should: Pick the
> > default value for "slirp" if the user did not explicitly specify
> > "--enable-slirp".
>
> Shouldn't it be the other way round and fail to configure unless the
> user explicitly calls --disable-slirp?

Our standard pattern for configure options is:
 --enable-foo : check for foo; if it can't be enabled, fail configure
 --disable-foo : don't even check for foo, and don't build it in
 no option given : check for foo, decide whether to build in support if
                   it's present

-- PMM

