Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A4A1531F3
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Feb 2020 14:36:48 +0100 (CET)
Received: from localhost ([::1]:47162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izKrH-0002Eq-59
	for lists+qemu-devel@lfdr.de; Wed, 05 Feb 2020 08:36:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33849)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lueschem@gmail.com>) id 1izJtT-0002bN-ER
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 07:35:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lueschem@gmail.com>) id 1izJtS-0004Lh-Cf
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 07:34:59 -0500
Received: from mail-yw1-xc42.google.com ([2607:f8b0:4864:20::c42]:35524)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <lueschem@gmail.com>) id 1izJtS-0004Ih-83
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 07:34:58 -0500
Received: by mail-yw1-xc42.google.com with SMTP id i190so2221943ywc.2
 for <qemu-devel@nongnu.org>; Wed, 05 Feb 2020 04:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xv68K5lOKCrH+6eGtrcb3GpS1KdrEhE/Fg3HRbQYMlU=;
 b=DxDDoEGSAoKbvHc0qsmayP5IQRuMs7H9LMqIToO6aw5h3hTM7k2aR4JiqaXByHP88P
 bUIonRVWfAKWiCaQ1dp3jC2pDZTeutncV74K8Z5vUax/upxXqhWo9jF8jfCB/+Mo+y/w
 xld2MP+t6gcGPZ19R24s51tAfoNhvN57h8F3S1W7M8SnVc33EuRDc6nYiSF6aDPFCKky
 ZmfsocQR5JNIUKOdCfYUN45YSJvXPt5WygwmWzRhllw0LEiAouoXdRoR/ozvJRmoHNws
 uSbXkuldclFRwmphYknn1wVp5N45OV6vZ341CWIGspfIWPF4PHIj7xTWa/EC2GMjMK/8
 g/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xv68K5lOKCrH+6eGtrcb3GpS1KdrEhE/Fg3HRbQYMlU=;
 b=ua4kFzkMa/cR94wt80BjR307g4DxSvPj0HVYYlDH3TyiI53zcQDD6aEq9gGqpprC37
 5hbh4j3Fq6vKWZEzf6tRmvR0iGuU6FS3kNBoWYjsKiKgyaC/EXsYHyHGuGnMZkVl8/kw
 LG1nVP8/gutUumEJOvASzTzxMXnr78SkvBJ1JNulgDyrgmG3PAYNmfeUL7uO6u6nI8vr
 3DzP+cG7vg8ykapci+JnT+uzeX6eOTD+3Q79T2uUfPOL4eHUVFzsl+uD6WnFV6iFaxam
 D74RduYe0w9lLFSl1VgA02HBv7g3Rh2y4VgnyWpnkR+z9oApClRX5GdRa3VHNiGxjCFx
 Fudw==
X-Gm-Message-State: APjAAAX/V5NdWcE6lCAxCFX0RygNdGHCpLbFxhfXmsLKxK6lquy6d417
 4MxCx8cyZ6p7cZafEE6yGSWGAGPwoOMyQMYVJBw=
X-Google-Smtp-Source: APXvYqxxJ/c7R84rj8yzEbevl+/xg6KkQrNP5JP186rMtjQXLA2xLUPDiJXvRtkgqmrVn6z1jRkFwI5+5IeorlBZXYA=
X-Received: by 2002:a81:46c5:: with SMTP id t188mr9687988ywa.512.1580906096953; 
 Wed, 05 Feb 2020 04:34:56 -0800 (PST)
MIME-Version: 1.0
References: <20200204211901.1731821-1-laurent@vivier.eu>
In-Reply-To: <20200204211901.1731821-1-laurent@vivier.eu>
From: Matthias Luescher <lueschem@gmail.com>
Date: Wed, 5 Feb 2020 13:34:45 +0100
Message-ID: <CAMhkXVNtm9e5Coxm1=n0-AU=fgYcwqMYmKupCL5ZCqDJqrK-Mw@mail.gmail.com>
Subject: Re: [PATCH v2] linux-user: implement TARGET_SO_PEERSEC
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="000000000000550cac059dd3621e"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c42
X-Mailman-Approved-At: Wed, 05 Feb 2020 08:35:33 -0500
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
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000550cac059dd3621e
Content-Type: text/plain; charset="UTF-8"

Hi

I also tested the v2 patch - works fine!

Best regards
Matthias

--000000000000550cac059dd3621e
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div dir="ltr">Hi</div><div dir="ltr"><br></div><div>I also tested the v2 patch - works fine!</div><div><br></div><div>Best regards</div><div>Matthias</div></div>

--000000000000550cac059dd3621e--

