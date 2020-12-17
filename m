Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 372662DD1CD
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 14:06:12 +0100 (CET)
Received: from localhost ([::1]:34222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpsyx-0001Pr-7h
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 08:06:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpswq-0000rT-Ad
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:04:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpswm-0002L4-SM
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:03:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608210235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EkKdmd14drS91m6Rf0CJds3xskbRaAKRMgnld/YVI08=;
 b=V5xE9oPXs2ui8NhhVbcNAOM0qPe9Kd2Kx3Z3on0qGMxBc38Pks8eeoMnxgU4ZwthoZCvFS
 wDEGLKx7HBlu9IyhHBNcXp/z20HedHSvXW0DYwm6MpPA/nwIwKN/j9AHTljItyp+KhFQyU
 FcDPClQLl9nX2TOPFU3o41ETJKu5y6k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-lO6aAXNdMu6YkSsFNuOLLQ-1; Thu, 17 Dec 2020 08:03:51 -0500
X-MC-Unique: lO6aAXNdMu6YkSsFNuOLLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C678451081;
 Thu, 17 Dec 2020 13:03:49 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-175.ams2.redhat.com [10.36.112.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C627B5F9C8;
 Thu, 17 Dec 2020 13:03:47 +0000 (UTC)
Subject: Re: [PULL 00/12] Compile QEMU with -Wimplicit-fallthrough
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201216172949.57380-1-thuth@redhat.com>
 <CAFEAcA97zNc3yEfSeBTOuQLFghcJHbh_toJ368HMZzHke+y0SQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a6271697-c645-968a-7e0f-e1993140633b@redhat.com>
Date: Thu, 17 Dec 2020 14:03:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA97zNc3yEfSeBTOuQLFghcJHbh_toJ368HMZzHke+y0SQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Ed Maste <emaste@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Kamil Rytarowski <kamil@netbsd.org>,
 "Daniel P. Berrange" <berrange@redhat.com>, Chen Qun <kuhn.chenqun@huawei.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/12/2020 13.51, Peter Maydell wrote:
> On Wed, 16 Dec 2020 at 17:29, Thomas Huth <thuth@redhat.com> wrote:
>>
>>  Hi!
>>
>> The following changes since commit af3f37319cb1e1ca0c42842ecdbd1bcfc64a4b6f:
>>
>>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2020-12-15 21:24:31 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://gitlab.com/huth/qemu.git tags/pull-request-2020-12-16
>>
>> for you to fetch changes up to cbbedfeeb77e25b065f8a2b0c33e81403edaf728:
>>
>>   configure: Compile with -Wimplicit-fallthrough=2 (2020-12-16 12:52:20 +0100)
>>
>> ----------------------------------------------------------------
>> * Compile QEMU with -Wimplicit-fallthrough=2 to avoid bugs in
>>   switch-case statements
>> ----------------------------------------------------------------
> 
> Hi; this generates a new warning on the NetBSD build:
> 
> ../src/bsd-user/main.c: In function 'cpu_loop':
> ../src/bsd-user/main.c:513:16: warning: this statement may fall
> through [-Wimplicit-fallthrough=]
>              if (bsd_type != target_freebsd)
>                 ^
> ../src/bsd-user/main.c:515:9: note: here
>          case 0x100:
>          ^~~~

Oh man, can't we just ditch the bsd-user folder now? It's known to be broken
since many releases, so it's currently only causing additional effort to
keep this code compilable (also with regards to the automatic code scan tool
reports that we've seen during the past months), without real benefit. Even
if the BSD folks finally upstream their fixed version again, it's more
likely that they will start from scratch again instead of fixing the old
folder, I guess?

 Thomas


