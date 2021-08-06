Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E543E2433
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 09:35:01 +0200 (CEST)
Received: from localhost ([::1]:51194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBuNg-0001Ar-5D
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 03:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBuMv-0000RO-LM
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 03:34:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBuMu-00014c-9L
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 03:34:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628235251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N607d6Qj+agwebLIz5XbRtbDh7bYY8ilkd0dt28DGcU=;
 b=efq3tXCksiPwAfGb3lKaL8KCo60ra56Duq3p0HKRcZPgJPIclKPXeOJGJyB15PSDdQxrU0
 eVtBgHX71fKaGSJl8N76NAHPn5iS0uSiFilEK8rkGXRMrPRs/NgOKYNbSL7NDj8QAdW+qG
 178ii0OwJ5nxGeMzd55Ks/qaMKEwmYE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-40fkUO0oPwKVMWBFK8i6Iw-1; Fri, 06 Aug 2021 03:34:10 -0400
X-MC-Unique: 40fkUO0oPwKVMWBFK8i6Iw-1
Received: by mail-wm1-f71.google.com with SMTP id
 d72-20020a1c1d4b0000b029025164ff3ebfso3565366wmd.7
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 00:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=N607d6Qj+agwebLIz5XbRtbDh7bYY8ilkd0dt28DGcU=;
 b=l7f0Ehq/4cjFEc8lnk7S8ARWFodB79r01MzKRkdVWEGUTZfA/Lfi9qdiOkeDzKDpv3
 OrxBOWRqk56f6P7OK50rwBNomXf14n4j4n3HJOM+i0twJerVWDRgEDBXp8ZhJwQiWOkj
 HToGzBypURmxbv0v3Zuroa4/O2/LVSV5oqH9XEZD/ddZ5QwN1cmO24oDKEQ4/8gYTd7r
 UQKbck6g/tMdRXCwzDHvilGatufJ2Ggw66JSgaduhTD6IBqmfF1lusBYgRJjURb56bHE
 8Dl9xKnJPKXEGD2JtdYr8sWAa+6dxaG9Yw/dk2zlMkRWh/7u8TmqywgvWuuCrCNuAPPC
 7VoQ==
X-Gm-Message-State: AOAM533GSIu9tWcI88b11KWU2nhw+Pa65hirJpjTBuq1o/qMjtS4c2OG
 QXnvd92hcfmZsJmRvo+ZO7cYJ/BFILhC00GrGlUPt+cfMY+7c7CL96roV1qa8/BWvjVHibNSA3H
 cBSjjkD7Z+fXfLq4=
X-Received: by 2002:a5d:5987:: with SMTP id n7mr9431030wri.260.1628235249503; 
 Fri, 06 Aug 2021 00:34:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzd4ELalBbJhyHAkijULtMMYnRLQ6J7Tke9yt5D7ZZBRG/dpmdopJs5LL+lT4JRqF3cB8WIsA==
X-Received: by 2002:a5d:5987:: with SMTP id n7mr9431005wri.260.1628235249377; 
 Fri, 06 Aug 2021 00:34:09 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6104.dip0.t-ipconnect.de. [91.12.97.4])
 by smtp.gmail.com with ESMTPSA id r2sm8306926wrx.27.2021.08.06.00.34.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 00:34:08 -0700 (PDT)
Subject: Re: [PATCH v1 05/12] s390x/mmu_helper: no need to pass access type to
 mmu_translate_asce()
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210805152804.100333-1-david@redhat.com>
 <20210805152804.100333-6-david@redhat.com>
 <3a4db6af-3f9a-634a-6ff3-2e6cc875b886@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <fbc5ea20-14bb-e6ca-65f4-7fcfd8fcea04@redhat.com>
Date: Fri, 6 Aug 2021 09:34:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3a4db6af-3f9a-634a-6ff3-2e6cc875b886@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.08.21 09:30, Thomas Huth wrote:
> Fixes: 81d7e3bc45 ("s390x/mmu: Inject DAT exceptions from a single place")
> 
> Reviewed-by: Thomas Huth<thuth@redhat.com>

I'm usually a bit careful with Fixes tags if we're not fixing real BUGs. 
At least in the kernel people will really complain if you do that 
(because it might result in backports of patches that are absolutely not 
worth backporting and makes actual bugfixes harder to track). But maybe 
QEMUs policy is different, so I can add it.

-- 
Thanks,

David / dhildenb


