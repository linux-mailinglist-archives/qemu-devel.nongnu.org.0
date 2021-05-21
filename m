Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C276A38CA65
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 17:49:19 +0200 (CEST)
Received: from localhost ([::1]:56140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk7Oo-0007XS-SB
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 11:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lk7Me-0005ci-IV
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:47:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lk7Mc-0002Ps-LU
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:47:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621612021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mSyt58ZGN3HC/lubigVXKaC613ixJ24ZuJCe0LsAYoA=;
 b=J8+BlGiiupgPisLNYw8jRC18mlt0kgoRSP53npvw4M8v4Pb2nPkSkgFzBu6oXSjhQNut7m
 RXLrAtpS6ImVd2uL2xH6aZVykIyedijkL1XYsonCxkOy1+nZrE2IRXlUG2PK9FHa54EVln
 dSGDt4Ca1llVhG+boU9AM6qZvTUaLag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-nugN_TdEPOSNODgmVFIdWQ-1; Fri, 21 May 2021 11:46:58 -0400
X-MC-Unique: nugN_TdEPOSNODgmVFIdWQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90E81180FD60;
 Fri, 21 May 2021 15:46:57 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3EF660BD8;
 Fri, 21 May 2021 15:46:52 +0000 (UTC)
Subject: Re: [PATCH 1/2] Gitlab: Add "Bug" issue reporting template
To: Peter Krempa <pkrempa@redhat.com>
References: <20210519213202.3979359-1-jsnow@redhat.com>
 <20210519213202.3979359-2-jsnow@redhat.com> <YKYC505NAm89qslG@angien.pipo.sk>
From: John Snow <jsnow@redhat.com>
Message-ID: <4955714e-b2ba-1893-c879-f78397fe7575@redhat.com>
Date: Fri, 21 May 2021 11:46:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKYC505NAm89qslG@angien.pipo.sk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/21 2:34 AM, Peter Krempa wrote:
> On Wed, May 19, 2021 at 17:32:01 -0400, John Snow wrote:
>> Based loosely on libvirt's template, written by Peter Krempa.
>>
>> CC: Peter Krempa <pkrempa@redhat.com>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   .gitlab/issue_templates/bug.md | 52 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 52 insertions(+)
>>   create mode 100644 .gitlab/issue_templates/bug.md
>>
>> diff --git a/.gitlab/issue_templates/bug.md b/.gitlab/issue_templates/bug.md
>> new file mode 100644
>> index 00000000000..3f31b5e4a09
>> --- /dev/null
>> +++ b/.gitlab/issue_templates/bug.md
>> @@ -0,0 +1,52 @@
>> +<!--
>> +This is the upstream QEMU issue tracker.
>> +
>> +Before submitting a bug, please attempt to reproduce your problem using
>> +the latest development version of QEMU obtained from
>> +https://gitlab.com/qemu-project/qemu/.
>> +
>> +QEMU generally supports the last two releases advertised via
>> +https://www.qemu.org/. Problems with distro-packaged versions of QEMU
>> +older than this should be reported to the distribution instead.
>> +
>> +See https://www.qemu.org/contribute/report-a-bug/ for guidance.
>> +-->
>> +
>> +## Host environment
>> + - Operating system: <!-- Windows 10, Fedora 34, etc. -->
>> + - OS/kernel version: <!-- For POSIX hosts, use `uname -a` -->
>> + - Architecture: <!-- x86, ARM, etc. -->
>> + - QEMU flavor: <!-- qemu-system-x86_64, qemu-aarch64, qemu-img, etc. -->
>> + - QEMU version: <!-- `qemu-system-x86_64 --version` -->
> 
> In the libvirt templates we've refrained from mixing lines to be filled
> by users and comments. The users might fill in the required data into
> the comment and thus it would not show up in the default view.
> 

Hm, reasonable. I'll omit the comment brackets.

> 
>> + - QEMU command line:
>> +   <!--
>> +   Provide the smallest (but complete) command line that reproduces the problem.
>> +   Example:
>> +       ./qemu-system-x86_64 -M q35 -m 4096 -enable-kvm -hda fedora32.qcow2
>> +   -->
> 
> Same here, if the commandline is put into this example section it will
> not be visible unless editing the issue. I'd suggest a single-line
> comment including the comment tags ...
> 
>> +   ```
>> +   Insert command line here.
> 
> ... and put the example here to make the user edit it.
> 

OK.

>> +   ```
>> +
>> +## Emulated/Virtualized environment
>> + - Operating system: <!-- Windows 10 21H1, Fedora 34, etc. -->
>> + - OS/kernel version: <!-- For POSIX guests, use `uname -a` -->
>> + - Architecture: <!-- x86, ARM, s390x, etc. -->
>> +
>> +
>> +## Description of problem
>> +
>> +
>> +## Steps to reproduce
>> +1.
>> +2.
>> +3.
>> +
>> +
>> +## Additional information
>> +<!-- Attach logs, stack traces, screenshots, etc. Compress the files if necessary.
>> +<!-- See https://qemu-project.gitlab.io/qemu/devel/tracing.html on how to configure additional QEMU logging. -->
>> +
>> +
>> +<!-- The line below ensures that proper tags are added to the issue. Please do not remove it. -- >
>> +/label ~"kind::Bug"
> 
> Unfortunately this doesn't seem to work if the user doesn't have
> permission to tag issues, which is the default. I'm considering removing
> these in libvirt.
> 

I was afraid of that ... that sucks :(

I guess I can leave it in and it'll still help for issues filed by 
members of the project ...

> In addition, after committing these you should consider copying this
> template into the default issue template, which is set via the
> repository settings (it needs to be copied and pasted into a textarea in
> the web) as gitlab doesn't have a possibility to pick one of the
> templates as a default.
> 

Mentioned this in the cover letter, I wrote a small "Please choose a 
template" message instead, because I didn't want to have to keep repo 
data and web data I don't control in sync.


