Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D974133E1
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 15:15:01 +0200 (CEST)
Received: from localhost ([::1]:59014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSfbw-0006ft-6C
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 09:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mSfZy-000587-Na
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 09:12:58 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mSfZw-00037f-V4
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 09:12:58 -0400
Received: by mail-wr1-x42a.google.com with SMTP id q26so38996439wrc.7
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 06:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P8266PFHnW2T7lXnUwtuxqe/FB4BDNIDttZGp4EB/k0=;
 b=Q8q/a044sSt8GMy21+sHwacTS+PBNE+PbbTHWSYSxaqhC/A/kM0SQx8auoGw5yJR4f
 fl9wp5J1DnYsGetBE0YY8QAQsA3E0dXn5DtUgFc+VKxaSUdGyhMbD8kUNnrlFezwGQMW
 AWoQ5EG4jHy70KtJ8Gg3MAMcg/iAO6cuwVAr9A/ToiEsdZLpvJ0e0p/49aT95oi/4W1a
 q/9BbYIPkE+fpntNHB5eyTuEjsTu7CGSC6Pz+NJfL0SZ0i/Ptcn/THXTudwduHBGxkQ2
 Ke5Rp7TO8CJ3bDn8tgLHHt20MGPvq9KjooqqD1QiO19XZ2zP3763m0GFfK3JwlkB+NLX
 KR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P8266PFHnW2T7lXnUwtuxqe/FB4BDNIDttZGp4EB/k0=;
 b=NB4fcMzgpqGgWIbpnEYma5KPQ7AOnshCcmcu5TUrsKKWBGGDnETPBw8d9SpNf1MvRG
 jzDCTHeNopN9hMaNaMmmAD6JCmOIPhrLQn5eLY2WluU+5ZqF5VOY6ybFIwnS3tQXqeXb
 XtRA6w98pTh3JZNVvBuAecVeA8FspcLXxRK38VLB1UtnJ1UfLi+wBZZzZP7cp/VTWFO9
 VIYnHQdl6Aly29KXWWa78UKPcwF5EmnM4Fr7PDOkrdEtIZn/h36Ca0vj7krmlvdsPeGg
 1nwtHao0wBdvKiXhIJgKESRkUwdmUpzEYSOHdjvoy1WDGTGu9+nErUptj7VAp/4MEJo0
 YfVg==
X-Gm-Message-State: AOAM5336k8oKPKnR15K6/6FOrJe9r2H0L/LoZxfQEKWKJA+RVhV2fA0q
 t5I82AY5OaZPDrujUhNGst6Nn0GAmqE=
X-Google-Smtp-Source: ABdhPJzes52GD1qQ6rwx7nAljzpNXN4zn6i8eudLz259UW8j99NMlzxe6ikw05VB+vagJ14GCcTcOw==
X-Received: by 2002:a5d:5408:: with SMTP id g8mr35354778wrv.34.1632229975166; 
 Tue, 21 Sep 2021 06:12:55 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id y1sm3114683wmq.43.2021.09.21.06.12.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 06:12:54 -0700 (PDT)
Subject: Re: [PULL 0/3] Update meson version
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210918093140.5797-1-pbonzini@redhat.com>
 <CAFEAcA_07d87j7y1qnBeTuoKQw=9=fY0Ci=6ky=XxBQbuEqDnw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1b872fec-dcaf-16e2-abc7-cd5d639407f8@redhat.com>
Date: Tue, 21 Sep 2021 15:12:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_07d87j7y1qnBeTuoKQw=9=fY0Ci=6ky=XxBQbuEqDnw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/09/21 14:40, Peter Maydell wrote:
> Is there anything that can be done to make meson version bumps
> not a horrific pain to back out ? This seems to go wrong pretty
> much every time.

Downgrading works fine in 0.58 and newer releases, but the fix is not in 
0.55.x.  The reason why it goes wrong every time is that we've never 
updated past a version that has the fix.

What were the issues?

Paolo

