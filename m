Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0615AB528
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 17:29:35 +0200 (CEST)
Received: from localhost ([::1]:57192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU8bt-00047V-PF
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 11:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oU8a0-00014T-Ue
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 11:27:36 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:41525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oU8Zz-00070F-5d
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 11:27:36 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id 130so3591119ybw.8
 for <qemu-devel@nongnu.org>; Fri, 02 Sep 2022 08:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=Ysf2O+3DbuwivEqccncQcz0XzqxmE8Z+X3nVbu09YHQ=;
 b=TQbXWyGLjBm9Ctx6XWDiQVYPCsSMrvncHaHZBMVMuUSkZRGU+AYfwqZx0EPm3Tujan
 rLi/l0JwQQ/L7GwGBgoPkMI6UzsodnIC08mYHj1UW5puXLa2t71H4rUkuM6Q9zEidcyq
 mpVTTROtGWkuFyLqmFKjzTd7rfjz/8K2cFKV73gAocVzeG9GnGGTLwXvll0cfj/zSwDY
 KOSZOi2NaHYlp4IvfVDg9S+wpts1Gk+bqXZV+q/79l5+7dXP6eTrekhDX4oBjrU3Js7M
 o/0Xb9S4aRHh7cXszNnK+h2MWD1IKh+9l5bL1kELBS0QiKdT0szyotjfwzCBP+eOAfwR
 SGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Ysf2O+3DbuwivEqccncQcz0XzqxmE8Z+X3nVbu09YHQ=;
 b=Y7HGkq8PcaDSAqDwuhySJAuAeuGgf4sYM5HL40bZwhOs2DeQvTB2gzz+5iLnpQN84M
 +g0rwU3MzZT3krG0obW6J8bktBMwJTkaEFxdOvSawOH7d4mDaa3SnUXVBNQeXZybnjoZ
 36QSCgnxc0graLJxOI0cpxdkDHLARNIeU1+TI69NhK7hZMYNH/P/7DnvQVRRootyZJEc
 qEaTNt/+wUM9sK6aaeedG9jCVTV/1AQVppwZCSB8nwk1gd4iFP5j37V6vUmABnF9/Eof
 sBtKauXyOeV+pZ1cr/OfOAbzHcFYrMBY4HGamV5bqpvgaBIQlkPN5PeXub5ovjqjehVe
 GtrQ==
X-Gm-Message-State: ACgBeo3xdQYr/oQ/P053bVyYxNQRzX69VtyzJ2iHFUNipPdulLrKL4U/
 oHxPzU0Xbyzy7TYdfkh2A5kInLpb1LCV79oowzE=
X-Google-Smtp-Source: AA6agR5pgXeoCjpsM1kLl9jcARDJVakP9BtwMGj44NCLPZ1dUnGa5Sj0Xjz23auQVoRB2x22Gxqmakb3/Phx7XmCL84=
X-Received: by 2002:a25:6c83:0:b0:6a6:8470:dc00 with SMTP id
 h125-20020a256c83000000b006a68470dc00mr997522ybc.118.1662132452781; Fri, 02
 Sep 2022 08:27:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220902131412.3125752-1-marcandre.lureau@redhat.com>
In-Reply-To: <20220902131412.3125752-1-marcandre.lureau@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 2 Sep 2022 11:27:20 -0400
Message-ID: <CAJSP0QWagfa-4XBV1wikQ9gNZ6oCbdRFkQY=9MTn6QFKtYkX0A@mail.gmail.com>
Subject: Re: [PULL 0/4] chardev patches & a small audio fix
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 bin.meng@windriver.com, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Fri, 2 Sept 2022 at 09:24, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The following changes since commit 93fac696d241dccb04ebb9d23da55fc1e9d8ee=
36:
>
>   Open 7.2 development tree (2022-08-30 09:40:41 -0700)
>
> are available in the Git repository at:
>
>   git@gitlab.com:marcandre.lureau/qemu.git tags/char-pull-request

Hi Marc-Andr=C3=A9,
Please update .git/config to separate the push URL from the fetch URL:

[remote "gitlab"]
        url =3D https://gitlab.com/marcandre.lureau/qemu.git
        pushUrl =3D git@gitlab.com:marcandre.lureau/qemu.git

That way future pull requests will include an https URL that allows
fetches without ssh or a GitLab account. Thanks!

Stefan

