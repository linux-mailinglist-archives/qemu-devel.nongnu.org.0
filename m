Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EF24DDF19
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 17:33:54 +0100 (CET)
Received: from localhost ([::1]:39650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVFY1-0005p0-8f
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 12:33:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nVFX4-0004UZ-KW
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 12:32:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nVFX1-0000oY-J5
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 12:32:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647621171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kNoyvkpMqxFjw+SOZmDyPDSLtWXVAb8aPnikV8IHfk4=;
 b=PqwlxnecnUK6etJMRU8PNMyTVNbcRxb/cx+PVn9x/voQbDvuytADUHj9Itq5ma0pNYjKgs
 psC/CDsSULbVpy/GUjx1HNYgC9Yx/XdMr6xXh7cBuPzozmpNhkdz9EQUq8Gi8BCSc3Rpxy
 7CmaGx28w4kS7yw1K1uVpHcpYI378Cg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-RFks6-MxPxGk2yfktmPEjA-1; Fri, 18 Mar 2022 12:32:50 -0400
X-MC-Unique: RFks6-MxPxGk2yfktmPEjA-1
Received: by mail-ed1-f71.google.com with SMTP id
 v9-20020a509549000000b00418d7c2f62aso5184315eda.15
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 09:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kNoyvkpMqxFjw+SOZmDyPDSLtWXVAb8aPnikV8IHfk4=;
 b=j8K4Vonu3h5f+TygaBY4Tb7r6sj0HEQxGi7dYA1v8W1eAr3+71PjivTMyiMly0SWfD
 s/m7g7NYXEd08iRoNfr4bBN6h/GBmyaD2g29nxL9U9h9e75r2VHDerpwIv7brvMNMg6A
 oHIaQSip4eUbpyzi0HTME9bWXJGHD3tLjUa8vPmDIQsVOAyMiKrDZdgP1qMGeDJqkByb
 gJ0fTxKIsU1g4M/lYlFwYwuOHCa3WbffFK4VYmx/8Lpj+eJr0HgXLPtMoefXiQalrLOf
 UuVnh/UmbmJVdn+OGA+Me8ImMzkabENHVr7KGPGPHZolXQtXnEHnDai7Vhq6Btnh3gaQ
 HSFg==
X-Gm-Message-State: AOAM533p5CsjM2/zpp6o+llxJ8qln/+TEUUqbGfGaTt2/9u/ezkCuXK2
 jsIW9Aya6gJyMSs5FERu6ptf+X7D368EKAH79TUCX/JNlRmTHcVpvpXvltLCjksYY7UXfAtwq9Y
 ruhwMs5VDTzQkchc=
X-Received: by 2002:a50:a6c2:0:b0:410:a328:3c86 with SMTP id
 f2-20020a50a6c2000000b00410a3283c86mr10299981edc.55.1647621166369; 
 Fri, 18 Mar 2022 09:32:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx19smaxNGHkDOIKchP9stKYQ0SdaHJzPFf6UkitQowt1NCl+inTMkM2YnbcaNyWzi/hqrwLg==
X-Received: by 2002:a50:a6c2:0:b0:410:a328:3c86 with SMTP id
 f2-20020a50a6c2000000b00410a3283c86mr10299950edc.55.1647621166048; 
 Fri, 18 Mar 2022 09:32:46 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a056402019000b00418ed60c332sm3932611edv.65.2022.03.18.09.32.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 09:32:45 -0700 (PDT)
Message-ID: <cac97a40-6dd6-2ede-d7f0-c7b198d44c7c@redhat.com>
Date: Fri, 18 Mar 2022 17:32:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/4] iotests: finalize switch to async QMP
To: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <20220203022405.1336635-1-jsnow@redhat.com>
 <CAFn=p-bL4XoZMajFffM9LKtFZBKj8W=x2qMQAiewSxLJAP7Qfw@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAFn=p-bL4XoZMajFffM9LKtFZBKj8W=x2qMQAiewSxLJAP7Qfw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.02.22 20:52, John Snow wrote:
> Squeak Squeak...
>
> ...Any objections to me staging this?
>
> (This patchset removes the accommodations in iotests for allowing
> either library to run and always forces the new one. Point of no
> return for iotests.)

I took this as “if I don’t reply, that’ll be reply enough” :)

Looks to me like the rebase is minimal (just shuffling the imports in 
patch 4 a bit), so I guess this’ll help even before you resend:

Acked-by: Hanna Reitz <hreitz@redhat.com>


