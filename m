Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244BE33F0A5
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 13:45:38 +0100 (CET)
Received: from localhost ([::1]:44668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMVYO-0006Cb-Rr
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 08:45:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lMVXD-0005k2-MW
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 08:44:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lMVXA-0006i1-I4
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 08:44:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615985058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fyBCjyLQi7hL3naGMKIIOcQzY+jrI4zYegZX8LWdxJs=;
 b=XJhB7VYISYewsW5kuWbZ0P9v433xRz6M9Iaa9LRiQ919Bhb2VjsBTeENv3lwQ9yaClOK6e
 nBQ4piAJUD4PFyKkttLWNiThabKHJz9vJe8q+PFeJLGwz7+cX2mRcIVjBOyeyISP372iD/
 +VLi9hiiBWg72rDe0ifXAswEItUjuu8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-x5meh8fZP0eC3nTnMy3Vhw-1; Wed, 17 Mar 2021 08:44:14 -0400
X-MC-Unique: x5meh8fZP0eC3nTnMy3Vhw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 759E0814314;
 Wed, 17 Mar 2021 12:44:09 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 811435D9DE;
 Wed, 17 Mar 2021 12:44:06 +0000 (UTC)
Subject: Re: [PATCH 2/2] cirrus.yml: Update the FreeBSD task to version 12.2
To: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>
References: <20210317110512.583747-1-thuth@redhat.com>
 <20210317110512.583747-3-thuth@redhat.com>
 <CAFEAcA89BmZ7_d73Te=DXxDNc+W4NuqXZgpoi9JwsMN0_nh6pg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <61029024-17cd-41df-a9d9-ec3323654d76@redhat.com>
Date: Wed, 17 Mar 2021 13:44:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA89BmZ7_d73Te=DXxDNc+W4NuqXZgpoi9JwsMN0_nh6pg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Ed Maste <emaste@freebsd.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/03/2021 12.16, Peter Maydell wrote:
> On Wed, 17 Mar 2021 at 11:09, Thomas Huth <thuth@redhat.com> wrote:
>>
>> FreeBSD version 12.1 is out of service now, and the task in the
>> Cirrus-CI is failing. Update to 12.2 to get it working again.
>> Unfortunately, there is a bug in libtasn1 that triggers with the
>> new version of Clang that is used there (see this thread for details:
>> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg00739.html ),
>> so we have to disable gnutls for now to make it work again. We can
>> enable it later again once libtasn1 has been fixed in FreeBSD.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> Is it feasible to make configure check for "is libtasn1 broken"?
> I guess since it only shows up as "when you try to use it
> it fails" that would be a runtime check rather than compile
> time, which isn't really possible :-(

I don't really have a clue about this crypto stuff... Daniel, Stefan, Roman, 
Christian, Eric ... you debugged the original problem on macOS, do you think 
it's possible to add a check for this libtasn1 problem to our "configure" 
(or meson.build file)?

  Thomas


