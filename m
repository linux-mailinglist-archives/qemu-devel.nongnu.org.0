Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8023C80B7
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 10:53:55 +0200 (CEST)
Received: from localhost ([::1]:54614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3aeQ-0000YH-KK
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 04:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m3adT-0008HL-8r
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 04:52:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m3adR-0007pN-NK
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 04:52:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626252772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FKSzqx1jNLOM3vVR3iE0eSBIJjY7dryZaD9z3kgqlNE=;
 b=ZMhsuUaU156DqQYYs1MCG4ueT+orWaoyWJJB4B+669mSXkCOWF3gHevD3Y0YEmnhettIuw
 T8qa9LGoDGR8dj0IEwq+vlXTXutFTR/H0xdU4lVhP49B1KTV3Gw/zuQj2oJTIcINkKqefK
 cEUnWT3pml8HjdfTQ946714U09sXcTE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-psXU9q5IPv2QF8J9yJPjOw-1; Wed, 14 Jul 2021 04:52:51 -0400
X-MC-Unique: psXU9q5IPv2QF8J9yJPjOw-1
Received: by mail-wr1-f70.google.com with SMTP id
 32-20020adf82a30000b029013b21c75294so1131604wrc.14
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 01:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FKSzqx1jNLOM3vVR3iE0eSBIJjY7dryZaD9z3kgqlNE=;
 b=JfWLA4oT7hBSQQgT68ahCLPN/bzp06yXEHsvHmxAsueRsJv81waG4LVSwRHkO2gthf
 KTn02sGfxNM72l2j8aM0rO24ShY6OBhjhZkTKPsQEc8ZjEPjqW6M/d+StonHVp71oHW3
 KsRq+KA20U7G4fAN++BvNBPzNATwyM0bCxNXu0CGxOXTNLnX2JDZi+23c3YOsxZQOYvc
 pEfAyTTAfVfaSvUkehs+DzLey8gbPlzc9tgywgnxUWQJry8W0yzfyKVOuofKop4g0KgB
 wULyRnFMeizwngEilkfEAfx7Qv7GUPe1AWLfdxr7pjuPKyZyWjFm7NaCVupJXHmufVHb
 54DA==
X-Gm-Message-State: AOAM530jyetvq1jFYPWSmkCbWxW7+ZXqP3eiCD6vOZWkVmj3ajTBvyPV
 EVn5V/dTk1vhSdsfdfYLojRkzUZEGX0jc/cB9JT/MR3XwsnkV2SC/PALc9KtWgtCh6ivx5kaqkv
 I/FOazJcDAPx2q3I=
X-Received: by 2002:a05:600c:4856:: with SMTP id
 j22mr2783162wmo.126.1626252770116; 
 Wed, 14 Jul 2021 01:52:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOmfcG7PWhSp1vIEMwhTr/0Fv42zfFW7zvCjQ1uwIkwTzQol553xeradkwTepqnPthKK41RA==
X-Received: by 2002:a05:600c:4856:: with SMTP id
 j22mr2783138wmo.126.1626252769845; 
 Wed, 14 Jul 2021 01:52:49 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83a2f.dip0.t-ipconnect.de.
 [217.232.58.47])
 by smtp.gmail.com with ESMTPSA id b187sm4731429wmd.40.2021.07.14.01.52.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 01:52:49 -0700 (PDT)
Subject: Re: [PATCH] configure / meson: Move the GBM handling to meson.build
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210713111516.734834-1-thuth@redhat.com>
 <fbc46ce8-511f-65eb-fa62-aa123bfb0562@redhat.com>
 <c36de5d8-43fb-4e09-9712-1ab1c2c6734a@redhat.com>
Message-ID: <dfebbd64-ef9a-83cf-19d9-99f79b22bb2d@redhat.com>
Date: Wed, 14 Jul 2021 10:52:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c36de5d8-43fb-4e09-9712-1ab1c2c6734a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.368, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/07/2021 09.12, Thomas Huth wrote:
> On 13/07/2021 14.29, Paolo Bonzini wrote:
>> On 13/07/21 13:15, Thomas Huth wrote:
>>> The GBM library detection does not need to be in the configure script,
>>> since it does not have any user-facing options (there are no
>>> --enable-gbm or --disable-gbm switches). Let's move it to meson.build
>>> instead, so we don't have to clutter config-host.mak with the related
>>> switches.
>>>
>>> Additionally, only check for GBM if it is really required, i.e. if we
>>> either compile with OpenGL or with virglrenderer support.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>
>> Queued, thanks.
> 
> Drat, sorry, I sent it out too early, one of the CI pipelines finally failed:
> 
>   https://gitlab.com/thuth/qemu/-/jobs/1420060624#L100
> 
> ... thus please drop it again, I have to fix that first.

It was just a missing "required: false" in the gbm dependency() statement. 
I've just sent out a v2 which should be fine now.

  Thomas



