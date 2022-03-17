Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C0A4DC4F8
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 12:41:39 +0100 (CET)
Received: from localhost ([::1]:35302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUoVe-0003Qr-KG
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 07:41:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUoQ7-0001Ne-0Y
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 07:35:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUoQ3-00024G-D9
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 07:35:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647516950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=skp6+MxrC8aKgJb9ld8eBCxe0XwG6Fh5SoPrnON6o30=;
 b=WHlkAk/q38FYfrKk6Ws54KM7yCoXkBoweEuByNhhA9qqrpxf7qqrHNlE53nFDsB7OwYpfE
 m45YaPYFpx4qBmSt/sCRhoB58F+Rmt6xkJ0nw4O0scNEH3/rO+8yE6z2JtYZKoGyqfkcGF
 UZy2ISbdGLfcCi1MYKbrcvgGXiC9otg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-GcpFD75INMS4m7anzUB-AQ-1; Thu, 17 Mar 2022 07:35:49 -0400
X-MC-Unique: GcpFD75INMS4m7anzUB-AQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 gx12-20020a1709068a4c00b006df7e8181ceso2480675ejc.10
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 04:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=skp6+MxrC8aKgJb9ld8eBCxe0XwG6Fh5SoPrnON6o30=;
 b=LjZTrNgz/J8VgudfiIOhFVeV/A1ApqfCmD9Byd/oR0O5DTzXmcdQ0G6KkECMkzavYt
 T8J0oz6xnnqID++5qtjyBj/Vs0NTnUMVz8UzQaQh89MV2ZexfTgZoUS0i779YOHmI60H
 FYCKh4Xlwmg6B+Z+ZvnkxwSszj7jDcv0UbzfeP2ODdUFhjaj06qF3hvMtHRSuZJzJw1D
 dG55bRxE/gYUAmgS3V8VQCNBIe3a8Xm96q8tA9N7Mmy24SFuS9MM9EPIBO28sEhm3LSf
 GC+MEszKrhH+QwwL0KhAmKp/0BWjpVv02teFW+b2mzOBcaP1P7bcVvmYpisiY3MLMZzS
 gbdg==
X-Gm-Message-State: AOAM530bzpVklyxE1PgzLPRwGa6SrQ4EEnRk1YZja3powiLJutakXbZy
 w2fwltTMBJBNr3tZprkBbzZv8LK8hVu70nLLtdMF6+zFhgkmTKRfQ35P0oSnavW1pzaGKjOmGhl
 V+dCPvQVr3PFSdAU=
X-Received: by 2002:a17:906:3ad1:b0:6ce:a880:7745 with SMTP id
 z17-20020a1709063ad100b006cea8807745mr4059068ejd.46.1647516947502; 
 Thu, 17 Mar 2022 04:35:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1S844EOk2bAhV8lWBIjBLPRs2PhG0t9zW+02WffGMSO7xJo5C+9jzwatKjuPHxrTVfNRFug==
X-Received: by 2002:a17:906:3ad1:b0:6ce:a880:7745 with SMTP id
 z17-20020a1709063ad100b006cea8807745mr4058984ejd.46.1647516946435; 
 Thu, 17 Mar 2022 04:35:46 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a056402268f00b00416474fbb42sm2525022edd.19.2022.03.17.04.35.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 04:35:46 -0700 (PDT)
Message-ID: <36e5757f-fd6c-6712-4cbc-6c7e44b7ab50@redhat.com>
Date: Thu, 17 Mar 2022 12:35:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 06/14] iotests: change supports_quorum to use qemu_img
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220309035407.1848654-1-jsnow@redhat.com>
 <20220309035407.1848654-7-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220309035407.1848654-7-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.03.22 04:53, John Snow wrote:
> Similar to other recent changes: use the qemu_img() invocation that
> supports throwing loud, nasty exceptions when it fails for surprising
> reasons.
>
> (Why would "--help" ever fail? I don't know, but eliminating *all* calls
> to qemu-img that do not go through qemu_img() is my goal, so
> qemu_img_pipe() has to be removed.)
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/iotests.py | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


