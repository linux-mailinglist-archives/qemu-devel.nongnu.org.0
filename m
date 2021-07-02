Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A063B9F71
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 13:03:58 +0200 (CEST)
Received: from localhost ([::1]:53766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzGxh-00083U-Im
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 07:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lzGw4-0006N4-EG
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 07:02:16 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lzGw2-0006dx-I6
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 07:02:15 -0400
Received: by mail-wr1-x432.google.com with SMTP id i8so12039722wrc.0
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 04:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Fs9xSkaswyUdEuasX5gtKwIeFhvs5U3sqT+/L9upbhI=;
 b=IF0/hxFPnKoVk7fMkI6Bf7S3/5NzNOWw/mGLy+g/BxP7yT4WqosmjLGCU8DIk6p+0E
 sF7WJYQSr1zD3gNdIhHMT5ijZPL46oMqWfIw7TFiGwVKlenQ6qvV0blRYe0DUFg+2sFM
 U+LvO1Eip4xo1Nmk22NvkcTEliUbG40wP1/gnEt4sKjzxO5Uuxafo8hZQvy3DCHW5Y/B
 eGsocAGtiz9VphuO+wkwlL1DCwa6NCZ1FyGwfRZ9eFvqiJ+OU+YrraXEzu03bfHlJOY3
 X98bGwobiyKkfchZzvy2CMzt3fo7bx83d9KNfuQJoR5ZJiEJlmcW9BP34vAfIY9XY3g1
 882w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Fs9xSkaswyUdEuasX5gtKwIeFhvs5U3sqT+/L9upbhI=;
 b=kf/nnSl2zqfxsKL0NiK6zgT4an4Q17EGYJdQsc7DHD13nauLM865LWzQuIummTiTeI
 RA48W9j3pqtHmPQ+h3kGGub/H9sLaNbb9BvVnEDwPeAaRhDL0UErrJUYhWUHQ12ZgWVs
 drwjrxrUg7gU8tfkNLtkACrs/hoPQWdUMsk3gKxepWEBWRjJqpN9bckS5p7nwT53PwSg
 KcG1N71wKegw0Sc6z14NcplIWJY5F7JgrZqm3LuFKz+N8NVoOfsiL68H7IIGbDkmfYoT
 shaGzn0Gp6jFHo5fr3Cl5gWhrLeAjUoI6LqAwDhnbVD3KghueL1evieA9yJxboCvyVuP
 xWyg==
X-Gm-Message-State: AOAM5339S9kNEAznj1qgfta0tSh8P6btzGsOD8zODmAKx1KRYQqbSENV
 fCPsswvuoyPsmgQM1k24/4E3kA==
X-Google-Smtp-Source: ABdhPJySSkOReBW4ZxZGbdGghl9HNgKmn5meM9CsnA13rv+kdNxxbDGLlmc/gZ09V5bjgT6Y8S9tbg==
X-Received: by 2002:adf:e10c:: with SMTP id t12mr5151447wrz.36.1625223732927; 
 Fri, 02 Jul 2021 04:02:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p3sm11234544wmq.17.2021.07.02.04.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 04:02:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E3F3A1FF7E;
 Fri,  2 Jul 2021 12:02:10 +0100 (BST)
References: <20210630012619.115262-1-crosa@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v7 0/4] GitLab Custom Runners and Jobs (was: QEMU Gating
 CI)
Date: Fri, 02 Jul 2021 12:02:04 +0100
In-reply-to: <20210630012619.115262-1-crosa@redhat.com>
Message-ID: <87wnq9nfm5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cleber Rosa <crosa@redhat.com> writes:

> TL;DR: this should allow the QEMU maintainer to push to the staging
> branch, and have custom jobs running on the project's aarch64 and
> s390x machines.  Jobs in this version are allowed to fail, to allow
> for the inclusion of the novel machines/jobs without CI disruption.
> Simple usage looks like:
>
>    git push remote staging
>    ./scripts/ci/gitlab-pipeline-status --verbose --wait

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

