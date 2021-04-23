Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE18369C7D
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 00:24:36 +0200 (CEST)
Received: from localhost ([::1]:53066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la4Dz-00063c-7C
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 18:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1la4Cr-0005dR-WC
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 18:23:26 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1la4Cp-0003QL-PC
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 18:23:25 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 t14-20020a05600c198eb029012eeb3edfaeso1960345wmq.2
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 15:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KR5UdFdXqeqQf1LtUSA5LY2ajZ5PqlTBcknDH1awV3I=;
 b=YRHndSmHU1v4AFUMkwApheBDBMfNbJU4d6EfbYk/cTVWLLPdP0O+23xGwrVk9JKGSu
 Phm1TwzemKU6sR7G7UC3L8/dWMa8aFesPuozaIVVeCl9oSoXlW6yXt0HgdAKzCjl+8ES
 iXIchXzJhbEBA3ITU8ppwXqExlB9DqAfTq9lA17SAu1KBvk161Qrj3lSjIM7FC2WT8lB
 cNQahu1wQw8eQaHImQLgOOvYnBf3oDAA0hKA+LxdCa4XYIRvwSJ5WY71e7GcKwcwsdHF
 pJwzXsy+AjKNt2CdIVPIN0+umOTE7ifORrzoci2YikkaMs1lyQVCjvMTXkUMFBMcON2w
 XH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KR5UdFdXqeqQf1LtUSA5LY2ajZ5PqlTBcknDH1awV3I=;
 b=b/z8n918aEivHmuOx5bNu9hO15FkCKD+O28yZdGOrB4sWQZXZSASHxc1axL38Kxwry
 lsc6ZExv9737186NT/dxeBxVns9VftAbF7AYPMrZnhMOPvLURcPzaltp2a2BbBCu5cf2
 MRzdIsyaBUSE6BmDOckZslMxM7llF50fGlaqIErvrdIJRw1h3ppxe1OZpaBYcNQ+SEii
 W4RG4lRpRDxfqYSP4m0hi+Qb/deb4suo3RCKZ+yaHep5F1wSAQWM2hU5idWCuz3XC5Zg
 RV0cTXClImFioBt03/aTSWn9F1MfVKDyglFr8MAr5QwXpiqiKZuYMvF2qmZn2P0GIHBT
 kP0Q==
X-Gm-Message-State: AOAM533G6jlrmuS3Z/FPtDRdUSkdNXIFECN0bn2/FM1X45mgEHxP+HA5
 HkB3jd25+/zT/HpFFv95dbU=
X-Google-Smtp-Source: ABdhPJy9NvY0u454lQwsouBnGDv3eex5luCFdM1VVHvgRnabBnk4fdXKOeoLH6Hk8OvSt/VQ74qqrw==
X-Received: by 2002:a7b:cc9a:: with SMTP id p26mr91686wma.39.1619216602158;
 Fri, 23 Apr 2021 15:23:22 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id 61sm12012294wrm.52.2021.04.23.15.23.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 15:23:21 -0700 (PDT)
Subject: Re: [PATCH v1 08/25] gitlab: add build-user-hexagon test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210419145435.14083-1-alex.bennee@linaro.org>
 <20210419145435.14083-9-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0e0294ee-5758-5e44-aac6-e739fbe3d0e0@amsat.org>
Date: Sat, 24 Apr 2021 00:23:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210419145435.14083-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 4:54 PM, Alex Bennée wrote:
> We special case this as the container with the cross compiler for the
> tests takes so long to build it is manually uploaded into the
> registry.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Message-Id: <20210305092328.31792-7-alex.bennee@linaro.org>
> ---
>  .gitlab-ci.yml | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

