Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5282D4BDA1F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 15:15:55 +0100 (CET)
Received: from localhost ([::1]:57616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM9Tm-0003Xr-EA
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 09:15:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM9PL-0007pM-ET
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 09:11:19 -0500
Received: from [2607:f8b0:4864:20::b31] (port=36594
 helo=mail-yb1-xb31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM9PJ-0008Cm-BO
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 09:11:18 -0500
Received: by mail-yb1-xb31.google.com with SMTP id c6so34651139ybk.3
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 06:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=90k/twpJkUrg5duEJC6x7ObyR8Yo4HZt/6kgTXPFAhA=;
 b=qyd69Rwww7c+4MpFbwmg+q9MrDBs5U6ga6dWo333mipl/ECOTaKkZh5Cg+ftnnFUX0
 w4/uKdmnLm957DYq1XvTljJ3iwsqZ+XIjXLOhNZtDQmq0QR1oSqD3E2FE+TXkp+1Al3v
 ZIWdUpe3z1eTfXMTK9Wuh1ohShhwSO17Ibv0gKpo8+zMa0alr9+bLf7W+U3U7CjKJok/
 7xTP7BWA7UWZMfbrzAMrIhqCeA1RpScD3+kqEnyr3Tz0e5Ma1YORX/gx9c6T3uUjH+OL
 SSJFWnvMkzNHCQzfPHtncVqiCX29qQg83EaKeVFdm88sIAC6uDF64pweY/UCy1YtHNN1
 bygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=90k/twpJkUrg5duEJC6x7ObyR8Yo4HZt/6kgTXPFAhA=;
 b=gYYS/N2Praaq2Y/PZ7IF0CoVrp0F6Vva7QP/aZYo+cFO0NQTD4C1POvNJjVUCHP0/E
 k2hRqNyRnMKu3j0QEl3PH6xVoOEJMcafr4ibXyM7Dbi4SjPJz6sg9xQZS79Lnms7YH9P
 749xXjbfcQYyRwp1BiA7gwTEMtiH67OotmMpzQifi11GQfskqkurp/biix0A0gOKbZoo
 pRHz9qu6rs7cY555MLouKRQYNB1qdUkBPT3oia6QhkuZUk+bGNx9t7m+p+cVbAn4jk4i
 VToWyuthdLPCYTF2ZqV3+Lc7wIdOuRZ1HOzG/yuUlKu0ix5CNX1SFxvoogbiU3dMkoGC
 3fng==
X-Gm-Message-State: AOAM532um/6kA/xdH31nHJ6ilNFJ5h+YTiqGTXjXY0PfM61F67lKyjGm
 wpneauc5saL/uVZiwhlk7g3heMc5oMVmmhPdHrrfAQ==
X-Google-Smtp-Source: ABdhPJywEFsOQGzZ8QxFm1gK/vex4QZbjn5cNP4Il9d96y6ziGYXu2iIFNs6yhae1yuKK2dWtEOUa4spWXiKE1Tenks=
X-Received: by 2002:a25:dc87:0:b0:624:4104:a331 with SMTP id
 y129-20020a25dc87000000b006244104a331mr15766709ybe.67.1645452676291; Mon, 21
 Feb 2022 06:11:16 -0800 (PST)
MIME-Version: 1.0
References: <20220221122717.1371010-1-pizhenwei@bytedance.com>
 <20220221122717.1371010-2-pizhenwei@bytedance.com>
 <89be0672-87e4-b0dc-5b36-0ab05f100e8a@gmail.com>
In-Reply-To: <89be0672-87e4-b0dc-5b36-0ab05f100e8a@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Feb 2022 14:11:05 +0000
Message-ID: <CAFEAcA_kZkX7w+wxxYRbFxfXzaL7gc+Q0=ySEwE8Bg14=iVybA@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/misc/pvpanic: Use standard headers instead
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Feb 2022 at 13:55, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> On 21/2/22 13:27, zhenwei pi wrote:
> > QEMU side has already imported pvpanic.h from linux, remove bit
> > definitions from include/hw/misc/pvpanic.h, and use
> > include/standard-headers/linux/pvpanic.h instead.
> > Also minor changes for PVPANIC_CRASHLOADED -> PVPANIC_CRASH_LOADED.
>
> It seems to fail to build, missing PVPANIC_CRASH_LOADED. On which
> tree is this patch based?

That's in patch 1/2.

-- PMM

