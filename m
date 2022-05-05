Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 019AD51BD5A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 12:38:55 +0200 (CEST)
Received: from localhost ([::1]:49010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmYso-0001pM-27
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 06:38:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmXnA-0002Q4-Tp
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:29:00 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:23357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmXn9-0008WU-DP
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:29:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651742938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/HnFy47mGtJXtGfmvVgZZDTcJGu2bgR6HU+Xgm5sp1c=;
 b=TOGAjlpKs8Sb+Po1/Yv9WTvy0Z6eu0bsRq5joFncSn4/ZXAOIRYsRAMCk6DL9NH7L9lB6n
 Ndl84SvvdTpU39+0Jg0l3OJ3cc51gPn3ceWiX3SKhneXS7VDA/wRO2RBnccMVlj7RFyln1
 GUVOUqnHx/+GFY2WMyJoguWjYyhuPuE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-ox_Y_kF0N3yft2ibcdXZIg-1; Thu, 05 May 2022 05:28:57 -0400
X-MC-Unique: ox_Y_kF0N3yft2ibcdXZIg-1
Received: by mail-ed1-f71.google.com with SMTP id
 b65-20020a509f47000000b00427b34634d3so1992776edf.20
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 02:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=/HnFy47mGtJXtGfmvVgZZDTcJGu2bgR6HU+Xgm5sp1c=;
 b=CqpCiCoEpCh4TIqZGqyf2+maEj3rLQYxYbEF4O4eSHv0uRGH+4In9DgiC++2mV4xNE
 zSirT+cjiZTXHObaBSDR+t/0gXX7VbbDzKwriJbi0Uw9D3Nl+nAKDJJ9cFjsdQuHD4yM
 ofkrX5n/zqLs1EpQHxcUDiIpE75Wn/Pnb25+PbCzfy/RdTiEuN4t8dfp3AlIBrGxwzbf
 CK+ZHNVv9az0PrCJKrPv0FT6OLkRwyy6VApMSBL1lPqCxxERj1o43X0zKf8e8th5IaVV
 xEQ+K4pb4afo/p4k0i1vY4DdNDa6b1lxC0dewjU95qDd7yjswfxi9bq6pkpw1kFJe1PH
 LF9A==
X-Gm-Message-State: AOAM531qCid6+0FMXpjRkjO1f7oZSv7dQlBje5NvfFv95M4RUcEDJCK3
 ZlXIRHIEQ78xG8ki0Lealel5FBUcR+7m8IKJBApwcLF7mVXkG+uGpFtuYlQ3Qsc7vAcmjtxswWj
 5LXxh3loIF7HgwnI=
X-Received: by 2002:a17:907:1c8e:b0:6f4:e24f:20e0 with SMTP id
 nb14-20020a1709071c8e00b006f4e24f20e0mr4249444ejc.227.1651742936114; 
 Thu, 05 May 2022 02:28:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjdbyw/mPWuue8LLl1y3pZbF4uHTKxiQls0btt6bEI0W9KlHeQEuWt7fRUdrP9IZEDcixmSg==
X-Received: by 2002:a17:907:1c8e:b0:6f4:e24f:20e0 with SMTP id
 nb14-20020a1709071c8e00b006f4e24f20e0mr4249421ejc.227.1651742935851; 
 Thu, 05 May 2022 02:28:55 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 w12-20020a50f10c000000b0042617ba63c4sm558796edl.78.2022.05.05.02.28.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 02:28:55 -0700 (PDT)
Message-ID: <6f3c3414-f837-85c9-b401-d856f091ddf4@redhat.com>
Date: Thu, 5 May 2022 11:28:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>
Cc: Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Cleber Rosa <crosa@redhat.com>
References: <CAFn=p-ZCF0VU=xrcbCnqmVvEndsMgiFSZOZv_Orm2EdX-Yk--A@mail.gmail.com>
 <YnOQAP1J94zH1pEK@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: iotests and python dependencies
In-Reply-To: <YnOQAP1J94zH1pEK@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.74; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/22 10:51, Kevin Wolf wrote:
> If not, I guess it would be enough if iotests just checks that the venv
> exists and all of the dependencies are there in the right version and
> error out if not, telling the user to run 'make check-venv'.
> 
> Or actually, it could just unconditionally run 'make check-venv' by
> itself, which is probably easier to implement than checking the
> dependencies and more convenient for the user, too.

Note that you would still have to add a 'check-block: check-venv' 
dependency in the Makefile, otherwise two "instances" of check-venv 
could run in parallel.

One small complication is that on BSD systems the binary is actually 
called "gmake", so you'd have to pass the variable somehow

Paolo


