Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4035851FDDF
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 15:17:00 +0200 (CEST)
Received: from localhost ([::1]:53934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no3Fz-0001q1-BN
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 09:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no2md-0006Fr-3h
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:46:40 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:33419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no2ma-0001Iu-Ov
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:46:38 -0400
Received: by mail-yb1-xb34.google.com with SMTP id j2so24797644ybu.0
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 05:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ovxcnWPWswsNQ9jcZB+2fya9ylg/0wUy8y3yY+QynbI=;
 b=ddpaCRzghkzvJPVsE0ZW3yNDxTD9CbXsuBk/e3f0DQAB5lCpsc+jFUCipJ90cdKNxe
 E+YRQbJLoZoRD7IWmXnib774Jgw8CtqFRLBXlOsYata0gl1a4Tz1ujlDZ60LNT7WE50d
 1i3fQuVgntqSxxQy+ldIIqEjs5gU6SYb7CIiaGBSsev4OopdLGjnWrtfj2hGGDOL/pQS
 1ZJY6o1v3dDx/p24VbAT3gsA2W8mXdo5GN2vVH/dG1r3A43tWDC4UtrlSOVEqlngjGet
 gMCWcB2eMGEqZi2WLoTVMZY/EpaXic06qKBOddyVWBbgId9jIU3BlNgdWYXulfTzvf5X
 3Ggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ovxcnWPWswsNQ9jcZB+2fya9ylg/0wUy8y3yY+QynbI=;
 b=GKlbVldki88g+BDuN1sN8260c5u9y3tDzXmsfzREMEg8tY+QJcEczKd0y99pF/puvN
 pqa0YpJ0M6nv8EFDovYxTOHEUoUt2HDNUBFV1YhMpLM6qOLU3LKFTwKcNji9FYua8802
 AlY55r1PfwQTC/Ryifr6xtaYx1HPmh7aaGit8WdVYxBb4JmvVX32Eg7LGR9f1YscbYqt
 zDfpSd2cIB9J7a3eAkowVLXuzFJopKopSFxP9owsawehUoGkB/33DdD2jacUdfC+Ru9Z
 bfq9OQq+AYpoigjwVwz/iYCgPtD/wUQRkgrAaXsrDuRRgT87jnOhv0cCaCSGJ+puabZB
 zdcQ==
X-Gm-Message-State: AOAM530EJs/IaKvRXYRh5zXCgyOjAI8FyCzU9KNpsmLeloiw5Dd5mQK8
 svLWxZ5hGPD2R9veBVKsLVVcsqLTcoSxGh7Wce4sFQ==
X-Google-Smtp-Source: ABdhPJyAB2gGN4M5DOBD9A994mEn5ZVMHOiCfhFJCqXn4/c/P9vowFGY49UcuV8nOSR7QcNxXdq9qq/V6jW0mXO6mCs=
X-Received: by 2002:a25:3b8f:0:b0:649:dacd:2b4c with SMTP id
 i137-20020a253b8f000000b00649dacd2b4cmr12848193yba.479.1652100394933; Mon, 09
 May 2022 05:46:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220509084659.52076-1-philippe.mathieu.daude@gmail.com>
 <CAFEAcA-tC5hUcYa7Q_GOe=7_k=De_yw0mm2F21ALh6-2D5ChzA@mail.gmail.com>
 <47f863af-82f7-ec6e-a066-fec8509f34cd@amsat.org>
In-Reply-To: <47f863af-82f7-ec6e-a066-fec8509f34cd@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 May 2022 13:46:23 +0100
Message-ID: <CAFEAcA-32QFO7=NTEZMHD+RXg6qwt63a21pe1qfvxS50aLAH3w@mail.gmail.com>
Subject: Re: [PATCH] qom/object: Remove circular include dependency
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, 9 May 2022 at 13:44, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> On 9/5/22 11:41, Peter Maydell wrote:
> > Accidentally (but harmlessly)
>
> This makes crash clang tools such clang-format, I'll amend that
> to the description.

That sounds like a bug in clang-format :-)

-- PMM

