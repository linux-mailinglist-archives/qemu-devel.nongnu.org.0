Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B884AA31B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 23:23:45 +0100 (CET)
Received: from localhost ([::1]:57738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG6zY-0005CV-Hf
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 17:23:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nG6ws-0002UE-Cg
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 17:20:59 -0500
Received: from [2607:f8b0:4864:20::42a] (port=36524
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nG6wr-0006Ji-0S
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 17:20:58 -0500
Received: by mail-pf1-x42a.google.com with SMTP id 192so6255377pfz.3
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 14:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WZE2XJggAfHaCr6wsWT5Pr7DhiCrcHKAyTtuZp0W+kg=;
 b=Zk8jiFWgCEIlezrpWBAxDe4mLJKVMV9c4javVZkPD/CU+Wc8Qz2qu9tIdMPCFUqMTC
 rvGt8VLrrTQai/ayksl0+Q3dL8v43CiJFE48nT9uiLMYJWXoykVMkn87t3EZtaABk+Vw
 PcP0qThGaCjEF37cXDEFcPuMKnf7IftHVk3NXkcKHLbYpKs5j4x6KbbrXH2iJzUj6PS/
 KBN1Vl7K06Lvkr5adgkZaVguZ14v2vJzSLbdohFgFBz+I7MOy40d0L8u5Cztg7FneMro
 93L2ORHsruXgOkCFRCg3dxKtulTNozOmUqWr9UwnDzilh1trwKtPpFUEWZmr//XPYMVQ
 RHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WZE2XJggAfHaCr6wsWT5Pr7DhiCrcHKAyTtuZp0W+kg=;
 b=Aw4P6ZA+ebuG7AxlMgbZn3wRGBO1Vrjs8LOfBAuybmJYSZvPXYPXmab0m4uj7ep3BP
 8BlSLQ+ndoX/Z70Zd/zO8Xw6tvvnT0zkfYIhLtOt1M86sKMq8udc7pOpegIMTtAa/ZmM
 PwOa9IcKxjjwlJery9SA/dizVfaWe0q856iSF2JZGjReOXCU7Do+62Q+k7P9DrvmzLsC
 GfV7lEmSPxuE+k/GWQar32OqTjmMhTBehLzz77PvdajNrJT/s9861w5DtqBxt2MhybgO
 +1SR45xTZ27yqS01VGNNEOZEO+AUZqKbuEmVQwVzi6D5ykNGuEsBNVCx4PJDsICJA+FA
 3uQw==
X-Gm-Message-State: AOAM533pd9I9+D9yl0UD64p6in5E1Y+VVpBVhLAyXTNxs3RPZcbucpY7
 xPdNb9DvPHnITFRbvml/Ps8=
X-Google-Smtp-Source: ABdhPJyqOPsUtm81BI4u1D8uFNK+i2CTDVMJPeR8b3+EsmGLTMvvhzfx1UqZqzjG8/dWTvKgqEqMRA==
X-Received: by 2002:a63:2bd1:: with SMTP id r200mr936520pgr.68.1644013255820; 
 Fri, 04 Feb 2022 14:20:55 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id s2sm2599903pgq.38.2022.02.04.14.20.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 14:20:55 -0800 (PST)
Message-ID: <a30e53a8-7ca9-8733-1c65-363a9c656b4d@amsat.org>
Date: Fri, 4 Feb 2022 23:20:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v3 03/26] Makefile: also remove .gcno files when cleaning
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com, minyihh@uci.edu,
 ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu, cota@braap.org,
 aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
 <20220204204335.1689602-4-alex.bennee@linaro.org>
In-Reply-To: <20220204204335.1689602-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 4/2/22 21:43, Alex Bennée wrote:
> Left over .gcno files from old builds can really confuse gcov and the
> user expects a clean slate after "make clean". Make clean mean clean.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20220124201608.604599-4-alex.bennee@linaro.org>
> 
> ---
> v2
>    - fix whitespace damage
> ---
>   Makefile | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

