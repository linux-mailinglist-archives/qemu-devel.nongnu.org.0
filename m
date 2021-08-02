Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 804A43DD6F0
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 15:23:22 +0200 (CEST)
Received: from localhost ([::1]:49916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAXub-0005lh-Jr
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 09:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mAXtC-00053n-KW
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:21:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mAXt7-0007en-Dn
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 09:21:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627910507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NFctLxjTCqcc2pwStUZ64DN9XZIalCIu5MRz9RXriUk=;
 b=SEhT8wD4chuDQOeZyPvJNa4OI/yD10y0xysy/qw08shBRt+JPYWGkxyp9gtxgtfOjHcepL
 qemQZnKpiUayF+B/Kys34uDxo7k26GHUAzyrZc8hZ5WMr3kOJn5VkyxoARWUMJco8cvYAB
 8WqgRWdEm2LUzdd2FkK6XblbuFb8WLw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-xW05zyLkPUKNRKZIjUyiHA-1; Mon, 02 Aug 2021 09:21:45 -0400
X-MC-Unique: xW05zyLkPUKNRKZIjUyiHA-1
Received: by mail-wr1-f70.google.com with SMTP id
 p2-20020a5d48c20000b0290150e4a5e7e0so6419601wrs.13
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 06:21:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NFctLxjTCqcc2pwStUZ64DN9XZIalCIu5MRz9RXriUk=;
 b=tM1T7LmluN6hI7bnWYorWuPGSPzSSyILalHuwiWNgZSCD6aukkdJ3lzN1+AzJHCoxg
 exSWe0kQILhuGBKNQtcvYUlLyHTN7HH6V5njMYt+meiQx7aKVM40t7xZygQdcjecLgh9
 LMakDL5DD4PqKG9uJNbXf/4BZAkG62Bk94GoBXnX6v1kHM2lvhsqJR9OipOsCLVUDkeY
 kMwOycc27Lv1rddZyloiHQjMv2BpnE8JkO5azWMzoTQBwNaXQYe1U40qdyr8Ileyp0FO
 9oPXTvIftQjiSbLyp6Q5PCY0GOkuGYNmXw8hBDKM8mkAHA1w0aMXGknm1e8Gx/0UhRHb
 I4Dw==
X-Gm-Message-State: AOAM5331Oh0SFmvgAkeqjJ/ASQjFMuLFll4qRkatBIsL1W9jPQqkYqks
 fr89O5ZifqHzkYqSpBQLZlUrR1omJwH7+CbCO6gj/pvYudFbnkI8+N7poBGcCY90j7H2VBB38WF
 ErO+2kDOM4jar5MU=
X-Received: by 2002:a5d:4207:: with SMTP id n7mr17613714wrq.326.1627910503857; 
 Mon, 02 Aug 2021 06:21:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyf5ft490u4ovd7aYW4b5fSn1lENaFBF2iul4b9JudhLALZakLdZ8MuB47JI1xNRTjrlrB/5A==
X-Received: by 2002:a5d:4207:: with SMTP id n7mr17613688wrq.326.1627910503674; 
 Mon, 02 Aug 2021 06:21:43 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id v15sm10706634wmj.11.2021.08.02.06.21.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 06:21:43 -0700 (PDT)
Subject: Re: Windows on ARM64 not able to use attached TPM 2
To: Ard Biesheuvel <ardb@kernel.org>, Eric Auger <eric.auger@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>
References: <f288d6fb-4286-252c-1e3c-f92076dbc51e@linux.ibm.com>
 <5ef559fa-c996-ba42-b9f0-416c7de661c8@redhat.com>
 <7207680a-5667-33ea-7d3a-99f6297f4b04@redhat.com>
 <CAMj1kXEX-9GPMhKRU6eoAzBgi-T=zNWxn8k5KP7bqbY9qB7nqQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4eb88a28-5251-dbfa-b7cd-e18f03100b09@redhat.com>
Date: Mon, 2 Aug 2021 15:21:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMj1kXEX-9GPMhKRU6eoAzBgi-T=zNWxn8k5KP7bqbY9qB7nqQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ard Biesheuvel <Ard.Biesheuvel@arm.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adding Leif who might add someone who knows ;)

On 8/2/21 2:09 PM, Ard Biesheuvel wrote:
> On Mon, 2 Aug 2021 at 11:51, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> and also adding Ard if he is aware of any limitation the TPM2
>> integration may suffer for Windows support. On my end I am only able to
>> test on Linux atm.
>>
> 
> I never tested Windows with the TPM2 support, so I cannot answer this,
> unfortunately.
> 
>>
>> On 8/2/21 11:04 AM, Philippe Mathieu-Daudé wrote:
>>> Cc'ing Marc-André who is your EDK2 co-maintainer.
>>>
>>> On 8/1/21 2:28 AM, Stefan Berger wrote:
>>>> Hello!
>>>>
>>>>  I maintain the TPM support in QEMU and the TPM emulator (swtpm). I have
>>>> a report from a user who would like to use QEMU on ARM64 (aarch64) with
>>>> EDK2 and use an attached TPM 2 but it doesn't seem to work for him. We
>>>> know that Windows on x86_64 works with EDK2 and can use an attached TPM
>>>> 2 (using swtpm). I don't have an aarch64 host myself nor a Microsoft
>>>> account to be able to access the Windows ARM64 version, so maybe someone
>>>> here has the necessary background, credentials, and hardware to run QEMU
>>>> on using kvm to investigate what the problems may be due to on that
>>>> platform.
>>>>
>>>> https://github.com/stefanberger/swtpm/issues/493
>>>>
>>>> On Linux it seems to access the TPM emulator with the normal tpm_tis
>>>> driver.
>>>>
>>>> Regards,
>>>>
>>>>    Stefan
>>>>
>>>>
>>>>
>>
> 


