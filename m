Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4211643B522
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:08:56 +0200 (CEST)
Received: from localhost ([::1]:37870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfO4N-0004ap-C0
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfNzY-0007n9-3h
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:03:56 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:54084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfNzV-0002U5-Lp
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:03:55 -0400
Received: by mail-wm1-x32a.google.com with SMTP id j205so13748038wmj.3
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 08:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ygxhTHQJsafIs+R50NONHwKkiMTNCJrkf7nYifElRpw=;
 b=q0lCtwHcMYf8WUp5QoL7vZrbdkbwxn4orB/xy4i2ixqWlnoZrK8Wb6bfXzKs2KCJFw
 XkbBpdVBPo4n6Qkm5CRi9rkTjn66hRXFBUqoqbJujsXDdPRq6eJMu1Aco/CP4TXMruP/
 QodFTuEYTShkmEnktr+L3zxQjjTFZs4SGwYSad8XDEIIRfqk2nU6vhVPcwBtgElHkr0S
 /xAOTc7xqKognRn9JxNAYxSGAuR6Ca2pHeYcemptc9xdNSGG1a+JOHALnzOhVWvA/1I1
 pWLAANuq9EAk0npONyo9ZIOuQ6TEjLyXHXO+v1NPPkihIbtt+jWZWzMlJwHJ7LX9i2rW
 gwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ygxhTHQJsafIs+R50NONHwKkiMTNCJrkf7nYifElRpw=;
 b=WpFEm7elOwt5LX70f7jAOn4GuQ2OMidJWDnZmDmbQl4lICDjMAxycmLjpmXnoVo3Ti
 HBwnvMwOjbcFpmW+LS5S1JqYTf43/nHpvNa/RSzIuvdB8RjTVHTCabG+gzhzAZVWnyx5
 3hZdwZXR38BrqM0L+elswss6OJyYcI1KkatZxMpjzuUf25kItEhSFKYR7VkmdJTUhK2o
 fi7Dpv7riR6lwRQJPkLd0l4bQuNkknLGLSG2g5ztI5lLqsFd00Ip0+asjv5OqvoVHunV
 D/vQpa7qxF0Fw0CJ1A18csar00RvHy/eDNMe+lGDxRlo2R+eR07PBc0mpLXP8xZMI2Tn
 gJfA==
X-Gm-Message-State: AOAM53367GjOU5bxIRKj15J6rQK425jkZjFw2aCI4/zVzIjdDhAS7ink
 agZIXmq4XagSji/6X6ntCoA=
X-Google-Smtp-Source: ABdhPJwPhbk46etIANLWdqs5f5u3jlCwTO5HeQse092GLT6b0UI8lJj1snG46x4BQPlO3eyovmePjg==
X-Received: by 2002:a7b:cd03:: with SMTP id f3mr57254363wmj.16.1635260631678; 
 Tue, 26 Oct 2021 08:03:51 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o2sm16062770wrg.1.2021.10.26.08.03.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 08:03:45 -0700 (PDT)
Message-ID: <02a2fba7-a7c1-2078-86c8-fe717baa77e3@amsat.org>
Date: Tue, 26 Oct 2021 17:03:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 07/28] tests/tcg: Enable container_cross_cc for
 microblaze
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-8-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211026102234.3961636-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.215,
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
Cc: fam@euphon.net, berrange@redhat.com, pbonzini@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, stefanha@redhat.com, crosa@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 12:22, Alex Bennée wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20211014224435.2539547-8-richard.henderson@linaro.org>
> ---
>  tests/tcg/configure.sh | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
> index 1f985ccfc0..149eeb15ff 100755
> --- a/tests/tcg/configure.sh
> +++ b/tests/tcg/configure.sh
> @@ -55,6 +55,7 @@ fi
>  : ${cross_cc_i386="i686-linux-gnu-gcc"}
>  : ${cross_cc_cflags_i386="-m32"}
>  : ${cross_cc_m68k="m68k-linux-gnu-gcc"}
> +: $(cross_cc_microblaze="microblaze-linux-musl-gcc")

${ }

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

