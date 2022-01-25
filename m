Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B3D49B948
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 17:52:17 +0100 (CET)
Received: from localhost ([::1]:49412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCP3I-0004si-O9
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 11:52:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nCOwG-0007Ww-Hb
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 11:45:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nCOwF-0008RY-4G
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 11:45:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643129098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Upt5MAw/ZjqhCnJJv29d0OfiffNC7o1oJ65z/2ur0mg=;
 b=Gft+SgtCNhIoCKCzkZOwfsmhhiiiws66FatcvwN/Zj3EuPlpliXGSBLjltXT3Q8OCVZU26
 W1KeY9yxOeaOQBNAb1KPSwrO8tTrJu5Zms5hPyaN3d4iG4x887Qqp0YV+e0rdUf1XvNz1A
 +nWtM0PvKIRbkAbYdpkWjvX5qNQnZHs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-XdL7mSRsN5yhJmWhG-h22A-1; Tue, 25 Jan 2022 11:44:57 -0500
X-MC-Unique: XdL7mSRsN5yhJmWhG-h22A-1
Received: by mail-ej1-f72.google.com with SMTP id
 9-20020a170906218900b0065e2a9110b9so3666822eju.11
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 08:44:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Upt5MAw/ZjqhCnJJv29d0OfiffNC7o1oJ65z/2ur0mg=;
 b=QayHarHKdZbEqLulNQAzBAIjHSLJOQpFi1UBzH0naCRcAFgXDfGZL1lXz1pftdzG7h
 Ml/9TV1URoZ11mPyluDXAyGUP3v3vlriZmZAZrCjBhS3MQXFHQz2Q+mdZNZRGOAL0Ah8
 y6V2lBUviIDYkGL2cHsxCiK8O8v/VBrVbJjybEhxtazhs4GT06/435eTmrtWQXJK0Phn
 1gzW602mAyWGXIlcgnsYhiTS9uzsRWuYyiUMpU2s+TpF+tiLYQTDy+QjXpOHtbNcDffP
 B8mmhSZ2UbUiKvGFHfH5P1aFlHsdOwmZM5CfRHAhULAQhKeIbB5gQOkSKMmZh6INagpE
 S3hA==
X-Gm-Message-State: AOAM5313JVWEeCI1CXq0j2ugoDZv/6P0nJeUtNyU90HisMbed3Kuu6+X
 8U5fMO4o8eefoZ2lsMejauKYJbAQQcVIvR6wJnppYbRHoSb52pikLyuqse4RUkgTuwpmwk3MZEH
 5kpDGNpr69A/Slns=
X-Received: by 2002:a05:6402:190f:: with SMTP id
 e15mr9628536edz.203.1643129095973; 
 Tue, 25 Jan 2022 08:44:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrr2yYn4hRfnp+Gb5D+n1nq5IgudwuBat9vtKeCLimEJ8UZF1p+nzdytUmrEYeQwm/mNAgbg==
X-Received: by 2002:a05:6402:190f:: with SMTP id
 e15mr9628523edz.203.1643129095806; 
 Tue, 25 Jan 2022 08:44:55 -0800 (PST)
Received: from ?IPV6:2003:cb:c70f:8000:9797:8f:1ed9:7596?
 (p200300cbc70f80009797008f1ed97596.dip0.t-ipconnect.de.
 [2003:cb:c70f:8000:9797:8f:1ed9:7596])
 by smtp.gmail.com with ESMTPSA id b30sm8583844edn.16.2022.01.25.08.44.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 08:44:55 -0800 (PST)
Message-ID: <3c26089c-e4f0-b2a2-39d7-df601740ba76@redhat.com>
Date: Tue, 25 Jan 2022 17:44:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH qemu] s390x: sck: load into a temporary not into in1
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Nico Boehr <nrb@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220125122914.567599-1-nrb@linux.ibm.com>
 <9a888391-1020-89b0-65ed-5c93f2cc8642@redhat.com>
 <c0b5e6151a330f58f6794ee4fac19e6319810613.camel@linux.ibm.com>
 <daa1cb44-e089-7aa3-b34c-52090076f840@amsat.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <daa1cb44-e089-7aa3-b34c-52090076f840@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: linux-s390@vger.kernel.org, thuth@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.01.22 17:42, Philippe Mathieu-Daudé wrote:
> On 25/1/22 15:54, Nico Boehr wrote:
>> On Tue, 2022-01-25 at 14:13 +0100, David Hildenbrand wrote:
>>> I think you can actually just reuse in2_m2_64a, similar as we handle
>>> SCKC
>>
>> I tried my SCK tests with your patch, it works just as well and seems
>> much cleaner, thanks.
>>
>> Do you want to send this or should I make a v2 and add you as
>> Suggested-by?
> 
> v2 ;)

Yes, v2 please :)


-- 
Thanks,

David / dhildenb


