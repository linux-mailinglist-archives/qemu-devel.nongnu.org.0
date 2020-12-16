Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 808592DC13F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 14:29:10 +0100 (CET)
Received: from localhost ([::1]:42972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpWrd-0001UT-KY
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 08:29:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1kpWVs-0001LY-Oz
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:06:40 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1kpWVq-0001CK-1w
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 08:06:39 -0500
Received: by mail-wr1-x42f.google.com with SMTP id y17so23096314wrr.10
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 05:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version; bh=ZHFjOYnTgRPTMW3Msy/H/FXvPi/OGwNFmDtAxWJIlGE=;
 b=AWOU4eSSMC5YmmBc5XCX8JakIWKqUKW8mxkAlvDiuiS7hTmT1fDf/LWwANB7LV5LI4
 rhgB0Zfr5fQnyCNa+clUd10n5XzS5H0royl8CTXMJL7CRw59m7nnvLft7Fqx84b6q6Zi
 JqK797RgCL13anrIVD68rZ13c1iP3qf8p6ywmECSGWRkblGVDBnEKTVRxAAnLmlHwC4x
 5lUjYEwuAoIOS2XsNgDFT0Ie3spvCZkw3RI2XwNbrJJiXk3Rt9OBwjj3V5aIyvkOKkjU
 dS24MNqQJBgESaoTFKYeGC1VY7UZQH/YFJvHF3q2uw8LkufpH0Wm4NpQ7V1fgWs5OQ/8
 OheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version;
 bh=ZHFjOYnTgRPTMW3Msy/H/FXvPi/OGwNFmDtAxWJIlGE=;
 b=MyvI8o9buI3KUUQemO8+lRynBLc0DWAM1ryAbUMkhbomcgIrscFmad66kr/vcCcIok
 e8mT7uyOwanTEipw668fLv0cJ0KSNpDt1L+M84VavnpZwjXDa3eCrbPsvO2eh+3bogYw
 WU97uJI/tfyxPqFIOXgV00uR1PCGUSwZMFP7Dah52GWnxnZeDtwOAzrJwg5NQTMXGpuE
 wKTqqLEGvdAg2Uwh+a8eS5il/nH6iY5hl0O2T4zaJ3zaqlXEV58gyu/VoSh+uDmOfO9u
 zlfS9S6Jo2eeuN5cyyZXPOBaM4JldKNiy8Kijit3XO+WrQszQAeqrjAUEKVWdaBKnjsK
 3reQ==
X-Gm-Message-State: AOAM533V8t/5qgVNnPi/eUN2m8IMQQntEo5FU5HNhniGXoAlaXGrhJQd
 o7rUnKcpe42qsN4hyl1eVQZI9A==
X-Google-Smtp-Source: ABdhPJzQyv6gx6k2x05PYHCG05vCQ4O0VSgMvrEFp5ppxhvH4a80OlZKdzjOrdfVINEECQVPjFNnyg==
X-Received: by 2002:adf:d085:: with SMTP id y5mr33346493wrh.41.1608123996430; 
 Wed, 16 Dec 2020 05:06:36 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id s12sm2612369wmh.29.2020.12.16.05.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 05:06:35 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 16b0cef3;
 Wed, 16 Dec 2020 13:06:34 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] block: report errno when flock fcntl fails
In-Reply-To: <20201216115746.GC7548@merkur.fritz.box>
References: <20201215190127.1765595-1-david.edmondson@oracle.com>
 <20201216112940.GB7548@merkur.fritz.box>
 <cunwnxit1yn.fsf@zarquon.hh.sledj.net>
 <20201216115746.GC7548@merkur.fritz.box>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
Date: Wed, 16 Dec 2020 13:06:34 +0000
Message-ID: <cuntusluch1.fsf@zarquon.hh.sledj.net>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: neutral client-ip=2a00:1450:4864:20::42f;
 envelope-from=dme@dme.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2020-12-16 at 12:57:46 +01, Kevin Wolf wrote:

> Am 16.12.2020 um 12:38 hat David Edmondson geschrieben:
>> On Wednesday, 2020-12-16 at 12:29:40 +01, Kevin Wolf wrote:
>> 
>> > Am 15.12.2020 um 20:01 hat David Edmondson geschrieben:
>> >> When a call to fcntl(2) for the purpose of manipulating file locks
>> >> fails, report the error returned by fcntl.
>> >> 
>> >> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
>> >
>> > Is appending "Resource temporarily unavailable" in the common case (a
>> > file locked by another process) actually an improvement for the message
>> > or more confusing? It would be good to mention the motivation for the
>> > change in the commit message.
>> 
>> Distinguishing between the common case and others is at least a start
>> when trying to figure out why it failed. We have potentially useful
>> information to assist in diagnosis, why throw it away?
>
> I agree in principle, just when I saw the result, it felt more confusing
> than helpful. Maybe the best option would be to include the errno only
> if it's different from EAGAIN? Then the qemu-iotests reference output
> would probably stay unchanged, too.

This is a pretty low-level error report even today - unless you
understand the implementation then it doesn't shout "the file is being
shared".

Given that, I don't see any value in eliding the EAGAIN message, as I
have to know that the lack of the errno string means that it was EAGAIN,
meaning that another process holds a lock.

>> In the case I encountered the failure appears to have been caused by
>> SELinux misconfiguration.
>
> Ah, so you got EPERM?

Yes.

> It can useful information in the future, let's include it in the commit
> message.

Okay.

dme.
-- 
My girl Friday, she no square.

