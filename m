Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3584D444F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 11:11:53 +0100 (CET)
Received: from localhost ([::1]:58988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSFlv-0004Ig-6j
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 05:11:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nSFkF-0002ih-B7
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 05:10:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nSFkD-0002YA-U5
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 05:10:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646907005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eZyyrTEgrMY7l0iC/PA80KNLIOiMUKVMgqKkhwnZxlY=;
 b=doTm1Hnht4hrxHYLARlHKT++Cg4Cp6J1YW9J5tSRo0Lnz2R8sUHc/Byr6ktrlq7CUxuwjj
 Q98IQw/JJYYKvE+wq34PeVFwnwatFnou2gk5tFDRsx5oU1HUV8w0/kqjS0fyiWoD9Cowm7
 UVEfInO/ZiNIYRau5ISwaCFuPwyaRtU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-9UF-ZyzDNJSouZqbnHyokw-1; Thu, 10 Mar 2022 05:10:02 -0500
X-MC-Unique: 9UF-ZyzDNJSouZqbnHyokw-1
Received: by mail-qt1-f197.google.com with SMTP id
 bq21-20020a05622a1c1500b002e06d6279d5so3661790qtb.7
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 02:10:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eZyyrTEgrMY7l0iC/PA80KNLIOiMUKVMgqKkhwnZxlY=;
 b=yuIGbkKwDAG0EhTmj0L0NeIEKQZdbpX98xFzNOXsTFXX6q46n3Vlv/0GC4Ig3lmt3Z
 g7KpD8OIFlBArLVsUdQL604igIpmX54jqyjifqbYO52PE41HM81Pqt4+IiHslj9fzs82
 yVGF08iG/6OlZFHRkL5P6iJ9uZMoqtf5TP92QkrWa90Vn0DEaKFaZ2DGmBBLov92yOUm
 ZUYW3/vCvEy70D67l2Q8p3uqI9AwI4rkoYTCTA2Hi5rZrGEqXRsfpIIX7ojDvHd6zgO8
 4iZ5jNkd3s4hBrBrXL0J2Ubvp3lCWWx5KlWxOxLkHBcUIqBPI/SfUDfMxIeytbPxSopf
 xieA==
X-Gm-Message-State: AOAM532gmdca6LuXd2lf3KkjX+R8hcwUFAKIGfawW3yio58J8jDIxY4B
 9a4CGmX2QjeED/nP8Mczk/L1Mmaj8mzleWWi4Xj/+905wf4anFT7utMhyMoFh3crwSmD571sPeM
 EDrZHayBu58vNrVQ=
X-Received: by 2002:a05:622a:187:b0:2de:5cad:7987 with SMTP id
 s7-20020a05622a018700b002de5cad7987mr3187471qtw.367.1646907001698; 
 Thu, 10 Mar 2022 02:10:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySoo3PXREgTQCXddsE4CVJI/jCzwcnjCauVKZxWLk1V3Kq3dF7ineoOM+rE6sFI0YqK3rvrw==
X-Received: by 2002:a05:622a:187:b0:2de:5cad:7987 with SMTP id
 s7-20020a05622a018700b002de5cad7987mr3187442qtw.367.1646907001361; 
 Thu, 10 Mar 2022 02:10:01 -0800 (PST)
Received: from [192.168.149.119]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 a129-20020a376687000000b0067d186d953bsm2101856qkc.121.2022.03.10.02.09.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 02:10:01 -0800 (PST)
Message-ID: <3c345de4-4851-e389-38c1-3aeb10412cfe@redhat.com>
Date: Thu, 10 Mar 2022 11:09:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 18/20] jobs: protect job.aio_context with BQL and
 job_mutex
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20220208143513.1077229-1-eesposit@redhat.com>
 <20220208143513.1077229-19-eesposit@redhat.com>
 <YiddHpzrhH+h/bNH@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YiddHpzrhH+h/bNH@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 08/03/2022 um 14:41 schrieb Stefan Hajnoczi:
> It's not clear to me that .get_parent_aio_context() should only be
> called from the main thread. The API is read-only so someone might try
> to call from I/O code in the future expecting it to work like other
> read-only graph APIs that are available from I/O code.
> 
> Currently the assertion is true because the only user is
> bdrv_attach_child_*() but please document this invariant for
> bdrv_child_get_parent_aio_context() and the callback. Maybe move the
> assertion into a higher-level function like
> bdrv_child_get_parent_aio_context() (if that still covers all cases).

We classified .get_parent_aio_context as GS callback, and indeed
bdrv_child_get_parent_aio_context has the macro GLOBAL_STATE_CODE();
So we should be fine.

Emanuele


