Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B73CA487F95
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 00:49:13 +0100 (CET)
Received: from localhost ([::1]:53076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5yyu-0004cb-Bp
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 18:49:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1n5yxg-0003mK-AS
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 18:47:56 -0500
Received: from [2a00:1450:4864:20::52e] (port=35509
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1n5yxe-0000wx-Dt
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 18:47:55 -0500
Received: by mail-ed1-x52e.google.com with SMTP id q25so19292080edb.2
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 15:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Q5tWsk6vldEcw107B4UnHJaZ6a1JlD/jVlvXb5A2nTQ=;
 b=PWjqfIJbTFS2LvycyFsZysu//L9xkctOnzD6Ha4ag7/mV3fNFkvGqb1JJzilgdRuDN
 +/ZIOeyR35qBASDEYmTZ8dfqNmzbUWkAt5bKbsDNCOw8fZn/v9ETFNSpL1dy7X7DleUO
 WHt5wnMju4zqJpCUU29itkB/BHsuhp7PUrOSswKUagyqbPq2eUaeqtXFtgkzgGdG75pM
 +kbXXglPtepaKVBqwnnPTzDd3ofbyCbFtKpZ+4HViJI7gr+ZGi5t5q935xI8pKxhcRaq
 vwiM+MWsvxs8xxZ+pRfDptXju68QIc4PFE5subY7+nbxfzZYMsebu3AjzeA9vhkvA05C
 HR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Q5tWsk6vldEcw107B4UnHJaZ6a1JlD/jVlvXb5A2nTQ=;
 b=YE8y/WkE8U6/vJ1Z90M4LyWjuf/CTPS8vI9W8zp7lokDuFt2a1vbDYTsrBoaQWyVwm
 11YNNdvLSSBblPfGsJjF+I16ox4hsibdOE4FsN/SYlIwEELIxXrvP3WF8X+ZAgHHk99y
 hHRb/HJHAOGc5gzS7K2XIj4dX049RSQ8UFl1XQ+/G+E7El6GWCSzmcgXsB9Ae12OamYg
 Ig0g1Qzs5DJ0pyJgUwZd7nVZcJ6H3XjcVWn045FI+gYTu3Zi8t32MU/02LMQHr2W7Asx
 z0TNY4rdkryGgFqEgkKArW84kqE0BpyQR0H+ZGMLUOKYuGqhvQWqHOMCGjU+3TmJWoif
 D67A==
X-Gm-Message-State: AOAM531aKAT9p0OzhsvL2fwuiz4xNI2vx+zOX7JuCXezymPhgO1BOK4y
 EdmBQ9jDWOxgdnqg+2i2T4dYfw==
X-Google-Smtp-Source: ABdhPJzGZzQyFDpW5s/Te4uO4udTcRCT+SXGgUHec0FnoG/skZPksZkRo4NrP+tiU4RiTgRFIn85KA==
X-Received: by 2002:a05:6402:2546:: with SMTP id
 l6mr12839959edb.207.1641599271795; 
 Fri, 07 Jan 2022 15:47:51 -0800 (PST)
Received: from smtpclient.apple ([79.115.178.1])
 by smtp.gmail.com with ESMTPSA id f18sm31173edf.95.2022.01.07.15.47.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jan 2022 15:47:51 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: ui/cocoa.m compile error
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <CAFEAcA_=jn1G==9R1=LuU7GF0=LWPz92f1Qx9xO7w+m+TqL1Tw@mail.gmail.com>
Date: Sat, 8 Jan 2022 01:47:49 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <F140E9AC-F44C-44A9-8670-F60E33046B83@livius.net>
References: <586FEC07-844C-4E1B-88E0-93B97FFC9010@livius.net>
 <CAFEAcA_=jn1G==9R1=LuU7GF0=LWPz92f1Qx9xO7w+m+TqL1Tw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::52e;
 envelope-from=ilg@livius.net; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 8 Jan 2022, at 00:16, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> ... In this
> specific case, NSPasteboardTypeOwner seems to be part of
> an API introduced in 10.14 (Mojave).

Thank you for the details, this explains the error.

> So the upstream answer, I'm afraid, is that you should
> upgrade to a newer macOS version.

Unfortunately this is not possible. :-(

I'm producing cross-platform and cross-version binaries, which means =
unique binaries based on a bit older release that are expected to run on =
all more recent releases. For macOS I just upgraded the base from 10.10 =
to 10.13. For Linux I upgraded from Ubuntu 12 (kept for compatibility =
with RedHat 7) to Ubuntu 18.


So, it seems that with the current upstream code, the direct consequence =
would be that for the macOS builds I cannot enable Cocoa.=20

My next choice would be SDL2; I tested and the build passed, but I did =
not know how to test if it works.

My other binary distribution (the qemu-system-gnuarmeclipse), based on =
the venerable 2.8, used SDL2 from the very beginning on all platforms =
and still works on all macOS releases since 10.10, so I guess this would =
be a more permisive solution.

However I don't know if any of the existing Arm and RISC-V emulated =
platforms can use SDL2 on macOS. Actually I don't even know which of the =
existing emulated platforms, especially the bare-metal ones, use any =
graphics at all (in qemu-system-gnuarmeclipse I added pictures of all =
emulated boards and implemented animated graphical LEDs, all via SDL2; =
it was a quite convenient feature, highly appreciated by the users).

So, to summarise, I'm interested only in =
qemu-system-arm/aarch64/riscv32/riscv64, and the build must pass on =
Ubuntu 18 for Intel and Arm Linux,  mingw 9 on Linux for Windows (7 and =
up), macOS 10.13 for Intel and macOS 11.6 for Apple Silicon.

The binaries should run on all more recent versions, and are mainly =
targeted for running unit-tests on CI servers (so no need for graphics), =
but also for local debugging sessions via GDB and semihosting (where =
animated LEDs would be a nice to have feature).

Thank you in advance for your valuable advice.


Liviu


