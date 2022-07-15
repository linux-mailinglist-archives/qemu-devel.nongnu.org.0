Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4DE5763B3
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 16:35:48 +0200 (CEST)
Received: from localhost ([::1]:34020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCMPz-0003l1-5a
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 10:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oCMOd-0002Hh-TU
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 10:34:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oCMOZ-0003Cy-Tq
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 10:34:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657895658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zkbFULy7JIWn5cxu58mZIytAHI6qU2qbLa7Jv9ZwU5s=;
 b=is4yKc5o29masilGzmSo5SJ/u9vR+5ZIrTY61tltT7olCtPzItHxQ8hOmSFrb4XT31hCoh
 7DrUH2hC6JyGdhpABiuItS4baMuJWxPceGyRp76QJ/4eY+wwo6vmoDtB4nW14AzFrLVtlm
 kQ+jjXpW2tvDXdIlLRk6vv7AmL+mXtQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-uncBoMVQMdSmQlwe0WfZkw-1; Fri, 15 Jul 2022 10:34:17 -0400
X-MC-Unique: uncBoMVQMdSmQlwe0WfZkw-1
Received: by mail-ed1-f69.google.com with SMTP id
 m13-20020a056402430d00b0043ac2f27d83so3638270edc.20
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 07:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zkbFULy7JIWn5cxu58mZIytAHI6qU2qbLa7Jv9ZwU5s=;
 b=5tuO+3IXL2TsNQR0mMUQCS8YJaBo1KdLoHdLonKx+9ZdR00jvIvrb0D1ZpzHJ0Ndw6
 foGDOkxmOGRLWrjPogrzMwJOsRiodsrdE2NpxtXGDWXM9R3kZzjL7U1enRJ0AKkIgYZZ
 cWnGSUr/KLdg+nr1On5L5yUCnmSVCDT/M8MTilhSIU5OF5zbqIb9T1KX41rzmsvSTwNq
 VoNQrFIHmBXDBxlZ9NxK1f1PrKA+uPI6Hp4K9cBgTOAZJJHA4jQk8Lav+6tjvqvdx8Av
 fttAXfUwzWgzgfhZ6SbiHYuEdj4bC9UCCf8xqh9B5VD6ZOfU4M9LIjdKh6lqWh6ukwmW
 y+Lg==
X-Gm-Message-State: AJIora8p/BOcFvcNY7eUzp/U4BMG1FXcon58l4vzBSbrOlVq3ccg+pCM
 1qMFp5LbU6BfC3guW31/d06+pg2EsF6R/GgoWM9x9j6SgCDtFfcVdW8rbMJT965zqvFJbJwT1us
 mBipukgPbhcZptSs=
X-Received: by 2002:a17:906:149:b0:712:502:bc62 with SMTP id
 9-20020a170906014900b007120502bc62mr14029611ejh.720.1657895656139; 
 Fri, 15 Jul 2022 07:34:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sD7k6Yytw4iETReMgag0KFl9awhG6MLhf3yQ7coWdgF5oIJnHwvYlil0aC3Kaq1L+QUIgC5A==
X-Received: by 2002:a17:906:149:b0:712:502:bc62 with SMTP id
 9-20020a170906014900b007120502bc62mr14029592ejh.720.1657895655968; 
 Fri, 15 Jul 2022 07:34:15 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 gc33-20020a1709072b2100b0072b29827867sm2142093ejc.177.2022.07.15.07.34.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jul 2022 07:34:15 -0700 (PDT)
Message-ID: <61e119d7-9b70-8e72-4ebb-52aed545888a@redhat.com>
Date: Fri, 15 Jul 2022 16:34:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH 8/8] block: remove all unused ->can_set_aio_ctx and
 ->set_aio_ctx callbacks
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org
References: <20220712211911.1302836-1-eesposit@redhat.com>
 <20220712211911.1302836-9-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220712211911.1302836-9-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 12.07.22 23:19, Emanuele Giuseppe Esposito wrote:
> Together with all _can_set_ and _set_ APIs, as they are not needed
> anymore.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block.c                            | 196 -----------------------------
>   block/block-backend.c              |  33 -----
>   blockjob.c                         |  35 ------
>   include/block/block-global-state.h |   9 --
>   include/block/block_int-common.h   |   4 -
>   5 files changed, 277 deletions(-)

Looks good!  I’d just like a follow-up commit that also drops 
bdrv_try_set_aio_context(), so it’s all gone (I think that’s the final 
remnant?).

Hanna


