Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B77D2FD107
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 14:07:56 +0100 (CET)
Received: from localhost ([::1]:41006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2DDH-0003La-JK
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 08:07:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2D5A-0006Dl-3f
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 07:59:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l2D53-0002KJ-0d
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 07:59:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611147563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DWgFIi7XSciv+eaZr+JxxS+SjKLXwLQYerktW9iZGEE=;
 b=TM6a803abFhsRd6H57cotZc0tNFO9fatZ3PCnaT7S/fJB/+KzsgedqeZwhOohXsQJtUnF9
 8No96wLsxvd7uzmGaLJcQ0LqScqikKgpUc+b+1ExwfExICCYaiAc7sJBDIBfSjwt5UCOpI
 FV5KU0ENOBacPgm1j45VAKw4t7MqiuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-0UFF1QkaOyuYFrmD11C_LA-1; Wed, 20 Jan 2021 07:59:21 -0500
X-MC-Unique: 0UFF1QkaOyuYFrmD11C_LA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D258801817
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 12:59:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C1995D6AD;
 Wed, 20 Jan 2021 12:59:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B52BF113865F; Wed, 20 Jan 2021 13:59:18 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 03/25] qemu-option: warn for short-form boolean options
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-4-pbonzini@redhat.com>
 <87o8hkx6n9.fsf@dusky.pond.sub.org>
 <99a014a0-5d9c-07d6-250a-c56e6337cf69@redhat.com>
 <878s8ovw2j.fsf@dusky.pond.sub.org>
 <06a7838d-8649-2db1-4559-2a3110eaf49a@redhat.com>
Date: Wed, 20 Jan 2021 13:59:18 +0100
In-Reply-To: <06a7838d-8649-2db1-4559-2a3110eaf49a@redhat.com> (Paolo
 Bonzini's message of "Wed, 20 Jan 2021 13:40:19 +0100")
Message-ID: <87ft2vsr15.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 20/01/21 09:42, Markus Armbruster wrote:
>> The alternative is to *outlaw* parameters "help" and "?" in QemuOpts.
>> I'd be cool with that. >
>>> My solution would be to deprecate the QMP "change vnc" command, and
>>> postpone switching -vnc to qemu_opts_parse_noisily to 6.2.
>> 
>> QMP command 'change' was deprecated long ago, in 2.5.0 (commit
>> 24fb41330, in 2015).  This predated appendix "Deprecated features"
>> (which has since become docs/system/deprecated.rst), and remained
>> missing there until I corrected it in commit 6d570ca10 (v4.2.0).
>
> Removal patch coming then, together with switching vnc_parse to 
> qemu_opts_parse_noisily.
>
> That would restrict qemu_opts_parse to tests, and implicitly outlaw 
> parameters "help" and "?".  The other problem would be solved, albeit a 
> bit indirectly.

Please remember to mention the outlaws in a commit message.

>>> The main reason to warn for short-form boolean options, is to block them
>>> for command line options that are switched to keyval[1].  Adding a
>>> warning does not necessarily imply removing in two releases.
>> 
>> Understand.
>> 
>>> [1] This series already does that for -M, -accel and -object.  This
>>> means that applying this series would change the command line
>>> incompatibly without a two-release deprecation.  It's up for discussion
>>> whether to do so, or delay the application of those patches to 6.2.  It
>>> would be a pity to hold the dependent changes for effectively a year,
>>> but it's not a big deal.
>> 
>> Concur.
>
> Verbose please. :)  Do you think we should delay the conversion of 
> -M/-accel/-object to keyval until 6.2?

I concurred with "it's up for discussion".  I'm happy do discuss, of
course.

Delaying reduces (but does not eliminate) the risk of breaking stuff
that uses the sugar.  Is that worth the loss of momentum?  Hard to say.

I think we can ignore non-boolean parameters, because if you're using
the sugar with those, you're kind of begging for some punishment :)

What are the boolean parameters, and is the *any* evidence of use with
the sugar in the wild?


