Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0993B0424
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 14:19:57 +0200 (CEST)
Received: from localhost ([::1]:52704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvfNk-0007GI-EO
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 08:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Arseny.Krasnov@kaspersky.com>)
 id 1lvfLd-0004pW-9I
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:17:46 -0400
Received: from mx12.kaspersky-labs.com ([91.103.66.155]:18495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Arseny.Krasnov@kaspersky.com>)
 id 1lvfLb-0005nI-EE
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 08:17:45 -0400
Received: from relay12.kaspersky-labs.com (unknown [127.0.0.10])
 by relay12.kaspersky-labs.com (Postfix) with ESMTP id 5D7C075D1D;
 Tue, 22 Jun 2021 15:17:41 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaspersky.com;
 s=mail202102; t=1624364261;
 bh=Yy1xsgvDKqHmcGQx7UPswMWbCITSEJOFksTDiCaqovc=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type;
 b=X7B+oMevSKKwdg9oF2jHhOryuTustCBGF2266h3Bhg+k0TqBRu6zOgX2pfVetBZGF
 pzyLsu5zcHqTdepJhnHa4K1agSrexihUk0BASHSTIvvRn2Q7Lyz49gnptto2NSAn+O
 d6nFyzAN1kyhTfJWHOoOvySMShMRupBjeapCUfl2n5CQY3h89ZRw/I19c6rxk+suim
 bLwGYv8KcPshF1JvgZyUBRHnIFffosJ9haQh0XA67Wr7qGVlCXaxUl9U0H3AfntXAA
 sXv7so6yFMpYUjwbanh6XO1pgxk5qimK5sRLo3FodlDWdRjK3etU1GKiWclEJQHyVF
 Z2grJzd8HmDvw==
