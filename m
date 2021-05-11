Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DC937A6B8
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 14:31:08 +0200 (CEST)
Received: from localhost ([::1]:43190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgRXS-0005rU-3U
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 08:31:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgRUj-00044g-4q
 for qemu-devel@nongnu.org; Tue, 11 May 2021 08:28:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgRUd-0005Us-1B
 for qemu-devel@nongnu.org; Tue, 11 May 2021 08:28:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620736085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IuRhTXXxrE3JcV67/Jq1mR6qQ/jrv2n8vOd9Kl/M7GE=;
 b=HqrWbJacErmXAgGUBtCXLnCVX18HKq58M7EVRgKHjEBO4K+bg+Q8DmpDRcjR4mnSVvLUyt
 OhrDHkDlXKSE95rAfleAzwG78mbO8Guh6T+SXfdx7QdMwixlyuSE4op9yRADXeNFosfa+O
 RJfcA+KozDQz5Tkd2KtBbtAXaIGDpyk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-wce-1rUoOkiR-vtDXQm8bA-1; Tue, 11 May 2021 08:28:03 -0400
X-MC-Unique: wce-1rUoOkiR-vtDXQm8bA-1
Received: by mail-ej1-f72.google.com with SMTP id
 h9-20020a1709063c09b0290393e97fec0fso5883440ejg.13
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IuRhTXXxrE3JcV67/Jq1mR6qQ/jrv2n8vOd9Kl/M7GE=;
 b=TVJdCBuqIRX0qCyE4uBBqD1WNNb+kkLrUjjCzArWCHPjj5q4UusYn96i3PEWoLXl+B
 N8lcopnKrGMybGCReqh0ZP0yRJhTSpwA777nwjMKPT3lAqm2dniPkCMI2KfoDHII/JcQ
 WsLUUQocpivu2haiAndt/RjRrRyZ5W++rc+uX78XxLT3uEmX6LScjOIiCqgqHL9ZuKJO
 kiDuhvd03+bOwUuQuEYWj3olDPRPKzJ5YLbl+ZxrvNzyA2mJn2YjkV16QY9O7mbHuiTd
 LUNGgd+QRSvrqdr1hbWq1yRNqjNU93NGwvPuTt1o51jjlR2bFl2LlA/a3GdbPE5FgFhg
 nHpQ==
X-Gm-Message-State: AOAM531OtSWEU+62smN+Y1cjEb1S9qyC+h2+cqTWyGn/43n783ujdYfh
 SWeDZquIDQr5MhF3Z46eSt55kB5mLXYz0I+f27Yih+DZn7abuU92yE6LDJcgFsf/2qkPwtEol8T
 HIVDQHhMIIoNyQxTD7rkL6swZ9XKzhDZ7gMQgMGoShZTVdkqGGSyYebF4YcWbgzkzYW4=
X-Received: by 2002:a17:907:2cc1:: with SMTP id
 hg1mr32112304ejc.453.1620736082477; 
 Tue, 11 May 2021 05:28:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLE/dIbUM7zt2CeSTsgIquU9h4YJWNd5w3gG+Qkr3/bDQvrzX/N2xk096Gfz975qF7NG8r/g==
X-Received: by 2002:a17:907:2cc1:: with SMTP id
 hg1mr32112272ejc.453.1620736082246; 
 Tue, 11 May 2021 05:28:02 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e19sm13915938edv.10.2021.05.11.05.28.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 05:28:01 -0700 (PDT)
Subject: Re: [PATCH 4/6] progressmeter: protect with a mutex
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210510085941.22769-1-eesposit@redhat.com>
 <20210510085941.22769-5-eesposit@redhat.com>
 <946e8544-8183-25b4-6a6a-17eed8c1b009@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a8785afb-a7a3-0100-5c46-32914a273b63@redhat.com>
Date: Tue, 11 May 2021 14:28:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <946e8544-8183-25b4-6a6a-17eed8c1b009@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/05/21 13:28, Vladimir Sementsov-Ogievskiy wrote:
> 
> 
> Could we instead add a c file and add the structure private? Then we'll 
> have progress_new() and progress_free() APIs instead.
> 
> This way, it would be a lot simpler to control that nobady use structure 
> fields directly.

I don't know...  I prefer embedding structs to heap allocation.

Paolo


