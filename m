Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9038918CB57
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Mar 2020 11:17:48 +0100 (CET)
Received: from localhost ([::1]:50452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFEip-00019z-LD
	for lists+qemu-devel@lfdr.de; Fri, 20 Mar 2020 06:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35033)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jFEhm-0000Il-N0
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 06:16:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jFEhl-00082c-PV
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 06:16:42 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:46809)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jFEhl-00081f-Gl
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 06:16:41 -0400
Received: by mail-ot1-x32e.google.com with SMTP id 111so5381014oth.13
 for <qemu-devel@nongnu.org>; Fri, 20 Mar 2020 03:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MjmjrXlpICCcGFpXqDeMwaeOan5fSe1c8B4B3ECJrJ8=;
 b=kzAqEZSON1JmX3tqB4w5k4vzrbjyCqBvznMBJOjDy+RsvrdsMs+pGjgx+XaWVFx9e4
 ZqwLIHhleOnS7lZkrxeoCkx7sIPxUNYW9kA6mDrs3l41CIwGkBe6pFNEEQzafGBcIxix
 cSo1bfaqqUXiO78SYyWqn22v4sv4pY1VAL7hBDOHYU3IMaxu+Ec3I9iwsI9bG/+gdl8a
 eiHQ6bpSPeR9xbeSFPsr/9aX86fjHJ089in+4TYdZ8/RaqDNehVOGaTrotJ3GCoRdaN4
 yvDygqqKJsqldDXgIMQngpYPopGIDwLQvEMPsRX3BrE7OxPydmw/o487FgRmJjzwKjB9
 afjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MjmjrXlpICCcGFpXqDeMwaeOan5fSe1c8B4B3ECJrJ8=;
 b=PGzQk7MT/Z7dbSB6ue2EJL4PO6nq18Uv1CnupLS9BDFOhLOT1vy2uBfuXD9VvWVjqL
 YWZTep1kykQXw4nkDiW3NS7S5y+2ffUym4/4q4flfBd6rlcqS2Otug0Ir7BI2uT0lts5
 MYnBImpriIOCnXr7PuRqsSEyFwOtHWCGmG3Jhfr1zig4+p4B6a5MC6OTpJ3HMtO8tGZ0
 vqoT+AOvedxtRlzPqko5v60Lr9MAg+hYPKFAEam8v0MfjFVxEr89JLBG3pSGwHhThVFU
 Z15L5BSJZxhToV2ZgOTRYvEQ5WP8UIHsSCdW1AmhfK190vtWFkBvtt5H/G7YAnHXMOkD
 P8/g==
X-Gm-Message-State: ANhLgQ2L0TawgEQn4rZcH33tg6rbAos7e81dv0/IG7EAo/91/xWflCOL
 VcQXm7waTi2Wikuee+lVDXKpN0G6kysFDEOR06xIcg+vOzU=
X-Google-Smtp-Source: ADFU+vsuzOMYdq04hzfnlM/I2o03jviHyvEcMKYmbVIivhIMaMCv5vUJQSUdVFGlQHJrLUz82ppHmAI49sMwpG4+Mog=
X-Received: by 2002:a9d:1d43:: with SMTP id m61mr6046072otm.91.1584699400280; 
 Fri, 20 Mar 2020 03:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAPV47zcqvNekcUN=fKu1-dN=Sip3XR3+ohaG22-oNDm1dceJkQ@mail.gmail.com>
 <CAFEAcA_CeGozr3MUA6N=cMQVXLjoLD0ca-gywm+MLU4unfgwGg@mail.gmail.com>
 <39f82991-6d80-ba42-c7e8-4f6120a196ac@redhat.com>
 <CAPV47zfQKCaKS3BQ4+zbFJ1KyATqgOZvtaY9n-Gh_wtFCn4trQ@mail.gmail.com>
 <871rpojto4.fsf@linaro.org>
 <CAPV47zeQFEUhFmE6jgsehUUQKrYqjtqnfUfBdaKqaEy_e=fM=g@mail.gmail.com>
 <87lfnviez6.fsf@linaro.org>
 <CAPV47ze8XU6RceSrM9LUO58tdvP8mwShM4=_hee467n23eqn9w@mail.gmail.com>
In-Reply-To: <CAPV47ze8XU6RceSrM9LUO58tdvP8mwShM4=_hee467n23eqn9w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Mar 2020 10:16:28 +0000
Message-ID: <CAFEAcA8JVkreT3zGSuHpHQUmmshw9xmqaMVmbWeRECGPGHc4_g@mail.gmail.com>
Subject: Re: Qemu API documentation
To: Priyamvad Acharya <priyamvad.agnisys@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32e
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
Cc: John Snow <jsnow@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Mar 2020 at 09:39, Priyamvad Acharya
<priyamvad.agnisys@gmail.com> wrote:
>
> Thansk, I will check it out.
>
> To make my device I have used following link as reference
>
> https://devkail.wordpress.com/2014/12/16/emulation-of-des-encryption-device-in-qemu/

Watch out, because that blog is six years old. Much of QEMU's
internals have evolved over that time and so a lot of the
details in the blog post will be out of date.

-- PMM

