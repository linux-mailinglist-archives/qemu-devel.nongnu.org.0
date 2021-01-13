Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D61D62F54A3
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 22:44:11 +0100 (CET)
Received: from localhost ([::1]:45840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kznw2-0002NX-CU
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 16:44:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kznur-0001m9-AL
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 16:42:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kznuo-00010K-Kp
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 16:42:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610574172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QKghBVHrM3lpAnbstL3EcBpMiHuwE5jSXH7yRuerylc=;
 b=SHPAUqPYYI5A1k7XibddmxcBBhi7bUslMB4U/kX2x4j4k3k2BhIJzc8ribJSGq+xK6AQmq
 z8xjzTnVnS5TTZuHRBQuZK7Y/Sw4r+dOfRCzElI63fBZ6TeqW2sZ/PA6V6roxosRs2VjSR
 SXkQJ1gYvClnj3lakQR43ZOgserg1nQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-mfFHYGriM0yXx1IR_dFePw-1; Wed, 13 Jan 2021 16:42:49 -0500
X-MC-Unique: mfFHYGriM0yXx1IR_dFePw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3ACB1922961;
 Wed, 13 Jan 2021 21:42:47 +0000 (UTC)
Received: from [10.10.120.151] (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 602BD6A254;
 Wed, 13 Jan 2021 21:42:43 +0000 (UTC)
Subject: Re: [PATCH 1/2] trace: document how to specify multiple --trace
 patterns
To: Stefan Hajnoczi <stefanha@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>
References: <20210112165859.225534-1-stefanha@redhat.com>
 <20210112165859.225534-2-stefanha@redhat.com>
 <542c6083-37ef-8a7c-7b24-f1e4f8dbff3@eik.bme.hu>
 <20210113094804.GA250553@stefanha-x1.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <f13a4aac-2d9a-9762-2664-3e3e09376f4d@redhat.com>
Date: Wed, 13 Jan 2021 16:42:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210113094804.GA250553@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/21 4:48 AM, Stefan Hajnoczi wrote:
>> QEMU options are single dash with double dash accepted for compatibility but
>> help and other docs have single dash so these (and below) should be -trace.
>> (Also a bit less typing for otherwise already way too long command lines.)
> Is this documented somewhere?
> 
> I was under the impression that '-' is legacy syntax and '--' is the
> preferred syntax. There are examples of '--' on the QEMU man page.
> 
> Let's reach agreement, document it, and then make the documentation
> consistent.
> 
> Stefan

My naive impression was that double-dash is the preferred idiom in 
linuxdom in general for any multi-character option.

We might hang on to single-dash for backwards compatibility, but I doubt 
we want to enshrine that as our preferred way.

Is there a reasoning I am unaware of?


