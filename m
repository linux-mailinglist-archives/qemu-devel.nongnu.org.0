Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149526B2505
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 14:14:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paG5I-0008O7-5Q; Thu, 09 Mar 2023 08:13:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1paG5F-0008NX-UP
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 08:13:25 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1paG5E-0000AQ-6q
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 08:13:25 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so2016529pjz.1
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 05:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678367602;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hPxDwA2qP+yUNTcYliT3FEziP29T0fTAryen8DS7d1A=;
 b=wVe7m+0Yj3wrC6X1akGit+NadlCWXZI4UET8GPuvG/DWwi1bjJUp0by6MFbOKvHTqr
 RlY0292CbdhlmPgoBrCaRRFmh3vMaYK0PGtEdBI3LAE5ATza8EJKltb2euFUNdU19l3y
 GmhzvvJlg05N/eId9mjdT1Zn8iF42pFgVLlJtVRMaRlpVNuBtPrByZsKVJR80zd8b1QR
 V36IMwSDitqd2Mgu1H3lh22pdyZy2RdMZJRbJksyU5yLX62/rS7N63jz9XrL2+wC7U+9
 n/+okd3z1IHZX5mZOJGCvkblOly5iDtQRRtW4XV4v+Ci00y3bOSkfra5DOVG6xDWDq8t
 Oq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678367602;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hPxDwA2qP+yUNTcYliT3FEziP29T0fTAryen8DS7d1A=;
 b=c/zyErUQb5RorgM58IInyDHJSvT5AAFtjTaw+bSZJlOmcRXs/e3+c233yq/tPOTQNS
 oUifTbtbmj5LhkIraU7w1E488cyswW9XZO5C0CEVrpHIkfDFAfxmg+VepwZSAj6QxsHq
 J2zMoHCwQzLjemVYgFJ50/DC+qC1JKk4x6V4dS2X4lToVXpGXCZf7ITzZRo+EUwF/44Z
 LiparMTxwNpd6kn1PnkQjm+rg/wZEUJx7jOWn2qTsiH3tCpjYXBK7dESCwGkA2FysZt+
 gxmk4TfW4po3JuLdDcd5/KANp+xR2zL8KuMClA+Hgw7Od6G8puMs/+wuhdL19hc/E6A7
 9qyg==
X-Gm-Message-State: AO0yUKU4ssLqcaeUHESJcq9dgdXw0Hq3+BnfoqXYABCUtLSgime7fwxw
 buIJkLJ31tSIo7Tk5BFKyHP75PAQ3asE66Qm+yCwjw==
X-Google-Smtp-Source: AK7set+bp9i/lhjaTr0qti5l1lyl+Z+FaN9rBf9wEVjRI/di0LUUx+ML/aPteeHIIF4A7j7RpQV9rrF7rXIqge2LHdw=
X-Received: by 2002:a17:902:7e09:b0:199:6fd:ecf6 with SMTP id
 b9-20020a1709027e0900b0019906fdecf6mr8173178plm.9.1678367601712; Thu, 09 Mar
 2023 05:13:21 -0800 (PST)
MIME-Version: 1.0
References: <20230307155528.3655534-1-clg@kaod.org>
In-Reply-To: <20230307155528.3655534-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Mar 2023 13:13:10 +0000
Message-ID: <CAFEAcA_f3LP_nVrN2oi6xwxY6JpuWruZSdFG7pf1ttfY7d5ZTQ@mail.gmail.com>
Subject: Re: [PULL 0/5] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 7 Mar 2023 at 15:55, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit 817fd33836e73812df2f1907612b57750fcb94=
91:
>
>   Merge tag 'audio-pull-request' of https://gitlab.com/marcandre.lureau/q=
emu into staging (2023-03-06 14:06:06 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20230307
>
> for you to fetch changes up to 7840ba985a7c0fcf90a7318ff1f827f89571cb3c:
>
>   hw/arm/aspeed: Modified BMC FRU byte data in yosemitev2 (2023-03-07 16:=
53:18 +0100)
>
> ----------------------------------------------------------------
> aspeed queue:
>
> * Small adjustments for the newest Meta machines
> * blk_pread_nonzeroes() fix required for pflash and m25p80 devices
> * Improve error reporting on file size for m25p80 devices
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

