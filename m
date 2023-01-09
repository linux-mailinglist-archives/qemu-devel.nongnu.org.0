Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3083E662842
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:19:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEsdT-0007YM-JK; Mon, 09 Jan 2023 08:56:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEsdO-0007Wn-IM
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:56:19 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEsdM-00037N-US
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 08:56:18 -0500
Received: by mail-wm1-x32b.google.com with SMTP id ja17so6318559wmb.3
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 05:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SCtPYwgwiiyjtwZF7LBR8T8Fc06Vvs8KjBVF52HTabg=;
 b=HNMRvbERVsqrIzaigKut7mt4CalAUQ9AEoI84qD9T6251n26Vmv75vlW8W3BwvQVtI
 KrkKA2Mz0+MP4l7fLzKNvMbu+K0Bo439Xl2rwMpZst+kyTo3d+kLbEYdlhQ7HWzAX4Ll
 noc2b6DmXA+oNlYYgGu5k+buLHdIeCXDwEe7tt3VDqQTekQCP6c5fCtoLJ/lTs4CoVg4
 wP3K9ai1YsggpE+8FiD0EsrDbTNSEAlsASt8z+gSRzIJ9O97K/T2rr10NyKMfVLpW3R0
 7OcZ+8kkGPfBcmdP46aAtyK/Cf++lSemEOaiZrIHmTtZD483TWwhYJYwC6KaFg2asb8U
 GXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SCtPYwgwiiyjtwZF7LBR8T8Fc06Vvs8KjBVF52HTabg=;
 b=bTSmhcyTs2q22nB3SssZM1lEJToWpyIJRx/KMBfTxxkhaRkl/NYYfYYIEtLViMPR1I
 smqkzcpbq5QZ1JWwIQ4EvQngsndsE0IHSKMLIdE+LfBhyteQF95h6d0T1nItTpHM9TKf
 g8JoCDIZ1BOkesqDIKk2Jy+FakKSHXMVXjEUlIHV9qiYFAASO2IZd2SZZXE9JW5yMMzo
 82VsLRbDhmvvUttcW+Buq2qfiioyi1jxrJ/b5dJ7uKd0jtiASPTx/kC/ZLijT0iSccdR
 hd/rYJoGn72Cq8sG1dOpcEKHp7oSnU5DLgsGOoHDjr+A1idPfwKBhflWMDy+1ic7PmWU
 RdxQ==
X-Gm-Message-State: AFqh2krGS42rz97sRlmEdIpQOml782BEzifgx0WxYFJQWJV/vIMvqAxw
 ayb76trKuWDL9253l436ui/LIg==
X-Google-Smtp-Source: AMrXdXs0s3OMmZmJfk+qIQ3vTy/NzvLfx+hZTVWYmmOLpHXwPgBKjcJj7JFbVxqhxMP8ou//1wtufQ==
X-Received: by 2002:a1c:7c14:0:b0:3d1:f74d:4f60 with SMTP id
 x20-20020a1c7c14000000b003d1f74d4f60mr50093951wmc.22.1673272575411; 
 Mon, 09 Jan 2023 05:56:15 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g2-20020a5d4882000000b00286ad197346sm8702331wrq.70.2023.01.09.05.56.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 05:56:14 -0800 (PST)
Message-ID: <8507ed0d-fc90-8ce3-2d7d-82c106b20231@linaro.org>
Date: Mon, 9 Jan 2023 14:56:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 01/21] hw/block: Rename TYPE_PFLASH_CFI02 'width'
 property as 'device-width'
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, Markus Armbruster
 <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20230109120833.3330-1-philmd@linaro.org>
 <20230109120833.3330-2-philmd@linaro.org>
 <791cd783-4f27-dd18-c6bd-b9a316bb42cd@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <791cd783-4f27-dd18-c6bd-b9a316bb42cd@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 9/1/23 14:33, BALATON Zoltan wrote:
> On Mon, 9 Jan 2023, Philippe Mathieu-Daudé wrote:
>> Use the same property name than the TYPE_PFLASH_CFI01 model.
> 
> Nothing uses it? Can this break command lines and if so do we need 
> deprecation or some compatibility function until everybody changed their 
> usage?

Good point... I missed that :/

How deprecation works in that case, can I simply add an extra
property with DEFINE_PROP_UINT8()? I'm worried about an user
doing:

  -device cfi.pflash02,device-width=4,width=2,...

and the processing order of the properties, besides property
overwritten isn't warned to the user.

>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> hw/block/pflash_cfi02.c | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
>> index 2a99b286b0..55ddd0916c 100644
>> --- a/hw/block/pflash_cfi02.c
>> +++ b/hw/block/pflash_cfi02.c
>> @@ -949,7 +949,7 @@ static Property pflash_cfi02_properties[] = {
>>     DEFINE_PROP_UINT32("sector-length2", PFlashCFI02, sector_len[2], 0),
>>     DEFINE_PROP_UINT32("num-blocks3", PFlashCFI02, nb_blocs[3], 0),
>>     DEFINE_PROP_UINT32("sector-length3", PFlashCFI02, sector_len[3], 0),
>> -    DEFINE_PROP_UINT8("width", PFlashCFI02, width, 0),
>> +    DEFINE_PROP_UINT8("device-width", PFlashCFI02, width, 0),
>>     DEFINE_PROP_UINT8("mappings", PFlashCFI02, mappings, 0),
>>     DEFINE_PROP_UINT8("big-endian", PFlashCFI02, be, 0),
>>     DEFINE_PROP_UINT16("id0", PFlashCFI02, ident0, 0),
>> @@ -1014,7 +1014,7 @@ PFlashCFI02 *pflash_cfi02_register(hwaddr base,
>>     assert(QEMU_IS_ALIGNED(size, sector_len));
>>     qdev_prop_set_uint32(dev, "num-blocks", size / sector_len);
>>     qdev_prop_set_uint32(dev, "sector-length", sector_len);
>> -    qdev_prop_set_uint8(dev, "width", width);
>> +    qdev_prop_set_uint8(dev, "device-width", width);
>>     qdev_prop_set_uint8(dev, "mappings", nb_mappings);
>>     qdev_prop_set_uint8(dev, "big-endian", !!be);
>>     qdev_prop_set_uint16(dev, "id0", id0);
>>


