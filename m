Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6A039A216
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 15:20:42 +0200 (CEST)
Received: from localhost ([::1]:40650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lonH7-0001u8-Ez
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 09:20:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lonFw-0000y6-OA
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 09:19:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lonFp-00049h-Tc
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 09:19:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622726361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=99yO8brfRD1ljRmO1KZ3VavptMI82RGpv94TumSsaWc=;
 b=N1CS9KLZKESE5byx8k9Wap2Hd35nb2ekEpM3QcnVpZqGKA8gMJ5V4fx270jxk0cKLIZnsM
 aBSB6do3fUdfaacfJ3hIgcdUdqqlMOhsIWoJbT8HozvZjvj/mfjKzNOl6IX3XIVn1r8E5C
 fGeAc+kY+qNiCIQg2y8ZxPm34Tq14o4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-mYAWp0FjNSeDT2Ygi3pbYg-1; Thu, 03 Jun 2021 09:19:18 -0400
X-MC-Unique: mYAWp0FjNSeDT2Ygi3pbYg-1
Received: by mail-ed1-f71.google.com with SMTP id
 c21-20020a0564021015b029038c3f08ce5aso3255812edu.18
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 06:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=99yO8brfRD1ljRmO1KZ3VavptMI82RGpv94TumSsaWc=;
 b=fsxHWucY/yJ3h+No/ILDYCg8faDG25T8hg1igmeVh12l7BWiCBEnN76YQ43RUslEUq
 OGkC75H7Kfaa0vJwIyyRiDuThtiCTnztP14k0kxDcNfqGfIrb+5o4e4uIFw/MR3ULlCY
 Ezkmm9F7SKEz8LlcfDI0sKadv56Vo2qRihssritHnRDnfGSxo5DXxuS0Ha2xu5Uq21hm
 H6+BE/IATTdAjtYglLzy2MiPc1fl07XVPQJykBkdgxGWYKUG+yAsLAzdK04/Cui8Xr41
 7mN1QOpTxytV/JJV49APkzMETCRJ7tFM9268OwXoZ4x+qYn2QHWem4ud+Krv4SjgVNoK
 8PDw==
X-Gm-Message-State: AOAM530xGaIbcPh9A8cfhPSswKmcRVoJXIIH3sIK/eo73/I8yV00dZGa
 hKE8lbsXbc7VKnIPRj8yTZ9Bpf1M4BLAmYGao/aS5SLf6Ef9KzLnwT2uKL+MSKvee4vKQKFdhxk
 saIaDNc240JTh4kA=
X-Received: by 2002:a17:906:b19:: with SMTP id
 u25mr21637383ejg.238.1622726357279; 
 Thu, 03 Jun 2021 06:19:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9JbWSWCZpREaEatQTJbOAKH62bWgT0NHhA96WTMTMD0JVYOzMpcTscC7OOo6wp9UqxzBIZg==
X-Received: by 2002:a17:906:b19:: with SMTP id
 u25mr21637366ejg.238.1622726357109; 
 Thu, 03 Jun 2021 06:19:17 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id a97sm1816377edf.72.2021.06.03.06.19.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 06:19:16 -0700 (PDT)
Subject: Re: [PATCH 2/2] iscsi: link libm into the module
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210603130732.208065-1-pbonzini@redhat.com>
 <20210603130732.208065-3-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8a95f212-65d3-05d2-2f1d-ef7b6dfcea46@redhat.com>
Date: Thu, 3 Jun 2021 15:19:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603130732.208065-3-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, Yi Sun <yisun@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/3/21 3:07 PM, Paolo Bonzini wrote:
> Depending on the configuration of QEMU, some binaries might not need libm
> at all.  In that case libiscsi, which uses exp(), will fail to load.
> Link it in the module explicitly.
> 
> Reported-by: Yi Sun <yisun@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/meson.build | 2 +-
>  meson.build       | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


