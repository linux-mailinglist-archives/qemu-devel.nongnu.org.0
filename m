Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EBD3109C2
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 12:03:55 +0100 (CET)
Received: from localhost ([::1]:46472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7yu2-0001aM-Ko
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 06:03:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l7yp2-0006zF-Hx
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 05:58:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l7yp0-0001re-9d
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 05:58:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612522721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ar6pmHOG9ohjNwuT9xmR1n7AYEJnQV5pDPdadEFl8sM=;
 b=Lw5ld1plNXIerRR+EYBzXNIElt6xzINqmH7xl+gC1fWXU4+ACVRCYbh8iprGLPkwXUn2vh
 x2tLgMKDsW5taBi5XxNy7wDzOsQg8Ku6i8Liknz1H5zxe9dxNUCSy9QyRZbLBdDeROkP0h
 g4u3Hl8DvEmQFEyqICRLuaQ3ewB9E/8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-oYvvm27rP1GRY4Te0bCMSA-1; Fri, 05 Feb 2021 05:58:39 -0500
X-MC-Unique: oYvvm27rP1GRY4Te0bCMSA-1
Received: by mail-ej1-f70.google.com with SMTP id hx26so6559950ejc.3
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 02:58:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ar6pmHOG9ohjNwuT9xmR1n7AYEJnQV5pDPdadEFl8sM=;
 b=DYRka7KRiwqu7Mq1BijKWd7vnpka+hrfQaen6Z0jXmq3lff80/TLvaTSc2zNFz8ti/
 mdcI/lAkruFIY6g5typ7D/Hx3HbSQKkyp/bJ4RbUf5ilA8L37pBW8xPk/jSUPBUDku3c
 ZtAo+BM5m6sW0Ks9ag2FpURysYlU+WLMkpYwyk8t5fYAHxs7vUDO6rF1hdRde/zzvTJw
 exHkgXCB3qpwO8QIo/ND6SqeM/uFYU+7oMy/+4K/Fsk3HmpqQbiBsx4VE5eiw/b6ukAs
 hyuC1WP4H6mSwtubGRQPpQtMP7QHrtWKj/hHceulDvNTVTDn9vWz9m0anxeeKI3kEk7W
 r8yg==
X-Gm-Message-State: AOAM533PKxAkWxVkB1z95RESEU8Qz8vXnm1Kguf4d2G/HxJC9z1FWbt8
 K4saJOzygK02iz3t5lQnmusnRc7NRWOehU3OKi+bCRHhD0UUFoESle0MVp5f0RDGa4uKlnUR3Xo
 ZHDzeeRSfJ8kBqyc=
X-Received: by 2002:a17:906:c0c9:: with SMTP id
 bn9mr3576488ejb.318.1612522718517; 
 Fri, 05 Feb 2021 02:58:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJymgDIi2ugcmlyoT0Yq6LRfQEOA8NuoMxYs/VIcgSwjrbh8H0K7q4l/RH8MUVvYExvz6QP31Q==
X-Received: by 2002:a17:906:c0c9:: with SMTP id
 bn9mr3576468ejb.318.1612522718318; 
 Fri, 05 Feb 2021 02:58:38 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o13sm3831630ejb.10.2021.02.05.02.58.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 02:58:37 -0800 (PST)
Subject: Re: [PATCH v3 0/2] sev: enable secret injection to a self described
 area in OVMF
To: James Bottomley <jejb@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210204193939.16617-1-jejb@linux.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <928ce950-c148-ef00-e46a-01ad5425e797@redhat.com>
Date: Fri, 5 Feb 2021 11:58:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210204193939.16617-1-jejb@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thomas.lendacky@amd.com, ashish.kalra@amd.com, brijesh.singh@amd.com,
 david.kaplan@amd.com, jon.grimm@amd.com, tobin@ibm.com, frankeh@us.ibm.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, dovmurik@linux.vnet.ibm.com,
 Dov.Murik1@il.ibm.com, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/02/21 20:39, James Bottomley wrote:
> v3: add bounds checking and remove misleading comment
> 
> v2: fix build issues and update comments.  Also drop the first patch
>      which is now merged upstream
> 
> The two patches introduce a parser for the optional OVMF description
> table which is placed just below the reset vector (the format of the
> table is described in the patch itself) and also adds a hook to pull
> out the description of the SEV secret area location and use it in
> place of the sev-inject-launch-secret gpa.
> 
> James
> 
> ---
> 
> James Bottomley (2):
>    pc: add parser for OVMF reset block
>    sev: update sev-inject-launch-secret to make gpa optional
> 
>   hw/i386/pc_sysfw.c    | 112 ++++++++++++++++++++++++++++++++++++++++++
>   include/hw/i386/pc.h  |   4 ++
>   qapi/misc-target.json |   2 +-
>   target/i386/monitor.c |  23 ++++++++-
>   4 files changed, 139 insertions(+), 2 deletions(-)
> 

Queued, thanks.

Paolo


