Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9954C2CB1
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 14:10:38 +0100 (CET)
Received: from localhost ([::1]:39134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNDtE-0004Uf-Nq
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 08:10:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNDoB-0002Ht-Tt
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 08:05:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nNDo9-00045u-67
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 08:05:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645707920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I3cYh0chQmSQ02OTyxxnh80v3EY4PsxBsT7BlVlqt1E=;
 b=gNZX8wrXtx4+yfkDp9wBAndICgCPyn97K3AbPBRUc4uGNsF/cnxwgvmF2pos1gz3M9F9XP
 bTor0mQnDZArywqAk94zBfI54vlBfSX7MlAA0dTcrT0zuOG0PVDbuR6NMoBX7cZsBjj7jm
 L7F5XCr4x+2Oysiqzp5BUGasq5bC2Q8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-MNNIQbIZO4-8scmPPkeqSQ-1; Thu, 24 Feb 2022 08:05:19 -0500
X-MC-Unique: MNNIQbIZO4-8scmPPkeqSQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 mp5-20020a1709071b0500b0069f2ba47b20so1158882ejc.19
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 05:05:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=I3cYh0chQmSQ02OTyxxnh80v3EY4PsxBsT7BlVlqt1E=;
 b=LDDml6lrIito69N+eMWVLDPl+eFWI43CydcOKL7UqCm3LdJDd3//yecffM8oRQUGIP
 svL2pczowslqEFksN0vcTCO22JxuuKgAscPJW5Fr1xB43Fs3bBIMduTL8IJwBct/0dJ1
 Vn6czYaVdY0T8LsBrvbDjvicvg16g7qQ6w7a099c28DkjkRoAwcATcNIkSPsLL/bdR4f
 XXOVpO0w0WWCcBVJ3CICvsi96/244XzBOksdn63ZfF09NPwP3lGtZhF/kMx3pdrKigIb
 LO8ZqCuXHz0cuwwRwg2TiLh1TfVqeCHUsPH+cmWg0Z20MZAKcIPeLWl6tSmWchviCBrx
 rZ2w==
X-Gm-Message-State: AOAM530zwBhhcYykIhD6frn1NPDqIJw0YI5IrTa4A2QhkdJDQKZga7Wk
 wFha2sQs5sYFrAk2onU2hq10TqmmLq+SGXAUPLy93lIXKi6mXvpxbtr3mH9q/8lxP5pbqfIKnqx
 KDebpB96P+y16obE=
X-Received: by 2002:a17:906:52c7:b0:6ce:a880:50a3 with SMTP id
 w7-20020a17090652c700b006cea88050a3mr2152247ejn.437.1645707917746; 
 Thu, 24 Feb 2022 05:05:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypZjCBpV2+E3H8jmCReO/ZT7BReLEvfgNNm/4QCLvxJ4sAx+0PCPxvUUHuHXp0Nroa41xuYw==
X-Received: by 2002:a17:906:52c7:b0:6ce:a880:50a3 with SMTP id
 w7-20020a17090652c700b006cea88050a3mr2152205ejn.437.1645707917434; 
 Thu, 24 Feb 2022 05:05:17 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id gs35sm1330486ejc.208.2022.02.24.05.05.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 05:05:16 -0800 (PST)
Message-ID: <4170577f-bd93-49f3-0f80-7fa41a6cfabc@redhat.com>
Date: Thu, 24 Feb 2022 14:05:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 17/18] qapi: backup: add immutable-source parameter
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
 <20220216194617.126484-18-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220216194617.126484-18-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, kwolf@redhat.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, nikita.lapshin@virtuozzo.com, stefanha@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.02.22 20:46, Vladimir Sementsov-Ogievskiy wrote:
> We are on the way to implement internal-backup with fleecing scheme,
> which includes backup job copying from fleecing block driver node
> (which is target of copy-before-write filter) to final target of
> backup. This job doesn't need own filter, as fleecing block driver node
> is a kind of snapshot, it's immutable from reader point of view.
>
> Let's add a parameter for backup to not insert filter but instead
> unshare writes on source. This way backup job becomes a simple copying
> process.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   qapi/block-core.json      | 11 ++++++-
>   include/block/block_int.h |  1 +
>   block/backup.c            | 61 +++++++++++++++++++++++++++++++++++----
>   block/replication.c       |  2 +-
>   blockdev.c                |  1 +
>   5 files changed, 69 insertions(+), 7 deletions(-)

I’m not really technically opposed to this, but I wonder what the actual 
benefit of this is.  It sounds like the only benefit is that we don’t 
need a filter driver, but what’s the problem with such a filter driver?

(And if we just want to copy data off of a immutable node, I personally 
would go for the mirror job instead, but it isn’t like I could give good 
technical reasons for that personal bias.)


