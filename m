Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C598380523
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 10:24:18 +0200 (CEST)
Received: from localhost ([::1]:54864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhT7J-0004R4-7o
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 04:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhT5t-00035a-Au
 for qemu-devel@nongnu.org; Fri, 14 May 2021 04:22:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhT5s-0007BX-2F
 for qemu-devel@nongnu.org; Fri, 14 May 2021 04:22:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620980567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ro1+klKUC5/D6bMLsVwYdd2roQPF4guE/S6j5G2rcvk=;
 b=E6YuEyHfl/D8U6h/eabi2melPP3ok/oYAOz2VqDkylWalNfZkNx1bewfbMTaJE6mOkk8Jj
 nB+CtSB6MD1hZHV6hwrZdg7PNu6Ol/HmUzUMVRdLrCnkVK883vTGx9mgydvfomOKByLUla
 +xDhYH6ArNcL8y9EavT5jjhGa1Irlzc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-yuJdLtXhPHaPZIVynXVgEQ-1; Fri, 14 May 2021 04:22:43 -0400
X-MC-Unique: yuJdLtXhPHaPZIVynXVgEQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 h18-20020a05640250d2b029038cc3938914so4313405edb.17
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 01:22:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ro1+klKUC5/D6bMLsVwYdd2roQPF4guE/S6j5G2rcvk=;
 b=GcOfcd4wb55Ig19WLhpUGtbyMMen04PhN4Q05se0icCLr2I6sJQvyUEkKXQxSCExnP
 pgSSaZYa5+PasL7qbREVFACciw+pW9ZD5aH6ZsXqVSMACzXJWg3UjK39FWMntgOzVjTE
 zYIE4sWWzn5qZ0uMNN0WCTJWX6t7Hl+KPsLrQAUNYnvuT11OOn7XfVwzIOAIpxVN75vC
 tDy0ge5hl+zW7ySVWG9GHrpCyJT8rguKidKnq8QhtVJoB003TbavBa+F+wIIYp7HDn7C
 wiYGVUpNUjcPahn7HfNsp1LqZiHrojjNH5B/gsA7N2JzgRAQGX6uQ2u4KY+5X7QZACix
 2wCQ==
X-Gm-Message-State: AOAM530biF8+GnygALq5bdPYKkgcBvloSeI0ZEOxy6NgZl6Nrry502Ax
 B0evPdowPaYWFqOH6LY/JB+sCx/GK00G0lHro1gpvqWjoFmABh/ZF9MsVUtBy3LlQIJh//riIrB
 9dZNenLJzz1jk0rM=
X-Received: by 2002:a17:907:969e:: with SMTP id
 hd30mr30979647ejc.501.1620980562646; 
 Fri, 14 May 2021 01:22:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzExLy4mkAWm/r+i9MuZSVUgbi5S8BdpEvUA/B1YdK8n2gA57te8GaIxaJHwdzQUkekbOi5Kg==
X-Received: by 2002:a17:907:969e:: with SMTP id
 hd30mr30979616ejc.501.1620980562439; 
 Fri, 14 May 2021 01:22:42 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id v1sm3181988ejw.117.2021.05.14.01.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 01:22:41 -0700 (PDT)
Subject: Re: [RFC PATCH 4/5] hw/ppc/fdt: Drop dependency on libfdt
To: Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210511155354.3069141-1-philmd@redhat.com>
 <20210511155354.3069141-5-philmd@redhat.com> <YJs938JVdO5SRYSs@yekko>
 <ead2acca-d3da-89e5-52f6-e8ae14f6e85f@redhat.com> <YJyg+h7NC2ktmHSx@yekko>
 <6a06ae7d-1010-69bc-8931-364d2655e850@redhat.com> <YJ23w6xb2HxjWZIE@yekko>
 <7a910ae3-56b0-9c86-0a3f-7fd3f194c067@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <868849d6-afd2-67c6-69ca-b216c8029631@redhat.com>
Date: Fri, 14 May 2021 10:22:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7a910ae3-56b0-9c86-0a3f-7fd3f194c067@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/14/21 7:29 AM, Paolo Bonzini wrote:
> On 14/05/21 01:35, David Gibson wrote:
>>> "FDT" is set by meson.build if the library is available, LIBFDT is
>>> set by
>>> the board to link with the library.  In other words CONFIG_FDT is
>>> per-build,
>>> while CONFIG_LIBFDT is per-target.
>> Oof... that's highly non-obvious.  Could we call it HAVE_LIBFDT and
>> USE_LIBFDT instead?

Just to be sure I understood correctly, for the next version I'll
use HAVE_LIBFDT for the build-related logic (Meson) and USE_LIBFDT
for the per-target dependencies (Kconfig).
(Only reply if I misunderstood).

> Certainly okay by me.
> 
> Paolo
> 


