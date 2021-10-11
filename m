Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 746BD428A42
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 11:59:49 +0200 (CEST)
Received: from localhost ([::1]:43974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZs5z-0007fu-Up
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 05:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mZs4T-0006BL-8I
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 05:58:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mZs4O-0000XU-AX
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 05:58:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633946286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=59YQOS2ah4fiL8SA6BNcOJkjmKxBBl8tr6/DEE4/qqo=;
 b=QiGiZskYc4PfsBSAlarYe01/LBsPI50kGgdEWi8kMVsHN9bQHqEusQxG5WnngM9cGunzOv
 hrbPhmV11gNpQYJqd/OnVzmTsvGL9o46Bnhg7+7IyT1NX8AHpS6E71oju6GQLPiPtSk/3Q
 Ke9ASKVWX7FXGMcNUU4XxTN1LgvdJLk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-15Y3xnoWMMmEu3gZlN6Xlg-1; Mon, 11 Oct 2021 05:58:04 -0400
X-MC-Unique: 15Y3xnoWMMmEu3gZlN6Xlg-1
Received: by mail-ed1-f72.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso15345769edj.20
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 02:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=59YQOS2ah4fiL8SA6BNcOJkjmKxBBl8tr6/DEE4/qqo=;
 b=ZNCv8cqwGaZQb/2xfoNErkw9Bz8nBrgZW01k3B0vZWoehP2q+JbwU3yOBB6zLY+euO
 nuBw7qp7c8tgIsav5yHEl4hHHwIg/UjstNTUAnXmdWlzoQ5m8f4QPyU10tQl4dxEiGJh
 Fai1p3htndsRaN7yyEwR0sKAtvtTmCGCxd07REkysRT/HODLpWdKv1+bKXPq4ibqazUi
 esMKU09Q6m77ARj4wGEYkM0/D5HXe+IHUAo8EXGaQKPKBoI+Sl51kW8koX0R/lIpmYj3
 4FzunG1DlhzIwcTHspoJfismGoEnAgmpPjooLNx2XoJ1zMFhDSXlRrT0TrRsfe16h4eO
 NcEg==
X-Gm-Message-State: AOAM533MPLP0a18mnuMrBcPn29C8MIHMpXIZHSBqRkZiznIAi9wZOEnE
 0rrrxUwiqJm26bXfdWV5bObNxYfAoeIfDnOG5i8EEfnBSCCJ6jKGQwSWFJiFQLzXq/JuPKrE+sg
 M8avYiO9rAmrGOU+IfLwKTRxQTmwUpaa99vfiv9RZpBCUhKP36Q04/7cq0R1UuSzqFRY=
X-Received: by 2002:a05:6402:5194:: with SMTP id
 q20mr39971536edd.245.1633946283355; 
 Mon, 11 Oct 2021 02:58:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZ5CYG0KBgA5XVpFveOrXUGdUiZ9722baDPwxPWabK5QzBCMufxKv67AtF9QlLHIH4g3q2rQ==
X-Received: by 2002:a05:6402:5194:: with SMTP id
 q20mr39971511edd.245.1633946283159; 
 Mon, 11 Oct 2021 02:58:03 -0700 (PDT)
Received: from ?IPv6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id u8sm2215553edo.50.2021.10.11.02.58.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 02:58:02 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] pylint: fix new errors and warnings in qemu-iotests
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20211008062821.1010967-1-eesposit@redhat.com>
 <ec26842c-27a7-4f3a-3eab-7f2096581101@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <10dd6939-4199-0974-a4e6-0c9a45a7c721@redhat.com>
Date: Mon, 11 Oct 2021 11:58:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ec26842c-27a7-4f3a-3eab-7f2096581101@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/10/2021 11:29, Hanna Reitz wrote:
> On 08.10.21 08:28, Emanuele Giuseppe Esposito wrote:
>> There are some warnings and errors that we either miss or
>> are new in pylint. Anyways, test 297 of qemu-iotests fails
>> because of that, so we need to fix it.
>>
>> All these fixes involve just indentation or additional spaces
>> added.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>> v2:
>> * temporarly enable and then disable "bad whitespace" error in 
>> image-fleecing
>> * better indentation for a fix in test 129 in patch one
> 
> So the changes look good to me, but I can’t get my pylint to generate a 
> bad-whitespace warning no matter how hard I try.  (When you asked on IRC 
> whether others see pylint warnings, I thought you meant the 
> consider-using-f-string warnings that John disabled in 
> 3765315d4c84f9c0799744f43a314169baaccc05.)
> 
> I have pylint 2.11.1, which should be the newest version.  So I tried to 
> look around what might be the cause and found this: 
> https://pylint.pycqa.org/en/latest/whatsnew/2.6.html – it seems that as 
> of pylint 2.6, bad-whitespace warnings are no longer emitted.  If that’s 
> the reason why I can’t see the warning, then I think we should take only 
> patch 1 (because it just makes sense), but skip patch 2.
> 

Yes you are right. I had 2.4.4, and now that I upgraded to 2.11.1 I 
don't see bad-whitespace errors anymore (actually pylint does not seem 
to complain at all). So I agree we can just take patch 1, as formatting 
is wrong anyways.

Thank you,
Emanuele


