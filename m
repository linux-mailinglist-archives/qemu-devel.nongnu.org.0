Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 241C420CE43
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 13:39:07 +0200 (CEST)
Received: from localhost ([::1]:60248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jps7u-0004k2-55
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 07:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jps6v-0004DW-Hd; Mon, 29 Jun 2020 07:38:05 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:40040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jps6t-0004e4-TR; Mon, 29 Jun 2020 07:38:05 -0400
Received: by mail-wr1-x441.google.com with SMTP id h5so16179627wrc.7;
 Mon, 29 Jun 2020 04:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ba/K5ALQXjenIjuBP8UpuRVrsp8eWE4BSwmJL4ZBh9A=;
 b=p9ni3KKWuevwHEMZjAzHLUo3rWuWDXNVWoFnH3K6Fgc+I+kA4eOTGxVq138sgYzGJn
 af6GK77dFBfAtSkaRCh/NX9VBypd8/anxrSHAZ6b3Tn3mJCRkaQPgIg+vKA0RBY7uBOb
 gEhBSgf0wZpeoXjSs9SJHlG1jOAoenje4qlSoHe9l6KyPfW9WAp/xEkdPs67ejICV00h
 euv1Uj9UMgIzN7ug8urZA1BbkPn4I2zk1MBZ+eGGDGYY9OYfdvmva+d311utUoi1A5ts
 4HYgOLhXu16RwzaBGV0BVY1UGMtPM0XrVnEa/WqmGpa8c3JnmR6ZQLoTv+iwyNS1Uey0
 rjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ba/K5ALQXjenIjuBP8UpuRVrsp8eWE4BSwmJL4ZBh9A=;
 b=KtTYj8m2mtIvIdODku99gi/0Qx3THVnb6nO8uu2DrYk2098APIbLTarRq2xG+Aw0iZ
 S08aKD5jETzPMn0Zc/eq6QIV9V8E9xz+9mLYLPD0H1r2BtERzBSpV/XH6tHcXaMDPepE
 /0napRlUZDOPGwfJeahzhNiERot3qnii639kyBjefgNkz22A24+cJHh+lHgQKgnp8puL
 C7zjMOLYpsDxvFCJaNWNX4dS8rRRV7FvimAovU/PmxnrmiTub6Zxw8U2WZN/A4hhWbC0
 y7KmLWz5hCY9+lsDq3smHfptR/aETOHbp9SoLI9Nf46V+i6z3dHCO3/MbTpXG7BdGiAc
 kUGQ==
X-Gm-Message-State: AOAM530cPZox90Ve/+swZqO6dhAWgMESEUM2uD7nT1Hd3t2U3Bw3RP4K
 ZEAdLYvivzFBZUxDmIFgHfM=
X-Google-Smtp-Source: ABdhPJygEIsTNnggVwvSkNqXna1keo8bnP7+QU+ChLuOTvQub40fcaNKmpV9qJ/2ZbvR3M9hRiF2gQ==
X-Received: by 2002:a5d:5381:: with SMTP id d1mr16801613wrv.177.1593430681587; 
 Mon, 29 Jun 2020 04:38:01 -0700 (PDT)
Received: from [192.168.1.37] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id f16sm21013351wmf.17.2020.06.29.04.38.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 04:38:00 -0700 (PDT)
Subject: Re: [RFC PATCH 0/3] Use object_get_canonical_path_component to get
 child description
To: Markus Armbruster <armbru@redhat.com>
References: <20200626102744.15053-1-f4bug@amsat.org>
 <87y2o9ro9c.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bdc55286-0f1c-c2fd-7358-5c923d0cb091@amsat.org>
Date: Mon, 29 Jun 2020 13:38:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <87y2o9ro9c.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Huacai Chen <chenhc@lemote.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/27/20 8:55 AM, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> This RFC is simply a proof-of-concept to see if I correctly
>> understood Markus' suggestion, see the thread around:
>> https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg08652.html
> 
> Please show us output of "info qom-tree" before and after.  Feel free to
> cut uninteresting parts.
> 

For 'info qom-tree' this is a one-line change, because ram_memdev
is not displayed in it:

 /machine (sam460ex-machine)
   /peripheral (container)
   /peripheral-anon (container)
   /unattached (container)
-    /device[2] (smbus-eeprom)

