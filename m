Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B153BDBA8
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 18:49:25 +0200 (CEST)
Received: from localhost ([::1]:54370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0oGC-00078k-12
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 12:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0oFL-0006SY-2L
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:48:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0oFJ-0007iQ-HC
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:48:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625590108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=03MOwwkme//ZrEE0fkzEfYu/BGHVa46JTYFYSj98MzM=;
 b=B5W42fg6q1xVtt5cFQRA9/SoBR5Vfa+el3DUqQ2qfRHAYA+JsRFuYm/NR2cjlSmCM0I1U8
 AVCZqyyMNMHva52eun47q57btF3vIsFmLUshvWcK//jrpJFj7tgVh7+oJR7Uxez6Dz75W4
 PeYRwJEPux2K2KctCxHTrjZq+EKXhXI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-xL40uqVaP4SMFO9SVqLEkQ-1; Tue, 06 Jul 2021 12:48:26 -0400
X-MC-Unique: xL40uqVaP4SMFO9SVqLEkQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 w15-20020a05640234cfb02903951279f8f3so11140846edc.11
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 09:48:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=03MOwwkme//ZrEE0fkzEfYu/BGHVa46JTYFYSj98MzM=;
 b=JNK1W22HD3JaFAnHbMaVdauOdCii0sYoOL0mvcbbL7Nb4FcZqT8GwULW8EmaA4NMy2
 ArkqFA08y5zMhf7pAX7fK0B8QzgfweBW6dqcqtBGQJ5ns0sKFoPtAwy99H3DdW5siMq0
 0/Ng2FXxbLGg0iyTD5eP/KdBI4tmzNdckD0TEcEizXyHNhydbqHqFEupzp511QfDhqY9
 EMavjZSGykrB152UXC6cb9CxeEsyyN2KS6WW4rvUDLpV/nx1QpSHpsgHv+6dLqb+aZCY
 +Xsco8sxXqe9BlHd4hK0uLIOLn8SQa9A2Mhd+2q6DvlmAujQhTe3jttzm4yX6hjWT0Q1
 uBSA==
X-Gm-Message-State: AOAM533bl+ncGjnKl1DQALOWbMMnYWrxeGr3GETtO2K1B+xaxtS9JsZ3
 Z8z6j6pjnaEpdl7FVTRsbeNV3Wi0dNO6cPDeMmZOxdStEkJFxVx6+IZVFWEZQ2DzxQny6YJfNh6
 hYcSZ7iRYxbUWTgPzKlnwDlKZT9+IzBC5TkavwJBsaErSadnSNFB0YF4v9gruakkcLd4=
X-Received: by 2002:a17:906:15c2:: with SMTP id
 l2mr19450254ejd.348.1625590105536; 
 Tue, 06 Jul 2021 09:48:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvyiEN+M/8c7oyUeXIpCRKfclum9+Ki1CdlURI3tD/JREp/s92p2uZUQhp2UaIwZilbWCJGw==
X-Received: by 2002:a17:906:15c2:: with SMTP id
 l2mr19450228ejd.348.1625590105315; 
 Tue, 06 Jul 2021 09:48:25 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x16sm7458389edq.62.2021.07.06.09.48.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 09:48:24 -0700 (PDT)
Subject: Re: [PATCH 3/4] target/i386: Added consistency checks for EFER
To: Lara Lazier <laramglazier@gmail.com>, qemu-devel@nongnu.org
References: <20210705081802.18960-1-laramglazier@gmail.com>
 <20210705081802.18960-4-laramglazier@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <33fdde6c-28ac-5f62-e47c-b8fbf4fac0b3@redhat.com>
Date: Tue, 6 Jul 2021 18:48:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705081802.18960-4-laramglazier@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> EFER.SVME has to be set, and EFER[63:16], EFER[9], EFER[7:5]
> are reserved and must be zero.

My version of the manual says "any MBZ [must-be-zero] bit of EFER is 
set", so that would be 7:1 (not 7:5), 9 and 63:16.  In QEMU bits 13 and 
15 are also unimplemented and thus must-be-zero.

On 05/07/21 10:18, Lara Lazier wrote:
> +#define MSR_EFER_RESERVED 0xffffffffffff02e0
> +

This has the same issue with 32-bit compilation, except in this case the 
check *is* needed on 32-bit builds just without bits 63:32 set.

The obvious way here would be to add a #ifdef, but that's less 
maintainable than the slightly ugly:

#define MSR_EFER_RESERVED               ((target_ulong)(int)0xffff02e0u)

(where I was too lazy to compute the right mask for the bits I listed 
above...).

Paolo


