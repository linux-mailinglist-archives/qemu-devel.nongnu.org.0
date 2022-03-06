Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E6C4CEAA2
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 11:57:27 +0100 (CET)
Received: from localhost ([::1]:56146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQoZq-00022C-82
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 05:57:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nQoWc-00083A-Dr
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 05:54:08 -0500
Received: from [2607:f8b0:4864:20::631] (port=45968
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nQoWa-0005MB-RH
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 05:54:06 -0500
Received: by mail-pl1-x631.google.com with SMTP id s1so11436099plg.12
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 02:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=H6NXNH7E/S3qgEDhkMGTFPsME9Weo6eO53YonNgRVgQ=;
 b=pHPMWMA4a8iK2HnWPgYncCEYwmMptbZTuGAwykh3StUBOKe/mkpemRFgjHatGmGH0e
 tMP/dBxa+s7l4I0O9WJryvfzBZUY3mrnwh/c4t9yBsjSFG4YgqSg65lT6CMtI0j+2Wzy
 m+pZcFHjz8411rcL7rFMr9TSPpVCeeQ+TNo7Cuq3NnX9UogU/OsjpaSMkVR4X3rnBP+K
 QD99snrfs9YLRXoJc9mTfHNeG3aqh93GCA637dktlxXe1Xy/dpP4/edUJFrbFjtQimwF
 KxmInjA48GntIWI0q/MABOUD6TRPnY8rTX14NEOFeOfyzUdXzTBQFIkN0OR2XTkJd3Kf
 Bf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=H6NXNH7E/S3qgEDhkMGTFPsME9Weo6eO53YonNgRVgQ=;
 b=QYv7UHNWTEw0dz7FngdWC6ff7JMkaXaTQg/e6ZE1qXQXyRcI9MDgtYYLtkAwqoR2vS
 bJ/8VhyPn5zPBgIWTJhMnTQXdl/FAQ4Vbyh1YGk9dhs2+EokZY/dd7eYw6Kf/kZhOkxW
 D0hPG28MzKMghwbSpfFlZUMf1P9ayJpmiLYL5u11G5E4T7aFnnfs4Df4j2Bxk0c+7aXZ
 NH0ecS/bLGuVIQGHBYWegRawcLfKLJYU2/eQRcPqou/+nA/1CcRzqJktr+SPGkYmYnux
 044Yw11RcmqjREQLX/a0+KEWvIIUngQSVMSZG8Er7w6O+gIDEOUGgqqwzbhpQox6wgep
 2bww==
X-Gm-Message-State: AOAM532joGIvtWKAS1ek4FCOYWejjWQOLLDc0O9EmR188KJ3+PyI0LVe
 OCkHGnXtezf3uS+6NV/o9NE=
X-Google-Smtp-Source: ABdhPJyZzYV+7Ybz6XFL3U0tVAxn6xYQBk2vSHRygMIoOsp5SkFUxB3iZ0vwbT0bupcmmBFF3GKxJQ==
X-Received: by 2002:a17:902:ef45:b0:151:8302:e0da with SMTP id
 e5-20020a170902ef4500b001518302e0damr7382483plx.21.1646564043469; 
 Sun, 06 Mar 2022 02:54:03 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a056a00194900b004e1583f88a2sm11787455pfk.0.2022.03.06.02.54.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 02:54:02 -0800 (PST)
Message-ID: <0fc7e092-49dd-4fb3-a365-f5399a4cb8b2@gmail.com>
Date: Sun, 6 Mar 2022 19:54:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] coreaudio: Always return 0 in handle_voice_change
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <20220306063949.28138-1-akihiko.odaki@gmail.com>
 <1771824.72ebOKuLVD@silver>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <1771824.72ebOKuLVD@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/03/06 19:49, Christian Schoenebeck wrote:
> On Sonntag, 6. März 2022 07:39:49 CET Akihiko Odaki wrote:
>> MacOSX.sdk/System/Library/Frameworks/CoreAudio.framework/Headers/AudioHardwa
>> re.h
>> says:
>>> The return value is currently unused and should always be 0.
> 
> Where does it say that, about which macOS functions? There are quite a bunch
> of macOS functions involved in init_out_device(), and they all have error
> pathes in init_out_device(), and they still will have them after this patch.
> 
> And again, I'm missing: this as an improvement because? Is this a user
> invisible improvement (e.g. removing redundant branches), or is this a user
> visible improvement, i.e. does it fix a misbehaviour? In case of the latter,
> which misbehaviour did you encounter?

handle_voice_change itself is a callback.
It is invisible for a user since "the return value is currently unused".

Regards,
Akihiko Odaki

> 
> Best regards,
> Christian Schoenebeck
> 
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>> ---
>>   audio/coreaudio.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/audio/coreaudio.c b/audio/coreaudio.c
>> index 0f19d0ce01c..91445096358 100644
>> --- a/audio/coreaudio.c
>> +++ b/audio/coreaudio.c
>> @@ -540,7 +540,6 @@ static OSStatus handle_voice_change(
>>       const AudioObjectPropertyAddress *in_addresses,
>>       void *in_client_data)
>>   {
>> -    OSStatus status;
>>       coreaudioVoiceOut *core = in_client_data;
>>
>>       qemu_mutex_lock_iothread();
>> @@ -549,13 +548,12 @@ static OSStatus handle_voice_change(
>>           fini_out_device(core);
>>       }
>>
>> -    status = init_out_device(core);
>> -    if (!status) {
>> +    if (!init_out_device(core)) {
>>           update_device_playback_state(core);
>>       }
>>
>>       qemu_mutex_unlock_iothread();
>> -    return status;
>> +    return 0;
>>   }
>>
>>   static int coreaudio_init_out(HWVoiceOut *hw, struct audsettings *as,
> 
> 


