Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FA92D6A71
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 23:11:00 +0100 (CET)
Received: from localhost ([::1]:59962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knU9K-0001Bc-Jt
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 17:10:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1knU5n-00009Q-CR
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 17:07:19 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:34930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1knU5i-0006z6-MW
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 17:07:19 -0500
Received: by mail-ed1-x543.google.com with SMTP id u19so7238014edx.2
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 14:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wfVCOUPVgB3X9xDb6v7sTCalWAGhkCWwG574qMDXgsg=;
 b=mAaBZuDDV8Trnlu+gpk0GNFyFZPJB1XIeF4Avv39VAFPreGXBQ5X92sFwOxMCBHuSi
 dz7VDZo0Al3mibKLk4GEGrU96CHbSD9ZoX1AUMRbMv8zGVQ5XJFBsWfNQBZi05yp1pzx
 tSIz2dg/s6l97y4LChbUUN/Lk0au3BfetEQORiEi2g2nJrafbCsWEdYwlniJ6jl+aPRX
 wKZ4hwXxAJiRvQsd7xal+g/n3iCSXjwl0jGEG6F2OssOQeSvlYUZfwmXKdTA8OAe0CjE
 UG5AHc91EThd+FrN4meXNWJEohcg7lOWycqzbdICJipSrgaGoKkMhW9kOZTsC9VNl6CC
 OlCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wfVCOUPVgB3X9xDb6v7sTCalWAGhkCWwG574qMDXgsg=;
 b=p50bEijvuw0RvcBUtCb9CnUaXij8/Hr7DaziEcyTPThT+klH7SnJWdb5EJv6ClyyaB
 uwXnvAbkjBnyRJcekfTaLGB2eEHP10tTud7gs30VO3dImWak3awtIPjvOvSqt9Sou3a0
 qM66wkSZAZmbouE2YUQm4EXiTp4Mdj5B7USvbTfsSwp4uO37kRf5EwVqPZsS0wfVO7CL
 FqAThpc3u+NZ1V1NnRqqANACXRs7O7uVzXQWcFAd6R+/uZ6hGuYonbFh+kuIQPr24rMc
 NO8rx1VVYSa1Rvo45Jx58HedE4RYbDV6WlWlzcuKbn4zOnI0A046x+dQlXKkNumfAf4r
 Dd9A==
X-Gm-Message-State: AOAM530iWXZfHXAm7lGOOAI45wF9t+/yliaILFlBdV7fGQ2wIDa51Cao
 CmvKYLx9Y0CJr7SRr3+dSgY=
X-Google-Smtp-Source: ABdhPJzI994CpYxaSbkZcj4P0txhSGx08hsjNDM5MuEIKIsvGBm46dzJoov2aN9DTV7Fypc0/Hw3ew==
X-Received: by 2002:aa7:dacf:: with SMTP id x15mr8816817eds.134.1607638033127; 
 Thu, 10 Dec 2020 14:07:13 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id f19sm5359795ejk.116.2020.12.10.14.07.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 14:07:12 -0800 (PST)
Subject: Re: [PATCH v2 8/8] tests/tcg: build tests with -Werror
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201210190417.31673-1-alex.bennee@linaro.org>
 <20201210190417.31673-9-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8e9321d7-0a11-6917-c67d-eef2dda4952c@amsat.org>
Date: Thu, 10 Dec 2020 23:07:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201210190417.31673-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x543.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 richard.henderson@linaro.org, cota@braap.org, stefanha@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/20 8:04 PM, Alex Bennée wrote:
> Hopefully this will guard against sloppy code getting into our tests.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/Makefile.target | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


