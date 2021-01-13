Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 985C52F4D35
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:36:09 +0100 (CET)
Received: from localhost ([::1]:60286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzhFo-0000hR-LU
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:36:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzh3h-0002Ad-25
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:23:37 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:36100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzh3f-0002Zg-F0
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:23:36 -0500
Received: by mail-ej1-x635.google.com with SMTP id lt17so3348519ejb.3
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 06:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=i/dmvCun0QC9M0QawG6fRn8q98MJ/fUz+BfO8SI/p4U=;
 b=AS8CaUsAUcUWXfCVON2yIFtPiPrjZ3Yyx8XobePvtHixQjKqfZEy9pMH4j6kM3agA9
 mVkMU3ft14678uPhdXtwXXOJ0pB42K3gu/bHhWJiBSFdRWKc5VEvYoQSsAVjGESJ2T1r
 CId8Q4Uqn1LxeLoQ/PCEPNeDBsXQ/UEmPEICdHBnT12dx0rRsqIJkALLk+oFzg7jVOyz
 OoBsnTL0dY9G/HZzzvh8fz9t2xLjrHLbEGanYJy15Y7HRd2r/CazppQXOT8hogZL2DUM
 vmShSl2lXwmRlAfV/VpgHF/NKV7VKt1QNp28vJkWzPOcY3sKREq+cnULFuPYb2Vxceaf
 iEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=i/dmvCun0QC9M0QawG6fRn8q98MJ/fUz+BfO8SI/p4U=;
 b=CuTslGKy5IjumzMqF3WEZUMEXOA6UxxP36KUQpbA+9vO9E0LdrGstP4UdXj03B3/Xx
 FUr2yoC/V/OCJK8Pa2HB94lBxo+FgvSI4VIRfTVifw5Z48KPv++mATJvlE6iSSpOroA/
 WhVriUFnyAu20tR5/owaBdVbV5cKvGUopA3kKiD/VkphbSFhKvjYs7I9y0EoklQkaANh
 dekPDyQYtmj3ysB3hlSHCHi0fZ3vJzAq5K2e3y6XcwDEjYLTk2bCYG/N9vYYRM/DDwrl
 9CQNlKe/h/vphfA46XZU6dZyPuOXjmKk5uII+LGFxWX7+QGfgCAeFuJmAkB4/S+CLLXV
 Qz0A==
X-Gm-Message-State: AOAM5339WlDtDAR6UMpGm7tZ+hg3NQRdcBBgMnt2rwigyOI4ZEPMEFL+
 chlQblL+y/NhUERErUxTtGeEjQ230jlvQX9EOw+tWA==
X-Google-Smtp-Source: ABdhPJwX+99RLHzIG3vsxnQ/wvAdKukTYH6Os9Mp5cBXXTiu233j5PnOxx3GG/1RaXTF6XizqYQPIxcj2kxXiijCWGY=
X-Received: by 2002:a17:906:195a:: with SMTP id
 b26mr1706004eje.4.1610547814057; 
 Wed, 13 Jan 2021 06:23:34 -0800 (PST)
MIME-Version: 1.0
References: <20210107140039.467969-1-pbonzini@redhat.com>
 <20210107140039.467969-2-pbonzini@redhat.com>
 <CAFEAcA9yyUUmd+hj6kgAV8KWtCC41Q55JRfE0q1zTaDaOofgOQ@mail.gmail.com>
 <a5cd4c43-2f12-2dbf-8db7-21acc7abc73d@redhat.com>
 <20210107160653.GD1029501@redhat.com>
 <d1b5a493-0658-3bba-b1b4-0116f337031d@amsat.org>
 <46e79fb0-2ce1-35a8-3ce8-44699508a1d1@gmx.de>
 <20210113135705.GC1568240@redhat.com>
In-Reply-To: <20210113135705.GC1568240@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 13 Jan 2021 14:23:22 +0000
Message-ID: <CAFEAcA8xTCq50bBZXams1ryzTkxNJq0M8WNnzcSGu=hJSnP+4Q@mail.gmail.com>
Subject: Re: [PATCH 1/8] build-system: clean up TCG/TCI configury
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Helge Deller <deller@gmx.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, debian-superh@lists.debian.org,
 Stefan Hajnoczi <stefanha@redhat.com>, debian-hppa@lists.debian.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 13 Jan 2021 at 13:57, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> The question still remains whether anyone is actually likely to be
> running/using QEMU on a sh4/hppa *host*, to emulate a different
> guest arch ? This is what that TCG interpreter provides for.
> eg would anyone really want to emulate aarch64 guest when runing on
> a hppa host ?

If anybody does, they should provide and help us maintain
an hppa backend for tcg (and resources so we can CI it).
TCI is going to be so slow as to be useless -- you might
be able to tick a box saying "we built QEMU for this port"
but I find it hard to believe anybody would actually use
the result.

thanks
-- PMM

