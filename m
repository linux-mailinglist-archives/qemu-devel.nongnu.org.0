Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9AF575065
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 16:09:44 +0200 (CEST)
Received: from localhost ([::1]:47256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBzXC-0001v4-MO
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 10:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBzRX-0001Wf-LB
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 10:03:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBzRR-0001dk-IE
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 10:03:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657807424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bkYPhBOiZu5g14paHad0DhMf1/p5fyCOVNtYd1UBX+k=;
 b=AnEX3qG4tHvQQA4FAV4qT6d2mAfb7tRzkncqNtCYNMD1yHjZhB+h1VOXzqTFVmMZlr85UX
 b5z8DzooAAy6eIZBBkgt2d5XhsXM1utxWnAOhUF/E1tv430NRSxh6CFpt1PGyRtyYxCYe/
 BgNuqaTwqohj9UVfZBSkxiFtDXMXSvE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-Kjf_LGM4MH2u7qvnzjLmgA-1; Thu, 14 Jul 2022 10:03:43 -0400
X-MC-Unique: Kjf_LGM4MH2u7qvnzjLmgA-1
Received: by mail-ed1-f71.google.com with SMTP id
 w13-20020a05640234cd00b0043a991fb3f3so1589348edc.3
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 07:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bkYPhBOiZu5g14paHad0DhMf1/p5fyCOVNtYd1UBX+k=;
 b=8RvdMA2dG2jp5RlOZFN90NbIzm2IPxAfJDJtWkq4p2SGkUQ7wYYIbsI+xAgmKOX0ft
 C6PHZAyCyMCfKyRMLnYe3fpiqQ+cPYei1M35l/Sp0iTApAG52hqZHbjc6CWf29FIuaIh
 uQLNSEyCLyKDHCOd8pq6dECKmGmBzZuGy3GgZ1IV4rxItKUX0AEIbIIvY0s9/ZuFqNSd
 cDa8X8ywBNVMX7CEL+0U+nFapcNKOMOaAv+IiEzxluEcsWz7LFITIHciF2aL/HsYvbnq
 hPHgL1W5iJjSehSzHnhJmKSZeF/ExlWDmCsRE/inDxKGOPuXoUEbdqH9k326473Rlp5g
 PJow==
X-Gm-Message-State: AJIora8vME4wadTGvFkUpe4i6rbWU2HNA2fJ3EPAXd5juPplhbPxS1Zc
 Aual5G3K2fSGz/vad/0SXSgGqdSEqnhmMBRRhrdnjDmki0Njh3PwJdgTV+eb1qYyatKAYPpmHpY
 D+WmxRuZ95dNCOw0=
X-Received: by 2002:a17:907:6e1c:b0:72b:5b54:bd87 with SMTP id
 sd28-20020a1709076e1c00b0072b5b54bd87mr8560222ejc.581.1657807422363; 
 Thu, 14 Jul 2022 07:03:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sIrvx2ipuZfMTMe79Ai9JCOAHicZHMCpzjp7Xk7cJdAgclzZuQoHw7NAKmvO5LuXQpbcAmRA==
X-Received: by 2002:a17:907:6e1c:b0:72b:5b54:bd87 with SMTP id
 sd28-20020a1709076e1c00b0072b5b54bd87mr8560197ejc.581.1657807422147; 
 Thu, 14 Jul 2022 07:03:42 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 r24-20020aa7da18000000b0043ad162b5e3sm1111391eds.18.2022.07.14.07.03.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 07:03:41 -0700 (PDT)
Message-ID: <57595863-52a1-921f-9317-ec9d8e231ec5@redhat.com>
Date: Thu, 14 Jul 2022 16:03:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH 1/8] block.c: assert bs->aio_context is written under
 BQL and drains
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org
References: <20220712211911.1302836-1-eesposit@redhat.com>
 <20220712211911.1302836-2-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220712211911.1302836-2-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 12.07.22 23:19, Emanuele Giuseppe Esposito wrote:
> Also here ->aio_context is read by I/O threads and written
> under BQL.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


