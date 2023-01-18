Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E03D671FD7
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 15:40:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI9aF-0008Gl-Su; Wed, 18 Jan 2023 09:38:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI9aC-0008FM-2O
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 09:38:32 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI9aA-0003Ao-AD
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 09:38:31 -0500
Received: by mail-wm1-x336.google.com with SMTP id q8so13031265wmo.5
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 06:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K9hKW2CTGa3hwn7HpewvSvokaof1vm4zecNB85boLpw=;
 b=KDbpYjUSyQEdszYg8e0SRAgvNaqHY8QY+QgZGHOhUKgtzRvjoWBOG0GGrNTMfJ1zGD
 v+6ltoOcrHeRWcAbfchisE3V6O9QFwO0K2V4c2T05k6TXXx13xTGwno1PHsByGG75Y2M
 dAvM+6D9sz58g2kEuK3tvkVmsz2OdAnU+JxXsobRC66K6RQrxN+2J3/jPg7cFWY7qk5q
 EfYRQzA8axyoLQ7wKEhcVEQFRDp+mZZq8C06mQc1+vnxzVprX3gW+huBVj/Ene8IpBPC
 gmXaImhetjmvjY4Oe8NqNNOIFwqz6zmHvWKMUFncUKG5iROJJkP350stv4KbsUd+TNyd
 oTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K9hKW2CTGa3hwn7HpewvSvokaof1vm4zecNB85boLpw=;
 b=vUbF3SfOkZfQOgedcrS1Ct+jIcXCnr9nt6az9C3Ju3aWlUvVEvWQVCIj9cKfMIQUeD
 CGX2kgAdN3njKxpF8baKni8lh5F9HApiGD8geJAki5HT4sI2NOxPcZiwM9RCYD7Ulhds
 z2uAofZ1FeJpumxNyUMYaFLnGSnO10nsDipzib2o5vlbAfhQMZSSb/vyyS6ViUy3KwVu
 fHgdZpDz6mr+nPoeIxXWWQMpqFi7iMhU3GXLBIkBUnBax9hduRmgX02ik/snkM1AyX0u
 PhxEBrCU/KK7rlS5nYA86s4KGgXD90Hfz8EMMt545z1HxDx3qdC1CcGtXwcnSBKzjlhG
 rc1g==
X-Gm-Message-State: AFqh2kpkzp1WzWKKMzvbHGtLFpm/c4yC1uw6nR1SL8nMBpzImxlRPn0K
 Wicv1t7thQpm3vAfafkiiHrfzA==
X-Google-Smtp-Source: AMrXdXuCVfu1SWUBkGnadsnBN5SRPJajXWkpWAnkNfuPgKy9QSGXGP7MZGMGPZ3jrUQCc7x7VarA1A==
X-Received: by 2002:a05:600c:4e08:b0:3db:1a41:663a with SMTP id
 b8-20020a05600c4e0800b003db1a41663amr938986wmq.20.1674052704591; 
 Wed, 18 Jan 2023 06:38:24 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s4-20020a05600c384400b003d9862ec435sm2153558wmr.20.2023.01.18.06.38.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 06:38:23 -0800 (PST)
Message-ID: <ac3c4293-bce3-2438-8ba4-f5879b944c00@linaro.org>
Date: Wed, 18 Jan 2023 15:38:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] tests/qtest/bios-tables-test: Make the test less verbose
 by default
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>
References: <20230118125132.1694469-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230118125132.1694469-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 18/1/23 13:51, Thomas Huth wrote:
> We are facing the issues that our test logs in the gitlab CI are
> too big (and thus cut off). The bios-tables-test is one of the few
> qtests that prints many lines of output by default when running with
> V=1, so it contributes to this problem. Almost all other qtests are
> silent with V=1 and only print debug messages with V=2 and higher.
> Thus let's change the bios-tables-test to behave more like the
> other tests and only print the debug messages with V=2 (or higher).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   See also this discussion here:
>   https://lore.kernel.org/qemu-devel/Y8Z8CJoFyxB9uHqU@redhat.com/
> 
>   tests/qtest/bios-tables-test.c | 17 ++++++++++++-----
>   1 file changed, 12 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


