Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDE25FB1D4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 13:49:57 +0200 (CEST)
Received: from localhost ([::1]:56752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiDlk-0004bs-EV
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 07:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@sphalerite.org>)
 id 1oiCgE-0003Ep-UY
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:40:19 -0400
Received: from sosiego.soundray.org ([2a01:4f8:c2c:a9a0::1]:36204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@sphalerite.org>)
 id 1oiCgA-000765-Mh
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:40:09 -0400
From: Linus Heckemann <git@sphalerite.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sphalerite.org;
 s=sosiego; t=1665484800;
 bh=G/h3FyH3HYbgEz0qTtmc7X57xYL95hV/YO6fUjPn4LU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date;
 b=zz1OAv2VFtBugJ7CR1V/lS03N6OOPR5BbVD/VVzwK8sUDQ/04MGICmVqN3c5PlB7d
 mqNuOTjTdl3f74ONap/F+RCy7yx23Yd2SHFAKkSq3em0br6y2W/MV4mFE9lpu7pkNg
 at6wyUcGvrACK9CaFi5ZD97SFvi+Cx2Y4nwRhPvk=
To: Alyssa Ross <hi@alyssa.is>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] docs/devel: remove incorrect claim about git send-email
In-Reply-To: <87o7vemq0c.fsf@alyssa.is>
References: <20220913165214.97241-1-git@sphalerite.org>
 <87sfkqmq2u.fsf@alyssa.is> <87o7vemq0c.fsf@alyssa.is>
Date: Tue, 11 Oct 2022 12:39:56 +0200
Message-ID: <ygay1tmej9f.fsf@localhost>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2a01:4f8:c2c:a9a0::1;
 envelope-from=git@sphalerite.org; helo=sosiego.soundray.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Alyssa Ross <hi@alyssa.is> writes:

> Alyssa Ross <hi@alyssa.is> writes:
>
>> Linus Heckemann <git@sphalerite.org> writes:
>>
>>> While it's unclear to me what git send-email actually does with the
>>> -v2 parameter (it is not documented, but also not rejected), it does
>>> not add a v2 tag to the email's subject, which is what led to the
>>> mishap in [1].
>>>
>>> [1]: https://lists.nongnu.org/archive/html/qemu-devel/2022-09/msg00679.html
>>
>> It does for me!
>>
>> Tested with:
>>
>>        git send-email -v2 --to hi@alyssa.is HEAD~
>>
>> X-Mailer: git-send-email 2.37.1
>
> I wouldn't be surprised if it only adds it when it's generating the
> patch though.  Did you perhaps run git format-patch first to generate a
> patch file, and then use git send-email to send it?

Yes! I didn't realise that git send-email can be used without the
intermediate format-patch step. I guess it's a git bug that git
send-email will silently ignore -v when used with a patch file. I'll
have a look at fixing that.

