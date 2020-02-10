Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBCB1580A4
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Feb 2020 18:10:20 +0100 (CET)
Received: from localhost ([::1]:36586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1CZg-0008Cw-05
	for lists+qemu-devel@lfdr.de; Mon, 10 Feb 2020 12:10:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56764)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j1CYH-0007JV-Ha
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 12:08:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j1CYG-0000Te-4N
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 12:08:53 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:37364)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j1CYF-0000SS-Uk
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 12:08:52 -0500
Received: by mail-oi1-x243.google.com with SMTP id q84so9908219oic.4
 for <qemu-devel@nongnu.org>; Mon, 10 Feb 2020 09:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5nZnL3RWARalwZX4QtKSGVx3kPVgKyGF5aGBI4l4uUE=;
 b=IRd8nTiW5BKQNUs9raDb/I6md2mxE0kwBw6DQFpkqazGYCuZyWkRY0hKJDlOktjx6t
 bE9NUbisaCQUaLUg0UNcGMgNQ0L2Hx3wWolpjvUa0q3thr3qCvGEZIt57dvo3DmmajEL
 zVTbhXqP6dE/gEVy+3vZybR0x6WPYBWF82vTChfA67Tk0PB3T6QDZzJpB+IDU4uNZ+I7
 6WnWtNY8VFVL8QNIwudWNJnP0NQ46L8+vnZ/gcXJBFEQdXMYbmRt+G/fiD4F5SOHCc8Y
 D7MHE1H0E3eiig96HkuU9dJtMZ1T6FBOBa907fQgkr0sktkqYDauuJ6S3pUciwv6hMuH
 fm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5nZnL3RWARalwZX4QtKSGVx3kPVgKyGF5aGBI4l4uUE=;
 b=fXzo1hKvsn0dom6w9csNJ38YiQclAj1ooF6U5MEVTSVpdwaVcyrfl8jUmVSDesUQHT
 DnLE4/1CD2z0kUMc6DzQmM3ERlfgMIVGzPEVZf8953qeqHx0osfHLwWpLoPmeDvLtr77
 BKrY8JLl7DSCSUSQ/+mmPGO7vlO1nmMBNWgRzVD6iNvW6Fachsi287XSrTqhh9JTZhBw
 n34Vy36qenPLahs72p00Dkt7OFVb2o8nQxYobiVExFmLVyCy0lg6dpkZMkqn/o+vWtDh
 Gk6qPH7EL+aMoBY8mf1H8XlQb//9im8kZ1Ijz7aZDWWoYh0jC2IfuHLr/SPfOIToRDL0
 IioA==
X-Gm-Message-State: APjAAAWSxvKFOPR59SaakL1svab7iLWEDvpsBtOQ8glG2NoX37DA4Gxs
 0NZ5HOd7SPgZZp4z4vGBTaNBP74b9nDIJa6DeEgosw==
X-Google-Smtp-Source: APXvYqxKTAEzUVRXXOh35I+0EuvYPf3hPXeQrGK7RfqKck1J72tkae6hgdcO3efhNO5oBKSVg/XsdZB4rKMLaZNIvmM=
X-Received: by 2002:a54:4f16:: with SMTP id e22mr36154oiy.170.1581354530972;
 Mon, 10 Feb 2020 09:08:50 -0800 (PST)
MIME-Version: 1.0
References: <20200208104506.2727882-1-groug@kaod.org>
In-Reply-To: <20200208104506.2727882-1-groug@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Feb 2020 17:08:38 +0000
Message-ID: <CAFEAcA_b0y6qX9LExsuNFEDivZN2y6-zbcrTLhX1djqPiYoA5A@mail.gmail.com>
Subject: Re: [PULL 0/6] 9p patches 2020-02-08
To: Greg Kurz <groug@kaod.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 8 Feb 2020 at 10:45, Greg Kurz <groug@kaod.org> wrote:
>
> The following changes since commit 42ccca1bd9456568f996d5646b2001faac96944b:
>
>   Merge remote-tracking branch 'remotes/berrange/tags/misc-fixes-pull-request' into staging (2020-02-07 15:01:23 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/gkurz/qemu.git tags/9p-next-2020-02-08
>
> for you to fetch changes up to 2822602cbe2be98229b882101dfdb9d3a738c611:
>
>   MAINTAINERS: 9pfs: Add myself as reviewer (2020-02-08 09:29:04 +0100)
>
> ----------------------------------------------------------------
> 9p patches:
> - some more protocol sanity checks
> - qtest for readdir
> - Christian Schoenebeck now official reviewer
>
> ----------------------------------------------------------------



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

