Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A730F5400BF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 16:08:55 +0200 (CEST)
Received: from localhost ([::1]:59446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyZt8-0008L3-5a
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 10:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nyZo5-0005GB-MR
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 10:03:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nyZo2-0006xH-1c
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 10:03:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654610617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2X8PnF3wYceqcHF9ZXI23yl3rVaFv/jjzpzqBaNVse8=;
 b=Va8OPzUpf1PMGy6BAQpXP6jEOLF5KulfFLUEx58uoib9uqvqMMG1GyGjr2V4RrL7TXlKEJ
 rn2us6UTCCxDHt5c2v5JBedV4xZDIyTefYceZBl3XD8KZNgwySeOS4XSRYDspDvkeV2Hes
 OPmlr2Mo8gdmApLodv685JYQuAthduQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-flmBKdYwP2WpJOsV3R_XPg-1; Tue, 07 Jun 2022 10:03:35 -0400
X-MC-Unique: flmBKdYwP2WpJOsV3R_XPg-1
Received: by mail-wr1-f71.google.com with SMTP id
 bv8-20020a0560001f0800b002183c5d5c26so1814824wrb.20
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 07:03:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2X8PnF3wYceqcHF9ZXI23yl3rVaFv/jjzpzqBaNVse8=;
 b=IoK6Vd+WgGBg5jScJLw701er+9b89QfGPQ7z3KNxf0VQdsh+6ZpBR4CpF3rWxHCJvv
 3vSNtER27pdn6V9ZSx8U7Ir6PEIcBOFh79VGxkqKa0Qwayybxb97GDQu3NcHTREriXGg
 GjZ+fUa2jDZjrz8wdLqqmNxKjYuVvG1DXFcNEvfuO04RYWhKqUw1AHiAmyH0AkxMS+Rq
 66doDJJFDZOB16gTS9pqd/l9KID29TJ7e991y0cdjo/B55LXBal3vSfPSErhaFKFJhTJ
 1QSvDjM68xewpscTRMHUjkh64FRuWeRtefVnkcMK9K6Eiky0tS5reWDuCPyJ7yF0AVUN
 YI0w==
X-Gm-Message-State: AOAM5329l9Vn0+vjrewQnvlZ7s7CZQaC6l/7gnllTBV3XE8dV9SrvGxA
 xigrnDLe73/R97x+q7UrPi5JlJlnVdzW0tQyq7b55B7f8JrDQ6Wqu9qafJwHg0J5HBZwccJScuw
 MA0JiBw9gJkZVdiY=
X-Received: by 2002:a5d:6dc6:0:b0:215:5d11:30fa with SMTP id
 d6-20020a5d6dc6000000b002155d1130famr20631660wrz.688.1654610614387; 
 Tue, 07 Jun 2022 07:03:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDOWiFjnr/7CjCg5nXII2wWV+bgR+MWAJ5/+EVszJ7i3jJzzZuNOQc2fCZH6aQ8Tyqw+gWMA==
X-Received: by 2002:a5d:6dc6:0:b0:215:5d11:30fa with SMTP id
 d6-20020a5d6dc6000000b002155d1130famr20631642wrz.688.1654610614206; 
 Tue, 07 Jun 2022 07:03:34 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c358f00b003973ea7e725sm31498709wmq.0.2022.06.07.07.03.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 07:03:33 -0700 (PDT)
Message-ID: <eed85de7-a6d1-b6c0-14d7-e1eb236517a2@redhat.com>
Date: Tue, 7 Jun 2022 16:03:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 09/45] Revert "block: Let replace_child_noperm free
 children"
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru
References: <20220330212902.590099-1-vsementsov@openvz.org>
 <20220330212902.590099-10-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220330212902.590099-10-vsementsov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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

On 30.03.22 23:28, Vladimir Sementsov-Ogievskiy wrote:
> We are going to reimplement this behavior (clear bs->file / bs->backing
> pointers automatically when child->bs is cleared) in a nicer way.
>
> This reverts commit b0a9f6fed3d80de610dcd04a7e66f9f30a04174f.

This doesn’t really explain why it’s fine to revert this commit here.  
As far as I understand, the bug that was fixed in that commit will 
resurface when it is reverted without the proposed reimplementation, so 
technically, we cannot revert before reimplementing.

As far as I can guess, it’d be unwieldy to do the reimplementation while 
these existing changes are in the way, and it’d be one bomb of a patch 
to squash these five patches (9 to 14) into one, and that’s why you’ve 
chosen to do it this way around.

But technically, we can’t willingly break something just to keep patches 
nicer.  We can make exceptions, but then there needs to be justification 
here in the commit message.

(Or perhaps I’m wrong and it is fine at this point to revert the patch, 
but then I’d like to see the explanation for that, too, because I can’t 
see it myself.)

Hanna


