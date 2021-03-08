Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE8933106C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:11:40 +0100 (CET)
Received: from localhost ([::1]:42432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGbi-0006js-Ho
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:11:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJFyP-0005fi-6q
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:31:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJFyM-0000XV-Mp
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:31:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615210257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F+fzfr711ErokS77R5xS+k2+PJzR1x5wyHA9MC4cAyQ=;
 b=Sp1sAYhD0sCJpFcCuGAuzAkkFb+A8/twO0mV+c2RurUTEMuFrldkUvjt8s06SDbXUAHEzM
 v/fpXaOc1FGe17McA/h9j4a8umW4F/DdrI2Z6vZLvN53hLFsFFi0BlhfUBX7NAyFrU3a27
 Jq10zI5CceubRze6F5BNRJDRBXTONRI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-Rz7eN8uLOJq3UkYxj-EDTg-1; Mon, 08 Mar 2021 08:30:53 -0500
X-MC-Unique: Rz7eN8uLOJq3UkYxj-EDTg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DB4A1898280;
 Mon,  8 Mar 2021 13:30:52 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-198.ams2.redhat.com [10.36.113.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD7DE10013D7;
 Mon,  8 Mar 2021 13:30:50 +0000 (UTC)
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210307155654.993-1-imp@bsdimp.com>
 <20210307155654.993-2-imp@bsdimp.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] FreeBSD: Upgrade to 12.2 release
Message-ID: <f707c609-e2ad-4b6c-985e-1218ae40e4eb@redhat.com>
Date: Mon, 8 Mar 2021 14:30:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210307155654.993-2-imp@bsdimp.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/03/2021 16.56, Warner Losh wrote:
> FreeBSD 12.1 has reached end of life. Use 12.2 instead so that FreeBSD's
> project's packages will work.  Update which timezone to pick. Work around a QEMU
> bug that incorrectly raises an exception on a CRC32 instruction with the FPU
> disabled.  The qemu bug is described here:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg784158.html
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> 
> ---
>   tests/vm/freebsd | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)

I gave this a try, but it's currently failing in the unit tests:

Running test test-crypto-tlscredsx509

** (tests/test-crypto-tlscredsx509:9999): CRITICAL **: 12:56:35.157: Failed 
to sign certificate ASN1 parser: Value is not valid.
ERROR test-crypto-tlscredsx509 - Bail out! FATAL-CRITICAL: Failed to sign 
certificate ASN1 parser: Value is not valid.
gmake: *** [Makefile.mtest:576: run-test-70] Error 1
gmake: *** Waiting for unfinished jobs....
Running test test-crypto-tlssession

** (tests/test-crypto-tlssession:10002): CRITICAL **: 12:56:35.288: Failed 
to sign certificate ASN1 parser: Value is not valid.
ERROR test-crypto-tlssession - Bail out! FATAL-CRITICAL: Failed to sign 
certificate ASN1 parser: Value is not valid.

I guess it's the same problem as:

https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg06750.html

... so this would require a bug fix in the libtasn of FreeBSD first? See:

https://gitlab.com/gnutls/libtasn1/-/merge_requests/71

  Thomas


