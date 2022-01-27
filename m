Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FBF49E3D5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 14:49:27 +0100 (CET)
Received: from localhost ([::1]:38810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD59S-0005Hc-7X
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 08:49:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD56W-0003wy-Ar; Thu, 27 Jan 2022 08:46:24 -0500
Received: from [2a00:1450:4864:20::42e] (port=42761
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD56U-0006ll-Pg; Thu, 27 Jan 2022 08:46:24 -0500
Received: by mail-wr1-x42e.google.com with SMTP id a13so4870462wrh.9;
 Thu, 27 Jan 2022 05:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=77uCY9QiixwggP1KS5PF0bJ+jr/GGMBfDaFFREFlqbo=;
 b=f3khBkH78v1oUcWbTkVzl3/KrAuhuKsT17fmUX1klG4mbjDh8epJ70RbrsipsaCtv8
 fHUOtQOqsajAPeoMJbn+5YArXMotrZwVBnd/sWuj94TbUpV1LYaSoGxHpDi8Akyaf5Kk
 hh7A8qJOCA2dpkwXXSsOqC8b16NwJ9IUOyRxMKgeqMDqU6Az4U6ispujQup5QQRIzqZf
 RiGw1ONpsUiFbenOtQocN5fT9cERXqSLY/mEtFDi2XcqugEmOa8aQkqlWfpCHhq76zTJ
 CkP08bcCDMHEq2f/RcOX1JNifXxQyBIULiVoqC/IlR5ExoLqLv/q7IG59gMvql5WDL8T
 pGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=77uCY9QiixwggP1KS5PF0bJ+jr/GGMBfDaFFREFlqbo=;
 b=IZyMEujEpaSCxNUvjUb1hk52nAqmqdH+QEi6SIggNy111zZlH22DBbDn8QbdgNZv5n
 vHDI36P7JCspSlBJkAmZ67AzfwpGV1rBCqm+K6fzF0e6aV2oyvtaxlURnL3NAIz4lHs+
 QtjPQ7XGn0HC9tf9m3oyaqveKepmpFEu9mbEi5+rKhn5/hLUkw1YN/Yg/ftfkCyo0S5g
 +rDtzQ535sTSHH7iiZ2q9y5LaU3WwtbVQODOe16PpjIVJcLDO+8BH7ZDlB85OEhpaTOi
 CDyfn2SVASPaQYKVt3hPqyodSD8U/WDGfgeCSVcaHVS4rVdwY5j+aG7psGQMRF4k8mq/
 ZRQQ==
X-Gm-Message-State: AOAM5318sOwbVF+O4AzanfZGD9AkFEt2wvgqEpyN2KXIvaKVPyE3fV18
 MnRxix3xe6RMVE2OsKMs0R4=
X-Google-Smtp-Source: ABdhPJwB73MyDTOiYN/FKn4shPOcZ6t1z5fNZJCZOaz5Nw4NALNP/jGlY7NYkswUKKOiBeduZRQnDA==
X-Received: by 2002:a5d:6402:: with SMTP id z2mr3173178wru.481.1643291174606; 
 Thu, 27 Jan 2022 05:46:14 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id w8sm2200423wrq.3.2022.01.27.05.46.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 05:46:14 -0800 (PST)
Message-ID: <84e1fa9d-0b26-7b79-d36b-fbaa2af2fbd6@redhat.com>
Date: Thu, 27 Jan 2022 14:46:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 00/12] Removal of Aiocontext lock through drains: protect
 bdrv_replace_child_noperm.
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20220118162738.1366281-1-eesposit@redhat.com>
 <YfEwpbxfcNF6K5Cm@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YfEwpbxfcNF6K5Cm@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/26/22 12:29, Stefan Hajnoczi wrote:
> Still, I'm a bit surprised I didn't notice any
> aio_context_acquire/release() removals in this patch series because I
> thought callers need that before they switch to
> BDRV_POLL_WHILE_UNLOCKED()?

I think the callers are new and were not calling 
bdrv_subtree_drained_begin() (and thus BDRV_POLL_WHILE) at all?

Emanuele, enlighten us. :)

Paolo

