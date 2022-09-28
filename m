Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA5B5EE013
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 17:21:15 +0200 (CEST)
Received: from localhost ([::1]:59316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odYs5-00065T-Br
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 11:21:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1odWcN-0003PN-Dp
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 08:56:52 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:40752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1odWcL-0002d9-2k
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 08:56:50 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-324ec5a9e97so129597907b3.7
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 05:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=8MU5deADsTJBWwG5pMZWqM9J/RZWkGJTH5c0evkGUbE=;
 b=bGw6DNyhFOkthBge9qRiFu84/Iw9oaSeGQvDnSllIlmuIciAQFteOyNrGdhFaP0sas
 mU+lcmezoChziKUGYC9Rj4egBVx4LfokHcqtxGAeq9PsyY9c0827hslXCmIJAMvtQNSV
 RdbAf/DRG6teQleNmWnCFB2FldcjN0i78eNH561UwvqgSoadqLx0HiNibc4nC4/roUEF
 5lmg/jEoolaUqeeUS32VzPd9jX4yz3eLA4l0B+UUSzqbp0g+DIcWDoVhisPBHPBMOTIj
 PcwVURMedLKRTg9gSf5rBr+Uz7A92jT6RbYaNHfMp4/LEDhKXeNcxx937huzFymTJFsa
 aSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8MU5deADsTJBWwG5pMZWqM9J/RZWkGJTH5c0evkGUbE=;
 b=vHJMMDKlsvgrztyx+gz6DfKcpjJU6yvBfTmJuligku/OAIZpQniwIFhMtAryiBLYUq
 +9UM+xGwsdrmJDMga2SAUN4Nd83Ymqw7khwLIFZf9YhTBpsMVki4b/uaMWoWhG3DrW5w
 UJscKmKh/+7xNJIxM9T8BIyZe8ydFRnJ5sZtePo/Ovh+5aE16c40X3HrS8OZJYzi9xmR
 p2rP5djgTnimCP423X520zHarNuRboZwXAk7eiHYShS9XGDOiq4Fv80YraC9Pqj1D3SO
 GJD6/zZ44ugyRKxcSaiAkl8fZ6is44lmPsQssoY4AyPdgxmspRbcpHi7IOhMZmFncF8g
 7H5w==
X-Gm-Message-State: ACrzQf0BS8TDc7q9RyXYcM7fXJNBReE2qdXVLc4eVaXSnoaEimrFXAbB
 RSNgSwgL+0uKIki5SFcXmGmO4z3x2sNGuYnDHr8=
X-Google-Smtp-Source: AMsMyM4kAebgxWJWDD8MwVHCE9PfQ1QgbyGzpc74gM1oYjCpSSlwLigjNdS+eAo1RukfmqrxSMcfOcdmbPffc7ZSYM0=
X-Received: by 2002:a81:66c5:0:b0:345:3b1c:26 with SMTP id
 a188-20020a8166c5000000b003453b1c0026mr31454993ywc.156.1664369804544; 
 Wed, 28 Sep 2022 05:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <285e1375-82c4-556d-54fa-abba6b8e8e77@redhat.com>
 <CAJSP0QX13hF2_qSvO0Hfh=DtyurhkXyJKnrzWTSsTtURueTV6A@mail.gmail.com>
 <YzMcobeWVAnHUkNu@redhat.com>
 <CAJSP0QW_An5ypmsaXaVeHNKKzW0+x2Pmp8bQtPfVxPCqgAwFCA@mail.gmail.com>
 <YzM5i5QP7NQq4OHV@redhat.com>
 <dc108d7d-297b-5a84-68dd-12da3a0e68d0@redhat.com>
 <YzP2k5GBb1lKsqB8@redhat.com> <8735cb3cq5.fsf@linaro.org>
In-Reply-To: <8735cb3cq5.fsf@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 28 Sep 2022 08:56:32 -0400
Message-ID: <CAJSP0QXGn46pYZL03t9GHWfgueEmLZRPm9h-9RhwDxveqSEMUw@mail.gmail.com>
Subject: Re: Should we maybe move Cirrus-CI jobs away from Gitlab again?
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Wed, 28 Sept 2022 at 08:28, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
> We shall find out soon enough. The code came through today so I've
> applied it to the project which shows we are now on the "Ultimate" tier.

Thank you, Alex!

Stefan

