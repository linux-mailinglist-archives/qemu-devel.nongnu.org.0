Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F13A631F7CC
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 12:00:16 +0100 (CET)
Received: from localhost ([::1]:54834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD3WB-0008OC-VA
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 06:00:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lD3Uu-0007af-JC
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:58:56 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lD3Us-0006vK-Rf
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:58:56 -0500
Received: by mail-wr1-x42c.google.com with SMTP id 7so7718315wrz.0
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 02:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=8qF/m/FwsIqcJFwADak3n513mYPwiBIOk3WgOf4ukEY=;
 b=aTtNc9BGHmv78WZqwU4pnyqWAIw+ctMioL7ao2aYgD36g5LWxCbhZelhLZ+SPxx4iu
 sDoODamsH7+4qJ4Ri2kbvA5b9byx2w2USjENf1abx9O+5sKl8NC06V0w86ivozlMRX3y
 2vgXDdHtHWR+5JAbmNQr3bVLQ7pdoTJOW5BOIoUZxafH8Aj/9MRXvyuOZiwwabIWe0of
 16Temw4P8kck3SzGD2Qe44h7c+JAfHb67isyCgW9ZZoyVw5udeJs8/46KCBGd2PFbNT1
 IAQsbZDCSprxPxgdTJRj/GDiibZQZ0dAbDL3uT64Lwuj4lqUvcJ2SIEQquJL5aicoysj
 VAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=8qF/m/FwsIqcJFwADak3n513mYPwiBIOk3WgOf4ukEY=;
 b=kt6ffjKPB3CDGH6aIkgmYTtCY347x7T/gIT68sz87qDRl659ivx2CdpByAtU14dEq7
 7Eq/SVjA0VDlf3WfhJRQ3ZYhMs6hO4/Dl9tOtgeBikKK4g4XrQs5kUb+mJsKHyCg9Ism
 3T1NAimwhYhdio5bIi1NclLTI9CLIZ18A7ZniHCCLE1jqlMhByYFGBlhHYcSyaawTiYh
 EngJL2JN09b19fRQ38TZS83OMIl4wLFeDMc4ACrqcS+ZgLDGxnVQ6zUiRlb7E4vWXP4+
 03VRppwmmmVZtmGqizweWtR5vnAVjPCIgxuPBTrYtZknMIhBxl8nUd66CqTzji4WaTt9
 dlWg==
X-Gm-Message-State: AOAM532M3JLXEd1+hRJsqyVyIfNZpyZXQvLRzzfMhXjs3kB32lk+J5LI
 iOVRyAMmecdM0yIIZEBr7xQRfw==
X-Google-Smtp-Source: ABdhPJw8t98t3TtkfCFhTaDWdZX5NPQ5wB05nuOdB9MrJMHNOb19BlyUAOK1EStoBQQHEqoCLwcjqA==
X-Received: by 2002:a05:6000:89:: with SMTP id m9mr34030wrx.3.1613732329935;
 Fri, 19 Feb 2021 02:58:49 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t11sm993423wmb.32.2021.02.19.02.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 02:58:48 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 329021FF7E;
 Fri, 19 Feb 2021 10:58:48 +0000 (GMT)
References: <8735xss5q3.fsf@linaro.org>
 <CAFEAcA_24bo+9CjeoVL8Ke5PzCwmBw_z4H8nbOQbOGg=1HxUxA@mail.gmail.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: FreeBSD build regressions
Date: Fri, 19 Feb 2021 10:58:08 +0000
In-reply-to: <CAFEAcA_24bo+9CjeoVL8Ke5PzCwmBw_z4H8nbOQbOGg=1HxUxA@mail.gmail.com>
Message-ID: <87wnv4qq6v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Ed Maste <emaste@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Gerd Hoffmann <gerd@kraxel.org>, Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 19 Feb 2021 at 10:39, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>>
>> Hi,
>>
>> It looks like the build has been broken on Cirrus since at least 7b2c4c:
>>
>>   https://cirrus-ci.com/github/qemu/qemu
>>
>> I did attempt to have a look but "vm-build-freebsd" seems to be failing
>> with a different error
>
> FWIW the vm-build-freebsd build-and-test works for me, as I
> continue to run it as part of the merge tests. Is this something
> to do with whether you already have a freebsd image cached
> as opposed to it getting re-built from scratch (perhaps with
> a newer FreeBSD)?

It did re-run the installation when I first called the target so I guess
it was that.

--=20
Alex Benn=C3=A9e

