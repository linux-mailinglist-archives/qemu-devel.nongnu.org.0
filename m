Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8B64DBA6B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 22:57:20 +0100 (CET)
Received: from localhost ([::1]:37696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUbdv-0005Eh-HE
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 17:57:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nUbcl-0004QK-Ia
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 17:56:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nUbcf-000370-Qa
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 17:56:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647467760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ZaZVvCAeDocseEIxAMvQZBcZB0mKILDIRDm+zFBWho=;
 b=TSr/0KkBsFoOcW+BdpRIN10C/KU/ZL5ToS6hkkIgnyCPcvs3JXZQhoz9yg8Qfc0lnrmlJW
 yAdiXylBPILZ26mCi6PHyNaheim1smweGL2/xi6ixs69PxmkDyQIGXDCHP0clGpwst+zb5
 ZZJTb+oj51XGVXSTr+f7Pkg/m8liwBA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-1eWp8bG_NJqiOJ8tS08Gew-1; Wed, 16 Mar 2022 17:55:59 -0400
X-MC-Unique: 1eWp8bG_NJqiOJ8tS08Gew-1
Received: by mail-wr1-f72.google.com with SMTP id
 x15-20020a5d6b4f000000b001ee6c0aa287so1010635wrw.9
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 14:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=6ZaZVvCAeDocseEIxAMvQZBcZB0mKILDIRDm+zFBWho=;
 b=WFRTgDMflGGgITFFGz9xXCiKnSqIwGK2lgLU0y3g+QQUhuiKJnQ7I+eZeBqcaWv/jD
 36sqTTSx9WS9Zxz9/dBseFrmy1yyNZf+/gE4I8uAnEp/n6lELYvMGWqAsiMbx2HSSuk+
 ufqpJA7/VJ6rXD4E7Z+vNCa7oHtxE4UrEDyUl2gY/DcjM4PHRkUR5qzhg5hICP5vCcpm
 SxZA0NyAcN4bC6XUZx27NGKhpvUKTmZZuhMeANW9c1zbXybzAmmqp5x2t0dX4A4W3nOk
 i7IVMzwNlo6qbV47nhWFxmdGIQYloNE1YaIvSk9yAb86wpc2/WdVn0X9NGcLxGDHoMvn
 atEw==
X-Gm-Message-State: AOAM530AtvuQpUgECUOk1Tyvt0pUtnz6mYHbssvlUotjzvkAj1xjCqc5
 4jtrdK6Cl21epBDQXJwhPp1WxokfYDISW0dJMHdsVTmChsuCP7xQOWkirHJPnva1DW26toBbM9i
 iJmbk1C51+HX99cA=
X-Received: by 2002:a5d:6509:0:b0:203:e5bf:7308 with SMTP id
 x9-20020a5d6509000000b00203e5bf7308mr1376675wru.178.1647467757896; 
 Wed, 16 Mar 2022 14:55:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6fVzC2HWLPemrMVXLUqeyEwubky3QxUYe7hnOEM84Kq7EHf4zm0yigj1PfyCU/az1cq5seA==
X-Received: by 2002:a5d:6509:0:b0:203:e5bf:7308 with SMTP id
 x9-20020a5d6509000000b00203e5bf7308mr1376654wru.178.1647467757642; 
 Wed, 16 Mar 2022 14:55:57 -0700 (PDT)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a05600c351200b0038c6d38b42fsm3003992wmq.36.2022.03.16.14.55.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 14:55:57 -0700 (PDT)
Message-ID: <e1f1051f-f3bd-9a05-2821-143542d6ff18@redhat.com>
Date: Wed, 16 Mar 2022 22:55:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 0/5] Removal of AioContext lock, bs->parents and
 ->children: proof of concept
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220301142113.163174-1-eesposit@redhat.com>
 <516a480e-15a0-896f-6ff8-4303e110210e@virtuozzo.com>
 <f43e3499-fa70-f0ce-4daa-d62b5bb9819c@redhat.com>
In-Reply-To: <f43e3499-fa70-f0ce-4daa-d62b5bb9819c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 09/03/2022 um 14:26 schrieb Emanuele Giuseppe Esposito:
>> Next, I have a problem in mind, that in past lead to a lot of iotest 30
>> failures. Next there were different fixes and improvements, but the core
>> problem (as far as I understand) is still here: nothing protects us when
>> we are in some graph modification process (for example block-job
>> finalization) do yield, switch to other coroutine and enter another
>> graph modification process (for example, another block-job finaliztion)..
> That's another point to consider. I don't really have a solution for this.
> 
On a side note, that might not be a real problem.
If I understand correctly, your fear is that we are doing something like
parent->children[x] = new_node // partial graph operation
/* yield to another coroutine */
coroutine reads/writes parent->children[x] and/or new_node->parents[y]
/* yield back */
new_node->parents[y] = parent // end of the initial graph operation

Is that what you are pointing out here?
If so, is there a concrete example for this? Because yields and drains
(that eventually can poll) seem to be put either before or after the
whole graph modification section. In other words, even if a coroutine
enters, it will be always before or after the _whole_ graph modification
is performed.

Thank you,
Emanuele


