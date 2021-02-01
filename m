Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B38D30A8B1
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 14:29:09 +0100 (CET)
Received: from localhost ([::1]:43700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6ZGO-0003wi-LR
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 08:29:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6ZEi-0002sy-6Q
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 08:27:25 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6ZEe-0002qv-Gm
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 08:27:23 -0500
Received: by mail-wm1-x332.google.com with SMTP id m2so12654344wmm.1
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 05:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=HvbujE8LcPvc9pJFpBsNbteFOd26LsYh1R79wWODdwA=;
 b=yx7wl7/3pHhKcCps6BCS5gbPOEJEvHMjJmYUm7OxhchS8sSHyEWSTQSjotaSa7JYgy
 OegARIt3whM25MhKWtwUe99XRCL0ESLw4RCo9aCfuAJxavxBZcRdDba1gq+Ml1Clixe+
 WXHxUuvY+qx4Sx4G4YmRB36q0iRImFsuq/ThINH9oqQjPEd8xLeyMKFyP8UNyksFSYig
 ZpbgGb0uruTgFWncTtFMRqQOfYjSbKmVG5es8tqk+IpCoTcdI3prJXS9IRA7HGEupCQ8
 x3zwVm9TNocUH16LKntF2Qs00NL+DF2xPrGDxnkGa9mJf52wrRFfoYsF/3sqAzmy5O9B
 HeEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=HvbujE8LcPvc9pJFpBsNbteFOd26LsYh1R79wWODdwA=;
 b=mkMms7Da8xQiylmIRuOfuIndC2ZaoF9bMJskZom8lor0Wd+8ZBXUxv2Eif40P4oWFm
 dAun2I0Bj7MfZQIljqyHcxPJYZTqGr117+eUwascpgAkGaQAqFB24YSnQ5cchM7uqMEM
 TlKH9U21H9KH7hCJCdYDeHsPU6wloVg1ePTrm3CDtcVuvtty2zpvIf7yRzU0YIOMeXf8
 MNccRsv8lWpGEnI99m/IRMzd6J57voYC+EJSlkeCLSlZTUPDavbIOJxrVPub9NZLkIwT
 18voL7PPDA39QNjC24L4XaOAW7GHcQOnv3DFP1z4TF6WBi/qVYJppcSHQV4jEhi80cZv
 FLNg==
X-Gm-Message-State: AOAM531573SvBfIC8HlpP4jsJCqYtUoqi4R/oNa1lU7Hz8YYno2RgQBO
 GqZdOgj93QWJGcNi34NHsNrsdA==
X-Google-Smtp-Source: ABdhPJwpqBRa6a900It37e+ctecbYvLmcWJl80FIae8Wt9+OzUCRf7zSx49a67t4g/so8/kMlEZBtA==
X-Received: by 2002:a1c:ac86:: with SMTP id v128mr14906303wme.76.1612186038751; 
 Mon, 01 Feb 2021 05:27:18 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n193sm21453367wmb.0.2021.02.01.05.27.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 05:27:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E65CC1FF7E;
 Mon,  1 Feb 2021 13:27:16 +0000 (GMT)
References: <20210131115022.242570-1-f4bug@amsat.org>
 <20210131115022.242570-3-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v6 02/11] exec: Restrict TCG specific headers
Date: Mon, 01 Feb 2021 13:24:26 +0000
In-reply-to: <20210131115022.242570-3-f4bug@amsat.org>
Message-ID: <87wnvrvryj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Fixes when building with --disable-tcg on ARM:
>
>   In file included from target/arm/helper.c:16:
>   include/exec/helper-proto.h:42:10: fatal error: tcg-runtime.h: No such =
file or directory
>      42 | #include "tcg-runtime.h"
>         |          ^~~~~~~~~~~~~~~

I think the problem here is that we have stuff in helper.c which is
needed by non-TCG builds.

>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/exec/helper-proto.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/exec/helper-proto.h b/include/exec/helper-proto.h
> index 659f9298e8f..740bff3bb4d 100644
> --- a/include/exec/helper-proto.h
> +++ b/include/exec/helper-proto.h
> @@ -39,8 +39,10 @@ dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2)=
, dh_ctype(t3), \
>=20=20
>  #include "helper.h"
>  #include "trace/generated-helpers.h"
> +#ifdef CONFIG_TCG
>  #include "tcg-runtime.h"
>  #include "plugin-helpers.h"
> +#endif /* CONFIG_TCG */

If we are including helper-proto.h then we are defining helpers which
are (should be) TCG only.

>=20=20
>  #undef IN_HELPER_PROTO


--=20
Alex Benn=C3=A9e

