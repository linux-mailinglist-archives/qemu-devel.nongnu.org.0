Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1092650084
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 17:16:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6wJj-00015N-TK; Sun, 18 Dec 2022 11:15:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6wJh-000156-Ut
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 11:15:09 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6wJg-0000YL-8C
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 11:15:09 -0500
Received: by mail-ej1-x633.google.com with SMTP id tz12so16532349ejc.9
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 08:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b3l1mGvDOdrZRyNwCflJyBNK+OoV26TD4gQZmaraD1Q=;
 b=w8ZBuJRFxWKGNQ6wzBVSZK3VfZW7lQRiWIdrb/Zh75+Lo17BUnPEkwwOCROc2RSQXp
 T1v2y9bfLejc7Dcd3pPgUhIBoYDyc7bTa2xeHmd1kymV02BlS2auL5oepy4Y98vOlZT+
 +5kDaSH4pLM/90o/zqSuNWeRAFV+FBLuDcN6yGZG6JCcDcpfzn2IRz77ym0+SvR2KF6v
 8G/mBqDUF5WHN1JHjTdhQElEw6Q1W8T/QdmSUyk6HbUY8boBJEJyQC4k4dcegP8FXJEg
 8MtsIpe6noit+Y2taX5OorEiu7iml59hEWvpQaR1ea1sHLW3WXch9ujez6GaKGJg/ANM
 iKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b3l1mGvDOdrZRyNwCflJyBNK+OoV26TD4gQZmaraD1Q=;
 b=KxlQp3iqMQFDO34gs+Nq05a/SfAKns7Rr3Fsv10cZ/34TeJwO71n57l3Pcx42hH7lB
 mJ1D7NXLI4Xac2N89XVt/13+kKaDcYYe7UC1zE6PpiZPX3ggERlYYfb8ewVU/FNN/DIw
 2T8MwJBFVLAcz7Ig3Lbdrydw1raG4mFWROwPET12lVMZX7UcWusSvNKGBh18wdW2bFos
 QQz/qRmHGYQ8jqoy3WeiRNLuzwCYaKg0cdJyUogvRYRnV2oLIrYpConLgOdQuYmroOJl
 Jnyvh4Eagyt+rZcdAgaApoFHJ/gYuy5GHMRr5Bu0uy+A+qY6pRrwlW+9jGwFxnsy1Vs+
 fTcA==
X-Gm-Message-State: ANoB5pnFgGBM68ofTIj++3HAHL062hKUd+LB/he/JblaDHHnv8zVKTZn
 AQc7hVoVb4cD/oJUnZ4J39Fx2Q==
X-Google-Smtp-Source: AA0mqf5ML90sHmX2bzXzxAxZSb1YlfiP+Z5oSDVi2ajYGf5Ca6aSIz4+eq9/RizN8gzLI3rdhNx6nA==
X-Received: by 2002:a17:906:88b:b0:7c1:4ecd:1d69 with SMTP id
 n11-20020a170906088b00b007c14ecd1d69mr15014011eje.72.1671380106467; 
 Sun, 18 Dec 2022 08:15:06 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 10-20020a170906310a00b007c0d64c1886sm3290064ejx.33.2022.12.18.08.15.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 08:15:06 -0800 (PST)
Message-ID: <d7f05d4f-2a56-6663-4a66-e53c3f14a061@linaro.org>
Date: Sun, 18 Dec 2022 17:15:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] ebpf: fix compatibility with libbpf 1.0+
Content-Language: en-US
To: Shreesh Adiga <16567adigashreesh@gmail.com>, qemu-devel@nongnu.org
Cc: jasowang@redhat.com, andrew@daynix.com, yuri.benditovich@daynix.com,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>
References: <20221218143927.597975-1-16567adigashreesh@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221218143927.597975-1-16567adigashreesh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
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

Hi,

On 18/12/22 15:39, Shreesh Adiga wrote:
> The current implementation fails to load on a system with
> libbpf 1.0 and reports that legacy map definitions in 'maps'
> section are not supported by libbpf v1.0+. This commit updates
> the Makefile to add BTF (-g flag) and appropriately updates
> the maps in rss.bpf.c and update the skeleton file in repo.
> 
> Signed-off-by: Shreesh Adiga <16567adigashreesh@gmail.com>
> ---
>   ebpf/rss.bpf.skeleton.h  | 1171 ++++++++++++++++++++++++++++----------
>   tools/ebpf/Makefile.ebpf |    8 +-
>   tools/ebpf/rss.bpf.c     |   43 +-
>   3 files changed, 891 insertions(+), 331 deletions(-)


