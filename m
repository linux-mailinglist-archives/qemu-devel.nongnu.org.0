Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7E352056D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 21:47:23 +0200 (CEST)
Received: from localhost ([::1]:43078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no9Ll-0005M3-UY
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 15:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1no9KN-0004er-PT
 for qemu-devel@nongnu.org; Mon, 09 May 2022 15:45:55 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:37461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1no9KM-0003Qw-E3
 for qemu-devel@nongnu.org; Mon, 09 May 2022 15:45:55 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 15so12892299pgf.4
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 12:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=bGlYQZ3Ik36xSQh619nW0ArM/xcyEc1b/TMgBbYYlmU=;
 b=LczZuizIgc1+xcWUxhSIUYAMKXi5TnJA4SUb3lu/CLSQFrQMiCu7t7SOAydwhK0iFZ
 YIM8zHv1UIEpSx67knQ+YB2nUzyQlmwvuYUe7dczhx87/ztUXG/I1fNpICdmf+fPHWRo
 vCGiS9cnvfaGu7/e9nGwFQBK7oq4NPdYxEZ4BCLKIGE28/1utnE90ttWl90bqDRHl75H
 B5trt7QLJh3cxj4EQs8zsOyjkGeYJZXpx0MefgywoX8JW94WE1296FuNO9eFh5VpPAub
 UvbfFBT0ngarLUV/cAJ41QVwxpKMblE+6lrg9oDm330+khhsplT837IvxeFvGA061LN3
 L+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bGlYQZ3Ik36xSQh619nW0ArM/xcyEc1b/TMgBbYYlmU=;
 b=vdB3x08s58VwAFpyJcLrzu1hKfiZKD/X801dq96f2xSfFADzddZSBO3NksHPGYJ3c1
 Ymu6tQd4JILwMMg/biIp4LnS1cRP8mco2Z63gQKTDox2j46K1+dqR6Qm3rtPTp7reUbw
 OXcWNN8FXKmR80LHd1urU1R4fPa/Tn/SotqE395lCLSQn+9asAHBnPEEzk+NPBsxoJ1H
 tjWS5cJZ3i9D2yETV3XQVOkjYX4kROunIPZ62xN+EdcySoZ3t0JaJbgv0dktc8ngg2un
 w+YCdTp5UKK+w3GpuYhujjrro6YL6CH1VQJy7IoRJmNjcyXeq6H7QYO5ktEr0tAZFUyM
 4gvw==
X-Gm-Message-State: AOAM530xz4L6XVLLyqvQBdAYWM/zm95W4tFPbMbC+6JS8ozOa6YwUyIt
 nGNKnoI8W89+5C+ZtBa3yqSJrg==
X-Google-Smtp-Source: ABdhPJzlut23AwH646Z/Pvu/HRDfW2cctiV0eFVCVqdhe9b/73XBoUw1wConloiIGBpLtpDoKP4ybw==
X-Received: by 2002:a05:6a00:1ad2:b0:510:72f6:d039 with SMTP id
 f18-20020a056a001ad200b0051072f6d039mr17119213pfv.2.1652125552677; 
 Mon, 09 May 2022 12:45:52 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a63f112000000b003c14af50603sm8834672pgi.27.2022.05.09.12.45.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 12:45:52 -0700 (PDT)
Message-ID: <3628fa0b-165a-863a-ffa1-f939d092f79f@linaro.org>
Date: Mon, 9 May 2022 12:45:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 12/16] migration: Add zero-copy-send parameter for QMP/HMP
 for Linux
Content-Language: en-US
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, quintela@redhat.com, peterx@redhat.com,
 leobras@redhat.com, berrange@redhat.com
References: <20220509150253.218715-1-dgilbert@redhat.com>
 <20220509150253.218715-13-dgilbert@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220509150253.218715-13-dgilbert@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/9/22 10:02, Dr. David Alan Gilbert (git) wrote:
> diff --git a/roms/skiboot b/roms/skiboot
> index 24a7eb3596..820d43c0a7 160000
> --- a/roms/skiboot
> +++ b/roms/skiboot
> @@ -1 +1 @@
> -Subproject commit 24a7eb35966d93455520bc2debdd7954314b638b
> +Subproject commit 820d43c0a7751e75a8830561f35535dfffd522bd

This is an error, probably in rebasing.


r~