Received: from mail-hq2.kaspersky.com (unknown [91.103.66.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (Client CN "mail-hq2.kaspersky.com",
 Issuer "Kaspersky MailRelays CA G3" (verified OK))
 by mailhub12.kaspersky-labs.com (Postfix) with ESMTPS id 2958E75D5A;
 Tue, 22 Jun 2021 15:17:41 +0300 (MSK)
Received: from [10.16.171.77] (10.64.64.121) by hqmailmbx3.avp.ru
 (10.64.67.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Tue, 22
 Jun 2021 15:17:40 +0300
Subject: Re: [RFC PATCH v1] vhost-vsock: SOCK_SEQPACKET feature bit support
To: Stefano Garzarella <sgarzare@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "oxffffaa@gmail.com" <oxffffaa@gmail.com>
References: <20210621140741.2628913-1-arseny.krasnov@kaspersky.com>
 <20210622082409.cmjoor4liw4jslqt@steredhat>
From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Message-ID: <3ae7d965-549a-be7a-d1a5-9dcfb206f350@kaspersky.com>
Date: Tue, 22 Jun 2021 15:17:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210622082409.cmjoor4liw4jslqt@steredhat>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.64.64.121]
X-ClientProxiedBy: hqmailmbx3.avp.ru (10.64.67.243) To hqmailmbx3.avp.ru
 (10.64.67.243)
X-KSE-ServerInfo: hqmailmbx3.avp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 06/22/2021 11:58:58
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 164532 [Jun 22 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: arseny.krasnov@kaspersky.com
X-KSE-AntiSpam-Info: LuaCore: 448 448 71fb1b37213ce9a885768d4012c46ac449c77b17
X-KSE-AntiSpam-Info: {Tracking_phishing_log_reg_50_60}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: 127.0.0.199:7.1.2;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; kaspersky.com:7.1.1
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 06/22/2021 12:02:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 22.06.2021 10:33:00
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KLMS-Rule-ID: 52
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Status: not scanned, disabled by settings
X-KLMS-AntiSpam-Interceptor-Info: not scanned
X-KLMS-AntiPhishing: Clean, bases: 2021/06/22 08:28:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30,
 bases: 2021/06/22 05:48:00 #16781513
X-KLMS-AntiVirus-Status: Clean, skipped
Received-SPF: pass client-ip=91.103.66.155;
 envelope-from=Arseny.Krasnov@kaspersky.com; helo=mx12.kaspersky-labs.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 22.06.2021 11:24, Stefano Garzarella wrote:
> On Mon, Jun 21, 2021 at 05:07:41PM +0300, Arseny Krasnov wrote:
>> This adds processing of VIRTIO_VSOCK_F_SEQPACKET features bit. Guest
>> negotiates it with vhost, thus both will know that SOCK_SEQPACKET
>> supported by peer.
>>
>> Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>> ---
>> hw/virtio/vhost-vsock.c                       | 16 +++++++++++++++-
>> include/standard-headers/linux/virtio_vsock.h |  3 +++
>> 2 files changed, 18 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
>> index 8ddfb9abfe..fc8c143df9 100644
>> --- a/hw/virtio/vhost-vsock.c
>> +++ b/hw/virtio/vhost-vsock.c
>> @@ -108,10 +108,23 @@ static uint64_t vhost_vsock_get_features(VirtIODevice *vdev,
>>                                          uint64_t requested_features,
>>                                          Error **errp)
>> {
>> -    /* No feature bits used yet */
>> +    VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>> +
>> +    if (virtio_has_feature(vvc->vhost_dev.features, VIRTIO_VSOCK_F_SEQPACKET)) {
>> +        virtio_add_feature(&requested_features, VIRTIO_VSOCK_F_SEQPACKET);
>> +    }
>> +
> I think we can use vhost_get_features(), take a look at 
> hw/virtio/vhost-user-vsock.c

Hm, i've implemented use of 'vhost_get_features()' in the

vhost-user-vsock.c manner...

>
>
>>     return requested_features;
>> }
>>
>> +static void vhost_vsock_set_features(VirtIODevice *vdev, uint64_t features)
>> +{
>> +    VHostVSockCommon *vvc = VHOST_VSOCK_COMMON(vdev);
>> +    const VhostOps *vhost_ops = vvc->vhost_dev.vhost_ops;
>> +
>> +    vhost_ops->vhost_set_features(&vvc->vhost_dev, features);
> Maybe we can avoid vhost_vsock_set_features(), because in 
> vhost_vsock_common_start() we have this code that should do the same, 
> sice vhost_dev_start() already call vhost_set_features() with the acked 
> features:
>
>      vvc->vhost_dev.acked_features = vdev->guest_features;
>      ret = vhost_dev_start(&vvc->vhost_dev, vdev);
>
> I'm not sure if it works. Can you try simply removing 
> vhost_vsock_set_features()?
>
> Thanks,
> Stefano
Thank You, that works.
>
>> +}
>> +
>> static const VMStateDescription vmstate_virtio_vhost_vsock = {
>>     .name = "virtio-vhost_vsock",
>>     .minimum_version_id = VHOST_VSOCK_SAVEVM_VERSION,
>> @@ -224,6 +237,7 @@ static void vhost_vsock_class_init(ObjectClass *klass, void *data)
>>     vdc->realize = vhost_vsock_device_realize;
>>     vdc->unrealize = vhost_vsock_device_unrealize;
>>     vdc->get_features = vhost_vsock_get_features;
>> +    vdc->set_features = vhost_vsock_set_features;
>>     vdc->get_config = vhost_vsock_get_config;
>>     vdc->set_status = vhost_vsock_set_status;
>> }
>> diff --git a/include/standard-headers/linux/virtio_vsock.h 
>> b/include/standard-headers/linux/virtio_vsock.h
>> index be443211ce..5eac522ee2 100644
>> --- a/include/standard-headers/linux/virtio_vsock.h
>> +++ b/include/standard-headers/linux/virtio_vsock.h
>> @@ -38,6 +38,9 @@
>> #include "standard-headers/linux/virtio_ids.h"
>> #include "standard-headers/linux/virtio_config.h"
>>
>> +/* The feature bitmap for virtio vsock */
>> +#define VIRTIO_VSOCK_F_SEQPACKET       1       /* SOCK_SEQPACKET 
>> supported */
>> +
>> struct virtio_vsock_config {
>> 	uint64_t guest_cid;
>> } QEMU_PACKED;
>> -- 
>> 2.25.1
>>
>

