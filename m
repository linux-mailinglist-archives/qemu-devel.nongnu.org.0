Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4F24D9C07
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 14:20:31 +0100 (CET)
Received: from localhost ([::1]:49050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU76E-0005fn-VB
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 09:20:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU6lI-00011P-UU
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:58:52 -0400
Received: from [2607:f8b0:4864:20::1135] (port=39353
 helo=mail-yw1-x1135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU6lH-0000Ma-Bt
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:58:52 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2e5827a76f4so28967187b3.6
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=h6vip9cTHB1pKKtO7vkhOOjTC0WY6VAuSkzWcAnBulA=;
 b=Sr2w5Rpp3IWj8YBJzGKYmOGur/jVg2AWV7KNw7/YDu3avJPAD0WxLlaDcWSmOrEQ0X
 YOnHPME5MxyTedlXGOFtEB/Qf1/jEyePwYmVHP6u93RdDc40YsQqPGjjPKLdnJE+SwPV
 r981PzWEvRL5niRtNCl4TPodaVVsXiQrpE563Dn3fOraaiEldyaqjzLGauRQjx6GKAs0
 BZgSzlA37B7hfGnLlkKI3i8rxLhHkdhkGf5J7YUM7UbflB9lKR2QdEurJVsYkEKkuRoD
 LKj6DadTZj8YHBLYUifgCvt3p3cTUfcYQNUA9VF5L0Y//VPR27af9RgPsNUCfp5Af4Yv
 ogMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h6vip9cTHB1pKKtO7vkhOOjTC0WY6VAuSkzWcAnBulA=;
 b=zUO7gtElb9ZCb5JARWGC7MS7eDl0cAe3uJkawgrWuC5dOv26dTDlmfSBW47rUagix1
 SMUlCyL0l3rtKB6AuPKWSkCuWy0HwKzgbRy3mYT4mdOofTCzBsnywqwoTGZ8qge8FXbS
 r/rvBz9ggoJUnIYPASa7W5ncP06XvWpwKzrTT3BPdvEY27IphIFJO0+OtGJBDkWFYp/s
 MbEuEEz6xNxhKFhc1TXZcpGnPyl8sjU17Qcqe4ySbsVCnK2tTBp5P2ekEzb+uhEAymEq
 oQrrcwPCY3Czp0qxvE+44+MUHahZP4rowlDUha+BMYAtUNNSP/lKh7y/InAQ6DF16CiJ
 tGUw==
X-Gm-Message-State: AOAM532OgZYC6ppzi3LK6PnjRW+q4pk/xWPbjIfBCmnp49YJsAkTaiGr
 lzBC20THshsnkZMngW8KinuiwvIPPijR6M03QR08vA==
X-Google-Smtp-Source: ABdhPJwNRDYipeH96jdFV5Ysm++rePprBOM3hjUnHyqUyrJJIqp8BvWq/QNNVdMQVNGEV8JwtZZKUFDla7M5WfhxsTs=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr25185763ywb.257.1647349130426; Tue, 15
 Mar 2022 05:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
 <20220306231753.50277-7-philippe.mathieu.daude@gmail.com>
 <097ec9aa-ad9d-960e-502b-0f038ebe8a31@gmail.com>
In-Reply-To: <097ec9aa-ad9d-960e-502b-0f038ebe8a31@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 12:58:39 +0000
Message-ID: <CAFEAcA_3ZHXT4qcs29P5iFqoLbJCyTwe80kPeO3pZrRLEQ7p0w@mail.gmail.com>
Subject: Re: [PATCH v7 06/22] hvf: Fix OOB write in RDTSCP instruction decode
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1135
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
Cc: Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>,
 Sergio Lopez <slp@redhat.com>, qemu-block@nongnu.org,
 Julian Stecklina <julian.stecklina@cyberus-technology.de>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Mar 2022 at 10:20, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> Hi Paolo,
>
> I forgot to Cc you. Could you Ack this patch?

I had review comments on the version of this patch in v5 which
still need to be addressed:

https://lore.kernel.org/qemu-devel/CAFEAcA8yaBOD3KXc-DY94oqzC5wkCENPkePgVCy=
bqR=3D9NmdQFQ@mail.gmail.com/

thanks
-- PMM

