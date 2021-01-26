Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A463043F3
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 17:45:23 +0100 (CET)
Received: from localhost ([::1]:55328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4RT0-0005k7-GR
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 11:45:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l4RPD-0004Gy-Qp
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 11:41:27 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:43526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l4RPC-0004vM-1H
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 11:41:27 -0500
Received: by mail-ed1-x531.google.com with SMTP id n6so20521838edt.10
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 08:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=z2hfR2DvaeqnAzMWCROsCg5gYtG/tEjVu1AHhrqplgg=;
 b=lyvl45L0nFA1PYzqs/EmN9w9zUvyi6UYPwqhy5u+LFGxrpVf88OjsvC7IOvnnCZ+E8
 A42xoDGmf0/Wk9o+eJE8dOxFj0eUWGhrFMBoILPLK7ioNIr7JxV1xdh9nwAf3Why7TZB
 TIlaPP0nISn0aAxN70KCPZbGbkZ1WXkhJvHQTMlh16T0Y7oxXvfIqNiqyDRsdbUuVw+v
 XjC+154gvIirmrKg5WrXOcDTr/pGRiidxz9Vx2w3X8NowIcEUzMCjcyWWmCEZOc5/Evv
 yyqSlJY5Dn4forj9sqp7drvWbG/j1ihrw3IzOOaJXZCCeXqwwHNwykAC9YW2NC8ahWi2
 FPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=z2hfR2DvaeqnAzMWCROsCg5gYtG/tEjVu1AHhrqplgg=;
 b=LdPctsAGdru130tsWEwU+TFWIdGm2Uoj/fImKLYNbDJixOKJkTBK3UcHv0KFshgZKu
 Lr7qfmbgFVnn3zdzWcalTtnNHj7kyWZKfBw4/blA0KulVmi0Xq5MrcJc15kpEmneoh2J
 whwPJmQq4P5JxJt80EJnauJDfUJE65XoYBiLCNbbGgwNbBUeh0I5fcbKkeaUTQYkzDyw
 sTZVhvv9XeXxVgTNVZLCCWqFoNkCiOfzl0SMYoTdlkFADsuLJ/B4dTU07EFphF2eLb7E
 z5sG4aqffU0DPGrbIya1TfP1ga8bV7XNiXFPIRvC7WW+hU9RaDlU+knsFovxLqLb90c+
 WdVg==
X-Gm-Message-State: AOAM532Ij3NKq2Oxzr5N/x/5fBoF7e4LIXJyFnSxoFCs4Zo+gEcJDMG0
 /mM+VfzJfwNb1wH3PHBkqlqv7FdCpkE1bkwkr8i1MQ==
X-Google-Smtp-Source: ABdhPJyuAwvQ+M6/lr4qqYjP2AMaMKEF1RebrBXSVLshVLvtHLt23wR6qapRzSKcyBlWGNxzkhFBkO4TsrHUAGF8bWI=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr5238898edd.52.1611679284238; 
 Tue, 26 Jan 2021 08:41:24 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA-bafTaHajkvYQw1rfGP1MgKmeY-wmO6LY=fj2oY87HFQ@mail.gmail.com>
 <20210126163647.GJ3640294@redhat.com>
In-Reply-To: <20210126163647.GJ3640294@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jan 2021 16:41:13 +0000
Message-ID: <CAFEAcA88wwwK5RYDpkQ+KEGwS5Qon6wQc8UsuWjjkKtKM9egcA@mail.gmail.com>
Subject: Re: macOS (Big Sur,
 Apple Silicon) 'make check' fails in test-crypto-tlscredsx509
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: Alexander Graf <agraf@csgraf.de>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Jan 2021 at 16:37, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Tue, Jan 26, 2021 at 04:32:08PM +0000, Peter Maydell wrote:
> > ** (tests/test-crypto-tlscredsx509:35180): CRITICAL **: 16:23:34.590:
> > Failed to sign certificate ASN1 parser: Value is not valid.
> > ERROR test-crypto-tlscredsx509 - Bail out! FATAL-CRITICAL: Failed to
> > sign certificate ASN1 parser: Value is not valid.
> > make: *** [run-test-70] Error 1
> >
> >
> > Does this failure ring any bells for anybody?
>
> Not seen it before.
>
> Is this using a gnutls from homebrew, or one that apple
> ship themselves ?  Any idea what version it is ?

Homebrew gnutls, 3.6.15.

thanks
-- PMM

