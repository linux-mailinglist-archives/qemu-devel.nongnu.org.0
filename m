Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6F46A8316
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 14:02:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXiZM-00032y-8s; Thu, 02 Mar 2023 08:02:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXiYv-0002tB-Hr
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:01:40 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXiYt-00015E-H5
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:01:32 -0500
Received: by mail-pg1-x530.google.com with SMTP id 130so9720389pgg.3
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 05:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677762090;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=g2swlh73GjDI3O6ctw5HieBknwuaqrxEbvtnWF2Lals=;
 b=YdYk933yO2AmVAcR9C4R4z8+6yArYkvMAf5RxJAFXClND84x2foT2ioOF7pCVWDEcx
 CiypfrpgX5uMqkJ+A6eLcpkHVTZ1GapzIYXZA4+JtS5RyQdK3v1We5WebFkWoTLMBUTy
 ASPkqy0diSekLyEghg1EscVEaY44jTnxXkLml+MvCMrHekA8xRy6EnhRpYtxlQoYSTJa
 rZKOB+jprAjSEqvg4BDk7dJYcLmfnSbYUtPAV3I2QjzJ34hRKQtbUSQYpaaOfqaWF5tX
 oxXfbI6S9zqZCGK6bT9Upey/Kpln8lhsoK6VLqWbOYd2G+dGKhrzr1K4oh1V4ZBRVPdk
 v/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677762090;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g2swlh73GjDI3O6ctw5HieBknwuaqrxEbvtnWF2Lals=;
 b=VekcEZrzDzJlQHiFfXXYiPO+LDZJHrdDL3rdmZ4lIRifQaExWLN5L1hKlfPKwosKru
 MXByq9r9Hu4a2bLw29FhmrwjAuHhC81Nxed+7eRKecU32zFauaKE4uQqqXq/moREG3Am
 /l+k7AdjpYdyRXud5qoATupeFpyewQzsPvYpstERnCXX6pcCjw2vOA3fgqSG6+xk0/rM
 QIqAkVkwlrXLUtMDb9oQzMZqADIwBSFcjRBFyQ5k+7NuwB37Z1cDO6brjFZNvIT6m5An
 DByh46Bh8rkYCG+qjArNmLWgwqUHnWFkzRhwTBKStZ8Qv5k8O74n46vLKFjn/TCfuGgE
 UKyQ==
X-Gm-Message-State: AO0yUKW6+aDsbfoLzfzr5lCqU9jXZBSgQn8qyJzjoI3I1mqyCnAwUmzf
 YUcSQ43Ostx6CTsPW39fHB0sgsqSnQs+qzGBdUnPqA==
X-Google-Smtp-Source: AK7set8mRvGdVI9dpBM7TtSZaZCAwawvipDxlYT4lkesqNtewRnhflRi1ynZmh0khV/2DJrnEhuT7nml9OAogslNkSU=
X-Received: by 2002:a65:6a94:0:b0:503:a7:d244 with SMTP id
 q20-20020a656a94000000b0050300a7d244mr3348733pgu.9.1677762089951; 
 Thu, 02 Mar 2023 05:01:29 -0800 (PST)
MIME-Version: 1.0
References: <20230302070700.2998086-1-armbru@redhat.com>
In-Reply-To: <20230302070700.2998086-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2023 13:01:17 +0000
Message-ID: <CAFEAcA9VKsLTyeSNEs9RsmUN+T3jw=gXd7oeSR0=Hiq=QbX2ZQ@mail.gmail.com>
Subject: Re: [PULL 0/5] Monitor patches for 2023-03-02
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x530.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 2 Mar 2023 at 07:07, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 627634031092e1514f363fd8659a579398de0f0e:
>
>   Merge tag 'buildsys-qom-qdev-ui-20230227' of https://github.com/philmd/qemu into staging (2023-02-28 15:09:18 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/armbru.git tags/pull-monitor-2023-03-02
>
> for you to fetch changes up to 0f3fea217164e3925db91d46f21fc9fa11708e66:
>
>   target/ppc: Restrict 'qapi-commands-machine.h' to system emulation (2023-03-02 07:51:33 +0100)
>
> ----------------------------------------------------------------
> Monitor patches for 2023-03-02
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

