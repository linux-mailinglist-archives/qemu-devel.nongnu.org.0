Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D5A67B31D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 14:19:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKehO-00050U-7D; Wed, 25 Jan 2023 07:16:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKehG-0004wL-Hb
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 07:16:13 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKehD-0008Mu-Og
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 07:16:09 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso1141956wmq.5
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 04:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ER2SI4PlaWHGQyH2e2dd96iwPQoAleiGSkVyIcN6NyE=;
 b=oJEKCV5G3wULQ5/rTU24gUwxEFgmQ6i6MzOpcn6cRF1KLaxiN/ecbQSX2wmPb46eKE
 ff0+4tslLvVUSw9iOPKRegyyLrqPpSdvlMen569CuJfBzl4JsDRM6jERXS/MT0mQ6MK7
 lkW0kESfBC0mliv58D6IZnNbNUecPdS0Kv3dE8V38qSCRQeBOaaV9RPJ55ylvfAFhb0O
 X7eDMhfxE+srAQOEiLPYzQVoskR2KRP9hxPcExm14rarBpIbHOzCykBiug7OfF1xNFfz
 x5KTI3Z54DE1hB4h40QZyO//bQKLOjMs3/ipB4fVRJLIHplONZJAoDUXYi+vM1WmroBr
 5COQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ER2SI4PlaWHGQyH2e2dd96iwPQoAleiGSkVyIcN6NyE=;
 b=tsFnLOpdB7AmBfWO1R8KkSgWW4QY6LU2U4UNna6iDo6tYrnGMjOxrSbKg7Da+HD+Tl
 VGnEdmUXxIcMlo8DsmI9vafIevymHPV/79H1DiNmTH8sPE/XxuFIeMGCgJ1dbzWVueFl
 ac9wwTj1lPYy3SXgzARpN/JunCTYgHxb3dp+i1xaiScXhGyzbK5d1gzWbP1xibICgTq/
 irWzsoLp27bPK8EzkdBJoS/PT27hbL5BzQw+kqcVhWx+PzYCfdBkXDJdC2jHlPPZukR0
 hendNHtPG+gqGIIwAW9AC09Ew3ES74nU24/jY0w17haXwyk41GxAsiW9meFXCacY/38r
 1FYg==
X-Gm-Message-State: AFqh2krSBBCNXEGCbPVkLN45YrSAKf2mlSIIO8L3OF8YN/60t0X4Txv6
 BDL5R6g/rI4Usn77rDy3uF59Lw==
X-Google-Smtp-Source: AMrXdXvNv+mdbb7AtqIq+hx/VRRyNRmxWORy4dDdYX2jOFNqxY/aKSTVG4e6+cVCuwdVgbaphIDiqA==
X-Received: by 2002:a05:600c:ad4:b0:3db:11d0:21e2 with SMTP id
 c20-20020a05600c0ad400b003db11d021e2mr28325094wmr.29.1674648965603; 
 Wed, 25 Jan 2023 04:16:05 -0800 (PST)
Received: from [192.168.0.114] ([196.77.22.181])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a05600c150500b003dafb0c8dfbsm1939388wmg.14.2023.01.25.04.16.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 04:16:04 -0800 (PST)
Message-ID: <657d1e7c-875f-9eb5-4ab5-9d8f9094063b@linaro.org>
Date: Wed, 25 Jan 2023 13:16:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 19/35] docs: add hotlinks to about preface text
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 qemu-arm@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Li-Wen Hsu
 <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
 <20230124180127.1881110-20-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230124180127.1881110-20-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/1/23 19:01, Alex Bennée wrote:
> Make it easier to navigate the documentation.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/about/index.rst  | 16 ++++++++--------
>   docs/system/index.rst |  2 ++
>   docs/tools/index.rst  |  2 ++
>   docs/user/index.rst   |  2 ++
>   4 files changed, 14 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


