Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3693C6CD56
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 13:27:03 +0200 (CEST)
Received: from localhost ([::1]:36552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ho4Yv-0007ng-Pp
	for lists+qemu-devel@lfdr.de; Thu, 18 Jul 2019 07:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50038)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1ho4Yg-00075l-EH
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 07:26:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ho4Yf-0006Dh-ED
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 07:26:46 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:43166)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ho4Yf-0006DN-8v
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 07:26:45 -0400
Received: by mail-ot1-x342.google.com with SMTP id j11so4369227otp.10
 for <qemu-devel@nongnu.org>; Thu, 18 Jul 2019 04:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GKHj2X+/VhjotsAiucz6jWoSL0ct/kK8y5kIibgwfgc=;
 b=ntzxx8Yh6XNR533gmA9V5u/aask2bCE07iNZuxBWn5RerIPfIAgM5KTY+88ah8Ktp5
 pGgvnptIMSWYSAdc5z7QWuQK+2rorata900NnVapLtjVjnj9BTHg91lIfm95NxC3moCo
 5bFYdVZEy2PIGOXAyY/R469QeAbfUOxVTq7IzvbxEVE4+L+yxo9pgKJoP5G07rPgHSSA
 DUgK4exE2/dxtGkgmi4UXsqDjIiDsr/BMD422Icrg4tDstvljE3O83YCQi7qTbm3GgA4
 6FDwVma9lQe0hIeNRP3OW/u4czshtB1zpvyVWazpzse88qJDBo4I84+JKRf1eeAZkLXP
 3MeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GKHj2X+/VhjotsAiucz6jWoSL0ct/kK8y5kIibgwfgc=;
 b=tZ+jgzvi6606JtwYd/fhVAtmHDdFNgcHzYAeJb8d7MhzNpc3KvjmUkQgGp3kZhpgWA
 elr9IkZbNklQO+Asrnk4UR4Ju8GuAtgEakUtScggEkqyZy4jVBkudvyVOVPd8js5Sbdq
 FPDJ7k2dbGUkclZx45uOuafo8GBVrPDBTobtRzYLdrYLX3vwv28cbWt7hYQdqbyvP9DG
 qAYjp3AghBQbWS9zhasCqYdtgHDmtuT6Bok4Eey9xWqNH/EBW+9zV1MtlbjKBtnU1lNC
 7EJ+nJVmMcQVcOxPK0PlXgob/I9ceJ0u4B71Qvw0dqtxMBM88hvBhJD2Gy11LeNrBBh7
 OubQ==
X-Gm-Message-State: APjAAAWf3Q9IwU4m1Vlh0sUcJrw5rQTlrhj3ji3CaOpelSIHoQl2HB+2
 8Jb3gZF0u1Uz3gbjjjjIvgVP1sjLY2psb0rp4Pffvw==
X-Google-Smtp-Source: APXvYqxbz5hI7DrDJB4yLYGF6GHTzPYaE5yTIRJwT/8jUz4vhtOnbQQc9jDG6Mxpk3YdqVS/SIYv/eXh4/IEned+dXY=
X-Received: by 2002:a9d:4d81:: with SMTP id u1mr31899407otk.221.1563449204462; 
 Thu, 18 Jul 2019 04:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190717145418.23883-1-laurent@vivier.eu>
 <CAFEAcA8kMkRuqWt4_tv+ZH5NJ0-kidJ==2A_JdFbPhjYuS+XCQ@mail.gmail.com>
 <a1c7dda7-8a20-c712-686f-5648014ce643@vivier.eu>
 <CAFEAcA86Ev+-m5hYTyUDZMcfzYUcmmaSxhq05k1OACgcZFj40w@mail.gmail.com>
 <82d9337d-52dd-5d1f-a9e5-0fb12f0f495c@vivier.eu>
In-Reply-To: <82d9337d-52dd-5d1f-a9e5-0fb12f0f495c@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jul 2019 12:26:33 +0100
Message-ID: <CAFEAcA83p7YBkQzJXNfCB_1G02QPHnMbVyj4OVH4D9jvbPJt2Q@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PULL 0/3] Linux user for 4.1 patches
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
Cc: Aleksandar Rikalo <arikalo@wavecomp.com>, Riku Voipio <riku.voipio@iki.fi>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Jul 2019 at 12:10, Laurent Vivier <laurent@vivier.eu> wrote:
> Do you think we should defer the whole patch after 4.1 release?
> But then the build of 4.1 will be broken with 5.2+ kernel

I think this is worth putting into 4.1; but we should
look at maybe tidying up the loose ends for 4.2.

thanks
-- PMM

