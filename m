Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DA73F175C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 12:38:25 +0200 (CEST)
Received: from localhost ([::1]:55442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGfRI-0003sX-AQ
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 06:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGfQP-0002oa-Rx
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 06:37:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGfQM-0005UV-TO
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 06:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629369445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ZYHtutFm/6i8eXTUU8Jd7aIA1PaxF/Cfof39gC29Yw=;
 b=DCLIojGu6r+7GzgophKch3KvW+vO0eE1g0PvhLcBEQakCNsfYBkma/PfJvuVHynNRYtA2m
 QvK/vvYFJBGhSlcOLoMLGaP/Lbpr1tpY/B4gtJh7xKZ/lxfKAht4L8YPWw656Evnb3u1zz
 CXlvyNgdAAyxlmrQbIXrGeK7Zm3H9c4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-rish6tdbP5Gp94fyvb1fTA-1; Thu, 19 Aug 2021 06:37:21 -0400
X-MC-Unique: rish6tdbP5Gp94fyvb1fTA-1
Received: by mail-wr1-f71.google.com with SMTP id
 v18-20020adfe2920000b029013bbfb19640so1541074wri.17
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 03:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6ZYHtutFm/6i8eXTUU8Jd7aIA1PaxF/Cfof39gC29Yw=;
 b=Fgt+iQqZR1Iz72xttRaVTN1w/aVAkgBLE4knn+uJPZ5RJET3XJpAbNaHxi13CynhlA
 vuAYssQRZ/GF4puKDSwCV4yRmpIaH5kT1Lu8qixkNd6ijoviUWYUIc/BQcSDsoHtL10Y
 Y/ABeTCjOUf1Y9wem8TIm0Am0hB43vS0TLywVtCx0Gl9PoczNck6YUzVJ7sksZRA86nq
 3Z3+bmZCZY9tafHLiG5iA9G3wo/h7YeBIRuCXsYmRbgyawVnUmwf3JVnaqZvSEgmEnRu
 y2vcIZAU7oT87BwRwrh1q7bxcO4gv91mL+vlQBghXTWXDDv5TFavK7Hek7cVVOA19ckR
 0rBQ==
X-Gm-Message-State: AOAM530LnhO3k04kUImmmkov0aJwlzPgZTQF4th31wjEG/rqzh6+FfNv
 iZeX0zoePtmG6OC35qCDxW51u8fvDFLQB3g5yNO5S37xpWs3S11pbhJgk9TxGy1YgynfNv0Cv4A
 VHUV2HcQ52dfmba4=
X-Received: by 2002:a5d:4389:: with SMTP id i9mr2969233wrq.74.1629369440810;
 Thu, 19 Aug 2021 03:37:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhWpryeA1+3kmgp3KxTgbyFkuZT8YsBdQplVk9T2jZFz2uJQuhzGOdS+PfZuHf5r0GWqbGMg==
X-Received: by 2002:a5d:4389:: with SMTP id i9mr2969208wrq.74.1629369440622;
 Thu, 19 Aug 2021 03:37:20 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id u5sm2438946wrr.94.2021.08.19.03.37.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 03:37:20 -0700 (PDT)
Subject: Re: [qemu-web PATCH] Add a blog post about FUSE block exports
To: Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
References: <20210819102501.69638-1-hreitz@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <155c4025-cac0-b4e2-ac4c-f0f36dff2398@redhat.com>
Date: Thu, 19 Aug 2021 12:37:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819102501.69638-1-hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.961, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/19/21 12:25 PM, Hanna Reitz wrote:
> This post explains when FUSE block exports are useful, how they work,
> and that it is fun to export an image file on its own path so it looks
> like your image file (in whatever format it was) is a raw image now.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
> You can also find this patch here:
> https://gitlab.com/hreitz/qemu-web fuse-blkexport-v1
> 
> My first patch to qemu-web, so I hope I am not doing anything overly
> stupid here (adding SVGs with extremely long lines comes to mind)...

GitLab allows Mermaid and PlantUML diagrams in all tiers products:

https://docs.gitlab.com/ee/user/markdown.html#diagrams-and-flowcharts
https://about.gitlab.com/handbook/markdown-guide/#diagrams

I find the mermaid live editor easy to use:
https://mermaid-js.github.io/mermaid-live-editor/

(I looked at that recently because I'd like the pages job to
 generate QOM dependencies tree).

> ---
>  _posts/2021-08-18-fuse-blkexport.md       | 488 ++++++++++++++++++++++
>  screenshots/2021-08-18-block-graph-a.svg  |   2 +
>  screenshots/2021-08-18-block-graph-b.svg  |   2 +
>  screenshots/2021-08-18-block-graph-c.svg  |   2 +
>  screenshots/2021-08-18-block-graph-d.svg  |   2 +
>  screenshots/2021-08-18-block-graph-e.svg  |   2 +
>  screenshots/2021-08-18-root-directory.svg |   2 +
>  screenshots/2021-08-18-root-file.svg      |   2 +
>  8 files changed, 502 insertions(+)
>  create mode 100644 _posts/2021-08-18-fuse-blkexport.md
>  create mode 100644 screenshots/2021-08-18-block-graph-a.svg
>  create mode 100644 screenshots/2021-08-18-block-graph-b.svg
>  create mode 100644 screenshots/2021-08-18-block-graph-c.svg
>  create mode 100644 screenshots/2021-08-18-block-graph-d.svg
>  create mode 100644 screenshots/2021-08-18-block-graph-e.svg
>  create mode 100644 screenshots/2021-08-18-root-directory.svg
>  create mode 100644 screenshots/2021-08-18-root-file.svg


