Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D156275D8A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 18:36:32 +0200 (CEST)
Received: from localhost ([::1]:52974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kL7kt-0006LD-HD
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 12:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kL7gH-0002TA-EQ
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 12:31:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kL7gF-0001rt-3J
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 12:31:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600878701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fEzG8I0oQ5IwIpgPBIe7OcsfjPhb1RKyoGil2zhdpYo=;
 b=er+xeQrn+zn5nUpdPiHIB8okgQCZMFYRLy5KyV48rGSjzN8QoYfzgzdalZ94sBESPg3ThD
 e9DueBshn1EbVX6SWVyrbrRMag8f3KYeqQzYh3a/PeoJdrIhmirTvfesJXkpNQEjufanxn
 wgzWqoJZe5ce9yYUtI+cR8LngzyHk3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-K24lAob7N8iZbTWyBmzx3w-1; Wed, 23 Sep 2020 12:31:37 -0400
X-MC-Unique: K24lAob7N8iZbTWyBmzx3w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BD141868423;
 Wed, 23 Sep 2020 16:31:36 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-49.ams2.redhat.com [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8121C2C31E;
 Wed, 23 Sep 2020 16:31:35 +0000 (UTC)
Subject: Re: [PATCH] travis: remove TCI test
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20200923151030.1613449-1-pbonzini@redhat.com>
 <9f33653a-30bc-ca38-cec6-c0fbe17cbea0@redhat.com>
 <fe045d2d-022b-0a7e-8330-a2def315c16f@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <35d0b042-4f18-65b4-7b59-34eb545012db@redhat.com>
Date: Wed, 23 Sep 2020 18:31:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <fe045d2d-022b-0a7e-8330-a2def315c16f@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/09/2020 18.26, Paolo Bonzini wrote:
> On 23/09/20 18:04, Thomas Huth wrote:
>> On 23/09/2020 17.10, Paolo Bonzini wrote:
>>> The TCI test is already performed on gitlab CI, and it fails because
>>> Travis tests (generally) disable tools and therefore do not have
>>> "make check-qtest".  Just remove it.
>> Huh? Where is it failing? It currently seems to work fine:
>>
>>  https://travis-ci.org/github/qemu/qemu/jobs/729440748
>>
>> Anyway, since we already have similar job in the Gitlab-CI, I think it's
>> ok to remove it from Travis, so with the commit message tweaked:
>>
>> Acked-by: Thomas Huth <thuth@redhat.com>
>>
>>
> 
> You're right, it's only broken on my own branch (due to "meson: qtest:
> set "depends" correctly").  Currently we're running all qtests with a
> QTEST_QEMU_IMG pointing to a nonexistent executable, and I'd rather
> avoid that.  In that patch I took the big hammer, but we can also decide
> not to remove qtests for --disable-tools and add a little bit of
> complication to tests/qtest/meson.build.

I think there are only very few qtests that need one of the tools, so
I'd prefer if we could keep at least the ones enabled with
--disable-tools that do not require any of the tools.

 Thomas


