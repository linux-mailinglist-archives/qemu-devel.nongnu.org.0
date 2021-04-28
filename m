Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AECC636DCEB
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 18:24:07 +0200 (CEST)
Received: from localhost ([::1]:42782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmys-0007Cp-Na
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 12:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbmfW-00046I-JE
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:04:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbmfT-0000xy-OG
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:04:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619625841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VWzv79dhOfCvbQC5r24ANwFDN3FblWj9S+W4LOJP8aI=;
 b=GLFI38rYpvBCzGjiTzeZ5m7ktFaaycLuGk/DjZ638D52uAitRZUO/AShgWsdeowehtEbYE
 BFGLttKyg7Zbrj3faCAgHwoq6L2t0PEg//2toyJWHsjlnJ1Iwl/cxW/GhHvA9Sd1QLky61
 PoKKsmEmje4m66cFiR+tLtnHfMFamjs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-gMR9LPM5M82Yq6pWVf5x9g-1; Wed, 28 Apr 2021 12:03:57 -0400
X-MC-Unique: gMR9LPM5M82Yq6pWVf5x9g-1
Received: by mail-wr1-f69.google.com with SMTP id
 93-20020adf83660000b029010d6b1e0949so2045077wrd.3
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 09:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VWzv79dhOfCvbQC5r24ANwFDN3FblWj9S+W4LOJP8aI=;
 b=LmtWrQJc/KuPFgtQd13ZaV/hJSrFWGubvCfiS9808JzBMs92hJ2mm5MsiAHveA8Wie
 1gg5n9JM/VSeLqMou4fhfmfvZeWlK/JRSpOyQzxEDNye5n4gZfALWdvkckwR8UgpkgyO
 gc15q24OWIW1oBmQGOO2wUJdn9+YzvL2m+dh+g4lCMSOmnlg/8V2EiKTlFrpqAFynHYY
 MHiw6h3Qr0Pquro7whWM9VmDjPw2i1fUAjgD6mbugNOVb3+Mf5iSM0tUWF5OmTi6rztb
 psCRopZky0WuTRqtCbu4eijOGSqAC8A7aaAGL4h/agQAQO7f2t7C+r32LMfpIfJcl1oU
 RF9Q==
X-Gm-Message-State: AOAM533QHqvFyAUCpj7e1HVw+w8uo1lu0CrCIxOIAB3dX5qRZgf5S4p9
 KImr+jKUPHIqPsihD0DSX84K0BblYTCcCw8lUqp3C+KutAyevYnx1VXdeffCe2tDIoEe3c61wxg
 SUQ8gsF5yP9eWUsY=
X-Received: by 2002:adf:cd89:: with SMTP id q9mr10555927wrj.147.1619625836352; 
 Wed, 28 Apr 2021 09:03:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw72dT/vsBEmhvsKrpp4jzv5dcu3oWBRWtHufZX4h+LqPGakBcS3KpBll1myBCN/rVv9xbJPA==
X-Received: by 2002:adf:cd89:: with SMTP id q9mr10555887wrj.147.1619625836111; 
 Wed, 28 Apr 2021 09:03:56 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id x64sm107562wmg.46.2021.04.28.09.03.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 09:03:55 -0700 (PDT)
Subject: Re: [PATCH] accel: kvm: clarify that extra exit data is hexadecimal
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20210428142431.266879-1-david.edmondson@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5fbad3c6-0219-9dad-2a04-98198dacb01f@redhat.com>
Date: Wed, 28 Apr 2021 18:03:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428142431.266879-1-david.edmondson@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 4:24 PM, David Edmondson wrote:
> When dumping the extra exit data provided by KVM, make it clear that
> the data is hexadecimal.
> 
> At the same time, zero-pad the output.
> 
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
>  accel/kvm/kvm-all.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


