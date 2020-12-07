Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F2A2D1164
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 14:08:25 +0100 (CET)
Received: from localhost ([::1]:43386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmGFc-0007tl-MP
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 08:08:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmF5W-0005hA-TJ
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:53:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmF5S-0003f0-To
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:53:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607342027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pK34Mufff0UuFhbPdJo6BSdAiF64LvPpzX7RBP2Agrs=;
 b=ijn9u9cFMfDQt/WbPMcnmggrIqhhPHfkLGh2Ge87f3w8uG5Y4kMjzEVN3Yr60Z9kbT1060
 v7Crdr4zhoZMrsbs9rm0sz+vgZqfHV2oe/y6aM1BSF0nx0LKSTlqqOE7+f++Qz+FCeHGQM
 BZOzLSnN6vEyNscX5bGPkcYFUJSgwkc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-N1QpMN55PDe4g8IDFH8KeA-1; Mon, 07 Dec 2020 06:53:45 -0500
X-MC-Unique: N1QpMN55PDe4g8IDFH8KeA-1
Received: by mail-wr1-f69.google.com with SMTP id p16so4784512wrx.4
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 03:53:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pK34Mufff0UuFhbPdJo6BSdAiF64LvPpzX7RBP2Agrs=;
 b=Uuh1G6yNpMBtOcNIjjy9N3UGoG4hvGJtU2XAHdtTtSOOwbp2V3su9Pa7ev1UOx1wGd
 Ag7es95vMX8zoAJ6kGnTcp88FVWHMumqR+0NsEE+6Z3jDIp5tIseByPNAgiznzooYhmJ
 kPMAl50XcUk9Imb9qrUecW3nk8Ln4vRvgfLwjo7KwISqVOyJ+fWoDKTEwq5ANK4qjSkm
 rAW0frDwlWWYQu5T+NYZFxTgocqzSVmsGmx71ZXKrGJgk52B4nMlcF4b5+uYuYpK678d
 b1BvxYYmGaJmxhWNxJR8us4P3BEI9qHCJ+yoXpzQm9zP3sL1RDzGP+4uCNmu7E+QcGIy
 2b7w==
X-Gm-Message-State: AOAM530m4/8WTMLmAS/NjuEls4z9fYYxonIaNcSlYIDDdUmGMVWmbC3J
 ru+dKigD0UrTYaZoFRqp6l/Uo49KIt3RXwdq9SBv/pZy4y/YeXqxgSQzCRBvwG1mvVgpGbjV7EM
 bgM1dxpFjZk3IkUP8DmJz7K6f4x7tlv8hCyoL0YzFN8i/YPfyfII47GzjupMr/Jh6
X-Received: by 2002:adf:e98c:: with SMTP id h12mr5342018wrm.75.1607342023909; 
 Mon, 07 Dec 2020 03:53:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz62qeLliHH4Z2gQKg13FBgou9vWF47maRNJzicIXJRkrgGIgBWaq1STxaihvVH8Zj1vc+55g==
X-Received: by 2002:adf:e98c:: with SMTP id h12mr5341996wrm.75.1607342023612; 
 Mon, 07 Dec 2020 03:53:43 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id h14sm13430713wrx.37.2020.12.07.03.53.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 03:53:42 -0800 (PST)
Subject: Re: Why do we have both CONFIG_SOFTMMU and CONFIG_USER_ONLY?
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
References: <5176c935-2df0-e300-b1cf-67c7014e5d73@suse.de>
 <03bdd8fe-53cf-e2d9-cdc8-fd1a22b49941@redhat.com>
 <4009cae8-2b88-8a54-48f3-11ae561e6a23@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <91c6795b-9584-3d09-ad27-9d3e8eb91670@redhat.com>
Date: Mon, 7 Dec 2020 12:53:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <4009cae8-2b88-8a54-48f3-11ae561e6a23@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/20 12:27 PM, Claudio Fontana wrote:
> On 12/7/20 12:26 PM, Paolo Bonzini wrote:
>> On 07/12/20 12:19, Claudio Fontana wrote:
>>> As in Subject,
>>>
>>> am I understanding correctly that the one or the other is redundant?
>>>
>>> Should we keep only one of them?

CONFIG_SOFTMMU is poisoned while CONFIG_USER_ONLY isn't.
I doubt this is a design decision, probably an unfinished
transition? Anyhow we ended using CONFIG_USER_ONLY where
CONFIG_SOFTMMU triggers a poisoned error.

>>
>> In the code it's not strictly necessary.  However in both Makefiles and 
>> meson.build it made/makes things a bit clearer.
>>
>> Paolo
>>
> 
> K.. thanks a lot, maybe we should document all of this stuff in docs/devel/...
> 
> Ciao,
> 
> Claudio
> 


