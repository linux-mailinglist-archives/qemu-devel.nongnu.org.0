Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D602B39CB81
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 00:49:20 +0200 (CEST)
Received: from localhost ([::1]:36134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpf6V-0003dt-VW
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 18:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpf57-0002Ff-0q
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 18:47:53 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:41739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpf54-0002sw-S9
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 18:47:52 -0400
Received: by mail-pg1-x52f.google.com with SMTP id r1so10827710pgk.8
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 15:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r6VP0pXIEj88RVIUu2JrN1BVS4aVkNElXgnqgzu4/4M=;
 b=n4IW5WFoEj+FqkKdlPDp9gLzTQyzGwfVRMIwj2K6OVh5DvBla/0C5/x2xcJhECHcVK
 Cz1lgrGiqtqf5qe2f183ynSib7o1wKWoEgQh2qJbWcb2K5MBnEkLDRbXlTWAaiTRUWuC
 fQYM5DfvDNyzdMOPHmH/1PrbfR817rlqKMQ53hsc+AHC1j5+vjuDCu+u8PIhCYtq+oSo
 yLtwUo8egftZ4gJHh5OHcYZCUX1HPQ/xJ2Jf6oDLK8iJbaEUnbAMArWHLvdWma5ydDwQ
 bL8xOwYpLmI3sTV41uFlVrtSlLJzkEGNiUpa6fvEYznOgs2qwvs4RHkH+PFYYlWLr7dQ
 PuoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r6VP0pXIEj88RVIUu2JrN1BVS4aVkNElXgnqgzu4/4M=;
 b=IjM0C0ibtwJ0muUGfUxZiR9No2yWRL2A1/cnUzBDHBj4ztUqALM3Nrev5UbvcJbw5b
 k4U/CoNxGdKQXHu7SJBgN2pZF1jvFdb4DsBDRvYhO2G9/D1Fv1nJibsEgQLOJzvNYnjk
 6cq1d/yxnjGNjoWggM1p6f+vMTV2OmwP3qYP2awWgvtWZq5DIc59OnfPMfZibKIaV7fy
 Og2pCl8QPd69JF7v8vrWZwl+JFdfwxqG289rliwXY1DSMGLu48l7wb3PnQECNoqlXcCH
 Yqtj3/M1+LGkzSsMMSozute3apd7gvCP/LuShf2eC9o6vVnoQgHyZSldm/HxstGA/z6J
 nniQ==
X-Gm-Message-State: AOAM533h+eWwqLvdh2OEzyJyDXF6frsz4I1PAvpUxLS54njOnwoPiI6W
 DPamPUV7hQa7Kr4b77IkjLh6Lw==
X-Google-Smtp-Source: ABdhPJxt7XuMc3vDEswXNsPuY51lf96dhruj0fOOgYcDiZm91AI4f2XdRVKXvU1lbK8rkS4mJ053Cw==
X-Received: by 2002:a63:f306:: with SMTP id l6mr11557464pgh.46.1622933268401; 
 Sat, 05 Jun 2021 15:47:48 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 i21sm4664892pfd.219.2021.06.05.15.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 15:47:47 -0700 (PDT)
Subject: Re: [PATCH v16 96/99] tests/qtest: split the cdrom-test into
 arm/aarch64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-97-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fdb8ac5d-e6c6-0e13-e8df-f1e3e022c98d@linaro.org>
Date: Sat, 5 Jun 2021 15:47:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-97-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "open list:IDE" <qemu-block@nongnu.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:53 AM, Alex Bennée wrote:
> The assumption that the qemu-system-aarch64 image can run all 32 bit
> machines is about to be broken...

Um, what?


r~



  and besides it's not likely this is
> improving out coverage by much. Test the "virt" machine for both arm
> and aarch64 as it can be used by either architecture.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/qtest/cdrom-test.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
> index 5af944a5fb..1e74354624 100644
> --- a/tests/qtest/cdrom-test.c
> +++ b/tests/qtest/cdrom-test.c
> @@ -220,13 +220,16 @@ int main(int argc, char **argv)
>               "magnum", "malta", "pica61", NULL
>           };
>           add_cdrom_param_tests(mips64machines);
> -    } else if (g_str_equal(arch, "arm") || g_str_equal(arch, "aarch64")) {
> +    } else if (g_str_equal(arch, "arm")) {
>           const char *armmachines[] = {
>               "realview-eb", "realview-eb-mpcore", "realview-pb-a8",
>               "realview-pbx-a9", "versatileab", "versatilepb", "vexpress-a15",
>               "vexpress-a9", "virt", NULL
>           };
>           add_cdrom_param_tests(armmachines);
> +    } else if (g_str_equal(arch, "aarch64")) {
> +        const char *aarch64machines[] = { "virt", NULL };
> +        add_cdrom_param_tests(aarch64machines);
>       } else {
>           const char *nonemachine[] = { "none", NULL };
>           add_cdrom_param_tests(nonemachine);
> 


