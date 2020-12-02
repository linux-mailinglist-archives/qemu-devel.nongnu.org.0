Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC352CBE77
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 14:38:36 +0100 (CET)
Received: from localhost ([::1]:56224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkSL5-0004lg-RT
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 08:38:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkSJJ-0003tv-Ta
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 08:36:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kkSJI-0005zW-8Z
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 08:36:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606916203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lkNttadaTzEzre4snH9vw0PJSqxpTEW8jJkq+FIV4eM=;
 b=JlL8B8SaafMRGVWbdK3iamp/GRK3S6XNizQ6r1GZDBR5TbOtlzWwnxmawbDiI8J1GmwWc8
 UOpHWnRcERPA0hS8v3MgtmAhHgynA/zfDrtTOUNE39U80hxO3/nNUdd+/JUbijGBg9/BoY
 PXdBMNif842KuiiaL7YCTtolagYl6qw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-c3UasKXEOn-1znmxVMjUgw-1; Wed, 02 Dec 2020 08:36:41 -0500
X-MC-Unique: c3UasKXEOn-1znmxVMjUgw-1
Received: by mail-wm1-f72.google.com with SMTP id a130so2604088wmf.0
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 05:36:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j37pp3e/Hrptkb34qGyhAuy5j4G1Ndfm6upu9VZok4s=;
 b=Ooq1i+msTfQH+scvM+//CuvinawrgBBSEqGGQ9nX0gXqGKV7BydBeXnQef2d/GkBPI
 ASsMJ3fJ87uc7cnEcsO4tNReQ1rFZDez20dL2vSF1A3GZX8/CK249fmSTSUhj+Bwl70q
 CetjgMz5P8J3AqW4F+4myKGSsdNiZReucxbJeqfpT+sJfnDPGW1r3DR+f4sabX0hNQmq
 5XZAqogv4PVfdafTExz7ApKDQ09l2Lcz7oMc29nMDXYNSn4iwQEwJziTkDEmoU+4kJg/
 PiqFpaKmSNbF+9DeAhLajukPPBq0tA9NHaFZHhqng1EuunPU+NRah9ntv9jyeJgm0Vr/
 flXw==
X-Gm-Message-State: AOAM53349pGFEYpCYVyBAcuzOSuKTv6cqA2Lopun73IIHGVq2O5MV5Gb
 LO06E6cKJCi+cfS7exTn+bTFBntsk1DDe1OklqHOXcKyRAXszmRXyeZslG1pbW7YWYVolZ87z6O
 PSWkv3b/zWsVFgdnv/Z9j1VwaSQa9Q+tuehgJ7igu6RW1X+uywRExiOGq5kmpWQm3
X-Received: by 2002:a05:600c:21ce:: with SMTP id
 x14mr3184202wmj.27.1606916200132; 
 Wed, 02 Dec 2020 05:36:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcIm3yBqve0ymsLr9w3bWTfc349tFa6n+PFrtQPatXfXQJ9fsOdw3AlkSTcd8pIGgUz014sg==
X-Received: by 2002:a05:600c:21ce:: with SMTP id
 x14mr3184182wmj.27.1606916199944; 
 Wed, 02 Dec 2020 05:36:39 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id p19sm2355165wrg.18.2020.12.02.05.36.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Dec 2020 05:36:39 -0800 (PST)
Subject: Re: [PATCH] ide:atapi: check io_buffer_index in
 ide_atapi_cmd_reply_end
To: P J P <ppandit@redhat.com>
References: <20201118142745.112579-1-ppandit@redhat.com>
 <204751s9-11np-413q-q3pr-3o6os86078@erqung.pbz>
 <492170b8-8056-bd65-5150-62c6e89cb3f0@redhat.com>
 <933np1s-8p4p-o74p-rp94-517r98nop2o6@erqung.pbz>
 <a964ffea-ece6-3f33-3dd1-ee9c2b729b75@redhat.com>
 <87sg8o65ys.fsf@dusky.pond.sub.org>
 <212n55r-9n3q-8r4r-85p7-14n495r53s6n@erqung.pbz>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7a5db04b-8ce7-476f-41a2-667459a4b0b0@redhat.com>
Date: Wed, 2 Dec 2020 14:36:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <212n55r-9n3q-8r4r-85p7-14n495r53s6n@erqung.pbz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-15
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Wenxiang Qian <leonwxqian@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/20 2:17 PM, P J P wrote:
> +-- On Tue, 1 Dec 2020, Philippe Mathieu-DaudÃ© wrote --+ 
> | Is it possible to release the reproducer to the community, so we can work on 
> | a fix and test it?
> 
> * No, we can not release/share reproducers on a public list.
> 
> * We can request reporters to do so by their volition.
> 
[...]
> 
> * Even then, we'll need to ask reporter's permission before sharing their 
>   reproducers on a public list OR with non-members.
> 
> * Best is if reporters share/release reproducers themselves. Maybe we can have 
>   a public git repository and they can send a PR to include their reproducers 
>   in the repository.

While EDK2 security workflow has its own drawbacks (inherent
to the project), a fair part is to ask the reporter to attach
its reproducer to the private BZ, then when the embargo expires
the BZ becomes public (as the reproducer). Thus the community
can look at how the bug was handled, how it was reviewed/tested,
by who, etc.

https://github.com/tianocore/tianocore.github.io/wiki/Reporting-Security-Issues

> 
> * That way multiple reproducers for the same issue can be held together.


