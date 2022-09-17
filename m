Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F475BB8C3
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 16:29:30 +0200 (CEST)
Received: from localhost ([::1]:42046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZYoz-0002b5-9R
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 10:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oZYmo-0001Dm-IK
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 10:27:14 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:39817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oZYmn-0001fJ-1H
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 10:27:14 -0400
Received: by mail-yb1-xb31.google.com with SMTP id y82so36541579yby.6
 for <qemu-devel@nongnu.org>; Sat, 17 Sep 2022 07:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=1dcAIFV+HKtJsP8PJUXR0KrclGDrkTu/daNObnT8oI0=;
 b=GUttjybiVkofPmMKjm59bNbvAwPIJ1bYuzxd/6mFGDGNnmllzNj/HOQC54VHXMGWD4
 2KvrYwbv8hRixP+TvCk8Y4ORoWM3IHfCRddbZGDM7O79YJZefLo3d3HhlR5WX/Zg73ic
 iUIQL6Hb/lLb6n3FIf/rzmZIVB402odMkxG8T70/8YB8zNvEn+wepyL+HVHHPoJ4CvzW
 Ps2NDJEKm31gIXbqUAcTk5jdKiAMXWAi07Fy81QHuEmEiz280KxpmAG77kDiphk04clB
 8qOmHevTaBKVXFVnUrDRRNAekNsgbZxr9+A6nJPQv9//8hS33aC/vMxc1o6PN0wIpb4/
 T5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=1dcAIFV+HKtJsP8PJUXR0KrclGDrkTu/daNObnT8oI0=;
 b=DaTQtZ4K0mXhGroRAaQfXYyUvLIeu8A8+dNGxvJwfhwAIIkCVgU50INOCCsLKltx8o
 wwEtVNksASxSu5cHPa2hqa9J84Pns9jYH66hNkHnYv4LLxWZgENLqHp3cueGm8+fTzR6
 2Utf7lAMOiS+4X5Y4cO/2w33p04s9j8j6VAjD+r2ib/XGCJF1HFs+ahJXwNtigEGX/1O
 Vel3p6VEGOwbnQBib+p6Agn2wr6w1oJJZM8MrpHyQHKikG5Zc+HvqR5OmmnJneHurq54
 RWyPvSb/I14o3IQWoVLeN51kf6wAJsBWEDwjtdviEgIGujxL0DCL0aNh7ayThQwdtS7c
 ZiAQ==
X-Gm-Message-State: ACrzQf1zUTNqKztzBx+QrM5Bs3gQ7LJT8Sc9py/viXrP2ILKakVu5zsY
 ypjQdpxPqHTIABdME5GW2Ttgi4/O+0o7lvURZ8I=
X-Google-Smtp-Source: AMsMyM4X28AA7k3cDlrK99Q1CGmnZw9ldbxAceJJKtvP647phIffwUgzzyTBPgBpclz0SL28hf4JQG6pSN3TtvjWYpw=
X-Received: by 2002:a05:6902:44:b0:6af:f412:cfb7 with SMTP id
 m4-20020a056902004400b006aff412cfb7mr7825154ybh.366.1663424831700; Sat, 17
 Sep 2022 07:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220913191321.96747-1-deller@gmx.de>
In-Reply-To: <20220913191321.96747-1-deller@gmx.de>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sat, 17 Sep 2022 10:26:59 -0400
Message-ID: <CAJSP0QWfUhRVhRJ7og1ntfbrjdpcuU31xRnUNWTOBhshpP8cTQ@mail.gmail.com>
Subject: Re: [PULL 00/12] linux-user patches
To: Helge Deller <deller@gmx.de>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb31.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The close_range(2) man page says:
close_range() first appeared in Linux 5.9.  Library support was added
in glibc in version 2.34.

The qemu-user GitLab CI jobs are failing. For example, see
https://gitlab.com/qemu-project/qemu/-/jobs/3043629417:

../linux-user/syscall.c:8734:26: error: implicit declaration of
function 'close_range' is invalid in C99
[-Werror,-Wimplicit-function-declaration]
return get_errno(close_range(arg1, arg2, arg3));
                           ^

There is a second issue with this pull request:
../linux-user/syscall.c:357:16: error: =E2=80=98pidfd_getfd=E2=80=99 define=
d but not
used [-Werror=3Dunused-function]
357 | _syscall3(int, pidfd_getfd, int, pidfd, int, targetfd, unsigned
int, flags);
       | ^~~~~~~~~~~
../linux-user/syscall.c:251:13: note: in definition of macro =E2=80=98_sysc=
all3=E2=80=99

See https://gitlab.com/qemu-project/qemu/-/jobs/3043629434.

Stefan

