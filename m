Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A55213F06B3
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 16:28:52 +0200 (CEST)
Received: from localhost ([::1]:34416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGMYl-0005Xc-Ob
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 10:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGMXO-0003kd-TJ
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 10:27:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGMXN-0005il-Ec
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 10:27:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629296844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HFfiDjTiKMEmLQuhTRonDNlhQ1bFIu9+tliWyMqVqkA=;
 b=XivnGQqeEESzFfBCccK51EwQQiW11bJlzAfkLLbbUlYqBQYJtc75vZaE5Biefivg2HuzOh
 dMc4LNT/z5MDIN7VQsGKbz7XGEmwCY3vIBBkGhESJ+XqcvuRRF9lQBT81tNsXY89DGYU9A
 GoeHh/FUu9K3HFbJG3vn4lKwCLsg6bI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-Ik8pH5dRM2q0ehR9VnVP3w-1; Wed, 18 Aug 2021 10:27:23 -0400
X-MC-Unique: Ik8pH5dRM2q0ehR9VnVP3w-1
Received: by mail-wr1-f71.google.com with SMTP id
 l1-20020adff481000000b00156e670a09dso658183wro.1
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 07:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HFfiDjTiKMEmLQuhTRonDNlhQ1bFIu9+tliWyMqVqkA=;
 b=IXNim76hP+HnfUrSlLmkMB5e8WpmdUlZAi0LcAX2RSyg0Nyg+ErVccdNH51rUTlvHs
 K+LckJu9QhXnN2e3qLZVWfeyNAfwZI/dfdGLVlU5zy/dXnqqIZYbXXVFrislVl4UTG+6
 /59+42naEcUoFe8W5wA7akIdmJvPhl0vqF2eJmMknt0IDyNyOb0oT+zeahkvlpx6fhdr
 1Ygv2Yu5oniHGu8fTyCtJKazHfcwtyC+QoOdWEa5nG3v8n97Xh57e5gd60UYr3pQj8qM
 zpmnGKAJYf/ncG1w1lp+tsSPd/1C58KsR257G0PhmunDYXU7KHJKzLyd+1nCfRqFpVWQ
 I33w==
X-Gm-Message-State: AOAM530U7JJ+vkz6+UT4CIYjBGXX9mA/mFvihBmlcCCX2NUJq2KbGsPq
 A3Nujf4ymufSj6Z5qypq61RDeo3tffRVhwlNU40wQxe1vYT5k20MNDUPcE3LFjbb7/kdTlsVcLC
 B1wTzGg1csQJcejY=
X-Received: by 2002:adf:e702:: with SMTP id c2mr10866239wrm.397.1629296842276; 
 Wed, 18 Aug 2021 07:27:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjron0E9xqNfdJw5BarYquHDJjs4YoWua3dm0UEoJAk77s0uF7RZaT3+RJcrYEQY5tL9ltMA==
X-Received: by 2002:adf:e702:: with SMTP id c2mr10866216wrm.397.1629296842030; 
 Wed, 18 Aug 2021 07:27:22 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id p6sm6283065wrw.50.2021.08.18.07.27.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 07:27:21 -0700 (PDT)
Subject: Re: [PATCH, trivial, for-6.1] kvm: spelling: mininum=>minimum
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <20210818141154.417591-1-mjt@msgid.tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <692136b3-8890-0321-583f-a57c87b5451c@redhat.com>
Date: Wed, 18 Aug 2021 16:27:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818141154.417591-1-mjt@msgid.tls.msk.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.961, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-trivial@nongun.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 4:11 PM, Michael Tokarev wrote:
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  accel/kvm/kvm-all.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

IIUC 6.1 is closed now.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


