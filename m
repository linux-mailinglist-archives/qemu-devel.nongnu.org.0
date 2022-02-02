Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBD24A7898
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 20:17:46 +0100 (CET)
Received: from localhost ([::1]:54400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFL8T-0002Fu-A6
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 14:17:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFJb1-0001Rb-5h; Wed, 02 Feb 2022 12:39:07 -0500
Received: from [2a00:1450:4864:20::32a] (port=41800
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFJay-0007zR-9E; Wed, 02 Feb 2022 12:39:06 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 bg21-20020a05600c3c9500b0035283e7a012so116398wmb.0; 
 Wed, 02 Feb 2022 09:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Nl44S9nLCIdosevnqIOHcgJWbM4T8fJZfXLjX+P5WpY=;
 b=Y4Bg7cLzF1v12ozd96EJpriFVgrbec/+t2ITTpPTU5V0Kmonlnl0WV62dgDtsgOgw8
 EPicO71lgodpkEruvStiXNc3mdOfZxwF9OBbdGuurZTA1xRhDNmeZ9D8RFH3bgLFv2yE
 4xzTKCA3ThdK8TGMJkNI7T6ws0wnzs+d3vGyU+e071/wBWoQvs5FY5ADMBq+11O0mOVQ
 c25wa1uSQpfdqFpf66kYUjAXCskomcrhgeJI1Nm50+VKF+PwRTnMY7ELH+Ztnf+QkseE
 FWfi6E6dBF1JrAo/99n0bEfeVoqvO90Ak4xl+SDfD2YljZ4mlPpsV8pZK/7wiWPRJTaC
 pr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Nl44S9nLCIdosevnqIOHcgJWbM4T8fJZfXLjX+P5WpY=;
 b=STUH9FL5CEEULJJvfVKHUPl0oGoQD9180EI79eFgGjSXD86F/Dm2ycNjAV51Mw1UgO
 vhvPa85TEDq5RlgAK3x8PwZWt1W1kpul3EHmqmEdll5gPtLi9ZC3BYIjyATale0cUv/p
 Bj+5fYyOP8TNXf8vIJE/HLG5wzApSwAPVE5/BpR2bQsHUiDG7rkAMDa0Ovu2CtRKzaU0
 zVnUyLyUG/rkESEyVrOS2hF7MbZGo0mT+15OcW+Le6y1qh2cF7e1F2SCM2fjFDuman49
 fKMAxRAhLV4Ou4dL+sI6WIhmYZhGnxZUiGmX++krIRBOjuUdeWLjovFWnj3hG/9an6ZJ
 YfKg==
X-Gm-Message-State: AOAM532/4QX/53kZvg9AzMIfBPJcsJ+gYXLhEaYZDq82CKJaRStYNYYP
 DhCZUSEZFp3DtN0Lb/ILrCQ=
X-Google-Smtp-Source: ABdhPJy2jL83v0LjzG/6skOtXFBRlzDnCG9Lbk7O+hEa9vt9vV/W9uWk/Y4jhocKg19iGRGfsDQlZQ==
X-Received: by 2002:a05:600c:a03:: with SMTP id
 z3mr6971960wmp.73.1643823542410; 
 Wed, 02 Feb 2022 09:39:02 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id l6sm19224790wrs.51.2022.02.02.09.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 09:39:01 -0800 (PST)
Message-ID: <fbc50950-5124-87a2-a876-6e22e5a10404@redhat.com>
Date: Wed, 2 Feb 2022 18:38:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 10/12] block.c: add subtree_drains where needed
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220118162738.1366281-1-eesposit@redhat.com>
 <20220118162738.1366281-11-eesposit@redhat.com>
 <52eff922-0ca4-fc12-0edb-8eb963ac306c@virtuozzo.com>
 <a2e77f99-3138-0a24-9ced-79f441d42ca4@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <a2e77f99-3138-0a24-9ced-79f441d42ca4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/22 16:37, Emanuele Giuseppe Esposito wrote:
> So we have disk B with backing file C, and new disk A that wants to have
> backing file C.
> 
> I think I understand what you mean, so in theory the operation would be
> - create new child
> - add child to A->children list
> - add child to C->parents list
> 
> So in theory we need to
> * drain A (without subtree), because it can't happen that child nodes of
>    A have in-flight requests that look at A status (children list), right?
>    In other words, if A has another node X, can a request in X inspect
>    A->children
> * drain C, as parents can inspect C status (like B). Same assumption
>    here, C->children[x]->bs cannot have requests inspecting C->parents
>    list?

In that case (i.e. if parents have to be drained, but children need not) 
bdrv_drained_begin_unlocked would be enough, right?

That would mean that ->children is I/O state but ->parents is global 
state.  I think it's quite a bit more complicated to analyze and to 
understand.

Paolo

