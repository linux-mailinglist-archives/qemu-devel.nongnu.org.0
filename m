Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF99686B5F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 17:16:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNFlw-0003m8-Nr; Wed, 01 Feb 2023 11:15:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNFlo-0003hY-7I
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 11:15:36 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNFlk-0000mP-Mk
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 11:15:34 -0500
Received: by mail-pl1-x62e.google.com with SMTP id d3so18891318plr.10
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 08:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lLWxW21gvtVu/4yrPsTrebimYkH+zGP2iW+Iu7rlL2U=;
 b=D7NEiTxVpCO4c70EkNVxty6SJoUc+GWT6GYYw2vWioL6bMj4XOG43jXK/+Ae9795Ih
 4EnGPOCmLoMlsywTGJFHuhKgA0ltcIHlbwvL5huF1Yr6fST4iqqSfkCI3XWzfF1dIXsN
 Iddsdr2UCdqD4WTmpoEG+I/00qRga5Qiwik9YgnyWDSJuc+Ixs9ggqgqqtAMRfElDrZP
 CSKZJyNUuyl9TF2znwEsfh5jafhlkLeCteN8fAkGn88NhRxYaBN029Mk17VXvnngBMrz
 sOjr4N8g25MyCo80Rv12HdgRGTirvW+fp0bgTGzutzIMyROn+xZ1GrxaNNn64vT/Let8
 e2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lLWxW21gvtVu/4yrPsTrebimYkH+zGP2iW+Iu7rlL2U=;
 b=0dhxSldTjo0H/27Lvpz8lss3AFX6QKSLXWkkt8O8TTX9+I7i+vh6+R+7++zsCi1AdZ
 WLFL6oHABx+uAerJp+SVbDkcbwoV5FKQo6D998JqmrxKa0WnreL4aCeOUW6trLBoOk5o
 elC7hDpLTgEq2JpJbX4IqhmFjmAxTRqjzdBKuEIOS/uNT0JKoYUJ7AT/RLMD4bvWTTQe
 tKIbJb8V68cY8fhMZ1Ta2mtGGJdM8zWGlJ08b63/iRM/SU0jvCAIEV6x2YYCpkjj5Wls
 zaVF7Z3Kilwjn5OidMx0VJw3dXDeNfWXu3myVsjycdDx+/cTeq7zuLAuSglkq8dqi1/4
 F3Gw==
X-Gm-Message-State: AO0yUKWCA71jf+U4HWDYJxZ5b02wVaOAQjfGpYYU9gidRlm3+9p7L6V3
 n4EbaLEyGn1+BSyc7gY54SGfoSX6QFtamSlBycJhPA==
X-Google-Smtp-Source: AK7set/c0mt9IGTEN2bkgFSkgNKWXmp6OqpP4hUhFoWaAfWRy0gFF2+8FVpULa5xWyJ9f/02A4PKYYmBiw0cqW+uG7k=
X-Received: by 2002:a17:903:1c8:b0:196:3b96:6a1a with SMTP id
 e8-20020a17090301c800b001963b966a1amr770051plh.28.1675268131035; Wed, 01 Feb
 2023 08:15:31 -0800 (PST)
MIME-Version: 1.0
References: <20230126112250.2584701-1-alex.bennee@linaro.org>
In-Reply-To: <20230126112250.2584701-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Feb 2023 16:15:19 +0000
Message-ID: <CAFEAcA_TCHw2b=zOWOX7COLa-iqC1P8Bm1wiACKhmx32cuS8SA@mail.gmail.com>
Subject: Re: [PULL 00/35] Testing, docs, semihosting and plugin updates
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 26 Jan 2023 at 11:22, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit 13356edb87506c148b163b8c7eb0695647d00c=
2a:
>
>   Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into=
 staging (2023-01-24 09:45:33 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stsquad/qemu.git tags/pull-jan-omnibus-260123-1
>
> for you to fetch changes up to d200653282f50df2a994a0609f88baa6a5889f80:
>
>   plugins: Iterate on cb_lists in qemu_plugin_user_exit (2023-01-26 11:12=
:01 +0000)
>
> ----------------------------------------------------------------
> Testing, docs, semihosting and plugin updates
>
>   - update playbooks for custom runners
>   - add section timing support to gitlab
>   - upgrade fedora images to 37
>   - purge perl from the build system and deps
>   - disable unstable tests in CI
>   - improve intro, emulation and semihosting docs
>   - semihosting bug fix and O_BINARY default
>   - add memory-sve test
>   - fix some races in qht
>   - improve plugin handling of memory helpers
>   - optimise plugin hooks
>   - fix some plugin deadlocks
>

Hi; this fails the docs build on macos 12 (probably a difference
in behaviour across Sphinx versions):
https://gitlab.com/qemu-project/qemu/-/jobs/3697858012

FAILED: docs/docs.stamp
/usr/bin/env CONFDIR=3Detc/qemu /opt/homebrew/bin/sphinx-build -q -W
-Dversion=3D7.2.50 -Drelease=3D -Ddepfile=3Ddocs/docs.d
-Ddepfile_stamp=3Ddocs/docs.stamp -b html -d
/private/var/folders/76/zy5ktkns50v6gt5g8r0sf6sc0000gn/T/cirrus-ci-build/bu=
ild/docs/manual.p
/private/var/folders/76/zy5ktkns50v6gt5g8r0sf6sc0000gn/T/cirrus-ci-build/do=
cs
/private/var/folders/76/zy5ktkns50v6gt5g8r0sf6sc0000gn/T/cirrus-ci-build/bu=
ild/docs/manual
Warning, treated as error:
/private/var/folders/76/zy5ktkns50v6gt5g8r0sf6sc0000gn/T/cirrus-ci-build/qe=
mu-options.hx:161:duplicate
label machine options, other instance in
/private/var/folders/76/zy5ktkns50v6gt5g8r0sf6sc0000gn/T/cirrus-ci-build/do=
cs/system/invocation.rst

I think this is "you can't put labels in qemu-options.hx,
because it gets included in two .rst files (invocation.rst
and qemu-manpage.rst), and Sphinx complains about the
duplicate labels, even though one of the two files is
only used in the HTML and one is only used in the manpages".

thanks
-- PMM

