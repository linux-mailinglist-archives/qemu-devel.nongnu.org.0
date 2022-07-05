Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0AF56651B
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:34:30 +0200 (CEST)
Received: from localhost ([::1]:45890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8e0r-0001CK-PT
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8dvh-0004ni-Uh
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:29:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8dve-0003KR-Na
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:29:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657009744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DUbX+d0EgrlHJj1Z59zy5bVmdyPHB54k91ljgIPvj3Y=;
 b=NbGH4QK2CnrlB/39MhZ4SG3MeGSd1Xy2qEvGxr6hgF5TNsCULwpaoBBIceTFzx58noVHVv
 jiu9+TF2Nvmy+6vTsaSArzCTq2vvhOA3yNX8ppUYdxXDLn3tHjPrXtE0zxcjVNMd83QfVc
 +RipzkBrkkEYyXvBWe1M35pyfXO70xo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-YwRWCpMaOrGPSWXfcMIAgw-1; Tue, 05 Jul 2022 04:29:03 -0400
X-MC-Unique: YwRWCpMaOrGPSWXfcMIAgw-1
Received: by mail-ej1-f71.google.com with SMTP id
 x2-20020a1709065ac200b006d9b316257fso2474359ejs.12
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 01:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DUbX+d0EgrlHJj1Z59zy5bVmdyPHB54k91ljgIPvj3Y=;
 b=VPgMwmjbujwuQR7BycTRPblpZ6PXYXCC0/eJGhkI4dfjQWOIEbj1S9f5LL1E4hDnT1
 0VHztaU6tMhhGxFZeI2WwxKnIm2DeRWm2LgwYbsCXV101RZdc/xh3joVY36nVcrbIOkL
 GtZ5VLHfZkpw0DS1pQGEAXXW+w2gWoe1V5fVyRf4Y5bRqwoKyG80B6LlST5swA5EchEt
 5yybz5Oyjd+DrtA7SQLfb2r4lvAFbl7V54IoW0NL1ZFpf518Sgzn3V7ADsS4twJHCydR
 9O7GVg7dN10PuYCAK5Kq8HC9Vu8bvziU3w0Of6A6LfS63cbfWQEaKeuRSj0XeleE335A
 zu8g==
X-Gm-Message-State: AJIora8v6Gfpc4D5os2RGOO9vpscGWFomR5w5w4JRCkRqvWRue7QmMKE
 QgG+j28N64bYegGaAMdyHvTRGkmsc+kvMpP+4wTX/W1BF5Jx5sHpld4Vh2ctPHUjaB5uGAag1RX
 +41W5BmSfA71Xn4E=
X-Received: by 2002:a17:906:9451:b0:726:93a8:bcc with SMTP id
 z17-20020a170906945100b0072693a80bccmr31668669ejx.361.1657009742442; 
 Tue, 05 Jul 2022 01:29:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ujt5iNa9ACRCNQgRxwnY55P7mPGwzdRdSVf7fZrrfjTaqc2AAgK37SJ/P/A3aYFNnOQ+GyUA==
X-Received: by 2002:a17:906:9451:b0:726:93a8:bcc with SMTP id
 z17-20020a170906945100b0072693a80bccmr31668661ejx.361.1657009742297; 
 Tue, 05 Jul 2022 01:29:02 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a170906494300b007262b9f7120sm15354760ejt.167.2022.07.05.01.29.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 01:29:01 -0700 (PDT)
Message-ID: <4b7b2ec7-4581-c43d-b0c5-ef78b32db72e@redhat.com>
Date: Tue, 5 Jul 2022 10:29:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 10/18] block: Change blk_pwrite_compressed() param order
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113837.199696-6-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220517113837.199696-6-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 17.05.22 13:38, Alberto Faria wrote:
> Swap 'buf' and 'bytes' around for consistency with other I/O functions.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block/block-backend.c             | 4 ++--
>   include/sysemu/block-backend-io.h | 4 ++--
>   qemu-img.c                        | 2 +-
>   qemu-io-cmds.c                    | 2 +-
>   4 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


