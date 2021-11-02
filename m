Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F35442DB6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:21:51 +0100 (CET)
Received: from localhost ([::1]:38062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsnW-00087h-Nv
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mhs7Z-0006T1-Dx
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:38:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mhs7V-0006uA-7u
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:38:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635853103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4dyQAzH6Fns8iGi96rBDwehPDMFo4pGlkJmFdUXKfNs=;
 b=ewK31hVub6HLcRjGK3vv5J7Ki+FUo+EmAxIRBk9hafp6M8byXDQX3F86zDW4cYtCQGOt7A
 LuN9SGglAu966AB2HKpHO3bNuz2cH0x0xiFBKPbaVuiAAy9jwCkteX/T3gJSwS7eTZKNKs
 m4CXB56VqWhrXq9a91pYzQtEL6935wU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-W5XOCCpyONCmRSu-S_ZxGw-1; Tue, 02 Nov 2021 07:38:20 -0400
X-MC-Unique: W5XOCCpyONCmRSu-S_ZxGw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 989EC802682;
 Tue,  2 Nov 2021 11:38:19 +0000 (UTC)
Received: from [10.39.192.88] (unknown [10.39.192.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E17CADC9;
 Tue,  2 Nov 2021 11:38:11 +0000 (UTC)
Message-ID: <cbeb23e1-8d44-5751-4e61-a4ef46d0510a@redhat.com>
Date: Tue, 2 Nov 2021 12:38:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/4] Move CONFIG_XFS handling to meson.build
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211028185910.1729744-1-thuth@redhat.com>
 <20211028185910.1729744-4-thuth@redhat.com>
 <e02332c0-7c4e-18a2-5c33-b00e8045f6da@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <e02332c0-7c4e-18a2-5c33-b00e8045f6da@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/11/2021 12.34, Paolo Bonzini wrote:
> On 28/10/21 20:59, Thomas Huth wrote:
>> Checking for xfsctl() can be done more easily in meson.build. Also,
>> this is not a "real" feature like the other features that we provide
>> with the "--enable-xxx" and "--disable-xxx" switches for the
>> configure script, since this does not influence lots of code (it's
>> only about one call to xfsctl() in file-posix.c), so people don't
>> gain much with the ability to disable this with "--disable-xfsctl".
>> Let's rather treat this like the other cc.has_function() checks in
>> meson.build, i.e. don't add a new option for this in meson_options.txt.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> I think we should just use ioctl and copy the relevant definitions from Linux:
> 
> struct dioattr {
>          u32           d_mem;          /* data buffer memory alignment */
>          u32           d_miniosz;      /* min xfer size                */
>          u32           d_maxiosz;      /* max xfer size                */
> };
> 
> #define XFS_IOC_DIOINFO        _IOR ('X', 30, struct dioattr)

I thought about something like that, too, but I'm not sure whether xfs/xfs.h 
exists on some non-Linux systems, too and might be implemented differently 
there?

  Thomas


> 
>> ---
>>   configure   | 31 -------------------------------
>>   meson.build |  2 +-
>>   2 files changed, 1 insertion(+), 32 deletions(-)
>>
>> diff --git a/configure b/configure
>> index 170b1b237a..2296c3e194 100755
>> --- a/configure
>> +++ b/configure
>> @@ -287,7 +287,6 @@ for opt do
>>   done
>>   xen_ctrl_version="$default_feature"
>> -xfs="$default_feature"
>>   membarrier="$default_feature"
>>   vhost_kernel="$default_feature"
>>   vhost_net="$default_feature"
>> @@ -1019,10 +1018,6 @@ for opt do
>>     ;;
>>     --enable-opengl) opengl="yes"
>>     ;;
>> -  --disable-xfsctl) xfs="no"
>> -  ;;
>> -  --enable-xfsctl) xfs="yes"
>> -  ;;
>>     --disable-zlib-test)
>>     ;;
>>     --enable-guest-agent) guest_agent="yes"
>> @@ -1477,7 +1472,6 @@ cat << EOF
>>     avx512f         AVX512F optimization support
>>     replication     replication support
>>     opengl          opengl support
>> -  xfsctl          xfsctl support
>>     qom-cast-debug  cast debugging support
>>     tools           build qemu-io, qemu-nbd and qemu-img tools
>>     bochs           bochs image format support
>> @@ -2385,28 +2379,6 @@ EOF
>>       fi
>>   fi
>> -##########################################
>> -# xfsctl() probe, used for file-posix.c
>> -if test "$xfs" != "no" ; then
>> -  cat > $TMPC << EOF
>> -#include <stddef.h>  /* NULL */
>> -#include <xfs/xfs.h>
>> -int main(void)
>> -{
>> -    xfsctl(NULL, 0, 0, NULL);
>> -    return 0;
>> -}
>> -EOF
>> -  if compile_prog "" "" ; then
>> -    xfs="yes"
>> -  else
>> -    if test "$xfs" = "yes" ; then
>> -      feature_not_found "xfs" "Install xfsprogs/xfslibs devel"
>> -    fi
>> -    xfs=no
>> -  fi
>> -fi
>> -
>>   ##########################################
>>   # plugin linker support probe
>> @@ -3538,9 +3510,6 @@ echo 
>> "CONFIG_BDRV_RO_WHITELIST=$block_drv_ro_whitelist" >> $config_host_mak
>>   if test "$block_drv_whitelist_tools" = "yes" ; then
>>     echo "CONFIG_BDRV_WHITELIST_TOOLS=y" >> $config_host_mak
>>   fi
>> -if test "$xfs" = "yes" ; then
>> -  echo "CONFIG_XFS=y" >> $config_host_mak
>> -fi
>>   qemu_version=$(head $source_path/VERSION)
>>   echo "PKGVERSION=$pkgversion" >>$config_host_mak
>>   echo "SRC_PATH=$source_path" >> $config_host_mak
>> diff --git a/meson.build b/meson.build
>> index 5bb6b901b0..2bd922f2f3 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -1532,6 +1532,7 @@ config_host_data.set('CONFIG_SETNS', 
>> cc.has_function('setns') and cc.has_functio
>>   config_host_data.set('CONFIG_SYNCFS', cc.has_function('syncfs'))
>>   config_host_data.set('CONFIG_SYNC_FILE_RANGE', 
>> cc.has_function('sync_file_range'))
>>   config_host_data.set('CONFIG_TIMERFD', cc.has_function('timerfd_create'))
>> +config_host_data.set('CONFIG_XFS', cc.has_function('xfsctl', prefix: 
>> '#include <xfs/xfs.h>'))
>>   config_host_data.set('HAVE_COPY_FILE_RANGE', 
>> cc.has_function('copy_file_range'))
>>   config_host_data.set('HAVE_OPENPTY', cc.has_function('openpty', 
>> dependencies: util))
>>   config_host_data.set('HAVE_STRCHRNUL', cc.has_function('strchrnul'))
>> @@ -3415,7 +3416,6 @@ if spice_protocol.found()
>>     summary_info += {'  spice server support': spice}
>>   endif
>>   summary_info += {'rbd support':       rbd}
>> -summary_info += {'xfsctl support':    config_host.has_key('CONFIG_XFS')}
>>   summary_info += {'smartcard support': cacard}
>>   summary_info += {'U2F support':       u2f}
>>   summary_info += {'libusb':            libusb}
>>
> 


