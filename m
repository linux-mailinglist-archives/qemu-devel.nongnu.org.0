Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B1E340F75
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 21:59:07 +0100 (CET)
Received: from localhost ([::1]:56758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMzjW-0007y4-C7
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 16:59:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMzi7-0007SB-7Q
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 16:57:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMzi4-0007hu-Re
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 16:57:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616101054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X3KmrKy1P8oSHAJxzj/PqlnAk5JEowrTYyKUHwXn33A=;
 b=VFAbYQBQCtIxmt7Azv5ImbdwnaLyoSMpcPDTEXwRs2265qozdPLISH5FMTjp009w9eZOGF
 hpwg1Vd+dkH9mhcA288a+z+7pPmV0CRoOSOqvBxMBrq+gC+aZsUa/7nqVuULeKOfbtA5zn
 EqaVNTkDvE8pMyoRLDCFscIgXy6tOEg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-51sg8dB4M2-b92m0nX9mmA-1; Thu, 18 Mar 2021 16:57:32 -0400
X-MC-Unique: 51sg8dB4M2-b92m0nX9mmA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 429A6190A7A0;
 Thu, 18 Mar 2021 20:57:30 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3483B610F1;
 Thu, 18 Mar 2021 20:57:29 +0000 (UTC)
To: huangy81@chinatelecom.cn, qemu-devel <qemu-devel@nongnu.org>
References: <cb6856e3d397ee8f4e1acca33380fca6b4932119.1616085486.git.huangy81@chinatelecom.cn>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH] MAINTAINERS: Fix tests/migration maintainers
Message-ID: <5e561940-2da8-d6ec-f669-10bb7da88091@redhat.com>
Date: Thu, 18 Mar 2021 15:57:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <cb6856e3d397ee8f4e1acca33380fca6b4932119.1616085486.git.huangy81@chinatelecom.cn>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 11:40 AM, huangy81@chinatelecom.cn wrote:
> From: Hyman <huangy81@chinatelecom.cn>
> 
> Signed-off-by: Hyman <huangy81@chinatelecom.cn>

It looks unusual to have a single name in your authorship and S-o-b
line.  Generally, this line should represent (a version of) your legal
name, as you are making a legal claim:
https://wiki.qemu.org/Contribute/SubmitAPatch points to
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches?id=f6f94e2ab1b33f0082ac22d71f66385a60d8157f#n297
for what it represents.

Of course, if you DO regularly sign a single name as your legal name in
other contexts, don't let me stop you from doing so here as well.  And
if you want to use UTF-8 to spell your name natively, or even have a
combination of your native name and a Latinized form, that is acceptable
as well (commit 903a41d341 is an example of that approach).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


