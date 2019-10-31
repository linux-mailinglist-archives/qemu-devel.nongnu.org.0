Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D1EEB06F
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Oct 2019 13:40:42 +0100 (CET)
Received: from localhost ([::1]:49486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iQ9kn-0000v6-21
	for lists+qemu-devel@lfdr.de; Thu, 31 Oct 2019 08:40:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57752)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iQ9hL-0007Ba-Dd
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 08:37:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iQ9hK-0006ea-0t
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 08:37:07 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:45333)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iQ9hJ-0006eA-Ra
 for qemu-devel@nongnu.org; Thu, 31 Oct 2019 08:37:05 -0400
Received: by mail-oi1-x242.google.com with SMTP id k2so4975699oij.12
 for <qemu-devel@nongnu.org>; Thu, 31 Oct 2019 05:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=679+hYD5wYMloDmipyz90lhnRcEhJV1bdNp1/sJBQxc=;
 b=jhSXCy/4JEpsvjpQWT9Wv5TC79kI+Hw8zqS0FG8mbDsFkggc7TvGgaMFzT/mz0gyNw
 lctQ3JAQMMO1iy/fbGBeAz7tP3HkSwTpBsEC7m6VDos6VA1YobJkFdB1m7Qb3Cvh1goT
 RywrNeydoZhm7I2eHg1loLHuE6vBHySwWzT+hTpTiWQXuWdKGXyX1c7n6ML3NsttpYpP
 70nOWCm5Si7vh4KNb+oSdNAukrjwmMfDOOcyKzmFE3Uug577W1GpsjVwoSfefF5+RCZw
 WhGGkF0U/NdFucx35+8/zlua1FG8DKYQG+TWPNB16EK0a7H4xhj7pN2IGFGYOrMeGOzD
 OAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=679+hYD5wYMloDmipyz90lhnRcEhJV1bdNp1/sJBQxc=;
 b=gw5AXWYHCGc1itdKMuO7Rph5ScaJVVWHn3ulq5NJ5z6CPuqKzmZvIv7fIHs6xJjqDf
 Onl33PZat+Hf5a1xfhtV30C+uKmSfHiWBY91FR+T4iGRNJM323hsPb5Y5Qj11HZGFdZj
 eDkk/FlUbH1lEeew+GTAHPX6+8U+TD1zH0SaACwhprVdun9TPEiHNf3S5nPD9XTV/Je4
 Z2XPWRqfOl08fdb0mzyaKqxXh79Y2q3vnqYwoHCBxzoNx611jkX0BBAVm51rnr/7oOyV
 Qum18k5gxUYxSKPqYiKf+VJ9ARRAG82Vwq7a3GbZvDZanFfOArPlKrVA+UpA4TBsFEGl
 fNVQ==
X-Gm-Message-State: APjAAAWu9JP8XNYOwoFuVwEKu2DKWbYYmas6vdlYgXpIdusyYEi7ylQH
 52k5y3Itcdl0ge3g2TMXPWj5TH9BYF/+hug4pdkwug==
X-Google-Smtp-Source: APXvYqwOEBct/ArkjXQFpFbBybayNzhAJvgO/gCiItRRDyTrcEf0+4moVuACHh04Xe1r6bkqmg92v2n25c9GFShgqFE=
X-Received: by 2002:aca:3e8a:: with SMTP id l132mr486444oia.146.1572525424721; 
 Thu, 31 Oct 2019 05:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <c83fe0e7157562c3c17598917977eb4d@hostfission.com>
 <20191030185248.GC3114@work-vm>
 <88f1c3701740665b0ebe2f24c8ce7ade@hostfission.com>
In-Reply-To: <88f1c3701740665b0ebe2f24c8ce7ade@hostfission.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Oct 2019 12:36:52 +0000
Message-ID: <CAFEAcA-PGJKDP0+eF0e0=uG8Fsimgz1aqs1Zj-7zgH6rx4MC7Q@mail.gmail.com>
Subject: Re: RFC: New device for zero-copy VM memory access
To: geoff@hostfission.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 31 Oct 2019 at 02:56, <geoff@hostfission.com> wrote:
> If you still believe that vhost-user should be used, I will do what I
> can to
> implement it, but for such a simple device I honestly believe it is
> overkill.

While not making a statement on whether vhost-user is technically
suitable in this case, I would note that we have a strong bias
towards "use facilities we already have rather than adding new ones",
because having multiple ways to do something in QEMU is more
maintenance effort and also confusing. It doesn't seem to me to
matter if vhost-user provides extra features your specific use case
doesn't need - just don't use them...

thanks
-- PMM

