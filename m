Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A86E61911F0
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 14:48:22 +0100 (CET)
Received: from localhost ([::1]:49012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGjun-0007yh-Ni
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 09:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51813)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jGjs9-0005rX-IP
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 09:45:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jGjs8-0006FN-A8
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 09:45:37 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:35456)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jGjs8-0006Cg-3L
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 09:45:36 -0400
Received: by mail-oi1-x241.google.com with SMTP id k8so18539499oik.2
 for <qemu-devel@nongnu.org>; Tue, 24 Mar 2020 06:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nIxqmGHI/iamTYcNvMOSGSNA5T4bI1asBc5dnCg5cOQ=;
 b=kOO2Tin3TO4oa2qIjiXXYZE8hTmvHrV0/k6FKFQvlYKYZOxr6rRFV1MJITVzU0iL7Y
 nEBouQ+mTRpOExTt/gUkIScBxJbsjI5rFW4z1nCI/UgTnOXCbCOR8wLA4aZEGDuq5jMd
 MPurLH3jPrlsIeN5eezgYGJm2wPv4JwnGrrIhguvm/dZRBzN//NPHo/3TgRDhtkHZEYW
 JdI68Ob7INkNX2BSd122h0X5i33P6d9Fdvfb8qpnlW28YdTd5wNTEVT/cYJp2o46/0IJ
 xTRFMygcXK+ggc+ygstBiTqdRA4KwqpgRDBu2b2fqWWVuslzM78TxaG0RLaBb5kCOsHn
 4Q9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nIxqmGHI/iamTYcNvMOSGSNA5T4bI1asBc5dnCg5cOQ=;
 b=hWlI2WReV2y1zjYe8PKWAEzk2LlREmH/rPtOxwsF26JiZ4fPqPdv0fGj3ZWJQa2TcR
 omLFUzaKUSwoPLqbAkiSOfjLgRtgNliLOAkQuvWvGlkXjsC2ddRkCln1GtLpvGMkm+RA
 SKYU3kHgoBh4xrI0X4WYcQ6KbNMGxrXkwWA8FfURSvsHcVnFuKD5TbuqpBe/1mUWQD/F
 59TJY+RDVNRbKKVEpAvFBpfIl41oiQFq7CdpAdSehMfXKiftfKlkBJoJHc2u2kAUCuQq
 0cDeURW7NDooETFnmGw+/H2daK7L9LdVtUQB2/Z0NmX8iH6ONL82NY8r7T06HvpdsdeC
 KtbA==
X-Gm-Message-State: ANhLgQ3TmmHPKjJlo8Wtyl4PKrMWnOkiguZ8bw2oELYFJMg0Gl0lPfKO
 idlMjU928hYQvs3gPmo9gNiGffgUMyHebW6sKKh6Ng==
X-Google-Smtp-Source: ADFU+vse22gf6SQU1ckby5sMLYFePlI5EPm6tfMqgT/+4L+t4SOsTeVdXN9hijuR2kZnYJu3QUobPDHNCMVBSIJ5IMY=
X-Received: by 2002:a05:6808:64c:: with SMTP id
 z12mr3300164oih.146.1585057535097; 
 Tue, 24 Mar 2020 06:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200323120822.51266-1-dgilbert@redhat.com>
In-Reply-To: <20200323120822.51266-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Mar 2020 13:45:23 +0000
Message-ID: <CAFEAcA9=ZbmeYmQdeEajvWZiUeZOjwZCpBr+B+_gAyn4XsFgJw@mail.gmail.com>
Subject: Re: [PATCH] hmp/vnc: Fix info vnc list leak
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Mar 2020 at 12:08, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> We're iterating the list, and then freeing the iteration pointer rather
> than the list head.
>
> Fixes: 0a9667ecdb6d ("hmp: Update info vnc")
> Reported-by: Coverity (CID 1421932)
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

