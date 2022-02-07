Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE054AB8A6
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 11:29:59 +0100 (CET)
Received: from localhost ([::1]:56048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH1HS-0001CU-1B
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 05:29:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nH07w-00006N-0X
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 04:16:08 -0500
Received: from [2a00:1450:4864:20::433] (port=38573
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nH07m-0005XX-MU
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 04:16:03 -0500
Received: by mail-wr1-x433.google.com with SMTP id s10so20900743wra.5
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 01:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=u56WkEtwSI2fS2k0K8eim5kG2/2TkflEpecBI88LL0U=;
 b=qoD1uavfLWsbR7ZfPSlrAffTTU6kUFbj8Xn3lQia1+snOWU3YLmsEBe3aqcg5ExEn7
 eds6p/THT4ceCxOV716LFrLvjenSADH+1B+l0iTCi7Xw4IqDzXWCILnPubAsrjjh20m+
 pkNfFrVztPSBzfTylafo/kZeu//yoMbBnUD4BeL7g8RfkwH9rgnRDVFFAlvj2fT8fEok
 RbD/Ci7CW6FMdzHCBqWost3o5qzGK/5BYeual3+T3vFES34r0ycJVoJHsDpltmBdW+8S
 NVf7JUFoppJSq6Fvpo3IfyhPUVPzYbCj9rIWQMjSaAUSbflXtrriKNh4yUTQlxOLEt/5
 4Wgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=u56WkEtwSI2fS2k0K8eim5kG2/2TkflEpecBI88LL0U=;
 b=Q+f9W0vwxW7r+75rUh2KOuKdfj5U6BKdPgM2/nQMUbfn5yid3cnLeZHmmZ1CR1Sp73
 FOtgxNcGc3I2h12TVHn0aI1O+87rJ4kwzV0E1Ngah3MZ8d/KS+RXcXeKY6SsFr9W1MpX
 L3z94ztaJoM+DbiKRA7xDDOqN+LWQdpyMCIzgDePkjRU0Woi8DYPvO1ntRh4QSJw/UCZ
 H1z7jY8y0R+KjEBV4faFmuizDCLITespevhGpF1rxlwjMo+v55HKK/ObmAIPLr3TUY8M
 fKYP39pmsEZhIUYoGhlXfK3tac51j1u+6sRci23+bnBV8vFmD+RojaErBm/wQWWCGcsS
 1K7g==
X-Gm-Message-State: AOAM531pk6HG2ynCykb5yPGCrgeULuYo9zbAE6/tMXWhAxebCa90utHh
 bO613mvmgSvdHYu3IDtVXZo=
X-Google-Smtp-Source: ABdhPJxKuT7pwvHDd5KwZCqPPrLzpVLyCJEnfyv8JwxQFK9NiM5v6RaX8h3v5w9zxt62Wbz5scBQVQ==
X-Received: by 2002:a05:6000:2a5:: with SMTP id
 l5mr9162678wry.394.1644225335330; 
 Mon, 07 Feb 2022 01:15:35 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id t17sm9383344wrs.10.2022.02.07.01.15.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 01:15:34 -0800 (PST)
Message-ID: <9ffefa8b-72bd-8213-4388-e2f32220bcf0@redhat.com>
Date: Mon, 7 Feb 2022 10:15:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 01/26] tests/Makefile.include: clean-up old code
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
 <20220204204335.1689602-2-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220204204335.1689602-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com, stefanha@redhat.com,
 f4bug@amsat.org, robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, Luke.Craig@ll.mit.edu,
 crosa@redhat.com, kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/22 21:43, Alex Bennée wrote:
> This is no longer needed since 5516623020 ("meson: convert migration
> directory to Meson")
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Message-Id:<20220124201608.604599-2-alex.bennee@linaro.org>

Actually a2ce7dbd91 ("meson: convert tests/qtest to meson", 2020-08-21).

Paolo

