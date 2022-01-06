Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDE6485F92
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 05:13:33 +0100 (CET)
Received: from localhost ([::1]:58330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5K9c-0002zF-L4
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 23:13:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5K84-0002KA-Fq
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 23:11:56 -0500
Received: from [2607:f8b0:4864:20::630] (port=34498
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5K7z-0002WP-A3
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 23:11:56 -0500
Received: by mail-pl1-x630.google.com with SMTP id x15so1654808plg.1
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 20:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uNhrhRhtl+SrE3MXJdAXRnN+eVUU2AnRRD1it2rSHRA=;
 b=E5Hqs1zBcZmsj5gNi7aSt1nlEC8VJFgwlrsOmkNdV3qbW2SklUNpgJaBYa/eQ8DCCS
 U7Ilso1g4q6gC3p4ca6Vf3C30GCjjUV5sOecQ5iRcP1RMgDrGa6O7l5+tYeo0HdZbEnv
 RIXk83XN1mqT7UY0jyHUu1fcOZaOv0VIv03eyQGpNf+EZaHxEbvmDERC3j4HJND7gNTS
 ++miS5rwDGnI8NliOqxUpBLJspVBJpG3jdsjmKuFBtMMvWN7EEZLeWphYEZMwL1jTonw
 RGIsBcBEQ8/ejtTwyTauiUXv9yDf5uj7+QP/O/fGCqmjySf1E9s87uoHwNo953PZmSmA
 l4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uNhrhRhtl+SrE3MXJdAXRnN+eVUU2AnRRD1it2rSHRA=;
 b=J0LJc0DqMkha40WtfY4v5Z1kZcsF6hl4LArRT/9XqdyET/jGx0prHpJI1Y2zPiKvN9
 aXc3JpUC9RwGpoW9b+aCIvxw37ozqbq+1O8UqfVvLb1OoaAwPSRVmqZweCW/A2QEF2SA
 3Xs8J8SOyxjEi42qRWnj3O4SdLc2deDBlmZhr/fG/nZJSAVdOZtlm7dw12zsv3MvNCON
 039OMnKHriERklX3pnSSU4r1Sbkho/FaBg6n6O7+DzKlYdjuWuSC2SlgyfPiYbnvH7ba
 3Zn0jZYo/HgcJNtgz3wKPpr3orW4z0Wiws2txfVu21lHRdgTyYwVMLJFi4KeXpo0d4J5
 mOTQ==
X-Gm-Message-State: AOAM532YbxuANWXq+J7VmF5mjLwp+LjZ4knpLRJE5Y/Vqwb2G2WWebxS
 laUWaXfcToKxycS2KJjdqbJurw==
X-Google-Smtp-Source: ABdhPJxbgj2FJb/xJaALCAeinqw3aLFszi+m3BAdL/CqBMVXGGSSAOVQ7sUdV52+bLAxiASk/lWsLQ==
X-Received: by 2002:a17:90b:1950:: with SMTP id
 nk16mr7872877pjb.129.1641442309593; 
 Wed, 05 Jan 2022 20:11:49 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id d13sm564508pfj.135.2022.01.05.20.11.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 20:11:49 -0800 (PST)
Subject: Re: [PATCH] meson.build: Print gtk version in the summary info
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220105190804.649316-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ac9319dd-d64a-0c12-d378-740642b57b48@linaro.org>
Date: Wed, 5 Jan 2022 20:11:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220105190804.649316-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.057,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/22 11:08 AM, Thomas Huth wrote:
> The "gtk" variable is re-declared as "dependencies: [gtk, gtkx11]",
> so there is just a "YES" in the summary info if gtk has been found.
> Let's use the info from the library detection instead so that the
> library version is printed in the summary instead.
> 
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   meson.build | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

