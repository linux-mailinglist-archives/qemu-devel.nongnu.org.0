Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDC1337B67
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 18:54:52 +0100 (CET)
Received: from localhost ([::1]:41816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKPWN-0002cj-04
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 12:54:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKPPX-0007K2-2w
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:47:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKPPM-00024j-T6
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 12:47:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615484856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SG0JmNhgx/SwwA1j5Kuo6LG0Pzl/rSqPErr9yBXATWE=;
 b=fqWEahIeaNjLqJ+Cy69TyYaTgxtWEyEKqwToFlbIGkfNEh1zlcvEnAn6ZWuA7aOnJ49BHu
 Oxrvzm+ukzZ6d4xYAEN4XuQ5ym4GinwqozY3cFi+38ht4BAO8Wz1QXsQ09XO2zXTzGz+M5
 mB7/LVUM/7S4dhQwk5ag2/b3o66PnPg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-u5Ba0yazN4eNV09WZTnsXg-1; Thu, 11 Mar 2021 12:47:33 -0500
X-MC-Unique: u5Ba0yazN4eNV09WZTnsXg-1
Received: by mail-wr1-f69.google.com with SMTP id e29so9850500wra.12
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 09:47:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SG0JmNhgx/SwwA1j5Kuo6LG0Pzl/rSqPErr9yBXATWE=;
 b=bxTQwOGeS/oyf/PHGxicoczIHNOvcSZPBT84lwH2w4Kp6p0rJv2B2K3O8eGlrL+SL8
 9iS041E3b6SguaN8/JfkzYHM2S7JM0KDEN9uOsTRTctf9ZhGA3issGbVByjLd2jK/yvh
 SDyMrGu9tETA9raCNxwN8zAvufOymCHJAIVZ3YcMM2aZnczcd1KBrYWvPReAZksTbouE
 VXc+Q+EMGdEpFw4wvVjNNUOSDFiWy1vNczChru18O5GEl0+5MbhaWwJaSHA0+vAGU5l+
 rA8MYISdYl0PNPXSJi3HRuwYvcYPtg+puwASY1HVHpacrHB9yvoXgUfFOXxICgSR0aMS
 NxtA==
X-Gm-Message-State: AOAM5336dkpcpigu0IoMU+lImrZKqkroM8Mh+OBbKt8nSbVPaa0E/S8u
 3n7UyFI1s5q/CQ0G0NAqOYTl4HAx498zG6/4mzpVv0e+sqAMVCPKWKUpvvrHlwwuKjMJkysE95k
 nGyRwNSBztsbK92EzavGuydOXn0i9QSzBRFmfdfCuygp+c5AM1uD8OFRfSWK3vaB9yaY=
X-Received: by 2002:a05:600c:2282:: with SMTP id
 2mr9358752wmf.93.1615484851763; 
 Thu, 11 Mar 2021 09:47:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXXFzazplW1yMzdJi7zYMPAeDHf5nx3lAHgDo5i5HgWVwvUJOBM2bpFLOxepejgm6lRLtG0A==
X-Received: by 2002:a05:600c:2282:: with SMTP id
 2mr9358733wmf.93.1615484851487; 
 Thu, 11 Mar 2021 09:47:31 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id 21sm4811689wme.6.2021.03.11.09.47.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 09:47:30 -0800 (PST)
Subject: Re: [PATCH 1/4] hexagon: do not specify Python scripts as inputs
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210310104937.253532-1-pbonzini@redhat.com>
 <20210310104937.253532-2-pbonzini@redhat.com>
 <9513869e-a485-b307-e9c3-cd5992ca9323@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <eac2dcbd-7daf-ef94-6fc4-0044c2cbc59b@redhat.com>
Date: Thu, 11 Mar 2021 18:47:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <9513869e-a485-b307-e9c3-cd5992ca9323@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

On 11/03/21 14:11, Richard Henderson wrote:
> On 3/10/21 4:49 AM, Paolo Bonzini wrote:
>> -    command: ['PYTHONPATH=' + meson.current_build_dir(), '@INPUT@', 
>> '@OUTPUT@'],
>> +    command: ['env', 'PYTHONPATH=' + meson.current_build_dir(), 
>> files('dectree.py'), '@OUTPUT@'],
> 
> Should we not use the python variable in this command-line?

I wanted to just fix the portability issue, but yeah I could have placed 
it here or even in a separate patch.

Paolo


