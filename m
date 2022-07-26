Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEACF581336
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 14:37:22 +0200 (CEST)
Received: from localhost ([::1]:38422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGJoP-0003d7-HD
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 08:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGJgm-0008LF-HC
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 08:29:29 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:44693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGJgi-0000p3-6z
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 08:29:26 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-31e7055a61dso140372797b3.11
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 05:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j4uR0Qt3D2SdWzRRHfTbtuyh3SJxN4gIwPlMg4nnMPg=;
 b=Ys7NjF1c8K+XlGi4dQ1cvWMcflT+U9Dn97PiK7u3ofgFbvH9xQwL55ompHWpPpk/uU
 OPzR/QfIZCi1/zj0C7pu/Vn9jhfhbCajvFBcCjEP8/23oKKEWMIjU8GkwO5FpTjzMkvL
 myr98TCopYQ2lsP2+h5QJ+olviNbBXKrwqfeEeDX5KKFydBBYzogUiLhBpcaFXBCap+A
 +LuW0V6RSU7WW0/vIGVQ+ia0e3LVd91TxFFwyM8nkU7n/3Sish+VIIUeV0mTM7hdldez
 drMidCYoTnk15e7f0IEFHFBiTYs9Do8ja8qmgUz703YufQqJTpTV18hidFUrM+8ot9rs
 xPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j4uR0Qt3D2SdWzRRHfTbtuyh3SJxN4gIwPlMg4nnMPg=;
 b=gAkUbw877XG+k+YyQaQ1Yxks/eJjIEHhfvdYyOnc6ECGw56IX0pFq3ro3NN5jfJlv6
 XlCpmkVMpNd4TWSINyOtTtrJvXYJC3J6z+9HRsNRanjYoQqiXUj6dJsRcAe4ZLqAG2jb
 QEvSDEfo7lGCRPZNmXTmXGla63fF52S8o2+qaRiVeQl3cbDlvbW3K6qjHCcdlGs+jYn8
 Wqm8Ecr0vQemH5tFytxUF8rWp+VunYPhFKmJgT9vnte6ozuxVx9u1KcqZ2jKZoXMh9ib
 QfLzo4+Si/ik0pFC4o14dcGnB2f7IAjlnkUaMnobex8y1hYgQXxWqtBOL/LTwUyrrzJx
 DHhw==
X-Gm-Message-State: AJIora+6flzKypCj1WBiKEQlf0TYofryhy5uMWfU+HG0m4pLe9mym1MY
 WRwn+BqrNUnR8Dg3oouPylpnID+PLNUKzgR+1vb8yg==
X-Google-Smtp-Source: AGRyM1sUvLJ/7bPhRQ8AF5gV8zyM7a6k9aqPkZp2O0ZDdLylW5nJLDMaprVKW8Gmpenzl0Vc3GBoYMisZz/THu+3oIc=
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr13883905ywg.329.1658838563208; Tue, 26
 Jul 2022 05:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220726085055.17239-1-jasowang@redhat.com>
In-Reply-To: <20220726085055.17239-1-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jul 2022 13:28:43 +0100
Message-ID: <CAFEAcA-5MGUs+4BrMjY+4ExZ4aJ-f-K-hyzkMM2jzF02h2iRmQ@mail.gmail.com>
Subject: Re: [PULL 0/3] Net patches
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Tue, 26 Jul 2022 at 09:51, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit 5288bee45fbd33203b61f8c76e41b15bb5913e6e:
>
>   Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-07-21 11:13:01 +0100)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to 75a8ce64f6e37513698857fb4284170da163ed06:
>
>   vdpa: Fix memory listener deletions of iova tree (2022-07-26 16:24:19 +0800)
>
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.1
for any user-visible changes.

-- PMM

