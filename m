Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 517B247550B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 10:22:13 +0100 (CET)
Received: from localhost ([::1]:34136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxQUF-0007Ud-It
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 04:22:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mxQRN-0001Ru-2N
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 04:19:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mxQRK-00049m-2Y
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 04:19:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639559949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BwyFQMiCqlRwUc/PPlOnvrdePFa496kMofhx0+4U2zw=;
 b=GHzEKnpgcxb/XmSFVZxxjsPPG8oSvTt1axgd8JE2GTJf/LRYE02nwj9NymqDXIqMTC90Ir
 SArCLId5t0AWzZDEFgRv4/DA9+0tDhKISL8bT/O1XGvDRkVea8cLuz4mJUjklU+X2azXcI
 BPB4D+1n0KJhDphy3PMLvTcE9N81S6E=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-ish-SOh0MA-ixxPy3xbddg-1; Wed, 15 Dec 2021 04:19:07 -0500
X-MC-Unique: ish-SOh0MA-ixxPy3xbddg-1
Received: by mail-ed1-f71.google.com with SMTP id
 w4-20020aa7cb44000000b003e7c0f7cfffso19610962edt.2
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 01:19:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BwyFQMiCqlRwUc/PPlOnvrdePFa496kMofhx0+4U2zw=;
 b=Jy6BQWxg4zbrXbhRbkw0BMz/gvU6NbV3PwrmvwsIL1MC8fmNXZ5ya3pQAw7Tg+Gu8h
 kCo+q4bW9yJXhIQ/+QkTIjaHfnIUw2RjLWoCjeryFL7PcnR05WFwuwD4MrcUGaY7v3dq
 +c2EEVFxM5Q+955Au9jaGT7EpkMsOSTJvwrFaQYOlkm8hCpRx1GC80rtAAIbD0/tRTxs
 QcIE/2mIPxKLniEJ47UIyJvrZ/rwGvDp5bTBB9rZ6uimU5EgpJxI8JEKXi2IJHYTVA2E
 fVqFL+WW+Rg3Z8gkczKzvwHqNMcKzgn4tKqtr/ZLXZJYbLeXnyaCC9PD3ymtLnmggS7m
 OBww==
X-Gm-Message-State: AOAM53006MNKYBChaDV6uMra5Iy3adtsOjfI+9/Gp9Sz4uIXLDA5W0T3
 OZtAWhhZnVK2uawa8MbsPWsB4s06KUhqFNiB/lHLaFAq9du2J7bgJyrXnA9ebzPu2bSPtN06Yn1
 sr7CN1tWHLUkv3KM=
X-Received: by 2002:a17:907:3e9d:: with SMTP id
 hs29mr10035734ejc.677.1639559946808; 
 Wed, 15 Dec 2021 01:19:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMO6Bq/uYXWZUW6xEm52wUPGVz9CJbU/88/4Qm4Czt2sqVBNkpdrxj30FAFgP5IYMHR5Zu5A==
X-Received: by 2002:a17:907:3e9d:: with SMTP id
 hs29mr10035709ejc.677.1639559946515; 
 Wed, 15 Dec 2021 01:19:06 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id f16sm694591edd.19.2021.12.15.01.19.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 01:19:06 -0800 (PST)
Message-ID: <316d9685-e94f-ac75-5c80-535329a06916@redhat.com>
Date: Wed, 15 Dec 2021 10:19:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 3/4] include/sysemu/blockdev.h: move drive_add and
 inline drive_def
To: Kevin Wolf <kwolf@redhat.com>
References: <20211130094633.277982-1-eesposit@redhat.com>
 <20211130094633.277982-4-eesposit@redhat.com> <YbirseSGF6nFiGlp@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YbirseSGF6nFiGlp@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 14/12/2021 15:35, Kevin Wolf wrote:
> Am 30.11.2021 um 10:46 hat Emanuele Giuseppe Esposito geschrieben:
>> drive_add is only used in softmmu/vl.c, so it can be a static
>> function there, and drive_def is only a particular use case of
>> qemu_opts_parse_noisily, so it can be inlined.
>>
>> Also remove drive_mark_claimed_by_board, as it is only defined
>> but not implemented (nor used) anywhere.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> 
> I don't think moving drive_add() actually improves anything. Yes, you
> can make it static, but in order to do that you had to introduce
> block_if_name() as a new public function and you're moving an obviously
> block related function to common code in vl.c.
> 
> So this part doesn't look like a net win to me. The rest of the series
> looks good to me.
> 

So are we going to drop patch 2 and 3? For me it is fine either way, and 
I saw Stefan added r-b to all patches.

If we are, Kevin are you going to apply only patch 1 and 4, or do you 
want me to send v3?

Thank you,
Emanuele


