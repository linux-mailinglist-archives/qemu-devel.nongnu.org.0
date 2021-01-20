Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 153F32FD507
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 17:14:11 +0100 (CET)
Received: from localhost ([::1]:52090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2G7W-0004W4-5u
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 11:14:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2FyB-00063g-2T
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:04:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2Fy9-0006Jw-9U
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:04:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611158668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6MyBh37DnYLJ13LxD/GBKVbCo5QqVkLK3c/hPAiWEZU=;
 b=dV5nKlvpqCc85Kcvd11nnpQB/iVk5I4AOA9s57TjpCqDtlkPGlfthyInGPEf9ySzb3qOQE
 mgihw/qkszgzSjwLkYkA0YlrvttaGCHDijmdx1TIK6qIoz79/wGxtMX2hEIOs3pKE+HCpK
 ZentnIv4PAcATk4SZFkBRfBNbS6jRn4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-K7fRg33ROQ2asLkTAJTLcA-1; Wed, 20 Jan 2021 11:04:26 -0500
X-MC-Unique: K7fRg33ROQ2asLkTAJTLcA-1
Received: by mail-ed1-f69.google.com with SMTP id f21so11028679edx.23
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 08:04:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6MyBh37DnYLJ13LxD/GBKVbCo5QqVkLK3c/hPAiWEZU=;
 b=IZz8ghy83nXPzROYslNJsBW/+vicOkWLDve1cYMbYrP8K6sRdC0Mk1xpnvfgGnDYG4
 yjkD08X20jCSFI2+s14nmKzXfxzZeStrsQ92jX9PnYzJAvA9DIww+GJdOz+dERonZGMB
 cRTRjVsVOsc3tUOmp6SOIMC6o/HmtQO4qcTPT+OfJMbGrc0Hsal+bey93B5nU0VaHwee
 Gk2lyioGUmPaLIvEES+83Trpm38Duy4uEdh/fcYJwWCs9z0Sn9AQV/4QR1/JiJaYC3GX
 LQ3YeH5w5u8rP8BBe1kcPcyvBwh0D1KSU1Kt5haqvDu4kev8WDfhiS8jzMaCqrIF3C1R
 XEfA==
X-Gm-Message-State: AOAM532d82R25dc/prGIe0pj1CVZvO2K7tYPjdAmeRlbpX3Z9w8bU3Zt
 PU4tIHnnou0gtazznCZNXCdMUbUHOlcUd1FBCy8VUnRbEaZbV7wXXDV9OUHVmJCzEFkGibnBJZm
 Lq0VtBaNKzCZJiV8=
X-Received: by 2002:a17:906:2755:: with SMTP id
 a21mr6621383ejd.374.1611158665209; 
 Wed, 20 Jan 2021 08:04:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHpMhHGjtHtAlsg94N2ya9umYbQUiHd0LmDN3QnmLm14+a04SilmXGKS6nny0faD1bQJzTnw==
X-Received: by 2002:a17:906:2755:: with SMTP id
 a21mr6621364ejd.374.1611158664876; 
 Wed, 20 Jan 2021 08:04:24 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id c7sm1320282edv.70.2021.01.20.08.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 08:04:24 -0800 (PST)
Subject: Re: [RFC PATCH 1/2] scsi/utils: Add INVALID_PARAM_VALUE sense code
 definition
To: Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20210118170308.282442-1-philmd@redhat.com>
 <20210118170308.282442-2-philmd@redhat.com>
 <505a6e2f-a07b-5e1f-a6d0-3d32b6388bb3@redhat.com>
 <20210120160101.nddbb5wjh47hvrj7@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <aac76e13-e4c1-9e3b-25d3-33146ed6b1a5@redhat.com>
Date: Wed, 20 Jan 2021 17:04:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120160101.nddbb5wjh47hvrj7@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/21 5:01 PM, Gerd Hoffmann wrote:
>   Hi,
> 
>>> +/* Illegal request, Invalid value in parameter list */
>>> +extern const struct SCSISense sense_code_INVALID_PARAM_VALUE;
> 
>> Pre-existing: the term 'illegal' is suspect in computer science (the
>> code isn't breaking any laws);
> 
> Indeed.  It's named that way in the scsi specs though, and being
> consistent with that is a reasonable thing too ...

In v2 I renamed 'illegal' in the description comments but
not in the #definitions (which match the specs).

Regards,

Phil.


