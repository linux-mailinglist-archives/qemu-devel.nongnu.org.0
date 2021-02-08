Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC6B314180
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:18:34 +0100 (CET)
Received: from localhost ([::1]:50622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9DvV-0005mv-Sj
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:18:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9APS-0005t6-Dt
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:33:14 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:40082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9APP-0003oC-Gl
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:33:14 -0500
Received: by mail-ej1-x634.google.com with SMTP id i8so26192555ejc.7
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 09:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gt9gmbvF1Cp1vQXf+j4LT1w44Duk4dOnVoA33Ja26ZI=;
 b=SY3q6BUKDCp7rYFBl24AlgmdDcgUphmXw5H3//1x+2QoYoSeJpvkPFOunfRy56upUM
 O8Qheg+rhAADnk+YyFB3oafyfkMQ0cFFzSy9AraPGoLTDcJjTn5ISNVo9YKE8Et1AFbF
 4Gx5tF8oDSII4Gm+gM0KPniDNh7N6+jnO9WwDNGF3MnwFecZw04uVZBrYLthQbTZzAXm
 HUITeaHaeYAWH0M66MYzgsAwuJkes4DMxqManol2LjRlaBWGbn1BkNfqw8h+nG1r1/im
 SJQBQX/1RI/sJroKKFqT9Sik1kdTCh8hp201kMgq+/2UguGh0IH7ux547iju3/lrvVj4
 lyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gt9gmbvF1Cp1vQXf+j4LT1w44Duk4dOnVoA33Ja26ZI=;
 b=a+VRwq8Pm3Co5nVwssytxwY2MJAk8mCth5qJV/f9pjEE7w73rYe8RbCXS/nzi0l/ND
 EBQbMugZzhAORLePM76WleWSJMh6Vkzh89YMeXRJRpbPXydfJe6C3TyzPDVO7fYKBbpJ
 DIFBeWqwQJDLAn6oAiDA0q/u6k3wSSdVIFf9NUr/ImSOhWvLl9E7skFFrtmzBXm42Ury
 3BbKuZrLPLeDRHF/QIXXrq8BbgS9rawRsHjkzoJxd1qZUTR3w54oepERSjzTL28ZpNGS
 338teqqweyWpoXdi2EJaHGtGNFUnGpfSQ8PZO3uV1dRI/Grxv8NOzHV5TDjOtPRe2aIW
 DjvQ==
X-Gm-Message-State: AOAM532XQFXchES529FshUlW6UsXvbJdtYUBRLT8TKVZVVPihTUcTmvf
 hG5o49VfrScvDTSz3Shb4+ScSCCfZOE63/34es+yUvlQDOk=
X-Google-Smtp-Source: ABdhPJw092+7GJfOXjoAebG6mu2el7WQ1Pul3bDTD2KxMErhAKb2mdNDgeLgcjasdzhxJETEe9WBuBeDu1ZdwvN4azg=
X-Received: by 2002:a17:906:2e4f:: with SMTP id
 r15mr18053453eji.407.1612805589862; 
 Mon, 08 Feb 2021 09:33:09 -0800 (PST)
MIME-Version: 1.0
References: <20210208135846.3707170-1-armbru@redhat.com>
In-Reply-To: <20210208135846.3707170-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 17:32:58 +0000
Message-ID: <CAFEAcA_6z7gRrid917cQEY_qTyo05OWv=TGSq1MO4vVfhbEu+A@mail.gmail.com>
Subject: Re: [PULL 00/16] QAPI patches patches for 2021-02-08
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Feb 2021 at 13:58, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 6f0e9c26dbae9ac18b89d359791008fe3432ca91:
>
>   Merge remote-tracking branch 'remotes/dg-gitlab/tags/cgs-pull-request' into staging (2021-02-08 11:11:26 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-02-08
>
> for you to fetch changes up to c51172667b64abc570640f141ca3bf7109fbbd17:
>
>   qapi: enable strict-optional checks (2021-02-08 14:15:58 +0100)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2021-02-08
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

