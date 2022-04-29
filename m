Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA05951452F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 11:15:24 +0200 (CEST)
Received: from localhost ([::1]:38846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkMih-0003qK-Lw
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 05:15:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nkM8g-0004PW-Vm
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 04:38:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nkM8f-0006PT-Ia
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 04:38:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651221488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=loPwqoImJ2BfTVv13F7EDm0lAQAOL9+Bhw4gQLDzboA=;
 b=ZGhxwDK4P2URpkwQkSUUI53LRzfri9w7emGaNzMyoG8/cDBFLM04uoiaC7Istnvo/sqD5R
 NCsOBJbgsbGKgVizqOC1aug1iiuC9SmQQSontEC1wakhpqO/Cn5ayYleFDDgMwslkC7kh/
 T/lkzl/5C5yPTGdOIMCpqXaP6OugokI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-kSOdkTmFPWerikOECl5R8g-1; Fri, 29 Apr 2022 04:38:02 -0400
X-MC-Unique: kSOdkTmFPWerikOECl5R8g-1
Received: by mail-wm1-f69.google.com with SMTP id
 bh11-20020a05600c3d0b00b003928fe7ba07so2217674wmb.6
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 01:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=loPwqoImJ2BfTVv13F7EDm0lAQAOL9+Bhw4gQLDzboA=;
 b=S9/TFTuXE35H4PlVYisKsA6m3lpHSQm2b2wYx3FTKmDNkEeEYLI5uPF7JEpVsTQa1q
 Xg9O2nfpCFeoLtfi7kKPe/y2xX9Udj/I/KX0fBy+vD6aRIZRpgy3zoqXLhGbBVN2Atzv
 HsZmE1MrDbCpelvX00jAJ3URsaogDxrfjqwWRXSSgSkxTmcYZqj5WjdldpTtbsluly76
 ryrTAQBiIfMPyfbH1rquuZ+lwUzJXfLxhweabCHiqme3AhIXki6ET1obXaRNx7R1wnWa
 PvOLdNTV7hxxP/KUlguqEwzendjN7x51zM+XruXOQMR65o8eS4zapUwNrWoj49WQA88O
 XDVA==
X-Gm-Message-State: AOAM533ypKvPp99IC2CIf4YNLXHymY8huMOM+90ZYANgnwKz1HGMooKW
 F1Dd3TjvmD5mbyVl25scBA6Of/x+bQyFSJrlab8CprdjusVfwN5S1p6XzZitQqfMJA+5FpX5mZ0
 1SvMa9iLEziD9pHg=
X-Received: by 2002:adf:d1c6:0:b0:20a:f235:5f86 with SMTP id
 b6-20020adfd1c6000000b0020af2355f86mr9135667wrd.381.1651221481489; 
 Fri, 29 Apr 2022 01:38:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxel5Vp05Q2drM/ZjTIV9ISl7HPPdGAcazSRCh6ervo26Rx0tDSYFrY7i3MFd1bdnglmlx9aQ==
X-Received: by 2002:adf:d1c6:0:b0:20a:f235:5f86 with SMTP id
 b6-20020adfd1c6000000b0020af2355f86mr9135655wrd.381.1651221481294; 
 Fri, 29 Apr 2022 01:38:01 -0700 (PDT)
Received: from ?IPV6:2a02:1206:4552:34c0:71ab:1dfe:eb3b:43f9?
 ([2a02:1206:4552:34c0:71ab:1dfe:eb3b:43f9])
 by smtp.gmail.com with ESMTPSA id
 v13-20020adfe28d000000b0020375f27a5asm1917764wri.4.2022.04.29.01.38.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 01:38:00 -0700 (PDT)
Message-ID: <ab1f24cb-78d1-7508-98ec-2dbc18d0a531@redhat.com>
Date: Fri, 29 Apr 2022 10:37:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH v2 4/8] async: register/unregister aiocontext in graph
 lock list
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <20220426085114.199647-5-eesposit@redhat.com>
 <YmqaxkbQqOVOHhlP@stefanha-x1.localdomain>
 <1a92eaed-9557-ae93-8143-17ef559ad965@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <1a92eaed-9557-ae93-8143-17ef559ad965@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 29/04/2022 um 00:19 schrieb Paolo Bonzini:
> On 4/28/22 15:46, Stefan Hajnoczi wrote:
>>>     if have_block
>>>     util_ss.add(files('aiocb.c', 'async.c', 'aio-wait.c'))
>>> +  util_ss.add(files('../block/graph-lock.c'))
>> Why is it in block/ if it needs to be built into libqemuutil?
> Maybe register_aiocontext, unregister_aiocontext and
> aio_context_list_lock can be placed in util/async.c?
> 

Yes the above functions are added in util/async.c. It's the best way to
automatically add an AioContext when it is created and destroyed.

Not really sure where to put it honestly, it's a block layer graph lock
so it made sense putting it in block/ but it is not reachable from async.

Should I put graph-lock.c in util/? But then won't block/meson.build
need it anyways to use it in block/?

Emanuele


