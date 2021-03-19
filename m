Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68896341BEC
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 13:03:22 +0100 (CET)
Received: from localhost ([::1]:37244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNDqb-0007iL-9u
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 08:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lNDoe-0006tA-7K
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 08:01:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lNDob-0004dV-0Y
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 08:01:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616155275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AVrvOVZZQGDNc2XyQC6PpmCDJMY7hejr1UC3Qe0lN9I=;
 b=EVSp8q5i5lGD132zps0T5rrUXZG+A3Uxx3iauI1WqygA9pK1qGeO+ct0GW5uI7CezJJqu+
 OATeUR270qH8nbRTMBwbFZ2tGHJVzOMtCUUaso/2YZDlYF4SpO1475eRi5npAwm+/YP+gn
 nMglZzVwGhaYfsIw42s7LT+oFNqxNbw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-D_vdOh15NtW7u1uAtXXl6A-1; Fri, 19 Mar 2021 08:01:11 -0400
X-MC-Unique: D_vdOh15NtW7u1uAtXXl6A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52DCF593A5;
 Fri, 19 Mar 2021 12:01:10 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-49.ams2.redhat.com [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 665C8189A5;
 Fri, 19 Mar 2021 12:01:08 +0000 (UTC)
Subject: Re: [PATCH v2] FreeBSD: Upgrade to 12.2 release
From: Thomas Huth <thuth@redhat.com>
To: Warner Losh <imp@bsdimp.com>, Roman Bolshakov <r.bolshakov@yadro.com>
References: <20210307155654.993-1-imp@bsdimp.com>
 <20210307155654.993-2-imp@bsdimp.com>
 <f707c609-e2ad-4b6c-985e-1218ae40e4eb@redhat.com>
 <CANCZdfq+ocyZnMt2td3ynx3gWqdPm1csddTjuhAEbxV-QL3Gow@mail.gmail.com>
 <f48b0f77-02e7-fcf7-a8bd-9d7990c8db33@redhat.com>
 <E0C80BD2-323B-4101-8DC4-8A920B6CE5AB@yadro.com>
 <CANCZdfrSCCNuOjQYciZexmvYao3ZS3Ad+2bRLi8vVcyfv9kfcw@mail.gmail.com>
 <CANCZdfow0RmLFJch1Kk3JhVhKLbBC_W0_BzkZG_HX+VDo9ZLmQ@mail.gmail.com>
 <ad56d549-295f-20cf-593c-4aa677fcb19e@redhat.com>
Message-ID: <55ba912d-1310-6863-4223-87b81efaac57@redhat.com>
Date: Fri, 19 Mar 2021 13:01:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <ad56d549-295f-20cf-593c-4aa677fcb19e@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/03/2021 06.08, Thomas Huth wrote:
> On 08/03/2021 20.57, Warner Losh wrote:
>>
>>
>> On Mon, Mar 8, 2021 at 12:51 PM Warner Losh <imp@bsdimp.com 
>> <mailto:imp@bsdimp.com>> wrote:
>>
>>
>>
>>     On Mon, Mar 8, 2021 at 8:46 AM Roman Bolshakov <r.bolshakov@yadro.com
>>     <mailto:r.bolshakov@yadro.com>> wrote:
>>
>>
>>          > 8 марта 2021 г., в 18:41, Thomas Huth <thuth@redhat.com
>>         <mailto:thuth@redhat.com>> написал(а):
>>          >
>>          > ﻿On 08/03/2021 16.26, Warner Losh wrote:
>>          >> On Mon, Mar 8, 2021 at 6:30 AM Thomas Huth <thuth@redhat.com
>>         <mailto:thuth@redhat.com> <mailto:thuth@redhat.com
>>         <mailto:thuth@redhat.com>>> wrote:
>>          >>    On 07/03/2021 16.56, Warner Losh wrote:
>>          >>     > FreeBSD 12.1 has reached end of life. Use 12.2 instead so
>>         that FreeBSD's
>>          >>     > project's packages will work.  Update which timezone to
>>         pick. Work
>>          >>    around a QEMU
>>          >>     > bug that incorrectly raises an exception on a CRC32
>>         instruction with
>>          >>    the FPU
>>          >>     > disabled.  The qemu bug is described here:
>>          >>     >
>>         https://www.mail-archive.com/qemu-devel@nongnu.org/msg784158.html
>>         <https://www.mail-archive.com/qemu-devel@nongnu.org/msg784158.html>
>>          >>         
>> <https://www.mail-archive.com/qemu-devel@nongnu.org/msg784158.html
>>         <https://www.mail-archive.com/qemu-devel@nongnu.org/msg784158.html>>
>>          >>     >
>>          >>     > Signed-off-by: Warner Losh <imp@bsdimp.com
>>         <mailto:imp@bsdimp.com> <mailto:imp@bsdimp.com 
>> <mailto:imp@bsdimp.com>>>
>>          >>     >
>>          >>     > ---
>>          >>     >   tests/vm/freebsd | 14 +++++++++-----
>>          >>     >   1 file changed, 9 insertions(+), 5 deletions(-)
>>          >>    I gave this a try, but it's currently failing in the unit 
>> tests:
>>          >>    Running test test-crypto-tlscredsx509
>>          >>    ** (tests/test-crypto-tlscredsx509:9999): CRITICAL **:
>>         12:56:35.157: Failed
>>          >>    to sign certificate ASN1 parser: Value is not valid.
>>          >>    ERROR test-crypto-tlscredsx509 - Bail out! FATAL-CRITICAL:
>>         Failed to sign
>>          >>    certificate ASN1 parser: Value is not valid.
>>          >>    gmake: *** [Makefile.mtest:576: run-test-70] Error 1
>>          >>    gmake: *** Waiting for unfinished jobs....
>>          >>    Running test test-crypto-tlssession
>>          >>    ** (tests/test-crypto-tlssession:10002): CRITICAL **:
>>         12:56:35.288: Failed
>>          >>    to sign certificate ASN1 parser: Value is not valid.
>>          >>    ERROR test-crypto-tlssession - Bail out! FATAL-CRITICAL:
>>         Failed to sign
>>          >>    certificate ASN1 parser: Value is not valid.
>>          >> That's totally unrelated to my change. Was it failing before?
>>         What environment was it failing in because it all seemed to work for
>>         me...
>>          >
>>          > It's been a while since I last ran "make vm-build-freebsd", so I
>>         can't really tell whether the problem was already there before ...
>>         when I now try to run it without your patch, it fails for me, too,
>>         but rather due to FreeBSD 12.1 being out of service instead.
>>          >
>>          >>    I guess it's the same problem as:
>>          >>
>>         https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg06750.html
>>         <https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg06750.html>
>>          >>         
>> <https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg06750.html
>>         
>> <https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg06750.html>>
>>          >>    ... so this would require a bug fix in the libtasn of FreeBSD
>>         first? See:
>>          >> https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
>>         <https://gitlab.com/gnutls/libtasn1/-/merge_requests/71>
>>          >>    <https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
>>         <https://gitlab.com/gnutls/libtasn1/-/merge_requests/71>>
>>          >>  Is this on the host that built qemu, or inside the VM or where
>>         exactly?
>>          >
>>          > It's inside the VM ... I assume the libtasn there has the same
>>         bug as the one on macOS?
>>          >
>>
>>         The gnutls failures on macOS and FreeBSD (with clang as main
>>         compiler) won’t happen only if libtasn1 from master is used.
>>         Otherwise libtasn1 has to be compiled with -O1/-O0.
>>
>>
>>     Forgive my ignorance...
>>
>>     Does this come from a submodule? From something I've built and installed
>>     on my FreeBSD host? Or something that's installed into the FreeBSD guest
>>
>>
>> ah, it's inside the guest.
> 
> Yes, IIUC it's the pre-installed libtasn1 in the guest, and the problem 
> likely occurs just now since the clang that has been used to compile the 
> library has been updated, too?
> 
> Anyway, can you reproduce the issue? If so, could you please file a bug 
> ticket against libtasn1 there, so that it gets fixed? (sorry, I don't have 
> any clue about the FreeBSD process here)

For the time being, I suggest we add this hunk to your patch here to get
the VM-build going again:

diff --git a/tests/vm/freebsd b/tests/vm/freebsd
--- a/tests/vm/freebsd
+++ b/tests/vm/freebsd
@@ -46,7 +46,9 @@ class FreeBSDVM(basevm.BaseVM):
          "gettext",
  
          # libs: crypto
-        "gnutls",
+        # TODO: Enable gnutls again once FreeBSD's libtasn1 got fixed
+        # See: https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
+        # "gnutls",
  
          # libs: images
          "jpeg-turbo",

  Thomas


