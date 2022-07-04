Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 363FB565924
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:59:21 +0200 (CEST)
Received: from localhost ([::1]:53434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8NXk-0002vu-1y
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8NVj-0000em-Cp
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 10:57:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8NVg-0004Ag-MQ
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 10:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656946632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K0HpCdtzTpGXhK/kquXhelQ1UwsfeZHupvkHgn0+wPg=;
 b=KNnJoRBBfJbqQK2mTGNpPrjBMzA41sX4g9VbvTnP428MVLM959YXN8tF57avzVMzgm/pbk
 xCqdHES9KOe4d5O2QVegjSb39WpyTg5KKnzhDfbLP4nreu6otWudTFgGMC1VK4iA5xS1fE
 fiEtFBe6CHOWDrLzs6qwxjUunGbmw2o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-bkQBXeXaP-qm8kmF7rObYA-1; Mon, 04 Jul 2022 10:57:10 -0400
X-MC-Unique: bkQBXeXaP-qm8kmF7rObYA-1
Received: by mail-wm1-f69.google.com with SMTP id
 r206-20020a1c44d7000000b003a02fa133ceso360146wma.2
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 07:57:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=K0HpCdtzTpGXhK/kquXhelQ1UwsfeZHupvkHgn0+wPg=;
 b=zTiAQw8LJEsIUJhDFk7JWDOGwy1WFxNSwP9d1lAhz/qxISs3+3z+7OS0bbmcQHlU5G
 OHqiA7q9i1gHXWZ0ew+04TwQU94Y6Wn1zVCq59FDJ/LIHbJerwR7lreofpr019yO0/Vt
 VB4OwMt42VHlNalU9n9Vgb3oarQdLbL0MwjpYWPhAvt+oFaY1e8rWvJGkPo4/j30Jvoe
 IrPstKjx4FT1fkbwr1t24raoAUidCY6rwKm03uBYMHFL7cx1WBXyCepdGdf9s3aWSyUb
 k1GXAQG/oAQLizbzA+2xGRjeXBr0bqUtNJO858Qx8XBOlNpvMgqHWTWrohxDZYTomOC2
 IzYQ==
X-Gm-Message-State: AJIora+jODocp07vY7OZr9f/KGHqoPCivsJxOZUSe1yDKXBuCHpBdEy7
 SX9bxDwhxs3KmkdYVbBfFG1OkSq+96OeA21bbIC6VvGJAaALHIT8NZ/9VB7Z1ShDw685sokVIkW
 IXZsHVxzanVZJYrs=
X-Received: by 2002:a05:600c:2313:b0:3a1:8ed2:4322 with SMTP id
 19-20020a05600c231300b003a18ed24322mr18180916wmo.166.1656946629069; 
 Mon, 04 Jul 2022 07:57:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vQ8W2jAwGtXd92kYccHG5p6nHPOJnjL+TC8IzAco5siDSSESSvPTY5mvELubfB4yd4Xs1adg==
X-Received: by 2002:a05:600c:2313:b0:3a1:8ed2:4322 with SMTP id
 19-20020a05600c231300b003a18ed24322mr18180899wmo.166.1656946628887; 
 Mon, 04 Jul 2022 07:57:08 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-39.customers.d1-online.com.
 [80.187.98.39]) by smtp.gmail.com with ESMTPSA id
 bi18-20020a05600c3d9200b0039c4506bd25sm18409034wmb.14.2022.07.04.07.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 07:57:08 -0700 (PDT)
Message-ID: <821dc8c9-9ef0-c55c-eb78-fc776deedb98@redhat.com>
Date: Mon, 4 Jul 2022 16:57:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] po: add ukrainian translation
Content-Language: en-US
To: Andrij Mizyk <andmizyk@gmail.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20220613123758.13280-1-andmizyk@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220613123758.13280-1-andmizyk@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/06/2022 14.37, Andrij Mizyk wrote:
> Signed-off-by: Andrij Mizyk <andmizyk@gmail.com>
> ---
>   po/LINGUAS |  1 +
>   po/uk.po   | 75 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 76 insertions(+)
>   create mode 100644 po/uk.po

Thanks!

Unfortunately, it seems like we currently don't have a maintainer for the 
.po files anymore ... so maybe this patch can go via the trivial tree (now 
in CC:), or I'll add it to my next pull request if I don't forget it...

  Thomas


