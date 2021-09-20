Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ACC411807
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 17:19:52 +0200 (CEST)
Received: from localhost ([::1]:54076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSL5D-0000we-3h
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 11:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSL2S-0007FJ-9m
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 11:17:00 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSL2P-0006Gw-Kt
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 11:16:59 -0400
Received: by mail-wr1-x429.google.com with SMTP id q11so30732056wrr.9
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 08:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jWzkuMJT7N/IQKaLCsBocJXKlAa27e5m9SzTzOh5fQI=;
 b=ofN+5eXEAobfDlSujjn4tNQMAnRlpTzvxLWfHsGsGOACtZgdSjDfgzRoPenZMWOVIS
 7dUVBDw0HuWboH1C+uXZtqu42DNSYTltUamo5+dM/UJDCGRW5pYnrA+PLkvEYWr7dEqw
 x22AHCcbiIj8eK9WTveQ4xC4ElUrfytFXaESfxcWeuAMiCrXQ/8Vl9cFPkof8jwVUU+w
 5Ihqj28SuJJKhdIoE7IBYeSIIG9N3gwS6FL/VY35o+nGvRyBCvF9gYJO2GD3ye0KnZIj
 poEL2mNnOxJj6jHTkv4vBDTS5HpmrQ2SzQP+6AOoG6mUHuc/JIU5HbtA/lPBXeFA9t97
 9amA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jWzkuMJT7N/IQKaLCsBocJXKlAa27e5m9SzTzOh5fQI=;
 b=bBb7XVU/3Y88Vk+x094w0trqSq/9+GckS4+6zOysD4ODUwYaYk17Zv6r0OczA0qvet
 ro8up3iK8SF5D6SJLI1u4v2ZTbrr6Hx1x2D02S8bfCKmcKDY0izP0JJ316B3OdSFftBb
 iLBVZnAc1s6X/K1aBK4oFyc+XqlLQX+wVladJ1PUs5A8HgJSgmGyic21YFFRpncwgSpj
 m5HUpGWaer6xrxlv9tOjl+6bsWFo5ASV5LfABPmodq8Xqem2ySgJSAzOL9X6gh0PNMQT
 zwikGmiNzhG7yfhD/IhyChEzSmkeGJ3BQ7Fgh9sYizNYj/1KAZ4KHqGWXEbu6qGlh7oS
 9JYw==
X-Gm-Message-State: AOAM533iyrPtmK1kqDPfApN3mVPeYpZL3UItVLRC6hW20RewmXWuZyi7
 kDaFr4TVtslLVcb+VdVNPZxBv0F+BrSW/gVa1/dy5A==
X-Google-Smtp-Source: ABdhPJzfPnlLRr+z2JiF8WxCT+BXHfS6BMAxhgQ0QdFSCLpYEgmDF0gYstFpTcpw+qIX+DRoT00GjgBLn3UsqihQDPo=
X-Received: by 2002:a7b:c194:: with SMTP id y20mr21116832wmi.37.1632151014837; 
 Mon, 20 Sep 2021 08:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210916220716.1353698-1-jsnow@redhat.com>
In-Reply-To: <20210916220716.1353698-1-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Sep 2021 16:16:03 +0100
Message-ID: <CAFEAcA-kgJha=Uv4BWD-7XD3tdPiY-wadHZuuH5PMmuDkkOwfA@mail.gmail.com>
Subject: Re: [PULL 0/2] Python patches
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Sept 2021 at 23:07, John Snow <jsnow@redhat.com> wrote:
>
> The following changes since commit 831aaf24967a49d7750090b9dcfd6bf356f16529:
>
>   Merge remote-tracking branch 'remotes/marcandre/tags/misc-pull-request' into staging (2021-09-14 18:14:56 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/jsnow/qemu.git tags/python-pull-request
>
> for you to fetch changes up to eb8033f658e8b6f23ba9f4ef4a1b55894f7ea486:
>
>   python: pylint 2.11 support (2021-09-16 15:04:04 -0400)
>
> ----------------------------------------------------------------
> Python Pull request
>
> This fixes the check-python-tox job.
>
> CI including optional jobs is all green:
> https://gitlab.com/jsnow/qemu/-/pipelines/372151147
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

