Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3FA5286F7
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 16:29:01 +0200 (CEST)
Received: from localhost ([::1]:43224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqbiV-00027n-VX
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 10:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqbgd-0000mj-CV
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:27:03 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:39660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqbgb-0004ec-NA
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:27:03 -0400
Received: by mail-ed1-x536.google.com with SMTP id m12so3089492edb.6
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 07:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rbJ441f0cOL8yJ+8mIZ7aDctKbXGy2TkFbXmkKYxohs=;
 b=gSolcTgzkQn7lDGVue+eY01bCw3Ub80suemQqhQYqwqnS9B4q41NHLEZT+td8rCdZA
 ZSL0BUhCNM2K6kqCSsjbvWDkPVgqiaziDSGNgRSCnFu1OQE3+wivG8HrQtbHrgHxaqlq
 jw4KcZohwsArnA50nuY+jNF+l01AaiLZL3SVIda3/pKI19ca/X/gYYju3V+s3MswpvXS
 xPl4Z0DQFvajTZiRYLY0GesIWxyFJvAGgyDqbHpuXoNO8q5O0RlneqzRMUTiw0/pRdm3
 1lUXDVGzNYRHCzbSxW1bGAKUgnUG6rHpZMrhYsmmwn1+0uthQTZqKbTOaaxqK+Zq0F7q
 gxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rbJ441f0cOL8yJ+8mIZ7aDctKbXGy2TkFbXmkKYxohs=;
 b=1tSwt9iPrzD0gshDUQZ1OM2c+ZqBgyPjs0yjJcBUNeLfNgQ3p3kbPq6QD/rxgJMKdd
 hGxXzvWxPAhwVr00TWCZfL4nsMc1amAvYZbH8OZrNtcQRjfXrVXTmgr+9Ruva4X1cJ/e
 xl5Mu9FK6V//GtfSMSfF8NEsNnTR06OhHHPozXaCrpRGnTR1W3svdQRZqHC7jvwh942u
 Q8JmZT0m51NDfdQOxIiDS8AHKckcPudT0syNpNR79SBRtvRmUx+8Z9rTrsVapoOBhyx5
 qgAm1Tl66k1W+nS9HYacEb/5AoqDygh8AbnFS0NRru73k212BLEfLCBihD3kb8+D9Vvs
 wchg==
X-Gm-Message-State: AOAM5337bgKkM7A/E6rkM/qKYoZI3HQgJg5PX3r95r3+e0qVaR0cLOJ7
 LgPJtXWjv1o8t38eV50XspQ=
X-Google-Smtp-Source: ABdhPJzko8Q5DY1oOxjDRtM2KdPQ29FCrzuyEN77I6IdOxja4Hu0wJvz2UBWeTNEC/YTjlW2teMkhw==
X-Received: by 2002:a05:6402:d0a:b0:421:10e6:2ecc with SMTP id
 eb10-20020a0564020d0a00b0042110e62eccmr13631538edb.329.1652711220176; 
 Mon, 16 May 2022 07:27:00 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 j27-20020a170906535b00b006f3ef214da9sm3829359ejo.15.2022.05.16.07.26.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 07:26:59 -0700 (PDT)
Message-ID: <ac0d95d7-446b-caf9-3775-f156a5999fab@redhat.com>
Date: Mon, 16 May 2022 16:26:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Getting rid of the last bits of QEMU's 'ad-hoc CI' for merges
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <CAFEAcA_SSJ9BBryV0iuXi1G30e6HoMeuNbSpKDh4_+y2oxTLJw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA_SSJ9BBryV0iuXi1G30e6HoMeuNbSpKDh4_+y2oxTLJw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/16/22 14:43, Peter Maydell wrote:
> For the BSDs, the ad-hoc CI is just running the tests/vm
> "make vm-build-netbsd" etc. Is there some way we can get
> coverage of this into the gitlab CI setup? (I think we
> have FreeBSD via Cirrus CI, so I have not listed that one.)

We have vm-build-netbsd and vm-build-openbsd in Cirrus CI as well. 
However they are disabled by default due to the limit on the # of jobs 
in unpaid plans; some jobs will time out if you exceed the limit, 
because they are placed on a waiting list.

Paolo

