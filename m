Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E78F1337E2A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 20:23:37 +0100 (CET)
Received: from localhost ([::1]:44628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKQuG-0004Sy-UQ
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 14:23:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lKQs1-0002XI-Qn
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 14:21:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lKQry-0006mk-1a
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 14:21:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615490471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A7OqzmrsvlNn4zSe0yzg1Ug1SozNuBJf3EhCWbEARxg=;
 b=SfFvMhlQ71yH7RUZ0EN353y74rT4rubR8snqJXysFd4akc59QpBbAXPJf2kzyNe+BOZNdj
 ej3nVTmjNOebvVT0o29TcCr6aJRGAX87Nri8qCbJdERw1vcjsBb/6XZF/To09jiaiJ82xK
 zEs6hpa1lOeMksYlJ+SWH6GaOwPr+ho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-NTJcrxJvPUqoh_zTL9B66w-1; Thu, 11 Mar 2021 14:21:08 -0500
X-MC-Unique: NTJcrxJvPUqoh_zTL9B66w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1EE28018A3;
 Thu, 11 Mar 2021 19:21:06 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA71B60BE5;
 Thu, 11 Mar 2021 19:21:06 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210309155202.1312571-1-eblake@redhat.com>
 <CAFEAcA9dSR_yvsxERtFcC1BApWMH0vqqcn1d89bgW1S_9xmYPQ@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PULL 00/17] NBD patches through 2021-03-09
Message-ID: <35c04e37-eb1d-e2dc-db3c-5e77d4181071@redhat.com>
Date: Thu, 11 Mar 2021 13:21:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9dSR_yvsxERtFcC1BApWMH0vqqcn1d89bgW1S_9xmYPQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 1:02 PM, Peter Maydell wrote:
> On Tue, 9 Mar 2021 at 16:23, Eric Blake <eblake@redhat.com> wrote:
>>
>> The following changes since commit 0436c55edf6b357ff56e2a5bf688df8636f83456:
>>
>>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-03-08 13:51:41 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-03-09
>>
>> for you to fetch changes up to 1184b411016bce7590723170aa6b5984518707ec:
>>
>>   block/qcow2: refactor qcow2_update_options_prepare error paths (2021-03-08 16:04:46 -0600)
>>
>> ----------------------------------------------------------------
>> nbd patches for 2021-03-09
>>
>> - Add Vladimir as NBD co-maintainer
>> - Fix reporting of holes in NBD_CMD_BLOCK_STATUS
>> - Improve command-line parsing accuracy of large numbers (anything going
>> through qemu_strtosz), including the deprecation of hex+suffix
>> - Improve some error reporting in the block layer
>>
>> ----------------------------------------------------------------
> 
> This broke the gitlab cross-i386-user job:
> https://gitlab.com/qemu-project/qemu/-/jobs/1090685134
> 
> ERROR:../tests/test-cutils.c:2290:test_qemu_strtosz_metric: assertion
> failed (res == 12345000): (12344999 == 12345000)

Sounds like a floating point rounding error: the string was 12.345M, but
0.345 is not an exactly-representable double (the closest 32-bit IEEE
754 float is 0.3449999988079071044921875, while nextafter() gives
0.34500002861).  Multiplying that value by 1000000.0 can then round down
in some situations instead of producing the desired 345000.0.  The
rounding is less obvious with 64-bit doubles.  I'm not sure why
cross-i386-user seems to be prone to the rounding errors while other
builds are not.

> 
> Could you have a look, please?

Yes, I'll propose a followup patch soon.  Easiest would be to relax the
test to allow the imprecision, nicer would be tweaking qemu_strtosz() to
add in a fudge factor (probably based on DBL_EPSILON from <float.h>) to
let any multiplication errors tend to overshoot rather than undershoot
when close to an integer value.

> 
> (It's in master anyway, because at the time gitlab CI was lagging
> massively and I wasn't waiting around for it to finish before merging.)
> 
> thanks
> -- PMM
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


