Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B662A06BD
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 14:48:56 +0100 (CET)
Received: from localhost ([::1]:47870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYUlz-0007Pz-4H
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 09:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kYUkM-0006kz-TA
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 09:47:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kYUkK-00049n-GW
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 09:47:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604065630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4BUUvfKLhhkeEZX58ifRtpk7l5XynEDEHKRkFOKAClA=;
 b=J7nndi6+9xuI8Xvwgh1lIROxa3wunMy+isjD5n1hsmW8/NtthRuoYLNb2hIz4+MMt+BNBz
 cjXNOVA1ptVqB2sP8YObq177t38qsxO1ySDxttZyhL9PkbrvQTEYxf+RxlUuDrF/dIKpuB
 /6g8mRhXr6oGWGSwIRoy5NKqUuKR5TQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-oZIIrIWdOVGyDG0r6FEfwA-1; Fri, 30 Oct 2020 09:47:06 -0400
X-MC-Unique: oZIIrIWdOVGyDG0r6FEfwA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54E058F62CB;
 Fri, 30 Oct 2020 13:47:05 +0000 (UTC)
Received: from [10.10.118.238] (ovpn-118-238.rdu2.redhat.com [10.10.118.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8BB310027AB;
 Fri, 30 Oct 2020 13:47:04 +0000 (UTC)
Subject: Re: QEMU release tagging script?
To: Peter Maydell <peter.maydell@linaro.org>
References: <e8b378a2-144c-e915-3e5e-c84c9e9a17b5@redhat.com>
 <CAFEAcA8cc_C6aKkO0n=Z_b3ais6AE0VSvZD1TZweAzhocm6aTg@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <926ca0d9-840a-f850-19b1-cd22c25c0daa@redhat.com>
Date: Fri, 30 Oct 2020 09:47:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8cc_C6aKkO0n=Z_b3ais6AE0VSvZD1TZweAzhocm6aTg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 01:22:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.253, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/30/20 9:38 AM, Peter Maydell wrote:
> On Fri, 30 Oct 2020 at 13:32, John Snow <jsnow@redhat.com> wrote:
>> Is there a script that's public that you use for tagging the QEMU
>> release? I see make-release in scripts/, but that's for creating the
>> tarballs after the tagging has been done.
> 
> I use this script:
> https://git.linaro.org/people/peter.maydell/misc-scripts.git/tree/qemu-tag-release
> 

Thanks!

>> I am looking into being able to cut releases for our Python QMP library,
>> but due to constraints in the Python packaging ecosystem I have not yet
>> been able to solve, it requires its own VERSION file.
>>
>> It would be nice if when 5.2.0 is tagged that "0.5.2.0" could be written
>> into ./python/VERSION as well.
> 
> I'm pretty strongly against having the version hardcoded
> anywhere except the top level VERSION file. Everything else
> should read the information from there.
> 

Yeah, I know. I don't want to do it either, but I don't see an 
alternative that works with Python packaging tooling right now.

The problem is that whenever you run an install, (which runs a python 
"build"), the source is copied out into a temp directory where it loses 
all access to the parent directory and any knowledge of .git.

Perhaps someone has a solution, but I've not found one yet. The authors 
of pip are aware of the problem and are working on a solution, but we 
don't have one yet.

> thanks
> -- PMM
> 


