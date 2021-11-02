Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E24564428CA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 08:46:55 +0100 (CET)
Received: from localhost ([::1]:50842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhoVS-0007md-Uh
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 03:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mhoUD-00077m-WA
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 03:45:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mhoUC-0002ci-Fr
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 03:45:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635839135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jP1XRppwu1wZ8mIiAbchoWmhyNn6MBSdrDmNIrtTdtQ=;
 b=Wa7y37KdlaYlzppzow0RbvjXYziH2nrsGkI/vSj5TkXbLqImL0N153V4b5itgxuMKOHfCl
 laNJ6U3jG5LvzdTx5A2Pfx6zOWCmErTGv/mX4TNIN5bhSY48Rd6hDfL0uforcYP4dWPW90
 FADB8DE7KWo4yj5P+1QxlWe7YgK+I8s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-V8UgP1FaNFuVMkOjGFfkgA-1; Tue, 02 Nov 2021 03:45:30 -0400
X-MC-Unique: V8UgP1FaNFuVMkOjGFfkgA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A9D79126B
 for <qemu-devel@nongnu.org>; Tue,  2 Nov 2021 07:45:29 +0000 (UTC)
Received: from [10.39.192.88] (unknown [10.39.192.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 878CD60C82;
 Tue,  2 Nov 2021 07:45:25 +0000 (UTC)
Message-ID: <cf1775ed-6655-9f88-ea84-62ae912e1cc4@redhat.com>
Date: Tue, 2 Nov 2021 08:45:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] meson.build: Allow to disable OSS again
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20211029071318.1780098-1-thuth@redhat.com>
 <21ebce18-cd60-3fa9-4b0a-97acc7fbc7c2@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <21ebce18-cd60-3fa9-4b0a-97acc7fbc7c2@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.14, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 29/10/2021 11.32, Philippe Mathieu-Daudé wrote:
> On 10/29/21 09:13, Thomas Huth wrote:
>> If sys/soundcard.h is available, it is currently not possible to
>> disable OSS with the --disable-oss or --without-default-features
>> configure switches. Improve the check in meson.build to fix this.
>>
>> Fixes: 87430d5b13 ("configure, meson: move audio driver detection to Meson")
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   meson.build | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
>>   oss = not_found
>> -if not get_option('oss').auto() or have_system
>> +if get_option('oss').enabled() or (get_option('oss').auto() and have_system)
> 
> Shouldn't this be 'if have_system and (enabled or auto)' ?

It depends whether we want to allow "--disable-system --enable-oss" or not, 
I guess ;-)

Honestly, I don't have a preference. But maybe we could also simply use 'if 
have_system and not disabled' instead, which would then be the shortest 
solution?

  Thomas



