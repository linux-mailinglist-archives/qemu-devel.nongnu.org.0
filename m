Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B403C5E6E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 16:37:00 +0200 (CEST)
Received: from localhost ([::1]:37212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2x3L-0002ub-DJ
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 10:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m2x28-0001Qm-UJ
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:35:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m2x27-0003rk-9q
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:35:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626100541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pKjGuijc4zsgikeoVoC4aIXR4+18vq+t69Wopd9SIHk=;
 b=GkprtwcJmnW9cwe2+UDyJETO7D3fDOG/gPZ2F1rIQ/6yXm+jP4aaeg/ccJs8rFm67iQLaV
 e2oA0TVydbqSCaXI28uhVKkcnp6cL6eJK+xstA3U7eEDhVTGpp3IM8UU7htrRfkL7bdN73
 93p4IRKSixhTw35unem2OixO5v9kOU8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-Mcx0SU4_M_ucEkTPjqhSEA-1; Mon, 12 Jul 2021 10:35:39 -0400
X-MC-Unique: Mcx0SU4_M_ucEkTPjqhSEA-1
Received: by mail-wr1-f72.google.com with SMTP id
 m9-20020a0560000089b02901362e1cd6a3so7157387wrx.13
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 07:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pKjGuijc4zsgikeoVoC4aIXR4+18vq+t69Wopd9SIHk=;
 b=sZczlOWtjS52sTpqZnYwYHGciSIQktJi75axV3t7MGdGPsylbL0WDT7BzWAI15QIck
 6RT05SkaVY6eryJMFvZZtLAiij6P+m1gLgNJQzFpOdh2uLV/I77TPxSA94PpHqjpWjWc
 wcsCX/TwCAqXfqzHsos+L5eag6oJxQHI97GVOIUsz9aTTwZpm+xIXNv8lTf68DKlHgu6
 zg+4MA0Rn1GaxU2HcTn1u+BXEgvQFIpBL1sfPB0XCg+aYIWvtOQptcmfpr1vlKOoLeCs
 N/9EOUTvgjVbQ/tHaf+LaquUJhr5U+H8vSsUSF7cGF+H14PG2OGfNfHo8kkMtBdIAMXN
 LcqQ==
X-Gm-Message-State: AOAM532vfQ0DAkNnoES4HyJSweegBh7NWLpw7pl3ujJvGoLNpO3x5dNO
 R5ap+ag+fAqVTibdkMlYZJdHvotF4dSC1Giw+SeZfrPYsEKOmdid8EahTUQDMP+zCyMTg5xkfWo
 l5ZzYQEA2JVNirOg=
X-Received: by 2002:a5d:598d:: with SMTP id n13mr43000998wri.246.1626100537963; 
 Mon, 12 Jul 2021 07:35:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuBMjGSSLxcAmxFaG9ka1J0WIrpHFLH8XIanLhjioKQgvtU58mryPWPL8FA15l8PSxjH3F8w==
X-Received: by 2002:a5d:598d:: with SMTP id n13mr43000978wri.246.1626100537853; 
 Mon, 12 Jul 2021 07:35:37 -0700 (PDT)
Received: from [192.168.1.27] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id p8sm13901257wre.76.2021.07.12.07.35.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 07:35:37 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: remove Laszlo Ersek's entries
To: Laszlo Ersek <lersek@redhat.com>, qemu devel list <qemu-devel@nongnu.org>
References: <20210708071409.9671-1-lersek@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8a64a663-6795-f7bf-b9af-da8ba59980d0@redhat.com>
Date: Mon, 12 Jul 2021 16:35:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708071409.9671-1-lersek@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.479, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
 "Daniel P . Berrange" <berrange@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 9:14 AM, Laszlo Ersek wrote:
> I've relinquished my edk2 roles with the following commit message [1] [2]
> [3]:
> 
>> Maintainers.txt: remove Laszlo Ersek's entries
>>
>> I'm relinquishing all my roles listed in "Maintainers.txt", for personal
>> reasons.
>>
>> My email address <lersek@redhat.com> remains functional.
>>
>> To my understanding, my employer is working to assign others engineers
>> to the edk2 project (at their discretion).
> 
> [1] https://edk2.groups.io/g/devel/message/77585
> [2] https://listman.redhat.com/archives/edk2-devel-archive/2021-July/msg00202.html
> [3] http://mid.mail-archive.com/20210708070916.8937-1-lersek@redhat.com
> 
> Accordingly, remove my entries from QEMU's MAINTAINERS file as well, which
> all relate to guest firmware.
> 
> Cc: Daniel P. Berrange <berrange@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Kashyap Chamarthy <kchamart@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> ---
>  MAINTAINERS | 3 ---
>  1 file changed, 3 deletions(-)

Thanks, queued to fw-edk2 tree.


