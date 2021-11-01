Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3E6441D07
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 16:01:01 +0100 (CET)
Received: from localhost ([::1]:39102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhYo0-0006ZO-2Z
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 11:01:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhYl8-00049S-18
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 10:58:02 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:51740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhYl5-00079B-05
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 10:58:01 -0400
Received: by mail-wm1-x336.google.com with SMTP id z200so12651380wmc.1
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 07:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xFPfbKPygkpzz0T1y1/2uxk+aU50Ktnft1tY5SeGrdA=;
 b=TITv8CjiaBNrYZUU2+Z8abaj0gZtbVc1tUT+3YuV76pwYfoYjy403bHZDHZIVgCr3o
 tEisrZQuUzHvy5M+1ML4ZQQPkhxp7yIFHs5CRLDk9skTf2QgDNdW7e2JT6EmQa6f4eom
 rfV7xkmKUBKO8m6B6FHPm6sfTH9vA6PTLhgTohbasOeE+dPGHU2S48L1fKLoRBT4iisW
 UrprtV7kckysS8oVCmmv4zF8HgT09hC/PRfqOieiX4cZT7W29mw7DE0baoJKl6m9YAgV
 EyXMO5+My0UuuPdEwOihTpg2BH5DswthVGlmVrV/5Z845jCO7FXsAThiBa8MkqEqtil+
 KUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xFPfbKPygkpzz0T1y1/2uxk+aU50Ktnft1tY5SeGrdA=;
 b=HLi2YNaPUa+C/Oz3ZUvCU9a6DVdvTYK0LI1M7jFYJgmKcmk3SMHqPLwRqNc+ke/ikG
 WttLHGc+CrS+bVCOg57cmoAxV3EALHiK1FG8Dezd1IXNZcqYuDbJ6Q7Wor9AfqdkXakB
 9h770aaU8ru7w3F5GCQsh8d7zqp5TZBdsTEcfDyVE25gRoHUnujDKAqkTM+vNPB/GRYg
 H3x1EGAT70uZtekvfbL4nToOFxfRNkKBQkgqrFiTYPmDo8bqMqLLerrBdD+raSLbmZM0
 wKtdTMp+PJ+2eiEeTDCm5fXZUy36Du599gv3aPAukgig3Ag3UPH6y7MdyXKHXhkq8Yzs
 jN1Q==
X-Gm-Message-State: AOAM530M4GxvoQFW67K+5XYUI84228UjTqY4MBuzYl9ZKIS/8grehTX1
 PFhJDuSVJEkW0TDvKQMij68bEDdwMNTeh0nw4xTqKDERcrg=
X-Google-Smtp-Source: ABdhPJxHuXpKKlrnyGYAt8j/QP/VJAu5MUl7ApiuwLJ2yGwi8qZ/wPnmy4q5x3J2/eoayMjMvQJGlIdboy0M3HrXpC4=
X-Received: by 2002:a7b:c389:: with SMTP id s9mr20444949wmj.133.1635778677544; 
 Mon, 01 Nov 2021 07:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211019090344.3054300-1-kchamart@redhat.com>
 <20211019090344.3054300-7-kchamart@redhat.com>
In-Reply-To: <20211019090344.3054300-7-kchamart@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 14:57:46 +0000
Message-ID: <CAFEAcA9qLe9dZmPQjm=eA-VFYnR8Hks0kmMNnyDpQF6mJg+RvA@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] docs/devel: Update the rST index file
To: Kashyap Chamarthy <kchamart@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
 Laurent Vivier <Laurent@vivier.eu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Oct 2021 at 10:04, Kashyap Chamarthy <kchamart@redhat.com> wrote:
>
> Add the entries for contributing-related rSTified wiki docs.
>
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> ---
>  docs/devel/index.rst | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> index f95df10b3e..f7bec644f3 100644
> --- a/docs/devel/index.rst
> +++ b/docs/devel/index.rst
> @@ -45,3 +45,8 @@ modifying QEMU's source code.
>     vfio-migration
>     qapi-code-gen
>     writing-qmp-commands
> +   trivial-patches
> +   spell-check
> +   key-signing-party
> +   submitting-a-pull-request
> +   submitting-a-patch

You should update the index.rst in the same patch in which you
add the new .rst file. Otherwise Sphinx will complain about
orphan files if you do a build at the commit where the file
was added but before the index.rst was updated.

-- PMM

