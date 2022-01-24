Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07837498220
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 15:28:54 +0100 (CET)
Received: from localhost ([::1]:56778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC0Ky-00054f-Uz
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 09:28:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nC0If-0003Xf-AT
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 09:26:29 -0500
Received: from [2a00:1450:4864:20::631] (port=44651
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nC0Id-0006VH-IE
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 09:26:28 -0500
Received: by mail-ej1-x631.google.com with SMTP id ka4so21842896ejc.11;
 Mon, 24 Jan 2022 06:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n6yGOtPljwMV6+ftHHmmSc2wYQ73K2XbKEfMux+oXpg=;
 b=ZR/KlpFY3DNlCrclDn380/n0UeVcAAGoM8XFVBrvu0U4qRBt1c5WOKFJmoZN3+Ikc6
 fxUUweID5V5Ffxu0DLhOQkvAkGj5BLJYdOvIvrbECSOqKlbqhqqjKyi+AQvW8HhbQ7xh
 KgilWAR4MRmURGPJDE51snhNQDBcVwEhxz3NK8sKQZ0DZMMrnX8HCjAAIgQd5R8Bm893
 DfGJNGromxRwJFp0dUnseuHUvKckx5m2c98dqmadLOT4zgknUAzszp9TNFFrY0CL7dZI
 YtsvdeISbO1GhkjxM9dBQRZsOIYsG+X3nznWEt/0OaLcKuBXnZM2jAKGN/KDskTsvtA7
 oOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n6yGOtPljwMV6+ftHHmmSc2wYQ73K2XbKEfMux+oXpg=;
 b=nUY7P0wosYfECBZSqqLHwJH/nJr/DskCGmjwJcbE+mGi17yn7fIKKmXKVGGf4Vd2KW
 Czs0Ob9FwVqwMtqrGm3njE28tSZVzlUoornmSV4YsunRTVnxk/R+DAN4Pqq9r6K2oHrI
 Lba9Im4WPXyIGPvsOyV+wSImDQ4UZnZZI74lbLnZ9SCiuJaBK6qu+7ZYb9BchxFdzLq5
 drTSvFnHX7p/PxBhOXi9M8CRirJyN/9SPmpHDPyY0Sy5Y6VvACKD/zUCtjxIAP6XYwQi
 1DBUnc0wsC7uXW8eQkDz9hM7c9Uwvq5dw8EoyW6OBMq0ck26UMqH3OTZO1l//qN8fOYM
 k/6Q==
X-Gm-Message-State: AOAM531tiNCCDcZqmfTYqFVW5GWS5Y6SHKPmDJ/9VWsSeaNa15jSwrAG
 AMV5wvL4khy87YEY31GhqqM=
X-Google-Smtp-Source: ABdhPJwAt7cJfRYi0DyPEKaNNBeRC9U0AppQ4qg6jwEuBL+fUrVwhzp50lDzuvjbQuhb3lMrJnUUzA==
X-Received: by 2002:a17:907:3f84:: with SMTP id
 hr4mr12922920ejc.443.1643034385042; 
 Mon, 24 Jan 2022 06:26:25 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id d25sm4984230ejz.4.2022.01.24.06.26.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 06:26:24 -0800 (PST)
Message-ID: <9e812bce-4acd-82e3-81e7-45a7011bac90@redhat.com>
Date: Mon, 24 Jan 2022 15:26:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 03/16] job.h: define locked functions
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220105140208.365608-1-eesposit@redhat.com>
 <20220105140208.365608-4-eesposit@redhat.com>
 <6a9dafe7-b3e2-68e7-e727-2086c7ceca6d@redhat.com>
 <93565619-bff8-9f64-50f0-3e9acd570777@redhat.com>
 <58f1095a-ac51-67b2-467a-fb2611664423@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <58f1095a-ac51-67b2-467a-fb2611664423@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/22 17:04, Vladimir Sementsov-Ogievskiy wrote:
>>
>> The split was proposed in previous versions, but Vladimir did not 
>> really like it and suggested to send it as a separate series:
> 
> I didn't really like it as it seemed unusual and unobvious to me. But if 
> we already accepted similar split for generic block layer, no way for me 
> to resist :) And if we follow new logic of generic block layer in jobs, 
> it's not "unusual" any more.

Either way I think it's okay to have it as a follow-up.  The explicit 
naming in the API is a bit verbose but definitely clearer, so it's okay 
to order different than the graph/IO split.  In that case we weren't 
even sure, until you went through all the testcase failures, that a 
_locked or rather "_drained" API was possible.

Paolo

