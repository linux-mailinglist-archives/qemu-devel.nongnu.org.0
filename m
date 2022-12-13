Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 098E464B076
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 08:37:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4zpd-0002aU-4s; Tue, 13 Dec 2022 02:36:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4zpP-0002W6-0k
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 02:35:51 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4zpK-0005tr-Ba
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 02:35:50 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so7268987wms.2
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 23:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YtcS8zSud1RIHXg6ZTxM221ENUVsd1/mjpXO5+2Hcew=;
 b=BZMkbufnzPGZt5zOpi0IhlzYRCWkxNsKf31m+eojxstZBJT7HtZAvwNnVpt096vbBZ
 WIFjmrz0ceUErxo235Dlc1Gl5OSJsTf0ow7eruioS5fo4H+50COlCNGA55IsNSU5vrwe
 eoOOmfQvJhYYZfoKPsE1MqwEtVOAtLiBkl5+5trSMfV2ZKuAC6HJOFYa2fY17z2T0GUJ
 djd4e9pCCIoSlv7v0/O2BeDpO1BBtDTBduiD6vmzcMywsANxx90INZY5grZ158nDSKGe
 Q7I8GVmAdynz87wMsL//RtPeSiAkQow7k6/zfjNT+aFVrAkd3KWl3DlcMQk8qXsC7prD
 oRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YtcS8zSud1RIHXg6ZTxM221ENUVsd1/mjpXO5+2Hcew=;
 b=dNudp25LYGnY3gIlS2bsbftvVUzvN6i148sAYxNbZc1l9TNSSF5x600U0/zV0h52Tr
 jydBKIq9tH0atVh5einkFcqIiajLCfMRxzuP90JpFIRjppstVSHoE23C5bpLjXnHittn
 cJFemYpJxE1ipzKMtBV+yu9VnaD7rOHI/fDhMIF6is3GOW4b7gz7OygtVk278GIDfPud
 X/AdvzwaBEhue2N8aQ26dNvN8TmztuY2TidwyWbaTEqz1bb4UiBKIoIQ4tbhcLEWSUKO
 XdHD4wow4SwS/QpDw0Oa9ZqB1RXAQWlxdRp5s5OJHsKEkSafNfHOWUC66uHDPSKYDMZ5
 uTBA==
X-Gm-Message-State: ANoB5pm0NCofPzaZhsz6C17Q0fyxC/uJp2h1C5bOxM+Ln0DbaqLC8EGU
 tajNrSJagRJmaheyOc22zAipdQ==
X-Google-Smtp-Source: AA0mqf6JoNpa5pnGWAQgG5nXiLOl/9RUPgqpUdZCP82hWOU9zfehEVsKLuM8Lfwj7WTa2um3EXrM4g==
X-Received: by 2002:a05:600c:3c9a:b0:3c6:c6c9:d75e with SMTP id
 bg26-20020a05600c3c9a00b003c6c6c9d75emr18306302wmb.0.1670916942782; 
 Mon, 12 Dec 2022 23:35:42 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c1-20020a05600c0a4100b003d1e3b1624dsm13302129wmq.2.2022.12.12.23.35.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 23:35:42 -0800 (PST)
Message-ID: <6aba35a8-2600-15a6-4b5b-9fbd0eec2b72@linaro.org>
Date: Tue, 13 Dec 2022 08:35:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH-for-8.0 03/10] hw/virtio: Constify
 qmp_virtio_feature_map_t[]
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>
Cc: Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20221212230517.28872-1-philmd@linaro.org>
 <20221212230517.28872-4-philmd@linaro.org>
 <09673dfc-1cc9-e5e4-97f5-9539abe92cb2@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <09673dfc-1cc9-e5e4-97f5-9539abe92cb2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 13/12/22 01:02, Richard Henderson wrote:
> On 12/12/22 17:05, Philippe Mathieu-Daudé wrote:
>> @@ -161,7 +161,7 @@ static qmp_virtio_feature_map_t 
>> vhost_user_protocol_map[] = {
>>   };
>>   /* virtio device configuration statuses */
>> -static qmp_virtio_feature_map_t virtio_config_status_map[] = {
>> +static const qmp_virtio_feature_map_t virtio_config_status_map[] = {
>>       FEATURE_ENTRY(VIRTIO_CONFIG_S_DRIVER_OK, \
>>               "VIRTIO_CONFIG_S_DRIVER_OK: Driver setup and ready"),
>>       FEATURE_ENTRY(VIRTIO_CONFIG_S_FEATURES_OK, \
>> @@ -179,7 +179,7 @@ static qmp_virtio_feature_map_t 
>> virtio_config_status_map[] = {
>>   };
>>   /* virtio-blk features mapping */
>> -qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
>> +const qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
>>       FEATURE_ENTRY(VIRTIO_BLK_F_SIZE_MAX, \
>>               "VIRTIO_BLK_F_SIZE_MAX: Max segment size is size_max"),
>>       FEATURE_ENTRY(VIRTIO_BLK_F_SEG_MAX, \
> 
> It appears all of the ones not marked static can be?

It seems some are not static to avoid "declared static but not used"
warnings due to how they are conditionally used with the
CONFIG_VIRTIO_xxx guards in qmp_decode_features():

     /* device features */
     switch (device_id) {
#ifdef CONFIG_VIRTIO_SERIAL
     case VIRTIO_ID_CONSOLE:
         features->dev_features =
             CONVERT_FEATURES(strList, virtio_serial_feature_map, 0, 
bitmap);
         break;
#endif
#ifdef CONFIG_VIRTIO_BLK
     case VIRTIO_ID_BLOCK:
         features->dev_features =
             CONVERT_FEATURES(strList, virtio_blk_feature_map, 0, bitmap);
         break;
#endif
#ifdef CONFIG_VIRTIO_GPU
     case VIRTIO_ID_GPU:
         features->dev_features =
             CONVERT_FEATURES(strList, virtio_gpu_feature_map, 0, bitmap);
         break;
#endif

> Otherwise you should have needed to adjust some header file as well.

OK I'll guard them with the corresponding #ifdef'ry.

