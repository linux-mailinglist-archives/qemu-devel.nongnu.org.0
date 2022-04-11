Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5B34FB5B4
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 10:14:25 +0200 (CEST)
Received: from localhost ([::1]:51814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndpBn-0002dR-Q5
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 04:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ndp9I-0001oB-3q
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 04:11:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ndp9F-0001X9-D0
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 04:11:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649664704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Reh+2jQd+8aq8E2+AjtNmkOGWsSeEZAoJGjdxbohSiU=;
 b=ELwfNR7QEFi9UuaR3OD8TqWa0HYakzZoJktz9gm2ggH4NTqCWa5CMmxfqQ6uiM/uMAw2uw
 kmgi+vYcfGMgBh1vBVZO4N/Q4HYgRVxyMid737nJXVkllBhr6WKc0IE3UhqFD+3gfx8OyL
 OdPju/wuHmZSo2YOelmTmVRPOkPBEcY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-DC9MUr-COBu62JPf3WkCwg-1; Mon, 11 Apr 2022 04:11:42 -0400
X-MC-Unique: DC9MUr-COBu62JPf3WkCwg-1
Received: by mail-wr1-f69.google.com with SMTP id
 61-20020adf80c3000000b00207a6ffdd1eso477479wrl.14
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 01:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=Reh+2jQd+8aq8E2+AjtNmkOGWsSeEZAoJGjdxbohSiU=;
 b=JR4tCr49o3uvIMyNiJcsA/HCfocxJ2bHI7qw7J5RUbfiWsWQwTHCbxjXFwfM2NN6Ro
 CALRXLx6CsCnxszkUFSw+IY6JWzNIU6ihmmdWRCFHvuBujijrvkOf9XnjuyKfJ/fip35
 owNPgBEJznN8gC7p/FrO/OihdVmweV6kLbHgrzjwpcmi7GZvrLZx24zuO1+C3i7iKLv/
 25C6XSKDjXatMwB9WOb7kxcnp4Zu41muarS7728c33GtiEzvxjzw2gaxL1XIEJd1HpRR
 CKi/iRMHkLx/2mANyMJYZoIW9PY9Mq7DfW4mEpJLKAwtCQtEWRtlDSO+Erac+UWzM4gg
 wsCw==
X-Gm-Message-State: AOAM531K1dZGwhjoXGWibx/R88WevTacI8/MUUj5itC7F69PHf/cOlGo
 8pIfnGq5yf5b5Xko/KWzom+uQbuTE6Nb+3yG4jtWZWIKSoaXr7AOz8/Xnv6nWulMoNFunNQb1UI
 kWHg8ys2Ql1gJW+k=
X-Received: by 2002:a05:6000:12cd:b0:207:a359:bd77 with SMTP id
 l13-20020a05600012cd00b00207a359bd77mr5334631wrx.552.1649664701647; 
 Mon, 11 Apr 2022 01:11:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyojl0jEuCnaHY1bmGhQaUlAAwEKspreWUPeDFfi5ceb/p/RW8jGP9HUj3FI57aycglGrmEg==
X-Received: by 2002:a05:6000:12cd:b0:207:a359:bd77 with SMTP id
 l13-20020a05600012cd00b00207a359bd77mr5334613wrx.552.1649664701351; 
 Mon, 11 Apr 2022 01:11:41 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 n15-20020a05600c500f00b0038cfb1a43d6sm17008652wmr.24.2022.04.11.01.11.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 01:11:40 -0700 (PDT)
Message-ID: <cabbe1ff-a8da-c858-a4e1-00db856d1e6c@redhat.com>
Date: Mon, 11 Apr 2022 10:11:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH for-7.1] Remove the slirp submodule (and only compile
 with an external libslirp)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20220408164749.534758-1-thuth@redhat.com>
 <774adae3-ff97-44b2-a510-fd46c073eb1a@redhat.com>
In-Reply-To: <774adae3-ff97-44b2-a510-fd46c073eb1a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/11/22 09:11, Paolo Bonzini wrote:
> On 4/8/22 18:47, Thomas Huth wrote:
>> The only one that still seems to be missing a libslirp package is
>> OpenBSD - but I assume that they can add it to their ports system
>> quickly if required.
>>
>> So there is no real urgent need for keeping the slirp submodule in
>> the QEMU tree anymore. Thus let's drop the slirp submodule now and
>> rely on the libslirp packages from the distributions instead.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
> 
> I would like to have feature parity even with CFI.  I had written the 
> libslirp side a few months ago, but never tested it because I didn't get 
> to the QEMU side.
> 
> I updated it and you can find it at 
> https://gitlab.freedesktop.org/slirp/libslirp/-/merge_requests/117. I'll 
> get to the QEMU side now.

Also, doing this at the same time as a switch to Meson >=0.60 (probably 
0.61.x) would allow something like

option('slirp', type: 'feature', value: 'auto',
        description: 'libslirp user mode network backend support',
        deprecated: {'system': 'enabled', 'internal': 'auto'})

This keeps incremental builds working.  All of this should be doable in 
7.1, so this is not an objection to removing the submodule in 7.1.

Paolo


