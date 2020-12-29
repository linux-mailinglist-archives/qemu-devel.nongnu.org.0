Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 417E92E6FB1
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 11:40:02 +0100 (CET)
Received: from localhost ([::1]:57478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuCQ4-00006w-U9
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 05:40:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kuCOa-000873-26
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 05:38:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kuCOX-0000ID-9S
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 05:38:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609238301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KdrRxXV7xr6QyeSwnYjvY4hQTOEX19FGLgjsRrwJ4HE=;
 b=Aho6A+kgfSURQjZNNfs357KUGm60yZ2zKNJtj0pzlKCYhzlLiuQC51+CfCOohz/Rg+imsQ
 8dddW71QpND84TBzyGY1d0KhzW5HR1nGMmJUPEMYQOxz6+V3+cjie+CLYTYmHqJgAGkcKL
 Jbo0r9Fl5OjlkxnZVqzI1oEABCMGONs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-NTifcPg0NPGh-qqgrL2iJQ-1; Tue, 29 Dec 2020 05:38:17 -0500
X-MC-Unique: NTifcPg0NPGh-qqgrL2iJQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 463741005504;
 Tue, 29 Dec 2020 10:38:16 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-109.ams2.redhat.com [10.36.112.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB37971C8B;
 Tue, 29 Dec 2020 10:38:14 +0000 (UTC)
Subject: Re: Deprecation of the LM32 target
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <49c3d04e-a94c-cf77-4df9-5ceb8c9c7f80@physik.fu-berlin.de>
 <86690c16-3bc9-9c77-f720-64db14d0cf72@redhat.com>
 <d8bbe81c-3446-8d83-3f34-f29156cf4f01@physik.fu-berlin.de>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <559bbdfa-3876-ab22-445f-4bb59d9b4979@redhat.com>
Date: Tue, 29 Dec 2020 11:38:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <d8bbe81c-3446-8d83-3f34-f29156cf4f01@physik.fu-berlin.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.178,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.698, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Michael Walle <michael@walle.cc>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/12/2020 10.06, John Paul Adrian Glaubitz wrote:
> Hello!
> 
> On 12/26/20 9:39 AM, Thomas Huth wrote:
>> the problem is not that the target CPU is old, but rather that according to the (former?) maintainer, there are no users left:
>>
>>   https://www.mail-archive.com/qemu-devel@nongnu.org/msg605024.html
>>
>> So it got marked as deprecated in this commit here:
>>
>>   https://git.qemu.org/?p=qemu.git;a=commitdiff;h=d84980051229fa43c96b3
>>
>> Without maintainer and without users, there is no point in keeping this target, is there?
> 
> I'm not sure how you determine whether there are people using the code or not. There
> is no really user tracking in QEMU, is there?
> 
> And the maintainer's claim that RISC-V takes over makes no sense either. The point of
> emulators is to be able to run old and existing software. If a target had only a
> justification to exist while it's commercially viable, you would have to remove 90%
> of the targets in QEMU.
> 
> I mean, the whole point of an emulator is being able to run existing code on modern hardware,
> usually because the old hardware is no longer available. And as long as the target is
> functional, I don't see a point in taking away the functionality.

You also have to consider that it takes some effort to keep code up to date, 
e.g. if there is a bigger restructuring of the code base going on, you also 
have to work on neglected targets, too. If there is no active maintainer 
left anymore, it's quite a burden for all the other developers.
So if there is no known user left (are *you* using lm32?), and there is no 
active maintainer anymore, it's IMHO adequate to mark a target as 
deprecated. If someone still wants to run old lm32 code, they still can use 
older versions of QEMU to do this.

  Thomas



