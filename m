Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 413913FE0FB
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 19:11:47 +0200 (CEST)
Received: from localhost ([::1]:59432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLTm6-0003Dz-CX
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 13:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mLTkw-0002Oc-Fc
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 13:10:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mLTkt-0003ih-8N
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 13:10:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630516228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eZXdvrOQRGOK76PQrl2ZMZIXi7fA+FsivwFbPahqCpw=;
 b=BAp7Qu6OMy9j/pBMAs8rk/3ESfzZNIYcJruqhBhnhl//PLjVNQHuRUcgdt2Ufh8CDKoXsV
 l7NImROu1uw2pmh0Db8wLjeOnXme+0KCBtMfMMqVo66GKo8SaFW/kfFwKUuhuj2mpSqOWl
 noSJ9DxMF1vtFjvIbu7i1+GBL6Y9BrQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-laQBvkFUMiO5bMpneimUbw-1; Wed, 01 Sep 2021 13:10:25 -0400
X-MC-Unique: laQBvkFUMiO5bMpneimUbw-1
Received: by mail-wm1-f71.google.com with SMTP id
 o20-20020a05600c379400b002e755735eedso89572wmr.0
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 10:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=eZXdvrOQRGOK76PQrl2ZMZIXi7fA+FsivwFbPahqCpw=;
 b=RJxNIzccZbmHV8EHCvra9KMXBYx5hgnMLTY2I2H2F6REWcKUFGHuWX6QERW2mKJSim
 ghrk0LjyGXLP0Hsqahx+41UQGNMWlVfpOaF01x613zQNxPVf10F3U21h6G3nslEWRsE6
 TPBNqubIh6pqnZAW3Lwpd2ZHJxBQajdmZlrMuon9hOfATWdXagXopv+RhmgqFb3XOlS8
 DV/9eS7Rxg/9Af208RiY0Lm1/dgmEfhOEWNnBRK4B/0xRdKItQ1YmEEKDWh2I2OJxQVO
 F+F420FW/E1MuyZYHR8ilyUKh5Yps6Foip1HV1nuXRnnySnolueCu9pb2bfsLomE1ZCf
 5O3w==
X-Gm-Message-State: AOAM531HttWr7miUaOzjNrBDBvceZT/Ov89PR6BL48MYhSVnVN2dJ86t
 fQmA7to/3O46IW6dP66lmE5XDfiYnaiUxAp6ttFHSU2VmXbutZ5RFfyshjIxtCNWLGLeDCl8dUk
 MQL4OhdewpxDzZ5k=
X-Received: by 2002:adf:b741:: with SMTP id n1mr536168wre.120.1630516224853;
 Wed, 01 Sep 2021 10:10:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7ZAkp+4a/ObWn3KA7uO3xUW/Qqinclwu1dLJRRCmJQ9sg1L9FMV7wbFhBmyFxP4rg3SH/eQ==
X-Received: by 2002:adf:b741:: with SMTP id n1mr536137wre.120.1630516224629;
 Wed, 01 Sep 2021 10:10:24 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23f71.dip0.t-ipconnect.de. [79.242.63.113])
 by smtp.gmail.com with ESMTPSA id m4sm136936wml.28.2021.09.01.10.10.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 10:10:24 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] memory: Extract mtree_info_flatview() from
 mtree_info()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210901161943.4174212-1-philmd@redhat.com>
 <20210901161943.4174212-2-philmd@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <5179bb7e-4d7a-494d-a3ac-cf15f2d075cd@redhat.com>
Date: Wed, 1 Sep 2021 19:10:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901161943.4174212-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Xu <peterx@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.09.21 18:19, Philippe Mathieu-Daudé wrote:
> While mtree_info() handles both ASes and flatviews cases,
> the two cases share basically no code. Split mtree_info_flatview()
> out of mtree_info() to simplify.
> 
> Note: Patch easier to review using 'git-diff --color-moved=blocks'.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


