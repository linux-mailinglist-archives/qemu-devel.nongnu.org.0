Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CD441EDE2
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 14:53:48 +0200 (CEST)
Received: from localhost ([::1]:39000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWI2t-0001sQ-9c
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 08:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWI0E-0007ts-24
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 08:51:02 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWI0C-0001u5-A3
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 08:51:01 -0400
Received: by mail-wr1-x433.google.com with SMTP id v25so4707557wra.2
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 05:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CjUiIcTXAqFtECtkq4MVbhhQ7h1/BrSQdcA+rYHuUmM=;
 b=E+V2XbN9MtgIty9MBkf9xDwF6P2Xa/FunrTeJhXih4id7uoEQk4UXsHepIV99P9S0o
 v+YiIVn1Bxn5hHKFPYU2LFQG0fiaGeHuIDo6WMaLkpoPFxcExEMMaUfSrAGFdc1Hlppo
 s/QgnS7YzAxPb7agysnGEhuCj3bGFjMJi3/37fhfc5PdMNwixAoc4+XU9ICrhacJrH30
 7JVrmwPQp1x3ih/y9m2FiAOTP7Y4j4HDX17Me92bB19RZPd70stWcFjucWgopDexwZbs
 wiabEmPXCp94L9x/GGRb6sMkog1mywCJ4KvPboedVbUayJp8w7DBZg9FXpeam0DNHy6m
 7gEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CjUiIcTXAqFtECtkq4MVbhhQ7h1/BrSQdcA+rYHuUmM=;
 b=EoxujnkwIBmVZpqmWPceYAywhEL0P6WSKQVRLzhENr2COm4163XU+q4JPjfBzHp2kV
 vJiZM4koWoIGvYIQH9wS+ldFAzYkzf7QuiCE6IFPRLwhKxvu/H5sRZF1JLvWs/enrWQt
 uD6XZEWn0haryx4hD4gGp4imWonjAgUaKRJ7D1IHNnIdPTF4A6pIT3yW2z68csxqconQ
 RuED5uFOff0URObaOXHmGPzgd1AztE0n7X3X11t78q0SmkRVhCdQvw86Q10lBIP1NusU
 ZdzfkWXt4nxH2kqI+aONT6eqUUfPhVmk46h7VqPK/doZmrD+0kkf6pUpbSE6GCF4tq/D
 upkw==
X-Gm-Message-State: AOAM530fJ2GtGMVVG0cs7n/ZLGOMe5qi+ys+Oj+qg7QLyVYm6xdCbthy
 sy3HyxU03xboiBbvDjzvdXr4mYqVrT8=
X-Google-Smtp-Source: ABdhPJyOgXfu4D3DpkD86woE2MJTFPM6TKBgjLymyTlTmOIZqGCxhnyeHuHN5QfK6m1vRm1wa8BltQ==
X-Received: by 2002:adf:b353:: with SMTP id k19mr12244449wrd.325.1633092658766; 
 Fri, 01 Oct 2021 05:50:58 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id f17sm6157467wru.69.2021.10.01.05.50.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 05:50:58 -0700 (PDT)
Message-ID: <f7b6a481-a4fd-0de3-6486-878608c18757@amsat.org>
Date: Fri, 1 Oct 2021 14:50:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: Moving QEMU downloads to GitLab Releases?
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <YVW+ZGmIs+repvj4@stefanha-x1.localdomain>
 <CAJSP0QUq46nOTAv=4V0mhT2ZNbfKBPJXLNLY5Jun5B_h=sedQw@mail.gmail.com>
 <26661c01-e7ae-e225-7ec4-2e915b7a6ac5@redhat.com>
 <20211001103416.zquwneah34iv3mmz@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211001103416.zquwneah34iv3mmz@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.127,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Berrange <berrange@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 michael.roth@amd.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/1/21 12:34, Gerd Hoffmann wrote:>> Maybe we should also discuss
again whether we could decrease the size of the
>> release tarballs. Someone recently mentioned that we could e.g. remove the
>> edk2 sources from the tarballs - edk2 is licensed under a BSD-style license,
>> so we are not forced to ship its sources in our tarballs (unlike the other
>> firmwares which are licensed under GPL).
>>
>> Or maybe we could also finally move the firmware images completely into a
>> separate tarball instead?
> 
> The idea of a separate qemu-firmware repo is floating around for a
> while already but never really took off.
> 
> Now with hosting moved to gitlab we should be able to run automated
> firmware binary builds in CI and purge all firmware from the qemu git
> repo (both submodules and binaries) and add a script fetching those
> from gitlab instead.

We already have some firmware jobs which might be used as template:

.gitlab-ci.d/edk2.yml
.gitlab-ci.d/opensbi.yml

