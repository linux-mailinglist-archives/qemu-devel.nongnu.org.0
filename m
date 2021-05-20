Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D367389F16
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 09:45:05 +0200 (CEST)
Received: from localhost ([::1]:35242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljdMd-0000Az-Ur
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 03:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ljdLA-0007T8-Nb
 for qemu-devel@nongnu.org; Thu, 20 May 2021 03:43:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ljdL9-0006tG-2N
 for qemu-devel@nongnu.org; Thu, 20 May 2021 03:43:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621496610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cYWXewH6Frsl7Xtzx3EcHLkDHFzuWjHUXmChwb5RF1w=;
 b=XfhoQkBNUinLuz4sBRuc9wihqwfu8IRfxHxlt6TEjQqwGujVWEueRkqxL7FJlu2xFfN0sz
 lXfGDfG5OUPU8sjxamteuCVmVv0QLD9SBuIV3gwFYQ5K3W6TNW5Y6fwdpLYumgxEivu2lO
 P6ltqTW3T9aTscHcO97PBBkdizyPeoQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-jmwvz0qyM1mQBwC8rteKZw-1; Thu, 20 May 2021 03:43:29 -0400
X-MC-Unique: jmwvz0qyM1mQBwC8rteKZw-1
Received: by mail-ej1-f72.google.com with SMTP id
 m18-20020a1709062352b02903d2d831f9baso4612451eja.20
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 00:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cYWXewH6Frsl7Xtzx3EcHLkDHFzuWjHUXmChwb5RF1w=;
 b=fLULYY5nm4B9CRRNPjx7U04lm0xjO2iahBaI7TI3Tf5u4WuQ1G8Y3wJP2zARUSIRqO
 +gxQ+CEslCj+3TSH7W1fRcOBwvYjLvJ/+OscFvj8WqpWsQnbjlHe7TbrnMvBLKIDcjai
 ETnKAGkB2tazjglxdLBj2Y/8HPNbUTTiM4FXrx9VhXhcGXf/0Z5u4SdQBfzP64WzFYR3
 DRjep9jaUQDQF2huo/8X4zYFVxXaULYJiv1ehTPQfogoJ1VGjmYqk7d2lchajgMZlqHU
 1dGhwSGI88mXys+JeE5VZgwfsQmIpyRZfyhqb0QzV4DwS+3rk4fYYYQ7NH5hsosxOGA2
 C8Nw==
X-Gm-Message-State: AOAM531lKopSF1JlQjPHs6M1WVk1dwEuBnbc2S6yPrATDl/z7DksTr74
 qrdz0+a02lJIC1oAjT77Cj6IB8MfaxYnUw78NsLaVd43FM99c5jVLJXhy+wKHGk4hlEiBZ9V40u
 ugJWT69pn5DIuLnJsndJ0Q9QgfnLgnDwT7DVjMJV1sk6aLn6DtUkzwVTeBkyYwpatGro=
X-Received: by 2002:a17:907:78c5:: with SMTP id
 kv5mr3363199ejc.146.1621496607697; 
 Thu, 20 May 2021 00:43:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWEE02CdpFvb0iKiKyLY44cNP8XhdkBjHBolXgucA/k1f2jy2pswYzorOWP/nsTf9eSu9hmA==
X-Received: by 2002:a17:907:78c5:: with SMTP id
 kv5mr3363180ejc.146.1621496607478; 
 Thu, 20 May 2021 00:43:27 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m16sm1037154edq.56.2021.05.20.00.43.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 00:43:26 -0700 (PDT)
Subject: Re: [PULL 00/10] Gitlab-CI, qtest, moxie removal and misc patches
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210503104456.1036472-1-thuth@redhat.com>
 <CAFEAcA8k1DnOFT+5pjQ4ytene3asVDKB7TUOZgGhucTp_ypz2g@mail.gmail.com>
 <66206f67-f3c8-eb1c-fd5d-8c7555fe5316@redhat.com>
 <CAFEAcA_9o+h29L1Y0BVFhg9JbQbo6A=MgGwCaH_=vt3OhcERBw@mail.gmail.com>
 <c748372a-d585-7777-9dda-9faf33e97e30@redhat.com>
 <d5bf0064-052e-a0c7-cc17-72db815949e2@redhat.com>
 <b2a28a69-2525-b07e-bec8-65d7439f1154@redhat.com>
 <11382e1f-4ab9-6f04-6c53-938bd50a1e78@redhat.com>
 <9840231d-9b5b-a61e-fd8c-098c1a9a7596@redhat.com>
 <75e088da-b815-8f97-acf2-1743205967f5@redhat.com>
 <3b1e8f37-7d38-1450-b288-c23c2d14b90a@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <924f165c-369e-7f52-7287-fc7211c6abbf@redhat.com>
Date: Thu, 20 May 2021 09:43:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <3b1e8f37-7d38-1450-b288-c23c2d14b90a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/05/21 07:08, Thomas Huth wrote:
>> OK... Not sure how to detect it from ninja then.
> 
> Every time you pull, there could be changes to the "configure" script 
> which affect the build ... I guess you also won't notice those when 
> you're only compiling with ninja? Thus at least after pulling from 
> upstream, I think you have to type "make" once at least.

Yes, and using "ninja" directly is not supported.

Paolo


