Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F503971F6
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 13:00:33 +0200 (CEST)
Received: from localhost ([::1]:42692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo28N-0007d4-BG
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 07:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lo26d-0006iH-QJ
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 06:58:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lo26c-0008LU-Fx
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 06:58:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622545120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MDq2F+4SP7UAaXyp9TGVPz5n2JlGL6rhNDqu5H8Nq/o=;
 b=V/5mJqFHmDbDdPyBRX2PPOLDZf6LAdLkuBax0g/CpVlD7bBXjAHyPd0I5TyijC943XKb8L
 oecDO57WAREudIjDRLQcvFxkPH2MPHG/PxwQOZRkjQmAqYRBkAyryZmvUySQ/8gy0AlsHS
 irDHLVLR/lOJ/JR+zSDacKpGcGG6qH4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-gmlz-tO6O3aVAbLE_k1Qqg-1; Tue, 01 Jun 2021 06:58:37 -0400
X-MC-Unique: gmlz-tO6O3aVAbLE_k1Qqg-1
Received: by mail-ed1-f69.google.com with SMTP id
 dd28-20020a056402313cb029038fc9850034so6075810edb.7
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 03:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=MDq2F+4SP7UAaXyp9TGVPz5n2JlGL6rhNDqu5H8Nq/o=;
 b=s5O4M8lqQREd6r6eQTfzF7yfBXHboKvlg5+7QX1rET24UQzpLg7UDdlrDCxcz01lnl
 NEPbLJT9iRp6IaeXL3wXubmOX22dhUktFx7FhBA3J7Tfv5kuSlzBRClMB7nz1FOkfxJS
 SMqlLI3R8wwv3EXMKMlpJdXNUKd/m2jByZJPGPbtpixUgPyCYcG/+IBgcy5KHHWmdLkj
 c/ZkIN0Gj7fgVHUqXzHC3C4Hx/gzo1PDNup+sLCkng9/SM83dh8PI2/6b6xcoFTy6BIa
 nZQ4X3y+dNwHKQrP8Cg9EfE0bEno1ghg3n8Hg5KYSnyM0/eAkuY8QC1QUmqtckbULmaj
 VgLA==
X-Gm-Message-State: AOAM533IRpTG5h9Yh5lHtsn0poib4hV0doRQH3iF0S90JF5dIqYVxF6i
 5OBmoabjiI8zoq+aS0LKBJaLrqlGmroF0PHJ+uwJ6rfhgt2InAy29/alfHG+gUDa0ZISu97zn8e
 7KAE/qHa7TjfaMgg=
X-Received: by 2002:aa7:da94:: with SMTP id q20mr30462428eds.316.1622545116054; 
 Tue, 01 Jun 2021 03:58:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzv9HAHZqNhxos2fAZ8r6iLGgpYxHtB4XbqRe5Uy5aeYcNdKtRT+NSC4LW+mjfr0HhlaDZVtA==
X-Received: by 2002:aa7:da94:: with SMTP id q20mr30462399eds.316.1622545115807; 
 Tue, 01 Jun 2021 03:58:35 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 j22sm7251710ejt.11.2021.06.01.03.58.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 03:58:34 -0700 (PDT)
Subject: Re: [PATCH v2 25/33] iotests.py: VM: add own __enter__ method
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
 <20210520142205.607501-26-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <776c1398-6e87-f4c9-3d87-4477f0c8e662@redhat.com>
Date: Tue, 1 Jun 2021 12:58:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520142205.607501-26-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com, den@openvz.org,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.05.21 16:21, Vladimir Sementsov-Ogievskiy wrote:
> In superclass __enter__ method is defined with return value type hint
> 'QEMUMachine'. So, mypy thinks that return value of VM.__enter__ is
> QEMUMachine. Let's redefine __enter__ in VM class, to give it correct
> type hint.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/iotests.py | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Max Reitz <mreitz@redhat.com>


