Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D646AE0D4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 14:39:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZXWh-0004Fu-Aw; Tue, 07 Mar 2023 08:38:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZXWd-0004F9-4h
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:38:43 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZXWb-0005eO-Gn
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:38:42 -0500
Received: by mail-pl1-x631.google.com with SMTP id i10so14044727plr.9
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 05:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678196320;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JY6zeqUTJQ8gDSbsAEDMbXj5onJ9bwd54nCzKd4hmpM=;
 b=JhkyImXSNMVmcdTvhhH5DoeH0yJIdJsSrfwWTt8BFVjaOoStLFVT4xl1mcFeYR2B6v
 GgW/DXx/mCKmeTg2mAXuJ79Qkg9xdNm6XTNRY1wqR0giWQb8uk4kdW9VA6BJCy9ymejs
 TuNMK54bcAUJd33hXA1/htrxf66HTrzqZfV0ncnTGQX0PpwSQBB/YgF2ftkKq/70b2RW
 swVi2b/fD6SOH7gbNaZVtj7/93lxDAssaZK0U/tg3/Umn85NQOtHYCukxG0maMEirALy
 nkHQMCEnUx83OdeDQX9nCRyP8kf4J5WXXBctcPP2UrEfb70lvpotKdS+1F45jKa1+0kz
 WfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678196320;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JY6zeqUTJQ8gDSbsAEDMbXj5onJ9bwd54nCzKd4hmpM=;
 b=UPxLLN/WPTq44bcMP35QW+BKb/fwCCA+lQ2tbangPBdQs59h/a3MhEYW5JfIBLD0c9
 Aqy3MsPlGjQ/c9+FrESBUyTmAh4eXc3iESYgv1nME7UcntZ/ge//AgWaFVG4KlW+VL99
 iAEU6tfRZ7ztGiADOJKoMgVzc5CZkU0pic+fgkvtpF84AYtTECp7GV3mQ83Iws+OVegy
 tgyA6NQTk2rQM0zIsBsKn/1He7lLEUZQnQB2tS3i1hCseOIXYt4F63JUWxvcu3SeFaLS
 ugg24FPV4OapHrL5ulEJmBkPI/zSuFZ7LEm9C+jDFJzsWY+ibd75ujr2l1vR2K+96YN8
 v/oQ==
X-Gm-Message-State: AO0yUKWEH/fsnnm5j/PjcZPcT9V0+iPfGr+NusOCsah6bP3aBIdg26nV
 cG4C557Ow2RTd9vD3b/Z6LUXYRkKRSO5YRtjfJ6ulg==
X-Google-Smtp-Source: AK7set87wRV8PY20mbuVX/yJPJ6Fryayd5/F0BAUSkzyG0fXqVezIovUdsELH6HkZuZk0JEdTDWErefE3tAuKSpp8Nk=
X-Received: by 2002:a17:903:3293:b0:199:1a40:dccc with SMTP id
 jh19-20020a170903329300b001991a40dcccmr5653722plb.9.1678196320093; Tue, 07
 Mar 2023 05:38:40 -0800 (PST)
MIME-Version: 1.0
References: <cover.1678188711.git.balaton@eik.bme.hu>
 <3f09b2dd109d19851d786047ad5c2ff459c90cd7.1678188711.git.balaton@eik.bme.hu>
 <10178ae9-e306-0885-a14a-20fc651a8494@gmail.com>
In-Reply-To: <10178ae9-e306-0885-a14a-20fc651a8494@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Mar 2023 13:38:28 +0000
Message-ID: <CAFEAcA8Xr4G7N8a-4YuduNuea1J=R24t5Ha8wHrbnjt4ZOqecA@mail.gmail.com>
Subject: Re: [PATCH v9 2/7] hw/intc/i8259: Implement legacy LTIM Edge/Level
 Bank Select
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 philmd@linaro.org, 
 ReneEngel80@emailn.de, David Woodhouse <dwmw2@infradead.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 7 Mar 2023 at 13:36, Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
> On 3/7/23 08:42, BALATON Zoltan wrote:
> > @@ -168,6 +186,10 @@ static const VMStateDescription vmstate_pic_common = {
> >           VMSTATE_UINT8(single_mode, PICCommonState),
> >           VMSTATE_UINT8(elcr, PICCommonState),
> >           VMSTATE_END_OF_LIST()
> > +    },
> > +    .subsections = (const VMStateDescription*[]) {
>
> Checkpatch will nag about it claiming that we need spaces between '*'. The maintainer
> can fix it in-tree though.

checkpatch nags because it fails to correctly parse this piece
of C syntax and thinks the '*' is a multiplication operator;
we should just ignore it in this instance.

thanks
-- PMM

