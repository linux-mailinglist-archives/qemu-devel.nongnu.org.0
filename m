Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DE623EAEC
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 11:50:54 +0200 (CEST)
Received: from localhost ([::1]:45584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3z1Z-0002CB-89
	for lists+qemu-devel@lfdr.de; Fri, 07 Aug 2020 05:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k3z0W-0000vg-Tw
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 05:49:48 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:21854
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k3z0V-0004yH-77
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 05:49:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596793786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=EWHbjUrGlQeBCZpq7gwSMpkBLG2HLY9DgBeSFUk5Hhc=;
 b=BergbVfdkZ2fGReDoKP6HWwWUTCSrX1HFqBUbLJFQB1Bk9pXOSsmIV+lBW0SqrfTK9pIl5
 z4DO4nVRQr2gjxZh2WLYE4ASciDLj+mXdAl5tpGGrxxNSjfQ4DTAbBQ79u1OIPA3km0nNo
 tRm4zQX3QDqHl5RlPaJNmT0g/QIaZ7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-MyXSlj4yP-SrBzjBYETekw-1; Fri, 07 Aug 2020 05:49:44 -0400
X-MC-Unique: MyXSlj4yP-SrBzjBYETekw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E017E100AA22;
 Fri,  7 Aug 2020 09:49:43 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-31.ams2.redhat.com [10.36.113.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96045100238C;
 Fri,  7 Aug 2020 09:49:37 +0000 (UTC)
Subject: Re: [DRAFT PATCH 000/143] Meson integration for 5.2
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <1596741379-12902-1-git-send-email-pbonzini@redhat.com>
 <761b4058-7a2b-d992-2cc2-6efe654ee62e@redhat.com>
 <9c894412-b156-607e-1ea9-9e9ba14cbf1a@redhat.com>
 <6f6e9c9b-fdf6-951e-9112-3913fe44c455@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <ac18da61-6f54-b9d4-7591-e1296f9d3a32@redhat.com>
Date: Fri, 7 Aug 2020 11:49:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6f6e9c9b-fdf6-951e-9112-3913fe44c455@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/07 04:11:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, philmd@redhat.com,
 armbru@redhat.com, jsnow@redhat.com, stefanha@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/08/2020 11.45, Thomas Huth wrote:
> On 07/08/2020 11.31, Paolo Bonzini wrote:
>> On 07/08/20 10:51, Thomas Huth wrote:
>>> 2) With --meson=git added, I also do not get much further:
>>>  "./ui/meson.build:77:0: ERROR: Program 'keycodemapdb/tools/keymap-gen'
>>> not found"
>>>
>>>  https://gitlab.com/huth/qemu/-/jobs/675546229
>>>
>>> Any idea what's going wrong here?
>>
>> This is also a submodule not being initialized,
>> ui/keycodemapdb/tools/keymap-gen comes from a submodule.
> 
> Ok. I've added a hack to my configure script to checkout the submodules,
> but still, it does not compile yet:
> 
>  ../tools/virtiofsd/meson.build:1:0: ERROR: Unknown variable
> "libvhost_user".
>  https://gitlab.com/huth/qemu/-/jobs/675665455

At least the Debian container started to compile, but then fails here:

 ../hw/display/virtio-gpu.c:43:10: fatal error: virglrenderer.h: No such
file or directory
 https://gitlab.com/huth/qemu/-/jobs/675665451

 Thomas


