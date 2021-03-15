Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533D633BF6D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 16:10:10 +0100 (CET)
Received: from localhost ([::1]:34642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLorB-0007Gq-CP
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 11:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLopT-0006QJ-SJ
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:08:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLopR-0004r7-U8
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:08:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615820900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eD7ofPhPeKcwPF6VV13GPQp/qiby3TZONDgA6flF9p8=;
 b=clSF9bEgBSOo/v84u7JAbR+DJKbB7wDXDAqY/Fd6raDRjY4EH+AXpgZjfXPinJX5U3wfnA
 wb+ocU6+03F8p7bmcCB4CMAMPreVBQIkReZl1kDAVvCkPEJebbD7bXccWP0eWeQ1MIB9hO
 gM99XAXWjkiL6mRd6tn9/lZCFVEy774=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-OUKysA9kOTujC4fNeQ7GZw-1; Mon, 15 Mar 2021 11:08:18 -0400
X-MC-Unique: OUKysA9kOTujC4fNeQ7GZw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14C8E84B9A0;
 Mon, 15 Mar 2021 15:08:17 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3764C620DE;
 Mon, 15 Mar 2021 15:08:16 +0000 (UTC)
Subject: Re: [RFC PATCH] configure: Poison (almost) all target-specific
 #defines
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
References: <20210315135410.221729-1-thuth@redhat.com>
 <db946056-f099-ac99-38c2-60c61f079676@suse.de>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <208fab42-d276-315b-e7df-a80b4c4004e2@redhat.com>
Date: Mon, 15 Mar 2021 16:08:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <db946056-f099-ac99-38c2-60c61f079676@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/03/2021 15.07, Claudio Fontana wrote:
> On 3/15/21 2:54 PM, Thomas Huth wrote:
>> We are generating a lot of target-specific defines in the *-config-devices.h
>> and *-config-target.h files. Using them in common code is wrong and leads
>> to very subtle bugs since a "#ifdef CONFIG_SOMETHING" is not working there
>> as expected. To avoid these issues, we are already poisoning some of the
>> macros in include/exec/poison.h - but maintaining this list manually is
>> cumbersome. Thus let's generate the list of poisoned macros automatically
>> instead.
>> Note that CONFIG_TCG (which is also defined in config-host.h) and
>> CONFIG_USER_ONLY are special, so we have to filter these out.
> 
> 
> 
> I have the impression that CONFIG_USER_ONLY should be poisoned too.
> 
> A lot of the
> 
> #ifndef CONFIG_USER_ONLY
> 
> end up currently doing the wrong thing in common modules includes,
> especially due to the inverted nature of the check.

Not sure about that ... do you have an example at hand?

Anyway, one thing is sure, if we want to poison CONFIG_USER_ONLY, this will 
certainly cause a lot of clean up work first, since it is used all over the 
place...

  Thomas


