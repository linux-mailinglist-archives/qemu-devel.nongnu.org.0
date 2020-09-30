Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B274C27F0B0
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Sep 2020 19:48:10 +0200 (CEST)
Received: from localhost ([::1]:59634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNgD3-0003bk-PL
	for lists+qemu-devel@lfdr.de; Wed, 30 Sep 2020 13:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kNgBg-000320-K6
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 13:46:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kNgBe-0004Or-DK
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 13:46:44 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601488001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZWUx5DmjrfB9LPqMu2R6Bn9Fs7Axz3MPsvf8u5tx4N4=;
 b=GJbrhn/eRRHNXIAl8Q/FRGzeeFobmtFDNb44AO+MsH04q4860laJav2rzKfHwXs9NSn8A1
 HERNsnA8QjmMzXdhiPFnxA/FS7iXgTEzegT+eNvI6s8Ydi4CtGA/LZAkzWId0pHJdspIZ8
 dq7FiZk0s2DUgDjvfQuG3WgeztqBUnc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-iShu2qqCNSa-UU_dRujldQ-1; Wed, 30 Sep 2020 13:46:38 -0400
X-MC-Unique: iShu2qqCNSa-UU_dRujldQ-1
Received: by mail-wr1-f69.google.com with SMTP id a2so878497wrp.8
 for <qemu-devel@nongnu.org>; Wed, 30 Sep 2020 10:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZWUx5DmjrfB9LPqMu2R6Bn9Fs7Axz3MPsvf8u5tx4N4=;
 b=hAX0ho5kciQ4DZ74N5mtKuFkdyb8jc4ITg1sFqO+g49m6nHkEynKKY3bQjC56bOOxN
 Jtcn9Gstmon4oR+HQVCTsBKqPCMPzrl+vjA5tSVtyxOr4+LWbkU7n2V3FW6v9wYgD+7P
 6vRs7pp3x9nqCrpuD7VFkqVlM2qKD930fQvm+jVaSyAn5a8MS5rpZ7qRmJOLme7mqSLr
 LlD/EVp6S1I7Zm+u6joFQNirKpuq09458NeChasN3Ocsxp/nLzJ7/raKVKQ25G8L8uE2
 pM8W1u1ULLhZI1dYzMONCTC/bxJZNnUchi+cE9PF7zhJjBvv36VmsFUAVrV4wASRdpgw
 Wfcw==
X-Gm-Message-State: AOAM533q5tilaTHocn8JnPmeIrAzpOCK82bTHKQKeHbfQYQ2OK7w20Kr
 Xrbho3pXuIhUzmjSJNBPBpM9IZ3r/phBaJ6nAldg2g/oYYTIGGX7fF3SU9MpapwyzXS9qX5A+HD
 iyqKjXLgluptZkSs=
X-Received: by 2002:a5d:4682:: with SMTP id u2mr4707686wrq.254.1601487997226; 
 Wed, 30 Sep 2020 10:46:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwb3ABj/hdHahNV/bkLbidWvERhf1XZEvAt4TkDScTlbwAnEzw4eWtG9auXsRHG6LP76yqjjw==
X-Received: by 2002:a5d:4682:: with SMTP id u2mr4707668wrq.254.1601487996885; 
 Wed, 30 Sep 2020 10:46:36 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:75e3:aaa7:77d6:f4e4?
 ([2001:b07:6468:f312:75e3:aaa7:77d6:f4e4])
 by smtp.gmail.com with ESMTPSA id 189sm3961554wmb.3.2020.09.30.10.46.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2020 10:46:35 -0700 (PDT)
Subject: Re: [PATCH 08/10] scsi/scsi_bus: Add scsi_device_get
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
References: <20200925172604.2142227-1-pbonzini@redhat.com>
 <20200925172604.2142227-9-pbonzini@redhat.com>
 <0d124b6991e607e496da4afa39027320e617aa0e.camel@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <67859d7f-5293-a11e-add3-f93893dfa7af@redhat.com>
Date: Wed, 30 Sep 2020 19:46:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <0d124b6991e607e496da4afa39027320e617aa0e.camel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:31:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/09/20 16:32, Maxim Levitsky wrote:
>> 	Compared to Maxim's patch, I am avoiding the extra argument
>> 	to do_scsi_device_find by moving the RCU_READ_LOCK_GUARD()
>> 	out of do_scsi_device_find itself.
> Which is a good idea, although my mindset was like, I got a device,
> lets just grab a ref to it before it disappears and then do
> whatever I want.

Understood, but "I got a device, I know I'm under RCU so it can't
disappear" is more efficient and just as common.  This also explains the
difference in patch 7.

Paolo


