Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9004607409
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:28:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloKh-0000RI-HQ
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:28:53 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olndI-0001SY-Vi
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 04:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olncx-00011j-5a
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 04:43:43 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olnct-0000dE-SA
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 04:43:38 -0400
Received: by mail-io1-xd2d.google.com with SMTP id 137so1718760iou.9
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 01:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=m/HG8cM3n1IGSsLWrAZfDJmFGNOHO84tOtH4pBIcE2Y=;
 b=zjeV/GyJ6NyOAPI5BRwSS6aA//RJG/YcRuvfSZUUDxO7QWILJcB4cUieM+WTGOnA9Q
 8A23TGiO8Gozkuz+lzxvtaoT+ISqwso0Mwupfdfj0Q0aw2jqJgjQZK7V2y3DvQIWksxb
 Xy7IdYFFrkzXyNh23QgmTFBIdkJP3tWz2+0doJU4NCWk7IGrqQtxpd2Jv1x78iqM2ob0
 Hkn74fqVdFcyeCnfb6Ig3hCn7QSRXqP3ZJhG5bbUptwblHvj/cmJMpWaslzUPh7+Sg2Z
 C3rll50OvkzEoNII4jIsJiFtkO/Y8dkLKt/ugfWtIz7A9JFpzOxm8cxkT1XNrqVv/zMX
 vR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m/HG8cM3n1IGSsLWrAZfDJmFGNOHO84tOtH4pBIcE2Y=;
 b=XwQRec+mJoeWPgIwqZvU+IFHcrxh+k0iWRpKOaJ7bEYBGFGURj8qmOYREL75QeSYbZ
 OBli9zM3CycJOstZyTUSNhNeMFt1rFbwukbHgUnXhAI74bXWU0DIrdfvXja91FGUkO8L
 gc24x/Cyk0yqTVG143P5oNIhpOH8AT8TqWspYw7cnkU+XApahiiaqdDaaIjKHUvexPck
 LtAfuGPtFnDZmQJFm2u9WmldXt4xZTWsJkO6fqkXPY5POhLjQ1lDJIXQnDi4kC8kiq3i
 fHvMIrSApiitLYRMFMitnpccNUV6MYSUjOmIieImPxid+UtIsu8pJxidEt1sgczFPukk
 4xCw==
X-Gm-Message-State: ACrzQf0sUSTqzf36oWVuyvYw/+jfxdNc7JfEUjvD7F6UY84SnxhhEBTu
 VrVdzq58fX4OUU/6qASAWr7ZcSq3DfIgx2aYFMxweA==
X-Google-Smtp-Source: AMsMyM6RkEdiRX3rwnRfP7cXsNISA/IQUFXuCoQkPE+qHh1vIAAknuihECnSryu0SixTq+E5fzqSulrvT4Y9f76Xbic=
X-Received: by 2002:a05:6638:168a:b0:364:77b:6e54 with SMTP id
 f10-20020a056638168a00b00364077b6e54mr14010121jat.261.1666341814653; Fri, 21
 Oct 2022 01:43:34 -0700 (PDT)
MIME-Version: 1.0
References: <20221020123506.26363-1-ani@anisinha.ca>
 <20221020083810-mutt-send-email-mst@kernel.org>
 <CAARzgwwd_How_h+9sHWPOrWWZ7CbX+DN-uy-KiGf1VVyVmrLnA@mail.gmail.com>
 <20221020084311-mutt-send-email-mst@kernel.org>
 <CAARzgwxfKbrxAqb15GXp4j1enDPUhGBsL5jUzFtDvJkGM-7azw@mail.gmail.com>
 <20221020150857-mutt-send-email-mst@kernel.org>
 <CAARzgwwDjjHL-1fEeuySNZm8NbnGNaeE5h6zrPz_zaANfs5dsw@mail.gmail.com>
 <CAARzgww8P4Za=+r8q2a30TCY7Uzw6g2tgHeLLKr7R+WV-7qQVg@mail.gmail.com>
 <20221021042449-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221021042449-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 21 Oct 2022 14:13:23 +0530
Message-ID: <CAARzgwyW+ved0iVinWzSCg+KSCL67v+m6KySRdg_hUUev8JLDA@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>, 
 Maydell Peter <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Qemu Devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Fri, Oct 21, 2022 at 2:02 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Oct 21, 2022 at 05:45:15AM +0530, Ani Sinha wrote:
> > And have multiple platform specific branches in bits that have fixes for those
> > platforms so that bits can run there. Plus the existing test can be enhanced to
> > pull in binaries from those branches based on the platform on which it is being
> > run.
> >
>
> What a mess.
> Who is going to be testing all these million platforms?

I am not talking about branches in QEMU but branches in bits.
If you are going to test multiple platforms, you do need to build bits
binaries for them. There is no way around it.
bits is not all platform independent python. It does have binary executables.

Currently bits is built only for the x86 platform. Other platforms are
not tested. I doubt if anyone even tried building bits for arm or
mips.
It makes sense to try things incrementally once we have something going.

Lets discuss this on a separate thread.

> All this does nothing at all to help developers avoid
> bugs and when they do trigger debug the issue. Which is
> after all why we have testing.
> Yes once in a very long while we are going to tweak
> something in the tests, and for that rare occurence
> it makes sense to periodically rebuild everything,
> otherwise code bitrots.
>
> But the test is supposed to run within a VM anyway, let's
> have an image and be done with it.
>
> --
> MST
>

