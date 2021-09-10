Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2468E406C8D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 14:57:23 +0200 (CEST)
Received: from localhost ([::1]:35700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOg5o-0002K7-FO
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 08:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOg4F-00008k-Iz
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 08:55:43 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOg4E-0004FD-7a
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 08:55:43 -0400
Received: by mail-wr1-x435.google.com with SMTP id m9so2509970wrb.1
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 05:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VbbRSLR6xC7PboKF6091sXue7ej6T0l++VZXn66QmQU=;
 b=lF/Sx+12PAUmt1pQ9JMjVLekkm2DUiWciuTEZh89Tnp0drzKonvp69mKTXQvVwcmx6
 LkaAenlkHOdTGtjKv8eQuZmJecJJFbzjQ6403/PwP6m69gLgN59ra/rK5KeZFPi2OTtA
 mgpf7VwaGW8yuVauCx6ZPVqMqloA2Fu9EOrEU9JYamfAl6DRpiAZsZ6jRB04+D08+h5g
 sm68llh1cWCIopN/T7IVMjl4svEYjX9nr5xTsttZVmbTJoNSPhs2mqUIWj/UaQcbLsXR
 0z8pL5OcLPScQunDhWht+4gLIf68Gd/19cx+X9QBNBnOo51DDIerQ1afUUzD40v5LUGL
 BoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VbbRSLR6xC7PboKF6091sXue7ej6T0l++VZXn66QmQU=;
 b=kbIAZWWs7FHmZvHTR/SCiQoz132SRIxVeAuy4ikpFfbh6WdQg9/+G6atVN5ig8uHS6
 lZwJBLDCObm5VUdERl91GqbqgsVnRmo/TUQroDEN7Udds/Sujei481n6Yj+HskAjOqf3
 Y0REQl1Oe7yypJrSAYq4+RHGlQFQeX27qZ6eDlClfuM12WoP8kN5AhiEBn37CP8f+jRo
 Cl7RkMhdGU87sfAcB4KO5btGjDvBhuyIhPElXziswzTlHvBKEvw/iB/Y8yy1nVf4LH1U
 bN+jO4TZiA7B9TG6NIeYwqYb+rurSYmXue4RqjjT+PordS1snR8Ohv+gie3EbsMWo/LW
 DJLw==
X-Gm-Message-State: AOAM533wNquVGp9Wwkx+PLmyHxj6XFoKXqbnkpnk029uelhH7lLKW4l1
 TiGO+HCzSr3mp5Z0D0GzygfKeQtromVyuqDKlQbrQQ==
X-Google-Smtp-Source: ABdhPJwimbr2JcCjJajY2dFRUt8coLmTkINsAfBGQbHHX9yn1/3UcgAy7zmNL/3ibmam2AjaSfj/pbgkTYiQSt3OlLY=
X-Received: by 2002:a5d:4647:: with SMTP id j7mr9670595wrs.149.1631278540136; 
 Fri, 10 Sep 2021 05:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <bac0b38fc7c5f7a5a1c91784eb7236de39b6f18a.camel@linaro.org>
 <CAFEAcA-k8=M5KQWoJ=yurAZuHt9=F9mb002Z=7T_EC6x5EP95w@mail.gmail.com>
 <909bcf70ba8d88d485ec0b36371633e54edef81c.camel@linaro.org>
In-Reply-To: <909bcf70ba8d88d485ec0b36371633e54edef81c.camel@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Sep 2021 13:54:50 +0100
Message-ID: <CAFEAcA8=7-hHEHyABS-FFPtacYvhFpwa7_PLVsC7-x_5rxjicg@mail.gmail.com>
Subject: Re: SMMU Stage 2 translation in QEMU
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eric Auger <eric.auger@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 10 Sept 2021 at 13:39, <shashi.mallela@linaro.org> wrote:
>
> I am referring to the latter,"purely emulated QEMU with an emulated
> SMMU that handles accesses to emulated devices"

In that case, the stage 2 tables are set up by the guest
code (running at emulated EL2), just as they would be if
it were running on real hardware.

-- PMM

