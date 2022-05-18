Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1396C52BD84
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 16:19:28 +0200 (CEST)
Received: from localhost ([::1]:38836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrKWM-0007M4-LO
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 10:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1nrKSy-0004MK-Bc; Wed, 18 May 2022 10:15:56 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:47067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1nrKSw-00023U-OQ; Wed, 18 May 2022 10:15:55 -0400
Received: by mail-wr1-x42b.google.com with SMTP id r30so2889632wra.13;
 Wed, 18 May 2022 07:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:reply-to:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d7pEXmTo1+jiC7c+dMQN/V6wcBYB/n6I1A9uTMxvqzc=;
 b=SpXrkSX72TbuPz7ojR/Ldx05LOgm+AGpVQbA7WJnZBm2bg6FPwO5ACMYPgYxA4kc87
 ohtP2rmJ31797NxKKHkKst5jtttgQHwsqsaud/nBWe2M19FGsKasgCa2XLDsoddIFaeA
 9UVfQJbCG5K4a064/Nl5fSID2RpHnrvP0ZttXbypIZffVYVievJkeezfCKRPaVWtUSUi
 BbeHpEaBpJteBFb/9es4xEwOO741NuVP9vokDl9D1+dCuoW7T2vLYx140ttkA/lpnp5l
 7sIL0Pi2ZpmHFk4Dk0XBl7BFve9Fxkqw4vcwxY02qp4Ls44CAXCQ7IrhP02UCd6GhzXq
 tJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d7pEXmTo1+jiC7c+dMQN/V6wcBYB/n6I1A9uTMxvqzc=;
 b=S24y5VF8pgq0RP7nGGx028XfM5yvF/NwF8tzfxn3IYwiIjW6SOuSHEAb9ZBb77Nmi1
 CT7rIwEmVYlUJ3JqJaF9a8Wi0nrIv29eGFHywOZUfq4m0pITRvKm03LgtBxChZcJ63VJ
 EtAqRd7nAMWyf9NjX6x3+yn1GPdqvuvmlsqATHhXtTp6wrYNBO2Sg0nL6CnKGzDUXfU/
 QqrR0GIDuEx5BoiW6w36Age1oPXSfi4k6CrOEKw6LFok1ORMapC0akTbJ4DYQ4xf0M+U
 EDjjndw6Bx7nm3tPu17bxpzMVt4IhHqXqanzVypZwOgjwypNEdVg/VOuc2cYgWs3R7RC
 Qapg==
X-Gm-Message-State: AOAM532lBE/QcKhXgKqojErxCqi3xLdhWGA/IVy6bQD8CmO8Qn8SLicO
 l8E93mf2scP+o74AitIDFEM=
X-Google-Smtp-Source: ABdhPJzmThoM72mKnHEu4QLQg1pD5emjxOEDlYr9k77eHYKaKqSy9x9l3kGrAdZArAWXoyZniGuv5Q==
X-Received: by 2002:a05:6000:1868:b0:20c:95c4:ed9a with SMTP id
 d8-20020a056000186800b0020c95c4ed9amr23219040wri.243.1652883352673; 
 Wed, 18 May 2022 07:15:52 -0700 (PDT)
Received: from [10.7.237.10] (54-240-197-226.amazon.com. [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adfa703000000b0020d012692dbsm2612394wrd.18.2022.05.18.07.15.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 07:15:52 -0700 (PDT)
Message-ID: <f7e1a658-202e-7297-b1d5-8b18bbac8396@gmail.com>
Date: Wed, 18 May 2022 15:15:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] block: get rid of blk->guest_block_size
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>,
 Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Xie Yongji <xieyongji@bytedance.com>
References: <20220518130945.2657905-1-stefanha@redhat.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20220518130945.2657905-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/05/2022 14:09, Stefan Hajnoczi wrote:
> Commit 1b7fd729559c ("block: rename buffer_alignment to
> guest_block_size") noted:
> 
>    At this point, the field is set by the device emulation, but completely
>    ignored by the block layer.
> 
> The last time the value of buffer_alignment/guest_block_size was
> actually used was before commit 339064d50639 ("block: Don't use guest
> sector size for qemu_blockalign()").
> 
> This value has not been used since 2013. Get rid of it.
> 
> Cc: Xie Yongji <xieyongji@bytedance.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Xen part...

Reviewed-by: Paul Durrant <paul@xen.org>

