Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 820114C8998
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 11:45:41 +0100 (CET)
Received: from localhost ([::1]:33780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP00i-0005yz-AB
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 05:45:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOzyl-0004yz-KH
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 05:43:39 -0500
Received: from [2607:f8b0:4864:20::1135] (port=39359
 helo=mail-yw1-x1135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOzyj-0005Ys-NA
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 05:43:39 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2d07ae0b1bfso139548177b3.6
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 02:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=34jaHwAsn1GS4jiZzitztpzhzuRyuPyDxEqyib98OVc=;
 b=uuy6ZnTcCF2SiSE71N3OcYKnZ2VTs8AwDtzgUeSdAUuyf4ssB4a9SmH9NIyRE7HH4D
 HRlLBAFc0sBPtFr2fv5qVzplI5R0i7giL92OxTncgbJ6ZDQ7dHZvEOLwqkR8KIs45rAq
 6ezzIMm1TUDhZCNy6IqT8glDoVt6NCXWVyQhqEHRkDHNhBiNHqVzxwv2i0h5AY4fH5mR
 h/xRr/JfydfmWb1bGauBn/GeD3+hbEHLPoYWTJwMnAu58g9ugqxizGSvChWq1NUqoYf7
 mRqmpG+vsMoET0Scq/eHHzmQ6ovxCKwNhUhKHtSPgmctmh/lTPqKNAoKdOJ0Sj0YA5dA
 3m3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=34jaHwAsn1GS4jiZzitztpzhzuRyuPyDxEqyib98OVc=;
 b=IvnYHKgw8iuYgiOtgRVmrX5BURi/8OGR7RJvC4MgVO52K/IwAHeDoYkUucAx6yK0rU
 AP5TrGz9JFKQTweJys1mItNxPvmWdPqytl/j5uARr1CZyMIzuRLOCP9b6+SwDjWX9T1K
 KhdwKrVokvetBI3UFAudGvyvWTr4V2/C3UlPdk+bCR5j7OGf1NqQtxvG8PTjZD6fUpgx
 vk5CXgSUSC9czmAPo1nXFeeMadc+kpzR3OKxZKl8WUvD9rnOriA9T5Cxq44g3P6OyxMo
 RDQMs9vXsWxMInpzhOcnQ1z8I0BTRKop+saawD3bM5LJazxram5EnWLXqNrYlv8aJfFr
 q6MA==
X-Gm-Message-State: AOAM530KMBtBHjJvWoXnMw3ww3tUcTj1LRRjHDmvrj/N082QeS3qr5Ry
 ihrFkNYQOkRL7ivXy05J0AerOFQTAvdr7BAitC3Mwg==
X-Google-Smtp-Source: ABdhPJwrywELiR+/An1J21AytfCPQfw9tVG6YYo2R1kBYrdgWwpIgab0TCD58w0nfSV2q/qXjSh1ZGe88Xga4EtwUq4=
X-Received: by 2002:a81:b49:0:b0:2db:f472:dfca with SMTP id
 70-20020a810b49000000b002dbf472dfcamr573650ywl.455.1646131416589; Tue, 01 Mar
 2022 02:43:36 -0800 (PST)
MIME-Version: 1.0
References: <20220228071239.404171-1-clg@kaod.org>
In-Reply-To: <20220228071239.404171-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Mar 2022 10:43:25 +0000
Message-ID: <CAFEAcA8Lj9yUdmWGMme0-wuMD0BWLCKzWPfdfo069W276Z5Rpg@mail.gmail.com>
Subject: Re: [PULL 0/7] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Feb 2022 at 07:12, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit c13b8e9973635f34f3ce4356af27a311c99372=
9c:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply=
-20220216' into staging (2022-02-16 09:57:11 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20220227
>
> for you to fetch changes up to 3671342a38f21316a2bda62e7d607bbaedd60fd8:
>
>   aspeed/sdmc: Add trace events (2022-02-26 18:40:51 +0100)
>
> ----------------------------------------------------------------
> aspeed queue:
>
> * Removal of the swift-bmc machine
> * New Secure Boot Controller model
> * Improvements on the rainier machine
> * Various small cleanups
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

