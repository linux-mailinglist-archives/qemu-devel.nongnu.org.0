Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 748ED7BEC5
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 13:01:03 +0200 (CEST)
Received: from localhost ([::1]:39720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsmLu-0005Rf-34
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 07:01:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37979)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <danielhb413@gmail.com>) id 1hsmLJ-00051Z-Fo
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 07:00:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <danielhb413@gmail.com>) id 1hsmLI-00043J-8T
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 07:00:25 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:46259)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <danielhb413@gmail.com>)
 id 1hsmLI-00042P-16
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 07:00:24 -0400
Received: by mail-qt1-x842.google.com with SMTP id h21so66002175qtn.13
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 04:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=9OiGuGVfxgW84qDQvWoxVsuHs7zNTWBbiasMG81oNMM=;
 b=keS9ltW4dslPX6z3TloZE9Cm7Y8DJYc2sHo1ImTBmyD7Z5Uq/VyALWpNOePvHLNWN9
 fHHejU2Qr8RIfU2UjLJlJochrjO9eXTXp3D7RZfckksx5YYSIERyd4NKyE8OTVy6sM/z
 yB7GG2wFhL64GipgNZgEiJEp5Va+0E31sCcDIv8gUynCEUIO+g6EVNoV5bVsW9ZYFfqY
 GS/xoFipWnEvQapVsgEAt2/chgJHbtDSZ8o+V0eiI63g5062YTrUza8HApbJRAROv/Sh
 zmPIqr5NpPV/jK6Ex7CPfj4etIaIpD97qyZVXarkDMMuU4Zqg3ZOLgOFMkDvc4rROmRL
 QzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=9OiGuGVfxgW84qDQvWoxVsuHs7zNTWBbiasMG81oNMM=;
 b=Z5PsGrjouTME0j15grhzhXEXxCjV+NIBQ291/FMSaE0pQ5dWpXjpaeEIawTKH48s9A
 Rw1qTL2w1EXmq4+sNnJkmADysLGx9J2KMHMGC+tMrlKcw4XaIowJPFpo+OIzJyTaz0tR
 p3IKWHRNkv9rf4jSJyVxb4AFsXfvwZrF456sAXqpb1Lrx19tjleOagP6nRHOMIYy1f3k
 SbtXhMdC+zNijIZVLiriMu22FsjP2FcQ/QoRBOSYNkxN0VRNaXRcwl9lcpiJAOvAkvKH
 qXOmzw8nacIxJJk5Gh9bcCVDKIMWEN8+Z++72dFVn1/H3kHrz9MaRNj1PlTqzHzsfnAs
 2GNg==
X-Gm-Message-State: APjAAAVfXlw5vRBHUrVsD5n75193R7mgBXSJYRt/ORVdrdA76eTRK+J4
 +jEtU9t2mRhUh7e+QJRLn9w=
X-Google-Smtp-Source: APXvYqyGBmYYImVyyog4u8K7poCJkZ/e9vior/DiTb47ugcl3e7vzpIS4gTJKVfcY4eBTc1OZR+hog==
X-Received: by 2002:ac8:3811:: with SMTP id q17mr82696953qtb.315.1564570822617; 
 Wed, 31 Jul 2019 04:00:22 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c6:c98b:1f8e:2db4:cad6:fbb6?
 ([2804:431:c7c6:c98b:1f8e:2db4:cad6:fbb6])
 by smtp.gmail.com with ESMTPSA id o10sm33630517qti.62.2019.07.31.04.00.20
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 04:00:21 -0700 (PDT)
To: qemu-devel@nongnu.org
References: <20190628194512.21311-1-danielhb413@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <679fbb15-5015-ce4b-1ca3-87fc2eeb7fd8@gmail.com>
Date: Wed, 31 Jul 2019 08:00:16 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190628194512.21311-1-danielhb413@gmail.com>
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::842
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH v4 0/4] delete created files when
 block_crypto_co_create_opts_luks fails
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
Cc: kwolf@redhat.com, jsnow@redhat.com, berrange@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping

On 6/28/19 4:45 PM, Daniel Henrique Barboza wrote:
> Changes from previous version [1]:
> - added an extra patch including a new qemu-iotest to exercise the fix
>
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2019-03/msg07159.html
>
> Daniel Henrique Barboza (4):
>    block: introducing 'bdrv_co_delete_file' interface
>    block.c: adding bdrv_delete_file
>    crypto.c: cleanup created file when block_crypto_co_create_opts_luks
>      fails
>    qemu-iotests: adding LUKS cleanup for non-UTF8 secret error
>
>   block.c                    | 82 ++++++++++++++++++++++++++++++++++++++
>   block/crypto.c             | 31 ++++++++++++++
>   block/file-posix.c         | 28 +++++++++++++
>   include/block/block.h      |  3 ++
>   include/block/block_int.h  |  6 +++
>   tests/qemu-iotests/257     | 67 +++++++++++++++++++++++++++++++
>   tests/qemu-iotests/257.out | 11 +++++
>   tests/qemu-iotests/group   |  1 +
>   8 files changed, 229 insertions(+)
>   create mode 100755 tests/qemu-iotests/257
>   create mode 100644 tests/qemu-iotests/257.out
>

