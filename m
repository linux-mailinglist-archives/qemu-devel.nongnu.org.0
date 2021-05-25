Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B9D39042F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 16:42:22 +0200 (CEST)
Received: from localhost ([::1]:41478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llYGE-0002OQ-2P
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 10:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1llYEg-0001cz-NY
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:40:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1llYEd-00078z-2a
 for qemu-devel@nongnu.org; Tue, 25 May 2021 10:40:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621953641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yl783Zp0k6d6id0SaM8eidSM/15/cfa6CdCoBBsNn2U=;
 b=daoCgMNO6R+dsIjntYoEpSrdWBSnk/TzFIICzeS84MesYsuZiOqybs8fjFfYCW205gaMre
 Co7NFs5rvuglFV+bDwTuCjsZf0GtiNo9Qoj5Xk+pfHw1/Mg6GScLB47I/orIhKJNfAStNr
 xkwDHo2a94N8g95bStfDKIrFJzTHy80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-IWy1svq6O5WhTAfdaDj_KA-1; Tue, 25 May 2021 10:40:37 -0400
X-MC-Unique: IWy1svq6O5WhTAfdaDj_KA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3313F1926DA2;
 Tue, 25 May 2021 14:40:36 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-114-230.ams2.redhat.com [10.36.114.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F1E860C13;
 Tue, 25 May 2021 14:40:34 +0000 (UTC)
To: Cornelia Huck <cohuck@redhat.com>
References: <20210525142032.156989-1-thuth@redhat.com>
 <20210525163121.6901dca2.cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] configure: Check whether we can compile the s390-ccw bios
 with -msoft-float
Message-ID: <3a4f413f-7ce5-0d78-180c-e08b351b30df@redhat.com>
Date: Tue, 25 May 2021 16:40:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210525163121.6901dca2.cohuck@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/05/2021 16.31, Cornelia Huck wrote:
> On Tue, 25 May 2021 16:20:32 +0200
> Thomas Huth <thuth@redhat.com> wrote:
> 
>> The -msoft-float switch is not available in older versions of Clang.
>> Since we rely on the compiler to not generate floating point instructions
>> unexpectedly, we block those old compilers now via a test in the configure
>> script. Note that for some weird reasons, the Clang compiler only complains
>> about the missing soft-float support if no other flags are passed via
>> "-Wl,..." to the linker. So we have to use "compile_object" instead of
>> "compile_prog" for this check.
> 
> Ugh.

It's maybe better to use compile_object for testing -msoft-float anyway 
since it could influence the way of linking against libraries (if I get 
https://reviews.llvm.org/D72189 right).

>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   configure | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/configure b/configure
>> index 676239c697..673419ff31 100755
>> --- a/configure
>> +++ b/configure
>> @@ -5462,7 +5462,7 @@ if test "$cpu" = "s390x" ; then
>>     write_c_skeleton
>>     compile_prog "-march=z900" ""
>>     has_z900=$?
>> -  if [ $has_z900 = 0 ] || compile_prog "-march=z10" ""; then
>> +  if [ $has_z900 = 0 ] || compile_object "-march=z10 -msoft-float -Werror"; then
> 
> Do you believe that we should have caught the various clang
> specialties now?

Apart from one compiler warning that just popped up today, yes. I'm seeing 
this compiler warning with Clang 12.0 now:

roms/SLOF/lib/libnet/ipv6.c:447:18: warning: variable length array folded to 
constant array as an extension [-Wgnu-folding-constant]
                 unsigned short raw[ip6size];
                                ^

... not sure what to do with that one yet.

  Thomas


