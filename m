Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 675C62DCD95
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 09:23:41 +0100 (CET)
Received: from localhost ([::1]:60862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpoZX-00043X-Ra
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 03:23:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpoYG-0003dJ-RS
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 03:22:20 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpoYE-0005jt-PX
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 03:22:20 -0500
Received: by mail-wr1-x42e.google.com with SMTP id d13so7395782wrc.13
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 00:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Nyq+7om6s+fYX7bREW/sWfTLxP2Pa8bwvfHP8ksIx5E=;
 b=mNUm4hEyxnyDCMIFz6WxrTxulTYd/JIAL5d80YPpZqgEoPkb8+AKR90TbOHKPlv+HJ
 QbJH7F8OOQpPhv2wdwtlwneZfECbl05cK1oS03Pdz4fpRAkqKeUxFofBwSq5m44gV2+d
 /lUwM/Uptf1kj6h8lNTSCUopP+Hsunaf0jrsywv9aluvNhbWwhk2gNkmqvPhw6dNXfJ9
 V9gau5Sd+Vmw/YrKz7WxHZjHaKe9VHRgSR1iGLTErFTQb95Wz1rQbOfS4NDs2lUfOFhg
 2g+6s1A6IHSybliq6syk6xXW0ksSUeq5LmvMhxCZy64WWVPY47rbCFSPT89Wt1jTwmZt
 uRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Nyq+7om6s+fYX7bREW/sWfTLxP2Pa8bwvfHP8ksIx5E=;
 b=LufNWQGnHfRxNTR12b3um+gOXWRnS60iwhHthL9ba4/ytl1cTdmPF/emkBSiAPS499
 cC6ZMB4ya28/4LcZXQi9xbaPFfoT6B6JWRV7zC9CK+x15uJT/KCpxzmuBo8k8eATt6gc
 r9QHv0iSRNd2DPERDZzTI0L0/GC40e1SbxSVhdgZoU8G6mn2s7+2friipOL/6OJUbBRD
 1x0m+4d/nI/gxFm9FrzMTM1WNLWynLlGp3qnS49urrAvZNyaNqHZGwjx55qYrGorrwGy
 aWVNpHRAwM7v19G6WeYzP/gOw6oVc5BI66Qvc0Pnu1Ra4rqVz1wY0Nit1TWRttiis+Sy
 h3kg==
X-Gm-Message-State: AOAM531fsKhC6iTkPO238RhoZsr5vtpPOgq11TqijR6wAiLyXUbY8LFC
 +qKTPCkwN6AOje98zU0nDIGXwQ==
X-Google-Smtp-Source: ABdhPJyvaxseMiBwxq58jRqmeeLtY/I8rSSrEHncG4rq8SfLpFa6jRjqw6ST44B778GSqSwCRLDFhA==
X-Received: by 2002:adf:dd92:: with SMTP id x18mr6701547wrl.311.1608193336816; 
 Thu, 17 Dec 2020 00:22:16 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p19sm9114987wrg.18.2020.12.17.00.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 00:22:15 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B551D1FF7E;
 Thu, 17 Dec 2020 08:22:14 +0000 (GMT)
References: <20201216164827.24457-1-alex.bennee@linaro.org>
 <87ft45sj61.fsf@linaro.org>
 <CAFEAcA9iXp8z_L-t6Y_kVfRMJf9a6MGMJVsLNVwzq6VfO9-Xmg@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/11] testing and configure updates
Date: Thu, 17 Dec 2020 08:20:47 +0000
In-reply-to: <CAFEAcA9iXp8z_L-t6Y_kVfRMJf9a6MGMJVsLNVwzq6VfO9-Xmg@mail.gmail.com>
Message-ID: <87a6ucsuyx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 16 Dec 2020 at 18:24, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>>
>> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>>
>> > The following changes since commit af3f37319cb1e1ca0c42842ecdbd1bcfc64=
a4b6f:
>> >
>> >   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstre=
am' into staging (2020-12-15 21:24:31 +0000)
>> >
>> > are available in the Git repository at:
>> >
>> >   https://github.com/stsquad/qemu.git tags/pull-testing-161220-1
>> >
>> <snip>
>> >   - hotfix for centos8 powertools repo
>>
>> As you have noted this requires the cached copy to be deleted. I'm not
>> sure if it's worth handling that in code or if you just do that manually
>> before you merge?
>
> I would prefer it if the gitlab CI infra Just Worked. I don't
> want to be manually messing around with it...

I updated the centos8 image to FROM centos:8.3.2011 to trigger the full
re-build automatically but that has caused a bunch of failures in other
bits so that will need some additional fixes.

>
> -- PMM


--=20
Alex Benn=C3=A9e

