Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A58C64B7E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 19:30:07 +0200 (CEST)
Received: from localhost ([::1]:35664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlGPp-0000H8-4c
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 13:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50702)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hlGOy-0008FV-1g
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 13:29:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hlGOx-0005j7-3a
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 13:29:07 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:46557)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1hlGOw-0005iC-QQ
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 13:29:07 -0400
Received: by mail-oi1-x243.google.com with SMTP id 65so2238558oid.13
 for <qemu-devel@nongnu.org>; Wed, 10 Jul 2019 10:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ypo7HfA1OgTvylL1jdf5uvRU5n9R044hbhukBZzj81U=;
 b=bRaMg3/PUyooHE6c+Hs5des3aS85E0TYlFClhBJmDKg/LtL3Qyl6SOGtvEpsROs2be
 IREWLptq3k9e/WVlQ9pghh1MK+g9ETO4X9Y+e8zvB1jFeQl8mwY8j1idsIJgg4I0KU57
 lCzIxXBkhy4+6Gfrea2RFfgiFxr9mu2o5ZAT4odz236UUQ/gEUYPsx7LY5PNp3XKa+4D
 JHAL7ZXJuiy4tHxeoYsN3vPCzbaYGLvRLOlnkwrWaPj2rjfRUcNklTsbkiAzYJqoS4BE
 sQM54p7fnwkpzOP7ZIkniwKowvUAjxFbazOEHp3ToUy4xkf+tW7ULW1tXCx5Tvg3vmTp
 6D7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ypo7HfA1OgTvylL1jdf5uvRU5n9R044hbhukBZzj81U=;
 b=haxONh9QibVvQhB1oSE6hsaXI0cwbFsNAaoJwK8uKtvh4VlIGGPCqt9KGxW+hQXELZ
 jqVe4EFef4KYdh1rvLQok+QTr9F9sRSyn115d701Rnr/1gnvkb4sWgRgtdSjx5NmfT0a
 tFyveEZk0bbQ1O+xIBnIqqP5Zh0pCSf0rn+a+nwtDffw+0/pX4TCkc2nuzulUAfgty1P
 GL4mvtpc57yO8h7HXUoKSY8vurnkHkGNzKFojswDhJtikl3IH7V485Vj5yjHmbYVXzdn
 d3/RaRVg9PPEoLqI/rYBCL3FlJXA8YtvoaqbSbXPw9oHR9IFbSaq+rfPNAD180ColCir
 PZVg==
X-Gm-Message-State: APjAAAVGgfL94vjvehwHlBqo3fU/hhjZ0ksagmFofXhwFkcECgAlcewU
 njoq0LxIk55HHKHKSwRip+7rjJxLSxlj6gA50EM=
X-Google-Smtp-Source: APXvYqzVAw4IdJdvJvM+5vcdWH1NP63EGowkWJY74gfhscd2RsOIIaS29xFsAmyH73oaU1+P7j3V/wjvS5EQ2e086nY=
X-Received: by 2002:aca:4588:: with SMTP id s130mr3870201oia.79.1562779745742; 
 Wed, 10 Jul 2019 10:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190709184823.4135-1-richard.henderson@linaro.org>
 <CAL1e-=i7Paug3G4xFCVRpH=NadNti1oG9y8n7geUJeGDoizc4w@mail.gmail.com>
 <CAFEAcA-wJ9hTvk90wikTFU669Qh4sfZyDZvjZaHo=P-eF_v26w@mail.gmail.com>
In-Reply-To: <CAFEAcA-wJ9hTvk90wikTFU669Qh4sfZyDZvjZaHo=P-eF_v26w@mail.gmail.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Wed, 10 Jul 2019 19:28:54 +0200
Message-ID: <CAL1e-=jX+LbEzvQLqi5qn3DbbC9icp9YA92N6-9RVd3ppV+0-Q@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-devel] [PATCH] tcg/aarch64: Fix output of extract2 opcodes
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beata Michalska <beata.michalska@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Can you be less combative in your review comments, please?

Sure, I will.

Thanks, Aleksandar

