Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5A34B794C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 22:31:55 +0100 (CET)
Received: from localhost ([::1]:53416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK5QQ-0005dn-6g
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 16:31:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK5O6-0004Nl-Ax
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 16:29:30 -0500
Received: from [2a00:1450:4864:20::42f] (port=36563
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK5O4-0000Ho-VJ
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 16:29:30 -0500
Received: by mail-wr1-x42f.google.com with SMTP id o24so232738wro.3
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 13:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5crpDYqUV82tW1ObwcfWcA/2RxB1IYrTJcHZmbYilH8=;
 b=ZS6MgzbGGCAaVbLN1MvXEKSAHHQKY+sfENM4ZWP0Js2AbxgW0KcWhj73/HjBl+GaGS
 QSz2f6zSLCAmu0lOYjLyRzRV6ZahyNMuMgq9/j0N7g+v1GGvBfpbSrOAgVPHWfiVgpGh
 7O63VDhtgz2AzQdTEdLYpuRJ5PMAWtbaXdjr6PyBHbOfHTNUIUacK5liLeepRDdsYge7
 so2KPBjSoEgqbMYRpYlBaXYW6T38XFpIgR26y9HVWep4vEUHdzHCif0alwhWOv9cBq5f
 xI4S06SNslZ0GTPgpLCGlJuajUJXEZpnJz5UF8ozdjx8LFoCvRR3pQRXjdmHSyXvLLO+
 RvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5crpDYqUV82tW1ObwcfWcA/2RxB1IYrTJcHZmbYilH8=;
 b=HID7CE33i+FJNy3cwWrXO16+X1r4VJlSyw1H7v///d2kYQfh5ZW5vfGCxk6Y63LbNy
 Sigzw87YXdvqNk7V4kAqAWzP7mQYZgqPU0DwW18B9YH2eOf2pxCmjO/aKb6SaXrh7GbH
 e9cDhQ7G5kenzda8MTat/0whV11GssXXh3gkPMYuTltuW/AgcSCpkxFfvM6Jf8pFTyXh
 WBSy1QvwhJLBC8nagmfRYWrvj/bXnHUDI/f33pcPZzwnWUbJ+Mm5T8P1A8VD8NLG25qf
 5qca+rJqBAFkWn2560WYqb/61cVJRppLWNZTIvECDb47zVFNARKe3BaSdlmiQ/pBmxdi
 rM7g==
X-Gm-Message-State: AOAM5338543GoAlOV4dN8Z5Dn+E/h8lR6GepCWi52oxUZT5ga4WnPrU6
 mlyffhBCtWllYArNABODDNJIv5+VQcpxjBDXvnpdDw==
X-Google-Smtp-Source: ABdhPJzFYdWkxq1V32WRHnJ3EQnLmroJbilUXbp9PbfMifGYvsGSZEz6WPMyWsmiViPvkTnEzmgx2GJ2QpcVIZHwYEk=
X-Received: by 2002:a5d:4534:0:b0:1e4:9d38:2d4f with SMTP id
 j20-20020a5d4534000000b001e49d382d4fmr2665wra.2.1644960566927; Tue, 15 Feb
 2022 13:29:26 -0800 (PST)
MIME-Version: 1.0
References: <20220210113021.3799514-1-alex.bennee@linaro.org>
 <20220210113021.3799514-3-alex.bennee@linaro.org>
In-Reply-To: <20220210113021.3799514-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 21:29:15 +0000
Message-ID: <CAFEAcA9yGfnO-BtOCAC+GJbezWtawLG=OFkEg=Vyg_GpxENU5A@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] tests/tcg: port SYS_HEAPINFO to a system test
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Feb 2022 at 11:30, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> This allows us to check our new SYS_HEAPINFO implementation generates
> sane values.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

