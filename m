Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E87320D89
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 21:17:42 +0100 (CET)
Received: from localhost ([::1]:49186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDvAj-0007Qj-4y
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 15:17:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDv6F-0005cI-DU
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 15:13:03 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:36153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDv6D-0003db-1J
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 15:13:03 -0500
Received: by mail-ej1-x62f.google.com with SMTP id do6so25939300ejc.3
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 12:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=b+jUQKBFjqagLKTvO8cYT/gEWyMTjcSM/fwlvJJBBBQ=;
 b=tKRwnc5Tb6sMRSLfh6Zk4iUFRkMN3TWTjIB55sWMmSDpvz5DImGZ44NsY15YsOadVg
 T/VpsJm77MVsmhoZEq12QymRrBNESs3wTOYGwuUlKu4A9rxZtrQlonLU199khuXCaVeg
 zIybcfKuu0BNgDk7IjXcYxTaVkSVRTUgJYNmjXhCI83/buJ+s5anA/AdXThv20GV95HN
 8JbeBiv13+Y+2/8rk1Acb9jyaBW6jLibpYJyy96jMr/GzcPmk4f2OOsESLTPWlgxRJyL
 03MW6qo6bBLskvGZmwHJllN00ZvuM938F8TZkzpKXgeHNaDUHa1z2QLcfdkviN7mNeO7
 Khfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b+jUQKBFjqagLKTvO8cYT/gEWyMTjcSM/fwlvJJBBBQ=;
 b=HkrQxnHWG4fz8R4WVUxqHjQpiXBRQQIzTykCkyl968qimeFWqyaoMXz//06HZm+gGV
 yB2v98epZgQTFdCQjncC4avBTpl17pvp5wc20Y2wwMfoYQc83fS2m+0uXVMkyHcotiQB
 HeZ3itgcH6ncGS7zKF9dHqAMgca5bnixxcjAHZyRGlAQYFA8WgwNnJTTwyxDldK/bij3
 +uJD4W7b/7z3GoD89QJK9+yANmAJAn+0IDYsLP815IavTwMYlD04jlquUZvXxC7XeXDv
 GMzYasb5Nt6Kj6aTK3btjeC7NB89J71QSxhtoXldhEShF/kjFqBSEj7mDVXplsy1SFCM
 Shug==
X-Gm-Message-State: AOAM532gOiuDDRtL/W7lfkIMQ3aKflzrjf9LGgdg7HY2mreO7qExWheF
 98p40toN0rIfg6QDhwAaJP4h5FJXo3C1jKFXjme8Cg==
X-Google-Smtp-Source: ABdhPJyN5KgOZnSxDlnYgPpR1O1c7kZxbp5e1tdA6N8+S684G1dFdHLaE19wbt9UZ69O2RAsRQUOOM+E3oC6sYybi0k=
X-Received: by 2002:a17:906:66cc:: with SMTP id
 k12mr1746801ejp.382.1613938379566; 
 Sun, 21 Feb 2021 12:12:59 -0800 (PST)
MIME-Version: 1.0
References: <20210210234334.3750022-1-f4bug@amsat.org>
 <b2c64763-f341-60ff-0467-d95a4daab968@amsat.org>
In-Reply-To: <b2c64763-f341-60ff-0467-d95a4daab968@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 21 Feb 2021 20:12:48 +0000
Message-ID: <CAFEAcA_K0hgEi-YerHTYAJ8B-PV0t=Z_=Faiob_+9J4DDi0BtQ@mail.gmail.com>
Subject: Re: [RFC PATCH] target/mips/cp0_timer: Use new clock_ns_to_ticks()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Hao Wu <wuhaotsh@google.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Luc Michel <luc@lmichel.fr>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 21 Feb 2021 at 20:07, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 2/11/21 12:43 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > Use the new clock_ns_to_ticks() function in cp0_timer where
> > appropriate. This allows us to remove CPUMIPSState::cp0_count_ns
> > and mips_cp0_period_set().
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> > Based-on: <20210209132040.5091-1-peter.maydell@linaro.org>
> >
> > RFC because this is just a starter patch to test Peter's series
> > providing a handy function which "tells me how many times this
> > clock would tick in this length of time".
> >
> > Also because we could rethink the MIPS CP0 timer logic to avoid
> > too frequent divu128 calls (painful on 32-bit hosts).
> >
> > The style should be updated, using more variables for easier
> > review. env_archcpu() could eventually be dropped (by passing
> > MIPSCPU* instead of CPUMIPSState*).
>
> I guess it is better to wait for Peter patches to get merged
> before posting the updated patches (not much, just one previous
> patch MIPSCPU* instead of CPUMIPSState*).

This patch is still on my to-review queue, fwiw (though I am
taking a week off work next week, so I probably won't get to
it til March.)

-- PMM

