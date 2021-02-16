Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EE931CB57
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 14:41:42 +0100 (CET)
Received: from localhost ([::1]:34104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC0bl-00084y-92
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 08:41:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lC0ax-0007Yu-PH; Tue, 16 Feb 2021 08:40:51 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:37179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lC0aw-0001Ql-8B; Tue, 16 Feb 2021 08:40:51 -0500
Received: by mail-yb1-xb30.google.com with SMTP id p193so10486192yba.4;
 Tue, 16 Feb 2021 05:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xsQDUiNGEdquhhJZRL6p2Se03ObDxUnJQRHwQ56TnIU=;
 b=riElzIKjRZTF+VwxjdlqajPcnL4MInRIcPWo61qqTqQxfSDGYT1b6jTZboCxvKcEzZ
 GkO4W5Jt7/K6y5PXHiM8s/1qs7Tq91/8f9GLRVlabDhYgaKz2QBtixNpDVOQh4m4wViv
 0Q7Ud7qyYXt0GYwndnNOwcGc1YzJG0Xvv4V/VWbHub3ijepA69EzOh1XdOCb7mDi3O9a
 tVyqT3+UlYvkcpZY7r6uPhFqmE2GMZgB+SqVu/hdTA/sux/vik0z5LWUEHwj7Xbsjo7M
 5fpt7X6ZFK0hWgqtZfgtd6WL4rNLhrYBkcknlca5xQcqfggiMJ0SRAs1lLtmsXbYzP8P
 X4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xsQDUiNGEdquhhJZRL6p2Se03ObDxUnJQRHwQ56TnIU=;
 b=EMQOBz5xKeAzHvTjlhBDY/ay7RZ7i8+c+iawFqcTmst5zEpVsDIwsyvV1jnLU4a6If
 2ljLy+U+vDSNUtmWHHcEFziqtPt8VnWzByJNS9FgCePEDaC8+NBFQYZTMiv+rryCOZ02
 v3+DH+uamvhrPXJliWNP5E1SG7zbDk2UevfHL6pFT0RuSCYH7UHiBesTAuyHLZbxO43+
 K8o522KdTWymidkoZlRTLEtYg3tJQS37uq6XhIo+ISrWitmOfptDHlTIj9uXw5KYDfpn
 Gj7kkSwNxd0PsCII6GGdw0YLBivErSqLWzpEpG0S5/imjbQ1ifdEaUTxCmgGvCd1fmDo
 eShw==
X-Gm-Message-State: AOAM530X77OcGCUyJNuOL/lcto3eaof1tfQw9as3qqRfLirVDkS/Q8gC
 2lT4mPeXV6PxAbuirKuxi6qFgmK71YI4Nzd1Dmk=
X-Google-Smtp-Source: ABdhPJyxYOM4mppWm2Bym9RwnwSeeD9vMl1a9EoUV8Qet2vWCLcBAZTypijRNBf0Sa3TtESc/BszFqUQ+aY5XaU6Ydw=
X-Received: by 2002:a5b:147:: with SMTP id c7mr3609278ybp.332.1613482848926;
 Tue, 16 Feb 2021 05:40:48 -0800 (PST)
MIME-Version: 1.0
References: <20210216132841.1121653-1-f4bug@amsat.org>
In-Reply-To: <20210216132841.1121653-1-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 16 Feb 2021 21:40:37 +0800
Message-ID: <CAEUhbmWYx13DOx7PvDwQ7benjub+7SAtEeAU6=Heq_vjEvUAQA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Bin Meng as co-maintainer for SD/MMC
 cards
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb30.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 16, 2021 at 9:28 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> There is new interest in the SD/MMC device emulation, so it
> would be good to have more than only one maintainer / reviewer
> for it.
>
> Bin Meng proved by his contributions a deep understanding of the
> SD cards internals, so let's add him to the corresponding section
> in the MAINTAINERS file.

Thanks Philippe!

>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>

Acked-by: Bin Meng <bin.meng@windriver.com>

