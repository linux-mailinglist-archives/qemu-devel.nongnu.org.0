Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF57161B8A
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 20:22:21 +0100 (CET)
Received: from localhost ([::1]:51582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3lyG-0005Gi-PD
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 14:22:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53858)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j3lwC-0003HC-3J
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:20:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j3lwA-0005uh-WE
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:20:11 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:34113)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j3lwA-0005tC-R9
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:20:10 -0500
Received: by mail-oi1-x244.google.com with SMTP id l136so17730204oig.1
 for <qemu-devel@nongnu.org>; Mon, 17 Feb 2020 11:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B8weJRwTd+K5v7BDbdJ827q+dEER8YG5FgDu3SOzkMQ=;
 b=qicZEUSolhAPK0okKk/S0v0uEVDOP3YEC5/1vobZ3/EBzCBaTE2NP9aX7ss5/zWXkG
 znUiTlAaaoofLG6QTnG7pPlRLDlRrc1pbT3Vlwl/cmxClbxoB23MhWWlHGZ7/QrCaruc
 GnBCmOLvT0gLbwbciFr8KiPyJAGEh3BBV11QpJWqVpgDJXPDVyy950cMub3D/YZxtCfc
 gVaK7ZplN/vQD1zORpLBpDaq/Zw3uQkhO7ZYp40P909SXwoNlxW0/CRLoWPrgr5v+k/Z
 2XJNCSBt1eVrNOUviu8s2eVQ/B/1MqBllIPAGbFBPTh2HzUzBwmjZmkk/ejtpvuyLDjm
 xT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B8weJRwTd+K5v7BDbdJ827q+dEER8YG5FgDu3SOzkMQ=;
 b=hIMh4D3/25fHNHXec+AHqOD7QDShAc7p/wFMDTfH3zL8jX9yZZuz2itIaykXegCx/b
 vQXMvkTdnPSmKAis0nbMRoSD9lKQgxrr+22FpmkqAU0kvJhyyQtLa13GaLX06U2efbwX
 VnEZ6RZlnQOHFpeDnLeRJIEsI3NGXeCaajyCAuKek1nShEZnFusixD9Myu5IAxi/Qi80
 C54HCKPTn+6uUAamec9e714R95nPcLrRCtdDV1j7N6LGGA+HOlqDWj19dVIYwo85j+Se
 KCwklDC8l3z9SeCudLR748k9+bTdAvHAkWb0h3WutrwerTMIWy1QpY465+uWOhticW18
 QN/A==
X-Gm-Message-State: APjAAAW6A7EJ6c7Ku0QMdUQRI1Lr2awmtfNcXyq8tKeVv4uonha0xepJ
 Ne/vjbeX2nUZRBnrbBk+MFnyP0vhlkQbqGF0cG2iJQ==
X-Google-Smtp-Source: APXvYqxjBkD3OUST+fgM1wsghcelkM/5rGa13rOTXyJFrmONN9Ot4c8MsgjmMOlxf9FzpF7HnwbpvZ+GPjK4LmdXo0E=
X-Received: by 2002:a54:4f16:: with SMTP id e22mr349529oiy.170.1581967209934; 
 Mon, 17 Feb 2020 11:20:09 -0800 (PST)
MIME-Version: 1.0
References: <20200217155415.30949-1-peter.maydell@linaro.org>
 <20200217155415.30949-4-peter.maydell@linaro.org>
 <20200217182414.GC3434@work-vm>
 <CABgObfZA3faNxun6_LBdeAZochnoYyaJmansWuXLpTNpdmSX8Q@mail.gmail.com>
In-Reply-To: <CABgObfZA3faNxun6_LBdeAZochnoYyaJmansWuXLpTNpdmSX8Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Feb 2020 19:19:58 +0000
Message-ID: <CAFEAcA-jB_MTWGzizk8TJshFm+XwswLonZrOGO_qW9FKUmVxCQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] docs: Move tools documentation to tools manual
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 17 Feb 2020 at 18:41, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
>
> Il lun 17 feb 2020, 19:24 Dr. David Alan Gilbert <dgilbert@redhat.com> ha scritto:
>>
>> * Peter Maydell (peter.maydell@linaro.org) wrote:
>> > Move the following tools documentation files to the new tools manual:
>> >
>> >  docs/interop/qemu-img.rst
>> >  docs/interop/qemu-nbd.rst
>> >  docs/interop/virtfs-proxy-helper.rst
>> >  docs/interop/qemu-trace-stap.rst
>> >  docs/interop/virtiofsd.rst
>> >
>> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> Would docs/tools be the right place for the virtiofsd security guide
>> (as previously posted there)?  It's not actually a manpage.
>
> Yes, I think it would.

I agree. (IMHO) tools/ is not "things with manpages" (we have
manpages like qemu-block-drivers.7 that live in system/), it's
"documentation relating to standalone tools". It's just
coincidence (plus the fact that often the only bit of documentation
a standalone tool has is its manpage) that all the things
that got moved in this patchset happen to generate manpages.

thanks
-- PMM

