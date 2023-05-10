Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 080F56FD861
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 09:38:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pweP2-0004xq-IU; Wed, 10 May 2023 03:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pweOz-0004x4-KO
 for qemu-devel@nongnu.org; Wed, 10 May 2023 03:38:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pweOy-0007IU-79
 for qemu-devel@nongnu.org; Wed, 10 May 2023 03:38:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683704299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0pOkYKjAujf1E8Mn8Z9j8FYMpEcGJexuNHtXuqmzVk0=;
 b=Zd3ejv+dKkWwv2tHvvF7H8cthaOoVHTLYaz5zUfXTCqnH5JFI1Jn5O2L4Lq9h3zrbRmdk1
 HdK8mN6vhJUWgK6geujxUXoCc2DNYG5KUCynx3ZPVcgnx3FcRv9ZkN7UeFqgiz9sJ50NBk
 vF4dOYRwvI8U+Mh3taZ3LldK+IqD4Nw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-fl3VHtytNeCz0UQU9JxexQ-1; Wed, 10 May 2023 03:38:18 -0400
X-MC-Unique: fl3VHtytNeCz0UQU9JxexQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f4245ffbb4so18375225e9.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 00:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683704297; x=1686296297;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0pOkYKjAujf1E8Mn8Z9j8FYMpEcGJexuNHtXuqmzVk0=;
 b=cf7KX9EvaVZJBBGP/5g22T41f5M9zhKaLKm708/dujitSvS/Rbom1Xs3rxu4JMQAjl
 mVxXY8K1c37yV0LMW96nXfD08xCh5cbfygDQbc4oo0VhexyE3aRGg3grqjCOgR+tBVeW
 LcIbAVhx+baAyq5ruW5qAzhH4y0xBH5fAvEXbfz9k2hUmhBX8NsLQ6J01tA5BckvVyjR
 vRqK2mwpXfrICOOO9EhaP2vXlwLosLhkK8+EP0SVk6sr+xWRZVs4MYuZ+Bq6qSuQdInE
 FCj/63MW213pdfjJiJ5QItVpgNRKjepFsDR2AX2vKlfcwefSEddcb3G+FDOiQRj8XGex
 tYqg==
X-Gm-Message-State: AC+VfDxiD0O7Wl4f1wJH9i0oJq8x3fuN8Oty1Obn7VMJECNL4B8m21mK
 T5dAy7eqs/1VTt8rkOOUz9NEsfaSnxLNeOUaEsxXccfQRBAGJu+RzO1OtRYLA+FnzDF+n9y8/sN
 IjcQ1yiCGgapBjgsQf7EHVBM=
X-Received: by 2002:a1c:f202:0:b0:3f2:5be3:cd6a with SMTP id
 s2-20020a1cf202000000b003f25be3cd6amr12137079wmc.4.1683704296880; 
 Wed, 10 May 2023 00:38:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5hZZHEGMOIq/2ZMNTQB9AdTCHSKYZzt8RUKG9V04xIwAcAQRtL+n1gNZpvB9L0vUVIwKlMgg==
X-Received: by 2002:a1c:f202:0:b0:3f2:5be3:cd6a with SMTP id
 s2-20020a1cf202000000b003f25be3cd6amr12137065wmc.4.1683704296603; 
 Wed, 10 May 2023 00:38:16 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-53.web.vodafone.de.
 [109.43.179.53]) by smtp.gmail.com with ESMTPSA id
 a22-20020a1cf016000000b003f42d8dd7ffsm2608416wmb.19.2023.05.10.00.38.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 00:38:16 -0700 (PDT)
Message-ID: <44b6de30-d8e5-0e7d-2d79-6cdda9e7d46b@redhat.com>
Date: Wed, 10 May 2023 09:38:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 1/1] s390x/pv: Fix spurious warning with asynchronous
 teardown
Content-Language: en-US
To: Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, borntraeger@de.ibm.com,
 nsg@linux.ibm.com, nrb@linux.ibm.com, frankja@linux.ibm.com,
 pasic@linux.ibm.com, mhartmay@linux.ibm.com
References: <20230509162740.58081-1-imbrenda@linux.ibm.com>
 <e2f59e7e-e5d5-0bc3-e889-e84460ca99d6@redhat.com>
 <20230510093259.7884eb40@p-imbrenda>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230510093259.7884eb40@p-imbrenda>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.421, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/05/2023 09.32, Claudio Imbrenda wrote:
> On Wed, 10 May 2023 08:47:08 +0200
> Thomas Huth <thuth@redhat.com> wrote:
> 
>> On 09/05/2023 18.27, Claudio Imbrenda wrote:
>>> When rebooting a small VM using asynchronous teardown, a spurious
>>> warning is emitted when the KVM_PV_ASYNC_CLEANUP_PREPARE ioctl fails.
>>
>> Why does the _PREPARE fail in that case? Why 4GiB and not more or less? This
> 
> because of kernel commit 292a7d6fca33df70ca4b8e9b0d0e74adf87582dc, which
> fixes problems in case the VM is small (<2GiB)
> 
>> sounds racy... what if you have a faster or slower machine?
> 
> why racy?
> 
> 2 or 4GiB is still very fast, and at some point you have to draw a line.
> I could make it 2GiB, which is the limit at which _PREPARE will fail,
> but since I'm touching this code, I would like to avoid unnecessary
> overhead, instead of "just fixing"
> 
> I can put the limit to 2GiB if you think it's more clean

Ok, so this is not due to some race (which I first suspected), but due to 
some change in recent kernels. Please put a link to the related kernel 
commit in the patch description, and yes, I'd prefer to use the same 
boundary as the kernel here (i.e. 2GiB instead of 4GiB), just that it is 
clear that we're not using an arbitrary magic value here.

  Thanks,
   Thomas


