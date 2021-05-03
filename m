Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5F13712C4
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 10:58:30 +0200 (CEST)
Received: from localhost ([::1]:34848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldUPN-0008K3-SI
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 04:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldU8B-0005we-Od
 for qemu-devel@nongnu.org; Mon, 03 May 2021 04:40:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldU87-0002XX-8U
 for qemu-devel@nongnu.org; Mon, 03 May 2021 04:40:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620031236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L6ebUu73uLS2o4afxfvSIOjyNhmX5jdD83v/RcFJodg=;
 b=EG3qUbqO2HgkQ5qfnMmdqs+CQvzXAnQlByM+J67dWXDilkOJCkj3V7Jf15SxXMUc4w8Xu8
 D2HZaepIxo/PhNwZc5cuJhtVo0RgmfmGxnEX57fADml0LZuLZwUw1jU8OpW+yVPERpEE5F
 YNe8zyUcin4et6JDjWudZsVOVEkQcTE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-u-ts5kUNMWO3YpemGqz0zg-1; Mon, 03 May 2021 04:40:34 -0400
X-MC-Unique: u-ts5kUNMWO3YpemGqz0zg-1
Received: by mail-wr1-f72.google.com with SMTP id
 93-20020adf83660000b029010d6b1e0949so3504692wrd.3
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 01:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L6ebUu73uLS2o4afxfvSIOjyNhmX5jdD83v/RcFJodg=;
 b=PkDMddNkLt/bkz2W5lqSpaXz+oGwDC4fQRZxo7Ff4+SU3KhbE1gWyAv26WIompIhBX
 FwcKnAYK9/MlyEZamv8FStEv9blW07l0vnTjP3J2SIl0kxiZDVdHdvR8+SXR+Um+PeuP
 KmCIrFRGvloRrMNJnlDu+QKhzpxMZ0Yrljox62NNcD7WreLfICVAE0VrGpHbuI8lQ6bz
 Xc2Klqla8e1i8Ca9nvfgyfGLB2hyW5pFsLoVH2J6qR0QcR07r3nmq7eH4VxiFuEQHydP
 OcGUghiIjJ1xCZffjhw6zHA/URVwgnggX2lZAas5Owyp/fixflnknep7eZ7kgnfLVrwr
 e1+g==
X-Gm-Message-State: AOAM530rtMsZO1MWg7twAoCbEw3+qo/hwJiEINpSX8ZYw7LjHE9OuPGr
 srVvmvhg2d+xZ0wGh2Yw5NY3LK5h4e+FDKqChcISO5OFwauuDOv3LYxsJ7M7zXsGCLRUQ6q8GKv
 PhRPVLkjr5fr2aLI=
X-Received: by 2002:a1c:7419:: with SMTP id p25mr12339168wmc.79.1620031233374; 
 Mon, 03 May 2021 01:40:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+ZRZuHl4NHbArIu4c6Vo1TgiMOUqjJYB2Qm0WZxb2wNMYc0WHJ3vm045tmCiGb2MVjQippA==
X-Received: by 2002:a1c:7419:: with SMTP id p25mr12339149wmc.79.1620031233226; 
 Mon, 03 May 2021 01:40:33 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id f25sm11852311wrd.67.2021.05.03.01.40.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 01:40:32 -0700 (PDT)
Subject: Re: [PATCH 0/1] Acceptance Tests: bump Avocado version requirement to
 87.0
To: Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210414161144.1598980-1-crosa@redhat.com>
 <ec80a132-969e-1428-51b2-05c94c2447bc@redhat.com>
 <262314931.15107240.1620006623468.JavaMail.zimbra@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d80ec7d1-2c3d-5642-0459-9cbd3fff467d@redhat.com>
Date: Mon, 3 May 2021 10:40:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <262314931.15107240.1620006623468.JavaMail.zimbra@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 3:50 AM, Cleber Rosa wrote:
> ----- Original Message -----
>> From: "Philippe Mathieu-Daudé" <philmd@redhat.com>
>> On 4/14/21 6:11 PM, Cleber Rosa wrote:
>>> This is being proposed as a separate single patch simply to show
>>> that no known regressions have been introduced as far as the
>>> acceptance tests/jobs are related.  CI job:
>>>
>>>    https://gitlab.com/cleber.gnu/qemu/-/pipelines/286347312
>>>
>>> This version (and 86.0) contain improvements that address specific
>>> QEMU use cases, including:
>>>
>>>  * Fix to the error message given when downloading assets
>>>
>>>  * Asset listing/purging capabilities
>>>
>>> Cleber Rosa (1):
>>>   Acceptance Tests: bump Avocado version requirement to 87.0
>>>
>>>  tests/requirements.txt | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>
>> Ping? This patch should fix the mainstream pipeline error:
>> https://gitlab.com/qemu-project/qemu/-/jobs/1229752162
>>
> 
> Hi Phil,
> 
> I'll send with my python-next (and other) patches to be queued in a day
> or two... but the bad news is: I don't think Avocado 87.0 has the fix for
> the pipeline issue above.  I looked at the test log, and the kernel boot
> hangs right after:
> 
> 11:43:53 DEBUG| Freeing unused kernel memory: 1176K
> 11:43:53 DEBUG| This architecture does not have kernel memory protection.
> 
> And then gets interrupted by Avocado some 90 seconds after that.  I'll try
> to reproduce it and debug.

Oh, there was 2 errors... I just looked at the first one. Thanks for
being cautious with the test logs :)

Thomas / Alex, what do you suggest we do with the test_or1k_sim
timeouting? This is not the first time:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg781695.html

> 
>> (see
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg794416.html)
>>
>>
> 
> Avocado 87.0 does fix the issue you referenced here though.
> 
> Regards,
> - Cleber.
> 


