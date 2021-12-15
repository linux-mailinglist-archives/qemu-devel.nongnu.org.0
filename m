Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 500C24754E3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 10:11:31 +0100 (CET)
Received: from localhost ([::1]:47926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxQJt-0006NZ-WB
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 04:11:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mxQGg-0000Gz-4I
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 04:08:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1mxQGd-0006NI-Ht
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 04:08:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639559280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OUeYNA8OmDpyoA0nkGMB6wh/eAf+ymk5AgkOFs7ifL4=;
 b=MKdLUHhZqg8BEdc2iMOEKmCJHThtzHWctalIzfkKCu0dLhN2HspnzrcT1MeTd9B6Z9o+pG
 opwaXJ8DTL5/M1vKCNFkNSeiBig4ApEmF4Us8IT/CBgWBvImJUHXObnCGZRnJb9PotVlpK
 6JsHLtJwZtQGg48lGKq3fQ/IAGf6OgY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-yucFPJfDNcC-NHeUuY5pKg-1; Wed, 15 Dec 2021 04:07:59 -0500
X-MC-Unique: yucFPJfDNcC-NHeUuY5pKg-1
Received: by mail-wr1-f69.google.com with SMTP id
 q17-20020adfcd91000000b0017bcb12ad4fso5667948wrj.12
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 01:07:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OUeYNA8OmDpyoA0nkGMB6wh/eAf+ymk5AgkOFs7ifL4=;
 b=Spoua1k+NYq8seM3GsPJLTglBt3x8T3K9qvzspaKin8FQsIN71FQI2CdmP2oc6xg5N
 T4qbkkMuzin8dzD+ypoTePWtkvhbWNKdPC+PgOXi4K+XvleAPcih/mp/38k+IxEpzPOL
 utARNv6GiY0A0aOMRLL2tuNA5vEumBc9UXZj6y1Z7QexNJB/x3R74NEI7VWtc7OXD1k2
 fEwkM3sGGz0a5yTodETnULOoKZWV4UWbekDENbwAXTaus3izErwqmAfC5t4FF1ymQ+MZ
 PIyDhk4jstnloTmKcnDUeZi6SW0zbweEiZShqyjpwEeYRw9Oe9ZyuF/LVQyAIRAlnkXU
 mHiQ==
X-Gm-Message-State: AOAM531yNQAE1FU8o/924wovMEPVZplrUavstJmkj61LTqwUlcaD8Gn+
 irCgH31SsIEaxj5gQ4rqJjbxpBI0XZu3ehfjawnuuqM9oGtOhAZ69DgxrwstFcdDVkFpgi+ge9J
 yi9/qje0khWoYRxA=
X-Received: by 2002:a05:6000:154b:: with SMTP id
 11mr3478789wry.394.1639559278396; 
 Wed, 15 Dec 2021 01:07:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvXmr1kyZUKdkUNayRgm1rgn4SFRfG2D+/dOjcPPMB21fcsLiMKcUwR0Fdg/kwnJpoTbSt3g==
X-Received: by 2002:a05:6000:154b:: with SMTP id
 11mr3478774wry.394.1639559278232; 
 Wed, 15 Dec 2021 01:07:58 -0800 (PST)
Received: from [10.43.2.64] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id p12sm1604582wrr.10.2021.12.15.01.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 01:07:58 -0800 (PST)
Message-ID: <ed2e415f-8f95-7ee8-b45a-0648706e7d01@redhat.com>
Date: Wed, 15 Dec 2021 10:07:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] qemu-options: Remove the deprecated -no-quit option
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211215082417.180735-1-thuth@redhat.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <20211215082417.180735-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 libvir-list@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/21 09:24, Thomas Huth wrote:
> This option was just a wrapper around the -display ...,window-close=off
> parameter, and the name "no-quit" is rather confusing compared to
> "window-close" (since there are still other means to quit the emulator),
> so let's remove this now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst       | 6 ------
>  docs/about/removed-features.rst | 7 +++++++
>  qemu-options.hx                 | 8 --------
>  softmmu/vl.c                    | 8 +-------
>  4 files changed, 8 insertions(+), 21 deletions(-)

Libvirt has never used it. So from my POV: ACK.

Michal


