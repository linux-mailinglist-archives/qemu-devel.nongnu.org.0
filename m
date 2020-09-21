Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F18CA272391
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Sep 2020 14:18:01 +0200 (CEST)
Received: from localhost ([::1]:57928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKKlc-0000HQ-Q3
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 08:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kKKdf-0005VU-Oh
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 08:09:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43296
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kKKdc-0006Lj-HP
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 08:09:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600690182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QqwrEnWRJ54ZKI9mJm9L4kW6WoIF50Qn62PYgy8z8lg=;
 b=aSNhcRhwVLrZ4MYCZpdX4aCqJvIxxsJQSp4BdXW0iOTPs3STdAKo2OsDry0s5L1Vyzzu42
 p0gvOmThsgXeYaF6nFYLWFVoC4uamWgIxrYFY0V8y4r9ZklJU4JMppjqv4BZEB+fFEerIn
 bmMhuEf5T56FUpgabpfVJkuS8KwrWLA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-f6w12cTPO7uB5jRl4xeERw-1; Mon, 21 Sep 2020 08:09:26 -0400
X-MC-Unique: f6w12cTPO7uB5jRl4xeERw-1
Received: by mail-wr1-f69.google.com with SMTP id x15so5736998wrm.7
 for <qemu-devel@nongnu.org>; Mon, 21 Sep 2020 05:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QqwrEnWRJ54ZKI9mJm9L4kW6WoIF50Qn62PYgy8z8lg=;
 b=PYf1FxiKqVmA1DsB1+onQLHjE7f/8QAh5K/AcU/MdEfGQSdaAka5UIRBpby7Gn/8xA
 q5CnaxEct5x3Vsk408bv6GlnymuPP7RaDYTJ4is4fOpeZeiSWw1LqkurQYgjZKWCaYHi
 d8CunhncDgachHBFbELloit/Q1MNnoWkNBsqe8GqgfyW/MZuVxYWpdURKLjdp/g5Zbqi
 C3+WrTQXASRBit2l4SeM22QipI/i4t4BpTN5IoyhlxKdDROdObQv4MkcWNheY+pq+B33
 x0hzstaIAL65AD2DOTJTsYcAXoFOgDGrdBRFeGa46IDbkCLaiC8MpKweJibrQ/PtLPil
 zxcw==
X-Gm-Message-State: AOAM531/DiRbLlPyukYg+5CBU4PLvz4QsoSpiThIogv3SdhvEOznCxrd
 KGdGtfnG9RptiF1VBZhLucaeNxYjzThaQCWRcVKTDPQIvQFHiXpu91W/mtYheRn3rar5NbjdCYe
 0zTI97eUiwnldT2E=
X-Received: by 2002:adf:b74b:: with SMTP id n11mr26383958wre.274.1600690165685; 
 Mon, 21 Sep 2020 05:09:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7NFhlTZXCsuLbHHMebL/PcKYM93AXhkM6k/9gTlOzEHdZ5iC+LNlQnUmMrZMpUdil20ZoWA==
X-Received: by 2002:adf:b74b:: with SMTP id n11mr26383938wre.274.1600690165476; 
 Mon, 21 Sep 2020 05:09:25 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d153:8d0f:94cf:5114?
 ([2001:b07:6468:f312:d153:8d0f:94cf:5114])
 by smtp.gmail.com with ESMTPSA id 185sm20889131wma.18.2020.09.21.05.09.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 05:09:24 -0700 (PDT)
Subject: Re: ping: [PATCH 0/3] add MEMORY_FAILURE event
To: zhenwei pi <pizhenwei@bytedance.com>, armbru@redhat.com,
 mtosatti@redhat.com
References: <20200914134321.958079-1-pizhenwei@bytedance.com>
 <b38abe18-0211-d2fc-d843-c081227ac05e@bytedance.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a0854841-28b4-5ea6-6e1e-25bec6baa93f@redhat.com>
Date: Mon, 21 Sep 2020 14:09:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <b38abe18-0211-d2fc-d843-c081227ac05e@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 07:01:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/09/20 04:22, zhenwei pi wrote:
> Hi,
> 
> A patchset about handling 'MCE' might have been ignored, can anyone tell
> me whether the purpose is reasonable?
> 
> https://patchwork.kernel.org/cover/11773795/

Yes, it's very useful.  Just one thing, "guest-mce" can be reported for
both AR and AO faults.  Is it worth adding a 'type' field to distinguish
the two?

Paolo

> On 9/14/20 9:43 PM, zhenwei pi wrote:
>> Although QEMU could catch signal BUS to handle hardware memory
>> corrupted event, sadly, QEMU just prints a little log and try to fix
>> it silently.
>>
>> In these patches, introduce a 'MEMORY_FAILURE' event with 4 detailed
>> actions of QEMU, then uplayer could know what situaction QEMU hit and
>> did. And further step we can do: if a host server hits a
>> 'hypervisor-ignore'
>> or 'guest-mce', scheduler could migrate VM to another host; if hitting
>> 'hypervisor-stop' or 'guest-triple-fault', scheduler could select other
>> healthy servers to launch VM.
>>
>> zhenwei pi (3):
>>    target-i386: seperate MCIP & MCE_MASK error reason
>>    iqapi/run-state.json: introduce memory failure event
>>    target-i386: post memory failure event to uplayer
>>
>>   qapi/run-state.json  | 46
>> ++++++++++++++++++++++++++++++++++++++++++++++
>>   target/i386/helper.c | 30 +++++++++++++++++++++++-------
>>   target/i386/kvm.c    |  5 ++++-
>>   3 files changed, 73 insertions(+), 8 deletions(-)
>>
> 


