Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F954994C2
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 22:06:19 +0100 (CET)
Received: from localhost ([::1]:45784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC6Xa-0006Gb-Eg
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 16:06:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC677-0006kb-Dt
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:38:57 -0500
Received: from [2a00:1450:4864:20::42c] (port=46623
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nC675-0006Y2-9r
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:38:56 -0500
Received: by mail-wr1-x42c.google.com with SMTP id l25so15829562wrb.13
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 12:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4UMp6GCxIpsQCPvNCwro6ntkEAgtyccbiE04RS4oK+M=;
 b=QgMblzlU6RXKzukTyR9FaKz4cdu3FYxPfKjBkpLJbcBvIf0S5BFscMhZxq5Nde3qUe
 UpKyV9+Es2YAUUmM+YY81SUSil2aDl9j7K/pod02pWgd/JtbcFu+zf+f/UkmBNIxIP/9
 h8pW6fyFLxnvB1Qbuq+Vr5vjWDJqQj86lcYTL/QH4jbWbOxlVGcRNPP4E1vIC5oBq/Jx
 ce5qQuzahIk2k6pkNRYdzdDbQaeTAyMRNif3Ao8WcsJCHZO3RPmf3cabuIn+YSmVXBaV
 KCO/zMt5jEASpqmHlS3gvrcrLWceUpRCwDAbEC3ppoSZ00q1fLA+5c7mxDva9hKArQ77
 zRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4UMp6GCxIpsQCPvNCwro6ntkEAgtyccbiE04RS4oK+M=;
 b=MLvau18CGWtQ1GkwqB2cj5BZN8OfmaYtlTQsDFOzW+gYSZHYlUr+NSnOmuoyXAI/2n
 eif8ShcVbKsuQ265NeAeEJDTURyr8FacQJzghNKCgGGtY8aLO2CK4NeTWeWNoY3y/OMo
 ZlNT4HLUfdhfv41HNrL9tgFRgPGVwLksjxWV4UYu1wLPBVgVcsEN4+IIeDIrm4Zp9xDG
 u4hXKY//ODNqUlcvXa2cNhsCN48zdnMeXO63BH4/p4sCvND3CIPQB3tcSZVcMMBc4gle
 PVicGt07ytxfFtagAHwLmBmzCKksS19ZU8PLk9XlRhF0VjVWZD5vSRw/2IfTv7v8swtj
 LUww==
X-Gm-Message-State: AOAM533SsXOUEPl95WitDx0hSfxhKxsngvggw1lktXpCifD6UB0oEQga
 nAF4WqB5Gk2cNbU45HOIoTo=
X-Google-Smtp-Source: ABdhPJwl/jLI1zUOpi89SKeMTU3SMhZ/xKfmH1HrbEAItaym4HAAyVLP5EDuq6BhC2xEVCiPXwSvGw==
X-Received: by 2002:a5d:628c:: with SMTP id k12mr10646481wru.572.1643056733623; 
 Mon, 24 Jan 2022 12:38:53 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id w8sm15117308wre.83.2022.01.24.12.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 12:38:53 -0800 (PST)
Message-ID: <d6503936-a4fb-e8ff-7e8d-5470b73af38a@amsat.org>
Date: Mon, 24 Jan 2022 21:38:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 04/22] .gitignore: add .gcov pattern
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: aaron@os.amperecomputing.com, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Luke.Craig@ll.mit.edu, kuhn.chenqun@huawei.com, ma.mandourr@gmail.com
References: <20220124201608.604599-1-alex.bennee@linaro.org>
 <20220124201608.604599-5-alex.bennee@linaro.org>
In-Reply-To: <20220124201608.604599-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/24/22 21:15, Alex Bennée wrote:
> The gcovr tool is very messy and can leave a lot of crap in the source
> tree even when using build directories.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitignore | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


