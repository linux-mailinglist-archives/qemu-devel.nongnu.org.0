Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BB3649E57
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 13:02:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4hNs-0002be-OZ; Mon, 12 Dec 2022 06:54:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4hNq-0002bO-Fw
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 06:54:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4hNo-0005xe-UT
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 06:54:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670846047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pgoXeIThR9MrLvc3AjpAFdrRWXs2Zo6NM//oReEfL2Q=;
 b=Ro5g0gvYHkJux2srDxi/qUUf4fuNh8iEfkypFd2a0yAiHeszaNQsqbpRrpii+veQB20GSU
 6Dog2r2eHyKl7hWQhokMooD/+VDZ56xuNxYVeXaS9HCe1FJGbxTKA5230eZAsV6Of3WhgE
 zP6AtekrUm/E1z2BYnQ+lFhKIIHziSo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-650-8xz_i8XzOGeiJbU8yi8EbQ-1; Mon, 12 Dec 2022 06:54:04 -0500
X-MC-Unique: 8xz_i8XzOGeiJbU8yi8EbQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 c187-20020a1c35c4000000b003cfee3c91cdso3251689wma.6
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 03:54:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pgoXeIThR9MrLvc3AjpAFdrRWXs2Zo6NM//oReEfL2Q=;
 b=AamALnDG7H3F0kbyFOprQ1cwL+bQEDUG6a6jTm5J9MHeH78TwsJQmxnlFOnh5ov9ds
 LkZHOspCd0LlyCl4gCuBduqoOfQ7bkGPOWg2kuZmroIgiVb6hswJ8sVz7FIuQDS+rfsq
 Jbsgi3zS+sWj/RII9hJaG73DlHNKlrZ0FY9FMOFPJUIq6ye3g6geaMATHeM4FnmeOBcj
 LcprPvOAOvDpoimoq3L1FqzOv6dbSE0Pwo0IJ01L/YoW0qrdOr/Jga5VrHrDz0C7jcUc
 4W5XB7le+xqBlvYu1JOJQ2mRlYuuvtzBVUjuFKvSCBMSlRw17UMoA3jrJ1+qpu90Rvgq
 J0FA==
X-Gm-Message-State: ANoB5plv7qicjRDixrSwxj0VxPbCa9yve+p1PXsRb7asEt+HVzBdLm4l
 v26GcDKnGQC5IgQbrLz2+df/ewD8xtwlxn9l0FC1z1XsmenUmuEMZhnTGOh53ono/A/7rWSSD1H
 mb9Pzz7cYlpiKdFo=
X-Received: by 2002:adf:ce03:0:b0:242:6583:acc1 with SMTP id
 p3-20020adfce03000000b002426583acc1mr9777193wrn.57.1670846043183; 
 Mon, 12 Dec 2022 03:54:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4okreIjvkh9Zb6K8pn/eqiPNlqguq3B9E8K3wViY/KFxzIjNszzMmTELeHf40RBXZdTI6DHA==
X-Received: by 2002:adf:ce03:0:b0:242:6583:acc1 with SMTP id
 p3-20020adfce03000000b002426583acc1mr9777183wrn.57.1670846042965; 
 Mon, 12 Dec 2022 03:54:02 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-127.web.vodafone.de.
 [109.43.178.127]) by smtp.gmail.com with ESMTPSA id
 k10-20020a5d66ca000000b00242257f2672sm8668400wrw.77.2022.12.12.03.54.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 03:54:02 -0800 (PST)
Message-ID: <2de63570-bdfe-d350-b6d8-1ac5048b5b04@redhat.com>
Date: Mon, 12 Dec 2022 12:54:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/qtest/e1000e-test: De-duplicate constants
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Yan Vugenfirer <yan@daynix.com>
References: <20221110114426.65951-1-akihiko.odaki@daynix.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221110114426.65951-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/11/2022 12.44, Akihiko Odaki wrote:
> De-duplicate constants found in e1000e_send_verify() to avoid mismatch
> and improve readability.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   tests/qtest/e1000e-test.c | 19 +++++++++----------
>   1 file changed, 9 insertions(+), 10 deletions(-)

Thanks, I added e1000e_receive_verify() to the commit description (since 
you've modified that, too) and added this to my testing-next branch:

  https://gitlab.com/thuth/qemu/-/commits/testing-next/

  Thomas


