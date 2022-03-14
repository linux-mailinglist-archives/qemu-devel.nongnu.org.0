Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACD04D877F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 15:55:23 +0100 (CET)
Received: from localhost ([::1]:52354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTm6U-0008Pn-3j
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 10:55:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTlyC-00071w-6E
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 10:46:48 -0400
Received: from [2607:f8b0:4864:20::b29] (port=33304
 helo=mail-yb1-xb29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nTlr5-0004Og-Ee
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 10:39:29 -0400
Received: by mail-yb1-xb29.google.com with SMTP id j2so31327292ybu.0
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 07:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Xh/lY106FAoq9fwRibAUFoydDg4CkiWdDcqCpu2366Y=;
 b=s9vDyqz7mvdP/l7tdcxkP6ggEOjrIFZdID/YbJ595zKBoBycSEyhm73GO3BB7OWC6C
 TId/cWKfvaBzRvRa3BrFXJCN+S0eX8M5M8VrCRwgykIan0Mxce2X4+UYJHQgLHQNcpg7
 YD/IKhAT3+Oe0aYxvpFs95kktA3a4sAC+R2dEI5B3VExmpkWZN9QhEecAwNiwW2ky3VK
 ky2Vm0LDw41+htnFjSxALhWfpf6RoEK2xvG0yFgtYOIJ56yqdSQq1ugGWqJ7ViESqaKZ
 6lom+3IEa+8V/CQdHyhDEPD62jnJA1vdpN4vfhypvavqiDGqinRz0pb77dUEGV4BUMka
 0rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Xh/lY106FAoq9fwRibAUFoydDg4CkiWdDcqCpu2366Y=;
 b=NGFgAIJL1aLUIZRN7QCGrwu6Y16qM2GiHD+x+WRccfXSDcqCTQzH0v7+kvdK5+r51W
 OHudFh2q4zaeGOlnzWNr75vMbyO7b6omqpzoZqYjXcdo6zFmCwS/ezxqXl5fJ5TpVfot
 OakIeK9i44lv/YJ5GrrNxf292YVkmGk8uKkTMIX8vPEtFuHfQ2+HfQlCpDK41ymTHL8W
 Oapi8gIJXuSzQ+owPqbyNUq/Tm0Axt3DG00GwWUopAy4AJ2DyvtoYpY7EOMI/0MZDwBf
 kuFW2ksux+w2XeFEcbRrFIP87/DbRnMfu+8iyCVudwQXP0/SOXhNZlMpf1R3DjdJGqHT
 bSlQ==
X-Gm-Message-State: AOAM530184LeOI0Z37fc9/0vIYfJE92Wdjs+xwgAutLqvEZg1PA6tkBt
 8IF2337/ga6knmZDdqmlqpRD0Gkz87dJpjnNzQTxgQ==
X-Google-Smtp-Source: ABdhPJxXbYeqI1bKhmpsrhLuLktwW6qOGDhytXIwPxpq+qHwDQVNmmjZu2nzUNDD/n0j/sfOllxMEDrwwRFW5gII24U=
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr18384030ybq.479.1647268766315; Mon, 14
 Mar 2022 07:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220314125940.1866728-1-marcandre.lureau@redhat.com>
In-Reply-To: <20220314125940.1866728-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Mar 2022 14:39:14 +0000
Message-ID: <CAFEAcA-kWW+v8dY4DGo4-L8-JgkoHYNSVB7uMWtm455SQoHwxQ@mail.gmail.com>
Subject: Re: [PULL 00/12] dbus console fixes
To: marcandre.lureau@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
Cc: qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Mar 2022 at 12:59, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The following changes since commit 1416688c53be6535be755b44c15fb2eb9defd2=
0f:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/q800-updates-for-7.=
0-20220309' into staging (2022-03-10 13:16:37 +0000)
>
> are available in the Git repository at:
>
>   git@gitlab.com:marcandre.lureau/qemu.git tags/dbus-pull-request
>
> for you to fetch changes up to c923967ca32600aa4e8ab817565ebf5415b4e195:
>
>   ui/console: call gfx_switch() even if the current scanout is GL (2022-0=
3-14 15:16:29 +0400)
>
> ----------------------------------------------------------------
> GL & D-Bus display related fixes
>
> Hi,
>
> Here are pending fixes related to D-Bus and GL, most of them reported tha=
nks to
> Akihiko Odaki.
>
> ----------------------------------------------------------------

This causes failures on the CI jobs that run check-acceptance, eg:

https://gitlab.com/qemu-project/qemu/-/jobs/2200046502
https://gitlab.com/qemu-project/qemu/-/jobs/2200046505
https://gitlab.com/qemu-project/qemu/-/jobs/2200046522

on the same pair of tests each time:

(171/183) tests/avocado/vnc.py:Vnc.test_change_password_requires_a_password=
:
ERROR: ConnectError: Failed to establish session: EOFError\n Exit
code: -11\n Command: ./qemu-system-x86_64 -display none -vga none
-chardev socket,id=3Dmon,path=3D/var/tmp/avo_qemu_sock_fuvyei1z/qemu-1849-7=
fcdc8bae828-monitor.sock
-mon chardev=3Dmon,mode=3Dcontrol -nodef... (0.48 s)
(172/183) tests/avocado/vnc.py:Vnc.test_change_password: ERROR:
ConnectError: Failed to establish session: EOFError\n Exit code: -11\n
Command: ./qemu-system-x86_64 -display none -vga none -chardev
socket,id=3Dmon,path=3D/var/tmp/avo_qemu_sock_vk5oz22m/qemu-1855-7fcdc8babb=
a8-monitor.sock
-mon chardev=3Dmon,mode=3Dcontrol -nodef... (0.16 s)

thanks
-- PMM

