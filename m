Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DC83204A6
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 10:15:49 +0100 (CET)
Received: from localhost ([::1]:37698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDOMe-0000qW-UB
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 04:15:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lDOLs-0000Qj-QT
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 04:15:00 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:35642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lDOLr-0006Pm-7e
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 04:15:00 -0500
Received: by mail-yb1-xb36.google.com with SMTP id p186so7992558ybg.2
 for <qemu-devel@nongnu.org>; Sat, 20 Feb 2021 01:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gQWj/ZRBKdhStOBs8lZgHc9srk3Foh4yGmyQ6xMq5UM=;
 b=dZazZKbnuhcqSikZ3VY824Z+WV197Pt4i8kyW+L2vFNvMXEj7y+wwt5OknA5rXa8VL
 ftNT+bIVl3UmxMMLqbxw+zHJis7BJf+2pDnla6LUx0QMLOoKOVRHonKa8T5KXpQbNcoZ
 SDdAnh8i9L5Ekvg4gcwZxaraA/6kv5rexQRTOj8MrvIALPpFfgr0ht1wU5jg2qNVjXaZ
 1+NGKe50ydMb7MmgaQTgslFgZAUO1hYo8x0Njfwa8iO1aMpECMPeQM8Pwp0gyGlKu6T3
 NdLUIkXVocvql1NNiOhLFmlw5bj5ypp7OR7IQRNOF0bXnZKtVB8PDRjlqafIke2iDvqN
 UdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gQWj/ZRBKdhStOBs8lZgHc9srk3Foh4yGmyQ6xMq5UM=;
 b=Z5loIhULDNpqMk0AjvQLrS/zOxhO0gEVyz6Y+/QG3ShyBY1hmhPdYbP6g+Gq0QHi/d
 VlKqoqXE/r+c+mszR4l8+RG76fQz1z8KEnYxMHcdA9YnjWwE/0uxmCbkbsUpHysJjQ/n
 Ui8cHD4dP6c3ZrnVGISF4Rj05UEUVdUdip1mcfEuXTykRjZGnmgqk9sy/PPHuiuCEXyG
 8vL7q070k54JBTuylAiWB63MFjueKV25BHn3cpNu+C+GXA0FwZ73sEwj+HakTGwRExrt
 80M42Ffee7PpokNwjvQsbQh/rsU3KyAzLYmQvoiQvhDXApt2FWz3cPV44N/3+B85uGr+
 8UCg==
X-Gm-Message-State: AOAM531lKZCqrcvipfxzJktITsVoBoHMIldv1P7kwJA12ZE1VttvEh0x
 UZtQWJxEDueHzKECG3hZRPkouJx64+fENfxuoak=
X-Google-Smtp-Source: ABdhPJwE5htu8y9rGTMH9KOAHteBXRcaymzToSpTuqqAIgA0h7HjxTESDIsMie/9WXRWZru6tRqNWxKaPb7PNE4kmyI=
X-Received: by 2002:a25:8712:: with SMTP id a18mr19438340ybl.306.1613812498307; 
 Sat, 20 Feb 2021 01:14:58 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8h8QVoGsfJCLTYnbk3yzmrtphsWdSsDUrgQkB=vGh3zw@mail.gmail.com>
In-Reply-To: <CAFEAcA8h8QVoGsfJCLTYnbk3yzmrtphsWdSsDUrgQkB=vGh3zw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 20 Feb 2021 17:14:47 +0800
Message-ID: <CAEUhbmWXyfzbAgimUh8O1VUF-acKhtWN6brjhikz2jdetCK1Lw@mail.gmail.com>
Subject: Re: who's using the ozlabs patchwork install for QEMU patches ?
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Sat, Feb 20, 2021 at 12:29 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Does anybody use the ozlabs patchwork install for QEMU patches,
> either occasionally or on a regular basis ?
> http://patchwork.ozlabs.org/project/qemu-devel/list/
> The admins for that system are trying to identify which of
> the various projects are really using their patchwork instances,
> so I figured I'd do a quick survey here. We don't use it
> as an official project tool but it's certainly possible to
> use it as an individual developer in one way or another.
>
> (Personally I am in the "occasionally it's useful for finding
> a patch which didn't get archived by patchew or the 'patches'
> tool for some reason" camp at the moment.)
>

I used patchwork on ozlabs.org heavily to track my patches of QEMU,
e.g.: update patch status to "superseded" when newer version is sent

Regards,
Bin

