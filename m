Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68980532754
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 12:19:10 +0200 (CEST)
Received: from localhost ([::1]:50460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntRd7-0000sb-HT
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 06:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ntRaV-0007oL-8T
 for qemu-devel@nongnu.org; Tue, 24 May 2022 06:16:27 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:39817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ntRaT-0004Jy-JR
 for qemu-devel@nongnu.org; Tue, 24 May 2022 06:16:26 -0400
Received: by mail-yb1-xb30.google.com with SMTP id i187so27806830ybg.6
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 03:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C8+FbD0vHdDIbshiYDCxAtsOL2/35EuiE7ySFjo9WUM=;
 b=s1e5OlqkwM6JVZaasCgtCcqXpuTVrDpUPoKRRMf2jd4F/7QhrBiRPtSGwDEzvuEzmZ
 LwIpTXArGB0ApOc7j9zR4hjyNVwIGuSlOY28HMvAOg2cKL9yiaPnYB3tsJ7NZUF1pHz8
 Id4EONfV8NCADNgRTMUI6Ql8CgbTDfkfDE9IRtbxpQe1U+MmtC9GLDWWxeK9zxamyPty
 FvNBCctfKpd/eDD/DWjWYjNRW+H3NLuRJiBm7+9yQR5rM/BWm7R8FTpZeUjKl+dhBlWt
 C70Hn2Qocj8GKdZF+gLqZ6EcjD8HFFDcX9Fyc9Oy8akvysLHyRsgZ633fsRSZRrNEY/3
 iQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C8+FbD0vHdDIbshiYDCxAtsOL2/35EuiE7ySFjo9WUM=;
 b=T9ydlRBDHmVMLYt7fPWFFaVGB7aOsfHJ1Hf+x1+Ksj2pXKkvrlHsXg55H6I1FOsAA3
 FDESfO/2MYLhP2bFfwhFfP/ij+DRoONhSVFiu8dYV+4RK1o2JjK74O26lhM3vwID8HR2
 hiEN0qXdYDV4o5tHADBU3gTLZGMfxnyxzT8P0VD/SkfnY0uvNAzOy3V4uatU3/XqmWeb
 jky4+IMFZ1QWhX+6LEZZ7z7omVeuj3uOgGT55m0gq1OHiIWv6Gy/HXsI3IMmZx4lBt44
 1oc1XvIp5PxFtAQNdwVJ+DsXfjOCO3ZhMzhSXDKKMXkUKylQYyBSs/eLvUZ0Umd3K1s7
 3/UA==
X-Gm-Message-State: AOAM532fq+Q2JXhBIENScC2HnIBtbEJSyko69T9e5G9WwZgMVo0p9oQX
 Gn8Ij6mLGAbZMQECeczj/x7SZy0eTWT+90nSN4ItlQ==
X-Google-Smtp-Source: ABdhPJx5H4NL3z2gbWRimhdSTLnX+J58jVkYExIj1CIqQGtWj3297nw1Y6ryATB6K0mhNo/u7qRUWUeekrmZfldHEp4=
X-Received: by 2002:a05:6902:102a:b0:64f:4132:9be with SMTP id
 x10-20020a056902102a00b0064f413209bemr23337635ybt.288.1653387384131; Tue, 24
 May 2022 03:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220523194111.827805-1-kkostiuk@redhat.com>
 <20220523194111.827805-3-kkostiuk@redhat.com>
 <541f46cf-fc45-f7bb-e121-2aad216e11d5@linaro.org>
 <CAPMcbCq7fzubG4ej7p164vwQkCMChjWBubx27R=kVxukWDhuBg@mail.gmail.com>
In-Reply-To: <CAPMcbCq7fzubG4ej7p164vwQkCMChjWBubx27R=kVxukWDhuBg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 May 2022 11:16:12 +0100
Message-ID: <CAFEAcA-8Wf3vQ0zvLHjF4ZRhQ4nDqXdMTKS1NsBL4uCEu2AcjQ@mail.gmail.com>
Subject: Re: [PULL 2/3] qga-win32: Add support for NVME but type
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 24 May 2022 at 10:26, Konstantin Kostiuk <kkostiuk@redhat.com> wrote:
>
> Thanks for the report. I will think about how to fix the build with old mingw-headers.
> BusTypeNvme and BusTypeSpaces were added to mingw-headers v 9.0.0

If you need to respin anyway you could fix the typo in the
patch subject (s/but/bus/ I assume) :-)

-- PMM

