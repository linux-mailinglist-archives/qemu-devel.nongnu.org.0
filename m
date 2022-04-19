Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8B45078F5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 20:37:04 +0200 (CEST)
Received: from localhost ([::1]:43826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngsil-0002b6-Eb
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 14:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngsgT-0001as-Rb
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:34:41 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:33635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngsgS-0000z3-4l
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 14:34:41 -0400
Received: by mail-pl1-x634.google.com with SMTP id c23so16651426plo.0
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 11:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NK3dKoiQsoRDPE6VXKjIFq90izU3p453XK/lOpA+UUk=;
 b=V1Gm1ciyEBg0WWV85BVeEDRYIYhGxxSZhB2XocTzY6STpbxnEHorjH4lIcA9UXmVDg
 zCQqD19EtV4AieW8+5maZcwwEYwFaWDO0m8LS2DdfmpDdyHcwVNdQMtXlMNspcbNifZU
 UC2CqCF2jEixbyt31I6HU95zm28fQsdUlUiENBkF3P4akPPSP2U7bz91yaT7q63HmSdk
 WfLTgfx6BY4QW1tKiHA62UZo0FsZaN15GanNJpXzwCgfRs9T7bEOho25q/DWY4FPpym7
 81PmWkDH4W7w7+bW51um0pa6I91LDSOgi6qjXwdIx3Q2uRMcw6kjOUt8ME3lJH01wbq4
 2Rgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NK3dKoiQsoRDPE6VXKjIFq90izU3p453XK/lOpA+UUk=;
 b=o7msHQzFIEJGmDgzFQ6TfcesscJeW3zue/NsDgjX8vmPNUUaHPtaYrZc1LrCccDaH+
 wR1qdLwYVMq226pFAJtXNvNFZ7n3s/dfhmWpfXeRQmX6kmaYbka+a5w1hg/+yX9qgZBY
 2x/Si0mCnU1MNpF4fzqBHKMQCg70Ash1wl39IgPSCRwKwqb/nb7GDSt8tkoQnsr1Jecw
 E1ZYLQ6uet5S5ixEu9eNUaCCy23jw51cCBWQD8ogA8mrnSQFsK34Jpd8Zkb1PzvN+xj0
 iWTo7VasEom44YrcbnXtyfUq5SLuKVbSisKCe7BazVzZA3S9SaxZ/0a8lLi4shTd1Y0b
 bDcg==
X-Gm-Message-State: AOAM5308B6uzCliQQvPKB4fJQDM6smDwkoBe84wkISXQDKM/cm7LIYOw
 ECRFAjbrmybXOZV4oNgxih0OlA==
X-Google-Smtp-Source: ABdhPJy9pRHGLWJpbLmXxj4pw1pAR1fc4eHHOMPj8oQFuZBzZpmdR3X/hPqhicFNZyzT9fwbC92tsg==
X-Received: by 2002:a17:90b:1d8a:b0:1d2:7aae:33fc with SMTP id
 pf10-20020a17090b1d8a00b001d27aae33fcmr16057891pjb.242.1650393278710; 
 Tue, 19 Apr 2022 11:34:38 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 t17-20020a17090a449100b001d2f09e64b4sm1224502pjg.24.2022.04.19.11.34.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 11:34:38 -0700 (PDT)
Message-ID: <9f99cc6d-745c-33e0-478a-8d34d65241db@linaro.org>
Date: Tue, 19 Apr 2022 11:34:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v1 04/25] tests/docker: remove dead code for linux-user
 containers
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
 <20220419091020.3008144-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220419091020.3008144-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/22 02:09, Alex Bennée wrote:
> From: Paolo Bonzini<pbonzini@redhat.com>
> 
> debian-powerpc-user-cross was the only linux-user powered cross builder
> and it was removed in commit 80394ccf21 ("tests/docker: remove
> debian-powerpc-user-cross", 2019-09-26). Remove all the infrastructure
> around it since it is now unused.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20220401141326.1244422-2-pbonzini@redhat.com>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/docker/Makefile.include | 11 -----------
>   1 file changed, 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

