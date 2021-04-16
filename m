Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8382236278F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 20:15:24 +0200 (CEST)
Received: from localhost ([::1]:57838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXSzz-0001bD-J0
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 14:15:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXSYC-0002rj-Sm; Fri, 16 Apr 2021 13:46:40 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXSYA-0003aQ-WE; Fri, 16 Apr 2021 13:46:40 -0400
Received: by mail-wr1-x42f.google.com with SMTP id h4so18428725wrt.12;
 Fri, 16 Apr 2021 10:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MrOc6ZehVCG/YLPBwV+Pro29+HUpOQe0K9Z4xnhhdTM=;
 b=lDh8c3GjtMaLHgtqvJiv65HJGrwIkUAjC1G+nm8PWI3tvllnIWzsBWAjZ9MPZwVlF+
 dfxue5Pt72pkrIzimIGbwBM8rP9YSYMKmNo3Xi+HPA34A8fk9fh2zD/xFr/nHTFagD7I
 cZDdzYXxvfuaILhsPJ1pvmJoOw3LYOi3VEDKhWZwtKnM9Rl0bl6gVD9tPRfGD5KqkkkP
 Sd2Gh0AtgKV8EMAOwu75sC7BtG35SUE8GkEwvY/rSlLvh1pVQzP9Xn4h0ndr9qnagOSn
 RmMmxyAZfR5d/9DBHzwnJy8cb34jx5HXxaHbj2Z7ax7J+tPwuWFDiyEqao+HtE4g0VO1
 n2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MrOc6ZehVCG/YLPBwV+Pro29+HUpOQe0K9Z4xnhhdTM=;
 b=X0+Ku78uRkLpOgDE+tIonsqDwtjh+Ae9aOTK6J6cCpSlaC62fX/Dap/JapTXgyztan
 279FLOKDMDkgS+vyjjRZVTmbaWld5oMIBfqusJfvzhkZbxsXZw+JrBz6ORBlx7WDMF99
 NMXCulhBh5/ZJwazhgAqviDjcbGR4f1rkmk2D3AGRRrZfe6KEWWyqivZRkMp2VXlJrrU
 7xHhn517yNxCsYGFIGN9YXLjIimSE93aBA3jugJ53lo+6hVLO2Y2IkN83gA4nOWcuCHq
 jzfmAaRhBJTLjiqWlNWcTy+QyCAZKtPhyhb6u9vRvatjwqbYyJOXs4GciWwoAidxHuPN
 w1Tg==
X-Gm-Message-State: AOAM531+gsnwb6FF0xrK1H3j5l9fAATk63xDNV7mkHhHqpcuIgmufZzM
 Ti+gVcOu16YhBBJFmCBXt8g=
X-Google-Smtp-Source: ABdhPJzJfaSvo454J15YBup0dvYAZv3NqeBmZE6td9DvlyCWQbLk/YrkIqRUhCrpkleFjpHHKW9IZQ==
X-Received: by 2002:a05:6000:154e:: with SMTP id
 14mr401782wry.24.1618595196883; 
 Fri, 16 Apr 2021 10:46:36 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id l14sm385943wrv.94.2021.04.16.10.46.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 10:46:36 -0700 (PDT)
Subject: Re: [PATCH 3/8] tests/acceptance/linux_ssh_mips_malta.py: drop
 identical setUp
To: Cleber Rosa <crosa@redhat.com>
References: <20210415215141.1865467-1-crosa@redhat.com>
 <20210415215141.1865467-4-crosa@redhat.com>
 <229a10ef-b912-2191-c670-a2c74a0870a4@amsat.org>
 <20210416154356.GB1914548@amachine.somewhere>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <15232a34-9cc1-a9cb-3261-ee61d53976d1@amsat.org>
Date: Fri, 16 Apr 2021 19:46:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210416154356.GB1914548@amachine.somewhere>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/16/21 5:43 PM, Cleber Rosa wrote:
> On Fri, Apr 16, 2021 at 07:26:05AM +0200, Philippe Mathieu-Daudé wrote:
>> On 4/15/21 11:51 PM, Cleber Rosa wrote:
>>> These tests' setUp do not do anything beyong what their base class do.
>>> And while they do decorate the setUp() we can decorate the classes
>>> instead, so no functionality is lost here.
>>
>> This is what I did first when adding this test, but it was not working,
>> so I had to duplicate it to each method. Did something change so now
>> this is possible?
>>
> 
> It did, but quite a while ago:
> 
>   https://avocado-framework.readthedocs.io/en/87.0/releases/76_0.html#users-test-writers

OK, the test is older. Do you mind adding a comment?

"Since Avocado 76.0 we can decorate setUp() directly, ..."

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> It could have been updated much earlier, but, better late than never.

Sure :)

Thanks,

Phil.

