Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA7B48C05B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 09:53:19 +0100 (CET)
Received: from localhost ([::1]:55634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ZNe-00026A-Gb
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 03:53:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7ZHN-00041v-L2
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 03:46:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7ZHL-0004un-Hr
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 03:46:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641977203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C/cPjrFB0jwsfniSJ0EC1i9ZraCNqS3sUbHsRPDn3Jo=;
 b=XyipgEsqyVXrsnPk8ZyEXl8+wKSjhpzpmm7st5Zc8yDZqLiOdIzbkQIeYxW59tuu+7jIaH
 ajWW7SFzy+BIrEzWXwFGzdjC/v8fVHtbInVOSEH5NHHDow6amuDfMEYFfSR4706MZ+YsCR
 6c/XAYR8kQ2YXDluHAcW4RnxmjCaAAQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-uu2GRceOPli0FyieSMGONQ-1; Wed, 12 Jan 2022 03:46:40 -0500
X-MC-Unique: uu2GRceOPli0FyieSMGONQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 g11-20020a056402090b00b003f8fd1ac475so1665191edz.1
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:46:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=C/cPjrFB0jwsfniSJ0EC1i9ZraCNqS3sUbHsRPDn3Jo=;
 b=iQ6SnM8LfxaXzoPS8ZHB4YpHlWZ99HI85ctyPfZnlmCSoY7zbsHjvRgzaKQqDs7k2a
 ClLuTEQVjCtNzjIE2pz52HxTZYGGpYY2awRTlkXAZPTCkFWMnqmHhmE9dDSl4Af0mWhu
 LntGdgK8Ra9WVdmJxNFRygsFT7zpu/yCJIIDDf9QpQCmVIPCDArv/l6WNcvlxhepvIqq
 qFhoA39fdbKsnaEs0h/2ac93RWNRPDwEZTDnho3wKBPm2d28hnV9wOH29m8UZjGwSLVi
 kngGPGvoZVjQ3Fq8f5ceI0HA1suoZo9sRCqeprN3vVc1u2UYE5xmo9QnWcRNgHgydRDG
 Xzlw==
X-Gm-Message-State: AOAM530ts67FHJ1fBm2/kUhxDheaAd0axruV2sFmm1no/Wp1Ve54B+i+
 FTbn55YM19ihNRZq7ggVj3lBHbf8GtM1NwgJATYLPn32TRVzxCnYI99ZRva7kMElUBGe/KBAHDb
 RFSHLbrRpCopoyd8=
X-Received: by 2002:a17:907:1c91:: with SMTP id
 nb17mr4762261ejc.712.1641977199819; 
 Wed, 12 Jan 2022 00:46:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTdzzwzxwP8Rx2L1KCjx9+i8W5cMATatISvL+bpr2CvLhE2IjwDxEQOzd3Oiv5jZillIFXeg==
X-Received: by 2002:a17:907:1c91:: with SMTP id
 nb17mr4762247ejc.712.1641977199646; 
 Wed, 12 Jan 2022 00:46:39 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:4700:e25f:39eb:3cb8:1dec?
 (p200300cbc7024700e25f39eb3cb81dec.dip0.t-ipconnect.de.
 [2003:cb:c702:4700:e25f:39eb:3cb8:1dec])
 by smtp.gmail.com with ESMTPSA id 9sm1604744ejt.181.2022.01.12.00.46.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 00:46:39 -0800 (PST)
Message-ID: <d43c1b0d-929c-4c7e-3091-16d5d9c61221@redhat.com>
Date: Wed, 12 Jan 2022 09:46:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 2/5] target/s390x: Fix SRDA CC calculation
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20220112043948.224405-1-iii@linux.ibm.com>
 <20220112043948.224405-3-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220112043948.224405-3-iii@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.01.22 05:39, Ilya Leoshkevich wrote:
> SRDA uses r1_D32 for binding the first operand and s64 for setting CC.
> cout_s64() relies on o->out being the shift result, however,
> wout_r1_D32() clobbers it.
> 
> Fix by using a temporary.
> 
> Fixes: a79ba3398a0a ("target-s390: Convert SHIFT DOUBLE")
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


