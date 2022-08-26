Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D9E5A2591
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 12:12:29 +0200 (CEST)
Received: from localhost ([::1]:41918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRWKC-0005JK-7d
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 06:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oRWFT-0007MP-2k
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:07:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oRWFO-0007xz-Pd
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:07:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661508448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rXEXRYK+0wBzb2i3tokL5D3Rs4AJG5hF2C6R8Kn6NDc=;
 b=hbLAasY3PzH+x18v2xyojn/jSqTrUO8Eq65eKaD50jFXqY1XiMmiS54PqMd1erLmm1HDrc
 KvIX21UxFYqBvE62VuFkDg+DcJlnHBGAYj0VTm1EG1k+ukPMGKYEUhJwknudKg+uY3hnLG
 9J7GTtXHUQPty6dFYWKNRG2ihlgFN/o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-171-N2gn0pHKNZyE_S_TMySBCQ-1; Fri, 26 Aug 2022 06:07:27 -0400
X-MC-Unique: N2gn0pHKNZyE_S_TMySBCQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 b16-20020a05600c4e1000b003a5a47762c3so741855wmq.9
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 03:07:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc;
 bh=rXEXRYK+0wBzb2i3tokL5D3Rs4AJG5hF2C6R8Kn6NDc=;
 b=dhMxX+h6shQVja4lWFjnVYXd/Mwm66XmRKGN+Jc/WrIqJcy8jhZjcjIkfSl+bspEWO
 2S8mebHcD/+LWBNrnbjPX0/hbV9OZSSOeQdj5wjdzJZmCtHyA/apMkBlWWSlMqWoDfcw
 +CGAdHK+SnetzYFpMPo7LWriTKLVKtzP4M3RHIb7CDdEhCNXwGBy/EwaST7Vb0j/k9LD
 4eKetpzLVJPzvsslaffrnr8K8AUNDsuNPSBAgxH5K/h1egLBQlHGG4LvDQTc87DPK4wr
 fe6JFsjX/bi5XvO2NUBZd/OZMg0Bl/uBjE3B6485yt4U5aCe564Cxs2pXeW1yeOUIpAR
 liAQ==
X-Gm-Message-State: ACgBeo2F93PrFdBRuRCxSkHL+55U2yqIECeqGHgeU0BTplAPsrxrER15
 f/hTHax1vkG+BdRX88/YqHgIznRXN8r8b86q84sbNMPrFV9wRkxJwfIf/kHCG70at0mXEKQgqS+
 VymJ4Xfvs4GABV7o=
X-Received: by 2002:adf:f54d:0:b0:225:2f38:2fa4 with SMTP id
 j13-20020adff54d000000b002252f382fa4mr4499776wrp.581.1661508446438; 
 Fri, 26 Aug 2022 03:07:26 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5KVOnph7VEX57WNDMmyUu8+kFH1/5aMSa4YWfrO0G3gAdcy9ukbbOBpCRQJvEcU+iu3cw3mA==
X-Received: by 2002:adf:f54d:0:b0:225:2f38:2fa4 with SMTP id
 j13-20020adff54d000000b002252f382fa4mr4499763wrp.581.1661508446166; 
 Fri, 26 Aug 2022 03:07:26 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:f600:abad:360:c840:33fa?
 (p200300cbc708f600abad0360c84033fa.dip0.t-ipconnect.de.
 [2003:cb:c708:f600:abad:360:c840:33fa])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c358d00b003a607e395ebsm10537394wmq.9.2022.08.26.03.07.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 03:07:25 -0700 (PDT)
Message-ID: <063e98e9-a10f-5b38-d1dc-63f29c7ebfbb@redhat.com>
Date: Fri, 26 Aug 2022 12:07:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] dump: fix kdump to work over non-aligned blocks
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qiaonuohan@cn.fujitsu.com, Peter Maydell <peter.maydell@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20220825132110.1500330-1-marcandre.lureau@redhat.com>
 <20220825132110.1500330-3-marcandre.lureau@redhat.com>
 <35072646-3bee-ba0d-4b9d-6aeb117b8431@redhat.com>
 <CAJ+F1CJs-s2v1ivdwmwkS86=JU+rrqrov8HZiyEzFGDE-injnQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAJ+F1CJs-s2v1ivdwmwkS86=JU+rrqrov8HZiyEzFGDE-injnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 26.08.22 12:02, Marc-André Lureau wrote:
> Hi
> 
> 
> On Fri, Aug 26, 2022 at 2:01 PM David Hildenbrand <david@redhat.com
> <mailto:david@redhat.com>> wrote:
> 
>     On 25.08.22 15:21, marcandre.lureau@redhat.com
>     <mailto:marcandre.lureau@redhat.com> wrote:
>     > From: Marc-André Lureau <marcandre.lureau@redhat.com
>     <mailto:marcandre.lureau@redhat.com>>
>     >
>     > Rewrite get_next_page() to work over non-aligned blocks. When it
>     > encounters non aligned addresses, it will allocate a zero-page and try
>     > to fill it.
> 
>     Could we simplify by using one global helper page (or caller provided
>     page) and avoiding the allocation/freeing?
> 
> 
> I don't think that makes a big difference, but certainly doable.

If we're using one central page, I guess we'd have to pass "flag_sync =
true" to write_cache() in case that page is used. Or we simply specify
on the single global page in there and force a sync. Changes would be
limited to get_next_page() and write_cache() then.


-- 
Thanks,

David / dhildenb


