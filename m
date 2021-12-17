Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A58C4792D1
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 18:28:41 +0100 (CET)
Received: from localhost ([::1]:35310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myH27-0005TQ-TA
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 12:28:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myGyH-0001tq-SN
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 12:24:45 -0500
Received: from [2607:f8b0:4864:20::52d] (port=47071
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myGyF-0003yH-TP
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 12:24:41 -0500
Received: by mail-pg1-x52d.google.com with SMTP id r138so2730513pgr.13
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 09:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2xBAgUWCGzy/tSKWOmQ+JneuBG513zbY/sI1j1FS/go=;
 b=INmjMZWSMmP83BUzwensMRnXhsoeQ7S/WhSH0aBbVE9jI98J+YwTFhvQqquZXLRWlu
 ufa58RATnzWFVV/YEDM+w3lKl3gxjBTJ3b3TQAueatDL84+Mq6CRhktRc7QxY2q3Ybl0
 9JaTvW/9xRFGR6YFhUN09Bew/lMbuOI3dPDG2pcye9L9xKNqVmM8+MXIHyd2cXstllzK
 IhbbXCPfVjIcAze/v6inEKHwmWkUrnBNL2afPf0G4kcPnaxd6UQCHfK7HEZFWBBSaFQC
 QS/eYLwXS0BvvtbWTxXRUekWHab+1pFNlRJ5c7E9juGyrnJk12dhvGf/UsR8AE4Eco1y
 1gfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2xBAgUWCGzy/tSKWOmQ+JneuBG513zbY/sI1j1FS/go=;
 b=Wf2eKgAhootmxG3GlymMxWj0zIVTO5i3Z4S9mz97a7reg53jTlZ8XscutGP7qZ/z31
 /DMYSzodR1wKbKzTzDvQqZJ1LEzUV5K3igF4RMtJ2SCe7hb4zGqvoD5jEIl/X0pOtuLo
 hYgyleQJF/ILkz5FJA3ot4zELcUcpDYiveFvWrFtUQuf3lzH/dky2dwI/wQlXbZvyZKu
 gehIlEojDEMYmJ8OtFyyVvYePtd3Pv70biOhV1YHZwY5Gcfpk6AB+dLLJAjBeSz4v0Mx
 gJqXOq8oip2wCyHKa0g7SqbVTqjx0PJX14ANduWIWUqC/OP1vUrIA6AOA4P4Cc3buRI/
 XWfg==
X-Gm-Message-State: AOAM530KwbkyLHsj2tagOuGeKfvu/ZZ7Jeb7ry1jx+24fA3BtORAYZWL
 rlsHdXoP8KupovXXVZJqfLmuRA==
X-Google-Smtp-Source: ABdhPJxZNL+axzXcgWQdqJhpVRYlUeXfQdSYiZ4rLXnZkMUUAAoLrIzWPfMqbhMILjTGcN3+gCP6aA==
X-Received: by 2002:a62:a21b:0:b0:4ad:57c9:c7d1 with SMTP id
 m27-20020a62a21b000000b004ad57c9c7d1mr4074664pff.68.1639761877195; 
 Fri, 17 Dec 2021 09:24:37 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id mi14sm13531108pjb.6.2021.12.17.09.24.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 09:24:36 -0800 (PST)
Subject: Re: [PULL v2 000/101] ppc queue
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211216202614.414266-1-clg@kaod.org>
 <cf2bd3a9-007a-5881-efb8-9e6195958030@linaro.org>
 <655a7bc0-2063-55ed-9b68-9704db2af3cd@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7fb240a9-194d-7e13-a806-f1847c7220f3@linaro.org>
Date: Fri, 17 Dec 2021 09:24:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <655a7bc0-2063-55ed-9b68-9704db2af3cd@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/21 8:46 AM, Cédric Le Goater wrote:
> On 12/17/21 17:33, Richard Henderson wrote:
>> Different docs failure:
>>
>> Warning, treated as error:
>> /tmp/qemu-test/src/docs/system/ppc/pseries.rst:241:Unexpected indentation.
>>
>> You can test this yourself with
>>
>> make docker-test-build@ubuntu1804 TARGET_LIST=i386-softmmu
> 
> hmm, I will be more careful with documentation patches in the future.
> 
> How should I send a v3 without resending all patches ?

 From the question, I assume you're using git publish... I'm not sure how to do so 
directly with that tool.

Maybe you can generate the email text with --inspect-emails, and then send only the cover 
letter manually with git send-email.

The by-hand process is

   git format-patch --subject-prefix=PULL --cover-letter master
   git request-pull master <url> <tag> >> 0000-*
   <edit cover-letter>
   git send-email --to=... --cc=... 0000-*


r~

