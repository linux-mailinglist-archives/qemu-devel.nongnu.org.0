Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD54339DF8
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 12:58:47 +0100 (CET)
Received: from localhost ([::1]:46846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL2us-0001wQ-5h
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 06:58:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL2u8-0001Vz-Bh
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 06:58:00 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL2u4-0002PG-6R
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 06:58:00 -0500
Received: by mail-wr1-x434.google.com with SMTP id w11so6186855wrr.10
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 03:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tvorKafCGlkcwBBrppZdXP1cydipynukada63tip3Gk=;
 b=lKZNj0vcANeond95Qc8Z7/U5rPGgdxaVBCeORXcAgqlIMBwctcqQqywrZqCbOSaECn
 Xgx4fQ8vw84030zLRh8cEevcQeVbjsCZy4rRBTBG3NU5rwUno3R15Uyc1HLfwMytuIAb
 +O02rS2YTF/nth/GkNfQr3BoW8R68D2NZWIO+rgE351FbkCJ6fy1/vNMCesFOg+TGiOE
 e/mTDIsVJnGcH9B67CuX8TNozLPtslaV/yFn3VegTq2k6Dhkt5qQyDbUGRdGSo7vyiVE
 VVLeB5wv4WjNqsz5fXccmjCUurmI13H38MPhCgfW+PXGQHtYhsWwkFmsRm35Flt9pOwg
 Y3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tvorKafCGlkcwBBrppZdXP1cydipynukada63tip3Gk=;
 b=tgRYZ6oAl/6exh1Fx3fNfgZUwlqnykCX1aesMlnWDXnqsKrr1sE9IJ2V3CixcPL/er
 MBqV169Nv4Ar8VTd9adiCCh8zcUcYAUE/XtJ3Vp73cXoTCv8RWnm4YwS+tSJJhhCXy0X
 d0nNDbT27ev4OYirG4UWtvbRFsIC1B0hSuo8iu//flWHtpJM7mVXwOky+3KUWFsOeV/f
 UvXbq+6qDqdrD/QitrGi0gQbXJepD1BbtIuJgQ1zyX/eskJoMzn9KOgQgZkpdNkv30b9
 RT84Ws6rWz5jwe4kFod00jWNVgltgKAdtozMJhTJrAZOXdWH6RkaoFjGJilYF23+lEuS
 eyHw==
X-Gm-Message-State: AOAM532qYs1u87EA45YW7YuMib0qxd6A8oCtAIfqOWKesbr9KyCys+YM
 q982lkVjlHcpOrIzk12EVdU=
X-Google-Smtp-Source: ABdhPJy+wfgJMoIPJatdMoql603UtZ6Ylx0nR635+9rTGsNawO/dgKP91SvGYLAk0MMP9qtkEdIdCg==
X-Received: by 2002:adf:9148:: with SMTP id j66mr18800960wrj.124.1615636673984; 
 Sat, 13 Mar 2021 03:57:53 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u20sm13232560wru.6.2021.03.13.03.57.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 03:57:53 -0800 (PST)
Subject: Re: gitlab outage?
To: Paolo Bonzini <pbonzini@redhat.com>
References: <SN6PR02MB4205EC1BAA236F9A8E34E605B86F9@SN6PR02MB4205.namprd02.prod.outlook.com>
 <216b5cca-e599-a7cb-aca5-1595e644477d@amsat.org>
 <CABgObfZboWr7SCkZGzxAdkc_0sHQj-n4o=jZ=S3iQJ2fS0f0mA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <08341f85-2962-a0ba-7295-eb3e051f26bf@amsat.org>
Date: Sat, 13 Mar 2021 12:57:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CABgObfZboWr7SCkZGzxAdkc_0sHQj-n4o=jZ=S3iQJ2fS0f0mA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Brian Cain <bcain@quicinc.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/21 12:35 PM, Paolo Bonzini wrote:
> The site works for me when logged in, and the members of the project are
> alright, but I also cannot clone or fetch.

I don't think we want to update all automated scripts to use
credentials and enforce all users to have a Gitlab account ;)

Can we go back to anonymous access for clone/fetch?

Thanks,

Phil.

