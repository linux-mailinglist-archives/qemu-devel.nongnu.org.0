Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D2531F77C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 11:43:11 +0100 (CET)
Received: from localhost ([::1]:40278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD3Fe-0000wU-Em
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 05:43:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD3EU-0000Vk-Iu
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:41:58 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:38126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD3ES-0007j9-NH
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:41:58 -0500
Received: by mail-ej1-x62a.google.com with SMTP id bl23so11995812ejb.5
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 02:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KBsMib34L0m+u+lMmGW9JUI9lh9SYpMDUyxaJct6WEE=;
 b=s9BZ8iHP6kKDDbZvZ1JcfxX8YoCD0bQJ+/lxFq7gIEmEwHHdBENMTl8/483/b40yls
 ERsatqo0/SVnEZimkoE+chk4U3mJUBXwgXz+K1Rp7gpsyHE+7gTakx9MdsgNjvEryOVY
 X7C7+H+lQlJVUCWO4weNjO879ItbqD55kBSgnt6Rj3e9erwmnnjSmZBdMkuni4Z/6uUV
 gIHR1cX6p00VmWrvkbNZS9s9BfA4WdSCzLtCr4O61NL2606I95vP/JV0juNGqWnhoYAF
 7j1G2/+8Pg53VUfrGZE67G5Gp4OdLL51zqeegN6qfb+Uz8lhAUO0m8DPiSgOzI5/EKCL
 zqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KBsMib34L0m+u+lMmGW9JUI9lh9SYpMDUyxaJct6WEE=;
 b=WMFRzllnQR0nrlodtYp2pKVCp8K46PpcAVtxH530xnY+A/+Hw1UsfBvI32P5b6iBrP
 RXZppKI6htDpHNiMdsEL0rpNIEH7v/SnzlLkj4FsBYNwzVWpR3w5n+iPRq+Y6+XxdQpJ
 hTCM/nUs8QXbdNX50aSDt2ztlodWAHB311GH+TzwbrzbeMDmAVdUq69Rqn2PQ0Z09eku
 pgVHbk7y+4rDb0nWDLTVtfLdppFk50IFxmvt0y/XIBEyEDUizHenJCLueW6BTmwvzJa3
 9bH0x/2dDsc+bx32/bRFZaUJOPaLvex6W7rKmVfOCdTZKXQ9VHL1dFA5oGixa0evX0sg
 fZUw==
X-Gm-Message-State: AOAM532kbh3TheSopDkf3rgQCTqR4glb0CPm3tRhi3WsUfiILW3mrom/
 aWUaijx5iUg0qShqTArDD/ozLWUKbeIMQEzO7hHYrw==
X-Google-Smtp-Source: ABdhPJx+96LYwY8LvHeFL3BQu3p8CxiKmk+F6AhvXwqxlAADbaI6Rjidha3o6q6o1qdA8EqyK1HO0faX6YO9FIR4ids=
X-Received: by 2002:a17:906:3a89:: with SMTP id y9mr8199786ejd.4.1613731314965; 
 Fri, 19 Feb 2021 02:41:54 -0800 (PST)
MIME-Version: 1.0
References: <8735xss5q3.fsf@linaro.org>
In-Reply-To: <8735xss5q3.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Feb 2021 10:41:44 +0000
Message-ID: <CAFEAcA_24bo+9CjeoVL8Ke5PzCwmBw_z4H8nbOQbOGg=1HxUxA@mail.gmail.com>
Subject: Re: FreeBSD build regressions
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: Ed Maste <emaste@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Gerd Hoffmann <gerd@kraxel.org>, Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Feb 2021 at 10:39, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Hi,
>
> It looks like the build has been broken on Cirrus since at least 7b2c4c:
>
>   https://cirrus-ci.com/github/qemu/qemu
>
> I did attempt to have a look but "vm-build-freebsd" seems to be failing
> with a different error

FWIW the vm-build-freebsd build-and-test works for me, as I
continue to run it as part of the merge tests. Is this something
to do with whether you already have a freebsd image cached
as opposed to it getting re-built from scratch (perhaps with
a newer FreeBSD)?

-- PMM

