Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 784A82C17B8
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 22:34:52 +0100 (CET)
Received: from localhost ([::1]:48818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khJTy-0003Fx-DU
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 16:34:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIlZ-0004It-Tk
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:48:54 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIlY-0002av-HJ
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:48:53 -0500
Received: by mail-ot1-f68.google.com with SMTP id o3so17239503ota.8
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 12:48:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6X5JUbWCsf7rXeNirwCwic0tduvKYDD3nxFKgZUJDMA=;
 b=HgGq4Tca0/xb2FYjPNGHf6p9ZuIo3F24HrKpj8SXGcEnEZTDjB5wQi1YrjxZtPOouY
 DDlYn9BkTmhGi64kT6DWOFog5m/RuKY8UuUa8K+FLFsTLSqGfjgx5KclQz0lS3SM5ZN8
 2fD2SvwYHtEu1UwUgNk05YifWdomsU6VgkM3MnMG+au6yJttPHBIouHQdUOLQHI7MhEv
 XcXP2CALeQxFNSIlwjqcHCzDXSqahSudYy/epeMskUC7HpjcVFcYi2SqrWQYmtSiPSLY
 dZ73Q+TZklvvPkWG/PGB08Mo8DHt8JF7nDp0LPVHqkptRn5S3usVcGpzoflSODZ9IZK3
 4IBw==
X-Gm-Message-State: AOAM532umlIQ7O4VoIEODw2sXQzdu4H3JnCS+hAfLOGZ70RUobci2h8v
 9Um3JHTmvTeNp5kqNBe2LMQnjtRNWQEWspRPrHiZxak2ufE=
X-Google-Smtp-Source: ABdhPJxSZU+leYhoyI/jssux7fjxYbfg8tVr9f+aTHFPJbx+FDi4qK6KKEXNM+f9pjUpMf12XUNaTX2rq2XCN2sXSV8=
X-Received: by 2002:a9d:7cc1:: with SMTP id r1mr905809otn.37.1606164531112;
 Mon, 23 Nov 2020 12:48:51 -0800 (PST)
MIME-Version: 1.0
References: <20201123204448.3260804-1-f4bug@amsat.org>
 <20201123204448.3260804-28-f4bug@amsat.org>
In-Reply-To: <20201123204448.3260804-28-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 23 Nov 2020 21:48:39 +0100
Message-ID: <CAAdtpL4j-i7U5y4=oWWwmU84+6Xr7Aqkkg1mGs01jBQ9u-CGRw@mail.gmail.com>
Subject: Re: [PATCH v2 27/28] MAINTAINERS: Add entry for MIPS Ingenic Xburst
 TCG
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.68;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f68.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 23, 2020 at 9:47 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Add an entry for the TCG core related to Ingenic Xburst.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Adding Craig Janeczek in case he wants to be notified of changes,
> patch conditional to his approval.
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0f49b997f2e..976d23508c8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -248,6 +248,12 @@ R: Jiaxun Yang <jiaxun.yang@flygoat.com>
>  S: Odd Fixes
>  F: target/mips/vendor-loong*
>
> +MIPS TCG CPUs (Ingenic Xburst)
> +M: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> +R: Craig Janeczek <jancraig@amazon.com>
> +S: Odd Fixes
> +F: target/mips/vendor-xburst*

Oops this is now vendor-mxu*

> +
>  MIPS TCG CPUs (nanoMIPS ISA)
>  S: Orphan
>  F: disas/nanomips.*
> --
> 2.26.2
>

