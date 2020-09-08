Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA696262139
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 22:37:17 +0200 (CEST)
Received: from localhost ([::1]:46544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFkMe-00043B-Tk
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 16:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kFkLy-0003YO-Tg
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 16:36:34 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:40680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kFkLw-0000Hr-5C
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 16:36:34 -0400
Received: by mail-ej1-x642.google.com with SMTP id z22so289247ejl.7
 for <qemu-devel@nongnu.org>; Tue, 08 Sep 2020 13:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ySz+p9C4GRKIxhctPGUinz4OrIh9hOWfLSceoQHGW7s=;
 b=k3ZpZlXJvDNSmRme+tn9tTTBvKtiQzRe7JKKVF+Q8O8lUg8KEIvh5BGDAgZ7j5B7ev
 EZrsEW1tZvK6ZOjfM4yJrMU9Dtbdzg7TibYGP7fAvzgjnzx0FFvIS+OmyK4hPTSseEiM
 4E2XdyfeZXc92AujBNx6jBu3MWL8wHp1/AQ/HmjjvykfozAWt30Ehj51ASd5kHqTdFe0
 mjRDS6EcEXjxxJrxeMzGFTM6/FDl2vOOZWg1kHVhmdUSFVl8/UPoZwT3sSiqcZHzA1Da
 dW9FIlRMZ+kktQTJ5U/46drAykNwvgW+SHzqoeQW/5lmdSpPcSa625QKV6IascXnqMIv
 I1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ySz+p9C4GRKIxhctPGUinz4OrIh9hOWfLSceoQHGW7s=;
 b=gQVQfgZOute1cQAqPAlqjayu/fjChlbopl8vXOJ75eC1hhKSuGFHukN51md+HgW7vk
 LIiQgdxjcTbC1hokOp38Gaa2hXF9CbmMktMaXkR5nHfdNX5CFR/Gd5LCTyAq4Gy3MA4K
 eP5T8bW9l7VnLU/bY0z874X4XjyUNh7bEnp391qZtwbfjsJFFGvyQGTYmeVRJd/dyvTG
 w5wFE3oYHT2ciOdnQHvZpCfYuESmbm9Z5OgDuyncGRs6fCzjkITvYfSYAIqrj75kkR7W
 2g3QqXtTh7ubzhiQx3oKPx6ckpg09+/4GEnhEgX16QpHHI+Bj3Vpme1CWV6TlFlbycRU
 WlRQ==
X-Gm-Message-State: AOAM531NBHN7xt4/fDnzteWxhjyoduavt9sL/geDiki84SRJ9gkIB0/R
 ST5p13Er5Df9mrPqygcspoJvROQPhwA0ukeagZghrQ==
X-Google-Smtp-Source: ABdhPJwDOf7kos+VT6KKmjbw/fzckOxY9I+t4QT2PWy+hT9RBFdxvybregG9KeIowgzx87ZVV47Xjt7dy4Y/0waL5oU=
X-Received: by 2002:a17:906:24d6:: with SMTP id
 f22mr236466ejb.85.1599597390339; 
 Tue, 08 Sep 2020 13:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200908194820.702-1-luoyonggang@gmail.com>
 <20200908194820.702-3-luoyonggang@gmail.com>
In-Reply-To: <20200908194820.702-3-luoyonggang@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Sep 2020 21:36:19 +0100
Message-ID: <CAFEAcA9PBBqykwBqTzQiYbwK5qZmhEsdn5ZURGHaFNPgoE0vvA@mail.gmail.com>
Subject: Re: [PATCH 02/16] ci: fixes msys2 build by upgrading capstone to 4.0.2
To: Yonggang Luo <luoyonggang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Qemu-block <qemu-block@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Max Reitz <mreitz@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>,
 Peter Lieven <pl@kamp.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Sep 2020 at 20:50, Yonggang Luo <luoyonggang@gmail.com> wrote:
>
> The currently random version capstone have the following compiling issue:
>   CC      /c/work/xemu/qemu/build/slirp/src/arp_table.o
> make[1]: *** No rule to make target =E2=80=9C/c/work/xemu/qemu/build/caps=
tone/capstone.lib=E2=80=9D=E3=80=82 Stop.
>
> Subproject commit 1d230532840a37ac032c6ab80128238fc930c6c1 are the tagged=
 version 4.0.2

Richard H says that last time we tried to move the capstone
submodule forward there were "all sorts of random portability problems
across old/odd systems", so this is probably likely to have issues
when it gets tested on other systems.

thanks
-- PMm

