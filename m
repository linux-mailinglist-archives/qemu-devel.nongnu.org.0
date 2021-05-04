Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9427B372A12
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 14:28:20 +0200 (CEST)
Received: from localhost ([::1]:42140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldu9z-0007Iz-NO
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 08:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldu8K-0006rL-Nd
 for qemu-devel@nongnu.org; Tue, 04 May 2021 08:26:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldu8B-0007eA-JK
 for qemu-devel@nongnu.org; Tue, 04 May 2021 08:26:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620131186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mu/g2ihaw9UODqxMb+XcQH+usSnXY3GgSrTcjNRSmdc=;
 b=FMiNQIFrEn0NDgtVccxJ7t4W57L6EJ9eQa8yt7oN5XKsFw6ARo6SWdDHCq114OAKn+gcV1
 0MDPIuYojKNSzfXGqtGQXwcGV9nD+RRSCMgzGXTvmp1yMjvg38uMdYPl2ZZbaKh493OODi
 CnyykJysjT+LRC6J0hAXVdZdrYNsWkE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-Dp18uN_jMY6WqvNyY1vWDQ-1; Tue, 04 May 2021 08:26:24 -0400
X-MC-Unique: Dp18uN_jMY6WqvNyY1vWDQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 u5-20020adf9e050000b029010df603f280so2754834wre.18
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 05:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Mu/g2ihaw9UODqxMb+XcQH+usSnXY3GgSrTcjNRSmdc=;
 b=SyfG7KapNl7uy0SjsZ9gdDS7pa0wEWdoK6HzoyW9KQHICMQDFiKPrXBK9UEoxB4bAu
 8eYqPxZmXGBnlSaLGPbhRY46kAsopsMPyQGz7TGZCq1p7qetli/DOS3ZdddvFXPbaeyO
 O9TFSx5IwZ5vP07j0Niyb5p0yZsZ3U9hu/c82k7n2PCPHHs00DdZy1lkmuFAF8WkO7bd
 ots2gfFuDW35ocnWMTx8oXLXlZcpkcTPZjRbjrogrqZKviODjnfgYjDRXR+8zfyr1MYB
 0rSMT2GD2r0s0Fa69d4gfflGJhMs9djU8+6HKzXKmv6n5+Bm2tyCZsxc9DX/0E6S/OVG
 hMmQ==
X-Gm-Message-State: AOAM530sD2DVL7tsYDqFFSa0wanh6ppLC61n55mIx98I4Dt/utxng9hx
 za13ISbQ/gssWJdW173vNvhh9v8JKGEQ8616t7GJvOcZS4fOov19YHEvOCjchmVH3QdLE85zD2y
 hUrjd5wLzCIGwv5oQqCpMuwaDobH+2pB6m8MOQwUUO57qCSPpYX2HLS2ORuWsKCEZ
X-Received: by 2002:a7b:c8d6:: with SMTP id f22mr3694294wml.55.1620131183272; 
 Tue, 04 May 2021 05:26:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLqrF4D4yvcjhDN1aeKM0iVAcaXvs2NEo6dDWTYVJZUSJnrxJuNbn8FCRZovdLTpzj+DqvVQ==
X-Received: by 2002:a7b:c8d6:: with SMTP id f22mr3694270wml.55.1620131183058; 
 Tue, 04 May 2021 05:26:23 -0700 (PDT)
Received: from [192.168.1.19]
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id i3sm17801894wrb.46.2021.05.04.05.26.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 05:26:22 -0700 (PDT)
Subject: Re: [PATCH] main-loop: remove dead code
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210504121841.605740-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <51b38c0a-2e19-deba-6fe8-127c68a9b2ed@redhat.com>
Date: Tue, 4 May 2021 14:26:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210504121841.605740-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/21 2:18 PM, Paolo Bonzini wrote:
> qemu_add_child_watch is not called anywhere since commit 2bdb920ece
> ("slirp: simplify fork_exec()", 2019-01-14), remove it.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/qemu/main-loop.h | 18 ------------
>  util/main-loop.c         | 59 ----------------------------------------
>  2 files changed, 77 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


