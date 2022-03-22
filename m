Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B004E3BEF
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 10:51:33 +0100 (CET)
Received: from localhost ([::1]:58162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWbAp-000396-Mx
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 05:51:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWb8S-0000tZ-Nt
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:49:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWb8R-0002Eu-4V
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:49:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647942542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gt/Q0+f0+ptvJO7TcEiK3xHEFuHIdYhoYMrmX6C7GGs=;
 b=Plr4bPXFF6GAntAODvhgt5T+oIsD89HxKcftoCJk/OECsigXZPRS2rowRTOcfdHtXGHE/1
 meFp4glGna6w1gH92vx3mNlrM2T6uRUDGtaFycSIkx3Y0t7Bvl7CKXVSztKGY/6KhpXdvO
 GxCaKVfEbLUJUP9u2u08G1dnZ2pWknQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-eYiDTK0qNdmm_L1o3q_5Fw-1; Tue, 22 Mar 2022 05:48:59 -0400
X-MC-Unique: eYiDTK0qNdmm_L1o3q_5Fw-1
Received: by mail-ej1-f70.google.com with SMTP id
 h22-20020a1709060f5600b006b11a2d3dcfso8418893ejj.4
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 02:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Gt/Q0+f0+ptvJO7TcEiK3xHEFuHIdYhoYMrmX6C7GGs=;
 b=ZB3FHJE/hznWpLYsefmcVPZw568fPyPKX3zc4seXNJWsBkFIcCwO+Q9GdqssKbQ1xN
 a3HPWES7Pcc6G7X/rvsJ8hRtD+5FvU2HO1jWo1yWTApEm9ouxjX8XLxI8FPluaSIT+71
 DhWVZIOp4eedD1ctOd76Ex2HMI8Y15HvYJrzu1RU4+9TlVA9jtLwTYqtt4sli+1I6rhU
 ibiWXF3vkHBwqPALvBuAW0GjnYQyMIb565CiVqMwiQ7E2dHl7zcmr1gGO3s5DovBN/8s
 ek+XBO3OyRNcY1hpcpFDHHAKeKg4jpAA022apbNMZsGK5xWCHF49vCtbsS8CMpST2S4T
 PEPg==
X-Gm-Message-State: AOAM533ahpWJDVNOGZHatDCXCqwEgZUcljgA6o665yW2QM813t/+bbZA
 cj4NwMsl8NR3Wbselu/iu1lXqX557KryU9cWwo/F8fG78RGGXqSl6cvN0RhGotRRgVYNeKOA1PK
 CeJ8YyL2Gx5z3gBo=
X-Received: by 2002:a17:906:a2d9:b0:6df:b8c9:e694 with SMTP id
 by25-20020a170906a2d900b006dfb8c9e694mr18683043ejb.448.1647942538201; 
 Tue, 22 Mar 2022 02:48:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5tQ8L25uTk6qmeNyzY7SQUe/2iOni9j3JK5tOdo0bAj3aqRThD431u2qkufNtZje0uqF/6A==
X-Received: by 2002:a17:906:a2d9:b0:6df:b8c9:e694 with SMTP id
 by25-20020a170906a2d900b006dfb8c9e694mr18683026ejb.448.1647942538006; 
 Tue, 22 Mar 2022 02:48:58 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 hs12-20020a1709073e8c00b006dfdfdac005sm3870638ejc.174.2022.03.22.02.48.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 02:48:57 -0700 (PDT)
Message-ID: <91324d6a-0acb-3bbc-79e1-422982f2be6e@redhat.com>
Date: Tue, 22 Mar 2022 10:48:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/3] iotests: Check for zstd support
To: qemu-block@nongnu.org
References: <20220302124540.45083-1-hreitz@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220302124540.45083-1-hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping

On 02.03.22 13:45, Hanna Reitz wrote:
> Hi,
>
> v1 cover letter:
>
> https://lists.nongnu.org/archive/html/qemu-devel/2022-02/msg04592.html
>
> We have two tests (as far as I know) that use compression_type=zstd for
> qcow2 but do not check whether that is actually supported.  Thomas
> reported this for 065, but it’s also the case for 303.
>
> This series makes 303 be skipped when zstd is not compiled in, and has
> 065 use zlib for each of its test cases then (it was made to use zstd
> just to improve on coverage, so using zlib as a fallback is perfectly
> fine).
>
> v2:
> - Add the first patch so that 065 and 303 can use these new iotests.py
>    functions to check for zstd support instead of checking for their own
>    qemu-img create’s output
> - Have 065 fall back to zlib instead of skipping zstd test cases
>
>
> Hanna Reitz (3):
>    iotests.py: Add supports_qcow2_zstd_compression()
>    iotests/065: Check for zstd support
>    iotests/303: Check for zstd support
>
>   tests/qemu-iotests/065        | 24 ++++++++++++++++++------
>   tests/qemu-iotests/303        |  4 +++-
>   tests/qemu-iotests/iotests.py | 21 +++++++++++++++++++++
>   3 files changed, 42 insertions(+), 7 deletions(-)
>


