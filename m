Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5B52F068D
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 12:02:09 +0100 (CET)
Received: from localhost ([::1]:57668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyYU3-0005SY-Nh
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 06:02:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyYSF-0004uh-Db
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 06:00:17 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:53237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyYSD-0006QJ-2h
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 06:00:14 -0500
Received: by mail-wm1-x32a.google.com with SMTP id a6so11359537wmc.2
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 03:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ixgPMfwSK3mMDrSd/7DpE7ytbouDXvb6aNaiPgWCUNI=;
 b=QOc9LGi6pibo4VzICd07JWj5Df1XoFJNYRHLazZ2d4INAr0rY92nQ9jHMrQhZqyB0z
 NYCFV+2d9vJwdY0ZWZ/L8Lej4MvSJiUHMVzj8I4+sHcGCnZsOtNsuN3jKSs6KPQYB6rv
 PnAkXGru8TcBbmhnW6nOdz5uh6EDs0B09FY/gCEygzbImnA8Fuel9XdO/6rAOmIdH8Dl
 SmlHKhXAp/9OHn4bAKToHXGvlOgHmmiLqoVUB3wbTO9qYAnbX4fZ9zr0u4DJ+C71B9A5
 GMag9RqHe6TuuepqPz6pZDVmsMbPoiYk1UwFIxmNVZ+74/hHtkkIG0ldVpw0/e01ZD8a
 xgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ixgPMfwSK3mMDrSd/7DpE7ytbouDXvb6aNaiPgWCUNI=;
 b=rDgSPiH0BpPaFQ28HPm6TkukHwHC9mGbtGLdhZcLSg6VgTDi6lxJuPuNjzqIc9lqPv
 Lnz8Mwuo2RiUTLgh2LWyo5P5ZKadK/2uBZeDfY/82HOC14H5wjFG3+QQNScMrCDWreT3
 Ean2WP2UWPRwFjRcwV3c1qhm1SCk1A3sgtGT0E7YSdeSTqPdPFAhtXiYTRne1mfMtTIZ
 dptIzCFYhsLt+iwDJYujc+tnKYeu2G0cqf8jjWM44R9EYoRu+olQjaCH9N+++oo12o2T
 GbHS14RqLbVafeFaVWLu07w8jqZHp4sVDTTXKsZ6j6SUAr1lu7I2xWNDb6/DbBuPEGmQ
 3R9w==
X-Gm-Message-State: AOAM532UWf2mTJqNtV4yFpe3tZOc2eAm+bzyCIFDz13P/4dnV6UXcWKp
 rUF0nMd8BSn5nwpdiycXzwQ=
X-Google-Smtp-Source: ABdhPJzQGw97hR1Ht2PZkXzfEkGA+ptUzQMj3d6ysiT8YY/3xR6VNmZqi5ztpW4zt2ewd+mPTG00Ow==
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr10095002wmi.20.1610276411280; 
 Sun, 10 Jan 2021 03:00:11 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id c7sm22366108wro.16.2021.01.10.03.00.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Jan 2021 03:00:10 -0800 (PST)
Subject: Re: [PATCH] shippable.yml: Remove jobs duplicated on Gitlab-CI
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210108145103.269353-1-f4bug@amsat.org>
 <28635389-fbe2-89eb-5ec6-5fdc1da98c6a@redhat.com>
 <20210108152121.GK1082385@redhat.com>
 <9c0ecc6b-0f37-2a0b-d4b9-299ba52099d3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e9e8be43-21e8-e483-a0f1-9370fc935bed@amsat.org>
Date: Sun, 10 Jan 2021 12:00:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <9c0ecc6b-0f37-2a0b-d4b9-299ba52099d3@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.255,
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/8/21 4:36 PM, Paolo Bonzini wrote:
> On 08/01/21 16:21, Daniel P. Berrangé wrote:
>> On Fri, Jan 08, 2021 at 04:14:30PM +0100, Paolo Bonzini wrote:
...
>>>
>>> The debian-mips-cross/mips-softmmu pair (and also mipsel-softmmu) is
>>> currently excluded by Gitlab's cross-mips-system, is there a reason for
>>> that?  If we add it there, we can just remove shippable altogether.

Can we get this cleaned one step at a time? :)

>> Some softmmu targets were disable to keep the build time under control.
>>
>> We could enable a different subset of targets for each cross host arch,
>> so that overall we get representative coverage of the full set.
> 
> Right, but at least KVM targets ought to be included in their own cross
> host.
> 
> Paolo
> 

