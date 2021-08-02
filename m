Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 646433DD29D
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 11:06:29 +0200 (CEST)
Received: from localhost ([::1]:54308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mATu0-0007r8-Es
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 05:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mATsi-0006nb-QS
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 05:05:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mATsg-0003dH-4l
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 05:05:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627895104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ATLCpQqxTSq75MHd3aW+A6pjr3xn9OPuMXvLDLOXNmc=;
 b=UtbKZ0pGrT293kxSEtbM8jM3gPZpuPPFZjoD89N2xcQq0swyifFHAdwqC/SNAjoec8CVsb
 wzMPYraowXyWdwXVJp/RvExxpFwFhEnaWZIQfurBoB2/cI9qbZDfAhkLbSA+T7RhfckJLb
 +b/8gs0AxE5TO/Q0S81RCfU+MPDldY4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-i37YQ4CqNw2diyV9KZfKlQ-1; Mon, 02 Aug 2021 05:05:02 -0400
X-MC-Unique: i37YQ4CqNw2diyV9KZfKlQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 o26-20020a05600c511ab0290252d0248251so5073694wms.1
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 02:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ATLCpQqxTSq75MHd3aW+A6pjr3xn9OPuMXvLDLOXNmc=;
 b=cegDw9b86Uwf9xllmt1Gs95atPybIHkzIxNiuStlJhMLjcVIKujDJZfZvW3t1WnfMn
 +Jlxa8a/AY20y/MCZcoRB01xSFFKO72fHdf2RejOu/bqvRZhTLcJOec/xE5eTE21H5Yq
 2KWgUpbE787J1nJnF0yZxcf8D1Wtr9Hx6lb2qgNTnsVtWFU+peT8bU21+mcFrP7D6ozU
 /5Quwwx02m70weKq5IB5xj1yU0zmtwbmt3B8hR94weuU8QY72lyIrrM1q3RGz2sbzLv/
 CQOC02Y3+FX9hSAMd3zMthvhHPuvirBT5aXWgeHpYr2qn1DjQxivYAr6Lh169OZX7WQH
 Zi1Q==
X-Gm-Message-State: AOAM5320dRHGPqsvTpaV0SOWgoPe+aGb85t/asXkhP/KUs9nbwmLQbOM
 m7gSORlZV4Y+C9EbUlMSyhA4DhN9j95MuKtLrdehCZXJLOBfzcdZU9yTS8VVT0zEqZklltPAqqm
 /od31y3wLK/VyS48=
X-Received: by 2002:a7b:c147:: with SMTP id z7mr15619561wmi.10.1627895101128; 
 Mon, 02 Aug 2021 02:05:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNYiPi5hsLf2a0kkTsBbObGu2BM/rL2q+v5hQGMC2RRLSDFZig1H3I69CfzCxis6NO0EF37Q==
X-Received: by 2002:a7b:c147:: with SMTP id z7mr15619549wmi.10.1627895100979; 
 Mon, 02 Aug 2021 02:05:00 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id x15sm10387871wrs.57.2021.08.02.02.05.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 02:05:00 -0700 (PDT)
Subject: Re: Windows on ARM64 not able to use attached TPM 2
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
References: <f288d6fb-4286-252c-1e3c-f92076dbc51e@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5ef559fa-c996-ba42-b9f0-416c7de661c8@redhat.com>
Date: Mon, 2 Aug 2021 11:04:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f288d6fb-4286-252c-1e3c-f92076dbc51e@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.08, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: eric.auger@redhat.com,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Marc-André who is your EDK2 co-maintainer.

On 8/1/21 2:28 AM, Stefan Berger wrote:
> Hello!
> 
>  I maintain the TPM support in QEMU and the TPM emulator (swtpm). I have
> a report from a user who would like to use QEMU on ARM64 (aarch64) with
> EDK2 and use an attached TPM 2 but it doesn't seem to work for him. We
> know that Windows on x86_64 works with EDK2 and can use an attached TPM
> 2 (using swtpm). I don't have an aarch64 host myself nor a Microsoft
> account to be able to access the Windows ARM64 version, so maybe someone
> here has the necessary background, credentials, and hardware to run QEMU
> on using kvm to investigate what the problems may be due to on that
> platform.
> 
> https://github.com/stefanberger/swtpm/issues/493
> 
> On Linux it seems to access the TPM emulator with the normal tpm_tis
> driver.
> 
> Regards,
> 
>    Stefan
> 
> 
> 


