Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97F32F6A34
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:58:39 +0100 (CET)
Received: from localhost ([::1]:58116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l07pO-0002PL-Oa
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:58:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l073f-000429-5f
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 13:09:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l073d-0005wz-KU
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 13:09:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610647756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O+6qblF6JWCFDBnFyCwnMnp1Gg1o/ySV9kNn+KFeG+k=;
 b=gi39SYFvEF/itpuM8UQFGqJgPi6LMJxGpbjTz4ErloNeRBXIBJoNugViawvI2i7E/GLafI
 xfqjIZ/zcy9FpibRy/EWTZJabaI0ZLjZ6NCKSBZX/HDJ7hx8QklxDVJCuTftqblGrWOixA
 AS65N2r7RA+FQl0rmWeNSrzs3TfKGiM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-ejwKo9jtN2iozRkPxEqBAw-1; Thu, 14 Jan 2021 13:09:13 -0500
X-MC-Unique: ejwKo9jtN2iozRkPxEqBAw-1
Received: by mail-wm1-f70.google.com with SMTP id x20so2183233wmc.0
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 10:09:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O+6qblF6JWCFDBnFyCwnMnp1Gg1o/ySV9kNn+KFeG+k=;
 b=VrBqiWSzlRbK+XMSC4S6W7JwMtiTzrIeAyQfO3+3KgOeobjdEl8ERkNhimIBHc1cdv
 OaXK0X3YHm/UB1WF49igku1EgUGSP0Bdllm/SA4JBWZymlXrnfoSRzOkiWmVGlEyEgYx
 mVgPnYgIdkM6gfCMlyKicr/vBImbG8rHNa62mKV3nTA93PWlz8q/I1Q4tTbSJKuG391N
 PmZILXZwQNijYcnMRzdvObCLX2m8rXs4zCYRLOqa0QAT9aUZqqxrL4fNEByPm3AJZl7o
 W0MqoK3YEsAeeuVsMz/f8KXM75qW4eKEwGrqkyNtVzqjtDOZoxpGuGJ/lwrqdR4Cv5Yx
 E4IA==
X-Gm-Message-State: AOAM533olVsP29Gg5XIY+wGZi17SZpqheTbgnIBz5YNCa5Pi9n9E7Qf1
 Qx3t4oHJmpSkoR6wa90l2WUye98bzxsWWzlpbZc9VHely+FziAv1xcSwKOEuZKjVALO1lZun18Q
 Jtw9ITxM37Z/3GVA7lVqOGIqEfdaoNZ/NjhuBqlR3Gh/tIk7LfyeDeBTNj/9zGHRd
X-Received: by 2002:adf:ebc2:: with SMTP id v2mr9168316wrn.88.1610647751512;
 Thu, 14 Jan 2021 10:09:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUcUcZr4nuhCKJKVQWKcr1bJ/1P1zJQ5vxWusKAs4+I3Rip9Az3neh52LSzahy2EeKdnouVg==
X-Received: by 2002:adf:ebc2:: with SMTP id v2mr9168295wrn.88.1610647751317;
 Thu, 14 Jan 2021 10:09:11 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id v7sm9968594wma.26.2021.01.14.10.09.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 10:09:10 -0800 (PST)
Subject: Re: [PATCH v2 02/12] Makefile: add GNU global tags support
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210114165730.31607-1-alex.bennee@linaro.org>
 <20210114165730.31607-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <41357e26-6ac3-6033-26ad-44c599514a5e@redhat.com>
Date: Thu, 14 Jan 2021 19:09:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114165730.31607-3-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 5:57 PM, Alex Bennée wrote:
> GNU Global is another tags engine which is more like cscope in being
> able to support finding both references and definitions. You will be
> un-surprised to know it also integrates well with Emacs.
> 
> The main benefit of integrating it into find-src-path is it takes less
> time to rebuild the database from scratch when you have a lot of build
> directories under your source tree.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - run in SRC_PATH
>   - wrap in quiet-command
> ---
>  Makefile   | 14 +++++++++++++-
>  .gitignore |  3 +++
>  2 files changed, 16 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


