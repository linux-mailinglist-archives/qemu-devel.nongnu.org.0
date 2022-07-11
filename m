Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F885572756
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 22:34:24 +0200 (CEST)
Received: from localhost ([::1]:44400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBMaN-0007dA-EU
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 16:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMUU-0004uD-HI
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:28:19 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMUR-0004nk-8B
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:28:17 -0400
Received: by mail-wr1-x435.google.com with SMTP id h17so12798346wrx.0
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 13:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=y1nx8HiZfwVh11MMgNf6Ys/H3ZIl7zBF2ayNXglVOOc=;
 b=Ny68BufCDX5T8R45Ri4tubpCVzNOGlioxSm955gtkSxX87nnVq3RmpXw7r4rf9vBdI
 7Ee71D3Yj+BPX4jq/vzGQa3QUoD7sFLyhNPY3+nR3gJkveBFW1a7lI4DFfO+xQcjg34M
 JYquINbmopQWB8YPMWINtYgBGg17HWtstGm+NpJL6CufxD1zjTJLY2gh5wX8DWdRMtCU
 pSYUm/HAqExABeWLwGTklZKZT8BnEpYG5FxjylNp21JUJgghHSN7/nPCI/2RF2Mfc3qB
 Gg7WmdGY2VgxnB3JayAEQAO8N6giRPtdsauI6G66N1106RjHpzlkacrdeQKxAo0fqCwf
 BZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=y1nx8HiZfwVh11MMgNf6Ys/H3ZIl7zBF2ayNXglVOOc=;
 b=7eQM7Vgtk2Q13DttF/MS/5NPeFkEmTKqQ60AwcS/JCjeERblSGXlSr7gx497WgdDhZ
 TK+EH5w+t/yKgDtdU/3eYoSe8p1EYAh0Ap7FfCtajXo8ha7PAwYd75B+MV/9OD/fI8jm
 g57xZKI20wZI4mQMIsUkISEPsXsNhXT6fQFLduT7QlYnN6QGlbqHtKeBnWjqkszLKd0y
 vdJ0o0pOqf/ZylMzxQRUTqZ2C2ZKEiz23EM6/x6LStpprz5r+HtNcsi7Gqv26L4xpei5
 CAmN5YX4ftj7bq8ccGDSnK4NYMIftZQQ+hAkzxiu5RbmcViuG5rvIUy4OnA8psj5Gipz
 QztQ==
X-Gm-Message-State: AJIora95DlUMm0lKNqBg7I4DAnYCfsI7865Tm01OdzWGrLS0QQE1/l2r
 gfoOp8CiQev/PM3ktoKR5jKHB5y1JPiQeHcv
X-Google-Smtp-Source: AGRyM1vLar3W85Qekkfkq1d4Cgu1tURq9kMha4vvoK6OY88rZ3Ioy3G0kjFE/c1pT80VwqUOu0SuiQ==
X-Received: by 2002:a05:6000:15ce:b0:21d:b177:a8f0 with SMTP id
 y14-20020a05600015ce00b0021db177a8f0mr5699564wry.370.1657657693422; 
 Tue, 12 Jul 2022 13:28:13 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 az11-20020a05600c600b00b003a2ebb087fbsm77732wmb.0.2022.07.12.13.28.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 13:28:12 -0700 (PDT)
Message-ID: <f1f5b6a6-1885-6abb-ec57-da76515f8bab@amsat.org>
Date: Mon, 11 Jul 2022 18:21:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v3 9/9] tests/style: check qemu/osdep.h is NOT included in
 all .h/.c.inc files
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20220707163720.1421716-1-berrange@redhat.com>
 <20220707163720.1421716-10-berrange@redhat.com>
In-Reply-To: <20220707163720.1421716-10-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 7/7/22 18:37, Daniel P. Berrangé wrote:
> Since the qemu/osdep.h file must be included as the very first header
> in all C source files, there is no reason to include it in .h or .c.in
> files.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/style.yml | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


