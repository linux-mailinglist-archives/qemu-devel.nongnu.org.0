Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A132048BAB1
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 23:21:49 +0100 (CET)
Received: from localhost ([::1]:46636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7PWW-0005aC-Hl
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 17:21:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7PV4-0004mK-Pd
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 17:20:19 -0500
Received: from [2607:f8b0:4864:20::62d] (port=34691
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7PV1-0004DT-Ip
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 17:20:17 -0500
Received: by mail-pl1-x62d.google.com with SMTP id x15so1041585plg.1
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 14:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RCGcwHl0F+kHzrNBybwZ6bUGdfpLrgacgK1eoW8ILv4=;
 b=FbzG5SHZ5p6fA3rP8VKWKYyG5ChgaVMLQASXn/a7fDWY1aOv9ZzKXmV2cjnNU3KL0q
 Ne44LRE/vL/pdiqYJ6/DNPR/DrgJUX4v/OZIAG51XgS/mJmxEmvaxsDoarYhB5+Rcpbn
 jy7SH7uPZYWy3cKBe1OI6qDsv+8B+Q/Wb1VYEihBATkxrhiFjoXIaYdn9rh6Ex4mwV/1
 Tb9EoeK9AdWFS9cjkrGJSJebPvsp4D9f6bomKYkXOM8ZUfvYDMb161GnEZkG3ahGZTq/
 GzGSlWqTJfAW+c/LJVL1SU3WmmpN0qLI/cyfIkOddWZSkTUUhxXKIl4cTM5U5qwwIeWn
 816g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RCGcwHl0F+kHzrNBybwZ6bUGdfpLrgacgK1eoW8ILv4=;
 b=4RNmyfn6yIW8t2bLeu7x5l/VEiHIK8PGXZrzn4nkg8zZ4p5B49IvegEFti45ukFCeG
 m7wbHoBlOsrIWeGDbqBL2D7zCFluAeSS8m7TvQLWOliv7lTtp+BJ8+iz7dGR+kmkLZOE
 b4+gqiw7g5scPYr5KMWlTRFBtfSYe/IuBCj1tx9dnZ+yT7jWdkczdBG8lFYQ9uSGA9Gp
 Ulp+xRAbz/BaG8P/1ToG+lsgvTB2BRYSGKhxZEcbSSDrtQ08LGZU0tL2OtpNP0myM8PE
 hPhAsu2oC53ChrqaXJVqi3mRIdPkjamxC6EJj98karP2CNr29JiHlV8AFMCzHySmt9Qx
 sIXQ==
X-Gm-Message-State: AOAM530ODs59WEVjrrN/a3vywH2F6osQhM5vKLtj/h4uO0TlvXmRreyH
 0PVdL0bjPBXovIFh+4F9ZF0=
X-Google-Smtp-Source: ABdhPJzsJ9EeC+5i/edAjLTZ1E1l60xM7wIGeH1jWLXyy7MeNx4S5DqoL5rwfFFbICMqpLO/yXuieA==
X-Received: by 2002:a17:903:11c5:b0:149:a8cf:37da with SMTP id
 q5-20020a17090311c500b00149a8cf37damr6633501plh.132.1641939613425; 
 Tue, 11 Jan 2022 14:20:13 -0800 (PST)
Received: from [192.168.1.33] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id l12sm11786700pfc.181.2022.01.11.14.20.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 14:20:13 -0800 (PST)
Message-ID: <f841c735-9f72-adcf-00e2-6366511dee52@amsat.org>
Date: Tue, 11 Jan 2022 23:20:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH 2/4] tests/qtest: Improve endianness-test to work with
 missing machines and devices
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>
References: <20211220081054.151515-1-thuth@redhat.com>
 <20211220081054.151515-3-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211220081054.151515-3-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/12/21 09:10, Thomas Huth wrote:
> The users might have built QEMU with less machines or without the
> i82378 superio device. Add some checks to the endianess-test so that
> it is able to deal with such stripped down QEMU versions, too.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qtest/endianness-test.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)

The i82378 should work regardless the guest endianess...

