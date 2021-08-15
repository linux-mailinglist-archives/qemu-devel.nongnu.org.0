Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 040263EC993
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Aug 2021 16:36:11 +0200 (CEST)
Received: from localhost ([::1]:42504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFHFB-0005C2-GF
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 10:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFHDX-0003ja-P0
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 10:34:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mFHDU-00035G-Ld
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 10:34:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629038062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hvF3cRIkLG1LF/w94/CwyrAI5j5ZXyMxlSp9UUA8zYc=;
 b=X+J7l9MYTiKqG6NZM2YN/hrpTV/KwNttZVDQWD8tElrNxRwYlb8/k2ydvC5ealHHz/5Pzu
 gTbd0x5HMFTPjsjBbJihA/VgXny35kRG5b0yD0rjFNUIMn0dvpGY82Ce9K/HbmRS8dmXT6
 5L7wINypMCA70l0E2Xatd9UfpCDtR14=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-pzAlOrc3OxebE8azGdETXg-1; Sun, 15 Aug 2021 10:34:19 -0400
X-MC-Unique: pzAlOrc3OxebE8azGdETXg-1
Received: by mail-wr1-f72.google.com with SMTP id
 a14-20020adfe5ce000000b00156c49c4a23so35609wrn.15
 for <qemu-devel@nongnu.org>; Sun, 15 Aug 2021 07:34:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hvF3cRIkLG1LF/w94/CwyrAI5j5ZXyMxlSp9UUA8zYc=;
 b=Dswg+HywCIh4JWrvTscZwENlJqjnF+ZT4eOCs0RSNDutTZAg3vjsk8+LHZQYGW/7WT
 Y4qUPI9/DIuit+usLMA5eBRCggL4rLJVkVaj2LiBdWwRENOrdJafaYzy2OhC1nCHcL/z
 KlnIMtlm/lFXUm9qrMgKZWNzKdZKoyfDW7Sa2JspYDUDELuhUGfwo+Sub6nQVYZ56yvU
 LYKDoa8o3p68peLZ77Xv6lCxdFvqPE8pQYU/2gz3zQ22xapAi1z5ZfIFWqCLwlKrHeb4
 t2OIocJUq6S+3f2BC3hc43FTbvIVddISwJyGdc4iqi5keRAt8Q1nalknpiXL6WY0FpRq
 USUQ==
X-Gm-Message-State: AOAM530E0GXBkcJTpUCNhsSbn3jjiUWl8YTzsyu+4UNHMHvdqp90L4gP
 +bqek4OnTP1Vr/XVJFb1DXzFXp1dpwpwYqK19m/O4pryJxr1XNvh+W9Nl4IbB0Kwlkkj1r+ynI6
 FcNFMN+bYNXiuVzE=
X-Received: by 2002:a7b:cd82:: with SMTP id y2mr11582869wmj.4.1629038058667;
 Sun, 15 Aug 2021 07:34:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxG9z5vF197AP5C+bdpFlj2LtwW5+qXLQkDHj3ATNokJj5DXBXhnDTnVF/6SSC4WtKseKyjyg==
X-Received: by 2002:a7b:cd82:: with SMTP id y2mr11582852wmj.4.1629038058400;
 Sun, 15 Aug 2021 07:34:18 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id y1sm7785197wmq.43.2021.08.15.07.34.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Aug 2021 07:34:17 -0700 (PDT)
Subject: Re: [PATCH for-6.2 0/4] Zero sockaddr_in when initializing it
To: Eric Blake <eblake@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210813150506.7768-1-peter.maydell@linaro.org>
 <20210813183015.qlfqrshmplxseued@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <613eaeab-337f-a5aa-91cb-029d38d694f3@redhat.com>
Date: Sun, 15 Aug 2021 16:34:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813183015.qlfqrshmplxseued@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.147, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Corey Minyard <minyard@acm.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/13/21 8:30 PM, Eric Blake wrote:
> On Fri, Aug 13, 2021 at 04:05:02PM +0100, Peter Maydell wrote:
>> The POSIX spec for sockaddr_in says that implementations are allowed
>> to have implementation-dependent extensions controlled by extra
>> fields in the struct, and that the way to ensure these are not
>> accidentally activated is to zero out the whole data structure.
>> We have several places in our codebase where we don't zero-init
>> sockaddr_in structs and so (at least in theory) might run into this.
>> Coverity spotted the ones in the net code (CID 1005338); the
>> others in this series I found by looking at all uses of sockaddr_in.
>> (The gdbstub patch changes also a sockaddr_un use, for symmetry.)
>>
>> Thanks to Eric for the analysis of what the spec says and why
>> Coverity is correct here.
> 
> FWIW, the POSIX wording is interesting - it requires portable
> applications to zero out sockaddr_in6 (and even states that memset()
> is not yet a portable way to do that on exotic hardware, although a
> future version of POSIX may add a zero-bit constraint on
> implementations; in practice we only use qemu on hardware where
> memset() to zero properly sets pointers to NULL and floating points to
> 0.0).

So this checkpatch.pl error (inherited from Linux) is against POSIX?

2028 # check for static initialisers.
2029         if ($line =~ /\bstatic\s.*=\s*(0|NULL|false)\s*;/) {
2030             ERROR("do not initialise statics to 0 or NULL\n" .
2031                 $herecurr);
2032         }

[...]


