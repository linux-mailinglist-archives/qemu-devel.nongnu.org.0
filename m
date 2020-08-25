Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDD82511BE
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 07:52:05 +0200 (CEST)
Received: from localhost ([::1]:45334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kARsK-0000LE-Hb
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 01:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kARrT-0007a2-86
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 01:51:11 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:28203
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kARrR-00084l-D9
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 01:51:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598334668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u0cfDdbeye4qD5MxooN4jdgPpvP0o8GoajhDr+zPams=;
 b=h7UYpyAHsoazl+rGXiY3zbRrXB8Q5KMiXydrHy1SHpklo21U2NTvTz2xR2yqSYxARx4afB
 nHgZGQRY+E9u7clfD6IjFwob5R/RsfwBIfpiZAg0s9tguhKzfw37zJQeYauDLDElg3+aML
 aoKlzhutRTYujE1Exj4bYf6uhZzuJTc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-OWlVUljsNOW6wznWTFVBgg-1; Tue, 25 Aug 2020 01:51:03 -0400
X-MC-Unique: OWlVUljsNOW6wznWTFVBgg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A373380EDA3;
 Tue, 25 Aug 2020 05:51:02 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-152.ams2.redhat.com [10.36.112.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65E93100AE5B;
 Tue, 25 Aug 2020 05:51:01 +0000 (UTC)
Subject: Re: Contributor wanting to get started with simple contributions
To: Rohit Shinde <rohit.shinde12194@gmail.com>, qemu-devel@nongnu.org
References: <CA+Ai=tAypbso9yMy0jtyzbeHCweQ1FPgDaJ8=bXxFvBA6pZyLA@mail.gmail.com>
 <CA+Ai=tBJqLB7yDbd-kqzDhr+d+65K9r3DQsZrB2kGi9wF8BaiA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2d69f1ac-df97-9d70-d2e2-e9cf27cf9b0c@redhat.com>
Date: Tue, 25 Aug 2020 07:50:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CA+Ai=tBJqLB7yDbd-kqzDhr+d+65K9r3DQsZrB2kGi9wF8BaiA@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 01:35:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.956,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.25, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: jsnow@redhat.com, ehabkost@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/08/2020 04.26, Rohit Shinde wrote:
> Hey John,
> 
> I sent this email a couple of weeks ago to the qemu mailing list since I 
> didn't really know who to approach.

  Hi Rohit,

The qemu-devel mailing list is very high traffic. So I'm sorry, but you 
might need to be a little bit more specific with your questions if you 
expect an answer...

>     I have built qemu from source and I have my machine setup for
>     git-publish via email.
> 
>     I would like to start contributing with one of the bite sized tasks
>     mentioned in the wiki page. The one that interests me and which I
>     think is the easiest are the sections on "Compiler Driven Cleanup"
>     and "Dead Code Removal". I think this is a good way to get
>     introduced to the codebase.

Sure, just go ahead and have a try! Once you've successfully wrote a 
patch, please have a look at 
https://wiki.qemu.org/Contribute/SubmitAPatch how to submit it.

>     I plan to stay and become a long term contributor. Is there any CS

What does "CS" stand for?

>     theory that I would need to know other than what I mentioned above?
>     Is it possible to "learn on the go"?

You certainly have to "learn on the go", since it is likely quite 
impossible to grasp a huge project like QEMU at once.

  Cheers,
   Thomas


