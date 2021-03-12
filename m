Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 888183396A4
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:33:41 +0100 (CET)
Received: from localhost ([::1]:58602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmbU-00025I-I3
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKlck-0006jq-LX
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:30:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKlch-0003Dp-Qw
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:30:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615570251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ovDyMW9fO9AklYz0RMqN8T2fWW/Ev7qRgUshFTv/jdE=;
 b=gilwUZDxRjNmIxz3EfRnp99qIRGQPNGFFVi6SM8a0e5NmEeEXG8hNQO9iwkF7ki8KP3HlN
 am/DNy6/hOxd6kGg9MKNLDSy6bKgIOMvwc0YKkuhDh0OQ7POQSNJS3+Eis257WLivVHudX
 D4MI3oFABFjkYkxx38QMTF3YmVRABqU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-BWVFSQ1jMEylTpBWced0Yw-1; Fri, 12 Mar 2021 12:30:49 -0500
X-MC-Unique: BWVFSQ1jMEylTpBWced0Yw-1
Received: by mail-wr1-f71.google.com with SMTP id h21so11360954wrc.19
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 09:30:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ovDyMW9fO9AklYz0RMqN8T2fWW/Ev7qRgUshFTv/jdE=;
 b=N5xQzrXT0ZvgHuuiXSGm3OOS7A+Zab3z0+OH9t92WQfBDcd2KyZj8Lu9V9kZHxyT0G
 MBc0eFXQcZycLJKoEYHpdGb09dM+kMX7SNIYGkXSMSxTjselBcIIh5K7R6M8MMfR8x9W
 wwem/bW6oDqJwzJMxUB9barLY1XnGe/cUyEChqLRUrEtO5XKrF4StI1Kn1rLGNOBwPRt
 gK5fy6FN6PUq90eKg3sUFMepvf4n2rCGLut2SONDcUKMQUPB+iYVcYCWc87UYLtc1JJR
 6zqwpT54xf9aMUEZ6pOEfnQQ8vu+ZS1JhgOS8Xh61a1aLtBg7au1diHOsfSsGxJrw1KM
 ovvA==
X-Gm-Message-State: AOAM531JeK7a532mYyQM6Ji9bUPLCJg9Y5ghMlbKKVKwHx+ddtj3lJDr
 kjSf2oP6SPvAJ4JLEdpyrQpvaV3oNKlnAJWvLC/HdTi2jaiJYXWxnse4teRYkZ/G04xdkzHrWKD
 Th8yceSGnv5BWUpWq0eTsxiqrmF/xp5M9Ps01XEP4RPUMfS9kErEijsf9gtdZDWa8juU=
X-Received: by 2002:a1c:6441:: with SMTP id y62mr14110274wmb.97.1615570248196; 
 Fri, 12 Mar 2021 09:30:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHRNwQmhr0JWJ0XreyifbS9H+We9OoPqAIThFhIYJF/SioJsR81t2qCiU3G8gD6NIOIsmSRw==
X-Received: by 2002:a1c:6441:: with SMTP id y62mr14110254wmb.97.1615570248044; 
 Fri, 12 Mar 2021 09:30:48 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l8sm8857956wrx.83.2021.03.12.09.30.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 09:30:47 -0800 (PST)
Subject: Re: all class init functions for all types in QEMU are called in
 select_machine(). Expected?
To: Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <bdc8dbaf-8d63-833a-3e57-7e823a321486@suse.de>
 <a81c0a8d-af3c-4b40-bcb4-9b120b5eee93@redhat.com>
 <ec7f83ae-8529-3a0e-4b00-73c856b28a3e@suse.de>
 <be88d88a-dd9d-547d-9f3d-7444f0f8bbc6@redhat.com>
 <3b7c6a4e-c191-063c-affa-0e179227a633@suse.de>
 <26c2b88b-4c9e-09a0-a1c0-350a01e9a697@redhat.com>
 <d66078f1-9fa0-c3ed-d54c-3d3ada2027e5@suse.de>
 <683d1ccc-503d-3218-2539-a3ed48fee5fb@redhat.com>
 <8ca3a983-05ad-a0de-31e9-65b6c41a2b4c@suse.de>
 <6f2e5a50-c548-28c5-1ce0-e583bf90eaf1@redhat.com>
 <e0c5eeaa-55f5-80e6-5cac-9717159f3903@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a142a040-e233-6ed1-c0b6-3ab436ea038a@redhat.com>
Date: Fri, 12 Mar 2021 18:30:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <e0c5eeaa-55f5-80e6-5cac-9717159f3903@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/03/21 18:24, Claudio Fontana wrote:
> Ah, just saw this. I already sent the series, but we can rework and rethink this.

No big deal; since you have the assertion it's okay as you posted, too.

Paolo


