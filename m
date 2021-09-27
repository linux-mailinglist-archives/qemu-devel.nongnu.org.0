Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E95C4191D6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 11:51:53 +0200 (CEST)
Received: from localhost ([::1]:48970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUnIe-0002Ii-Gr
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 05:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUnGO-0001S1-R9
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 05:49:32 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUnGN-0001Iz-CS
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 05:49:32 -0400
Received: by mail-wr1-x42f.google.com with SMTP id x20so6020995wrg.10
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 02:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x/8n2vDmPuX0//8vh7R6dcIkCAkZYeP6qFYktlRV0xY=;
 b=THo+Ya0Oo8c/G1D84Iyx0p+eYwo0OMWwvlt+theSVFtgI/OeGzHRuooDxoQdSotwT5
 jLqNNkj/6EjreXtoKG+t4CM8g7s1MnhpIfNHUZwVLYYC/67pfstA+HLNR3dj92Un5RAH
 JQ8cNxoaAPkt8Ze1Q0MzsU+eF0DaYUH5FVaLv++MdGf5QZblf2TqtXS30RJWRDZKUoYj
 /NcsFRWUxeF12FWPeH5gJE7cIz9i4cpIt8OI3Q1T4k9/dx02VLLYgKTenYo5zQZ7ntEX
 znPJjuJ0c0EJmoi+89cr/w6qbP2hBc4jBCAhIWLJCKs0PkEbs5CjGV5zM5FKiKkRFJEW
 9H+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x/8n2vDmPuX0//8vh7R6dcIkCAkZYeP6qFYktlRV0xY=;
 b=HXyNQxu/0vZvPD+F0f+SIlfINF+E0G1g6dQL4pZrwJsLtPdFTlJP39JkV/WZvys4IB
 wFnAbb8WDSPIjSKVgulvwKwRwEAnHmt4Qmma3ttY6C8dfFcRaYGFm0DKXX6lZ6jwMKC7
 tNaqzFeqGMHX8aWgXrwiOAyyyEId5Tunv7hCEHngLcD0QiXeVeoGIiKCY9FAaW+xYbsN
 aWWy0L0yvL7TNUF9aB3wdqe/+eUU0ckZ5kpw6sXWpOATExvWxlUU8J1Q+zXNG5VJlBuq
 rH57CdA9ODdnOF7sQ8QdbmZTodMCWKbYYjXw37xOf9puvHxO/ipOtncoZwYe5B/1Y7ZS
 /bHg==
X-Gm-Message-State: AOAM530ikQGRl4aEvGESJd3gyY2HpyRwL3xf/hD9LSarl+LDavKnDjFg
 Rbj2Nam5zss94oNwVNMcjlE=
X-Google-Smtp-Source: ABdhPJy6P6K+RsMiLhrtFQmL7U+F70WeY2myqz+D6DS2jKBBB46Xf6NRYl08JsMFSUZFE1B0CBwBMQ==
X-Received: by 2002:a5d:5684:: with SMTP id f4mr27291234wrv.148.1632736169858; 
 Mon, 27 Sep 2021 02:49:29 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id g2sm16898165wrb.20.2021.09.27.02.49.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 02:49:29 -0700 (PDT)
Message-ID: <5440d65b-8d26-78cf-9e20-bf955645ab22@amsat.org>
Date: Mon, 27 Sep 2021 11:49:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: gitlab-ci: amd64-opensuse-leap-container job failing
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <657cbef7-11ac-196c-01e2-aeb9744fe446@amsat.org>
 <YVGCStPffR/gss2f@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <YVGCStPffR/gss2f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.478,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Cho, Yu-Chen" <acho@suse.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/21 10:35, Daniel P. Berrangé wrote:
> On Sun, Sep 26, 2021 at 07:23:56PM +0200, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> FYI the OpenSUSE job is failing since few days, i.e.:
>> https://gitlab.com/qemu-project/qemu/-/jobs/1622345026

> It isn't confined to only SuSE. In libvirt we've had similar problems
> with several other jobs, though are suse jobs are the worst affected.
> 
> GitLab have finally acknowledged it is an general infra issue affecting
> many things:
> 
>    https://status.gitlab.com/
>    https://gitlab.com/gitlab-com/gl-infra/production/-/issues/5590

>> Should we temporarily disable to job and its dependencies?
> 
> Given it is believed to be a gitlab infra issue, rather than a problem
> of ours, or something we're using, I think best to wait a little longer
> to see if they get fix the infra.

OK (I checked the status page during Saturday and Sunday morning and it
was all green).

Thanks for investigating,

Phil.

