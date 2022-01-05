Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0DA484EB4
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 08:30:53 +0100 (CET)
Received: from localhost ([::1]:50204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n50l1-0005Dn-II
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 02:30:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1n50NI-0007se-75
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 02:06:25 -0500
Received: from [2607:f8b0:4864:20::535] (port=33719
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1n50N6-0003Y8-9S
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 02:06:17 -0500
Received: by mail-pg1-x535.google.com with SMTP id 7so22128354pgn.0
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 23:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=glcRNOVS5ubuR6XRilMvdTsuiOdH52WAxyfvlh60Nuo=;
 b=DSMjEOLqQiFvYfXZOT0huL7J39+nutmHvdg7PpRObyGTGYwth2bRnTcaaNvEikGUEb
 PpDMxy4sOxhy15hiujLqcK9ALo7DIhlGl8Z9uHYuK6PxNLPw0FOB48tEQt/MrLAwtLRn
 CYgQL8eg4YJcELGZe4hvnPm0uUiJOeNq0Rr8bS2hqw1DT5JvcmI6lAowKZVsh038ab6I
 scPvJsmxdgbtjl5iIVYpA4FAZYIKtJAXLDb3uS0qHdCNkD3xVWMkgNDY9O0CcKJiMoM6
 COQduRN/3ClYC2l5RxzV6/+e0FTDR2Q0wux6iG+gEBUq9auFrgviP03SHoO5efbJVW1C
 g/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=glcRNOVS5ubuR6XRilMvdTsuiOdH52WAxyfvlh60Nuo=;
 b=LmeABq3BXt7CqSxuQVvXHI5wVyiSiZ9SWqBYcx3QQueKnpFOsJd7ahKkl5xq76uoFH
 TMC3kaKlkwUop7mXVk1/iYuRC6sEYzHLqu20PAsa8hj05KGgBMGyiffP2tY9Xa0jv8eH
 ZIh52TrcJEKZY77jnkoglBcT1CJ+vytPOeal7YZg9kQIIQafq7liv70NAfq20nozo1d+
 2QsE/h6z6bcuenNZSAMlcfMHeAytMqOi2u0TPtxd17PBQC3PPI1WIai3GlQXHqPiMPFZ
 XNJTw/utNgFTtZ/fFan1KD0cEwCwNHE2Rxpf7PhNGvGElC14sgtHfd5PeyCo/BF9jJAh
 gq1A==
X-Gm-Message-State: AOAM530LfqJrgq7yiO/xyEkSDZL9fqA4t7/UvvsMoGftd0aC3HGllmfT
 5K+u/gFMTyp/ZvXoFDqz8YVJMphNqESPxg==
X-Google-Smtp-Source: ABdhPJz9xjtIt9vMS8xTgpPLhp7njP3s/6pqBkzJDe3ml4ryOAULMWpGBR6sKZWgfnpxH44lXYtD1Q==
X-Received: by 2002:a62:4e4a:0:b0:4ba:8079:c463 with SMTP id
 c71-20020a624e4a000000b004ba8079c463mr54176577pfb.9.1641366365409; 
 Tue, 04 Jan 2022 23:06:05 -0800 (PST)
Received: from [10.76.15.169] ([153.254.110.109])
 by smtp.gmail.com with ESMTPSA id y65sm36151619pgd.79.2022.01.04.23.06.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 23:06:05 -0800 (PST)
Subject: Re: Re: [PATCH 0/5] Introduce camera subsystem and USB video device
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211227142734.691900-1-pizhenwei@bytedance.com>
 <YdROGNKYvl+doshs@redhat.com>
From: zhenwei pi <pizhenwei@bytedance.com>
Message-ID: <ae6ecdfe-cae4-de0e-e2d1-2282f7301db7@bytedance.com>
Date: Wed, 5 Jan 2022 15:03:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YdROGNKYvl+doshs@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-1.057, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, kraxel@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/4/22 9:39 PM, Daniel P. Berrangé wrote:
> On Mon, Dec 27, 2021 at 10:27:29PM +0800, zhenwei pi wrote:
>> 1, The full picture of this patch set:
>>     +---------+       +------------+     +---------------+
>>     |UVC(done)|       |virtio(TODO)|     |other HW device|
>>     +---------+       +------------+     +---------------+
>>           |                 |                     |
>>           |            +------------+             |
>> 	 +------------+camera(done)+-------------+
>>                        +----+-------+
>>                             |
>>           +-----------------+---------------------+
>>           |                 |                     |
>>    +------+------+     +----+-----+        +------+------+
>>    |builtin(done)|     |v4l2(done)|        |other drivers|
>>    +-------------+     +----------+        +-------------+
>>
>> With this patch set, We can run a desktop VM (Ex Ubuntu-2004), several camera
>> APPs(cheese, kamoso, guvcview and qcam) work fine.
>>
>> Some works still in working:
>>    1, hot-plug
>>    2, compat with live migration
>>    3, several actions defined in UVC SPEC
>>
>> Zhenwei Pi (5):
>>    camera: Introduce camera subsystem and builtin driver
>>    camera: v4l2: Introduce v4l2 camera driver
>>    usb: Introduce video&mescellaneous
>>    usb: allow max 8192 bytes for desc
>>    usb-video: Introduce USB video class
>>
>>   camera/builtin.c        |  717 ++++++++++++++++++++
>>   camera/camera-int.h     |   19 +
>>   camera/camera.c         |  522 +++++++++++++++
>>   camera/meson.build      |   20 +
>>   camera/trace-events     |   28 +
>>   camera/trace.h          |    1 +
>>   camera/v4l2.c           |  637 ++++++++++++++++++
>>   hw/usb/Kconfig          |    5 +
>>   hw/usb/desc.c           |   15 +-
>>   hw/usb/desc.h           |    1 +
>>   hw/usb/dev-video.c      | 1395 +++++++++++++++++++++++++++++++++++++++
>>   hw/usb/meson.build      |    1 +
>>   hw/usb/trace-events     |   11 +
>>   include/camera/camera.h |  238 +++++++
>>   include/hw/usb.h        |    2 +
>>   include/hw/usb/video.h  |  303 +++++++++
>>   meson.build             |   20 +-
>>   meson_options.txt       |    3 +
>>   qapi/camera.json        |  101 +++
>>   qapi/meson.build        |    1 +
>>   qapi/qapi-schema.json   |    1 +
>>   qemu-options.hx         |   13 +
>>   softmmu/vl.c            |    4 +
> 
> There's no MAINTAINERS file update here.
> 
> As a general rule, if you are introducing an entire new subsystem
> into the QEMU codebase, it is expected someone will be nominated
> as the maintainer for the new subsystem. Usually the person adding
> it will themselves volunteer to be the maintainer.
> 
> Regards,
> Daniel
> 
OK, thanks. I have a plan to add two parts in next version:
1, camera subsystem, include folder qemu/camera and qemu/include/camera/
2, UVC, include qemu/hw/usb/dev-video.c and qemu/include/hw/usb/video.h


-- 
zhenwei pi

