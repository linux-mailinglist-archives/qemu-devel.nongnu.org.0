Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FB53A83CC
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:18:59 +0200 (CEST)
Received: from localhost ([::1]:48086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltAqA-0003VI-46
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ltAoK-00011r-7r
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:17:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ltAoH-0003mO-Pn
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:17:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623770221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WzDH1Z+K8IsWBWMIEDRV1jlQOQIxfwd/dt13CMncDvA=;
 b=grdh7eBFkg4RV2RRR0fYlStlJzCXoZR8l6raTSX+D+cQN/uIUkVtAb+RBZv1G+zh/MFBtD
 eGmwjSObnGVLQcST6nyKDEli7BzPacjBlDENwVYiUQ7G4KLsVRnOSf0wCMUDDK5Mi7A0I4
 wvIERjfwfZFvg2EFK6SZWBsGzPBH5PM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-N_MUK6CnMVKnImLcSrhGYg-1; Tue, 15 Jun 2021 11:16:51 -0400
X-MC-Unique: N_MUK6CnMVKnImLcSrhGYg-1
Received: by mail-ed1-f72.google.com with SMTP id
 df3-20020a05640230a3b029039179c0f290so20748311edb.13
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WzDH1Z+K8IsWBWMIEDRV1jlQOQIxfwd/dt13CMncDvA=;
 b=HvdK4GiSYlw3+6r/Ki/Wnxr+KS3TjJzlSo/v+o32Kr58G2Ukk6cIeaN7pgmPhSEUk5
 FRJZ1WMVzDyIErQEurX+/p/sQKzn4r07I2FCC5OpZrfOyydNvXrXb93g3GAKraMU0suU
 Qn5BeuXl+yrPxUy4XaEWOoTKzqk6D0g4jvTVVvacP21/ndaMUz4hHRVwwG9xDekYFWk9
 fV6AGyMjqqUQiwrck0XGo6t2n/lUn4VqJvBhL91pZti1qbpzfMJ9BxDDnkdqZISMyeAw
 DtdJK/uAkqLY/0o741Be2lutswn8DvzbUEmHDspR0HZJHmBJoKCe3fKwyRSulHJFaaRS
 rKfg==
X-Gm-Message-State: AOAM5312VFg07akwF6cXJdJAWIpuDK5vN69cUMEFTpiFzaS5HZ6q9vxJ
 b6bV3k20RWjHTUy5YCT2Cdo0XIT45RpyYqtzz7qKAKkmVP9fZWJT1F4KcsEMsoFFp3umvKEgzRa
 pL5N18kj/rFwYn/KayEMgCqox/YJKC/D+6g4dL7b4Ht2/cUl2nLmq+ErGp8s0FiLBeSk=
X-Received: by 2002:a17:906:b191:: with SMTP id w17mr61102ejy.10.1623770210584; 
 Tue, 15 Jun 2021 08:16:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpy8W/BLfed8rg3dAp80ZBIFIaxT7UwKfA8Jxd7yTIMRMRIrxd1b7lZ1tkcU2ZtPbkI7rOjA==
X-Received: by 2002:a17:906:b191:: with SMTP id w17mr61080ejy.10.1623770210347; 
 Tue, 15 Jun 2021 08:16:50 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g11sm8048421edz.12.2021.06.15.08.16.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 08:16:49 -0700 (PDT)
Subject: Re: [PATCH 15/26] meson: sort header tests
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
 <20210608112301.402434-16-pbonzini@redhat.com> <YMi9kmqPiXVZKSir@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <80f8b227-343b-3693-aed3-7f9c09bb7acc@redhat.com>
Date: Tue, 15 Jun 2021 17:16:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YMi9kmqPiXVZKSir@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/06/21 16:47, Daniel P. Berrangé wrote:
> On Tue, Jun 08, 2021 at 01:22:50PM +0200, Paolo Bonzini wrote:
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   meson.build | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/meson.build b/meson.build
>> index 28825dec18..5fdb757751 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -1258,16 +1258,17 @@ config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0]
>>   config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1])
>>   config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2])
>>   
>> +config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
>> +
>>   config_host_data.set('HAVE_BTRFS_H', cc.has_header('linux/btrfs.h'))
>>   config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
>>   config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
>> +config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
>>   config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
>>   config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
>> -config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
>> -config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
>> -config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
>>   
>>   config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
>> +config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
> 
> Was tis supposde to be sorting based on header name or cpp macro name ?
> 
> Either way, IIUC, this is in the wrong place because "HAVE_SYSTEM"
> would be before CONFIG_PREADV, and stdlib.h is before sys/uio.h

Based on macro name.  HAVE_SYSTEM_FUNCTION is sorted after CONFIG_PREADV 
among the users of has_function.  I'll explain this better in the commit 
message.

Paolo


