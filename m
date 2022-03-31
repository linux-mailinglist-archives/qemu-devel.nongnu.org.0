Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E414ED77B
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 12:02:13 +0200 (CEST)
Received: from localhost ([::1]:36640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZrd6-00075a-1i
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 06:02:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nZraA-00056s-Dw
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 05:59:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nZra7-0002Ln-BW
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 05:59:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648720745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pf859T+zns3JfeRR4dWLlsqLAPGunuGyZrBm7UEyISc=;
 b=Z8wZkli806aKg/6qSpgguehjwQ6aJd7znGVLNAi4VFJIVpGzZwl8DkquT/7BltlLzIaLgP
 yFYU6TwgbJ21fWpsVaHr94IuYaLVuW7x+S6fBMYOtRkvR6XVBtTHR6vOIz+nIQcdDhDqyG
 Y1u6mxWLJNM2U4s+1PE6zhaD+YVGXXg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-n0wi-UtsNYOnSu8_lzKGMA-1; Thu, 31 Mar 2022 05:59:04 -0400
X-MC-Unique: n0wi-UtsNYOnSu8_lzKGMA-1
Received: by mail-ed1-f70.google.com with SMTP id
 cn27-20020a0564020cbb00b0041b5b91adb5so3569564edb.15
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 02:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=pf859T+zns3JfeRR4dWLlsqLAPGunuGyZrBm7UEyISc=;
 b=zGoG0eHfWhXs07FUfNV7Pu6nmU7fuQkNEI5V1lTofOLpnn4A7p41YU+A8y3Jws9tNT
 0hRtOnVEv41wNT7yQmKMb6eeyU+u3QzNWpn4preJRjBPBTEYoNxRX/50xeegKM/zOWzz
 YHiCF/NJoBPdu7DDkq+Kc8yyTUqJF/feQrJfTwyPGnl6Dco+akLiE6hAxrXpLbpCKB4j
 71S4YrPkLT46UM/kt32qBYeQSk+miAColiJroPa8qtaMW3AS8j+VLcD3A9aQ+VZP1THy
 T2Ou2t620TWQKX2XIF/Dwx8Hj3xmi9Hf7hHiNUhnCNjTfiRglrvgKywcTaZuu87YSEpo
 Ahjw==
X-Gm-Message-State: AOAM532Uz3YNd9gFzPj1tcLDoCX0nVdtmjZvjKy7DkiLbRNrUVWCXN09
 nBrmS97ilRZn+J2xLmOuC9VGv+X037yeNYFT+qr9GIQPX/er3NQVfWD8PaRml5Flk23+4Y5fH0F
 ug64/G7FWe0XCSGI=
X-Received: by 2002:aa7:c157:0:b0:418:f8e3:4c87 with SMTP id
 r23-20020aa7c157000000b00418f8e34c87mr15597680edp.271.1648720742798; 
 Thu, 31 Mar 2022 02:59:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEkFAuCOFzLrit5Sc4mBBXuyfRD7vAAOipCpGYmevz0q/4kh2Zs3LNFsSw47NcNLkEO16iug==
X-Received: by 2002:aa7:c157:0:b0:418:f8e3:4c87 with SMTP id
 r23-20020aa7c157000000b00418f8e34c87mr15597662edp.271.1648720742587; 
 Thu, 31 Mar 2022 02:59:02 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:8ca6:a836:a237:fed1?
 ([2001:b07:6468:f312:8ca6:a836:a237:fed1])
 by smtp.googlemail.com with ESMTPSA id
 hs12-20020a1709073e8c00b006dfdfdac005sm9322969ejc.174.2022.03.31.02.59.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 02:59:01 -0700 (PDT)
Message-ID: <88f2798b-9327-e54f-5792-e37404b94ef7@redhat.com>
Date: Thu, 31 Mar 2022 11:59:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 0/5] Removal of AioContext lock, bs->parents and
 ->children: proof of concept
From: Paolo Bonzini <pbonzini@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20220301142113.163174-1-eesposit@redhat.com>
 <Yh89L8gT46MbSJCQ@stefanha-x1.localdomain>
 <af53599c-c7de-d2b8-00fa-0e7d28121251@redhat.com>
 <e9eeec7b-d03e-5e8e-cc42-568c670726ca@redhat.com>
 <c8d45cd9-e7de-9acd-3fd6-13de58f5ce48@redhat.com>
 <c6a12090-b6c3-31d8-fb90-a76c9dd2e949@redhat.com>
In-Reply-To: <c6a12090-b6c3-31d8-fb90-a76c9dd2e949@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/30/22 18:02, Paolo Bonzini wrote:
> On 3/30/22 12:53, Hanna Reitz wrote:
>>>
>>> Seems a good compromise between drains and rwlock. What do you think?
>>
>> Well, sounds complicated.  So I’m asking myself whether this would be 
>> noticeably better than just an RwLock for graph modifications, like 
>> the global lock Vladimir has proposed.

[try again, this time with brain connected]

A global lock would have to be taken by all iothreads on every I/O
operation, even a CoRwLock would not scale because it has a global
CoMutex inside and rdlock/unlock both take it.  Even if the critical
section is small, the cacheline bumping would be pretty bad.

Perhaps we could reuse the code in cpus-common.c, which relies on a list
of possible readers and is quite cheap (two memory barriers basically)
for readers.  Here we would have a list of AioContexts (or perhaps 
BlockDriverStates?) as the possible readers.

The slow path uses a QemuMutex, a QemuCond for the readers and a
QemuCond for the writers.  The reader QemuCond can be replaced by a
CoQueue, I think.

Paolo


