Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9FB44E253
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 08:23:05 +0100 (CET)
Received: from localhost ([::1]:38064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlQts-0001Ug-NP
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 02:23:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mlQrz-0000gJ-RD
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 02:21:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mlQrx-0002gQ-7O
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 02:21:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636701664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=70Faajo+pxN1mnfFE3ZWgXjau8gFY3yQXcfpvR41yH0=;
 b=ReFv9gH0bH3opMc23XOQ898JZrTpgwOmcabqT29ev3G2wWxgIk1KO1np0V+UX2aa9NHBmx
 zjN2pbu9brhgPOem/WAPT2RjXxKz2EG4yxRCxNce0hNmUD0KpBQfxgarLkxIqYNKkqXBwp
 vqEt9Ky+vsqaWgV0fqVFnDhJeahY5Gk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-w6peqnXyOJ-7bo10q1Q8jw-1; Fri, 12 Nov 2021 02:21:01 -0500
X-MC-Unique: w6peqnXyOJ-7bo10q1Q8jw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DA41102C84E
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 07:21:01 +0000 (UTC)
Received: from [10.33.192.183] (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3489767842;
 Fri, 12 Nov 2021 07:21:00 +0000 (UTC)
Message-ID: <dce64fdd-5ebd-c4a2-9253-234ddc5113dc@redhat.com>
Date: Fri, 12 Nov 2021 08:20:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/5] python/aqmp: improve support for device-crash-test
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211111143719.2162525-1-jsnow@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211111143719.2162525-1-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.449, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/2021 15.37, John Snow wrote:
> When I switched machine.py over to using AQMP, I caused a regression in
> device-crash-test that caused many spurious errors to be printed during
> the test, obscuring real test failure cases.
> 
> This series fixes the vast majority of false positives, though there is
> one remaining bug in machine.py itself that would affect both
> A/QMP. Rarely, when QMP fails to accept a connection from the server,
> machine.py may enter the teardown phase quickly enough such that we do
> not yet have an exitcode from the VM process. In these cases,
> device-crash-test presumes there to be a more serious failure. That
> issue is going to take slightly longer to fix and test, so I am instead
> offering the majority of fixes now.
> 
> In the meantime, switching over to the legacy QMP module is possible by
> setting the environment variable 'QEMU_PYTHON_LEGACY_QMP' to '1' (or any
> non-empty string).
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> 
> John Snow (5):
>    python/aqmp: Fix disconnect during capabilities negotiation
>    python/aqmp: fix ConnectError string method
>    scripts/device-crash-test: simplify Exception handling
>    scripts/device-crash-test: don't emit AQMP connection errors to stdout
>    scripts/device-crash-test: hide tracebacks for QMP connect errors
> 
>   python/qemu/aqmp/protocol.py | 24 ++++++++++++++++++------
>   scripts/device-crash-test    | 33 +++++++++++++++++++++++++--------
>   2 files changed, 43 insertions(+), 14 deletions(-)

Works, for me, thank you very much!

Tested-by: Thomas Huth <thuth@redhat.com>


