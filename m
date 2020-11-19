Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7352B91F8
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 13:02:43 +0100 (CET)
Received: from localhost ([::1]:46184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfieA-0004Ot-6M
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 07:02:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kfiaf-0002ma-SE
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:59:05 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:45842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kfiae-0003uB-6g
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 06:59:05 -0500
Received: by mail-pg1-x535.google.com with SMTP id 62so4005144pgg.12
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 03:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IG0zKWhL4ch33frcwVsIa/X/bO2EOG1e+CVYlZualHw=;
 b=dt6LMhF8DUDbTSytJqAcPwB61GAbYgkzEZln9vfrPsmLbxdJ31FyGl4RB+zXwHyIgg
 6IhmWxkR2/BVWysDqCsa54vJk4kxqGHpJI2w48AXMm+k4PVI1lhBWjBTY03KXoL2ccVz
 jwoWCup9rqfTY0beQboCDKu3VsXRgOuOlUECDG8WV5/W6kWgU/yw6DX+z4lV7qSjnAa3
 QgWBIioyn8JrVwGn8jpOnkM1l1y5yptKhVwj9TbBTIW1tgUe3K7IZkJMqT5jNqOdxBLV
 OIrPDrMlPKPbrDdOatAEWV81G9yMZgKAwo9edCPl+ZGN4AGsUQa8ZrmH3a2FEO+7j7ab
 pGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IG0zKWhL4ch33frcwVsIa/X/bO2EOG1e+CVYlZualHw=;
 b=PdEevTziu1aUiKDtiIRaqELvHdIFE68+v1Gjyfz3eSCAH+H597oaYD8ZLBrlmiesMa
 /Ji4AfQoaVGa0ndhNrMux5TAmY4KuT8MlDL7lOAwDDBgStiPrTcRr7ouxd+QDH7fgvyn
 k1cEPQhp0krrmtdvpGTrCi0jfMJi4zqSEGWpMe/EC0xqv+xud+FdqDXuiPEUtyCapiKp
 fAQbNUS+M/MRTgJgYKBcsUkmF2M6v5ZA5WzwGeIfjOm9y1JCWbAOuQiO/ZiOu2WoxG1B
 8LEBkG5rstk4IkvUqFgb2LyMZkMf3ZGCbnd/Mh6xiKj5vroGbmGGGXgI2KxNF62LNCAO
 CJnQ==
X-Gm-Message-State: AOAM530VrPt2NkcM5a3VBBvMk3eHrASITCWOiXBeqDo9sEC+faSlsK1n
 GvdaGliDPoUHcYRASKnYFTRwf+jo0MdDslN1Bnw=
X-Google-Smtp-Source: ABdhPJzXT/hlJy6A0kH2sRmSgvyx5eTR750G14NlyL3RfnoMWMm3+3T6z3U/GilYpWOFzeK2I+hycZeZTDiOtcAVDJk=
X-Received: by 2002:a17:90a:2a49:: with SMTP id
 d9mr3972493pjg.132.1605787142299; 
 Thu, 19 Nov 2020 03:59:02 -0800 (PST)
MIME-Version: 1.0
References: <20201119112704.837423-1-stefanha@redhat.com>
 <fbe8f975-45a7-02e0-4765-b958630f6f2d@redhat.com>
In-Reply-To: <fbe8f975-45a7-02e0-4765-b958630f6f2d@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 19 Nov 2020 11:58:51 +0000
Message-ID: <CAJSP0QUAFLUT22pos0YVagyCyJ=L-bGkGMgBHEVYnSCVX9Mpng@mail.gmail.com>
Subject: Re: [PATCH-for-5.2 v2] trace: use STAP_SDT_V2 to work around symbol
 visibility
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=stefanha@gmail.com; helo=mail-pg1-x535.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, "Richard W.M. Jones" <rjones@redhat.com>,
 "Frank Ch. Eigler" <fche@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, William Cohen <wcohen@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>, ddepaula@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 19, 2020 at 11:45 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
> On 11/19/20 12:27 PM, Stefan Hajnoczi wrote:
> > diff --git a/configure b/configure
> > index 714e75b5d8..5d91d49c7b 100755
> > --- a/configure
> > +++ b/configure
> > @@ -4832,6 +4832,7 @@ if have_backend "dtrace"; then
> >    trace_backend_stap=3D"no"
> >    if has 'stap' ; then
> >      trace_backend_stap=3D"yes"
>
> Maybe add a comment? (no need to repost if you agree):
>
>        # Workaround to avoid dtrace(1) produces file with 'hidden'
>        # symbol visibility, define STAP_SDT_V2 to produce 'default'
>        # symbol visibility instead.
>
> > +    QEMU_CFLAGS=3D"$QEMU_CFLAGS -DSTAP_SDT_V2"

Yes, that would be helpful.

Stefan

