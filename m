Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 449F249E1C5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 12:58:55 +0100 (CET)
Received: from localhost ([::1]:45300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD3QU-0007yw-Bo
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 06:58:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nD32r-0006rz-Bp
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:34:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nD32p-0001Eo-Ol
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:34:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643283262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eRamBbpT311kNANsc1md2YaaDekckDODpPsktpFoI4o=;
 b=hcZCIICGe9UoK0KN/YKm4eUSq8X70mYZKou6uwgdsWbnuTPlyUsI39cvqBqIFEvPakKjvH
 IkYT/CUMWkVdIObY/a2C4pBXhiseDnz4mu/AuJmJaouWHZfvZDLknV0sO0JZ1zGDb34J8i
 xxWSN6jbOnojXlYU8uc+lliZncSSpnY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-1B5XRkiPNx2HK5VPNX03DQ-1; Thu, 27 Jan 2022 06:34:18 -0500
X-MC-Unique: 1B5XRkiPNx2HK5VPNX03DQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A66DA1091DA2;
 Thu, 27 Jan 2022 11:34:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBB8D76110;
 Thu, 27 Jan 2022 11:34:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 47842113864A; Thu, 27 Jan 2022 12:34:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: KVM call minutes for 2022-01-25
References: <87k0enrcr0.fsf@secure.mitica> <87a6fjrco3.fsf@secure.mitica>
Date: Thu, 27 Jan 2022 12:34:13 +0100
In-Reply-To: <87a6fjrco3.fsf@secure.mitica> (Juan Quintela's message of "Tue, 
 25 Jan 2022 17:41:00 +0100")
Message-ID: <87v8y5s98q.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Mirela Grujic <mirela.grujic@greensocs.com>, qemu-devel@nongnu.org,
 kvm-devel <kvm@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Juan Quintela <quintela@redhat.com> writes:

> Juan Quintela <quintela@redhat.com> wrote:
>> Hi
>>
>> Today we have the KVM devel call.  We discussed how to create machines
>> from QMP without needing to recompile QEMU.
>>
>>
>> Three different problems:
>> - startup QMP (*)
>>   not discussed today
>> - one binary or two
>>   not discussed today
>> - being able to create machines dynamically.
>>   everybody agrees that we want this. Problem is how.
>> - current greensocs approach
>> - interested for all architectures, they need a couple of them
>>
>> what greensocs have:
>> - python program that is able to read a blob that have a device tree from the blob
>> - basically the machine type is empty and is configured from there
>> - 100 machines around 400 devices models
>> - Need to do the configuration before the machine construction happens
>> - different hotplug/coldplug
>> - How to describe devices that have multiple connections

Nice demo, by the way!  I assume you're going to post patches.  Feel
free to post as RFC when the work isn't ready for merge, but could use
review, or could make our discussions more productive.

[...]


