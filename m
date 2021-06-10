Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 238413A28B9
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 11:51:11 +0200 (CEST)
Received: from localhost ([::1]:43328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHLB-00089h-Ns
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 05:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lrHJM-0006hy-Hu
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:49:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lrHJK-0000tn-QV
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:49:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623318553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hFBWZfdmipNJzZjtHgq07dfMglG1LaNarrG8B4aVxDs=;
 b=Yf1RYS4tdS0ZGsLLNPy+eepni7sVUZxc224EWtOlnKH6OGlW0RfB402kQQtecQPUcrycXt
 MSSHMmob70A5uw+njs//yYVg3JVXDd9OjdwwmJAKuXsNtW3tNqmmCoE+vuLJIGpASt9XQU
 QDXJIfeKe4RberX3PH4Y1plGAxeAjHg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-96_SqLO7Of-Szg424QJOTA-1; Thu, 10 Jun 2021 05:49:11 -0400
X-MC-Unique: 96_SqLO7Of-Szg424QJOTA-1
Received: by mail-wr1-f70.google.com with SMTP id
 v15-20020a5d4a4f0000b0290118dc518878so637828wrs.6
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 02:49:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=hFBWZfdmipNJzZjtHgq07dfMglG1LaNarrG8B4aVxDs=;
 b=ToxNdW8IQBws7j59X53vEGOgsAK2eIh9AlhpqSOVSVuQPxdi1kOO0ieoF9shYlP3Ve
 r/IUWgrdY7N/v5lL3QvypHbzF3vXVvs1rIfR8MJZqKePje1fRetU7xZxQTtih6MWmxxT
 ak0cNG4E8MAgpm5Y3ipjuQhL/Yj2+tW2n9Tk4846NNq9TTv/LldMhp2qQGWw4Et4x7Xv
 HPT6Cy1u7G9QJxWtx72uqtXCKxjo95k4P0Eth97IzGoAAW39+jPBwS9ud+Y5DamFQlBM
 cNzf+K6kjMzh0wZZiMf6nYSZjgQwGN8eC/v51YY5DgxyRqFZI7fg7PVAPKQjoJTDrIrD
 ORtA==
X-Gm-Message-State: AOAM530EY17FykPeErbpnJLwj+LS+sNAFfoBGh43J/kUcqQBZ2l2IGhx
 aD8OiL9idjnJnWY4cKpPyY5SZENGk2kgAIakYyCGEwDJK2D3IN1o7rTFtNwNOhBr0IaOuNXEwfr
 W+27Pe0eBCPyEOXw=
X-Received: by 2002:a5d:6482:: with SMTP id o2mr4221822wri.79.1623318550107;
 Thu, 10 Jun 2021 02:49:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQpZmE9/jS2J7eLsf4dayx7BQwYTXYgiggfxTutzaKaZDAxSUk+uMtY2vX8nThxyZbkRFc3Q==
X-Received: by 2002:a5d:6482:: with SMTP id o2mr4221786wri.79.1623318549852;
 Thu, 10 Jun 2021 02:49:09 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c626e.dip0.t-ipconnect.de. [91.12.98.110])
 by smtp.gmail.com with ESMTPSA id
 o5sm2928855wrw.65.2021.06.10.02.49.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 02:49:09 -0700 (PDT)
Subject: Re: [PATCH v3 0/2] target/s390x: Fix SIGILL psw.addr reporting
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>
References: <20210602002210.3144559-1-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <972102fd-ac1e-f13c-7aa7-ad6c7a9be67e@redhat.com>
Date: Thu, 10 Jun 2021 11:49:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602002210.3144559-1-iii@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.06.21 02:22, Ilya Leoshkevich wrote:
> qemu-s390x puts a wrong value into SIGILL's siginfo_t's psw.addr: it
> should be a pointer to the instruction following the illegal
> instruction, but at the moment it is a pointer to the illegal
> instruction itself. This breaks OpenJDK, which relies on this value.
> 
> Patch 1 fixes the issue, patch 2 adds a test.
> 
> v1: https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06592.html
> v1 -> v2: Use a better buglink (Cornelia), simplify the inline asm
>            magic in the test and add an explanation (David).
> 
> v2: https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06649.html
> v2 -> v3: Fix SIGSEGV handling (found when trying to run valgrind under
>            qemu-user).
> 

There might still be something wrong:

https://gitlab.com/qemu-project/qemu/-/issues/319

At least it smells like some more signal (mis)handling.


-- 
Thanks,

David / dhildenb


