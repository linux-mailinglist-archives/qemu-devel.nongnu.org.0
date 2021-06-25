Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7728F3B3FC3
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 10:50:32 +0200 (CEST)
Received: from localhost ([::1]:40974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwhXj-0007Sx-J3
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 04:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lwhVf-0004g7-Vs
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:48:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lwhVd-0007bT-2x
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:48:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624610899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hWtmVDVH6JryLg4nwM7b1oRc9PXiYsOK8sS89fh71ec=;
 b=LDVAD8JLsx5lB2OVINNdCrixtneWhYZE5A5BVSXZrfW1Z4jWkoMTHKubYx0+9s3rPJvP0c
 TpaJ25L4SSihYJO2u32SbQUF5J0fehUv1jLWY2GXku3qUI9P01zAi97VvcRZx3vbRzsMqg
 JTdkh1eqniwQTTKaleYkn2Pu6JFyczM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-EDa0pzk0NdmF2udxJg1NfA-1; Fri, 25 Jun 2021 04:48:18 -0400
X-MC-Unique: EDa0pzk0NdmF2udxJg1NfA-1
Received: by mail-wr1-f69.google.com with SMTP id
 g8-20020a5d54080000b0290124a2d22ff8so2663247wrv.4
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 01:48:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hWtmVDVH6JryLg4nwM7b1oRc9PXiYsOK8sS89fh71ec=;
 b=E3q2DbPuw5qn37bRPz1I5Htn5KmQ4y5o71iz9vPDoX//2dklfnfJRs9niCvoNZfjMq
 JTEzwKwLjwdyXh/RHcJK48EarmiHWj0T3IFzyEZvOKHGWxqlbfCuIPJ+uKU53xjCJ4u0
 itsrQfQnqtIyjpE7Ls0PL33uFTbeQS1CQhiiy4h3GLbiPv+lzxD7+C9fnKr04UTMjrmi
 M/zglpp+4Gl/52tMtnVWkBBBwr1bG0uu1VxhYQqvlVJX4gSfF9e3G2AAloV8tqo8Mrj2
 pA+wue8mrTm9jlQvUw7YkBcQPnETZSHI4WhNP2hOk0ug6K85hAv+aS4FWFyGI7SLaXSL
 R4Hg==
X-Gm-Message-State: AOAM530Xw2Xou+n72mEHv+2VIrBduTP7iXi4OxcuvKtOBerpK7Uphm1E
 hyjQ/PP95zUvSMLdJ7fnJvd4IVwpq8Ub2/vstZcTb3UEO5XuUVBoevN0Jd3Cc1VCNMh8vHQV17q
 RRdE3aVR2UJuHnltPHqSX5BCN6mi1GvXuQOxGkc2wnIU2n6OjMqs8NGN6Lmk9xTz+fNQ=
X-Received: by 2002:adf:dfc7:: with SMTP id q7mr9576394wrn.138.1624610897382; 
 Fri, 25 Jun 2021 01:48:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxi5PsUqK6M9hDf0sro8JGwJrL71nZvA5gYOycr31MFO3CgTAdwyn6GVzyrNegx1uOqzmT2iw==
X-Received: by 2002:adf:dfc7:: with SMTP id q7mr9576369wrn.138.1624610897051; 
 Fri, 25 Jun 2021 01:48:17 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d4sm5208443wmd.42.2021.06.25.01.48.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 01:48:16 -0700 (PDT)
Subject: Re: [PULL 00/12] Misc, mostly meson patches for 2021-06-23
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210623121424.1259496-1-pbonzini@redhat.com>
 <CAFEAcA8kr5sn-jQ_wLa6a-m0DmbWPh1v6YuHQK74dy8pp01-Vw@mail.gmail.com>
 <3d085a3d-d4e0-6750-65c0-ec91c5f63d8d@redhat.com>
 <CAFEAcA_TAZ-CgzM4pQxr71jaC2Vr0kenF2WXsqcR13YLaddDDQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <905d5cdc-da96-7c84-4ea7-27cf78fa164d@redhat.com>
Date: Fri, 25 Jun 2021 10:48:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_TAZ-CgzM4pQxr71jaC2Vr0kenF2WXsqcR13YLaddDDQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/06/21 10:09, Peter Maydell wrote:
> Looks like a missing #include <stddef.h> in the test code, rather
> than anything specifically libpam related.

Yes, indeed.

> More generally, I think if meson probes for some library
> and can't find it, the correct response is that it should
> just print "Library libpam found: NO", not a "WARNING".
> "You don't have an optional library, we'll skip that optional
> feature" is a normal situation.

The "NO" is present in the final summary; having the library but then 
failing to compile something is a relatively common case when you cannot 
filter by version using pkg-config.  But indeed we can downgrade those 
warnings to message().

Paolo


