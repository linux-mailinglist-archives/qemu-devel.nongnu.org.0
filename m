Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4D55205D2
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 22:24:46 +0200 (CEST)
Received: from localhost ([::1]:37216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no9vx-00041B-2c
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 16:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no9uC-0002wS-0B; Mon, 09 May 2022 16:22:56 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no9u7-0008Vn-Kt; Mon, 09 May 2022 16:22:55 -0400
Received: by mail-wr1-x42d.google.com with SMTP id t6so21002210wra.4;
 Mon, 09 May 2022 13:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/+bGecPh7CTo1sBnapxd4khPvMoN24O12Xu+ztCY3fs=;
 b=Mq1UBjJL2tIMaaQpfZ8bLxUCXLQXp/ys1ltczI1HlZSofen1Zm+f+0NnZc25Hir6HE
 hRM1AUBBVsT1zVV+lYEMqKlxGN0xm7PmGwxeyWBf6m38uSjUZoBQS/Abc8xg0Hf2Tj07
 22kaU/VY5iosHxNHRCSf85b5fpywjOHrqJ6bw0HB8g9F7AMBiHlIBK3eXKJGejUAEXC+
 E9VBBoJXnBB66Fht0MkBk4PkY7R/4IDcP3QNBkOXnFZwSfJZRNCK9RTW5U9Ql7rKLCgd
 hxKLzaDvDzyT2Jqps9y1YL2gGzCdCpatVY/k5Yw+7xEHw+6oFSANRYRsGU+3fqfM4rjC
 qzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/+bGecPh7CTo1sBnapxd4khPvMoN24O12Xu+ztCY3fs=;
 b=ExiIiHJYwB4Tzf3BilFcauFB2qLSBe1EEdi/RB98eyegi3Z4MKXFeCMHgB4nyVRDTb
 0kImbzEbnaLYvYOPGk/tVyU/aODFhNV+iMA2YoyfYwvaoIVhu3oKn6zrfn9khgM1yAXU
 jWE4N4oOXYWRZQ5uGj26803t1j1Of/1Wtc9r1DulxmHl8zf5mzp26VjpQ8WiuFQleuE0
 aVNcy37RqeFYioEhK7n2qYGTFh5kd1KFjjH7b+S7lhmX68YKI5+qKt4ldaIuB9awcUs4
 HkCQQucqQ5EP122E8gBLOfPLkFpbIpjPXH3ocOyXlE9d14YL/jC4ESa0+fAkp6WBbrhM
 0fgA==
X-Gm-Message-State: AOAM531GTL6B45tt2wfTvGr8us1bEED5URQzmf99BQ6Az4SaR3gbElYO
 p5rt003cSd/Ui521AVxI4g3nC7/9TEs=
X-Google-Smtp-Source: ABdhPJzIMVLVamX2d8rD8fvimYzekJh6c6hIvcaJ3aI0iIP3q6m3rBBUvTI8zEH6AkPHI4HmuSRang==
X-Received: by 2002:a5d:59af:0:b0:20c:52e9:6c49 with SMTP id
 p15-20020a5d59af000000b0020c52e96c49mr15548432wrr.319.1652127769639; 
 Mon, 09 May 2022 13:22:49 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bw22-20020a0560001f9600b0020c5253d8d8sm13676331wrb.36.2022.05.09.13.22.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 13:22:49 -0700 (PDT)
Message-ID: <36ea57a8-c9ac-cbec-6a60-06be10af7147@amsat.org>
Date: Mon, 9 May 2022 22:22:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 2/2] .gitlab-ci.d: export meson testlog.txt as an artifact
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220509124134.867431-1-berrange@redhat.com>
 <20220509124134.867431-3-berrange@redhat.com>
In-Reply-To: <20220509124134.867431-3-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 9/5/22 14:41, Daniel P. Berrangé wrote:
> When running 'make check' we only get a summary of progress on the
> console. Fortunately meson/ninja have saved the raw test output to a
> logfile. Exposing this log will make it easier to debug failures that
> happen in CI.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.d/buildtest-template.yml | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

