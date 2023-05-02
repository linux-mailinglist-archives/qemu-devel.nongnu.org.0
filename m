Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBFA6F4300
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 13:47:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptoTD-00019m-Vn; Tue, 02 May 2023 07:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoT8-00015x-6Y
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:46:54 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoSz-0008I0-Lf
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:46:53 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50bcb00a4c2so2247660a12.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 04:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683028004; x=1685620004;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WB8D8zYeOJQjGExoue5OPNUooVJ4H6vGeN6Y+3hnRAU=;
 b=vNlooNr6Dw3y8+WxqJ5wXD1uLAp63floPBgTVFcZ+CgSFBp/TtsUej2ToubRWNhUdX
 OLllu490G45TRLIt5FfW3aSuqpcjIygX+D+uIlU4EoZw67gt/wX135LgZUDp0naRo0FI
 Vwtt5c2GoY6K50E2bZH1Uprpv2K8d8AEEUPrN7Md6KJhXVUYf95wG3iXtoh9d8foIzb4
 2ql9joHWsYwb5Wea9qYKrjOH9udpaa870Ztv/pi76MGditPgLRx40S5ZeolaHBEELVNX
 VWT6We09Tlfawv3RitLU1THm+5miWPPoni6lCea3G6GhSfb6dnul3zXuHotvnnVEN8Qz
 0Bgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683028004; x=1685620004;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WB8D8zYeOJQjGExoue5OPNUooVJ4H6vGeN6Y+3hnRAU=;
 b=Tr9n8agJDMTGkHPVsw3ECR1Mq/D4HbCwqHgGNRBqh2x1Y10BtjCkwQuh/sdMIHczBb
 ldTyxU2jMwWYk2qSSBMnq7oN6OwEHBniNmLKGfdIrPJis2JZefQjq1WcBW3QAo+vHjBo
 eUpf1P11MC1BvvDOdt9x3oNFodSvgpnyNtWhivhQPv0Hm4KV/4FuMWVrGO726h2JfiEg
 icpsSp4g5lObeW0gFfNh2/8so2iXlPO9HG5cDS2hEL5LA2PQ4FAEJchV0c9H1EVHIWw9
 yPXE1iMQLZyF6qrgQEHprJOkDKAwx0gLUEZQnx+UeQD4R07uBPnvVpGMkIC6w7ewT5AX
 wpHA==
X-Gm-Message-State: AC+VfDwnDWvJxj5UcYqEmwoeU5YmHBqma7qgXbOG6EH69eCszK3A3KAs
 l82rHlH3qyw+IzQEwuGyS42X4Ef1SlZnv19UfOhtObRmf3LTg1ro
X-Google-Smtp-Source: ACHHUZ4v1Tk8jl96GsDHK03TiYB3+Dv91efUTYMTITv8tKXOxfdqauLh+EBlr63hzL3mAXJve8V+MjXtX5Q0+lg3Rz8=
X-Received: by 2002:aa7:c789:0:b0:50b:c804:46b8 with SMTP id
 n9-20020aa7c789000000b0050bc80446b8mr3808880eds.31.1683028004138; Tue, 02 May
 2023 04:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230427154510.1791273-1-alex.bennee@linaro.org>
In-Reply-To: <20230427154510.1791273-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 12:46:33 +0100
Message-ID: <CAFEAcA-nvqJtP0Ez+1juneRTsUkUB53CsZV0CfhLUWe83M0GTg@mail.gmail.com>
Subject: Re: [PULL 00/18] testing and doc updates
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 27 Apr 2023 at 16:47, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit 1eb95e1baef852d0971a1dd62a3293cd68f1ec=
35:
>
>   Merge tag 'migration-20230426-pull-request' of https://gitlab.com/juan.=
quintela/qemu into staging (2023-04-27 10:47:14 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stsquad/qemu.git tags/pull-testing-docs-270423-1
>
> for you to fetch changes up to ef46ae67ba9a785cf0cce58b5fc5a36ed3c6c7b9:
>
>   docs/style: call out the use of GUARD macros (2023-04-27 14:58:51 +0100=
)
>
> ----------------------------------------------------------------
> Testing and documentation updates:
>
>   - bump avocado to 101.0

Did this change the behaviour of 'make check-avocado' ?
Previously it would continue the whole test run even if one
test timed out; now it seems to abort the test run when the
first test times out.

I don't object to the current behaviour, but is there some
command line option I can use to force avocado to complete
the whole test set even if there are failures or timeouts?

('make check-avocado' for arm targets has some persistent
intermittent timeout stuff still, so I generally prefer to
eyeball the failures and ignore the stuff I know is flaky.)

thanks
-- PMM

