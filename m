Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B783E17E41A
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 16:55:16 +0100 (CET)
Received: from localhost ([::1]:45712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBKkN-0001P2-Qh
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 11:55:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38914)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jBKRk-0003og-P0
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 11:36:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jBKRj-0004mp-9T
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 11:36:00 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:46182)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jBKRg-0004du-CG
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 11:35:57 -0400
Received: by mail-oi1-x242.google.com with SMTP id a22so10496507oid.13
 for <qemu-devel@nongnu.org>; Mon, 09 Mar 2020 08:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ep6lW2rq7ba/KDxruX7fkj679vDAB2jJplMhvhhSdt8=;
 b=jASexXBzX37rW2uEU6NJ6qczEBEKmCkp5OtQh7Xm+z5DH71elvpQqlOt5hNIGxPsh9
 kabFTSE5U6/MNn8nA6pRT7y4ChesRRzQDjV1vU+ri3VPZOGafu6DltUAm/a9A8f0JJR1
 UqAtmim9xH+h1YpPEOYbcDK6zZGff7kN58WsdB3GdF/K+YG74yY8V+5DmiYdJx2EcwhY
 5MBVxaM4Hg0mQqdOu2OAnDLLeH23Y0FTV9LCtAtO5cIXJBbjwvEDM1uZyb5lXEqClKIT
 RecwRAk+a/LRzmP8iKSfATpR7z5zemBaCH63dOGJ09OxgiItjINhXMXh9HSDVn1EF24y
 3BbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ep6lW2rq7ba/KDxruX7fkj679vDAB2jJplMhvhhSdt8=;
 b=UigYJRbt6Pr0VNtW5dHAzVPJ66ZM/kC7Dz2K6ywFztGmP5BSY4vNvNwazzmJkuV/ll
 gmi7MkeQaeNL/81uWr4JAMLQysWtQztI4lyp7E/uf8O4J0z+kV6Q3/ar4O1VdaVe/swo
 jTV1VmRkai0PcuR56Y+TRVH+i1NIdaa6YYJB1RRuXbk+w0bYuhk7nyg4OLN/+3ulAIO1
 MOKmUyVkozrj6wi5GI+Z4bqhMlr06Dv16vu4cYUR7r/p8E0suIS4Zb/L3rw2diP5qMu6
 HxJX2yw3wserA0zMJdM08vQhGPLiPZS0kcBZuD0+E7g63R1yvJ/McFoIgL6WMqt4lQEU
 WKKQ==
X-Gm-Message-State: ANhLgQ2r9cCSDdN0t+L6oU+AIvLiP42eH38ylJ6EYgMkK8wmlxB2Jpwr
 uukEIinlGN4T0fRwzbApixVbavz/1kaWdV5qkshCzkAZACc=
X-Google-Smtp-Source: ADFU+vvE8ZEiFMfyT6oTu/JdlCJDUNYRVsFbhOrb0Cg5ylfQW7HOd4xGlFoZH6oTdEEzpBYIb7fMjsnxPsB2Ggcm044=
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr11253511oic.48.1583768151567; 
 Mon, 09 Mar 2020 08:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200309124616.4372-1-armbru@redhat.com>
In-Reply-To: <20200309124616.4372-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Mar 2020 15:35:40 +0000
Message-ID: <CAFEAcA_sNu2vFhio+zXaHMNCLaO4XcaGqgDvCpLpD6xtEhps4A@mail.gmail.com>
Subject: Re: [PULL 0/4] Error reporting patches for 2020-03-09
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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

On Mon, 9 Mar 2020 at 12:51, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 67f17e23baca5dd545fe98b01169cc351a70fe=
35:
>
>   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into sta=
ging (2020-03-06 17:15:36 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-error-2020-03-09
>
> for you to fetch changes up to d1eddab86f92e7e060c8a473695c7f24ec00c9ab:
>
>   qga: Fix a memory leak (2020-03-09 13:36:15 +0100)
>
> ----------------------------------------------------------------
> Error reporting patches for 2020-03-09
>
> * Improve error reporting on Windows
>
> ----------------------------------------------------------------
> Philippe Mathieu-Daud=C3=A9 (4):
>       chardev: Improve error report by calling error_setg_win32()
>       util/osdep: Improve error report by calling error_setg_win32()
>       qga: Improve error report by calling error_setg_win32()
>       qga: Fix a memory leak
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

