Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE67A652E22
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 09:56:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7uty-000517-Lo; Wed, 21 Dec 2022 03:56:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7utu-00050N-G4
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 03:56:34 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7utr-0007YL-Fm
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 03:56:34 -0500
Received: by mail-wr1-x430.google.com with SMTP id w15so14199035wrl.9
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 00:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Npl64NZ7zj2m5Rp4/K9p8EnRzpB7sFNDlDwZf7nAdZQ=;
 b=w3nXMFwbZixGQzu0ra18OSTqu0d0bNW9+luYpCMEgogFpsDSELwFv8ylnr1ZEGPqm0
 t3Zr/o1EIR+wu12+xkVguUHMD1hZinjYue79ct0a68pIiP3/4nx/Pxtp5Ct72XjAdZHU
 GicFjtVqO+9CvuR0Q1OdrYxKcAsV/wmFCWDqnWM6NW5v/w6cewmRB+uzG68vGJhyoFAn
 db2bvOdiT8S9ygyrb64sdbBJmSHQU5TXlxU06/Uckn08nfetcJjxIG4iRdwDkjx7nxPV
 cRoCzkgmlzqNpvRH2O3dukuJMKCeoMi3wSewhsyB1W55KkcAGI7bbpeCWMa6YWobska3
 OS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Npl64NZ7zj2m5Rp4/K9p8EnRzpB7sFNDlDwZf7nAdZQ=;
 b=tEOvKID/nxptGLPWMuEbQCVDavo7GTZa1i0pFEfQnAC9CCYSKcGIQq19cA2DvtJsQt
 QLn9wHHxy6zqi6yB6mjDFhj5fXc7Ur4f9Vop+I3WKydanXjI9po7qEexKuxRouz9ZJig
 n1VbkB71UR6jgXYgYd/16biNuxTUaDLA0OkGMXCsHHa43rG7HcqQ9JlmrLwvCeE9NgrJ
 hyH0kJzM+xmCsTNnS+MDJq+i1nzkwMb/hHpXL6R9XWIimqAcnlJuBAGFIbz80EqHaBCR
 +17bAmb3c9epql/+s+Tqkb8DWvik/IKYc1XeZUZkpfTFXaP4KKdBSw8olDKFou0A0rQN
 KUcA==
X-Gm-Message-State: AFqh2kq3ZSrUPXEWYGWAeYye2NMIPynmMtmV+fF2N6sm36YeyJIVNqZN
 5f1JVy+ADPkZzRuAu9cwizIhPw==
X-Google-Smtp-Source: AMrXdXtRfrNgLZFr1rS8eHe5ryF/Uu9tI9lRL3Bh/PKA+E6ykk2/Obw5HphqlorIZrH2XNTh0mHMDQ==
X-Received: by 2002:a5d:51cc:0:b0:242:457e:1a70 with SMTP id
 n12-20020a5d51cc000000b00242457e1a70mr632920wrv.12.1671612990149; 
 Wed, 21 Dec 2022 00:56:30 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 co22-20020a0560000a1600b00241fab5a296sm14734550wrb.40.2022.12.21.00.56.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 00:56:29 -0800 (PST)
Message-ID: <cc46da80-8a39-14a7-96db-10a7f13cb9c3@linaro.org>
Date: Wed, 21 Dec 2022 09:56:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [[PATCH]--edit 6/6] gitlab-ci: Disable docs and GUIs for the
 build-tci and build-tcg-disabled jobs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20221221074252.1962896-1-alex.bennee@linaro.org>
 <20221221074252.1962896-7-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221221074252.1962896-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
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

On 21/12/22 08:42, Alex Bennée wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> These jobs use their own "script:" section and thus do not profit from
> the global "--disable-docs" from the template. While we're at it, disable
> also some GUI front ends here since we do not gain any additional test
> coverage by compiling those here again.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20221208135945.99975-1-thuth@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/buildtest.yml | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


