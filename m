Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB7017FEC8
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 14:39:46 +0100 (CET)
Received: from localhost ([::1]:33160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBf6n-0000dK-9g
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 09:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36433)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jBf5x-00005x-H9
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 09:38:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jBf5v-0006Kj-Le
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 09:38:53 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:44633)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jBf5v-0006I4-Hc
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 09:38:51 -0400
Received: by mail-oi1-x243.google.com with SMTP id d62so13811286oia.11
 for <qemu-devel@nongnu.org>; Tue, 10 Mar 2020 06:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AfOpHfANqMh/+buT8CipNlg7u+XulNXv4MgEELSKa6E=;
 b=Sa6/1WJ//aoDEcg0oJ9iEbWvpzckJjUrdwvS9RzjasDSQgFNArkJM6agOl2In0IZhs
 kdb3sB1RcFwS0XhIIMsGz7uZ7zF5wtdJLF0AyiqLx2MI30GxuX4B/+t7kMlCNfGs0v0i
 8JSHj75sENs/iW26yU4AF/HUY+3uwYl4SdyHfdnPLZATdspcEgm4kL12eMz1bKCplaVQ
 VMU0jx2R6CBivXqUBcAXK6JeXZbSTg77UK73/aOS1Pp+uyw/VWV7wWh3hMf9tOE8u0Ri
 BMmlK+KYSrKKiGbbHbOvtEqvEBIMzfHiYpP678WrCTho6ne7N53KRjQtWMGFiKN/0cSp
 DPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AfOpHfANqMh/+buT8CipNlg7u+XulNXv4MgEELSKa6E=;
 b=QVQTlZJKTBuSzxPOE//fWAxZIc1HiVjp3lqX0Gw9i3ZQvFDu8NQzhGrlEILXK0jkDv
 qwY/zc+1DV9s+li88npdj6yyhfGyG7SPDFjBLuK6dDbJ2cSvVEixMrZ8/GnK4daLSAdJ
 x/8L3VmcIvav/tIYh9LApJw5072DFgsHC1oj9TKjBfDznNZeWIsIVWhPh8Pw+aaz6w49
 2QmdVnPZBhTtwiDEIeCUvbotp1Q63gJ3JpEHGMRJupxZdMNmFQJecZZQ4UtSY/2nn2dt
 9rlfW7cNoMaR01dVzPLcGZWYky2SRhI02wfXvYENCdafX9Hvf7AZDtgT61D7E1UwikFP
 /05w==
X-Gm-Message-State: ANhLgQ0QDiob3wlj4EBT9u9J4ObomnYDHidpWq2+TTb6DwnuLV3Lw9ar
 Sfly30VODqJdsD4Qd7JW6slZCn0lj0jcFW7O8HhIRQ==
X-Google-Smtp-Source: ADFU+vsd/nbAZ4CCViMsj2mWxgKqFfaWmnbwaPzv260A3g3egoesewmn7R2t1zpgWqAx63JV48O2uW78fTPqh95er30=
X-Received: by 2002:a54:478b:: with SMTP id o11mr1134530oic.146.1583847530221; 
 Tue, 10 Mar 2020 06:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200310133020.27196-1-alex.bennee@linaro.org>
In-Reply-To: <20200310133020.27196-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Mar 2020 13:38:38 +0000
Message-ID: <CAFEAcA-S1g4ojEkYdEa-ZHH+=uNUgCDWo0Z29ikbvNoX8Ro7Cw@mail.gmail.com>
Subject: Re: [PATCH] docs/system: add a little more detail to ARM machines
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Mar 2020 at 13:30, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Taking from the wiki page mention:
>
>   - both 32 and 64 bit architectures
>   - the roll of A/M profile chips
>   - warn about kernel portability
>   - gently suggest -M virt
>   - add headlines for groups of boards
>
> This is still incomplete but hopefully is a less of a straight dive
> into a dry list of peripherals.

This is a semi-duplicate of the series I sent last night:
https://patchew.org/QEMU/20200309215818.2021-1-peter.maydell@linaro.org/

thanks
-- PMM

