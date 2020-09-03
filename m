Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB5325BFB4
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 12:53:37 +0200 (CEST)
Received: from localhost ([::1]:57764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDms4-0008Pg-Rf
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 06:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kDmrJ-0007qY-72
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 06:52:50 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:22100
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kDmrH-0003qU-Gi
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 06:52:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599130366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jyTY4zPQx2yjhTmjWL2En7q7SC9s+AaomuVp6w9bN/I=;
 b=QaValbBog/bXmPn5C2VJk2jYanuI4IHJpnfPoJce6knOBkohgEcCt98tcDbPQn3/sAEVio
 aQ4IRc1MhgIODtS7BhyPDarMkT0OIPeaaPX3bNwX/CeG8xStCGzboGMroO3oF7mL+8FJDf
 7j9WDXvf2P/RzZD8UcAcMHalda0eg1I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-pz8un37FPW2dxYEaOt93wQ-1; Thu, 03 Sep 2020 06:52:43 -0400
X-MC-Unique: pz8un37FPW2dxYEaOt93wQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2009A107464A;
 Thu,  3 Sep 2020 10:52:42 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-90.ams2.redhat.com [10.36.112.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 666361002393;
 Thu,  3 Sep 2020 10:52:38 +0000 (UTC)
Subject: Re: [PULL v2 00/15] Cirrus-CI improvements, and other CI-related
 fixes, m68k
To: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
References: <20200902154932.390595-1-thuth@redhat.com>
 <CAFEAcA89Pjp_k5pJh26juFDO1a3M8H_s0+5cGBoZq5v7=ZYing@mail.gmail.com>
 <cd4a7bf7-c525-1aab-dab6-dcc0d22bf538@redhat.com>
 <20200903054711.q7uvc32qlchtugau@sirius.home.kraxel.org>
 <CAFEAcA_Ur-ZwVg-Y=6zbeUMOisjrXVctcEMtQqsDfSANXn_h+A@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <1439a577-b99a-c1c0-c05c-7a60907a88b3@redhat.com>
Date: Thu, 3 Sep 2020 12:52:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_Ur-ZwVg-Y=6zbeUMOisjrXVctcEMtQqsDfSANXn_h+A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 04:23:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.324, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 03/09/2020 12.48, Peter Maydell wrote:
> On Thu, 3 Sep 2020 at 06:47, Gerd Hoffmann <kraxel@redhat.com> wrote:
>>
>>   Hi,
>>
>>> Darn. I've added Gerd's patch since it is needed to fix the acceptance
>>> tests in the Gitlab-CI. Could we maybe revert the patch that introduced
>>> the regression instead, as long as no other proper fix is available? The
>>> failing CI is really bugging me.
>>
>> Well, ddcf607fa3d6 fixes another nasty issue (builds modifying the
>> source tree), so reverting that isn't really an option.
>>
>> We could have configure remove the symlink in case is present.  That way
>> old build trees with the symlink already created should work too.  Right
>> now only build trees created with ddcf607fa3d6 present are working
>> properly.
>>
>> Untested patch below.
>>
>> take care,
>>   Gerd
>>
>> diff --git a/configure b/configure
>> index b1e11397a827..493b4e86da62 100755
>> --- a/configure
>> +++ b/configure
>> @@ -8107,6 +8107,7 @@ LINKS="$LINKS .gdbinit scripts" # scripts needed by relative path in .gdbinit
>>  LINKS="$LINKS tests/acceptance tests/data"
>>  LINKS="$LINKS tests/qemu-iotests/check"
>>  LINKS="$LINKS python"
>> +UNLINK="pc-bios/keymaps"
>>  for bios_file in \
>>      $source_path/pc-bios/*.bin \
>>      $source_path/pc-bios/*.elf \
>> @@ -8127,6 +8128,11 @@ for f in $LINKS ; do
>>          symlink "$source_path/$f" "$f"
>>      fi
>>  done
>> +for f in $UNLINK ; do
>> +    if [ -L "$f" ]; then
>> +        rm -f "$f"
>> +    fi
>> +done
> 
> If this is for back-compat with old trees only we should add a
> comment that documents that in the final version of this patch.

Ok, I can try to respin my pull request with this patch and the
following comment added:

# UNLINK is used to remove symlinks from older development
# versions that might get into the way when doing "git update"
# without doing a "make distclean" in between.

Does that sound ok?

I wasn't able to reproduce the problem locally so far, so I hope it's ok
if I "abuse" your merge test for this, Peter?

 Thomas


