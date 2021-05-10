Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88957377C12
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 08:06:41 +0200 (CEST)
Received: from localhost ([::1]:36750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfz3w-0005Pg-DX
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 02:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lfz2j-0003xy-Gk
 for qemu-devel@nongnu.org; Mon, 10 May 2021 02:05:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lfz2b-0008DI-Mg
 for qemu-devel@nongnu.org; Mon, 10 May 2021 02:05:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620626716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/2dCpko6sjyllwBg5zZS8XYoUh3seLv4Rqklw86Cevc=;
 b=REJEE+9C/5mQeWFgPDLNyJY7UHsmPn8oxGKGa6sEDP8UP1t+dDedj/RMmGMivGwu4EL62p
 2atcXVj/MnPopfua/reM5sG+7yZH6IX6sUdKrj/ghM0qtUjfu9gDpLgeaFaxWldLesviiF
 03xViMgTysSiK+9Xh2G9Wa01TG5M8lQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-Ju6JJWFVNq2vh0diR6iaag-1; Mon, 10 May 2021 02:05:13 -0400
X-MC-Unique: Ju6JJWFVNq2vh0diR6iaag-1
Received: by mail-wr1-f72.google.com with SMTP id
 a7-20020adfc4470000b029010d875c66edso7001647wrg.23
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 23:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/2dCpko6sjyllwBg5zZS8XYoUh3seLv4Rqklw86Cevc=;
 b=SHePt0Z79wprjLJj/yIDGHZ+DcNTrU487Hlss97XeVxDtZxgI7VocZLgxJPa4Y5wSi
 p0Iqz6chTRMbMXp/sjHdwGMwW8yZUEIxLlYIfkOEZVU5g2aziMj/pJnzzi0KTeJL+k6Q
 kefmlmz1uomqYY+iM+M6SXNSf2IJlzU5tZqFiyEBWyomJXJBWFR9b1ZuCkKaC/OF8Cb/
 Rs3sZrAxQAtAAtnrvspp0TnC7iHBkGgfkmYg+dlyLStVVDPfb7gRL2JkBWNPO6dV8p62
 9Fs5t6bNvQBSgbt//5mPGi0KYLQlpxroE/WD/zzqdOESqXZwpH9KUAfPLpjxLq41TWH9
 hbTA==
X-Gm-Message-State: AOAM533AZjAhRAm6Wewguu5gI4XwsHWQnHqCWFR146DjIBrThBaGMdjM
 GWfTZSfYEWlCLAOBQIOPh8SR6hPJ8xNj1V5oZepw4O60PK9kpoYdJM5tI0CwuaONWjf+fpesW7Q
 krdMl5ykeN/D260w=
X-Received: by 2002:a1c:9817:: with SMTP id a23mr23680210wme.171.1620626712540; 
 Sun, 09 May 2021 23:05:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxou/sG9Z+IFNXAQD7nRLir8A0/YS8Ozk/22lyG7na3eX3MQCblebmq2mVm5EdV4OnV/ZWwOA==
X-Received: by 2002:a1c:9817:: with SMTP id a23mr23680174wme.171.1620626712211; 
 Sun, 09 May 2021 23:05:12 -0700 (PDT)
Received: from thuth.remote.csb (p5791d04c.dip0.t-ipconnect.de.
 [87.145.208.76])
 by smtp.gmail.com with ESMTPSA id v13sm21840942wrt.65.2021.05.09.23.05.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 May 2021 23:05:11 -0700 (PDT)
Subject: Re: [PATCH v4] Fix build with 64 bits time_t
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20201203195819.583626-1-fontaine.fabrice@gmail.com>
 <20201208134133-mutt-send-email-mst@kernel.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2cc78924-90a6-2dff-e741-9e14384a4972@redhat.com>
Date: Mon, 10 May 2021 08:05:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20201208134133-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/12/2020 19.41, Michael S. Tsirkin wrote:
> On Thu, Dec 03, 2020 at 08:58:19PM +0100, Fabrice Fontaine wrote:
>> time element is deprecated on new input_event structure in kernel's
>> input.h [1]
>>
>> This will avoid the following build failure:
>>
>> hw/input/virtio-input-host.c: In function 'virtio_input_host_handle_status':
>> hw/input/virtio-input-host.c:198:28: error: 'struct input_event' has no member named 'time'
>>    198 |     if (gettimeofday(&evdev.time, NULL)) {
>>        |                            ^
>>
>> Fixes:
>>   - http://autobuild.buildroot.org/results/a538167e288c14208d557cd45446df86d3d599d5
>>   - http://autobuild.buildroot.org/results/efd4474fb4b6c0ce0ab3838ce130429c51e43bbb
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=152194fe9c3f
>>
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> 
> Gerd pls feel free to merge.
> 
>> ---
>> Changes v3 -> v4 (after review of Gerd Hoffmann):
>>   - Include <sys/ioctl.h>
>>
>> Changes v2 -> v3 (after review of Gerd Hoffmann):
>>   - Replace include on <linux/input.h> by
>>     "standard-headers/linux/input.h" to try to fix build on rhel-7
>>
>> Changes v1 -> v2 (after review of Michael S. Tsirkin):
>>   - Drop define of input_event_{sec,usec} as it is already done in
>>     include/standard-headers/linux/input.h
>>
>>   contrib/vhost-user-input/main.c | 8 ++++++--
>>   hw/input/virtio-input-host.c    | 5 ++++-
>>   2 files changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/contrib/vhost-user-input/main.c b/contrib/vhost-user-input/main.c
>> index 6020c6f33a..b27b12733b 100644
>> --- a/contrib/vhost-user-input/main.c
>> +++ b/contrib/vhost-user-input/main.c
>> @@ -7,13 +7,14 @@
>>   #include "qemu/osdep.h"
>>   
>>   #include <glib.h>
>> -#include <linux/input.h>
>> +#include <sys/ioctl.h>
>>   
>>   #include "qemu/iov.h"
>>   #include "qemu/bswap.h"
>>   #include "qemu/sockets.h"
>>   #include "contrib/libvhost-user/libvhost-user.h"
>>   #include "contrib/libvhost-user/libvhost-user-glib.h"
>> +#include "standard-headers/linux/input.h"
>>   #include "standard-headers/linux/virtio_input.h"
>>   #include "qapi/error.h"
>>   
>> @@ -115,13 +116,16 @@ vi_evdev_watch(VuDev *dev, int condition, void *data)
>>   static void vi_handle_status(VuInput *vi, virtio_input_event *event)
>>   {
>>       struct input_event evdev;
>> +    struct timeval tval;
>>       int rc;
>>   
>> -    if (gettimeofday(&evdev.time, NULL)) {
>> +    if (gettimeofday(&tval, NULL)) {
>>           perror("vi_handle_status: gettimeofday");
>>           return;
>>       }
>>   
>> +    evdev.input_event_sec = tval.tv_sec;
>> +    evdev.input_event_usec = tval.tv_usec;
>>       evdev.type = le16toh(event->type);
>>       evdev.code = le16toh(event->code);
>>       evdev.value = le32toh(event->value);
>> diff --git a/hw/input/virtio-input-host.c b/hw/input/virtio-input-host.c
>> index 85daf73f1a..137efba57b 100644
>> --- a/hw/input/virtio-input-host.c
>> +++ b/hw/input/virtio-input-host.c
>> @@ -193,13 +193,16 @@ static void virtio_input_host_handle_status(VirtIOInput *vinput,
>>   {
>>       VirtIOInputHost *vih = VIRTIO_INPUT_HOST(vinput);
>>       struct input_event evdev;
>> +    struct timeval tval;
>>       int rc;
>>   
>> -    if (gettimeofday(&evdev.time, NULL)) {
>> +    if (gettimeofday(&tval, NULL)) {
>>           perror("virtio_input_host_handle_status: gettimeofday");
>>           return;
>>       }
>>   
>> +    evdev.input_event_sec = tval.tv_sec;
>> +    evdev.input_event_usec = tval.tv_usec;
>>       evdev.type = le16_to_cpu(event->type);
>>       evdev.code = le16_to_cpu(event->code);
>>       evdev.value = le32_to_cpu(event->value);
>> -- 
>> 2.29.2
> 
> 

Ping!

Did this fall through the cracks?

Anyway, whoever picks up this patch, please add this line to the commit message:

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/246

  Thomas


