Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8D1189C6D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Mar 2020 13:56:06 +0100 (CET)
Received: from localhost ([::1]:50386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEYEv-0000V9-E6
	for lists+qemu-devel@lfdr.de; Wed, 18 Mar 2020 08:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48198)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jEYE8-0008Vn-GS
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 08:55:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jEYE7-00068F-8o
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 08:55:16 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:37288)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jEYE7-00065P-50
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 08:55:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584536114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LjWTipy0SR6QTym5ewMmxNP8mnpWhDjhbbG/fUfo5W0=;
 b=V1bmz/YW2gDhldedy37MoFehvOdQkkLy05Lq318Jml4tuB+Y4kFTNYzuxLJjlxXd4PaxfN
 I39VTP6fLGMdRDgwKc9zRN/9Ydj0EBBzBhAkaT1C0yrWhPu6Jgd76UUPGY5oIn7DwxDR9T
 AmLSImLUukwIL1wca7iL158SkYblU58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-xJthQ8nWNPqryPARdRwiEg-1; Wed, 18 Mar 2020 08:55:10 -0400
X-MC-Unique: xJthQ8nWNPqryPARdRwiEg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 964351034B20;
 Wed, 18 Mar 2020 12:55:09 +0000 (UTC)
Received: from [10.3.112.193] (ovpn-112-193.phx2.redhat.com [10.3.112.193])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1B0A9352B;
 Wed, 18 Mar 2020 12:55:08 +0000 (UTC)
Subject: Re: [PATCH] build: Silence clang warning on older glib autoptr usage
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200317175534.196295-1-eblake@redhat.com>
 <CAFEAcA8qGWhvoRwT1Wcg6RTWONG7gVSzGbhCFtG-AgQYwZHyQA@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <f2b2f264-c2ab-054f-82b5-038a7fd251dd@redhat.com>
Date: Wed, 18 Mar 2020 07:55:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8qGWhvoRwT1Wcg6RTWONG7gVSzGbhCFtG-AgQYwZHyQA@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/20 1:11 PM, Peter Maydell wrote:
> On Tue, 17 Mar 2020 at 17:55, Eric Blake <eblake@redhat.com> wrote:
>>
>> glib's G_DEFINE_AUTOPTR_CLEANUP_FUNC() macro defines several static
>> inline functions, often with some of them unused, but prior to 2.57.2
>> did not mark the functions as such.  As a result, clang (but not gcc)
>> fails to build with older glib unless -Wno-unused-function is enabled.
>>
>> Reported-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---
>>
>> Half-tested: I proved to myself that this does NOT enable
>> -Wno-unused-function on my setup of glib 2.62.5 and gcc 9.2.1 (Fedora
>> 31), but would do so if I introduced an intentional compile error into
>> the sample program; but Iwas unable to test that it would prevent the
>> build failure encountered by Peter on John's pull request (older glib
>> but exact version unknown, clang, on NetBSD).
> 
> This wasn't a NetBSD failure. I hit it on my clang-on-x86-64-Ubuntu
> setup, and also on FreeBSD. (The latter is just the tests/vm
> FreeBSD config, so you can repro that if you need to.)

Not sure where I got NetBSD from (maybe because the build failure 
happened in a file with 'nbd' in the name and I gravitated to the 'n'?). 
  But now that I've re-read your replies to the pull request, I'm glad 
to state that my mistake on reproduction platform is confined to the 
part after the ---; the commit message itself is accurate as-is.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


