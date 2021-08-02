Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE0D3DD660
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 15:03:02 +0200 (CEST)
Received: from localhost ([::1]:46608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAXav-0007r9-VF
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 09:03:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAXZ6-0005lq-1S
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:01:08 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:43570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAXZ3-0008Dq-A7
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:01:07 -0400
Received: by mail-ed1-x534.google.com with SMTP id n2so24307440eda.10
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 06:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5LXyp39U6M3LmtNvMcwEvGz5sSOHaY5KhC8S/3mgoek=;
 b=vX6oV+IPDDwVACly7NkBUoWy9ynPmXd23ngvBHlXHOMssUNC7KUvTUF7pTB2/wUhoc
 HOlsSYBWTbzNGNUDNf51XlpN/Ax/PQX4rLLEZBsZbk3ZWq0Hvv4O/GOOLQe3o7bJHkNv
 60f4cD/kuBpLX/YW0QBLLR8vL0EDZ0cpBk/2ha6XL4RFnioRgFvDvVNdExTmmIz5Orhj
 i1nwr0W2oYvdnbVHI4tAhfcUrtbXwR3grT4l6OwRlol7oMI8p0Wj3f9rxapZ2G2u6Rgh
 txtS3Eb32Or1KFsHuuZBnwrvm4yKLzK+/VmLUhJ9PwicP0WA6PXIx2TIccTkwAK6iELD
 A8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5LXyp39U6M3LmtNvMcwEvGz5sSOHaY5KhC8S/3mgoek=;
 b=NyIqYPvHyhLlldJKYQivSRay6GWsEsGcK1zsjdyuh/eg9g+u3xR46hrGauS7+bRIwk
 95axsKLW1JssSkwXTI4mIBMSwbYD1Ppoi474jfWK8FkMV6laOH1UVvBX3sTQcCHj4woL
 +BMrjCuip8kbihdqSNcSnanzkNT1h9pgJM40H+yitbgWv7sP7GrqDyIjRkpS5H333iVT
 hthrI//ZeZ9+TfLAYPyblwtZG19sBOODPzHTD+op4ufyLMgfCFKGqcdTJRfTWlrFIIr3
 WwZ3i93B3S9j593H6SFSWvNCFSKJ9YE3ZaoHuJ01UON72YhwK3DC5QUJnBqNIKwi8kCk
 /r0w==
X-Gm-Message-State: AOAM532NfS2C444vDbNFU8yQb/vlTBzJoS1mWKWsvfqdrQErJsJcz4xI
 zwGdCP75T+F5YCt5GZ6XiHJ8yYEJg8V4kmHIQW+ZaQ==
X-Google-Smtp-Source: ABdhPJwq/7XCaqIM/u0VXQvI9qvnXYbsjX5sWUYmaDJVMcrJb0Wpdq2NKtgifvRQc7XZ6jvQKiBM5iaMrB2jYQjflp4=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr18796906edt.100.1627909263406; 
 Mon, 02 Aug 2021 06:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <YQeu+Jm2Q0NlQ2Im@redhat.com> <878s1kgg2f.fsf@linaro.org>
In-Reply-To: <878s1kgg2f.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Aug 2021 14:00:19 +0100
Message-ID: <CAFEAcA-JDq7erZNhnnoxQP-2UpNH1b_PMeRGj7j8s3Vx3tJceg@mail.gmail.com>
Subject: Re: "make check-acceptance" takes way too long
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2 Aug 2021 at 13:57, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>
> > On Fri, Jul 30, 2021 at 04:12:27PM +0100, Peter Maydell wrote:
> >> "make check-acceptance" takes way way too long. I just did a run
> >> on an arm-and-aarch64-targets-only debug build and it took over
> >> half an hour, and this despite it skipping or cancelling 26 out
> >> of 58 tests!
> >>
> >> I think that ~10 minutes runtime is reasonable. 30 is not;
> >> ideally no individual test would take more than a minute or so.
> >>
> >> Output saying where the time went. The first two tests take
> >> more than 10 minutes *each*. I think a good start would be to find
> >> a way of testing what they're testing that is less heavyweight.
> >
> > While there is certainly value in testing with a real world "full" gues=
t
> > OS, I think it is overkill as the default setup. I reckon we would get
> > 80-90% of the value, by making our own test image repo, containing mini=
mal
> > kernel builds for each machine/target combo we need, together with a ti=
ny
> > initrd containing busybox.
>
> Also another minor wrinkle for this test is because we are booting via
> firmware we need a proper disk image with bootloader and the rest of it
> which involves more faff than a simple kernel+initrd (which is my goto
> format for the local zoo of testing images I have).

If you look at the log which has timestamps for the output, UEFI
takes some extra time but it's not too awful. The real timesink is
when it gets into userspace and systemd starts everything including
the kitchen sink.

-- PMM

