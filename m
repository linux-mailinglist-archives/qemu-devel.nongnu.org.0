Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1459F673528
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:10:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIQid-0007vw-FR; Thu, 19 Jan 2023 03:56:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pIQiZ-0007uI-Em
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 03:56:20 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pIQiX-0000u3-J8
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 03:56:18 -0500
Received: by mail-lj1-x234.google.com with SMTP id y19so1387604ljq.7
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 00:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VYi5osaBieEficrlPFEUapJ1eB5+aCgZPTCTuDXsBto=;
 b=PFz3wnHlz2Qjjrpqy6SAstU0mw3ljtRR+8IWMqpV2CCaGbw2b1sWQ1w4BjbMRSGmBk
 dAaY2MyfKuHJ9PMmLBrIJzh73l0Uh5GOdXrZi55lyMB6DRU1vnZN8hC48mPHJNXWt7lh
 ozgxnivJpN9MZYXidS9ryoYoEbDm6Mzj6p1tThgMeCaawBnIAO/8m7TubzhsMDUiNTzS
 4XOwBJi/x6KLYMBCPhO89nz/nUHnQzlCQ7mbOU0GHnbReK4GZIPqtEgYri7PZhdgYjaF
 QTtQRm4cNEH0+mLV3m8xUYQ9HCsW/eS88wBPxoFfumXQuTmkLGxttGXzgsUrfTDyaq3m
 Wpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VYi5osaBieEficrlPFEUapJ1eB5+aCgZPTCTuDXsBto=;
 b=agO8I0GySucHnDJeMpHeL+o3A2+fpLgQtTsBOfVnMBvuRMytmuFxVuSaSpwQPPOs+W
 /o4NLzss51Vb7Nyx2p28n9yHmnExqp5UthCYEfYek8xNxmXMiTGhN5R7S3AzIHgSV/Yu
 vT6cGohZWmKCyB3ZfIUkKG79ckArttzi3NiT3c+tNKTDJY2fGNxaSv9SzSDtt5kW5C7A
 E1zCV8pl7gGVhPWEKgXdwom8BXBzyC2YmpTkl9epYBdpd2o+vdtc8fAkKYht+iVHorRb
 SX/Bi9yrbKPA6EbbqwXSDr4EOVKzt45wpayvrDDVZzXJBcJQIFeH206xJEY1QFtUXpVI
 J4sA==
X-Gm-Message-State: AFqh2koCFDgTkk/xPvjFQ6ZFOscOfprxdKBKSzvJkVDblr/yhxwuC9Bk
 yMsNSSxD/NGbIijo7zffi/Tpf1DzB6f8Vvh/l6E=
X-Google-Smtp-Source: AMrXdXtoUXAJYjJNRECEeNjY0OwQX0zrTB9CU9OiysIv57sCVD9bj/1lcAmVsJC4Bu2cLgderw7rtjH2oAomZ5G8y/8=
X-Received: by 2002:a2e:9151:0:b0:28b:8cdb:151d with SMTP id
 q17-20020a2e9151000000b0028b8cdb151dmr495194ljg.94.1674118574722; Thu, 19 Jan
 2023 00:56:14 -0800 (PST)
MIME-Version: 1.0
References: <c2246b1a-51b3-2843-5164-c424c571874f@redhat.com>
In-Reply-To: <c2246b1a-51b3-2843-5164-c424c571874f@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 19 Jan 2023 12:56:02 +0400
Message-ID: <CAJ+F1C+EC-tgDOyX5e56utKdUz-DXMMtwrtVyKXT2Jj4r43OCA@mail.gmail.com>
Subject: Re: MSYS2 and libfdt
To: Thomas Huth <thuth@redhat.com>
Cc: Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi

On Thu, Jan 19, 2023 at 12:31 PM Thomas Huth <thuth@redhat.com> wrote:
>
>
>   Hi all,
>
> in some spare minutes, I started playing with a patch to try to remove th=
e
> dtc submodule from the QEMU git repository - according to
> https://repology.org/project/dtc/versions our supported build platforms
> should now all provide the minimum required version.
>
> However, I'm hitting a problem with Windows / MSYS2 in the CI jobs: The
> libfdt is packaged as part of the dtc package there:
>
>   https://packages.msys2.org/package/dtc
>
> ... meaning that it is added with a usr/include and usr/lib path prefix
> instead of mingw64/include and mingw64/lib like other packages are using
> (see e.g.
> https://packages.msys2.org/package/mingw-w64-x86_64-zlib?repo=3Dmingw64).=
 Thus
> the compiler does not find the library there. Also there does not seem to=
 be
> a difference between a i686 (32-bit) and x86_64 (64-bit) variant availabl=
e
> here? Does anybody know how libfdt is supposed to be used with MSYS2 ?

The msys environment is a bit special, it's not an environment for a
particular build target, my understanding is that it holds common
files/tools.

dtc should be added to https://github.com/msys2/MINGW-packages for it
to be available as a target dependency.

--=20
Marc-Andr=C3=A9 Lureau

