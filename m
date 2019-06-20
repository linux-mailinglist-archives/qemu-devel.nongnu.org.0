Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A59E4C97C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 10:30:03 +0200 (CEST)
Received: from localhost ([::1]:44852 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdsSI-000300-Kc
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 04:30:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58811)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hdsIN-0003mh-Cg
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 04:19:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hdsIM-0004gL-5v
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 04:19:47 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42270)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hdsIL-0004bb-Vz
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 04:19:46 -0400
Received: by mail-wr1-f68.google.com with SMTP id x17so1998493wrl.9
 for <qemu-devel@nongnu.org>; Thu, 20 Jun 2019 01:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3kK7fQCe77L28oObk6XxiNby+B0mG/pWnNQLMFN/yV0=;
 b=XUjWXdo0GzYVJ/vvE2LWkgephGBdXZHaArODf/49nEJIg3vPiot5Uur7rchRRAS4UM
 5Y5fq1s0BdK3PMjTJ06FBbcmH+TH5LnvC5336jU8qgQ6kGJ42S+oA+VrIUQ9siKJ8K7y
 DYFcOo53exaTOW4BrU95fQmCLylZtSZqTvRJgxPByDxigtlHi24mFrjzMBnpqVbj6SWq
 Rw53LMfN6cwyrKQrlImbE0ZFz4Bfd+o/1rZEg6JhWjxTByF+E31SyPRfw1qQ2buU5+A8
 FGuuC1WyNw2V7I9wvpQXvfmv0J1k+AYUuIMbW5D1EZ3FUEEutn7sVSvCiAL5KciC2Da5
 kaMg==
X-Gm-Message-State: APjAAAUaZNng1GDMnB+Y04SK8MXsfBnA+Lj0/7I5Soc7R1wmfPPz1JeQ
 RDnz5uYHOuylnAlRa0Pp92wPLg==
X-Google-Smtp-Source: APXvYqzy/Vy4cUHIpa39xTreeJoiTBBfapzZQ+bdwPk+g/cYEX21NNZZlbYesHIv0wXpwtRK7enDzg==
X-Received: by 2002:adf:8367:: with SMTP id 94mr41458780wrd.179.1561018778395; 
 Thu, 20 Jun 2019 01:19:38 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:7822:aa18:a9d8:39ab?
 ([2001:b07:6468:f312:7822:aa18:a9d8:39ab])
 by smtp.gmail.com with ESMTPSA id n10sm20327509wrw.83.2019.06.20.01.19.37
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2019 01:19:37 -0700 (PDT)
To: Lidong Chen <lidong.chen@oracle.com>, qemu-devel@nongnu.org
References: <cover.1560806687.git.lidong.chen@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7b5c5b55-c465-57cd-8b75-85d33dbd343b@redhat.com>
Date: Thu, 20 Jun 2019 10:19:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cover.1560806687.git.lidong.chen@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-devel] [Qemu-devel PATCH v3 0/2] fix incorrect assertions
 in sd and main-loop
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, liq3ea@gmail.com,
 f4bug@amsat.org, armbru@redhat.com, darren.kenny@oracle.com,
 liran.alon@oracle.com, marcandre.lureau@gmail.com, amarkovic@wavecomp.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/06/19 21:14, Lidong Chen wrote:
> This v3 added Philippe's Reviewed-by in patch2 (main-loop.c) 
> I also included Philippe's previous comment about patch1 (sd.c)
> in this cover: 
> 
> --------
> Not sure via which tree this patch is going (trivial?).
> To the maintainer, please consider adding when applying:
> 
> "This access can not happen. Fix to silent static analyzer warnings."
> 
> As confirmed by Lidong in v1 here:
> https://lists.gnu.org/archive/html/qemu-devel/2019-04/msg01337.html
> 
> Thanks,
> 
> Phil.
> -------
> 
> Lidong Chen (2):
>   sd: Fix out-of-bounds assertions
>   util/main-loop: Fix incorrect assertion
> 
>  hw/sd/sd.c       | 4 ++--
>  util/main-loop.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> -- 1.8.3.1

Queued, thanks.

Paolo

