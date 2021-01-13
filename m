Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 507302F4768
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 10:21:32 +0100 (CET)
Received: from localhost ([::1]:43536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzcLK-00036i-R7
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 04:21:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzcJh-0001zr-Bi
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 04:19:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzcJd-0005pk-VO
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 04:19:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610529583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p1r3Yy7aHCwmiTifUeIJh2JBGnmDHa8qcFM0Dn/xPkY=;
 b=Fc/AQQeaPb13gaLMpyoUDjOUBkP2ZsSpw65H4GGhs8fpMjBD4QzgLQONJo+ymsBWVBof5r
 xjcVQwzWqg2KUkW7rr2cVlxgIOrLWYgJsgf2ACNp0tZrCr53g1tueohjIg/CQMpfNp0LvB
 G0zFB+Wna60Wt2wGEglLk1fe5ypuh/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-zl0M5ckAN2iNxpEDp61VOA-1; Wed, 13 Jan 2021 04:19:40 -0500
X-MC-Unique: zl0M5ckAN2iNxpEDp61VOA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7590810766BC;
 Wed, 13 Jan 2021 09:19:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-172.ams2.redhat.com
 [10.36.112.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 41D706A908;
 Wed, 13 Jan 2021 09:19:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B1E9F11386A7; Wed, 13 Jan 2021 10:19:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: Call for Google Summer of Code 2021 project ideas
References: <CAJSP0QWWg__21otbMXAXWGD1FaHYLzZP7axZ47Unq6jtMvdfsA@mail.gmail.com>
 <92903d8d-24c4-5177-67c9-1690ea794739@redhat.com>
Date: Wed, 13 Jan 2021 10:19:34 +0100
In-Reply-To: <92903d8d-24c4-5177-67c9-1690ea794739@redhat.com> (John Snow's
 message of "Tue, 12 Jan 2021 16:10:48 -0500")
Message-ID: <87pn29kxcp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 1/11/21 6:47 AM, Stefan Hajnoczi wrote:
>> Dear QEMU, KVM, and rust-vmm community,
>> QEMU will apply for Google Summer of Code
>> (https://summerofcode.withgoogle.com/) again this year.  This internship
>> program offers paid, 10-week, remote work internships for
>> contributing to open source.  QEMU can act as an umbrella organization
>> for KVM kernel and rust-vmm projects too.
>> Please post project ideas on the QEMU wiki before February 14th:
>> https://wiki.qemu.org/Google_Summer_of_Code_2021
>> What's new this year:
>>   * The number of internship hours has been halved to 175 hours over
>>     10 weeks. Project ideas must be smaller to fit and students will have
>>     more flexibility with their working hours.
>>   * Eligibility has been expanded to include "licensed coding school or
>>     similar type of program".
>> Good project ideas are suitable for 175 hours (10 weeks half-day)
>> work by a
>> competent programmer who is not yet familiar with the codebase.  In
>> addition, they are:
>>   * Well-defined - the scope is clear
>>   * Self-contained - there are few dependencies
>>   * Uncontroversial - they are acceptable to the community
>>   * Incremental - they produce deliverables along the way
>> Feel free to post ideas even if you are unable to mentor the
>> project.
>> It doesn't hurt to share the idea!
>> 
>
> I have one that is probably way too ambitious, but requires a
> particular skillset that might be of good interest to a student that
> has some experience in the area already.
>
> The idea is for a TUI qmp-shell (maybe using urwid?) to create an
> irssi-like REPL interface for QMP. The idea would be to mimic the 
> mitmproxy TUI interface (Check it out if you haven't!)
>
> All the ideas below are extremely tentative to give a basic gist of
> what I mean; exact layouts/hotkeys/etc are for the sake of explanation
> only.
>
> Essentially, I want an interface like this:
>
> -----------------------------------------------------------
> | QMP Mode                                                |
> |=========================================================|
> |                                                         |
> | Welcome to the Qemu Machine Protocol shell.             |
> | Please type /help or Ctrl+H to see available commands.  |
> |                                                         |
> |                                                         |
> |                                                         |
> |---------------------------------------------------------|
> | >                                                       |
> -----------------------------------------------------------
>
> commands are entered in the bottom and appear in a log window above,
> appearing most-recent last, like irssi works.
>
> As an example, let's say we issue block-dirty-bitmap-add:
>
> --------------------------------------------------------
> | > block-dirty-bitmap-add node=ide0hd0 name=mybitmap0 |
> --------------------------------------------------------
>
> (...syntax up for debate...! We want something easy to parse, but easy
> to type. For structured data, that's Hard.)

"Hard" is a red flag for such a brief internship.  We need to solve or
somehow exclude this design problem before we hand the task to the
student.

[...]


