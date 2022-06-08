Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2A9542F98
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 14:00:37 +0200 (CEST)
Received: from localhost ([::1]:52926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyuMV-0003QD-Tb
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 08:00:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nyuBj-0005rR-By
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 07:49:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nyuBg-00069F-RX
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 07:49:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654688963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zLfwI/MQDbMcKj4GvkO98MEGAR2FbOm8+fc+/mxwjt4=;
 b=eOhMNRPjYzv4aN3jVhHQeRdWrJ/PVqb4u5jdKGMISguJ+p7/WbgrdhNfIGrBZegs7s2BTu
 faJv9QHjDz6Ne7i2VCPHGTtDSZSn1bbislNTC9p5LFMCq4EHNPj+1DE9EnedT1Lh5/KJPh
 7woRMukBRvG9KqCyokyOP3NyVvGx2pg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-cGLsyMwTN4ihqMDH-Xq8FQ-1; Wed, 08 Jun 2022 07:49:22 -0400
X-MC-Unique: cGLsyMwTN4ihqMDH-Xq8FQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 mb1-20020a170906eb0100b00710c3b46a9aso4693359ejb.22
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 04:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zLfwI/MQDbMcKj4GvkO98MEGAR2FbOm8+fc+/mxwjt4=;
 b=NaoF0bW+zQUyIADEGWdOezfJjBxpGSlVpd41OD7jHX8L7eHu8M6467XfFk0t3fpMq9
 ZTu57+nXZnhRPR5+i0C4umzK6eCJtzS62NPUOPU3aOYFDdNuMKHMNH1Uy7Eok4ISSTLi
 Jj6evk22QMqCQIJMKiFUfhEeZ8uxPh3vuKhzIitF5Z/sMqCVf/ksnQF2dBKzfuMLxu92
 gswBAQQ0tn68dkqqPGIxMM19qbew5z+LoCu00TokQKRu71+gB2RS2XghmY0GORhvd3ps
 8gBuUCW/Wrq/pURRiWAx1wF7NRya2PopD8ikI29tuKs5Q57gIf/d2gAL5DQE0BCAXHyg
 VoNQ==
X-Gm-Message-State: AOAM531CLM/TSP3H2b2jrEmCAiHzX/AvnRfmR6PTGD4CE82nbVLATF/5
 iAvBynNnf/q+VouhHhXHD3dyBIjIcyvDvekfE9B+r2YFTjjZbBwgWLyYb8CZUBfVrj006L4dWA6
 Yk9jAc0O86xmkbR0=
X-Received: by 2002:a05:6402:1e92:b0:42d:dc34:e233 with SMTP id
 f18-20020a0564021e9200b0042ddc34e233mr39167422edf.386.1654688961214; 
 Wed, 08 Jun 2022 04:49:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrijLCWPZNhRtDGL3SW7wYiWpuzSu7r2T0v1C3Bn1dHWLznD+WouN7oAtrNAYaT9eIDrub+w==
X-Received: by 2002:a05:6402:1e92:b0:42d:dc34:e233 with SMTP id
 f18-20020a0564021e9200b0042ddc34e233mr39167397edf.386.1654688960963; 
 Wed, 08 Jun 2022 04:49:20 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a056402060d00b0042dd630eb2csm12034739edv.96.2022.06.08.04.49.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 04:49:20 -0700 (PDT)
Message-ID: <3cffc38f-e82f-0d34-21f1-6089ac9de21c@redhat.com>
Date: Wed, 8 Jun 2022 13:49:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 21/45] block: add bdrv_try_set_aio_context_tran
 transaction action
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru
References: <20220330212902.590099-1-vsementsov@openvz.org>
 <20220330212902.590099-22-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220330212902.590099-22-vsementsov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.03.22 23:28, Vladimir Sementsov-Ogievskiy wrote:
> To be used in further commit.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   block.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 48 insertions(+)

Looking at bdrv_child_try_set_aio_context(), it looks like 
bdrv_can_set_aio_context() were supposed to be the .prepare action, and 
bdrv_set_aio_context_ignore() should be the .commit action.  Can we not 
use it that way?


