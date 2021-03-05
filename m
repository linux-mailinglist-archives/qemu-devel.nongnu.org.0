Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 763A332ED53
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 15:42:12 +0100 (CET)
Received: from localhost ([::1]:40024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIBed-0008An-HG
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 09:42:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIBdm-0007im-0E
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:41:18 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:46681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIBdi-0003lT-Pc
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:41:17 -0500
Received: by mail-ej1-x632.google.com with SMTP id r17so3864311ejy.13
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 06:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=N6xddOZ1qnI0rtiHG+z3pr2ZSOx2d2PYpie4cLaGT5s=;
 b=VXxkxui014IaVPV397kKm7dQSCdZ9qHMxkvgFv3v+e6QLG3wgN8Q0dFrvqXjZ9Yk0W
 CIM/Peou05j77h4ngxl3wzFnXQocZ6VM24g8TDfx1gNalU9Dd9Gomm58WpWVZq8YzAkg
 HLCfhTIax5k/vPJeO90YrxzBXHrwWMLv4+Z3JgmXZobhqz3OiWuB6NamAYST8wmKuYaH
 xRDzJ+85a09T3cEtPnYe1PR+vXYcCaARq/9PiAP/45CNmXyI9p5BywLp0HUJgA8akTvB
 uGH7bmiOJCSXwjl/x2xPhLAvJycfE7yaKyjggVlZ2BxemanQ+uRfLRMi6pxXUiWvCI5F
 3YDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=N6xddOZ1qnI0rtiHG+z3pr2ZSOx2d2PYpie4cLaGT5s=;
 b=Z+e8WyXlSUEU+sIo5Lgyr0I8iwSkHbAAWWprUt27/wAvIulH2Wduu0AhtrcAh6g/vi
 P0O3PCdknyXsRKl83Vo8NlNBzYO6kH5g3UNg+cFjhfqJL5q3U130792NoO8GcrH+/QCd
 kOC6MHao6wS1UkIGjqKA+S0aUsLLm818wIJzOKHXepL0t0FArw2YT0utjsorpG3lB9vy
 FbHFIcVmtyM6iTISUMVnM1g4fvuH+ufTOPRFgE0ZPtVkgXyhzP3OwaWXpKxEXjLMTBlr
 uaAFOXQIJD3vGEWF0F6NSY5fx2mk7MG5w/SbcTgIT/4zgQpOrPqhwk1XQqOBQAcvStDv
 sx3A==
X-Gm-Message-State: AOAM531tDM/EkTZut9EopPVooBQuv9uX6ICFpHd63a1YXkMK6cD38b6s
 Gs8/aTt5KBs5J08WatuvXBbV2YIQDMrHT8yElGAmJA==
X-Google-Smtp-Source: ABdhPJzmd3ufK75yo6iNHi5AZ2XDGvnuRlUdTUJqlwiUyqVtTB+bU6QIu+RUTeEC+wDtqmGHq8BCbmgUqmqDkj06EnE=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr2590571ejc.250.1614955273251; 
 Fri, 05 Mar 2021 06:41:13 -0800 (PST)
MIME-Version: 1.0
References: <20210222185605.2714192-1-f4bug@amsat.org>
 <b57ab441-ae60-ada8-5b41-6d2ba646d25c@amsat.org>
In-Reply-To: <b57ab441-ae60-ada8-5b41-6d2ba646d25c@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 14:40:57 +0000
Message-ID: <CAFEAcA-Zc0KcRaA32ctdt8fvyV7H73b0pGB+n=qKAp9c+a2G7w@mail.gmail.com>
Subject: Re: [PATCH] hw/sh4/sh7750_regs: Replace link to license by its full
 content
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 4 Mar 2021 at 13:47, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> ping?
>
> On 2/22/21 7:56 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > This file is borrowed from the RTEMS source code, which comes
> > with a GPL-2.0-or-later license with a header exception.
> >
> > Expand the GPL-2.0-or-later license in place to not be dependent
> > on a 3rd party website. This also fix the misleading comment "The
> > license and distribution terms for this file may be found in the
> > file LICENSE in this distribution" referring to the RTEMS distribution
> > and not to the QEMU one.
> >
> > Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

