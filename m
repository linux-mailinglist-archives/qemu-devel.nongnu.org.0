Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D59C49C1B5
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 04:07:05 +0100 (CET)
Received: from localhost ([::1]:51250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCYeG-0006Fa-Dp
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 22:07:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nCYXQ-0000GG-Cn; Tue, 25 Jan 2022 22:00:00 -0500
Received: from [2607:f8b0:4864:20::42b] (port=42581
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nCYXO-00050e-QP; Tue, 25 Jan 2022 22:00:00 -0500
Received: by mail-pf1-x42b.google.com with SMTP id i65so21478886pfc.9;
 Tue, 25 Jan 2022 18:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=wZYQgSQwR0DSDv/sJ4O4TGIxqP5GJY9/3ixuUwUGhn0=;
 b=TvggB3adE6DUp0kV1sOId+8onPGD2eSY3/vbTY47ZRXjTPtfooRY2EJm9TRk0DVg/7
 n8ghV+rXf8ccqXsKCXOjft743gzXnll8j28c6DhJ/5ypZowRueXluxZTVnCoHn8uN0eT
 a/tWL1WkRrRuBU2ltiA1lOmRfABmM2DeA/4p1KPoELMkxp1F8oaAsG1DAO3Fk9s6oiyK
 7cVgRS3SQPezCoNOzltgWXkCSVE6dYK6tbpaQpIT7/sSnABwMSmqYRcYJ/pQ1VLPoRot
 4sixo2fIf3UMFPxBbUWrfM+X0uHYT574Lxg/ji1ncLaHj0y4ehnfUyipsTSB+JkZgIpE
 1CyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=wZYQgSQwR0DSDv/sJ4O4TGIxqP5GJY9/3ixuUwUGhn0=;
 b=1EVO/M5T9cTCHOzYQA0/Xs3ze9BqtGEZG3DADyxw2aKBmrZz4G3MKh771c1fZe06LG
 1dDmHTsRFtjeiOvfKtLOScRy8FX8aZz/CCY6AL3+sUvvd7FE5y+x8ZJYdiKeMBRQRUCd
 wEyQupWNgQMHkdFF6jhB5zG3/IBrx8H+54tgzus4EA6O9TlS7K0n9qvdNOjx4kJbjtjd
 PXE/fWPI5p5r9Qj8cdfSPlfMz4MZ8u5ZJXMrGa/g27kt0+fSa9nJaB12qHL/pcw7lERv
 7jdnr+8BiRkSU80quTVSR+2MEM+HfeQ9OTxPeOXZr6Gc/VVP4lPbfNQCmMLTxgLdTpat
 O56Q==
X-Gm-Message-State: AOAM531VmeZrraysvIraY1GwyoNJmCrlHqTitFmttwaD3/b8Nv83WqyE
 ZLQ9L9sKf/qfl9QK/r9FRZM=
X-Google-Smtp-Source: ABdhPJxlp9U27CGgBQCVoAFQloJyQYQiQHr3Pyx3YZwyM/Kif4N0dkCMBOm9tsHxutBkaV2yfZCKfA==
X-Received: by 2002:a63:2c93:: with SMTP id
 s141mr17277224pgs.337.1643165996441; 
 Tue, 25 Jan 2022 18:59:56 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id h12sm15907093pgh.79.2022.01.25.18.59.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 18:59:55 -0800 (PST)
Message-ID: <1e98b4ec-3476-387c-9dda-99a13121e22f@amsat.org>
Date: Wed, 26 Jan 2022 03:59:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: Raspberry Pi?
Content-Language: en-US
To: Kenneth Adam Miller <kennethadammiller@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAK7rcp9pFFvYnvwgX_9ganFsc8V5+c7keofM7PPSY3Fp82J15w@mail.gmail.com>
Cc: qemu-arm@nongnu.org
In-Reply-To: <CAK7rcp9pFFvYnvwgX_9ganFsc8V5+c7keofM7PPSY3Fp82J15w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Hi,

On 26/1/22 00:59, Kenneth Adam Miller wrote:
> Hello all,
> 
> I would like to emulate something on a pi so that I don't have to pay as 
> high of a translation penalty since the guest and host will share the 
> same arch. I'm finding that on some forums that people have been having 
> trouble getting QEMU to run on raspberry pi. The posts are kind of old, 
> in 2019.
> 
> Does anyone know if this has been addressed since then?

What you asks is if you can run an Aarch64 guest (virt machine?) on a
Raspi4 host, is that right? IIRC it should work straight away using
"-machine virt,gic-version=host". Cc'ing qemu-arm@ list to verify.

Regards,

Phil.

