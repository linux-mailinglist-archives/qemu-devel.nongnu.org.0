Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA34F21D39E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 12:16:11 +0200 (CEST)
Received: from localhost ([::1]:40422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1juvVK-0001cT-TC
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 06:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1juvS4-0000bu-BY
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 06:12:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38973
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1juvS2-0005P9-T4
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 06:12:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594635166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=uAxo62m1nR16jGlTwnYN4kCmvtemF5584qfQve9RJBo=;
 b=CFHIEDS2rYlit8150Y3O8NVA5z4aC+UWOELds//lJPjPol9Nwjy7aSlugRBjL5k0sMsE4Z
 aVByWDG8p5KICQ83ev3zJQZowQq2IPr2XaaD7IxqQbTNiIYpkXIUmHRCFwh2yBznH3pN4J
 YAQPc4QZPprOiZEEbIGlj6aUjIIsUqs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-1fKmLxVHMg2aqm59HAX3kQ-1; Mon, 13 Jul 2020 06:12:44 -0400
X-MC-Unique: 1fKmLxVHMg2aqm59HAX3kQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C57B7100AA21;
 Mon, 13 Jul 2020 10:12:43 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-125.ams2.redhat.com [10.36.112.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E6EE5D9EF;
 Mon, 13 Jul 2020 10:12:39 +0000 (UTC)
Subject: Re: Updates on libcapstone?
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
References: <16ea7c6b-d959-9df2-0603-d07e40ff4021@redhat.com>
 <a6301171-a296-c65c-8e59-6a98a7b3f2ed@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <631b6dd6-029c-0bc8-3844-2cb5894b2224@redhat.com>
Date: Mon, 13 Jul 2020 12:12:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a6301171-a296-c65c-8e59-6a98a7b3f2ed@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 03:20:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/07/2020 21.30, Richard Henderson wrote:
> On 7/9/20 6:07 AM, Philippe Mathieu-Daudé wrote:
>> I remember you had a series related to capstone, but eventually there
>> was a problem so you postponed it until some patches were merged
>> upstream, do you remember?
> 
> I do.
> 
> My biggest problem with libcapstone is that it doesn't have an automated way to
> merge from upstream llvm, so it doesn't get any new architecture updates.
> 
> What I think we should do is drop libcapstone entirely, and use libllvm
> directly.  It's a bit more code to use, but llvm is where new architectures
> (and architecture extensions) get merged.
> 
> A mere matter of coding...

Maybe a nice topic for the next GSoC?

 Thomas


