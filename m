Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D448833230D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:30:55 +0100 (CET)
Received: from localhost ([::1]:58792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJZde-00073q-Qs
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:30:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJZZw-00032p-65
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:27:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJZZu-0004uB-Ip
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:27:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615285621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5+MR1//XPqoOaPGKeqL3qggS/zR62W/4rZ+r0fFnU2E=;
 b=b/Qw75F3MkCrPEaD/mXwr/4kLE1kGLzQ/c5qhgPVrBdJQjTpN2uA9kBukvZw9GahhhqjR1
 QRh9fInIHaGO5XojF+7vFMAi7BAMlSl3FhlR1FgCORoKFgHZCA8eMmgUlxdk8pYyCTskwU
 rgnaWYPc88TLu9lm/Q+ks38awaueDT0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-RQsg3PHtOQiJFe4ltP5P6g-1; Tue, 09 Mar 2021 05:26:59 -0500
X-MC-Unique: RQsg3PHtOQiJFe4ltP5P6g-1
Received: by mail-ed1-f71.google.com with SMTP id l23so6531027edt.23
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 02:26:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5+MR1//XPqoOaPGKeqL3qggS/zR62W/4rZ+r0fFnU2E=;
 b=jMPIOUmT648lIginttHs1Ot3MHe+6gLuNLhfoKiSa8cCsWU5M6zHnGUa2L7ycLjbMW
 k9XQQ7dwYG1CC6VNSZq/rNOByBGYwraGp+QWuCDDQ9is1KBEnNkZ2KpfrOUaobrBxUep
 IkCsmIWOCWIoHpo68/EgO4EAqwTJsew03Y27RS18UN4S9W+h+5kWxUMQZIfHv6tI5Q0i
 8q2dO1c1Bj5SlhDU+kX71kBKcxnq8/chFZBS3jwb/9g0PyYdvpqRA9ipUeDBkhLoauyN
 wUIHGPOsw56mjqNM2iuZ2I+adqowRwjybUvYpBMC6pb9gNr7nR4Ijbih5btDLZycujEa
 EvzQ==
X-Gm-Message-State: AOAM532bwpZUDrH8qAt8ukO1kvReJltiERf5RMEA40EylP0m1yg5LY20
 +reKFYqPTh2V4Fz5ERMUJt0FNK4/EawqesMOtfwpL6djGDOH7fobnCaLqzQh1IhqELPptlsHp6M
 uEKLKOnZuquO5Pj1mjBt95zxpMKKcXAPFn1jETmfllR/8GSd9g08cKSjoic2Pm49VvM0=
X-Received: by 2002:a05:6402:34d:: with SMTP id
 r13mr3282956edw.64.1615285618598; 
 Tue, 09 Mar 2021 02:26:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzL1ZD27NyprpLOXNjtI/NwZbN3ciyX9ql6hDvrWaw9F5eRPgC0Ij4mKY0gzYwScKX3t1N8bQ==
X-Received: by 2002:a05:6402:34d:: with SMTP id
 r13mr3282937edw.64.1615285618409; 
 Tue, 09 Mar 2021 02:26:58 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s11sm2664272edt.27.2021.03.09.02.26.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 02:26:57 -0800 (PST)
Subject: Re: [RFC PATCH v2] meson: Only generate trace files for selected
 targets
To: Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20210224213515.3331631-1-philmd@redhat.com>
 <YEZU4n1IW6lSQwxl@stefanha-x1.localdomain>
 <af8022d6-c729-5033-6efa-6a1ea23ebee7@redhat.com>
 <b9b3c6ac-e7c5-2f64-cc66-5303e6b9a2c4@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7ff2c1ed-e6ad-4a6f-3552-be5ba90960d7@redhat.com>
Date: Tue, 9 Mar 2021 11:26:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b9b3c6ac-e7c5-2f64-cc66-5303e6b9a2c4@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/03/21 09:41, Claudio Fontana wrote:
> In any case, I agree that just recursing all directories in target/
> looking for trace.h / traceevents files could be better.

Using the directory structure to find source files is a bad idea because 
you don't notice that you haven't "git add"ed a file until it's too late 
(typically the maintainer notices it for you...).

We do it for default-configs/targets, but that's an exception and I'd 
rather not extend it more.

In fact, Philippe, perhaps you can add the extra tracedirs for hw/ and 
target/ to the default-config/targets/*.mak file?

Thanks,

Paolo


