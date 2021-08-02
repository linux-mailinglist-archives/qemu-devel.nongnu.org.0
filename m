Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCEC3DD609
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:53:15 +0200 (CEST)
Received: from localhost ([::1]:34434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAXRT-0007Wt-1t
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAXQN-0006pP-4Y
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:52:07 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:51836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAXQL-0004gj-KC
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:52:06 -0400
Received: by mail-wm1-x332.google.com with SMTP id u15so10351975wmj.1
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 05:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=rBwITbbw0Izi6qOe/lUwTsA1ejn1G8JHymZqUgxAGy8=;
 b=lIMmNFprEEhN1QDmqqlM/ZR2Gyt5ARSqdbOnqaqV5bHTAkJY59zXWuPVAavZHz1hv+
 92hDvfxhaqlRK8k86itN/rDYtsIZ6yLuGIn1bAaU8QcHIci1ATO49lUgNGtFuWJKhlSC
 05u4Amfxuun83jQnubPDjbiD+ffJ5MCvnWTOISPdWy9LksY2IJ++90eWFDQ5NagSJGS+
 9CAG9MWSRAT4jOvcOuvV1J9UiRYV+W1aaPPVJ0+o63qpHXt5M7jzzggTuAjfIERxtUAB
 PPMS7M4Ah2HQDux8SywozzQSMfD82hP8n80hrIsvBxonngEGxREbdnWVBMLBXkUi2szW
 fVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=rBwITbbw0Izi6qOe/lUwTsA1ejn1G8JHymZqUgxAGy8=;
 b=jtBjkblMnhwV4n9kRc7qY1CDNJUdyA6vZG2DQptq2usXrA23G25Dx/OU+4Y/HnmRGl
 JoIbXfJfZNwZDlI1epHO+YAApQUZyz1Ko8YU3M6MqBMXu9SmrS6HKvPZl/d0XFoYQciy
 AHgFcAX22CHS+o5RnT22XF8nLuTBkzHbVII4avp6+T1FNalNtxnPjfnbki8X/o+J6w4h
 NBMedMUom8FgNCtYH+cvux4iDZM1TSN3LByAWQdh089LJQZSf5ZCTdAhRCOolzG4mZIi
 WpeY0u4OhSk44VcWtCrUecksuu0eOEQZGwcvNCGWjO32Ln3a3Sh3a8fEGbXU9A6iEhwP
 OanA==
X-Gm-Message-State: AOAM533yU2DX0Xz6T14Z0YfcZ4x4os7jN6aN8fpaiVmahB21Z66LwC4B
 lNjbGnaWzKjk2xEbWLDz1Jr/4w==
X-Google-Smtp-Source: ABdhPJwQvITFf8T6qyfoY42SHbsk9wcYl3RiiTywwUkCINFA+hiTPldnkgMo/E8RcIxkiclx0qhhmw==
X-Received: by 2002:a05:600c:4657:: with SMTP id
 n23mr16506129wmo.46.1627908723938; 
 Mon, 02 Aug 2021 05:52:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o17sm9885983wmp.31.2021.08.02.05.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 05:52:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DBB2D1FF96;
 Mon,  2 Aug 2021 13:52:01 +0100 (BST)
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <YQeu+Jm2Q0NlQ2Im@redhat.com>
User-agent: mu4e 1.6.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: "make check-acceptance" takes way too long
Date: Mon, 02 Aug 2021 13:47:37 +0100
In-reply-to: <YQeu+Jm2Q0NlQ2Im@redhat.com>
Message-ID: <87bl6gggb2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Fri, Jul 30, 2021 at 04:12:27PM +0100, Peter Maydell wrote:
>> "make check-acceptance" takes way way too long. I just did a run
>> on an arm-and-aarch64-targets-only debug build and it took over
>> half an hour, and this despite it skipping or cancelling 26 out
>> of 58 tests!
>>=20
>> I think that ~10 minutes runtime is reasonable. 30 is not;
>> ideally no individual test would take more than a minute or so.
>>=20
>> Output saying where the time went. The first two tests take
>> more than 10 minutes *each*. I think a good start would be to find
>> a way of testing what they're testing that is less heavyweight.
>
> While there is certainly value in testing with a real world "full" guest
> OS, I think it is overkill as the default setup. I reckon we would get
> 80-90% of the value, by making our own test image repo, containing minimal
> kernel builds for each machine/target combo we need, together with a tiny
> initrd containing busybox. This could easily be made to boot in 1 second,
> which would make 'make check-acceptance' waaaaay faster, considering how
> many times we boot a guest. This would also solve our problem that we're
> pointing to URLs to download these giant images, and they're frequently
> break URLs.

It's been discussed before but previously the worry has been the hassle
of maintaining such images along with such tediousness as ensuring GPL
compliance. We've outsourced that problem to the upstream.

That said we've got test jobs that run from our QEMU advent calendars
and I added some for Xen testing from a stable Linaro file server
before.

> If we want the re-assurance of running a full guest OS, we could wire
> that up 'make check-acceptance FULL_OS=3D1' and then set that up as a
> nightly CI job to run post-merge as a sanity-check, where speed does
> not matter
>
>
> Regards,
> Daniel


--=20
Alex Benn=C3=A9e

