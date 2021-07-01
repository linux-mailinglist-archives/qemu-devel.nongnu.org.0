Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A263B9693
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 21:30:59 +0200 (CEST)
Received: from localhost ([::1]:41514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz2Oo-0007jW-3s
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 15:30:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lz2NS-0006yh-EG
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 15:29:34 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:46956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lz2NQ-0007Vz-1G
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 15:29:34 -0400
Received: by mail-ed1-x533.google.com with SMTP id s15so9913861edt.13
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 12:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rLB1ZSnq3GHECediQzHytN28QHSFkkCupSitIkeJ59Q=;
 b=fQfRfgU5SKJmnblEPrWvfQTCQTc7ifvuyCKRml/bjBFwCguWIXeo8wIBC1DTFMX2ot
 VwfcxXypLXdZOhwMq4BtggUV0zw62B9opO1XdK+N9JkE8/oRaPybGI+JSGHAZHGoHvn8
 O903ud2UoahS4VJgR5XmpvIDUNLQ2Se1GeUB4kSXUI8enxG/iJ3DCR9rS3zQPGmCF08t
 GV52VxghBLhfYofA4q45Ws3l5VwLIIWZwbH8AgzaUTX0RqBdOxwrb2KAdLoF1pyeqbmf
 c3uPlWM3uwV9eZOOWmDAYauq4YYogV+L4rcemcPZtdkhhYISNF3+22JpLi4Q7N9gvDNt
 mDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rLB1ZSnq3GHECediQzHytN28QHSFkkCupSitIkeJ59Q=;
 b=NyDFJOhRTNTH5Tf2WwO13Em1ZFRRIaBG1uBd0DT204l/TATtvLxuC3FNMAaPrpHxQs
 rN6p/D6XWSMUoOxUd/WmpgW2lhI5hjaJCS6FuUWIwdzBGmHbWuZkZLrQtEZI+N17AdBA
 FAkdX+ONggFNV2mVzNd6hffvi5jJEkJ+D2GP5KX4YFo4CimB4Kv8jbxUUmVg5EeJMYw+
 R5zdIRwjB/F/PV5wV8ZK6w+LkLQoccXmyfTqH47NBPFZVrSatiPOwDEmUqmjAYfvjyYE
 S1UhZzwMFQDKns9FBdXVE43+b9pJp7Lbj7EXmktSrOezI4R4ENJ3aCW8LK3BkADeiQC7
 ZnkQ==
X-Gm-Message-State: AOAM530PcJs7zalpayhRn6JaEfQ9vFC4Lj1xaYghn5ADX3UaQX1TxqM3
 jsV0FhgQ9grFlJgGgNyIDr0gXe6xRaUqJ0k3S3oEXA==
X-Google-Smtp-Source: ABdhPJyqcAfEMZWrnTjTzFIFlOeCk7B5V/xMaBYm952AxlEPaV+HbCdd4ZfZqjoNNsG9wApbXTwGqkGP40SHzG2wmbQ=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr1899479edt.100.1625167770256; 
 Thu, 01 Jul 2021 12:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210701020921.1679468-1-jsnow@redhat.com>
In-Reply-To: <20210701020921.1679468-1-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Jul 2021 20:28:52 +0100
Message-ID: <CAFEAcA-OcZQGdqP=SP4AxWtk2aYoCO255kn-hR1wLHXSadtFBw@mail.gmail.com>
Subject: Re: [PULL 00/15] Python patches
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 1 Jul 2021 at 03:09, John Snow <jsnow@redhat.com> wrote:
>
> The following changes since commit d940d468e29bff5eb5669c0dd8f3de0c3de17bfb:
>
>   Merge remote-tracking branch 'remotes/quic/tags/pull-hex-20210629' into staging (2021-06-30 19:09:45 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/jsnow/qemu.git tags/python-pull-request
>
> for you to fetch changes up to 5c02c865866fdd2d17e8f5507deb4aa1f74bf59f:
>
>   python: Fix broken ReST docstrings (2021-06-30 21:57:08 -0400)
>
> ----------------------------------------------------------------
> Pull request
>
> Patch 01/15 fixes the check-python-tox test.
>
> ----------------------------------------------------------------
>
> John Snow (15):
>   python/qom: Do not use 'err' name at module scope
>   python: expose typing information via PEP 561
>   python: Remove global pylint suppressions
>   python: Re-lock pipenv at *oldest* supported versions
>   python: README.rst touchups
>   python: Add no-install usage instructions
>   python: rename 'venv-check' target to 'check-pipenv'
>   python: update help text for check-tox
>   python: Fix .PHONY Make specifiers
>   python: only check qemu/ subdir with flake8
>   python: add 'make check-dev' invocation
>   python: Update help text on 'make check', 'make develop'
>   python: Update help text on 'make clean', 'make distclean'
>   python: remove auto-generated pyproject.toml file
>   python: Fix broken ReST docstrings
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

