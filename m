Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74992EBD8F
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 13:17:50 +0100 (CET)
Received: from localhost ([::1]:35588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx7l7-00055f-Bd
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 07:17:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1kx7Sn-0001op-VB
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 06:58:53 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:51267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1kx7Sm-0007Z5-7j
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 06:58:53 -0500
Received: by mail-wm1-x333.google.com with SMTP id v14so2225867wml.1
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 03:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:references:from:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=nFEguSUCpJ4ghgyGOEVEz4GjUb/jNICy2kAqoPFLIAQ=;
 b=1d0IWBHr1B/+DhDnbLKJkZuYjuyPdj/EP+UaHUpQ/sQaswqlSJmtPB8WSvBDkKliNV
 NgZBhLRRB7tnRoDQPg1efceaHMrGQuz062AKtGN+LpGF/ZGFUzKLDF2tkopEd1IvX/v7
 g+JvJ1BiHrKHEzv2jkQF0tYm73M4A76aqRlhQYvwxtb+agSdSuT87+xWy03uIPai0h/C
 s8zd0uKxrwnKfdmDuamtMAKMWUi+kQZdam6UH71qqXhIC2fcu1OfcmOYe+FL1n424o8G
 +aPmPg4bPW77XR0pHm52qRZ/2QCr1AHLbiFZ2FqV12R9EkaSzF7ftm1VGUD6soV3u4/p
 d6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:references:from:date:in-reply-to
 :message-id:user-agent:mime-version:content-transfer-encoding;
 bh=nFEguSUCpJ4ghgyGOEVEz4GjUb/jNICy2kAqoPFLIAQ=;
 b=twUwh8rWHzio94haHQBsJaXYWYkIyiH4r6huVc/d28T2wRZF8YTGdA7tfaq02SN9oV
 XghkeI80V5+k50So+AhxYcSxuTszWV3yAmM+0JMjULdscyA86JOJEOKi9TPRDnAl+lr9
 ox62mOSiKl4zlw3Br2hJSM5wFZcWV6WXvZNnLUZ+zzUJtXUDlBK1qX0BajRr5IqdgGLw
 7BPDIYMdHtb11VGQrN2VScDrG+ZlFFR0UK96/MmaMvP9qDKyLKY9NXAI4pq44pqAKmGd
 okltBmcfDIIsaRXCmunx51Y4I8kBjFcgtkw+GtZT5jYticPgWvfxReG4Oq2I4DP9hxkS
 5cbg==
X-Gm-Message-State: AOAM531Aeh0n7wXijul4UaRy2aW1YRJdOarMwmyXkUAPai04dA/mb5rY
 uKJnEZBjgUl0yv3me1fBepJb3A==
X-Google-Smtp-Source: ABdhPJwEzlkUaGf/NXuk+9vyeN7t+ORGxI7FAxGhAcyxJwk28n2jJTXtnYeXwI/p1S97udKqUEH9Ig==
X-Received: by 2002:a7b:c85a:: with SMTP id c26mr3292524wml.160.1609934330270; 
 Wed, 06 Jan 2021 03:58:50 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id z6sm2812809wrw.58.2021.01.06.03.58.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 03:58:49 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 5156aa99;
 Wed, 6 Jan 2021 11:58:48 +0000 (UTC)
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v2 1/2] block: report errno when flock fcntl fails
References: <20201221134931.1194806-1-david.edmondson@oracle.com>
 <20201221134931.1194806-2-david.edmondson@oracle.com>
 <f70e8b9b-2e28-7bd8-c260-c86952eeba0a@redhat.com>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
Date: Wed, 06 Jan 2021 11:58:48 +0000
In-Reply-To: <f70e8b9b-2e28-7bd8-c260-c86952eeba0a@redhat.com> (Max Reitz's
 message of "Wed, 6 Jan 2021 10:48:09 +0100")
Message-ID: <cuny2h6jmyv.fsf@dme.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: neutral client-ip=2a00:1450:4864:20::333;
 envelope-from=dme@dme.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 06 Jan 2021 07:14:25 -0500
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
Cc: David Edmondson <david.edmondson@oracle.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2021-01-06 at 10:48:09 +01, Max Reitz wrote:

> On 21.12.20 14:49, David Edmondson wrote:
>> When a call to fcntl(2) for the purpose of manipulating file locks
>> fails, report the error returned by fcntl.
>> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
>> ---
>>   block/file-posix.c         | 20 +++++-----
>>   tests/qemu-iotests/153.out | 76 +++++++++++++++++++-------------------
>>   tests/qemu-iotests/182.out |  2 +-
>>   3 files changed, 49 insertions(+), 49 deletions(-)
>
> tests/qemu-iotests/296.out also needs to be adjusted (found by
> grepping for 'Failed to get').

I will check and add it.

> And now I might as well add this idea: EAGAIN is the most common errno
> when flock fcntl fails, so would it make sense to generate a custom
> error message then?  I=E2=80=99d like to think we could do better than
> =E2=80=9CResource temporarily unavailable=E2=80=9D, e.g. perhaps =E2=80=
=9CLock is already
> taken=E2=80=9D.

Kevin previously suggested that we should elide the detail in this
common case (please correct me if that's a misrepresentation), but there
didn't seem to be any consensus for that.

> OTOH, =E2=80=9CResource temporarily unavailable=E2=80=9D isn=E2=80=99t *t=
hat* bad, so if you
> don=E2=80=99t want to, I won=E2=80=99t push for it.

Other than that it's just more code (which in general is not good), I
don't have a strong opinion.

dme.
--=20
Facts don't do what I want them to.

