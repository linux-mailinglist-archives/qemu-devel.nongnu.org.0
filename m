Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AA7398FB5
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 18:11:06 +0200 (CEST)
Received: from localhost ([::1]:55092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loTSU-0000qN-1O
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 12:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1loTRT-0008Kx-Pa
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 12:10:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1loTRP-0001ke-K4
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 12:10:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622650197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qZv/+RIYvFZtgKtAFQkFPVqR/oGPZdRqvjs0z3TykMA=;
 b=Yv70Qbd6Oky3FZPleZCf0FSgERP1Om9bzYTHQLOO8ywbrW1iq3qBjDYLFgeuRxBj2Nl6ue
 jDTqUuMpOqIQ5iaY4L972dPekNF1WnrQ5jyBNxL8Z9LDjQ9XW1j9CVvs3w56sew6lR9Is/
 VPEL8T1xp6A94zHB4jEZ/moUDtunEmM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-NbUTTDDqNsSM70gkxRaZNQ-1; Wed, 02 Jun 2021 12:09:53 -0400
X-MC-Unique: NbUTTDDqNsSM70gkxRaZNQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8D61107ACFE;
 Wed,  2 Jun 2021 16:09:52 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B6B860BE5;
 Wed,  2 Jun 2021 16:09:48 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] GitLab: Add "Bug" issue reporting template
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20210521173818.255817-1-jsnow@redhat.com>
 <20210521173818.255817-2-jsnow@redhat.com>
 <YLdN4OcxSD0fJOvD@stefanha-x1.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <e6cda390-d1ac-723c-47a4-135abb7717a5@redhat.com>
Date: Wed, 2 Jun 2021 12:09:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YLdN4OcxSD0fJOvD@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/21 5:22 AM, Stefan Hajnoczi wrote:
> On Fri, May 21, 2021 at 01:38:17PM -0400, John Snow wrote:
>> diff --git a/.gitlab/issue_templates/bug.md b/.gitlab/issue_templates/bug.md
>> new file mode 100644
>> index 00000000000..67a02a3ffcf
>> --- /dev/null
>> +++ b/.gitlab/issue_templates/bug.md
>> @@ -0,0 +1,61 @@
>> +<!--
>> +This is the upstream QEMU issue tracker.
>> +
>> +Before submitting a bug, please attempt to reproduce your problem using
>> +the latest development version of QEMU obtained from
>> +https://gitlab.com/qemu-project/qemu/.
> 
> Please be specific about what "latest development version" means. I
> guess it means qemu.git/master?
> 

I believe that's what I was asked to strongly encourage, yes. I'll make 
that clearer.

> If we are asking them to build QEMU then it would be nice to include a
> link with instructions on how to build from source.
> 

OK, good point. I am trying to keep it brief, so maybe I will point to a 
different wiki article. Some of our resources are a little too detailed, 
and I worry they won't get read at all.

We've got https://www.qemu.org/contribute/report-a-bug/ but I think it 
misses some items we want to address here. I could try to rework this 
page, or I could make a (very brief) "report a bug" wiki page instead.

Thoughts? (I am thinking I should at a minimum update the static page to 
be aware of the new tracker and these templates and help provide some 
clarifying instructions, but that more detailed steps ought to belong on 
the wiki, but am wary of link-rot if I link to subsections of a wiki 
article which could leave the static page links dangling.)

>> +
>> +QEMU generally supports the last two releases advertised via
>> +https://www.qemu.org/. Problems with distro-packaged versions of QEMU
>> +older than this should be reported to the distribution instead.
>> +
>> +See https://www.qemu.org/contribute/report-a-bug/ for guidance.
>> +-->
>> +
>> +## Host environment
>> + - Operating system: (Windows 10 21H1, Fedora 34, etc.)
>> + - OS/kernel version: (For POSIX hosts, use `uname -a`)
>> + - Architecture: (x86, ARM, s390x, etc.)
>> + - QEMU flavor: (qemu-system-x86_64, qemu-aarch64, qemu-img, etc.)
> 
> Is this necessary since we ask for the command-line below?
> 

Not strictly, IF the entire form is filled out. I had noticed some bugs 
in gitlab where reporters seem to be aware of what kind of QEMU they are 
running, but are unable to procure the command line invocation. (it is 
being launched through docker, virsh, etc.) *

It's redundant, but I am operating on the belief that the CLI may not 
always be available. I don't expect people to not file a bug because 
they can't find it.

I think of it as a prompt to get a more detailed report on the first 
try. Is it worth keeping?

*(Aside: maybe a wiki "how to report a bug" page could have a small 
section on identifying the command line arguments when QEMU is being 
launched via vmm/boxes/virsh/docker and so on.)

>> +<!--
>> +Attach logs, stack traces, screenshots, etc. Compress the files if necessary.
>> +If using libvirt, libvirt logs and XML domain information may be relevant.
>> +
>> +See https://qemu-project.gitlab.io/qemu/devel/tracing.html on how to
>> +configure additional QEMU logging.
> 
> This sentence can be removed. Tracing is mostly for developers and
> requires knowledge of the source code. People who can use tracing
> already know about it and for the rest it doesn't count as "additional
> QEMU logging" because they won't be able to use it effectively.
> 

OK, I agree. We can always provide instructions here as a follow-up if 
we deem it necessary. Fodder for a wiki page somewhere.

Thanks for looking!

--js


