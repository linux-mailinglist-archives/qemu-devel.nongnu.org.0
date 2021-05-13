Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AA337F4FC
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 11:44:31 +0200 (CEST)
Received: from localhost ([::1]:51940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh7tO-0000pK-R1
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 05:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lh7sU-0007td-Rv
 for qemu-devel@nongnu.org; Thu, 13 May 2021 05:43:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lh7sT-0007Lb-CX
 for qemu-devel@nongnu.org; Thu, 13 May 2021 05:43:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620899012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6OTbssaYNh9zZIAIxsrdHBsw/IvQ9Ch+D8LX97sVAZE=;
 b=a38E6fMkCu5mJGoaKWSrWh5vqNvf9V89A9eU5dozyuHrl3AoMqg2THHHQVu5qI2D0FO/YQ
 OGeTv8iOc39gs5jlAPckc6yIcZ/wbCieTi5EeqY1R82yxLnLCMOBJjn46bZSP5CcwdAsdh
 0qDm0GTImdKRJqcz657Um6vZORWtsRQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-HyE2oIN2Mpufso6jjcgBIQ-1; Thu, 13 May 2021 05:43:28 -0400
X-MC-Unique: HyE2oIN2Mpufso6jjcgBIQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 l185-20020a1c25c20000b029014b0624775eso675162wml.6
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 02:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6OTbssaYNh9zZIAIxsrdHBsw/IvQ9Ch+D8LX97sVAZE=;
 b=o6DXuPEeaL82GrFbgf8EKBywD/QElR9nuxDYSpOfz388PJ5W/uVRxw/aI+vIXS89Yt
 ZRP8rgOm/msU2wxS3zEyQt7XQMy+XnH0b3jQ2JH1xFBfrJYNsUuijYEj+1K8AboItbY2
 0STmHqhFgqcqw1U4+mK6mYsqChaNozrI3RfZ9zaLObWXYez2lrLrgri4a44bYe2rVBZ5
 Mq+cTL8cbm123eosIUwfcsvOmRh3gL7xVBqto4fRUkl934RnuH8Ro8l81XYVgOKpU6YW
 1nsKPK7jeMCNG6O7BDhUk0IcOAk5FXpuTYI61N4GK/lvy9QRWIt8OOb2MYDDZu/BNePD
 nlbQ==
X-Gm-Message-State: AOAM53051PKbJ8RKvZrg6AlGa2MYZscF6CUJ7j09MJ74E81y8kYjsqTu
 aD5EEGh/ZwSjird8UEpcBD/SpE1c08x1Bturf5kuhVrj+K6dGyNxc5Yt3nvXEOWfn8bZzxTJ0Cb
 QWycqikTCVDjUqHI=
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr48595211wrn.180.1620899006983; 
 Thu, 13 May 2021 02:43:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfr9q/KOqeXuiON/4SCvOaOxcGy2H18QeB0dewdNkCmRMHob+irM5VIR/rqd3GTjcwjGqXXw==
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr48595204wrn.180.1620899006868; 
 Thu, 13 May 2021 02:43:26 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id v12sm355890wru.73.2021.05.13.02.43.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 02:43:26 -0700 (PDT)
Subject: Re: [vhost-user] Expectations around reconnection
To: "Boeuf, Sebastien" <sebastien.boeuf@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <BY5PR11MB44014FC44FFAC6976FC89BC1EA539@BY5PR11MB4401.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6eded3ad-ea69-3d07-65ee-01d4ac7cf067@redhat.com>
Date: Thu, 13 May 2021 11:43:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <BY5PR11MB44014FC44FFAC6976FC89BC1EA539@BY5PR11MB4401.namprd11.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing few developers

On 5/11/21 3:33 PM, Boeuf, Sebastien wrote:
> Hi All,
> 
> In the context of vhost-user, I was wondering how a reconnection should
> be handled from the VMM perspective?
> 
> In particular, I'm looking at the OVS-DPDK use case using the client 
> mode (meaning QEMU acts as the server), and I'd like to understand what 
> QEMU does to handle this. Upon disconnection from the backend, does QEMU
>  reset the virtio device (meaning the guest
> is notified about it)? And upon the new connection from the backend, 
> does QEMU go through the whole vhost-user initialization once again 
> (feature acknowledgement, setup of vrings, etc...), or does it simply 
> assume the backend will have saved all these information?
> 
> Thanks for your time,
> Sebastien


