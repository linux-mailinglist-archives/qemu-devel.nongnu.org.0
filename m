Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89DE32014D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 23:22:06 +0100 (CET)
Received: from localhost ([::1]:46340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDEA1-0004P0-RA
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 17:22:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDE8K-0003pI-FF
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:20:20 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:46732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDE8I-0005Qd-Nh
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:20:20 -0500
Received: by mail-ej1-x62b.google.com with SMTP id gg8so5063323ejb.13
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 14:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uf43ygAveJohtEDo0znhTsZT/EB/Y64p9RSaOSO/oe8=;
 b=UXMT0w8WxvSiz3rueQszXS6GaIsrlhZcy5Spc4CW7BWOxPIWRqq9gG2V4baG33UAv8
 ucVF1/vCR+zmQiVl99IkDx2mfHnvd1H3p3/sV5kJtJUdIC7WG0ciAi60yQB8Uc8q6TZa
 C21d2VeemT5NlQL2RLk/I2PuDZrcct24KuZgXTpeqpL6uYK7Gl14GBeb0T7cd0JiXrWB
 z0dHpmjS+96RYpymxnb1WFPVSw2b2QRh+QSAVfUYLGm3CgbLM8j580Q3hVhysqtCJZ3b
 ubNvlpsMUjCkD5rQ3G1wiqfXvQD0FCvHGIi1tOGh32WL7iZP07SVMqPnzigg2u+J3+yH
 KncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uf43ygAveJohtEDo0znhTsZT/EB/Y64p9RSaOSO/oe8=;
 b=rSEZUTY1t/FpgCwuNT4HbsZlr4FIKwpu/R2HtGfPd06v+76L6jpOy9T2kvA9TZwk0Z
 C+RkG9rz30YKnalxbIKcJo04kpNC2LP10kJ0T7hkrWAb8ExCBB4CVbZiZ8p976gPw5Dt
 GLg8fDWB38CQ2psE3YSNF8dGfgC8Ao48mQobX5i90epr/zBtiFdyJdDpAvQG3APVhCku
 Xmy5OggxvuKVfPspD/6+GR4J9ODCtowYsqUNZKnD+eF4CF66cRvXB0yksTWjOWhHt4BE
 LV+dVbU1png3u4lrRdfDtYjGyMgLvH9ngmrAcEFmWsQFStnW8BOf0PsbQUhc30nvpTSR
 peUw==
X-Gm-Message-State: AOAM532Us8elLKWI0zQrPiaiYgEL8OOnUkt7r5D/uYviv9j/HEykvr+K
 z8h/Lszsy1hJq+t1yK0Kz2Nc5N/0xjOBr7M9vPfpNw==
X-Google-Smtp-Source: ABdhPJwnagE9r/Rs0GIyAZ+l4VJbSxz2KTEZ5Py3X/XbBKNHO4I61xBDYzy+ygfGI3YS+1fyIsLSTuvIwMdPk3Q30W8=
X-Received: by 2002:a17:906:4003:: with SMTP id
 v3mr6844587ejj.382.1613773216919; 
 Fri, 19 Feb 2021 14:20:16 -0800 (PST)
MIME-Version: 1.0
References: <20210219144939.604488-1-armbru@redhat.com>
In-Reply-To: <20210219144939.604488-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Feb 2021 22:20:05 +0000
Message-ID: <CAFEAcA98DKt4-yQkseREd2g6DWraueAj8nWevXpOXFoyAKXMrA@mail.gmail.com>
Subject: Re: [PULL 00/18] QAPI patches patches for 2021-02-18
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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

On Fri, 19 Feb 2021 at 14:49, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 91416a4254015e1e3f602f2b241b9ddb7879c10b:
>
>   Merge remote-tracking branch 'remotes/stsquad/tags/pull-plugin-updates-180221-1' into staging (2021-02-18 13:27:03 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-02-18
>
> for you to fetch changes up to 9b77d946990e7497469bb98171b90b4f3ab186a9:
>
>   qapi/introspect.py: set _gen_tree's default ifcond argument to () (2021-02-18 19:51:14 +0100)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2021-02-18
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

