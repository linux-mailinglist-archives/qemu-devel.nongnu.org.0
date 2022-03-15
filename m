Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C16AC4D9E02
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 15:44:43 +0100 (CET)
Received: from localhost ([::1]:35292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU8Pi-0001XU-Qa
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 10:44:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU8MO-0007bH-72
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 10:41:16 -0400
Received: from [2607:f8b0:4864:20::b33] (port=37768
 helo=mail-yb1-xb33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU8MM-0001Dc-Jd
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 10:41:15 -0400
Received: by mail-yb1-xb33.google.com with SMTP id m67so4319111ybm.4
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 07:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9NfrRLd27h4YLK6YPh+oWIyzCQb1i6CCNG8PhawKCB8=;
 b=rxTzrmsgfuK+p1ZRMVtLTK8YnqBO1YTtOEO5OFecauGGeb6Iop7B2Xy58vkYwTDXwo
 4/Np9iUpBL9yga6EqWKkFAB1vfresrRUNbSZ7mOCbyRU3Tr5WYARY1RITbACXFQ1OYTh
 mns1LfIf2SbHGs53jT9OFnxDZOfUaMcl8b3Fb3DnPDD0A18aBx1hIwHnBUCLsEnWjtFX
 vnzpQPN8vot1I6q0xNWBLNVEloSmJzeJrMBn4jCqxYot7IajbRUNJdR108hE/cO8r6ol
 XkR+igT6wa4x95GyZPsWmkmyfcqgV7pJEEHEHyYI+etRdfnHIEZZdW7ILT/CFN4qMdjY
 5R/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9NfrRLd27h4YLK6YPh+oWIyzCQb1i6CCNG8PhawKCB8=;
 b=KOtAceJi7qOMg1c9MLpb+fhNDY8DLJgKWQaewJN0qz4wjhWMPejVamII/xem7UwJ49
 /aLa+F108z60jLF/OBG577X/xwiWV8l8zbWh7tRkSqeA6Oj2gRRd9xgXmkP46L68nXKJ
 fnhtQiHwt3yBX0VlaxsiwEKqMAeU9R5BctLbyBJ//CI2dAG++KvgLPnCbXjg1seD8/un
 iJ06aJj+Ryk1WmcNeYAFLGsOAFxA6dUkur20sDhNDmaEJ24KZti1VdsXF/DQtrmZ3IRD
 xOkxH8qXmEF51COKnWsk5RwVAZNEcm3nxS5pkARYg7H2i/j596XTS2HZPzHRhJt4TibO
 +dVw==
X-Gm-Message-State: AOAM530wlW31TOHG261PSWfd+npPqlChDIcDlKtmJf2wrBkmT35s8avZ
 R2UMdF3pHsplAmVqCy0Uqpyy+vruOKzJ9dAPHMIZnQ==
X-Google-Smtp-Source: ABdhPJwmzO0SKd5e720TG9CEg0wUAV1xRdlm6wY//7VJX0284/HSbolhzUv57R8vsRSRcHAnVgOS4IcFgsmEcCOTi4U=
X-Received: by 2002:a05:6902:510:b0:630:b29f:ce2e with SMTP id
 x16-20020a056902051000b00630b29fce2emr18142668ybs.67.1647355273017; Tue, 15
 Mar 2022 07:41:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220315083656.1949517-1-kraxel@redhat.com>
In-Reply-To: <20220315083656.1949517-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 14:41:01 +0000
Message-ID: <CAFEAcA_JjE355gveoLx1AYNZbgOww2cWSKRGBDLVGLhC5aBCCQ@mail.gmail.com>
Subject: Re: [PULL 00/11] Edk2 20220315 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Mar 2022 at 08:43, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 352998df1c53b366413690d95b35f76d0721ebed:
>
>   Merge tag 'i2c-20220314' of https://github.com/philmd/qemu into staging (2022-03-14 14:39:33 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/edk2-20220315-pull-request
>
> for you to fetch changes up to 9b437cd0f95398198852f25d7847a605370f984d:
>
>   MAINTAINERS: take edk2 (2022-03-15 09:32:22 +0100)
>
> ----------------------------------------------------------------
> edk2: update to stable202202
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

