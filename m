Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45328341C01
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 13:11:47 +0100 (CET)
Received: from localhost ([::1]:50962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNDyk-0005Hh-AG
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 08:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lNDv8-0003GD-9a
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 08:08:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lNDv5-0008GB-Ki
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 08:08:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616155678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R61kaRioRXNGR5OC73E2ZwTCc68dm2Pjw/LOg5vfwIg=;
 b=bvs5gCEjeonm83LlNJgMwxDvtQa6FFdoGbsBOI8fnfZ+qL72uaTonSfNvPjALuKd6NAPj/
 vL+O9b8+vwIzPIo06UGqYYFlIjVTTq3H4p16WR9EnjJ3/ocLyruBU+yytbmXnxoU6vKdWD
 zNk1jimEDzBLqlIxDsuQGZqJReTOigw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-MKqMqFveP6acJebMSO7Nlw-1; Fri, 19 Mar 2021 08:07:57 -0400
X-MC-Unique: MKqMqFveP6acJebMSO7Nlw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D88D61009611;
 Fri, 19 Mar 2021 12:07:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E61A5D743;
 Fri, 19 Mar 2021 12:07:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BF42D11386A7; Fri, 19 Mar 2021 13:07:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: Serious doubts about Gitlab CI
References: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
 <YFOt+R77HfpNEYFc@stefanha-x1.localdomain>
 <2d1e40c6-5fa4-271f-5ecc-74da7c04ffea@redhat.com>
 <YFRv9zMvBXtpfN3t@stefanha-x1.localdomain>
 <20210319101848.ebdwkfttay73jajr@kamzik.brq.redhat.com>
Date: Fri, 19 Mar 2021 13:07:44 +0100
In-Reply-To: <20210319101848.ebdwkfttay73jajr@kamzik.brq.redhat.com> (Andrew
 Jones's message of "Fri, 19 Mar 2021 11:18:48 +0100")
Message-ID: <87v99nl52n.fsf@dusky.pond.sub.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Daniel P .
 Berrange" <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Andrew Jones <drjones@redhat.com> writes:

> On Fri, Mar 19, 2021 at 09:33:43AM +0000, Stefan Hajnoczi wrote:
>> On Thu, Mar 18, 2021 at 09:30:41PM +0100, Paolo Bonzini wrote:
>> > On 18/03/21 20:46, Stefan Hajnoczi wrote:
>> > > The QEMU Project has 50,000 minutes of GitLab CI quota. Let's enable
>> > > GitLab Merge Requests so that anyone can submit a merge request and get
>> > > CI coverage.
>> > 
>> > Each merge request consumes about 2500.  That won't last long.
>> 
>> Yikes, that is 41 hours per CI run. I wonder if GitLab's CI minutes are
>> on slow machines or if we'll hit the same issue with dedicated runners.
>> It seems like CI optimization will be necessary...
>>
>
> We need to reduce the amount of CI we do, not only because we can't afford
> it, but because it's wasteful. I hate to think of all the kWhs spent
> testing the exact same code in the exact same way, since everyone runs
> everything with a simple 'git push'.

I normally refrain from posting +1s, but I feel this message really
needs "plussing": right you are!  This kind of wastefulness has bothered
me a lot.

[...]


