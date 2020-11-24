Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A452C2C2358
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 11:57:46 +0100 (CET)
Received: from localhost ([::1]:49310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khW13-0001kl-7z
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 05:57:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khVzl-0001JB-KL
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 05:56:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khVzj-0005AH-D0
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 05:56:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606215378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z5VIW7Ma2NuJt2nNiIacvsDmECTrjvJNKBqwLLTVof8=;
 b=G4YnqBHqIGRluy2EYFhX+ZZ0DKLOPRU6uGzaK26liDVV5C5Jxr4v+Y/HQdfGDEQitpHJd1
 wDT3iuCv+I+9y6Sm6O/f45mmiDu8w1yyvWxktN26Lg/beIJpoV6ga9nY/Dxap8t+Dkhb0o
 1tD/DxtsAr2KPYV1+5B3ISBo06ALW+w=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-V5ByMkC9OJeZz9iiuuBwQA-1; Tue, 24 Nov 2020 05:56:16 -0500
X-MC-Unique: V5ByMkC9OJeZz9iiuuBwQA-1
Received: by mail-ed1-f72.google.com with SMTP id f20so7711683edx.23
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 02:56:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z5VIW7Ma2NuJt2nNiIacvsDmECTrjvJNKBqwLLTVof8=;
 b=EPvHIgWl3jHahloZoBAd+bZPfhhQ2MYYZonBoCdT7cxvCACv81+S8eFr5ZHmPB9imm
 i45ANti3uWV/qSnD0y43zVb2ZzRtD00EXAfXBgQMhhFrGMD9HXGGpIW15wAtJEqqhiez
 FW/vNdbVLFf+a+v23fibeqj6QUJZFLzsrLJs6HIE3YDqnZjA7WFzwcs9lCUznXJqxA+i
 nu2d4cyzsndF1FNZ2PfEZ6kR3Ve4WenDenr0o0bRCkAu/Vv8N1yfA3aL4aKas0PE2bTi
 Ce3cLRWBkiJRj82eg63hk4BFdrePvLKbTurM/rXpQVMup0ZxSZt7blNn+RkspuIUafpE
 WySw==
X-Gm-Message-State: AOAM531oBiDzxB0K/LMchnYont+aiPYQ0/qIdM5+W3ux0G4n/GU686uk
 89rxvPx3+w/YvozxPEqD2i3gXtULd1UxjMWsR4gTqGm71EX0yFucS8aHrFj976KJLZ6bE6P9sZA
 Y58hDJRrkrK0epBY=
X-Received: by 2002:a17:907:262d:: with SMTP id
 aq13mr3615185ejc.484.1606215375250; 
 Tue, 24 Nov 2020 02:56:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdSX4rDTWW1CREKo9KLn3Aj5FUne1SDwx5STpGd0S+Zx9m7nuRPYBhXYBpJqY+0X03vWaRcg==
X-Received: by 2002:a17:907:262d:: with SMTP id
 aq13mr3615174ejc.484.1606215375075; 
 Tue, 24 Nov 2020 02:56:15 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zm12sm6536321ejb.62.2020.11.24.02.56.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 02:56:14 -0800 (PST)
Subject: Re: [PATCH v3 10/19] qlit: Support all types of QNums
To: Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20201123194818.2773508-1-ehabkost@redhat.com>
 <20201123194818.2773508-11-ehabkost@redhat.com>
 <87y2irnkol.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <64059fc4-62e9-204d-c477-44f5165a240d@redhat.com>
Date: Tue, 24 Nov 2020 11:56:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87y2irnkol.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/11/20 10:55, Markus Armbruster wrote:
>> +        /* Larger than UINT64_MAX: */
>> +        QLIT_QNUM_DOUBLE(18446744073709552e3),
>> +        /* Smaller than INT64_MIN: */
>> +        QLIT_QNUM_DOUBLE(-92233720368547758e2),
> Why "larger than UINT64_MAX" and "smaller than INT64_MIN"?
> 

I guess the point is to test values that are only representable as a 
double, so (double)((uint64_t)INT64_MAX+1) wouldn't be very useful for 
that: as the expression shows, it would not be a QNUM_VAL_INT but it 
would be representable as QNUM_VAL_UINT.

So these are the cases that matter the most, even though -1, 0 and 
INT64_MAX+1 could be nice to have.

Paolo


