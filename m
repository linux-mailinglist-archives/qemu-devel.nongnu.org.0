Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF96E4B583C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 18:14:17 +0100 (CET)
Received: from localhost ([::1]:51296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJevX-0001IE-Dy
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 12:14:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJesk-0008K7-OQ
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 12:11:25 -0500
Received: from [2a00:1450:4864:20::430] (port=34440
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJesR-0006Io-Oj
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 12:11:04 -0500
Received: by mail-wr1-x430.google.com with SMTP id s10so14443462wrb.1
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 09:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=B0h8V7q6luBRp2i4ssAUSnHEM5HDTfXqECkAOXhmWBw=;
 b=mJQ8CWVNh3J3RO1Dy3T4XRfXO0D7+YELSLnX6zjQAc/9LoMol9uBJagnMj0v/4Wouj
 5E6Hsb2BR/4gMe6YIiHaDD3+kh1OCtNbdxaPI+CfgHcP3UIMRJ3iNrg38uu4YtapFH8n
 fQy7IIvjzkf8FbNeg32rLkXFh7vTFDEM4B4cyyAgD/EprjKC6wfn6hyNo458jF3fBfsA
 AVUG++vtT1er5wdDxykrAfPDHxrd1uT5zR76dyrhs1wFb9dBiPyTJTNBo2yJiS86/J4V
 rmd5Egif+uKgMjWzOrwYjmq10wLTIl+R4OOXrC1UJZR8I7FMJI5mxGouf6zVSwFfRsps
 cwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=B0h8V7q6luBRp2i4ssAUSnHEM5HDTfXqECkAOXhmWBw=;
 b=i8R7eqTnj70HpzAkFWPdVCos5FpMSVBbYb69GYWH5CW2n+cjhEDhbhalhjYjBhXBiC
 Hs4uyMEMrK81m9OlKlxYU+/hF+FhFVmqYeOsGOQfEFuhqRVeGjGnrQqajV2nA/Pgr9GJ
 3b5PYMHePdIRv7lQiYoWcgVTuD0vLOBgZjc9EQP+7CJ1AplCTHPvJvBHHuY0v1EU+M60
 LvpG3SdjL9ZGTzED3P8ONEYL5D9GryfJcDOZ1sWmB1VJ6KTOD235kb82Qbqji5Yeecr/
 e4lAsCI6Ho50nTnaZ/nOit5SAN+R3/tQZU0KlcdiVf1v1WbowlFIevLGB0dF/Sb2fiVM
 IjNw==
X-Gm-Message-State: AOAM533qc+R3UsPlwVE1spghtadcvMwdqYeMsmakK19SlCl9Wg67TaZ6
 2UpKz6UNr+eknyMMiZRJ/OsOwsjjAsrkFLQ7gPS1LfkV0zM=
X-Google-Smtp-Source: ABdhPJyo9EIFyC5TEhnARGMaEgw73r2lb1i1wxaqqIDtGqaaltSRnFUI+chvxR5HwPwbPqT6yOhL0V91QkBomB34b9w=
X-Received: by 2002:a5d:6d8d:: with SMTP id l13mr454225wrs.295.1644858661704; 
 Mon, 14 Feb 2022 09:11:01 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA_3C6JoHE288PUFMciO7e2OWK=z-a2168-b2r64H0QCPw@mail.gmail.com>
In-Reply-To: <CAFEAcA_3C6JoHE288PUFMciO7e2OWK=z-a2168-b2r64H0QCPw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Feb 2022 17:10:50 +0000
Message-ID: <CAFEAcA90J0=rVFjF4NobFgGcTxAbkxHkhovUnsfN08Zo4d-gyg@mail.gmail.com>
Subject: Re: proposed release schedule for QEMU 7.0
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 at 17:09, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Here's my suggestion for release schedule dates for 7.0:
>
> 2021-12-14 Beginning of development phase
> 2022-03-08 Soft feature freeze. Only bug fixes after this point.
>            All feature changes must be already in a sub maintainer
>            tree and all pull requests from submaintainers must have
>            been sent to the list by this date.
> 2022-03-15 Hard feature freeze. Tag rc0
> 2022-03-22 Tag rc1
> 2022-03-29 Tag rc2
> 2022-04-05 Tag rc3
> 2022-04-12 Release; or tag rc4 if needed
> 2022-04-19 Release if we needed an rc4
>
> Any opinions/suggested tweaks?
>
> Easter this year is April 15-18th, which is slightly awkwardly
> between the theoretical release day and the more probable
> release-if-we-tag-rc4 day. But we can't really bring it forward
> as softfreeze is already only 2 weeks from now...

Three weeks; I miscounted!

-- PMM

