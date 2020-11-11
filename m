Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7902AEFE9
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 12:46:26 +0100 (CET)
Received: from localhost ([::1]:53476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcoa1-0000mb-Aw
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 06:46:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcoYn-0008Vj-Po
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 06:45:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcoYj-0006wm-Sn
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 06:45:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605095104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IHRAtIIPs7kN5WzEHDBbSeXh6MYv/jqHbxngpOOp5JQ=;
 b=RcFl6VRv52Hi3lPQZvIbJaJSQcaH2S1JTDG/+9yVx63w42TiyRQeT6H0h6HL5jIozF+FYm
 3c4uvurqr/+3dKkT3FuoD2WQdrubIyV5q9wqATBld3gnJo5v1tEAzFV/mUdHE3eW5RcAwI
 vzaS1UPAOMaAWwFdVYtzaL2K8vfU/FU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-vXENIoQKPo2Kf6GCPoS9Vg-1; Wed, 11 Nov 2020 06:45:02 -0500
X-MC-Unique: vXENIoQKPo2Kf6GCPoS9Vg-1
Received: by mail-wm1-f70.google.com with SMTP id o19so802665wme.2
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 03:45:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IHRAtIIPs7kN5WzEHDBbSeXh6MYv/jqHbxngpOOp5JQ=;
 b=TIi3FaIYKwPe+AL/za6ekyUhz0nB9XPQDYSYHw5LnqGV/MMiWE7gPdW2grj4zlm4Zq
 whpJWZpSk7AZtT9lb3BC/is65huNqbk/cZyRRJacEHmgqhCPmkH5EeszVDySsX5gxUWc
 Mgw/1TlwU/4h2O0iEMvE9UoftYDUP/KogeFX1tnt6NRQrVH4PPlQpmlPA1s1QPywr68D
 mqBuuKh+lhp0ZifnFRuP4ao5gDIZkfwzpal2nZ9Am7obo4AR1iP717jjS2iPWh2wLpow
 egDnLgdTEQ8XAgR5FQNSP2r2jFu0G085XdzPm+4rQ7KqU5CoQjNZMt+Omq03slpeu2VB
 9TZg==
X-Gm-Message-State: AOAM533mlowGc5LA6Q82wkwEGXJ3dtQdcgPaMDdw+1tGMbUQNHKcsX8u
 Kv4t+GKqDYYQ3UvCSEZSPavAwsS+YXrx7O1LE24Jb4RA4s9Qa6MgUVtlIXldYEg2UNsYjnMxU/Y
 LY18uZBbH5cPoanA=
X-Received: by 2002:adf:e945:: with SMTP id m5mr18934494wrn.98.1605095100607; 
 Wed, 11 Nov 2020 03:45:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxByeAc+iN0W03kX014v1MAk5QU01yK0Kih5rP+1If2Dj1NW0bl4GyOwKX2b0C3H33y82vHKA==
X-Received: by 2002:adf:e945:: with SMTP id m5mr18934468wrn.98.1605095100413; 
 Wed, 11 Nov 2020 03:45:00 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id d134sm2291869wmd.8.2020.11.11.03.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 03:44:59 -0800 (PST)
Subject: Re: [PATCH 1/3] meson: move vhost_user_blk_server to meson.build
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20201110171121.1265142-1-stefanha@redhat.com>
 <20201110171121.1265142-2-stefanha@redhat.com>
 <ad4be626-c950-6131-adc3-369f9a405ad4@redhat.com>
Message-ID: <d064bee7-7a46-761b-97e2-71df8fba6bab@redhat.com>
Date: Wed, 11 Nov 2020 12:44:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <ad4be626-c950-6131-adc3-369f9a405ad4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/20 10:41 AM, Philippe Mathieu-Daudé wrote:
> On 11/10/20 6:11 PM, Stefan Hajnoczi wrote:
>> The --enable/disable-vhost-user-blk-server options were implemented in
>> ./configure. There has been confusion about them and part of the problem
>> is that the shell syntax used for setting the default value is not easy
>> to read. Move the option over to meson where the conditions are easier
>> to understand:
>>
>>   have_vhost_user_blk_server = (targetos == 'linux')
>>
>>   if get_option('vhost_user_blk_server').enabled()
>>       if targetos != 'linux'
>>           error('vhost_user_blk_server requires linux')
>>       endif
>>   elif get_option('vhost_user_blk_server').disabled() or not have_system
>>       have_vhost_user_blk_server = false
>>   endif
> 
> Something is odd:
> 
> $ ../configure --disable-system --enable-vhost-user-blk-server

I failed when pasting, this misses '--disable-tools' to make sense.

We define in meson.build:

  have_block = have_system or have_tools

Maybe this is the one you want instead of have_system?

> $ make
> 
> -> no binary.
> 
> Anyhow:
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
>>
>> This patch does not change behavior.
>>
>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>  meson_options.txt        |  2 ++
>>  configure                | 16 ++++------------
>>  meson.build              | 12 ++++++++++++
>>  block/export/meson.build |  5 ++++-
>>  4 files changed, 22 insertions(+), 13 deletions(-)


