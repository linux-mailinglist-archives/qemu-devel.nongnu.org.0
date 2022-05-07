Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A02B51E485
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 07:52:06 +0200 (CEST)
Received: from localhost ([::1]:57428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnDMI-0002KJ-Kp
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 01:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nnDId-0000Uz-IK
 for qemu-devel@nongnu.org; Sat, 07 May 2022 01:48:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nnDIa-0003Ay-DB
 for qemu-devel@nongnu.org; Sat, 07 May 2022 01:48:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651902491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qDCBwMPXnLP//bfuuFN6H02r15Dgj2SRC53tUVDhmb8=;
 b=SpUPJ6sk17h1YCT6QY6x1vkMlvOQgqkuYJPlx3N0AdHRYLh1HK7llJQMUgxKmSSXPdso74
 hWLzkZByZSxXarU8DyavqUqpRU4CiEsL2+qETzhuo9Ufswp3wEp+X4Vjp5dLtgfSa/sION
 m5T6Co7ZlWShIsbLenrEYLvIEZ+nyFk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-KxmmmsTQOdeWbUoLDheBWA-1; Sat, 07 May 2022 01:48:08 -0400
X-MC-Unique: KxmmmsTQOdeWbUoLDheBWA-1
Received: by mail-ed1-f69.google.com with SMTP id
 s29-20020a50ab1d000000b00427e495f00cso5006089edc.14
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 22:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qDCBwMPXnLP//bfuuFN6H02r15Dgj2SRC53tUVDhmb8=;
 b=JYivXDAV46EZ9zEMipfSm2ytLrhOHs56TiNoo/6L43juPKO24sXvfEgap4EwzSFdPG
 JYG0cU1XOIaUfaap1M1R4JSv9hL1fiWMiDMAyVr0gfoUNisYolp+2uC/yY7CsHoGFZEn
 VpsxM4abIef3RpviO2Uha8Isgfef5Fyzn9GlTIBGy/Po58L+41uwUAKmwDQBR27ja6uq
 emNFC3VDVaExFtzi/UYlWNt5ss/sMnOeiSodDFw7vuVOmXfe3HKQcPa+VFPcNFqA7L3s
 RRn905bqEwTnWugxle4CTwwH0hrSABgacj3V+QLIrMMJXjZ2cuLn2MS2UOXil33XBPkS
 lJWQ==
X-Gm-Message-State: AOAM532IS6EhCkqdOH6nEvYSZRUw+1fuMCvUeT5q3Rwf6vOP2SuUDD9c
 Up2ff54xAa/lTZJprhOhfXEFVc/lecnuE5Wm7CZ2GpUrvAJlFDa3wLBseiAKZLme+7Bo8QODHgd
 orBAFF3wQ6HTXnCs=
X-Received: by 2002:a17:906:cb97:b0:6f3:c671:a337 with SMTP id
 mf23-20020a170906cb9700b006f3c671a337mr6087299ejb.93.1651902486907; 
 Fri, 06 May 2022 22:48:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwkWvX9M/9PPQ44w/97LwYIGCEDdnpo783MfI6BuZFvN3eTJZ9eiBF+SDDUNQ+nC5cB6jzTQ==
X-Received: by 2002:a17:906:cb97:b0:6f3:c671:a337 with SMTP id
 mf23-20020a170906cb9700b006f3c671a337mr6087290ejb.93.1651902486689; 
 Fri, 06 May 2022 22:48:06 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 og9-20020a1709071dc900b006f3ef214e58sm2564656ejc.190.2022.05.06.22.48.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 22:48:06 -0700 (PDT)
Message-ID: <a6d944cb-4b4e-7afd-1a89-e5927d2ba19e@redhat.com>
Date: Sat, 7 May 2022 07:48:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] pseries: allow setting stdout-path even on machines with
 a VGA
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org
References: <20220505092656.728925-1-pbonzini@redhat.com>
 <40654c7a-7ddf-f737-7886-ecab48e8c2cc@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <40654c7a-7ddf-f737-7886-ecab48e8c2cc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

On 5/6/22 00:10, Daniel Henrique Barboza wrote:
> 
> Removing the negation seems to do what you want:
> 
> -        if (!spapr->want_stdout_path && stdout_path) {
> +        if (spapr->want_stdout_path && stdout_path) {

Yes, of course.  Sorry!

Paolo


