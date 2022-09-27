Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8775EBFEC
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:39:54 +0200 (CEST)
Received: from localhost ([::1]:36960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od80H-0002Ga-Jf
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1od7vq-0004XQ-Hv
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:35:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1od7vm-0006uh-5q
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:35:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664274913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LZAjTQAVwia+JYnTFmd7g5wW9u/J3NN0VhLUWG2DQMo=;
 b=fLMxM5wtQM6TbfrdnU2gkOJd4xL2/qY2MnvyPDHCweikunUPGY/Uv9FtORt0Qi9lIqFhx5
 vNy8/ygfK+C7QsaBbVrfdei6sY4EyJF1SpcK9IJ1m1/RUtql+ztzv+cTj27H/Yf/XAhqkk
 qyWFRoYCOWZuQudQA6ll3AQS+TLCLT8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-625-z3pGzEFAOGmN7czczSSGJQ-1; Tue, 27 Sep 2022 06:35:09 -0400
X-MC-Unique: z3pGzEFAOGmN7czczSSGJQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 r7-20020a1c4407000000b003b3309435a9so8015716wma.6
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 03:35:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=LZAjTQAVwia+JYnTFmd7g5wW9u/J3NN0VhLUWG2DQMo=;
 b=MZEIULfDMQMBfFRRbQ8iSWW+5BY19UaOdgK1+FD1ManogIsqY0g81401KfUJsbKNNW
 S3ofwdVhTBtqfWjnkItbInaQf/gzvZPNKcRKtBlz0Acnn2hATXjXbbA2G4BcdOrSagwu
 9SzynzSVUjsqCXgMkypVdbUXjlcjRmBJkIJvj6zq88S/DDrfmMsZPS1LJGOTtujlVgbw
 0efnEUtvbmhha9F24MTL1FnOfJBkiPcUIBCbiaQBaKQHquuWnjsAkTEsguzTv3A+yUeY
 KAweHEFBgG122zUQAhyvLCCrbnG9iNFajiPOASaNLrRzzwAB/9rjD/WdQlBTltXhVkDz
 yhIw==
X-Gm-Message-State: ACrzQf0kwEVlNvrABizIGPBUqBPc/CpIXN3RfDSiinxiuSdOe/66USjY
 uWZeXH28cy+CEQaxWjMR4DwmEox+rSA5OIevkSpBkr1CZISiBmW4J+MyR3g2CJgpVD+ZX9ZLIMF
 EHUROeIbugyZzkhM=
X-Received: by 2002:a1c:2c6:0:b0:3b3:efc2:1bb1 with SMTP id
 189-20020a1c02c6000000b003b3efc21bb1mr2097208wmc.38.1664274908119; 
 Tue, 27 Sep 2022 03:35:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4hksFydCZSW9VlvkNex+4culeoZh8r34gYorve8WrDpO2YpadXbM0OdGZVIIIfaf2WJ5DEjw==
X-Received: by 2002:a1c:2c6:0:b0:3b3:efc2:1bb1 with SMTP id
 189-20020a1c02c6000000b003b3efc21bb1mr2097192wmc.38.1664274907925; 
 Tue, 27 Sep 2022 03:35:07 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-30.web.vodafone.de.
 [109.43.179.30]) by smtp.gmail.com with ESMTPSA id
 y3-20020a5d4ac3000000b0022ac672654dsm1528664wrs.58.2022.09.27.03.35.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 03:35:07 -0700 (PDT)
Message-ID: <fa511284-b2f6-33a6-3d6e-43d9f98c5c75@redhat.com>
Date: Tue, 27 Sep 2022 12:35:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 2/7] tests/x86: Add subtest with 'q35' machine type to
 device-plug-test
Content-Language: en-US
To: Michael Labiuk <michael.labiuk@virtuozzo.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, den@virtuozzo.com
References: <20220920104842.605530-1-michael.labiuk@virtuozzo.com>
 <20220920104842.605530-3-michael.labiuk@virtuozzo.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220920104842.605530-3-michael.labiuk@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 20/09/2022 12.48, Michael Labiuk wrote:
> Configure pci bridge setting to plug pci device and unplug.
> 
> Signed-off-by: Michael Labiuk <michael.labiuk@virtuozzo.com>
> ---
>   tests/qtest/device-plug-test.c | 41 ++++++++++++++++++++++++++++++++++
>   1 file changed, 41 insertions(+)


Reviewed-by: Thomas Huth <thuth@redhat.com>


