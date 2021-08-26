Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1233F8B66
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 17:59:40 +0200 (CEST)
Received: from localhost ([::1]:35234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJHn1-0004JJ-RJ
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 11:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJHlh-0002l6-WB
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 11:58:18 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:44599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJHlg-0005NX-6i
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 11:58:17 -0400
Received: by mail-ed1-x52f.google.com with SMTP id n11so5361208edv.11
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 08:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x8HLouG6vR8xJruVN3+GitwzwG5c5IrzFg27WCrcaks=;
 b=s9jXA79tE/h7SnHYq3irW1BbKkjboyINlPyd+EVzxwJnZfrMGGrPKsSN0O0OLz/Dx4
 3pPh8nYmhsy8zllPFjqEonWx2dLEKmZQl+860XDe4p1V7SWCx9z8Z/Zfj1gf+JfYvoqN
 mV5/PwYD25yTqr5mp2cehfCpCGSNWUBATNV5wgXcikMDdTZpjap8Yr+yAu09W7s+arhs
 1pOjqQ540+bYuRZXT7JMTgDWI5SsVFyWo7KKlWBJ3YIYDjEXz4rlQ9US2JBfidwKmow+
 BPiiebTJHAchwLssFsyVd5InzjOF+k25LS3wNwvV7hkNofq6amjeHdiRlrRE3Sc++btP
 G0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x8HLouG6vR8xJruVN3+GitwzwG5c5IrzFg27WCrcaks=;
 b=VLdgtBc2Z05EgXye2TTYs34uscS8muT3gd9U91RUdJ/k4crRLQl8ALsCATIHobqUlC
 wEQgs+bjdkGeKB7NPlsT8qQGEGy8n2ITJYzUnRWWxjMdgwCQEIMP+9LGlvRhfVuDnD8d
 p/FSgD9xjLcLBWNHupiTjWO6EEbEv+QAoZnh9/gIANZeZV2hZYMbj8VC1+zhySHHJBsb
 SZI1bmOT3k8t9jbbOu/TOFL90BjT5YX2vGl4cjGUDhh1AS0F/ryYBSmKafeo4Mh7cDgc
 7UIp/PXZrqmyALaXUqEEDA0BsveRSpE70PIo7IlzSGc+IxXVSrpXP4oxUSXbIyRQZ/VG
 xBKA==
X-Gm-Message-State: AOAM531ZtR+U1dgwY+APEUYyy3QJP38Tg9Fo4soVCsXkG4W1pMwmouuy
 rgvaYyUpi1QMCbiIfPFQveaO7in+kQECqXstPeKfsA==
X-Google-Smtp-Source: ABdhPJyAr3Vm7F2VEYtHRf8X3xHrZvpRo3XKOICNXhgyf0MjkSEisBHuC4S+m8ddIb/99pjRTHaWnSA0yPPhVQe8ZGc=
X-Received: by 2002:aa7:dd48:: with SMTP id o8mr4879930edw.44.1629993494794;
 Thu, 26 Aug 2021 08:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <49C79B700B5D8F45B8EF0861B4EF3B3B01142F5748@SHASXM03.verisilicon.com>
 <CAFEAcA-L-9AjGGLCynbDbF=apQe4J_CrWE7RFKddHiD1L1qKHg@mail.gmail.com>
 <49C79B700B5D8F45B8EF0861B4EF3B3B01142F5A05@SHASXM03.verisilicon.com>
 <CAFEAcA_g59GdK+X366xkWj+znz8B_TTufBMvgvND9TS+dnjEdA@mail.gmail.com>
 <49C79B700B5D8F45B8EF0861B4EF3B3B01142FAC4C@SHASXM03.verisilicon.com>
In-Reply-To: <49C79B700B5D8F45B8EF0861B4EF3B3B01142FAC4C@SHASXM03.verisilicon.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 16:57:27 +0100
Message-ID: <CAFEAcA8imTqu1YGfWaOw2-9GUZh_X3rRoUbbFNJXfX4c7H-uaQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/smmuv3: Support non-PCI/PCIe devices connection
To: "Li, Chunming" <Chunming.Li@verisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Liu,
 Renwei" <Renwei.Liu@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Aug 2021 at 09:22, Li, Chunming <Chunming.Li@verisilicon.com> wrote:
> Sorry for interrupt you.
> Could you help to check why my series patch cannot be listed by https://patchew.org/?
> I split the patch into 4 commits with 1 coverletter and send them out with v4 tag.
> I can see all 5 emails in https://www.mail-archive.com/qemu-devel@nongnu.org/
> But https://patchew.org/QEMU/49C79B700B5D8F45B8EF0861B4EF3B3B01142FABD6@SHASXM03.verisilicon.com/#
> show " Only 0 patches received! ".
> It is great helpful If you can help to check and tell me what mistake I made.
> Thanks very much!

I guess you figured out the problem already, because v5 has them all:
https://patchew.org/QEMU/1629878922-173270-1-git-send-email-chunming_li1234@163.com/
But the problem was that for v4 the patch emails were not sent as
threaded emails following up to the cover letter (that is, they were
missing appropriate References: headers).

-- PMM

