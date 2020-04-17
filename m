Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 214C01AE194
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Apr 2020 17:54:36 +0200 (CEST)
Received: from localhost ([::1]:48868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jPTK7-00048w-7B
	for lists+qemu-devel@lfdr.de; Fri, 17 Apr 2020 11:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56064)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jPTJ5-0003Hx-Kb
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 11:53:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jPTJ4-00035s-QO
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 11:53:31 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:35218)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jPTJ4-00035G-DK
 for qemu-devel@nongnu.org; Fri, 17 Apr 2020 11:53:30 -0400
Received: by mail-ot1-x32a.google.com with SMTP id e20so1817556otl.2
 for <qemu-devel@nongnu.org>; Fri, 17 Apr 2020 08:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FFeriMf1EVtTPEld1twsBm0AUQoQKlgbrQPsNwAE5k4=;
 b=SjqN3ukUa5svvKrTAGoKiFELUw0Pq2FoWPeJRg2cA/ASd/UxMnpieSFh7xOCXQnRRu
 COogVkcXReEyTN0GmFH92fAfupAYRvW4p3/JiMBUtOI/b02kddRZurtwpitW0uc663pu
 fQDn00sGrUqyJsV3f9XgnQFOf8zmbPRFNdE+8DokYHq2b5/ShZZHmbYsYFRK3p/aCYHj
 Vo+DY03ddeWFXqjVZEtzZwaoDpblHmjNnn6wI6aAhB1J+lBAtk1VCjhdVhwAZUckItsV
 mrZsdhWoub9KfMCXok1Je7FeOMHiQHQV6qigefK+OuKdDJ6Aj0pI4QSyXmIj+hdVDHR3
 SZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FFeriMf1EVtTPEld1twsBm0AUQoQKlgbrQPsNwAE5k4=;
 b=N1thgrH4p1etiGyxb0ogWIOTDUE7z7/FVSZm208YAYQKYB90BMN70yYXERXW56Of6C
 JsZQgAVsnW+Clr1shLZXV7a+rPhWKY8LEUmoQm4cccBwQcWEeWWKjX0PBsCDuugQ+4JW
 E74b6zxH/NRjSGDo7RwuPS2h7SJEUSlc9EYBlwwNCkp9weG6CeivmBAZfVOkXfeSK4NR
 oIHXkTwjh+7nSVNbVOgFJqywDp6H7rXJyHs4QFomJQNEXYooWc9MxOZWR4MfblBlc7Ds
 LA74iDTZcMQg9pOYO7WQOII8a3f8b9AcjzT0t7yKEouL6EZ5IXALh0eP45yuHuPCXwXD
 orkA==
X-Gm-Message-State: AGi0PuYpdyp/OChRz14r/DGnkv5bxYPISpgmgh5wwGpoiWI7EQAABl8R
 Hny5yVVjLpg5eJUpfYO8LvHU2SXKkv4o2fN7aKffHfNIehI=
X-Google-Smtp-Source: APiQypKVz0usP/alRy+Npo5VLo48khuI+PzPDYGahkDYqoOSTzqHUSZ2Z3D/3gld7GModoNaDh6ITBXvn5qyfpbiqBA=
X-Received: by 2002:a9d:2c08:: with SMTP id f8mr3125643otb.135.1587138808709; 
 Fri, 17 Apr 2020 08:53:28 -0700 (PDT)
MIME-Version: 1.0
References: <87o8rqdsds.fsf@digitalsignallabs.com>
In-Reply-To: <87o8rqdsds.fsf@digitalsignallabs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Apr 2020 16:53:17 +0100
Message-ID: <CAFEAcA8uL3V8aa=0UfYsYTKRPpM+5D62vgTDG6qouLObtzmJTQ@mail.gmail.com>
Subject: Re: QEMU Development Questions
To: Randy Yates <yates@digitalsignallabs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32a
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

On Fri, 17 Apr 2020 at 16:50, Randy Yates <yates@digitalsignallabs.com> wrote:
>
> Thanks for the answers I've received so far - much appreciated.
>
> Is there a standard way to define your own custom coprocessor CP15 registers?

It can be done but you very likely don't want to do it...

thanks
-- PMM

