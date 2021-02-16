Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B2631CB29
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 14:37:14 +0100 (CET)
Received: from localhost ([::1]:49052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC0XR-0002Yn-DP
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 08:37:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lC0Qk-0006Ck-LO
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:30:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lC0Qi-0005fW-GS
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:30:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613482214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dhi0DL9y1ha/N3YodafdIoiP61y8cfh/rGJSh2cdy+4=;
 b=AsKtZ3Q2mNroucXMVTuv/T2xKoaT+bqsWg4HtaW1RmDLxPsVwJTejSEXVgQmfT5ZanaDpW
 d20lZS1YLQuG4rHo52oHuNVeOMhFAq4psB6KyR7pGSiIa9K/1tBnbmHsII4pqIV64awiv3
 ivlInYCmqEtreZfrJSaYnuO5zL4NTWQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-jclYEj2SOE2jfKO-yeATIA-1; Tue, 16 Feb 2021 08:30:11 -0500
X-MC-Unique: jclYEj2SOE2jfKO-yeATIA-1
Received: by mail-wm1-f72.google.com with SMTP id r21so2222710wmq.7
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 05:30:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dhi0DL9y1ha/N3YodafdIoiP61y8cfh/rGJSh2cdy+4=;
 b=FVDS1bhwgpErbeSovliZClxtAEA1YMIgQPAWMnBeWkZAdwtspnJdiua9iI9bI9+uay
 0ulYBv+VS9xZswu2J1g6/Zr/wFpjdKX4CjvhMVSvXw/z52keieFf8jgXgHnGp6tRauzn
 b1moQ6/zazyw1Pp32Z6g2BBLFiPJXhBFa9pkM6/uc1E/UwP2jOJRM+xHJGYGbawWsXJM
 HggaZqJoeiv8QbERIc76F6vBPFDuwdLbaTJ3ml913TR1owTSVBfDrJqCSYuSQNs3zFOG
 wm9rQoCz0ALsUXf6jV9ihRyvj9wQSoadQPtY5H68gDF6fHO6MgYDN0sULWiKzZ87F5ev
 Ld0A==
X-Gm-Message-State: AOAM530qMO7/cF1NPOg6xFZyJBbeW1V+rUwdJRiixXYB3Oj8n/x5DU5A
 7btNCuvl45BxvEX6PmOR2Ra6Bv21TfvO/hUP6D5jPIdpnzaf3fhhduPrLmAOtx8dOCLzEqeeVdL
 ivyuJxP9Us8k5EFkEt1ZGArAwTc4iOxUfCS0E8Iuvh2KJu3KUdOSLyYdT8zQFd7gnpMQ=
X-Received: by 2002:a05:600c:4c19:: with SMTP id
 d25mr3415503wmp.181.1613482209806; 
 Tue, 16 Feb 2021 05:30:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQSNH5XjukgTps8HhI4IsE7eEBep4esbBVcpaXEy6Zp2iwYnlJQw5+OOUS6ljcSLnkqDHB5w==
X-Received: by 2002:a05:600c:4c19:: with SMTP id
 d25mr3415485wmp.181.1613482209568; 
 Tue, 16 Feb 2021 05:30:09 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l2sm17704585wrm.6.2021.02.16.05.30.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 05:30:08 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210123143128.1167797-1-pbonzini@redhat.com>
 <20210123143128.1167797-32-pbonzini@redhat.com>
 <CAFEAcA8R84_-BPG-suKDvkpE1BxG8o1edGv=zfU_CCw27pK4eg@mail.gmail.com>
 <CABgObfZNy_j3DYt3NKKvC1Ou8TW2zACZ2LffnrR7LU8PeS5hww@mail.gmail.com>
 <CAFEAcA_6RiR+ud5U0Y9K3jNmEoQ-Ex8fZN3-o0MkLxpK8PROgw@mail.gmail.com>
 <378df6af-8383-8a51-4286-54739dba99e4@redhat.com>
 <CAFEAcA9-bOggKPjJiZNc3WXD9Uu-TxzDc7NMvUDGgoM7ERg3hg@mail.gmail.com>
 <1a8f0b62-0adf-9360-2365-e9881a6aef94@redhat.com>
 <CAFEAcA8VCGmqbdLFLQ0R9Uun4MzxLTnOZExmYJZ65qZ_fjDUvg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 31/31] qemu-option: warn for short-form boolean options
Message-ID: <f61447bf-f556-b626-4a6c-f86e724b0f7f@redhat.com>
Date: Tue, 16 Feb 2021 14:30:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8VCGmqbdLFLQ0R9Uun4MzxLTnOZExmYJZ65qZ_fjDUvg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On 16/02/21 12:58, Peter Maydell wrote:
> On Tue, 16 Feb 2021 at 11:23, Paolo Bonzini <pbonzini@redhat.com> wrote:
>> I agree, and that's why I have no plans to move -chardev off QemuOpts;
>> warning is a different step than excising and sometimes years pass from
>> one to the other.  However, that doesn't prevent introducing a warning
>> so that users slowly move away from the problematic functionality.
> 
> If we want to continue to support the functionality then complaining
> about it doesn't serve much purpose IMHO.

It depends.  I don't want to support it forever for all options; 
-machine, -accel and -object are those for which I do intend to remove 
support for short-form options after the two release deprecation period.

My first submission of this patch even special cased "-chardev" to hide 
the warning, but this was dropped in response to reviews. 
(https://patchew.org/QEMU/20201103151452.416784-1-pbonzini@redhat.com/20201103151452.416784-5-pbonzini@redhat.com/). 
  I can add that back if you prefer, since it's very simple.

Paolo

> A bunch of my local scripts for running QEMU got hit by this new
> deprecation warning; "git grep 'chardev.*nowait'" gets hits in
> our documentation; if you google for 'chardev "server,nowait"' there
> are plenty of in-the-wild uses.
> 
> Is there any other serious use of the 'no' prefix other than
> 'nowait' ? Perhaps we could get most of the benefit here by
> banning the 'no' prefix and adding a compatibility 'nowait'
> bool which had the inverse sense to the existing 'wait' bool ?
> (TBH I had assumed that 'nowait' was already implemented that
> way; 'nodelay' is.)


