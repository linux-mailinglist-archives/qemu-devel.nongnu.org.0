Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE40141A6D
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jan 2020 00:12:51 +0100 (CET)
Received: from localhost ([::1]:45696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isxGs-0004kG-Bm
	for lists+qemu-devel@lfdr.de; Sat, 18 Jan 2020 18:12:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40660)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1isxFq-0003zR-Ak
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 18:11:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1isxFp-0004A1-6q
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 18:11:46 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:35021)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1isxFp-00049P-0s
 for qemu-devel@nongnu.org; Sat, 18 Jan 2020 18:11:45 -0500
Received: by mail-oi1-x232.google.com with SMTP id k4so25583834oik.2
 for <qemu-devel@nongnu.org>; Sat, 18 Jan 2020 15:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PTb9DrckuAJZt1acB/C3esz5eQiw66mqSPkWLDFX4Ec=;
 b=R5sDQa83R81HdxCuBb4eMblBiuyzEU238w773zhtRcGX2Rql80R+lo7U+eSKHUrrQo
 FHIxJ9GtU35siJO7JcikfRw3D095zP+vXZJjGLorZqDrv5aXkfEXUOg0U16CbwzQKYcK
 2OjsIl+gWqzwQoIA2sAmyGvC+cDQIrnvMnCSNUz2uLhgF96JadqkwkGPu57aw6P9HnVM
 YaNwLENzO94aOHJePolb7OvUnPAqwafMmYiWcP7RiwG9+PspOrF1OhIsz/tTXbXjmoxL
 jreyefCafS+ZfwRBDBFJegbPOLbRnW1AzYWWlGNJ9W1WwM3Yjh+7kwAtX/v3LSJVAzhV
 9K1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PTb9DrckuAJZt1acB/C3esz5eQiw66mqSPkWLDFX4Ec=;
 b=HZaW9h32fUq5tGuioFNKpx2bca6rSytzjaU+ykg3e/s2Ezv5RpInuprRZhJ55Q4dit
 kwx1WH4/LUcTSeR0/uUPavHerwEu157JAdHqpJsA+mgBYJhpTLUJFOduHZlSX+TuIckI
 iMgz49jxaqEQ8gOuTj7DQeb1Qyewj20NWOCNttJn65nY20y4l3tg6FLbhbZ5uHgv7puW
 thL6hZhLhh7W7teGyj4HBgXjE/YPo0exEWWXoEiobGJDjdy0d9PiUXT5mNeDHil7NtfB
 vxlLVbVTnaU19KHIwLA3at0r2Msblfeewfxr35iR6asHZZjwxSeanpqUNFc3StTIL9WL
 D+zg==
X-Gm-Message-State: APjAAAUT6Ckijb1TlMJKeTJ3Wjj2yD0BrQAAGlE6pEvicvM9LjRviiXu
 2WEoVqg1L5t6HVTanpgG+vVtYeZTluXJ0VGr70GoYQ==
X-Google-Smtp-Source: APXvYqx8lqwMx0qRfNHDAW6/0lL9SkIm9+Tn7K50k9tlY/lwZ19Mi8JucoUhjbA0r4297tWw6BPaE6yIoS9SP6yYwLg=
X-Received: by 2002:aca:3182:: with SMTP id x124mr8541795oix.170.1579389103950; 
 Sat, 18 Jan 2020 15:11:43 -0800 (PST)
MIME-Version: 1.0
References: <alpine.BSF.2.21.99999.352.2001182314430.68247@zero.eik.bme.hu>
In-Reply-To: <alpine.BSF.2.21.99999.352.2001182314430.68247@zero.eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 18 Jan 2020 23:11:31 +0000
Message-ID: <CAFEAcA9-6eqk9nSJ+0YVSTEyYO8RRqFJwH0TAr8_tNthH1bjuQ@mail.gmail.com>
Subject: Re: Commit 3e7fb5811b or something in that series breaks build?
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::232
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 18 Jan 2020 at 22:41, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> I'm getting errors about missing headers in qapi/* and build fails on
> current master.
>
> I've tried bisecting it which lead to commit 3e7fb5811b where I get:
>
>    CC      qapi/qapi-types-audio.o
> cc: error: qapi/qapi-types-audio.c: No such file or directory
> cc: fatal error: no input files

I haven't looked, but could you try the usual things to check:
 * does your tree have 'stale' files deleted by a commit
   (ie listed in 'git status' as now unknown to git) ?
 * did you try a reconfigure and build from clean?
   (ideally this should not be required, but it might help
   narrow down the issue)
 * could you test whether you see the issue also with an
   out-of-tree build?

thanks
-- PMM

