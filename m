Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9462A4C0C
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 17:55:07 +0100 (CET)
Received: from localhost ([::1]:50596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZzaM-0000Y9-N1
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 11:55:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZzYf-0007Un-Rz
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 11:53:21 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:45645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZzYd-0005In-SN
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 11:53:21 -0500
Received: by mail-ej1-x62a.google.com with SMTP id dk16so24597056ejb.12
 for <qemu-devel@nongnu.org>; Tue, 03 Nov 2020 08:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ow7be7yIvwyZTgIltesRgojMz53wBXNGdbCtwze2KlM=;
 b=cJ7U6h4wcOzfX1GMlP43INRX0mRHwzMsii8v/rOMH74NlqMATOikI/0rr5X+rvBkbc
 bzhE91QEKM0hP2d1xYMhdMtza9d/CFa0hKAePJJbkzkLPjPqVPT/7RerfVa5C2mq/fMW
 KJfJVgw5prLWZVm0VUZa6KeE7vshCeHid8GqV968okGQxevtKP2umjhQZoLO+tVn+14P
 hFPuoKyN6xLip0+kCvJ/gJmJrVmJ/WwnaJ4Za0JoeSk+O7IsGwueb+nDlkGe7teavEQ7
 5MuhvEn0n0L+tamLamiL1EBvodHxF4guUEjjDLoNAHRlsE4MueqVEZlDWrcYtjgDJXTE
 yYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ow7be7yIvwyZTgIltesRgojMz53wBXNGdbCtwze2KlM=;
 b=T6uZ5nksRn/LxEwH26KlA6odbyJlGYk6SJLJ947V0tXajMA2CMqIBzE2wdpO4FU6yj
 icgpaRH5imoQoPK8y03GO/QhdbwH3mq9kyEKyGGV2TxpQ8s1BaTvrKNKsFYwmmiVpHSp
 mDgnhHtWJIiLh7b6uKURcwIeemu5Df/iW6nXaJ+8TXuSgWPw+1R4wwNLp0MZw96QTxOs
 TZKQtk7Zn6SajMeoh17rjY5Y2kZWPVYGDQs6Cckje+tS6pThTM7JZRjeEtV+1rxKWadm
 bTYWdjji00lOOMZi68DSCn9G0vCgXB99e7lPwmxZAYbjhVZjfMihakPViGFhxRAOxxmY
 +DQQ==
X-Gm-Message-State: AOAM531wIgwA1LyHlSqKl6fvaxG4gjtSiEK1iVU0Clud2WKAL5om1WAt
 EEwDm61Gy5C94qy5U9qC128fFRmqysEZXuqfgJC0Hg==
X-Google-Smtp-Source: ABdhPJxUDRDFdTDMYyh9YSE3pTkQ9Qnj3iT7PWQzotKdBEhw22n8zLwv4aj2V9buhYnOJJYUGwBH+6/gu0KXcoadEnk=
X-Received: by 2002:a17:907:9e3:: with SMTP id
 ce3mr21193352ejc.4.1604422397843; 
 Tue, 03 Nov 2020 08:53:17 -0800 (PST)
MIME-Version: 1.0
References: <20201103152658.119563-1-kwolf@redhat.com>
In-Reply-To: <20201103152658.119563-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Nov 2020 16:53:06 +0000
Message-ID: <CAFEAcA-x8ZNNrke6if1WLBiyxYRQGrjSzYw5iBdGZt+3yZZp-g@mail.gmail.com>
Subject: Re: [PULL 0/6] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 Nov 2020 at 15:27, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 83851c7c60c90e9fb6a23ff48076387a77bc33cd:
>
>   Merge remote-tracking branch 'remotes/mdroth/tags/qga-pull-2020-10-27-v3-tag' into staging (2020-11-03 12:47:58 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to c9eb2f3e386840844bcc91e66d0a3475bc650780:
>
>   block/vvfat: Fix bad printf format specifiers (2020-11-03 16:24:56 +0100)
>
> ----------------------------------------------------------------
> Block layer patches:
>
> - iotests: Fix pylint/mypy warnings with Python 3.9
> - qmp: fix aio_poll() assertion failure on Windows
> - Some minor fixes
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

