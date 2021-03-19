Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CF6341EAD
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:46:41 +0100 (CET)
Received: from localhost ([::1]:60984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFSa-0000zq-E0
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNFIW-0005Vm-Fc
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:36:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lNFIU-0000qe-36
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:36:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616160973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5gZ23bxfOLz/TQ5f6U+4cyG3DoMj1dl/9VWkE2xUzAQ=;
 b=giXiTNH6W2vy8xi5XEeO9JW4dPreZN5q71NKoXjxvueM86MO2YezdR+ZSfljuEuLvtH3GK
 7Rx0Hw3cSgoCZjmuiLR6Vr9N8aNUfCEc9hh2uArh0WjqOrXLxfy7KSaIEqGyQC80tAchM4
 HeyJf3nbvLAjZVWuVkTlIstbXY/Rq/8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-bHH8ndoMOqKV5GzkwYWYrg-1; Fri, 19 Mar 2021 09:36:10 -0400
X-MC-Unique: bHH8ndoMOqKV5GzkwYWYrg-1
Received: by mail-wr1-f70.google.com with SMTP id v13so21863157wrs.21
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 06:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5gZ23bxfOLz/TQ5f6U+4cyG3DoMj1dl/9VWkE2xUzAQ=;
 b=qnmbsfeC+BnYcsA1+A9o3krw5EHjF+4eHdJBIZ1NfroAi4ZMRk2JesebnZRNiDR5JD
 /oTuIr8CGMj5+Bcnzyh5Reg49qjdhqTCgNB487qi69PJZS/Kslhk/3Umlqyhsg6blq04
 N/C4F5RpHf9XfSF6uoUtjRuMIc6soaD/WkufyH8Vu6bTxr1T1cuKwVFj49Y4XgtX0g6a
 QzbTm32NXNCbmHiuKCXj4ERVAI/ytNZZR7c5dYbL+fsZENj5/rUSh2Eg5vN9tb4VmP09
 0N7Ak1OXMc55mYkTT34Z4pCFBVWrZ6nan3uuDSwTSRusiHY0Zzwi69ccp+66eRtvoIb9
 cEZw==
X-Gm-Message-State: AOAM532xSPqBSu7OPn6EItwxGYgf2sijTuDR9pO0mA17TNYZ7Kfgvr7R
 uhjBT8JDEHvEVzGNRXLDJP38B1muRkbTqbQAMC8Gtg1J4fOQWGLCTcncyDbdjCCwUSm8Y2jyk1g
 hBOIFHtMqbyGb2D4=
X-Received: by 2002:a1c:9803:: with SMTP id a3mr3744084wme.161.1616160968817; 
 Fri, 19 Mar 2021 06:36:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDgNKUxVelu6HmMaZEv98hTufKEfMsRgtFsxY1a1CAUrPyTRzbYuyZ2YuxjMJ2UxMvce5/9w==
X-Received: by 2002:a1c:9803:: with SMTP id a3mr3744066wme.161.1616160968686; 
 Fri, 19 Mar 2021 06:36:08 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id i26sm6924291wmb.18.2021.03.19.06.36.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 06:36:08 -0700 (PDT)
Subject: Re: [PATCH v2 6/6] iotests: iothreads need ioeventfd
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210319132537.2046339-1-laurent@vivier.eu>
 <20210319132537.2046339-7-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <95209fe1-9b85-0eec-ace2-b3eff20ee88e@redhat.com>
Date: Fri, 19 Mar 2021 14:36:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210319132537.2046339-7-laurent@vivier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/19/21 2:25 PM, Laurent Vivier wrote:
> And ioeventfd are only available with virtio-scsi-pci or virtio-scsi-ccw,
> use the alias but add a rule to require virtio-scsi-pci or virtio-scsi-ccw
> for the tests that use iothreads.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  tests/qemu-iotests/127        | 3 ++-
>  tests/qemu-iotests/256        | 6 ++++--
>  tests/qemu-iotests/iotests.py | 5 +++++
>  3 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qemu-iotests/127 b/tests/qemu-iotests/127
> index 98e8e82a8210..abe24861100d 100755
> --- a/tests/qemu-iotests/127
> +++ b/tests/qemu-iotests/127
> @@ -44,7 +44,8 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
>  _supported_fmt qcow2
>  _supported_proto file fuse
>  
> -_require_devices virtio-scsi scsi-hd
> +_require_devices scsi-hd
> +_require_devices virtio-scsi-pci || _require_devices virtio-scsi-ccw
>  
>  IMG_SIZE=64K
>  
> diff --git a/tests/qemu-iotests/256 b/tests/qemu-iotests/256
> index 8d82a1dd865f..13666813bd8f 100755
> --- a/tests/qemu-iotests/256
> +++ b/tests/qemu-iotests/256
> @@ -24,6 +24,8 @@ import os
>  import iotests
>  from iotests import log
>  
> +iotests._verify_virtio_scsi_pci_or_ccw()
> +
>  iotests.script_initialize(supported_fmts=['qcow2'])
>  size = 64 * 1024 * 1024
>  
> @@ -61,8 +63,8 @@ with iotests.FilePath('img0') as img0_path, \
>      log('--- Preparing images & VM ---\n')
>      vm.add_object('iothread,id=iothread0')
>      vm.add_object('iothread,id=iothread1')
> -    vm.add_device('virtio-scsi-pci,id=scsi0,iothread=iothread0')
> -    vm.add_device('virtio-scsi-pci,id=scsi1,iothread=iothread1')
> +    vm.add_device('virtio-scsi,id=scsi0,iothread=iothread0')
> +    vm.add_device('virtio-scsi,id=scsi1,iothread=iothread1')
>      iotests.qemu_img_create('-f', iotests.imgfmt, img0_path, str(size))
>      iotests.qemu_img_create('-f', iotests.imgfmt, img1_path, str(size))
>      vm.add_drive(img0_path, interface='none')
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 1e9e6a066e90..d3faf96005dd 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -1146,6 +1146,11 @@ def _verify_virtio_blk() -> None:
>      if 'virtio-blk' not in out:
>          notrun('Missing virtio-blk in QEMU binary')
>  
> +def _verify_virtio_scsi_pci_or_ccw() -> None:
> +    out = qemu_pipe('-M', 'none', '-device', 'help')
> +    if 'virtio-scsi-pci' not in out and 'virtio-scsi-ccw' not in out:

^ "and" is OK

> +        notrun('Missing virtio-scsi-pci and virtio-scsi-ccw in QEMU binary')

^ here "and" -> "or"?

> +
>  
>  def supports_quorum():
>      return 'quorum' in qemu_img_pipe('--help')
> 