> +static inline const void *rss_bpf__elf_bytes(size_t *sz)
> +{
> +	*sz = 20440;
> +	return (const void *)"\
>   \x7f\x45\x4c\x46\x02\x01\x01\0\0\0\0\0\0\0\0\0\x01\0\xf7\0\x01\0\0\0\0\0\0\0\0\
> -\0\0\0\0\0\0\0\0\0\0\0\x18\x1d\0\0\0\0\0\0\0\0\0\0\x40\0\0\0\0\0\x40\0\x0a\0\
> -\x01\0\xbf\x18\0\0\0\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\x4c\xff\0\0\0\0\xbf\xa7\
> -\0\0\0\0\0\0\x07\x07\0\0\x4c\xff\xff\xff\x18\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
> +\0\0\0\0\0\0\0\0\0\0\0\x98\x4c\0\0\0\0\0\0\0\0\0\0\x40\0\0\0\0\0\x40\0\x0d\0\
> +\x01\0\xbf\x19\0\0\0\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\x54\xff\0\0\0\0\xbf\xa7\
> +\0\0\0\0\0\0\x07\x07\0\0\x54\xff\xff\xff\x18\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
>   \xbf\x72\0\0\0\0\0\0\x85\0\0\0\x01\0\0\0\xbf\x06\0\0\0\0\0\0\x18\x01\0\0\0\0\0\
> -\0\0\0\0\0\0\0\0\0\xbf\x72\0\0\0\0\0\0\x85\0\0\0\x01\0\0\0\xbf\x07\0\0\0\0\0\0\
> -\x18\0\0\0\xff\xff\xff\xff\0\0\0\0\0\0\0\0\x15\x06\x66\x02\0\0\0\0\xbf\x79\0\0\
> -\0\0\0\0\x15\x09\x64\x02\0\0\0\0\x71\x61\0\0\0\0\0\0\x55\x01\x01\0\0\0\0\0\x05\
> -\0\x5d\x02\0\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\xc0\xff\0\0\0\0\x7b\x1a\xb8\xff\
> -\0\0\0\0\x7b\x1a\xb0\xff\0\0\0\0\x7b\x1a\xa8\xff\0\0\0\0\x7b\x1a\xa0\xff\0\0\0\
> -\0\x63\x1a\x98\xff\0\0\0\0\x7b\x1a\x90\xff\0\0\0\0\x7b\x1a\x88\xff\0\0\0\0\x7b\
> -\x1a\x80\xff\0\0\0\0\x7b\x1a\x78\xff\0\0\0\0\x7b\x1a\x70\xff\0\0\0\0\x7b\x1a\
> -\x68\xff\0\0\0\0\x7b\x1a\x60\xff\0\0\0\0\x7b\x1a\x58\xff\0\0\0\0\x7b\x1a\x50\
> -\xff\0\0\0\0\x15\x08\x4c\x02\0\0\0\0\x6b\x1a\xd0\xff\0\0\0\0\xbf\xa3\0\0\0\0\0\
> -\0\x07\x03\0\0\xd0\xff\xff\xff\xbf\x81\0\0\0\0\0\0\xb7\x02\0\0\x0c\0\0\0\xb7\
> +\0\0\0\0\0\0\0\0\0\xbf\x72\0\0\0\0\0\0\x85\0\0\0\x01\0\0\0\xbf\x08\0\0\0\0\0\0\
> +\x18\0\0\0\xff\xff\xff\xff\0\0\0\0\0\0\0\0\x15\x06\x67\x02\0\0\0\0\xbf\x87\0\0\
> +\0\0\0\0\x15\x07\x65\x02\0\0\0\0\x71\x61\0\0\0\0\0\0\x55\x01\x01\0\0\0\0\0\x05\
> +\0\x5e\x02\0\0\0\0\xb7\x01\0\0\0\0\0\0\x63\x1a\xc8\xff\0\0\0\0\x7b\x1a\xc0\xff\
> +\0\0\0\0\x7b\x1a\xb8\xff\0\0\0\0\x7b\x1a\xb0\xff\0\0\0\0\x7b\x1a\xa8\xff\0\0\0\
> +\0\x63\x1a\xa0\xff\0\0\0\0\x7b\x1a\x98\xff\0\0\0\0\x7b\x1a\x90\xff\0\0\0\0\x7b\
> +\x1a\x88\xff\0\0\0\0\x7b\x1a\x80\xff\0\0\0\0\x7b\x1a\x78\xff\0\0\0\0\x7b\x1a\
> +\x70\xff\0\0\0\0\x7b\x1a\x68\xff\0\0\0\0\x7b\x1a\x60\xff\0\0\0\0\x7b\x1a\x58\
> +\xff\0\0\0\0\x15\x09\x4d\x02\0\0\0\0\x6b\x1a\xd0\xff\0\0\0\0\xbf\xa3\0\0\0\0\0\
[...]

Can we have a build system step which generates this file and compare
with what is committed in the repository that we can run in our CI?

That would avoid the need of human review of this blob.

Thanks,

Phil.

