Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E7B33DE47
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 20:57:45 +0100 (CET)
Received: from localhost ([::1]:38480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMFp2-0006Jz-Lr
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 15:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMEcU-0005uP-Lo
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 14:40:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMEcN-0000p8-SI
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 14:40:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615920032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YiAMnQrX8wzeSxkCUUTHBJN73l+AJ2DKgynQRCTjfpY=;
 b=bxw186pFtqOevTPR0H9gf0DoicrNvY8X3YDAdTxBC7dL2vrYj6tNjJPGZrxDEZGJCQPC27
 WfjYPHkiY7iz0zzsLgNt2HM4JyJxv6lIHg36o91Jayn6u7slFebQ76atYtYVdk602NisEx
 QmBri6wcDti++T44Q7ZBMZxty8F9F2k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-IaKN-AkHNF62Ton1QX6Jng-1; Tue, 16 Mar 2021 14:40:31 -0400
X-MC-Unique: IaKN-AkHNF62Ton1QX6Jng-1
Received: by mail-wm1-f72.google.com with SMTP id a3so3514286wmm.0
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 11:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YiAMnQrX8wzeSxkCUUTHBJN73l+AJ2DKgynQRCTjfpY=;
 b=gY5lics+AojTm88UhFTIhHQAW3KWajZl2qy0p4spLS5fiFqcLPxzUobgArO0R1S4Lq
 KgJ3Vjs+BH+qXJn0ghI01Xu0QdIe8crqp//HalShODlavcyKISnUhcVHWO0/gEl9o4cG
 zs4jPGmnF5BFlNcHVlbNyZr42xJhWwK3Gbwf0oZOm+p9usbnFlbveyR5TfFAIh9RVMNE
 VqEZHRzOhoxg7B35YwGu3qyNHsmhcvWOFgZJdKrsB4GGlC0TwWeGTvfFzCfCIm7cKTIn
 pny8E8AXHTOqgenx5L88H3M8cCrw6it7PN83eTLL+R2OKbOEwYvpBFFcyDbS9f605hWT
 jsOQ==
X-Gm-Message-State: AOAM532v8+TfB5Qis60mBvxFrKjVo2cSN/5HuGQLE6vbzOd1o3pUbxU5
 JyKwGYIj88jvwkPI4yK40oaiiXDJnFaZacpFc/jBqmRPbIl9TlIyi+Y4L/UIVGk31EuGn2zIPsF
 fpjEHlKcWIgOsbla1ZD0VPlF3N4yQPbFMeCEs7IUgKMXCKr6e4aFBtHk1dDIFMOA6
X-Received: by 2002:a5d:4281:: with SMTP id k1mr418516wrq.374.1615920029926;
 Tue, 16 Mar 2021 11:40:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/GGTIjP1IdWSntBH98M5nOtb9/0JTf9WMlRmu3da3+CELJswEzOVbaavsHJh/MyEesP0KpQ==
X-Received: by 2002:a5d:4281:: with SMTP id k1mr418489wrq.374.1615920029619;
 Tue, 16 Mar 2021 11:40:29 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id m9sm22780436wro.52.2021.03.16.11.40.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 11:40:29 -0700 (PDT)
Subject: Re: Half a usb-redir idea
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, berrange@redhat.com,
 kraxel@redhat.com, victortoso@redhat.com
References: <YFDo/oHikOEcXFcg@work-vm>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <630f4307-20ed-8834-4df9-ed90c22ee018@redhat.com>
Date: Tue, 16 Mar 2021 19:40:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YFDo/oHikOEcXFcg@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 6:21 PM, Dr. David Alan Gilbert wrote:
> Hi,
>   I've got a half-baked idea, which I thought might be worth mentioning.
> 
> How hard would it be to give qemu a usbredir server rather than client?
> It would have nothing guest visible but would look logically like the
> front (?) half of a usb interface; then you could use all of the
> existing qemu emulated and passthrough device code, to build a usb
> hierarchy and present it to a remote qemu.
> 
> You'd get the ability to do emulated USB CDROM/storage, audio, network
> and the glue for host USB connection (and smart cards??) - all in one
> client that you can then use for connecting to a remote qemu.
> 
> The next step of that is to make something analogous to a
> qemu-storage-daemon, but for USB, so you have something that can
> do all that USB stuff without actually having any processors.
> 
> The even crazier step would then be to add a VNC client, and then you
> have an almost complete remote client.

Similarly to the out-of-process feature (on the same host)?
Are you also interested in remote use (different host)?

What about DMA accesses?


