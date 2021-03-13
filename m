Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CB8339DBC
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 12:20:45 +0100 (CET)
Received: from localhost ([::1]:60522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL2K4-0002Ii-CJ
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 06:20:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL2J7-0001tm-6o
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 06:19:45 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:56246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL2J5-00043w-Hr
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 06:19:44 -0500
Received: by mail-wm1-x334.google.com with SMTP id 12so252868wmf.5
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 03:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bbgth++vJ8l04DOT5z3sbn1vpIxwEq1nsKeu6PCElrw=;
 b=SHfkWy4pyryOvyDLsTBo3RJvo8I9hUDY+hwz6dJthGmpAe6sLL+Cbo+Gn1w/tzCbvf
 x2roU7uO3x5qfLE/Z7vwWuzAf5XUKez/D+cIzQPLJYFXGNNIf2TxeLP2PZhRzGfhcV9P
 PBu5fgfjlZBt0D/a2h4sjv3ZFewsRH/ak3GFOT5WEf9GvDnVqWkgARsEeARVwIGGcQW+
 MlgczksEssLsVK0NMvayClQk1E76eg8GWdUr3RYBng253suKdUmeeLNaQNh4qTUcIMp+
 70fXBTqbQlMiGg0aKV0XjoTd3BjX1bCb373C9y9APMRbDzixWWjJ++ascah2NZD08pJS
 4ROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bbgth++vJ8l04DOT5z3sbn1vpIxwEq1nsKeu6PCElrw=;
 b=Cl+nK+AgO2se4IIFXlE9MbsiEbPVIxapNetAgQrqGm5dWgVVkanokyi7aprfwV3h+h
 79P9CH4L17TikRqnmw7/O+3SQb35tehleiNnOERk+GzyaOj9335zQ/p/RydfIBYVJRU+
 XoqR/kEXFTNu5Bpml+GAvBLvVwlpm2CmlnhLBHdgmcP+TUDk9EMAEDYAsf7PIFnwm3II
 No89vwqn1hCFK9AAmu+yba3N+AO8bfUuTDCz683KHq0MbfjuyDcjrUZoNqQG06z8lvzb
 7ZjyxukNH1+Zgr29wazzEzOPsA/0XXgZ9Z/YhstYYtfKOhzFWUoV8QdEHMSRt9ifzB86
 QhQQ==
X-Gm-Message-State: AOAM532Acs/OgZocDnYzbxWnZtnBEdq9PXz8l3WWk92acs2UAomuM6sG
 Y2uFI35UCJFf28SKOjsTpVI=
X-Google-Smtp-Source: ABdhPJwfdBd5deAfvisEPJfT5JBT5exF9tE3iFw3ymc8Ugfpjq6iYXHAbUdVvmBb/vzg2qyOge9wAA==
X-Received: by 2002:a7b:c195:: with SMTP id y21mr17325998wmi.178.1615634366000; 
 Sat, 13 Mar 2021 03:19:26 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id n186sm6012222wmn.22.2021.03.13.03.19.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 03:19:25 -0800 (PST)
Subject: Re: gitlab outage?
To: Brian Cain <bcain@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <SN6PR02MB4205EC1BAA236F9A8E34E605B86F9@SN6PR02MB4205.namprd02.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <216b5cca-e599-a7cb-aca5-1595e644477d@amsat.org>
Date: Sat, 13 Mar 2021 12:19:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <SN6PR02MB4205EC1BAA236F9A8E34E605B86F9@SN6PR02MB4205.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/21 12:59 AM, Brian Cain wrote:
> https://gitlab.com/qemu-project/ <https://gitlab.com/qemu-project/> asks
> for sign in and if I do sign in, I get a 404.  Is this expected?

Confirmed:

$ git clone https://gitlab.com/qemu-project/qemu.git
Cloning into 'qemu'...
Username for 'https://gitlab.com':

Certainly not expected.

> https://status.gitlab.com/ <https://status.gitlab.com/> describes
> “shared runner degradation” but that doesn’t sound like this problem.

Indeed.

