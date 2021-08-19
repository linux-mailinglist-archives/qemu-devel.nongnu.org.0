Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 281703F1A2B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 15:17:14 +0200 (CEST)
Received: from localhost ([::1]:49730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGhuz-0001FE-19
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 09:17:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGhte-00005m-Qa
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:15:52 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:39902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGhtX-0000uf-Ei
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:15:50 -0400
Received: by mail-ej1-x62b.google.com with SMTP id gr13so12869264ejb.6
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 06:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bhFPMyl4/KhH1v5/AK9mR1o+Yq4S/nsOL12jd7z/lAU=;
 b=HO/qwdz11UDCBO4KiIKhZuaVbOiv/NbdEfQv6mRrC8N4dhuM/jwVaRw2EcuUhVDM2L
 0dUximsN5Qcel4zDHndp0qTQelmv1UU+XSAJl8FDjwJh1KLLresByAEM7tOR/iAfawXl
 pXZhgrm+q0jtaIyiRGz1LNuIrLKStRGuh6yjZFbCGdBOGlF4jOQPrgmHuOEQkdMR6J9t
 AYGf3CuPoFpEG1ZfzvUow52vXG9qLvSwC1AxTcmAKxsyZabxjy5oQgTr453mxngjmQJJ
 76BRR0MAA7v5N0YZMwL3CvF3tswhTNSDxf9ESHujfXUvO2+7sTaGWRcvB83DLdAsAPln
 R6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bhFPMyl4/KhH1v5/AK9mR1o+Yq4S/nsOL12jd7z/lAU=;
 b=dq4ivDkOYqx1U/D0GV8cG1CXjWLdF06S3NC91S0LuvFMd0HxRNb9+UDiE+kwP1sbdP
 wZSnRFssa5YJaHxfAPygDDe+5rPUeLou+lTz/pQ0na+BFzESwf+Rl8WE+8NkimrwonVQ
 39cvPkJ5Xs5iEHHK3mHSuo7EV0OepKuKpbTO0Egl9UvciUHlvqwFKyy4hO9iwOo1X7JN
 kimflKafNhQoSRJJIbsVbcs7pBCheW6N9cMB3U/Y1xRTdXUPABhnj/Wnz+HxcgeuiTA6
 KGGo9UEn9CFVzv+ZGOy9+yyO6Os1hv7SAd3dysrSSDmjVIGZ7qtXAq7O2qFpyhruvd9e
 Vh+Q==
X-Gm-Message-State: AOAM5318iSCdW33GsNaOsaDMIXMTox73EAzrbVbOQVN6xMNuGcsN0xNd
 rHx1xFoBbQaoxxDcv90ZnzbY60qqLWW7onYFsOWcpQ==
X-Google-Smtp-Source: ABdhPJygZzQKToSOFk337L5vUX4Uklm67SK+5F00f1PcALMW35eMpqsLPz+vmP43/RUY7EQcDB/lh0SLfSGwC5+aaW0=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr15614047ejy.407.1629378941856; 
 Thu, 19 Aug 2021 06:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210810175607.538090-1-linux@roeck-us.net>
In-Reply-To: <20210810175607.538090-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 14:14:55 +0100
Message-ID: <CAFEAcA9awrjL8smkZsSZPJzyf8542Bv1yc=jyWLv6T_MjAA8dQ@mail.gmail.com>
Subject: Re: [PATCH] fsl-imx7: Instantiate SAI1/2/3 as unimplemented devices
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Aug 2021 at 18:56, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Instantiate SAI1/2/3 as unimplemented devices to avoid Linux kernel crashes
> such as the following.



Applied to target-arm.next for 6.2, thanks.

-- PMM

