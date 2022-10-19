Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2332604D6F
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 18:30:33 +0200 (CEST)
Received: from localhost ([::1]:46504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olBxg-0007lv-Ne
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 12:30:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1olBo6-0005pb-HC
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 12:20:44 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:55932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1olBo1-00049D-DZ
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 12:20:34 -0400
Received: by mail-wm1-x329.google.com with SMTP id t4so13232116wmj.5
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 09:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Iwmw9PMnCNDtKtpfuQSnL7/aFDgNl4A9sE5A7TitH6M=;
 b=cfwe++AiGE7jqAH8ujUv1LRlfnr91OEW85b2hJqJxKubegALAtGBYQHoXwYNqkvG5U
 dr9osH3qXP/K19r41hRnNwYkMI5UOHBaQlZ6VClAq5+rG0EMPSz5tHaw/4ixEBDpsbvR
 sg7W9/cMx462lV746LZUum7LAMZXp/6cbF0h3bRILiwzF5+nub9BVR9GwftOVG1V/9MW
 0xroRkr1gc7+V/BCHyIxFJUm7If8jmkjI4DhaT5DexWIG1HpMQpfimG40ejemxXJtbIP
 Dnz2btsel0Ip3P//ZJCMfyJZZ6QtCgyZnmLf/Lpmby5ePOBF+Vb9GJ/bMgFe45HSCQt9
 Z8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Iwmw9PMnCNDtKtpfuQSnL7/aFDgNl4A9sE5A7TitH6M=;
 b=zX5YWdpD7tESyVGw/JS94D46iqVA9kpkYD4OsGzmcMwmuVnb69X3p67Zn59Us59fdO
 3AT1oC4vWOz4g3gh+QsTP1fnGQJBOtdRjK3hIDURYghUgCWvIBZ80Ef8wyA9J3SBRNl4
 sMh9eykUQJh7pLMSpEZYZ6zTaE3hmO2nVU9FgD97k0QFflvSA2RAah/llxxBgrBNmEy2
 jd2UkAaxPxhDPqAYAbeFZEjoDxVK0BmmoiUh/4GtK2TCCC3Vj6h3vblZUEzs+0s6JAi3
 5ED5T7HjeR6s6lI/V8HuobP5PmBPSOgl0TWiWh6YRPkAvTJNTn+tkCxyZ3SyJFufzyMW
 b2ew==
X-Gm-Message-State: ACrzQf14wbC7UtuqNhVhHKFvB9GDhRbrd7pIYFcY0UAMYl8Rwv0kYXE0
 k1DIl+syLNrC2L7wSgyYmeg=
X-Google-Smtp-Source: AMsMyM56y348l/ISeOIYUF1NaaK8V1VIBgfBhdJf3+3om/ZwuaQWqDea3kef/AjLmL6gQvD8BjrdDw==
X-Received: by 2002:a05:600c:3c84:b0:3b4:eff4:ab69 with SMTP id
 bg4-20020a05600c3c8400b003b4eff4ab69mr27107411wmb.104.1666196430326; 
 Wed, 19 Oct 2022 09:20:30 -0700 (PDT)
Received: from [192.168.16.131] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 d9-20020adfe889000000b00223b8168b15sm14188174wrm.66.2022.10.19.09.20.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 09:20:29 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <03aa5254-18f3-d8f0-edc9-7e8cfadaf434@xen.org>
Date: Wed, 19 Oct 2022 17:20:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 09/12] accel/xen/xen-all: export
 xenstore_record_dm_state
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: stefano.stabellini@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-10-vikram.garhwal@amd.com>
Organization: Xen Project
In-Reply-To: <20221015050750.4185-10-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 15/10/2022 06:07, Vikram Garhwal wrote:
> xenstore_record_dm_state() will also be used in aarch64 xenpv machine.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Paul Durrant <paul@xen.org>


