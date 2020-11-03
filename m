Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D85EF2A4A15
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 16:42:25 +0100 (CET)
Received: from localhost ([::1]:47218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZyS0-0005yl-Se
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 10:42:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZyLG-0003MV-Ht
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 10:35:26 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:35746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZyLE-0001yP-Gk
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 10:35:26 -0500
Received: by mail-ej1-x634.google.com with SMTP id p5so24757224ejj.2
 for <qemu-devel@nongnu.org>; Tue, 03 Nov 2020 07:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=T1vLjmrMhx7B1c2SbweuyM3CWU9aIPMWEZWigBmRlB4=;
 b=q5bSDPFW281qBbZEt5QqjMqeJDjHCID2FMO7Wu28DKKUF02qf9h8Pl1XVT+vo1QmjG
 VxicNB7lHXKMwGg+WdF8Hj1WR0g1qM0AZA1GTM+W61YuIkMS0mol8usS9hjYEdq3ffFS
 EkTRXcdiCR4bnKo44E2ygvU3Qx8SyogBE/6yNSUk9G10A9ueNGBb27LGKNQiwtpV5Wj6
 rLH2kqP71Uy7EkT3dt3a5D0/RJZ0TTUeypCftXcjNqHwtKVY9NxHHWtu5R01Hm19QSg9
 A0TLnQKD/dTXaGYgQBpx0OzHZfV2LbzO8v9kWThF7LY4pcXsgdzpft85p62E7BFfWJr3
 jM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=T1vLjmrMhx7B1c2SbweuyM3CWU9aIPMWEZWigBmRlB4=;
 b=PPVHzr1UV3qBctqQqfBMI3PoYeGf7Sknu90ARi2B/UmOSOtYxX7koqXNRZqxlE0tp/
 Ou4S3UXBX4NPF3NzmIYzcGJHYg5EQ6kTZ+85d5FaOLEBLpMlGJ9CzhMGZ9iDNiiL2731
 PIWfRywnmx5is7bZ2mrDFmsTWn2r99YuZtu4SRh6LUxfBZHeB+BaPw0cYEfvBlnhI2mn
 bjrdZEp3B/0NYfLf+QlZ/l30M7g0m8c/HIC0JBxErSY2Oy9wVldR3lVVp2p3bM25WUJ+
 YY4TjVFwzUo+7Gq9rDCVW0ll9fTjMSJp+v0I8naRw4XfwoAgHMtjpLjXpOero+d1CsTG
 rupQ==
X-Gm-Message-State: AOAM530Dw8bIhqcm/LzZqjCVROZU4GFLOwrWMxzZG3OLWpcxamDO9cAH
 EaNQA4vOEfVrWNkRaH3TlE7MtOgM6lj+oUJP2dNI5Q==
X-Google-Smtp-Source: ABdhPJxLVHhPil8eVnLFTkQWHx2YR2JYK2G2Qe6kGQ3pjMubI3ZQhc8iOTis78cDyvRNKfcSDO3yAaZH652cK80lC98=
X-Received: by 2002:a17:906:7254:: with SMTP id
 n20mr19721445ejk.382.1604417722717; 
 Tue, 03 Nov 2020 07:35:22 -0800 (PST)
MIME-Version: 1.0
References: <20201103140225.496776-1-berrange@redhat.com>
In-Reply-To: <20201103140225.496776-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Nov 2020 15:35:11 +0000
Message-ID: <CAFEAcA8YjzZwWVu7xOF=2N0ASpMxLopTzJukED7eA52mdT=Ssg@mail.gmail.com>
Subject: Re: [PULL 00/11] Sock next patches
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 Nov 2020 at 14:04, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> The following changes since commit c7a7a877b716cf14848f1fd5c754d293e2f8d8=
52:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-202=
0110=3D
> 2' into staging (2020-11-03 10:38:05 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/berrange/qemu tags/sock-next-pull-request
>
> for you to fetch changes up to 8acefc79deaab1c7ee2ab07b540b0e3edf0f9f47:
>
>   sockets: Make abstract UnixSocketAddress depend on CONFIG_LINUX (2020-1=
1-03=3D
>  13:17:25 +0000)
>
> ----------------------------------------------------------------
>  - Fix inverted logic in abstract socket QAPI support
>  - Only report abstract socket support in QAPI on Linux hosts
>  - Expand test coverage
>  - Misc other code cleanups
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

