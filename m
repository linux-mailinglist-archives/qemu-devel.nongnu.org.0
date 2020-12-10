Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3002D6113
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 17:05:23 +0100 (CET)
Received: from localhost ([::1]:46008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knORW-0003By-7z
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 11:05:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knOM7-0000Zk-Q4
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 10:59:47 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:38102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knOM4-0005Ia-9n
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 10:59:46 -0500
Received: by mail-ej1-x635.google.com with SMTP id a16so8023971ejj.5
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 07:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pnMfb4nIrEoo8GL32TDHnNQbihMczpvxnFnZHD1Zv+A=;
 b=m0JakkM//DzberOp3cq/6vC3+4HhNVd1dWie1oxzQ8BmnSm5VLqmFf5k28j1/HgMgh
 zt7sm5irW4KMEzP93I6r45zFO+8Wl4Laiqq/dw2vNK1VGy6lpBPAmsorDzJ8ekSnvQtZ
 9YSmBbBCDMfvfdsMY9w3vT7EH9mkSwFL3HRUlN6a9hfImDsMvIvS3gh7RV/kW2nrF6Ty
 1/bsPi5pdLHKo/0VBs/cNkNNwbY8d3esFf6GncJftUb0BpnRFWtgS2pKW54wCmKMxcPC
 ThJEldFafJyBMoxeuI/Nmjp+iJHiQpmuZMQX/hqNnhEdEZTbHYzhwPx9vahzRzPw84iD
 Soug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pnMfb4nIrEoo8GL32TDHnNQbihMczpvxnFnZHD1Zv+A=;
 b=EAjXCr5NLWh7Ht0Ov6seb45X6xIJDhdjum9kT3Sz1X+hp+Osxfiz6ukMGD4apkF8Xv
 lssp9H9HFwL0nbCHVX4DvxorlEP7YEppHwtX9yv8CDSXCsJCkeCpKsYn1K5RSUf8O5QA
 lQu7xwX/CyF6+3pejBCn10SdWaSxPPu49uV70fxq5xJDcSFzHXYhuNrtXYXnVmR8TuRa
 Oo/ziB9znbrKvJu+LO5KRBuXKgCEo0VqvjsbOym4XnitDquilLABJ9UQTKeJ7vPlV/cF
 Gt0C/NCZ+6/CkRNfmMd9VahxgDfU+ZdZU795LfOUz0NtW1e4RhCoocEDEJqUkMs8mPRU
 qw/w==
X-Gm-Message-State: AOAM5334FheokN3+eIpDSi6CrDYI7fRKFDPtKJqdndei+pu55cLdCZDi
 eSa0pB37hlQvGPgbOw2W2mfz6ceymvxgHAmHwYhGCQ==
X-Google-Smtp-Source: ABdhPJwFlgt6ZWKbUja4kcjbZT+9C7PM4UL9dcV/jkMcv+mg+nsboa4d7JOXcC1hAs0qBTuHCYuHcPhACIqCCWEHmts=
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr7204491eja.250.1607615982359; 
 Thu, 10 Dec 2020 07:59:42 -0800 (PST)
MIME-Version: 1.0
References: <20201210125115.1812083-1-clg@kaod.org>
In-Reply-To: <20201210125115.1812083-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Dec 2020 15:59:31 +0000
Message-ID: <CAFEAcA94t7wqLM+g6xzpybRGVCmDOB8YHTEnyFg+ePODreDWqQ@mail.gmail.com>
Subject: Re: [PULL 0/5] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Dec 2020 at 12:51, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit 5e7b204dbfae9a562fc73684986f936b97f638=
77:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into stagi=
ng (2020-12-09 20:08:54 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20201210
>
> for you to fetch changes up to 6f5f6507e49df4820207a94f3aeaaeab08092d32:
>
>   aspeed: g220a-bmc: Add an FRU (2020-12-10 12:11:03 +0100)
>
> ----------------------------------------------------------------
> Aspeed patches :
>
> * New device model for EMC1413/EMC1414 temperature sensors (I2C)
> * New g220a-bmc Aspeed machine
> * couple of Aspeed cleanups
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

