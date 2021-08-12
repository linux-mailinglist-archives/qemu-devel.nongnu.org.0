Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 392003E9FAA
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 09:44:15 +0200 (CEST)
Received: from localhost ([::1]:40978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE5Nt-0004tg-Rb
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 03:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mE5NA-0004Da-Jp
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 03:43:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mE5N7-0004Fx-AG
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 03:43:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628754203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ffDmIbDT0/FKnOMyhv07LCAGXoc9SGUOOvOf+afTqA8=;
 b=gAyKhYutCrXo8CXxRhLKzVGZmO2SJ8eXFJTSG0ye6Jw/2otF9yyCMVAPVMIraE7gTFcMrk
 cBEgx6/Fn2LWg4oIi7uJ5ZgxITH4TjPiRPFinymFfZXC7J68ov13mALbZe8BBEgB5myV4x
 kvsJqlnsofpJjSSt9Wy0S5TnqGTxzW8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-OM4l6_LrP2eXnxPB82rPGg-1; Thu, 12 Aug 2021 03:43:22 -0400
X-MC-Unique: OM4l6_LrP2eXnxPB82rPGg-1
Received: by mail-wm1-f71.google.com with SMTP id
 y186-20020a1c32c30000b02902b5ac887cfcso3028531wmy.2
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 00:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ffDmIbDT0/FKnOMyhv07LCAGXoc9SGUOOvOf+afTqA8=;
 b=InucOZYK87UVcv6/5RJvX1oBJa4f43Wxcjq4/VmtvaKaS6TnpkbJd6mUInXMiymhQb
 6JIi4+vW6pNB4sKOcr7VGryu3uXzLs/eAYN73Mh+2X/DeDJREFhT6Rn18+Qeg3klSzVv
 docAiqLUJVYMmpEKW6F0fpUrDC20t3HUc4nWmLopkUIZm65746RPJgCPh1SZpZRfTGVs
 mp90HHMVk4EKMu5nmbItggDtnUrAHZsjR3k0kiIEC9O6mcC26mS+9K+PdT8DgMWUxof6
 VQcu/AQ53mJuAla4bHfNSz2qSGb2bgVBVc1Bu7ezpFcJ1Yq1Kh/SXN/z9UxtX111n2iD
 K+4A==
X-Gm-Message-State: AOAM532MdReT6G4YqHX6UId8gMoHeiO/rTJkLf/4gJpE8DjQJMnRDLVo
 gXhucmHEXVUYRxVQLLMAsVP/n5ZXJA1qJPPoxmtWzv8lSqC+8xpMQLSxmjNiAQYTM2b1cAxtw3g
 P+Mf4KS1PVbHEhwo0snf5wk4g3xVz33LEv+7NqXNqXCuEKlzwyn2EHsz490iax18z
X-Received: by 2002:a05:600c:210a:: with SMTP id
 u10mr13979336wml.162.1628754201025; 
 Thu, 12 Aug 2021 00:43:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxV/33/D/eGGyVRfV8aZvJowFBnY7vfTk9QYhHDNcOIq/5w4/u93dimk9fuRHXO5SNbalkpqQ==
X-Received: by 2002:a05:600c:210a:: with SMTP id
 u10mr13979316wml.162.1628754200822; 
 Thu, 12 Aug 2021 00:43:20 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id i21sm2026222wrb.62.2021.08.12.00.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 00:43:20 -0700 (PDT)
Subject: Re: [PULL 0/7] Maintainers 20210811 patches
To: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
References: <20210811064128.2776317-1-kraxel@redhat.com>
 <CAFEAcA_ig5b86+8NwAkp2rVA=96gOdNBm9ip1ijJRXNuexoOvg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <de3197f1-91f5-b598-2cfe-25f9265ca4f6@redhat.com>
Date: Thu, 12 Aug 2021 09:43:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_ig5b86+8NwAkp2rVA=96gOdNBm9ip1ijJRXNuexoOvg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 8/11/21 2:58 PM, Peter Maydell wrote:
> On Wed, 11 Aug 2021 at 07:44, Gerd Hoffmann <kraxel@redhat.com> wrote:
>>
>> The following changes since commit 703e8cd6189cf699c8d5c094bc68b5f3afa6ad71:
>>
>>   Update version for v6.1.0-rc3 release (2021-08-10 19:08:09 +0100)
>>
>> are available in the Git repository at:
>>
>>   git://git.kraxel.org/qemu tags/maintainers-20210811-pull-request
>>
>> for you to fetch changes up to a4de5e8a0667e3ee43ca9953ec7fd11ff19f2c92:
>>
>>   MAINTAINERS: update virtio-gpu entry. (2021-08-11 08:39:16 +0200)
>>
>> ----------------------------------------------------------------
>> MAINTAINERS: update kraxel's entries.
>>
>> ----------------------------------------------------------------
> 
> I'll keep this in my list in case we need to roll an rc4, but
> if we are able to release 6.1 without needing another rc then
> I'll just hold this over until we reopen trunk for 6.2.

I recently had a bad experience while bisecting over commit
3e13d8e34b5 (based on v6.0.0-rc4, merged after v6.0.0), git
was failing as:

  Some good revs are not ancestors of the bad rev.
  git bisect cannot work properly in this case.

I never understood why this commit in particular, but it broke
automatic bisection. I doubt simple MAINTAINERS changes annoy
us, but such trouble could be avoided if we ask maintainers to
base their pull requests on latest release tag (not the rc ones).
Just my 2 cents anyway ;)

Regards,

Phil.


