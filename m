Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BD4230332
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 08:45:12 +0200 (CEST)
Received: from localhost ([::1]:55606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0JMN-0007YE-9P
	for lists+qemu-devel@lfdr.de; Tue, 28 Jul 2020 02:45:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k0JL8-0006ZH-IN
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 02:43:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31843
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1k0JL6-00049E-HB
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 02:43:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595918631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=Abb1sV6jEMJUkpfOO9/utY5V6v7dkBp+SMPcJOexiM8=;
 b=T1llaNgtzwI+4cpBAb0MnRTas39Ry0+b/Ou5TDdkZDzMsmMcQ0g9JvIkpAblAbdt/yMNw7
 8PUx6BmE3oHJgE9bkbCxQaQJ+lIMebEjBHOzcC3HNFYxkcIK49yzdbBCxi4q1Stg4DQIoJ
 bTiKq/FyzaI/6b4fUXwB0pcVSqMHV9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-oGlLNaaZNeOGatG-ofR67Q-1; Tue, 28 Jul 2020 02:43:36 -0400
X-MC-Unique: oGlLNaaZNeOGatG-ofR67Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AED51005510;
 Tue, 28 Jul 2020 06:43:34 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-161.ams2.redhat.com [10.36.112.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4ED0A19D82;
 Tue, 28 Jul 2020 06:43:32 +0000 (UTC)
Subject: Re: [PATCH 2/3] cirrus.yml: Compile macOS and FreeBSD with -Werror
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200724143220.32751-1-thuth@redhat.com>
 <20200724143220.32751-3-thuth@redhat.com>
 <20200724144651.GG3146350@redhat.com>
 <506e2579-410e-8553-6cbf-508793bb35a0@redhat.com>
 <CAFEAcA9C9V_sJT15jkny+zDzZgGDpuQSkuU6XjEDp1i7J0r8CA@mail.gmail.com>
 <20200727105721.GG3400429@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <3cef33b4-2e7f-92c3-19c3-ca48309f49f0@redhat.com>
Date: Tue, 28 Jul 2020 08:43:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200727105721.GG3400429@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 23:55:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/07/2020 12.57, Daniel P. Berrangé wrote:
> On Fri, Jul 24, 2020 at 05:50:47PM +0100, Peter Maydell wrote:
>> On Fri, 24 Jul 2020 at 17:46, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>> I guess we were expecting the distrib to update the pkg.
>>
>> Apple's view is that you shouldn't be using the sasl header
>> at all but instead their proprietary crypto library APIs, so
>> I wouldn't expect them to ever ship something without the
>> deprecation warnings.
> 
> So from pov of our CI, it seems the right answer is to modify the
> cirrus.yml to install libsasl2 from homebrew:
> 
>   https://formulae.brew.sh/formula-linux/libsasl2

Ok, that one confused me for quite a while, since brew refused to find
it in the macOS jobs on Cirrus-CI. The solution: This is not a macOS
package, but a Linux package! Homebrew is apparently also available for
Linux. There is no libsasl package in homebrew for macOS.

So what to do now? I think introducing a libsasl submodule to QEMU just
for compiling this code on macOS without warnings is also overkill. And
if I got the answers here right, --disable-sasl is also disliked (since
this code likely should still be (compile-)tested on macOS).
So I think I'll go for the same trick as Peter is using for his tests
and use --extra-cflags='-Werror -Wno-error=deprecated-declarations'.

 Thomas


