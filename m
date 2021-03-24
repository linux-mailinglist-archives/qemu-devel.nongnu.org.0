Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CF5347FFB
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:06:12 +0100 (CET)
Received: from localhost ([::1]:47410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP7tS-0001fb-Tf
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP7oj-0000Cc-T8
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:01:17 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP7oi-0003Cl-B6
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:01:17 -0400
Received: by mail-wr1-x42d.google.com with SMTP id b9so25387707wrt.8
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=8MHJcOXEpo8sLixvaAv45G7g8pAsLcYp2dfKDFqXEhE=;
 b=s+NVj9P5gMvx3+UDqO3N0C4Oy4Gkp/0cnwnkwgi//PFH6mVVhPt95Mz1utnzVxTwGY
 leHgY3mpKsk0TG8rkdImqY43AuIOmu67iJ5We+tgaXIgxidY3GPVZotx3Gs1k1DkeVbM
 Yf0nIOAvsEgVgWdkhqfOj8VRc9eDiXx1NorcLnVyQkOR2CSGk9JBxnovSSlgPu9oRqfL
 pOrS52b1UMrnsHvhxXyjqmCdRH/3MYMDYKnh71K8hvKXunDa2y34uEJgEK1vSVvdWAGz
 5rJR2vgtBN41/jeiUi+0HgTtgpqOAudgmqyPRCjfWWV8R/B051/zgxrEzq9jpb/hUvp+
 uTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:from:subject:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=8MHJcOXEpo8sLixvaAv45G7g8pAsLcYp2dfKDFqXEhE=;
 b=FgkqZX04UG7sbDAYOaqaB8If0wedrDUNj4F6gppPIZvJB82nrpBncoDR2RHquM9C8l
 iaqGCXPA/YD8VdJDQfyFLGpawjXAVxxqc07sKeNechtmNiArf/DsRs/b9+Vv+nEo1TXo
 RjBm3SOXPPA0+t9aAJ6QarDg6g/qHbSXaKhKoYzsmRUPAgN9BdZOaAmOhSw1A6e8GXk4
 cPvOpDXJFdZLlk5sXBjGIc+vGhliwG6Li2prAJ1IqNBe4tKr3dGWrfsOAs5F9wef3wWE
 kfIJbZPkRwDGaaeJR7L7f/fUwdg50u3pnlgAqClcRArivZXKHW/56E/g1c+jilDd2SKS
 h79Q==
X-Gm-Message-State: AOAM533sDGByHVche1vI5bd7JhThvDsEGFoI4uOYn7qETS01qbbyzg/d
 g2kj94ZZoVlpGBPXHfBoQ1j6hXJBjvo8ZA==
X-Google-Smtp-Source: ABdhPJywuQc1ZOeQpe5Bhc8E4/c6l4LEBWBdFPDraDPzBFCG0rGYM42j+eAsnXbkQtmE6NHaBo1BdQ==
X-Received: by 2002:adf:e5cd:: with SMTP id a13mr4371848wrn.65.1616608873976; 
 Wed, 24 Mar 2021 11:01:13 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u9sm3235083wmc.38.2021.03.24.11.01.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 11:01:13 -0700 (PDT)
To: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Subject: gitlab-ci: Only build /staging branch?
Message-ID: <2da69b21-ce5e-cae2-68ef-d6e042563a3a@amsat.org>
Date: Wed, 24 Mar 2021 19:01:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Peter's current workflow is push to /staging and if his
testing succeeds, he pushes the same commit as /master.

IMO there is no point in building /master branch, as it
has already been built earlier as /staging.

Regards,

Phil.

