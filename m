Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A214C5A148C
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 16:43:07 +0200 (CEST)
Received: from localhost ([::1]:43998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRE4Y-0005ik-Ky
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 10:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1oRDzO-0006nF-SP
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 10:37:46 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:46767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1oRDzL-00063Y-Cs
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 10:37:45 -0400
Received: by mail-qk1-x731.google.com with SMTP id i7so15285218qka.13
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 07:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adacore.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=aUjVM9430+6VSHV4I3Kmr8IpaYPrfmoS9+pgDDvXbzI=;
 b=P5s9uWirXP7r7g0SjhD7c7LkHk3j+Qg2QaqisNl6O90YQXu5J5c3JKIqtz+bm9iNig
 yVmnARhIbx+MPIBs0p1Edb1+Zc/yKNS2d6zegRY0CgG58sOJeacY4eARAPkW41fQtmnO
 XcCVw0rfmJe3q3vMk/truDEzpLo7TIbgKvh193eOAxg4bEf2JX9q7h5l7MyTQOah+hHa
 yM5Ly4Wh5aSNH1GPN/jCSj1+IRr4nu0+mCYdEvNcVjLW997YtNhRlhUecApL5mcexvmo
 a3s5sDbaFVOv8gbvVmtVIpV3MD3mcWILZ0gD0xY2W2SecPhn1dm+pjtMAnqO80hAl0Vo
 /nRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=aUjVM9430+6VSHV4I3Kmr8IpaYPrfmoS9+pgDDvXbzI=;
 b=jCIF4MmuPKtdWQC2crtkXIQv6vsXUw6sbJKKMaS2rwaPM2jDkHoJFI4xXuCL7vo1eA
 kU7j6CYKP7pTS9ngV7JmvucTkOzfA6Vcq3yn5qKMv67reRBLcfp9lXiRQuH/eLcb2lpl
 p5ElL09eyqPHC6D64A1Fx7ypCjseX/40/TVizjfPN1e227cLdPTCAxgvjx5oancX/aZR
 oG2HcBG6JLF0Cm6sVPcrTDID3gWhQbKJj3nx8kpCY07Shkq5ERyz4GNjmeBEOXiqZr8k
 vlyuwh8Ehr1Z+3Md3SgGB5s7N5mBuoOJg1xwgbCSOGjGlXtRtOGyiuIuw/i8ahSe/5pa
 vDQg==
X-Gm-Message-State: ACgBeo2WjQdyi3PJng7WbzO68cxzkuXUbRhgI7T8IY2K3/qDHa8m46jb
 UDPe1OD+eVS7V7iOxp11CAAJbbk/Fa6clMIdZSUoRmFhSJUy1g==
X-Google-Smtp-Source: AA6agR56fXs7YHqzeNVENH05XoHcky+gQ0DqiSeb1HfDavZ/vJv8b146stzFOoAlztIVbOBzZzNgPFwd/N4kXhMuCY8=
X-Received: by 2002:a37:6086:0:b0:6bb:cf90:f680 with SMTP id
 u128-20020a376086000000b006bbcf90f680mr3244474qkb.182.1661438259999; Thu, 25
 Aug 2022 07:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ307Ejfq=8n8O3SB73YNPp+7Nht3d9oibSdgjSN8vEHYjp_6w@mail.gmail.com>
In-Reply-To: <CAJ307Ejfq=8n8O3SB73YNPp+7Nht3d9oibSdgjSN8vEHYjp_6w@mail.gmail.com>
From: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Date: Thu, 25 Aug 2022 16:37:28 +0200
Message-ID: <CAJ307Ejz_wYVWW2aiibEn0XHPTAScbq_opJQ1+daRSH69mXvMQ@mail.gmail.com>
Subject: Re: Issues related to the polling system on Windows
To: qemu-devel@nongnu.org, pbonzini@redhat.com
Cc: Fabien Chouteau <chouteau@adacore.com>,
 =?UTF-8?Q?C=C3=A9dric_Landet?= <landet@adacore.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=chigot@adacore.com; helo=mail-qk1-x731.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I've managed to fully transition to the Windows API. As the previous code w=
asn't
taking G_IO_HUP into consideration, I've simply disabled the call to
WSAEnumNetworkEvents for a GSource having just the G_IO_HUP condition.
We might still have an issue if another GSource is one day added to the sam=
e
handle. But for now, it doesn't seem to be the case. So it should be safe.

I'll ensure that it works fine with our CI before submitting it, probably
mid-September.
Note that if anyone is willing to check it, I'll be glad to send it.
Afterall, I'm only
using a small part of the qemu capabilities.

Thanks,
Cl=C3=A9ment

