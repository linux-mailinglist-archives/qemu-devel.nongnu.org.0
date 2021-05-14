Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6779A3805EF
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 11:12:01 +0200 (CEST)
Received: from localhost ([::1]:45846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhTrU-0002dP-He
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 05:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhTq8-0001vE-2r
 for qemu-devel@nongnu.org; Fri, 14 May 2021 05:10:36 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:39625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhTq6-0003W8-LN
 for qemu-devel@nongnu.org; Fri, 14 May 2021 05:10:35 -0400
Received: by mail-ed1-x536.google.com with SMTP id g14so33945252edy.6
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 02:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aQX+ykoFZf/ZIYqOOZL6rf8hzzXGqebIU7T4Tnrjp/g=;
 b=jvQYNXSHMSjHu4xD4fPexCtTmPugFD7dbaecfP72Uu6s5hBqBouDOJR998E351jlo4
 PNj+dpF2rUb4pJMmU0dXbs0M/SE2JTf/7s4inaDxcLbi/BcQELFEho/y/o5zdGlfIzNt
 Q/WRYbvLfnA4rVQficP2p+FdW5Ek6bxz+OqvwtqPRBI8tIKQ4EH5CyD0ypjldDJ+SRhs
 Whl/btA0J0t+iI0zHCLBieW6DFBFvhXUIOYYa2W49//esvSm26QGhXUTRFl2Ac1inXK6
 vAdtRSy/aVAuz4ULsvOLfc4cAaOOHhuNz5B7rgrV1Obvao3+VkMNJ0/WjGxVBwffF+px
 RoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aQX+ykoFZf/ZIYqOOZL6rf8hzzXGqebIU7T4Tnrjp/g=;
 b=jmRyKqGA1v4ZBI/D3d+s/jmsdpTzPhi4pYlNH8K/SuhWUDnhUR97isOX4nT0TFSm4H
 8dGKmP3msQFvRkp6zymk3V5GoG0ovSk+sAbJsIqG9XNUh89Hx4bTQGSAUbwWGGi7muLk
 PoeNPA1GpRnNb2i5iYrxAW8ffDPN1NDJgWhItN+WZnvRBcfaxbYfoaifi9LKqUZQOeVs
 vuzlm7Tz4ajIdSd+RBlAuxBgXb/U7Jx2CVCT3JWsQRH2Bsp8cB4HXuW/Mk7Jt/T/ZTLs
 B+8epModZpmDBq+l2gBH56f2ACBWCunekTmq53cSNgMGpu5LogLLyVuTSnqOC8DljcKA
 ecnA==
X-Gm-Message-State: AOAM530j6gsDCrfMCwU0FFg598n4GQcH27o2ZALuMHU2mIJQDcHaqzuV
 uRPmEcnsK7vHwEEGSgu/JUSyOKk4Daz4h0Eo5EpPaw==
X-Google-Smtp-Source: ABdhPJw8XHGWS9yLKuH7x7O+ToF4gq5kRi/DqzllZYKGYM/B1SdkDNIqq6i2Sa7pFKzAD/NAlg1M2UUCqqaXM5Slkgg=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr54557893edt.36.1620983433253; 
 Fri, 14 May 2021 02:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210510130617.320981-1-marcandre.lureau@redhat.com>
 <CAFEAcA_mj-9EC2WhUKd4QN8xGk4JMjyr6_ycOD5ukZAGRdrjMg@mail.gmail.com>
 <CAJ+F1CLB4uMQsggZKX5kGBtSr14rZ7mW5rr4dwMi=hn4TTpHag@mail.gmail.com>
 <CAFEAcA8L6Qks-bZtbpgbmSaKcGB2waTEKpOtvZ_PQ7vxdzZ2pg@mail.gmail.com>
 <CAJ+F1CKBk2450Y85bcyneYHCbzBFq42Cruf1fRunXuzWB8sUVA@mail.gmail.com>
 <CAFEAcA-ED+C+hnK_4jfK5JRLQ5mFW=XM-bPnD5O1ZmnEFH7XbA@mail.gmail.com>
 <CAFEAcA_zT-LW1eApzs5+TZLWkigCokY6S2Dc46pqVyiDuMLTUw@mail.gmail.com>
 <CAFEAcA8qV0Re8AYHpW14-1wkUcGacO7E6+ta-DWwj-9pN0iVOw@mail.gmail.com>
 <CAJ+F1C+V=x8=tcm0WhtFxS5P_4WjLNVXOVKEnvgWpmFDwom6-Q@mail.gmail.com>
 <CAFEAcA_BTwg2KyyfsG8Q2_FFzKuYN+5J0X85OBpN-x=-5PFANw@mail.gmail.com>
 <CAJ+F1CLeNCe_Z3kFJo8j-OU14RnDQesiqF_3mCuYCd1Xtn7Tdw@mail.gmail.com>
In-Reply-To: <CAJ+F1CLeNCe_Z3kFJo8j-OU14RnDQesiqF_3mCuYCd1Xtn7Tdw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 May 2021 10:10:21 +0100
Message-ID: <CAFEAcA9LD1V6AAa9VfK50BKY3ZZDypTDJ4ZDEcBdjMW-jTLaXA@mail.gmail.com>
Subject: Re: [PULL v2 0/1] readthedoc theme patch
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 14 May 2021 at 09:01, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Let me know if you want a new PR.

If you could send a new PR that would be the easiest for me.

thanks
-- PMM

