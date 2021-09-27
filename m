Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7FF419840
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 17:52:29 +0200 (CEST)
Received: from localhost ([::1]:50676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUsvc-0000SG-0b
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 11:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUsrS-0002jP-ON
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 11:48:10 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUsrN-00009Y-JF
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 11:48:10 -0400
Received: by mail-wr1-x435.google.com with SMTP id w29so52643096wra.8
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 08:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R3KqxkzcK1M0yo0BVliot49a8nFK88zg8L7Sa//efag=;
 b=hjR0mdiybl/R0LaHDKMtB6g2onPoISQim92GZcYhi6nwAa1KIUhRfA0A1eoa3V6zQ8
 PpcHS60letuadildZdo7zBV0Mgcc/mV5oPoU0aM5QloIOcf0uSghO3c9FR323URJQgSy
 KTl7dMRBSMJ/ypIeY2KgU+ByKZv4YadbjKPyXuRFfyeE1ZtT0zDczy+79TZafPGMMp7V
 h/adZrL/3r+UDSkFigz9FMW4O/LY2saXUsdea5GxcODz0hAxeg0k5uiDu/bgTRNmhZYV
 nUjx/zEtq8Q0d8Z+fcLd129XmRFHA4kbErBKXT04K/vFpMxK/VvoS6R9badlYLf8uQOd
 RzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R3KqxkzcK1M0yo0BVliot49a8nFK88zg8L7Sa//efag=;
 b=m+Dgz6omz1yhnK2ThRRE7Ft93RSIw5I9EOJjTi4ps5kL8heiKNuR7dXfb+s6ZaFonI
 qMERzKwtOV8UxyvOvdEq0jJq2gwjNE4K94IIjDBsF0wr+YHW1QnhqyK0pO/oeND7QQ6f
 Ryk7RcYmklNPS+G79oype5zP25r0BW0b/wIXR2OIMXkVsAPtOaF4PSrMqLZE2+prjftT
 5dRqtc08hbt0NpOasPotEwUnUHia5fw5JR4U3igmhbNUaWJc4me259Qf4fyMz+v50AEp
 CWXXycpwqHi+sN4KhJF0+BN3g11FR1FcGCkzDEagPm5YUMpaH5RPxXVfa+Oig2/bbCB0
 bhkA==
X-Gm-Message-State: AOAM532K/or1FaAw+ZSR68GrHhA/GgjH2HTBvA+6R5yByzX33NqmCgBv
 X1oAff7P5DlUM3fywVHfjuNJBD+LplSR4Vw3FMMwsQ==
X-Google-Smtp-Source: ABdhPJy4kOsw4R8XvQLpcLaYcDK2cJ+3dqggTozB+jWA4n56l/8iA07CKLYoBRZJwY6UmlSkdXPj3apv1EX/eXf2b9U=
X-Received: by 2002:adf:f185:: with SMTP id h5mr664507wro.302.1632757683594;
 Mon, 27 Sep 2021 08:48:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210927130647.1271533-1-armbru@redhat.com>
In-Reply-To: <20210927130647.1271533-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 16:47:10 +0100
Message-ID: <CAFEAcA8ieTxXLSqHj-_Q8mTNmXrFed+y5wLQac6KkQ0A-FDe=Q@mail.gmail.com>
Subject: Re: [PULL v2 00/25] QAPI patches patches for 2021-09-25
To: Markus Armbruster <armbru@redhat.com>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 27 Sept 2021 at 14:06, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 11a11998460ed84d9a127c025f50f7234e5a483f:
>
>   Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20210921' into staging (2021-09-24 13:21:18 -0400)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-09-25-v2
>
> for you to fetch changes up to f333681c6e277004796b0bed808697da1280d140:
>
>   tests/qapi-schema: Make test-qapi.py -u work when files are absent (2021-09-27 08:23:25 +0200)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2021-09-25
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

