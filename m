Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0F74FF0AC
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 09:37:34 +0200 (CEST)
Received: from localhost ([::1]:34124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neXZF-0001Qn-Az
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 03:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1neXXx-0000W1-RQ
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 03:36:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1neXXs-0002b9-I6
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 03:36:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649835363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t3285xSV74L3mG2MTBZ8rjfqqScqNTf5n52P+ssTlB0=;
 b=JlxT1l8lVYSkh4U5stNnZBRnqEBzQkt9aIlDiheCqhc67YpKGqn/Si5+OurIWPk7Sz0gsU
 gCcN9SeHOBAAkzYi1LEaA0g5K85kqqj9BCWsm1Vr8hWyzqz7E62GeECpN+LccZK4e3tG3o
 rVkSTETS2x1hVRy+Sq2TKhaVECKcKL0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-0OpjlPQ_N5qcXIsP3SjjUA-1; Wed, 13 Apr 2022 03:36:02 -0400
X-MC-Unique: 0OpjlPQ_N5qcXIsP3SjjUA-1
Received: by mail-wm1-f70.google.com with SMTP id
 i66-20020a1c3b45000000b0038eab4e0feaso515031wma.9
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 00:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=t3285xSV74L3mG2MTBZ8rjfqqScqNTf5n52P+ssTlB0=;
 b=Oe5FBTsuauMDpoKEaM8MTf5rr80RQPS0iKQVEC3Dfxe3J0RPfkzGSvcpyitWgkfdNX
 Y/Z4r6qgzYjPZUng6CaccdMNKnHcjq+t2474Z96/N2gTR5eSKvhGC/WB146pUPrQzBA/
 nVKaMGTSWnYwjzi6d16XiG8YNHUYNm5GxAolmoQ2FThUKNy77oENV4tAIyk6JaGB5akK
 7uISem68BR0GtwJBxO5WIHbJfJpESsBH/dV1XOHLNCRP8k+cg9hPOB9b5Vc83WWU7r05
 MMzUTnNCXtbbwAmbaEHq9cm40u2cvd+6Rljm87kanVFdzGFQtHMV8zcIoFRPJXXu1aUz
 oCew==
X-Gm-Message-State: AOAM531zmJXAcnKablqg9d7TQLLcJ4sckIL6yUyGMBC2lpFWf6NEfy8L
 bDNO9c6I6FIlAajOXXWPJTcIg3sk2LiN4kTd6eJo+5aHZr5qr5z/3NQtipuWRKiMFrIWEIIoC+l
 2HCxmi8S9bQLhOTu/Kb4MMzRfI9w6FMHM+/kbJ54fF+YHcLzQuQz9zkDk8jqDhzUizgo=
X-Received: by 2002:a7b:cbc2:0:b0:388:faec:2036 with SMTP id
 n2-20020a7bcbc2000000b00388faec2036mr7470270wmi.190.1649835361384; 
 Wed, 13 Apr 2022 00:36:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoOt9ld6QnbFfa+gEyKLOcivcANanWtOYg/DtlxsZJBNkZFrKjTSXUmOSGmaXo3jJYJOSk4g==
X-Received: by 2002:a7b:cbc2:0:b0:388:faec:2036 with SMTP id
 n2-20020a7bcbc2000000b00388faec2036mr7470245wmi.190.1649835361069; 
 Wed, 13 Apr 2022 00:36:01 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 61-20020adf8043000000b00205e1d92a41sm32023964wrk.74.2022.04.13.00.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 00:36:00 -0700 (PDT)
Message-ID: <3fe9e1f7-aa1a-0b0f-b089-a37d455d4b29@redhat.com>
Date: Wed, 13 Apr 2022 09:35:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 5/8] nbd: use a QemuMutex to synchronize
 reconnection with coroutines
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
References: <20220412194204.350889-1-pbonzini@redhat.com>
 <20220412194204.350889-6-pbonzini@redhat.com>
In-Reply-To: <20220412194204.350889-6-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/12/22 21:42, Paolo Bonzini wrote:
> Because s->state is written in the main thread too, for example by
> the reconnect timer callback, it cannot be protected by a CoMutex.

Actually by the yank callback, not the timer (which runs in the "right" 
AioContext).

Paolo


