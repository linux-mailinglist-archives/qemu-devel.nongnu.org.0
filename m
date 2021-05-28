Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5273941A4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 13:06:27 +0200 (CEST)
Received: from localhost ([::1]:34220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmaJu-00018O-4Q
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 07:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lmaIp-0000Mj-Et
 for qemu-devel@nongnu.org; Fri, 28 May 2021 07:05:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lmaIl-0006Ye-KT
 for qemu-devel@nongnu.org; Fri, 28 May 2021 07:05:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622199914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9lth/QPvyLgg9wyEzNDu+kC3+uEMLb4Cef1EgL4KB1U=;
 b=eyRxANnv0CUyyd1AmTtezbDZ3Civ77iAZPuio49WRB0eNQH6ripxc5KxFgX5xPqWkCZ0Go
 GNdb+HCoXPhJCjicY/7S00gZ+tGCbyMVBs6OP+wUc4TLhMW1IiUQn1ZlJfV5DmriITomYK
 O2QPXZovbVQwesgduIw6aQ4N7AUWVcQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-GEiPz0OdPnqOy1twCZ18xQ-1; Fri, 28 May 2021 07:05:11 -0400
X-MC-Unique: GEiPz0OdPnqOy1twCZ18xQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 m27-20020a056000025bb0290114d19822edso135517wrz.21
 for <qemu-devel@nongnu.org>; Fri, 28 May 2021 04:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9lth/QPvyLgg9wyEzNDu+kC3+uEMLb4Cef1EgL4KB1U=;
 b=tlS20p4xcUCGoYpnE8X7ks/7bCcm0+l4vYbEe6pwisxoQhXilAUHNSo7PSEF3ZKuC3
 WBU0XPE2ndaKl55siY3J2ovrD9SYvmOSqRAzSR3As8ghLbDs9oMIB6coMXCiQEwnK43w
 aGG/3ECJrS1yhUQJjeJcvRKCP6Y+H0yptUBplxS/KIOrF4GIU2C11jLoGAeueLdBzYfq
 i+V5nZzytcfAKquNTje7tNjSHMV41CV+nhOILdVToY6EZB0VwujhEt0s3LaegmS0ZTaq
 kzRZM7jxLKkHSZ8co+kdmTbzy3fuSJU3gx9N4dOI1f2BXp15sxWNngYhWh1HPQuwTzhU
 f2+g==
X-Gm-Message-State: AOAM530aJak28b9eDYTeFBFYqi6p5DUkKBBf723woYt854EL9c6gz5et
 VEWjQSehjfoTS/KrwMaVSk11eXGzN+r4eJILNO8Ubbf0TAk7L+QnpWPlSfO6x15IejJrflN0epW
 7nps6S8FoQje6Dzc=
X-Received: by 2002:a05:6000:144b:: with SMTP id
 v11mr8146983wrx.295.1622199910208; 
 Fri, 28 May 2021 04:05:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMuDgwbVwCr3W2gDnuITFyJdRT0uDs12OymZBTFWdvWNyVS5VGetpOj69AhwO16D64H/pE/g==
X-Received: by 2002:a05:6000:144b:: with SMTP id
 v11mr8146962wrx.295.1622199910007; 
 Fri, 28 May 2021 04:05:10 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id y2sm6815533wrl.92.2021.05.28.04.05.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 May 2021 04:05:09 -0700 (PDT)
Subject: Re: [PATCH v1 2/6] meson.build: fix cosmetics of compiler display
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210527160319.19834-1-alex.bennee@linaro.org>
 <20210527160319.19834-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9466e240-2523-d5c1-d92a-b16881064b16@redhat.com>
Date: Fri, 28 May 2021 13:05:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210527160319.19834-3-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/27/21 6:03 PM, Alex Bennée wrote:
> If you specify something like --cc="ccache gcc" on your configure line
> the summary output misses the rest of the cmd_array. Do some string
> joining to make it complete.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Tested-by: Thomas Huth <thuth@redhat.com>
> ---
>  meson.build | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


